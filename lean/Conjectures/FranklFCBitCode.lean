module

public import Conjectures.FranklBasic
public import Init.Data.Nat.Bitwise.Lemmas
public import Mathlib.Tactic.Tauto
public import Lean.Elab.Tactic.Omega

@[expose] public section

/-! Natural-number bit masks are an exact finite encoding of the subsets
of an initial interval. The proof applies to every interval size. -/

namespace Frankl.FC.BitCode

def domain (n : ℕ) : Finset ℕ := Finset.range (2 ^ n)

def decode (n a : ℕ) : Finset ℕ :=
  (Finset.range n).filter (fun i => a.testBit i = true)

@[simp] theorem mem_decode {n a i : ℕ} :
    i ∈ decode n a ↔ i < n ∧ a.testBit i = true := by
  simp [decode]

theorem decode_subset (n a : ℕ) : decode n a ⊆ Finset.range n :=
  Finset.filter_subset _ _

theorem decode_or (n a b : ℕ) :
    decode n (a ||| b) = decode n a ∪ decode n b := by
  ext i
  simp only [mem_decode, Finset.mem_union, Nat.testBit_or, Bool.or_eq_true_iff]
  tauto

theorem or_mem_domain {n a b : ℕ} (ha : a ∈ domain n) (hb : b ∈ domain n) :
    a ||| b ∈ domain n :=
  Finset.mem_range.mpr (Nat.or_lt_two_pow (Finset.mem_range.mp ha)
    (Finset.mem_range.mp hb))

theorem decode_injOn (n : ℕ) : Set.InjOn (decode n) (domain n) := by
  intro a ha b hb hab
  have ha' : a < 2 ^ n := Finset.mem_range.mp ha
  have hb' : b < 2 ^ n := Finset.mem_range.mp hb
  apply Nat.eq_of_testBit_eq
  intro i
  by_cases hi : i < n
  · have hm : i ∈ decode n a ↔ i ∈ decode n b := by rw [hab]
    have ht : a.testBit i = true ↔ b.testBit i = true := by
      simpa only [mem_decode, hi, true_and] using hm
    exact Bool.eq_iff_iff.mpr ht
  · have hpow : 2 ^ n ≤ 2 ^ i := Nat.pow_le_pow_right (by decide) (by omega)
    rw [Nat.testBit_lt_two_pow (ha'.trans_le hpow),
      Nat.testBit_lt_two_pow (hb'.trans_le hpow)]

theorem image_domain (n : ℕ) :
    (domain n).image (decode n) = (Finset.range n).powerset := by
  apply Finset.eq_of_subset_of_card_le
  · intro S hS
    obtain ⟨a, _, rfl⟩ := Finset.mem_image.mp hS
    exact Finset.mem_powerset.mpr (decode_subset n a)
  · rw [Finset.card_image_of_injOn (decode_injOn n)]
    simp [domain]

end Frankl.FC.BitCode
