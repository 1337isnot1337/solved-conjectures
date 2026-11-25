module

public import Conjectures.NuttallHankelTransfer
import all Conjectures.NuttallThetaKernel
import all Conjectures.NuttallHankelTransfer
import all Conjectures.NuttallThetaTermDerivatives

public section
namespace NuttallCumulants
open Filter Polynomial Finset
open scoped Topology

/-- A polynomial minus its leading monomial is bounded by a fixed multiple
of the next lower power on the positive half-line above one. -/
theorem abs_eval_sub_leading_le (P : ℝ[X]) {x : ℝ} (hx : 1 ≤ x) :
    |P.eval x - P.leadingCoeff * x^P.natDegree| ≤
      (∑ i ∈ range P.natDegree, |P.coeff i|) * x^(P.natDegree-1) := by
  have h0 : 0 ≤ x := zero_le_one.trans hx
  rw [Polynomial.eval_eq_sum_range, Finset.sum_range_succ, coeff_natDegree, add_sub_cancel_right,
    Finset.sum_mul]
  refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun i hi => ?_)
  rw [abs_mul, abs_of_nonneg (pow_nonneg h0 _)]
  exact mul_le_mul_of_nonneg_left
    (pow_le_pow_right₀ hx (by have := Finset.mem_range.mp hi; omega)) (abs_nonneg _)

