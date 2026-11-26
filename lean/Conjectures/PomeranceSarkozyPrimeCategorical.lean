module
public import Mathlib

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {A : Type*}

def bernoulliAtoms (H : ℕ) (b : ℚ) (S : Finset A) : ℚ :=
  b^S.card*(1-b)^(H-S.card)

def categoricalAtoms (H : ℕ) (b : ℚ) (S : Finset A) : ℚ :=
  if S.card=0 then 1-(H:ℚ)*b else if S.card=1 then b else 0

theorem one_sub_mul_le_one_sub_pow (b : ℚ) (_hb : 0≤b) (hb₁ : b≤1) (n : ℕ) :
    1-(n:ℚ)*b ≤ (1-b)^n := by
  induction n with
  | zero => simp
  | succ n ih =>
    have h := mul_le_mul_of_nonneg_right ih (sub_nonneg.mpr hb₁)
    rw [pow_succ,Nat.cast_succ]
    have hp : 0≤(n:ℚ)*b^2 := by positivity
    nlinarith

theorem bernoulliAtoms_sum (I : Finset A) (b : ℚ) :
    (∑ S ∈ I.powerset,bernoulliAtoms I.card b S)=1 := by
  unfold bernoulliAtoms
  rw [Finset.sum_pow_mul_eq_add_pow]
  simp

theorem categoricalAtoms_sum (I : Finset A) (b : ℚ) :
    (∑ S ∈ I.powerset,categoricalAtoms I.card b S)=1 := by
  classical
  unfold categoricalAtoms
  have hsplit (S : Finset A) :
      (if S.card=0 then 1-(I.card:ℚ)*b else if S.card=1 then b else 0) =
        (if S.card=0 then 1-(I.card:ℚ)*b else 0)+(if S.card=1 then b else 0) := by
    by_cases h : S.card=0 <;> simp_all
  simp_rw [hsplit]
  rw [Finset.sum_add_distrib,← Finset.sum_filter,← Finset.sum_filter,
    ← Finset.powersetCard_eq_filter,← Finset.powersetCard_eq_filter,
    Finset.powersetCard_zero,Finset.sum_singleton,Finset.sum_const,Finset.card_powersetCard,
    Nat.choose_one_right,nsmul_eq_mul]
  ring

/-- A one-prime categorical law is within H(H-1)b² in total
variation of the independent Bernoulli law on the same coordinates. -/
theorem categorical_bernoulli_l1 (I : Finset A) (b : ℚ)
    (hb : 0≤b) (hb₁ : b≤1) :
    (∑ S ∈ I.powerset, |categoricalAtoms I.card b S-bernoulliAtoms I.card b S|) ≤
      2*(I.card:ℚ)*((I.card-1:ℕ):ℚ)*b^2 := by
  classical
  let d (S : Finset A) := categoricalAtoms I.card b S-bernoulliAtoms I.card b S
  have hsum : (∑ S ∈ I.powerset,d S)=0 := by
    simp [d,Finset.sum_sub_distrib,categoricalAtoms_sum,bernoulliAtoms_sum]
  have hnonpos (S : Finset A) (h : S.card≠1) : d S≤0 := by
    unfold d categoricalAtoms bernoulliAtoms
    by_cases h₀ : S.card=0
    · simpa [h₀,sub_nonpos] using one_sub_mul_le_one_sub_pow b hb hb₁ I.card
    · rw [ite_eq_right h₀,ite_eq_right h]
      have hh : 0≤b^S.card*(1-b)^(I.card-S.card) :=
        mul_nonneg (pow_nonneg hb _) (pow_nonneg (sub_nonneg.mpr hb₁) _)
      linarith
  have hsingle (S : Finset A) (h : S.card=1) : 0≤d S := by
    unfold d categoricalAtoms bernoulliAtoms
    simp [h]
    have hp : (1-b)^(I.card-1)≤1 :=
      pow_le_one₀ (sub_nonneg.mpr hb₁) (by linarith)
    nlinarith [mul_le_mul_of_nonneg_left hp hb]
  have habs (S : Finset A) : |d S|=2*(if S.card=1 then d S else 0)-d S := by
    by_cases h : S.card=1
    · rw [ite_eq_left h,abs_of_nonneg (hsingle S h)]; ring
    · rw [ite_eq_right h,abs_of_nonpos (hnonpos S h)]; ring
  change (∑ S ∈ I.powerset,|d S|) ≤ _
  simp_rw [habs]
  rw [Finset.sum_sub_distrib,← Finset.mul_sum,hsum,sub_zero,← Finset.sum_filter,
    ← Finset.powersetCard_eq_filter]
  have hsingle' : (∑ S ∈ I.powersetCard 1,d S) =
      (I.card:ℚ)*(b-b*(1-b)^(I.card-1)) := by
    trans ∑ _S ∈ I.powersetCard 1,(b-b*(1-b)^(I.card-1))
    · apply Finset.sum_congr rfl
      intro S hS
      have hc := (Finset.mem_powersetCard.mp hS).2
      simp only [d,categoricalAtoms,bernoulliAtoms,hc,one_ne_zero,ite_false,ite_true,pow_one]
    · simp [Finset.card_powersetCard,nsmul_eq_mul]; ring
  rw [hsingle']
  have he := mul_le_mul_of_nonneg_left (one_sub_mul_le_one_sub_pow b hb hb₁ (I.card-1)) hb
  have hh : b-b*(1-b)^(I.card-1)≤((I.card-1:ℕ):ℚ)*b^2 := by nlinarith
  simpa [mul_assoc] using mul_le_mul_of_nonneg_left hh (show 0≤2*(I.card:ℚ) by positivity)

end PomeranceSarkozy
