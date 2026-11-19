import Conjectures.LonelinessModularCoverTape
import Mathlib.Data.Nat.BitIndices
import Mathlib.Data.Nat.Bitwise

/-! Natural-number bit masks for the finite support checker. All operations
are related to finite-set operations before the numerical adapter is used.
The kernel checks natural-number arithmetic; no native execution result is
used as a proof premise. -/

namespace Loneliness.Modular.SupportSearch.Bits

open scoped BigOperators

def decode (mask : ℕ) : Finset ℕ := mask.bitIndices.toFinset

@[simp] theorem mem_decode {i mask : ℕ} : i∈decode mask ↔ mask.testBit i=true := by
  simp [decode]

@[simp] theorem decode_zero : decode 0=∅ := by simp [decode]

@[simp] theorem decode_singleton (a : ℕ) : decode (2^a)={a} := by
  simp [decode]

theorem decode_and (a b : ℕ) : decode (a &&& b)=decode a ∩ decode b := by
  ext i
  simp [Nat.testBit_and]

theorem decode_or (a b : ℕ) : decode (a ||| b)=decode a ∪ decode b := by
  ext i
  simp [Nat.testBit_or]

theorem decode_ldiff (a b : ℕ) : decode (Nat.ldiff a b)=decode a \ decode b := by
  ext i
  simp [Nat.testBit_ldiff]

@[simp] theorem card_decode (mask : ℕ) : (decode mask).card=mask.bitIndices.length :=
  List.toFinset_card_of_nodup Nat.bitIndices_nodup

theorem decode_eq_empty_iff (mask : ℕ) : decode mask=∅ ↔ mask=0 := by
  constructor
  · intro h
    have hlen : mask.bitIndices.length=0 := by rw [←card_decode,h]; rfl
    have hl : mask.bitIndices=[] := List.length_eq_zero_iff.mp hlen
    have hs := Nat.sum_map_two_pow_bitIndices mask
    rw [hl] at hs
    simpa using hs.symm
  · rintro rfl
    exact decode_zero

def erase (mask a : ℕ) : ℕ := Nat.ldiff mask (2^a)

theorem decode_erase (mask a : ℕ) : decode (erase mask a)=(decode mask).erase a := by
  rw [erase,decode_ldiff,decode_singleton]
  ext i
  simp

def insertBit (mask a : ℕ) : ℕ := mask ||| 2^a

theorem decode_insert (mask a : ℕ) : decode (insertBit mask a)=insert a (decode mask) := by
  rw [insertBit,decode_or,decode_singleton]
  simp

def after (compatible : ℕ → ℕ) (available a : ℕ) : ℕ :=
  erase available a &&& compatible a

theorem decode_after (compatible : ℕ → ℕ) (available a : ℕ) :
    decode (after compatible available a) =
      afterChoice (fun i j => (compatible i).testBit j) (decode available) a := by
  rw [after,decode_and,decode_erase]
  ext b
  simp [afterChoice]

def capacity (cover : ℕ → ℕ) (available uncovered slots threshold : ℕ) : ℕ :=
  slots*threshold +
    (available.bitIndices.map (fun a => (uncovered &&& cover a).bitIndices.length-threshold)).sum

theorem capacity_eq (cover : ℕ → ℕ) (available uncovered slots threshold : ℕ) :
    capacity cover available uncovered slots threshold =
      SupportSearch.capacity (fun a => decode (cover a))
        (decode available) (decode uncovered) slots threshold := by
  have hf : (fun a => gain (fun b => decode (cover b)) (decode uncovered) a-threshold) =
      (fun a => (uncovered &&& cover a).bitIndices.length-threshold) := by
    funext a
    rw [gain,←decode_and,card_decode]
  rw [SupportSearch.capacity]
  change capacity cover available uncovered slots threshold = slots*threshold+
    ∑ a∈available.bitIndices.toFinset,
      (gain (fun b => decode (cover b)) (decode uncovered) a-threshold)
  rw [List.sum_toFinset _ Nat.bitIndices_nodup,hf]
  rfl