theorem normalizedThetaDerivative_eventually_leading_bound (j : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ᶠ t : ℝ in atTop,
      |normalizedThetaDerivative j t -
        (2 * (-4:ℝ)^j) * firstHankelScale t^(j+2)| ≤ C * firstHankelScale t^(j+1) := by
  let P := modePolynomials j
  let C : ℝ := ∑ i ∈ Finset.range P.natDegree, |P.coeff i|
  have hC : 0 ≤ C := Finset.sum_nonneg fun i _ => abs_nonneg _
  have hflat := normalizedThetaDerivative_flat j 0
  simp only [pow_zero, mul_one] at hflat
  have hsmall := (tendsto_iff_norm_sub_tendsto_zero.mp hflat).eventually
    (Iio_mem_nhds (zero_lt_one : (0:ℝ) < 1))
  refine ⟨C+1, by linarith, ?_⟩
  filter_upwards [hsmall, firstHankelScale_tendsto.eventually_ge_atTop (1:ℝ)] with t ht hy
  have hpoly := abs_eval_sub_leading_le P hy
  have hdeg : P.natDegree = j+2 := (modePolynomials_top j).1
  have hlc : P.leadingCoeff = 2 * (-4:ℝ)^j := (modePolynomials_top j).2
  have hdec : P.natDegree-1 = j+1 := by omega
  change |P.eval (firstHankelScale t) - P.leadingCoeff * firstHankelScale t^P.natDegree| ≤
    C * firstHankelScale t^(P.natDegree-1) at hpoly
  rw [hdec, hlc, hdeg] at hpoly
  have h1 : |normalizedThetaDerivative j t - P.eval (firstHankelScale t)| ≤ 1 := by
    exact le_of_lt (by simpa only [Set.mem_Iio, sub_zero, Real.norm_eq_abs] using ht)
  have hp := one_le_pow₀ (n := j+1) hy
  calc
    _ ≤ |normalizedThetaDerivative j t - P.eval (firstHankelScale t)| +
        |P.eval (firstHankelScale t) - (2 * (-4:ℝ)^j) * firstHankelScale t^(j+2)| :=
      abs_sub_le _ _ _
    _ ≤ 1 + C * firstHankelScale t^(j+1) := add_le_add h1 hpoly
    _ ≤ _ := by rw [add_mul, one_mul]; linarith

theorem thetaTerm_zero_le_thetaKernel {t : ℝ} (ht : 0 ≤ t) :
    thetaTerm t 0 ≤ thetaKernel t := by
  unfold thetaKernel
  rw [(thetaTerm_summable ht).tsum_eq_zero_add]
  exact le_add_of_nonneg_right (tsum_nonneg fun n => (thetaTerm_pos ht (n+1)).le)

theorem normalizedThetaDerivative_zero_lower {t : ℝ} (ht : 0 ≤ t)
    (hy : 3 ≤ firstHankelScale t) :
    firstHankelScale t ^ 2 ≤ normalizedThetaDerivative 0 t := by
  let y := firstHankelScale t
  let E := firstHankelEnvelope t
  have h := thetaTerm_zero_derivative_envelope 0 t
  simp only [iteratedDeriv_zero, modePolynomials, eval_sub, eval_mul, eval_C, eval_pow, eval_X] at h
  change thetaTerm t 0 = E*(2*y^2-3*y) at h
  have hpos : 0 < E := firstHankelEnvelope_pos t
  change y^2 ≤ thetaKernel t / E
  apply (le_div_iff₀ hpos).2
  calc
    _ ≤ E*(2*y^2-3*y) := by
      rw [mul_comm (y^2)]
      apply mul_le_mul_of_nonneg_left _ hpos.le
      have hy0 : 0 ≤ y := (firstHankelScale_pos _).le
      have hp := mul_nonneg hy0 (sub_nonneg.mpr (show 3 ≤ y from hy))
      nlinarith only [hp]
    _ = thetaTerm t 0 := h.symm
    _ ≤ thetaKernel t := thetaTerm_zero_le_thetaKernel ht

/-- Derivative ratio estimate (14) at each positive derivative order. -/
theorem thetaDerivative_ratio_eventually_le (j : ℕ) (hj : 1 ≤ j) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ᶠ t : ℝ in atTop,
      |iteratedDeriv j thetaKernel t / thetaKernel t - (-4 * firstHankelScale t)^j| ≤
        C * firstHankelScale t^(j-1) := by
  obtain ⟨Cj, hCj, hjbig⟩ := normalizedThetaDerivative_eventually_leading_bound j
  obtain ⟨C0, hC0, h0big⟩ := normalizedThetaDerivative_eventually_leading_bound 0
  let a : ℝ := (-4)^j
  let C : ℝ := Cj + |a| *C0
  have hC : 0 ≤ C := add_nonneg hCj (mul_nonneg (abs_nonneg _) hC0)
  refine ⟨C, hC, ?_⟩
  filter_upwards [hjbig, h0big, eventually_ge_atTop (0:ℝ),
    firstHankelScale_tendsto.eventually_ge_atTop (3:ℝ)] with t htj ht0 ht hy
  let y := firstHankelScale t
  let E := firstHankelEnvelope t
  let A := normalizedThetaDerivative j t
  let B := normalizedThetaDerivative 0 t
  have hypos : 0 < y := firstHankelScale_pos t
  have hB : y^2 ≤ B := normalizedThetaDerivative_zero_lower ht hy
  have hBp : 0 < B := (pow_pos hypos _).trans_le hB
  have h0 : |B-2*y^2| ≤ C0*y := by simpa only [Nat.zero_add, pow_zero, pow_one, mul_one] using ht0
  have hmain : |A-a*y^j*B| ≤ C*y^(j+1) := by
    have he : A-a*y^j*B = (A-2*a*y^(j+2)) - a*y^j*(B-2*y^2) := by
      rw [pow_add]
      ring
    rw [he]
    calc
      _ ≤ |A-2*a*y^(j+2)| + |a*y^j*(B-2*y^2)| := abs_sub _ _
      _ ≤ Cj*y^(j+1) + (|a| *y^j)*(C0*y) := by
        rw [abs_mul, abs_mul, abs_of_nonneg (pow_nonneg hypos.le _)]
        exact add_le_add htj (mul_le_mul_of_nonneg_left h0
          (mul_nonneg (abs_nonneg _) (pow_nonneg hypos.le _)))
      _ = _ := by unfold C; rw [pow_succ]; ring
  have hratio : iteratedDeriv j thetaKernel t / thetaKernel t = A/B := by
    change _ = (_ / E) / (iteratedDeriv 0 thetaKernel t / E)
    rw [iteratedDeriv_zero]
    exact (div_div_div_cancel_right₀ (show E ≠ 0 from (firstHankelEnvelope_pos t).ne') _ _).symm
  rw [hratio, mul_pow]
  change |A/B-a*y^j| ≤ C*y^(j-1)
  rw [show A/B-a*y^j = (A-a*y^j*B)/B by field_simp [hBp.ne'], abs_div, abs_of_pos hBp]
  apply (div_le_iff₀ hBp).2
  calc
    _ ≤ C*y^(j+1) := hmain
    _ = C*y^(j-1)*y^2 := by rw [mul_assoc, ← pow_add, show j-1+2 = j+1 by omega]
    _ ≤ _ := mul_le_mul_of_nonneg_left hB (mul_nonneg hC (pow_nonneg hypos.le _))


/-- A single upper threshold and one error constant work for all the positive
derivative orders up to any prescribed finite order. -/
theorem thetaDerivative_ratio_uniform (r : ℕ) :
    ∃ C U : ℝ, 0 ≤ C ∧ 1 ≤ U ∧ ∀ t : ℝ, U ≤ t → ∀ j : ℕ, 1 ≤ j → j ≤ r →
      |iteratedDeriv j thetaKernel t / thetaKernel t - (-4 * firstHankelScale t)^j| ≤
        C * firstHankelScale t^(j-1) := by
  classical
  have h (j : Fin (r+1)) :
      ∃ C : ℝ, 0 ≤ C ∧ ∀ᶠ t : ℝ in atTop,
        1 ≤ j.val → |iteratedDeriv j.val thetaKernel t / thetaKernel t -
          (-4 * firstHankelScale t)^j.val| ≤ C * firstHankelScale t^(j.val-1) := by
    by_cases hj : 1 ≤ j.val
    · obtain ⟨C, hC, h⟩ := thetaDerivative_ratio_eventually_le j.val hj
      exact ⟨C, hC, h.mono fun _ ht _ => ht⟩
    · exact ⟨0, le_rfl, Filter.Eventually.of_forall fun _ h => (hj h).elim⟩
  choose C hC he using h
  obtain ⟨U, hU⟩ := Filter.eventually_atTop.mp (Filter.eventually_all.mpr he)
  refine ⟨∑ j, C j, max 1 U, Finset.sum_nonneg fun i _ => hC i, le_max_left _ _,
    fun t ht j hj hjr => ?_⟩
  let i : Fin (r+1) := ⟨j, Nat.lt_succ_of_le hjr⟩
  have hC' : C i ≤ ∑ l, C l := Finset.single_le_sum (fun k _ => hC k) (Finset.mem_univ i)
  exact (hU t ((le_max_right 1 U).trans ht) i hj).trans
    (mul_le_mul_of_nonneg_right hC' (pow_nonneg (firstHankelScale_pos t).le _))

end NuttallCumulants
