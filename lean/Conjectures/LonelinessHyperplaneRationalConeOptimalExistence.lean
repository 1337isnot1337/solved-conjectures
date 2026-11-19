import Conjectures.LonelinessHyperplaneOptimalSupports
import Mathlib.Data.Set.Finite.Lemmas

/-!
# Optimal rational coefficients from a positive height

A positive linear height prevents nonzero nonnegative kernel directions.
Moving to the first vanishing coefficient reduces a dependent support without
increasing an arbitrary rational cost. The finitely many independent feasible
representations then contain a global minimum. No optimality or generic-cost
hypothesis is used to establish existence.
-/

namespace Loneliness.Hyperplane.RationalCone

open scoped BigOperators

noncomputable section

variable {ι V : Type*} [Fintype ι] [DecidableEq ι]
variable [AddCommGroup V] [Module ℚ V]

omit [DecidableEq ι] in
theorem kernel_negative_coordinate_of_positive_height
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i))
    (d : ι → ℚ) (hd : d ≠ 0) (hkernel : combination g d = 0) :
    ∃ i, d i < 0 := by
  by_contra h
  have hnonneg : ∀ i, 0 ≤ d i := fun i =>
    le_of_not_gt (fun hi => h ⟨i, hi⟩)
  have hsum : (∑ i, d i * height (g i)) = 0 := by
    simpa only [combination, map_sum, map_smul, smul_eq_mul, map_zero] using
      congrArg height hkernel
  apply hd
  funext i
  have hi : d i * height (g i) = 0 :=
    (Finset.sum_eq_zero_iff_of_nonneg
      (fun j _ => mul_nonneg (hnonneg j) (hheight j).le)).mp hsum i
        (Finset.mem_univ i)
  exact (mul_eq_zero.mp hi).resolve_right (hheight i).ne'

/-- A dependent feasible support has a feasible strict sub-support at no
larger cost. The step is the minimum of finitely many positive ratios. -/
theorem exists_nonincreasing_support_step
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i)) (c : ι → ℚ)
    (x : V) (a : ι → ℚ) (ha : Feasible g x a)
    (hdep : ¬ LinearIndepOn ℚ g (coefficientSupport a : Set ι)) :
    ∃ b : ι → ℚ, Feasible g x b ∧ cost c b ≤ cost c a ∧
      coefficientSupport b ⊂ coefficientSupport a := by
  classical
  obtain ⟨z, hz, hzsupport, hzkernel⟩ :=
    exists_supported_kernel g (coefficientSupport a) hdep
  have hdir : ∃ d : ι → ℚ, d ≠ 0 ∧ Supported (coefficientSupport a) d ∧
      combination g d = 0 ∧ cost c d ≤ 0 := by
    by_cases hcost : cost c z ≤ 0
    · exact ⟨z, hz, hzsupport, hzkernel, hcost⟩
    · refine ⟨-z, neg_ne_zero.mpr hz, ?_, ?_, ?_⟩
      · intro i hi
        simp only [Pi.neg_apply, hzsupport i hi, neg_zero]
      · simpa only [combination, Pi.neg_apply, neg_smul,
          Finset.sum_neg_distrib, hzkernel, neg_zero] using congrArg Neg.neg hzkernel
      · have hneg : cost c (-z) = -cost c z := by
          simp only [cost, Pi.neg_apply, mul_neg, Finset.sum_neg_distrib]
        rw [hneg]
        exact (neg_neg_of_pos (lt_of_not_ge hcost)).le
  obtain ⟨d, hd, hdsupport, hdkernel, hdcost⟩ := hdir
  have hapos : ∀ i, d i < 0 → 0 < a i := by
    intro i hi
    have hane : a i ≠ 0 := by
      intro hai
      have hnot : i ∉ coefficientSupport a := by
        simp only [mem_coefficientSupport, hai, ne_self_iff_false, not_false_eq_true]
      have hdi := hdsupport i hnot
      linarith
    exact lt_of_le_of_ne (ha.1 i) (Ne.symm hane)
  let J : Finset ι := Finset.univ.filter (fun i => d i < 0)
  have hJ : J.Nonempty := by
    obtain ⟨i, hi⟩ := kernel_negative_coordinate_of_positive_height
      g height hheight d hd hdkernel
    exact ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ i, hi⟩⟩
  obtain ⟨j, hj, hmin⟩ := Finset.exists_min_image J (fun i => a i / (-d i)) hJ
  have hdj : d j < 0 := (Finset.mem_filter.mp hj).2
  let t : ℚ := a j / (-d j)
  have ht : 0 < t := div_pos (hapos j hdj) (neg_pos.mpr hdj)
  have htj : t * (-d j) = a j :=
    div_mul_cancel₀ _ (ne_of_gt (neg_pos.mpr hdj))
  let b : ι → ℚ := a + t • d
  have hbnonneg : ∀ i, 0 ≤ b i := by
    intro i
    change 0 ≤ a i + t * d i
    by_cases hi : d i < 0
    · have hratio : t ≤ a i / (-d i) :=
        hmin i (Finset.mem_filter.mpr ⟨Finset.mem_univ i, hi⟩)
      have hbound := (le_div_iff₀ (neg_pos.mpr hi)).mp hratio
      nlinarith
    · exact add_nonneg (ha.1 i) (mul_nonneg ht.le (le_of_not_gt hi))
  have hbfeasible : Feasible g x b := by
    refine ⟨hbnonneg, ?_⟩
    change combination g (a + t • d) = x
    rw [combination_add, combination_smul, hdkernel, smul_zero, add_zero, ha.2]
  have hbcost : cost c b ≤ cost c a := by
    change cost c (a + t • d) ≤ cost c a
    rw [cost_add, cost_smul]
    exact add_le_of_nonpos_right (mul_nonpos_of_nonneg_of_nonpos ht.le hdcost)
  have hsub : coefficientSupport b ⊆ coefficientSupport a := by
    intro i hi
    by_contra hia
    have hai := supported_coefficientSupport a i hia
    have hdi := hdsupport i hia
    have hbi : b i = 0 := by
      change a i + t * d i = 0
      rw [hai, hdi, mul_zero, add_zero]
    exact (mem_coefficientSupport b i).mp hi hbi
  have hbj : b j = 0 := by
    change a j + t * d j = 0
    nlinarith
  have hja : j ∈ coefficientSupport a :=
    (mem_coefficientSupport a j).mpr (hapos j hdj).ne'
  have hjb : j ∉ coefficientSupport b := by
    simp only [mem_coefficientSupport, hbj, ne_self_iff_false, not_false_eq_true]
  refine ⟨b, hbfeasible, hbcost, Finset.ssubset_iff_subset_ne.mpr ⟨hsub, ?_⟩⟩
  intro heq
  apply hjb
  rw [heq]
  exact hja

