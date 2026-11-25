import Conjectures.HartkeMatchingExcessExtremal
import Conjectures.HartkeMatchingExcessDivision
import Mathlib.Order.Filter.AtTopBot.Tendsto
import Mathlib.Analysis.Real.Sqrt

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The two actual graph witnesses, the Mersenne-division estimate, and the
attained extremal constant prove Conjecture 9.15 in its full tail-minimum
form. The quantitative square-root bound is the bound recorded by Cinna
Davis in the existing entry, commit a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7.
-/

namespace HartkeMatchingExcess

open Filter

theorem binaryLength_le_matchingExcess (p : ℕ) (hp : 2 ≤ p) :
    binaryLength (p - 1) ≤
      (2 * (matchingExcess p).toNat + 1) * ((matchingExcess p).toNat + 1) := by
  have hpos : 0 < p - 1 := by omega
  have hC : ((matchingExcess p).toNat : ℤ) = matchingExcess p :=
    Int.toNat_of_nonneg (matchingExcess_nonneg p (by omega))
  have hb := binaryWeight_le_matchingExcess (p - 1)
  rw [Nat.sub_add_cancel (by omega : 1 ≤ p)] at hb
  have hw := binaryWeight_pos hpos
  have hd := deletedWeight_le_matchingExcess (p - 1) (binaryWeight (p - 1) + 1) (by omega)
  rw [Nat.sub_add_cancel (by omega : 1 ≤ p)] at hd
  apply binaryLength_le_excess_bound hpos
  · have hi : (binaryWeight (p - 1) : ℤ) ≤ ((matchingExcess p).toNat : ℤ) := by omega
    exact_mod_cast hi
  · have hi : (binaryWeight ((p - 1) / (2 ^ (binaryWeight (p - 1) + 1) - 1)) : ℤ) ≤
        ((matchingExcess p).toNat : ℤ) + 1 := by omega
    exact_mod_cast hi

/-- The explicit estimate in the recorded proof, for every `p ≥ 2`. -/
theorem matchingExcess_sqrt_lower_bound (p : ℕ) (hp : 2 ≤ p) :
    (Real.sqrt (8 * (binaryLength (p - 1) : ℝ) + 1) - 3) / 4 ≤
      (matchingExcess p : ℝ) := by
  have hN := binaryLength_le_matchingExcess p hp
  have hi : (binaryLength (p - 1) : ℤ) ≤
      (2 * ((matchingExcess p).toNat : ℤ) + 1) *
        (((matchingExcess p).toNat : ℤ) + 1) := by exact_mod_cast hN
  rw [Int.toNat_of_nonneg (matchingExcess_nonneg p (by omega))] at hi
  have hr : (binaryLength (p - 1) : ℝ) ≤
      (2 * (matchingExcess p : ℝ) + 1) * ((matchingExcess p : ℝ) + 1) := by
    exact_mod_cast hi
  have hc : 0 ≤ (matchingExcess p : ℝ) := by
    exact_mod_cast matchingExcess_nonneg p (by omega)
  have hs : Real.sqrt (8 * (binaryLength (p - 1) : ℝ) + 1) ≤
      4 * (matchingExcess p : ℝ) + 3 := by
    apply Real.sqrt_le_iff.mpr
    constructor
    · linarith
    · nlinarith
  linarith

/-- A uniform explicit cutoff for any prescribed integer excess bound. -/
def excessCutoff (B : ℕ) : ℕ := 2 ^ ((2 * B + 1) * (B + 1)) + 1

theorem excessCutoff_pos (B : ℕ) : 0 < excessCutoff B := by
  exact Nat.zero_lt_succ _

theorem matchingExcess_gt_of_large (B p : ℕ) (hp : excessCutoff B ≤ p) :
    (B : ℤ) < matchingExcess p := by
  have hpow : 0 < (2 : ℕ) ^ ((2 * B + 1) * (B + 1)) := pow_pos (by omega) _
  have hpos : 0 < p - 1 := by unfold excessCutoff at hp; omega
  by_contra h
  have hle : matchingExcess p ≤ (B : ℤ) := le_of_not_gt h
  have hb := binaryWeight_le_matchingExcess (p - 1)
  rw [Nat.sub_add_cancel (by omega : 1 ≤ p)] at hb
  have hw := binaryWeight_pos hpos
  have hd := deletedWeight_le_matchingExcess (p - 1) (binaryWeight (p - 1) + 1) (by omega)
  rw [Nat.sub_add_cancel (by omega : 1 ≤ p)] at hd
  have hb' : binaryWeight (p - 1) ≤ B := by exact_mod_cast hb.trans hle
  have hd' : binaryWeight ((p - 1) / (2 ^ (binaryWeight (p - 1) + 1) - 1)) ≤ B + 1 := by
    have hi : (binaryWeight ((p - 1) / (2 ^ (binaryWeight (p - 1) + 1) - 1)) : ℤ) ≤
        (B : ℤ) + 1 := by omega
    exact_mod_cast hi
  have hsmall := input_lt_of_excess_bounds hpos hb' hd'
  unfold excessCutoff at hp
  omega

theorem matchingExcess_tendsto : Tendsto matchingExcess atTop atTop := by
  apply tendsto_atTop_atTop.mpr
  intro b
  refine ⟨excessCutoff b.toNat, fun p hp => ?_⟩
  have h := matchingExcess_gt_of_large b.toNat p hp
  omega

/-- The source's tail set `{c_q : q ≥ p}`. -/
def tailValues (p : ℕ) : Set ℤ := matchingExcess '' {q : ℕ | p ≤ q}

/-- The tail minimum `m_p` in Conjecture 9.15. -/
noncomputable def tailMinimum (p : ℕ) : ℤ := sInf (tailValues p)

theorem tailValues_nonempty (p : ℕ) : (tailValues p).Nonempty :=
  ⟨matchingExcess p, p, by change p ≤ p; exact le_rfl, rfl⟩

theorem tailValues_bddBelow (p : ℕ) (hp : 0 < p) : BddBelow (tailValues p) := by
  refine ⟨0, ?_⟩
  rintro c ⟨q, hq, rfl⟩
  change p ≤ q at hq
  exact matchingExcess_nonneg q (by omega)

theorem tailMinimum_attained (p : ℕ) (hp : 0 < p) :
    ∃ q : ℕ, p ≤ q ∧ matchingExcess q = tailMinimum p :=
  Int.csInf_mem (tailValues_nonempty p) (tailValues_bddBelow p hp)

theorem tailMinimum_le (p q : ℕ) (hp : 0 < p) (hq : p ≤ q) :
    tailMinimum p ≤ matchingExcess q :=
  csInf_le (tailValues_bddBelow p hp) ⟨q, hq, rfl⟩

theorem tailMinimum_gt_of_large (B p : ℕ) (hp : excessCutoff B ≤ p) :
    (B : ℤ) < tailMinimum p := by
  obtain ⟨q, hq, he⟩ := tailMinimum_attained p ((excessCutoff_pos B).trans_le hp)
  rw [← he]
  exact matchingExcess_gt_of_large B q (hp.trans hq)

/-- Full source-matched Conjecture 9.15: the minimum of the eventual
matching-excess constants over every tail tends to positive infinity. -/
theorem conjecture_9_15 : Tendsto tailMinimum atTop atTop := by
  apply tendsto_atTop_atTop.mpr
  intro b
  refine ⟨excessCutoff b.toNat, fun p hp => ?_⟩
  have h := tailMinimum_gt_of_large b.toNat p hp
  omega

end HartkeMatchingExcess
