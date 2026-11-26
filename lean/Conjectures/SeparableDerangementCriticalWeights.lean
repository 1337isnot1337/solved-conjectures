module

public import Conjectures.SeparableDerangementSpineRecords
public import Mathlib.Analysis.SpecificLimits.Normed
public import Mathlib.Analysis.Real.Sqrt

/-! The critical offspring weights appearing in the separable-permutation
spine argument, and their factorization on the actual ordered trees. -/

@[expose] public section

open scoped BigOperators

namespace SeparableDerangements

/-- The positive singularity of the Schröder generating function. -/
noncomputable def criticalRho : ℝ := 3 - 2 * Real.sqrt 2

/-- The value of the small Schröder generating function there. -/
noncomputable def criticalS : ℝ := 1 - 1 / Real.sqrt 2

private theorem sqrt_two_gt_one : (1 : ℝ) < Real.sqrt 2 := by
  exact (Real.lt_sqrt (by norm_num)).2 (by norm_num)

theorem criticalS_pos : 0 < criticalS := by
  unfold criticalS
  exact sub_pos.mpr ((div_lt_iff₀ (sqrt_two_gt_one.trans' zero_lt_one)).2
    (by simpa only [one_mul] using sqrt_two_gt_one))

theorem criticalS_lt_one : criticalS < 1 := by
  unfold criticalS
  exact sub_lt_self _ (div_pos zero_lt_one (sqrt_two_gt_one.trans' zero_lt_one))

theorem criticalRho_pos : 0 < criticalRho := by
  have hs := Real.sq_sqrt (x := 2) (by norm_num)
  have h : criticalRho = (Real.sqrt 2 - 1) ^ 2 := by
    unfold criticalRho
    nlinarith only [hs]
  rw [h]
  exact sq_pos_of_ne_zero (sub_pos.mpr sqrt_two_gt_one).ne'

theorem criticalS_complement_sq : (1 - criticalS) ^ 2 = (1 : ℝ) / 2 := by
  simp only [criticalS, sub_sub_cancel, div_pow, one_pow, Real.sq_sqrt (x := 2) (by norm_num)]

private theorem rho_div_s : criticalRho / criticalS = 2 - Real.sqrt 2 := by
  apply (div_eq_iff criticalS_pos.ne').mpr
  unfold criticalRho criticalS
  have hs := Real.sq_sqrt (x := 2) (by norm_num)
  have hne := (sqrt_two_gt_one.trans' zero_lt_one).ne'
  field_simp [hne]
  nlinarith only [hs]

private theorem s_div_complement : criticalS / (1 - criticalS) = Real.sqrt 2 - 1 := by
  apply (div_eq_iff (sub_pos.mpr criticalS_lt_one).ne').mpr
  unfold criticalS
  field_simp [(sqrt_two_gt_one.trans' zero_lt_one).ne']
  ring

/-- The exact offspring weight at a given number of children. -/
noncomputable def criticalOffspring : ℕ → ℝ
  | 0 => criticalRho / criticalS
  | 1 => 0
  | n + 2 => criticalS ^ (n + 1)

theorem criticalOffspring_nonneg (n : ℕ) : 0 ≤ criticalOffspring n := by
  rcases n with _ | _ | n
  · exact (div_pos criticalRho_pos criticalS_pos).le
  · exact le_rfl
  · exact pow_nonneg criticalS_pos.le _

/-- The offspring weights sum to one. -/
theorem hasSum_criticalOffspring : HasSum criticalOffspring 1 := by
  have h := (hasSum_geometric_of_lt_one criticalS_pos.le criticalS_lt_one).mul_left criticalS
  have hTail : HasSum (fun n => criticalOffspring (n + 2))
      (criticalS / (1 - criticalS)) := by
    simpa only [criticalOffspring, pow_succ', div_eq_mul_inv] using h
  have hAll := (hasSum_nat_add_iff 2).mp hTail
  have hSum : criticalS / (1 - criticalS) +
      ∑ i ∈ Finset.range 2, criticalOffspring i = 1 := by
    simp only [Finset.sum_range_succ, Finset.sum_range_zero, zero_add, criticalOffspring,
      add_zero, rho_div_s, s_div_complement]
    linarith
  exact hSum ▸ hAll

/-- The weights of the pairs consisting of a child count and a selected
    child sum to one. This is the mean-one condition for the offspring law. -/
theorem hasSum_criticalSpineArity : HasSum (fun k : ℕ => (k + 2 : ℝ) * criticalS ^ (k + 1)) 1 := by
  have hs : ‖criticalS‖ < 1 := by simpa only [Real.norm_eq_abs, abs_of_pos criticalS_pos] using
    criticalS_lt_one
  have h := ((hasSum_coe_mul_geometric_of_norm_lt_one hs).add
    ((hasSum_geometric_of_lt_one criticalS_pos.le criticalS_lt_one).mul_left 2)).mul_left criticalS
  have hValue : criticalS * (criticalS / (1 - criticalS) ^ 2 +
      2 * (1 - criticalS)⁻¹) = 1 := by
    field_simp [(sub_pos.mpr criticalS_lt_one).ne']
    nlinarith only [criticalS_complement_sq]
  rw [← hValue]
  convert h using 1
  funext k
  rw [pow_succ]
  ring

namespace SchroederTree

/-- The Boltzmann weight depends on the literal number of leaves. -/
noncomputable def boltzmannWeight (t : SchroederTree) : ℝ :=
  criticalRho ^ t.leafCount / criticalS

@[simp] theorem boltzmannWeight_leaf : leaf.boltzmannWeight = criticalOffspring 0 := by
  simp [boltzmannWeight, leafCount, criticalOffspring]

/-- Once the number of children is chosen, the tree weight factors
    into those of the independent ordered child shapes. -/
theorem boltzmannWeight_node {k : ℕ} (child : Fin (k + 2) → SchroederTree) :
    (.node k child : SchroederTree).boltzmannWeight =
      criticalOffspring (k + 2) * ∏ i, (child i).boltzmannWeight := by
  unfold boltzmannWeight criticalOffspring
  rw [Finset.prod_div_distrib, Finset.prod_pow_eq_pow_sum, Finset.prod_const,
    Finset.card_univ, Fintype.card_fin]
  change criticalRho ^ (∑ i, (child i).leafCount) / criticalS =
    criticalS ^ (k + 1) * (criticalRho ^ (∑ i, (child i).leafCount) / criticalS ^ (k + 2))
  rw [pow_succ criticalS (k + 1)]
  field_simp [criticalS_pos.ne', pow_ne_zero _ criticalS_pos.ne']

namespace SpineFrame

/-- The mass of a single specified spine step and its side subtrees. -/
noncomputable def boltzmannStepWeight (f : SpineFrame) : ℝ :=
  criticalOffspring (f.arityOffset + 2) *
    ∏ j : Fin (f.arityOffset + 2),
      if h : j = f.selected then 1 else (f.siblings j h).boltzmannWeight

/-- The offspring weight cancels the normalizing factors of all side trees. -/
theorem boltzmannStepWeight_eq (f : SpineFrame) :
    f.boltzmannStepWeight = criticalRho ^ f.sideLeaves := by
  let m (j : Fin (f.arityOffset + 2)) :=
    if h : j = f.selected then 0 else (f.siblings j h).leafCount
  let c (j : Fin (f.arityOffset + 2)) := if j = f.selected then 1 else criticalS
  have hSide (j : Fin (f.arityOffset + 2)) :
      (if h : j = f.selected then 1 else (f.siblings j h).boltzmannWeight) =
        criticalRho ^ m j / c j := by
    by_cases h : j = f.selected <;> simp [h, m, c, boltzmannWeight]
  have hDenom : (∏ j, c j) = criticalS ^ (f.arityOffset + 1) := by
    rw [← Finset.prod_erase_mul Finset.univ c (Finset.mem_univ f.selected)]
    have hf : c f.selected = 1 := by simp [c]
    rw [hf, mul_one]
    calc
      _ = ∏ _ ∈ Finset.univ.erase f.selected, criticalS := by
        apply Finset.prod_congr rfl
        intro j hj
        exact ite_eq_right (Finset.ne_of_mem_erase hj)
      _ = criticalS ^ (f.arityOffset + 1) := by
        rw [Finset.prod_const, Finset.card_erase_of_mem (Finset.mem_univ _),
          Finset.card_univ, Fintype.card_fin]
        rfl
  unfold boltzmannStepWeight
  simp_rw [hSide]
  rw [Finset.prod_div_distrib, Finset.prod_pow_eq_pow_sum, hDenom]
  change criticalS ^ (f.arityOffset + 1) * (criticalRho ^ f.sideLeaves /
    criticalS ^ (f.arityOffset + 1)) = _
  field_simp [pow_ne_zero _ criticalS_pos.ne']

end SpineFrame

namespace SpineRecord

/-- The weight of all recorded steps, before summing over records. -/
noncomputable def boltzmannPrefixWeight (r : SpineRecord) :=
  (r.map SpineFrame.boltzmannStepWeight).prod

theorem boltzmannPrefixWeight_eq (r : SpineRecord) :
    r.boltzmannPrefixWeight = criticalRho ^ r.sideLeaves := by
  induction r with
  | nil => simp [boltzmannPrefixWeight, sideLeaves]
  | cons f r ih =>
    change f.boltzmannStepWeight * boltzmannPrefixWeight r =
      criticalRho ^ (f.sideLeaves + sideLeaves r)
    rw [SpineFrame.boltzmannStepWeight_eq, ih, pow_add]

end SpineRecord

end SchroederTree

end SeparableDerangements