/-- Every feasible vector can be replaced by one on an independent support
without increasing the cost. Termination uses the natural support cardinal. -/
theorem exists_feasible_independent_le_of_positive_height
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i)) (c : ι → ℚ)
    (x : V) (a : ι → ℚ) (ha : Feasible g x a) :
    ∃ b : ι → ℚ, Feasible g x b ∧
      LinearIndepOn ℚ g (coefficientSupport b : Set ι) ∧ cost c b ≤ cost c a := by
  have h : ∀ n : ℕ, ∀ a : ι → ℚ, (coefficientSupport a).card = n →
      Feasible g x a → ∃ b : ι → ℚ, Feasible g x b ∧
        LinearIndepOn ℚ g (coefficientSupport b : Set ι) ∧ cost c b ≤ cost c a := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro a hcard hfeasible
      by_cases hli : LinearIndepOn ℚ g (coefficientSupport a : Set ι)
      · exact ⟨a, hfeasible, hli, le_rfl⟩
      · obtain ⟨b, hb, hcost, hsupport⟩ :=
          exists_nonincreasing_support_step g height hheight c x a hfeasible hli
        have hcardlt : (coefficientSupport b).card < n := by
          rw [← hcard]
          exact Finset.card_lt_card hsupport
        obtain ⟨q, hq, hqli, hqcost⟩ := ih _ hcardlt b rfl hb
        exact ⟨q, hq, hqli, hqcost.trans hcost⟩
  exact h _ a rfl ha

/-- At a fixed represented point, independent support determines all
coefficients. There are only finitely many such supports. -/
theorem independent_feasible_set_finite (g : ι → V) (x : V) :
    {a : ι → ℚ | Feasible g x a ∧
      LinearIndepOn ℚ g (coefficientSupport a : Set ι)}.Finite := by
  apply Set.Finite.of_injOn
    (f := coefficientSupport) (t := Set.univ) (fun _ _ => Set.mem_univ _) ?_
    (Set.finite_univ)
  intro a ha b hb hs
  exact combination_injective_on_independent_support g (coefficientSupport a)
    ha.2 a b (supported_coefficientSupport a)
    (by simpa only [hs] using supported_coefficientSupport b)
    (ha.1.2.trans hb.1.2.symm)

/-- A positive height gives a global rational optimum for every feasible
point and every rational cost. -/
theorem exists_optimal_of_positive_height
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i)) (c : ι → ℚ)
    (x : V) (a : ι → ℚ) (ha : Feasible g x a) :
    ∃ b : ι → ℚ, Optimal g c x b := by
  let S : Set (ι → ℚ) := {b | Feasible g x b ∧
    LinearIndepOn ℚ g (coefficientSupport b : Set ι)}
  obtain ⟨b, hb, hbli, _⟩ :=
    exists_feasible_independent_le_of_positive_height g height hheight c x a ha
  obtain ⟨q, hq, hmin⟩ := Set.exists_min_image S (cost c)
    (independent_feasible_set_finite g x) ⟨b, hb, hbli⟩
  refine ⟨q, hq.1, ?_⟩
  intro r hr
  obtain ⟨z, hz, hzli, hzcost⟩ :=
    exists_feasible_independent_le_of_positive_height g height hheight c x r hr
  exact (hmin z ⟨hz, hzli⟩).trans hzcost

/-- Genericity is needed only for uniqueness, after existence has been proved. -/
theorem exists_unique_optimal_of_positive_height
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i)) (c : ι → ℚ) (hc : GenericCost g c)
    (x : V) (a : ι → ℚ) (ha : Feasible g x a) :
    ∃! b : ι → ℚ, Optimal g c x b := by
  obtain ⟨b, hb⟩ := exists_optimal_of_positive_height g height hheight c x a ha
  exact ⟨b, hb, fun q hq => optimal_unique g c hc x q b hq hb⟩

/-- The admissible support cones cover every feasible point. -/
theorem exists_admissibleSupport_of_feasible
    (g : ι → V) (height : V →ₗ[ℚ] ℚ)
    (hheight : ∀ i, 0 < height (g i)) (c : ι → ℚ)
    (x : V) (a : ι → ℚ) (ha : Feasible g x a) :
    ∃ S : Finset ι, AdmissibleSupport g c S ∧ x ∈ supportedCone g S := by
  obtain ⟨b, hb⟩ := exists_optimal_of_positive_height g height hheight c x a ha
  exact ⟨coefficientSupport b, ⟨x, b, hb, rfl⟩,
    ⟨b, hb.1, supported_coefficientSupport b⟩⟩

end

end Loneliness.Hyperplane.RationalCone