def check (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool) :
    SupportSearch.Tree → ℕ → ℕ → ℕ → ℕ → Bool
  | .reject, _, _, _, _ => false
  | .retained index, selected, available, _, slots =>
      decide (slots=0 ∨ available=0) && terminal (decode selected) index
  | .witness t, _, available, uncovered, _ =>
      decide (uncovered.testBit t=true ∧
        ∀ a∈available.bitIndices, (cover a).testBit t=false)
  | .capacity threshold, _, available, uncovered, slots =>
      decide (capacity cover available uncovered slots threshold < uncovered.bitIndices.length)
  | .incompatible a b, selected, _, _, _ =>
      decide (selected.testBit a=true ∧ selected.testBit b=true ∧ a≠b ∧
        (compatible a).testBit b=false)
  | .split a without withCandidate, selected, available, uncovered, slots =>
      decide (available.testBit a=true ∧ 0<slots) &&
        (check cover compatible terminal without selected (erase available a) uncovered slots &&
          check cover compatible terminal withCandidate (insertBit selected a)
            (after compatible available a) (Nat.ldiff uncovered (cover a)) (slots-1))

theorem check_eq (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (tree : SupportSearch.Tree) :
    ∀ selected available uncovered slots,
      check cover compatible terminal tree selected available uncovered slots =
        SupportSearch.check (fun a => decode (cover a))
          (fun a b => (compatible a).testBit b) terminal tree
          (decode selected) (decode available) (decode uncovered) slots := by
  induction tree with
  | reject => intros; rfl
  | retained index =>
    intro selected available uncovered slots
    simp only [check,SupportSearch.check,decode_eq_empty_iff]
  | witness t =>
    intro selected available uncovered slots
    simp only [check,SupportSearch.check,mem_decode,decode,List.mem_toFinset,
      Nat.mem_bitIndices,Bool.not_eq_true]
  | capacity threshold =>
    intro selected available uncovered slots
    rw [check,SupportSearch.check,capacity_eq,card_decode]
  | incompatible a b =>
    intro selected available uncovered slots
    simp only [check,SupportSearch.check,mem_decode]
  | split a without withCandidate ihwithout ihwith =>
    intro selected available uncovered slots
    simp only [check,SupportSearch.check,mem_decode,ihwithout,ihwith,
      decode_erase,decode_insert,decode_after,decode_ldiff]

def tapeCheck (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → Bool
  | 0, _, _, _, _, _ => false
  | fuel+1, index, selected, available, uncovered, slots =>
      match lookup index with
      | .leaf certificate => check cover compatible terminal certificate
          selected available uncovered slots
      | .split a without withCandidate =>
          decide (available.testBit a=true ∧ 0<slots) &&
            (tapeCheck cover compatible terminal lookup fuel without
                selected (erase available a) uncovered slots &&
              tapeCheck cover compatible terminal lookup fuel withCandidate
                (insertBit selected a) (after compatible available a)
                (Nat.ldiff uncovered (cover a)) (slots-1))

theorem tapeCheck_eq (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (fuel index selected available uncovered slots : ℕ) :
    tapeCheck cover compatible terminal lookup fuel index selected available uncovered slots =
      check cover compatible terminal (Tape.toTree lookup fuel index)
        selected available uncovered slots := by
  induction fuel generalizing index selected available uncovered slots with
  | zero => rfl
  | succ fuel ih =>
    cases hn : lookup index <;>
      simp only [tapeCheck,Tape.toTree,hn,check,ih]

theorem checked_tape (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (conclusion : Finset ℕ → Prop)
    (hterminal : ∀ s index, terminal s index=true → conclusion s)
    (lookup : ℕ → Tape.Node) (fuel index selected available uncovered slots : ℕ)
    (hcheck : tapeCheck cover compatible terminal lookup fuel index
      selected available uncovered slots=true) :
    Chunks.StateSound (fun a => decode (cover a)) (fun a b => (compatible a).testBit b)
      conclusion ⟨decode selected,decode available,decode uncovered,slots⟩ := by
  rw [tapeCheck_eq,check_eq] at hcheck
  exact SupportSearch.check_sound _ _ terminal conclusion hterminal
    (Tape.toTree lookup fuel index) _ _ _ _ hcheck

def exampleCoverMask : ℕ → ℕ
  | 1 => 1
  | 2 => 2
  | _ => 0

theorem example_checked :
    tapeCheck exampleCoverMask (fun _ => 6) exampleTerminal Tape.exampleLookup 3 0
      0 6 3 2=true := by
  decide +kernel

end Loneliness.Modular.SupportSearch.Bits
