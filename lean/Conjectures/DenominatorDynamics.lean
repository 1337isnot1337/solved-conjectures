import Mathlib.Data.Multiset.Filter
import Mathlib.Algebra.BigOperators.Group.Multiset.Basic
import Lean.Elab.Tactic.Omega

/-!
Exact inverse moves for ordinary Bulgarian solitaire.

A partition is represented by its multiset of positive pile sizes. Sorting is
irrelevant to the operation. The inverse-move parameter is a distinct pile
size, not an occurrence of that size. These results supply the one-step
combinatorial semantics needed by the denominator-degree enumeration. They do
not assert stabilization of the limiting orbit counts or a degree bound.
-/

namespace DenominatorDynamics

def Positive (p : Multiset ℕ) : Prop := ∀ a ∈ p, 0 < a

def decrement : ℕ → Option ℕ
  | 0 => none
  | 1 => none
  | n + 2 => some (n + 1)

def shrink (p : Multiset ℕ) : Multiset ℕ := p.filterMap decrement

def forward (p : Multiset ℕ) : Multiset ℕ := p.card ::ₘ shrink p

def reverseMove (p : Multiset ℕ) (v : ℕ) : Multiset ℕ :=
  (p.erase v).map Nat.succ + Multiset.replicate (v + 1 - p.card) 1

def LegalSize (p : Multiset ℕ) (v : ℕ) : Prop := v ∈ p ∧ p.card ≤ v + 1

theorem shrink_add (p q : Multiset ℕ) : shrink (p + q) = shrink p + shrink q := by
  simp [shrink]

theorem shrink_cons_one (p : Multiset ℕ) : shrink (1 ::ₘ p) = shrink p :=
  Multiset.filterMap_cons_none 1 p rfl

theorem shrink_ones (n : ℕ) : shrink (Multiset.replicate n 1) = 0 := by
  induction n with
  | zero => simp [shrink]
  | succ n ih => simpa only [Multiset.replicate_succ, shrink_cons_one] using ih

theorem shrink_succ (p : Multiset ℕ) (hp : Positive p) :
    shrink (p.map Nat.succ) = p := by
  induction p using Multiset.induction_on with
  | empty => simp [shrink]
  | @cons a p ih =>
    have ha : 0 < a := hp a (by simp)
    have htail : Positive p := fun b hb => hp b (by simp [hb])
    obtain ⟨a, rfl⟩ := Nat.exists_eq_succ_of_ne_zero (Nat.ne_of_gt ha)
    simpa [shrink, decrement] using congrArg (fun s => (a + 1) ::ₘ s) (ih htail)

theorem shrink_positive (p : Multiset ℕ) : Positive (shrink p) := by
  intro b hb
  obtain ⟨a, _, ha⟩ := (Multiset.mem_filterMap _ _).mp hb
  cases a with
  | zero => simp [decrement] at ha
  | succ a =>
    cases a with
    | zero => simp [decrement] at ha
    | succ a => simp [decrement] at ha; omega

theorem reverse_positive (p : Multiset ℕ) (v : ℕ) : Positive (reverseMove p v) := by
  intro a ha
  rcases Multiset.mem_add.mp ha with ha | ha
  · obtain ⟨b, _, rfl⟩ := Multiset.mem_map.mp ha
    omega
  · have := Multiset.eq_of_mem_replicate ha
    omega

theorem reverse_card (p : Multiset ℕ) (v : ℕ) (hv : LegalSize p v) :
    (reverseMove p v).card = v := by
  have hc := Multiset.card_erase_add_one hv.1
  have hl := hv.2
  simp only [reverseMove, Multiset.card_add, Multiset.card_map, Multiset.card_replicate]
  omega

theorem forward_reverse (p : Multiset ℕ) (hp : Positive p) (v : ℕ)
    (hv : LegalSize p v) : forward (reverseMove p v) = p := by
  have hpos : Positive (p.erase v) := fun a ha => hp a (Multiset.mem_of_mem_erase ha)
  rw [forward, reverse_card p v hv]
  rw [reverseMove, shrink_add, shrink_succ _ hpos, shrink_ones, add_zero]
  exact Multiset.cons_erase hv.1

theorem restore_shrink (p : Multiset ℕ) (hp : Positive p) :
    (shrink p).map Nat.succ + Multiset.replicate (p.count 1) 1 = p := by
  induction p using Multiset.induction_on with
  | empty => simp [shrink]
  | @cons a p ih =>
    have ha : 0 < a := hp a (by simp)
    have htail : Positive p := fun b hb => hp b (by simp [hb])
    have hi := ih htail
    by_cases ha1 : a = 1
    · subst a
      rw [shrink_cons_one]
      simpa [Multiset.replicate_succ] using
        congrArg (fun s => 1 ::ₘ s) hi
    · obtain ⟨b, rfl⟩ : ∃ b, a = b + 2 := ⟨a - 2, by omega⟩
      simpa [shrink, decrement, show b + 2 ≠ 1 by omega] using
        congrArg (fun s => (b + 2) ::ₘ s) hi

theorem card_shrink_add_ones (p : Multiset ℕ) (hp : Positive p) :
    (shrink p).card + p.count 1 = p.card := by
  have := congrArg Multiset.card (restore_shrink p hp)
  simpa using this

theorem sum_succ_map (p : Multiset ℕ) : (p.map Nat.succ).sum = p.sum + p.card := by
  induction p using Multiset.induction_on with
  | empty => simp
  | @cons a p ih => simp [ih, Nat.succ_eq_add_one, add_assoc, add_left_comm, add_comm]

theorem forward_preserves_mass (p : Multiset ℕ) (hp : Positive p) :
    (forward p).sum = p.sum := by
  have hs := congrArg Multiset.sum (restore_shrink p hp)
  have hc := card_shrink_add_ones p hp
  simp at hs
  simp only [forward, Multiset.sum_cons]
  omega

theorem reverse_preserves_mass (p : Multiset ℕ) (hp : Positive p) (v : ℕ)
    (hv : LegalSize p v) : (reverseMove p v).sum = p.sum := by
  have hm := forward_preserves_mass (reverseMove p v) (reverse_positive p v)
  rw [forward_reverse p hp v hv] at hm
  exact hm.symm

theorem forward_legal_size (p : Multiset ℕ) (hp : Positive p) :
    LegalSize (forward p) p.card := by
  have hc := card_shrink_add_ones p hp
  constructor
  · simp [forward]
  · simp only [forward, Multiset.card_cons]
    omega

theorem reverse_forward (p : Multiset ℕ) (hp : Positive p) :
    reverseMove (forward p) p.card = p := by
  have hc := card_shrink_add_ones p hp
  have he : p.card + 1 - ((shrink p).card + 1) = p.count 1 := by omega
  simpa only [reverseMove, forward, Multiset.erase_cons_head, Multiset.card_cons, he] using
    restore_shrink p hp

theorem inverse_move_complete (p q : Multiset ℕ) (hq : Positive q)
    (hforward : forward q = p) :
    LegalSize p q.card ∧ reverseMove p q.card = q := by
  subst p
  exact ⟨forward_legal_size q hq, reverse_forward q hq⟩

theorem distinct_sizes_distinct_preimages (p : Multiset ℕ) (v w : ℕ)
    (hv : LegalSize p v) (hw : LegalSize p w) :
    reverseMove p v = reverseMove p w ↔ v = w := by
  constructor
  · intro h
    have hc := congrArg Multiset.card h
    simpa only [reverse_card p v hv, reverse_card p w hw] using hc
  · rintro rfl
    rfl

/-- Every actual preimage has exactly one legal selected size, namely its length. -/
theorem preimage_iff (p q : Multiset ℕ) (hp : Positive p) :
    (Positive q ∧ forward q = p) ↔
      ∃ v, LegalSize p v ∧ q = reverseMove p v := by
  constructor
  · rintro ⟨hq, hf⟩
    obtain ⟨hl, hr⟩ := inverse_move_complete p q hq hf
    exact ⟨q.card, hl, hr.symm⟩
  · rintro ⟨v, hv, rfl⟩
    exact ⟨reverse_positive p v, forward_reverse p hp v hv⟩

/-- A bijection between distinct legal part sizes and all positive preimages. -/
def preimageEquiv (p : Multiset ℕ) (hp : Positive p) :
    { v : ℕ // LegalSize p v } ≃ { q : Multiset ℕ // Positive q ∧ forward q = p } where
  toFun v := ⟨reverseMove p v, reverse_positive p v, forward_reverse p hp v v.property⟩
  invFun q := ⟨q.val.card, (inverse_move_complete p q q.property.1 q.property.2).1⟩
  left_inv v := Subtype.ext (reverse_card p v v.property)
  right_inv q := Subtype.ext (inverse_move_complete p q q.property.1 q.property.2).2

end DenominatorDynamics
