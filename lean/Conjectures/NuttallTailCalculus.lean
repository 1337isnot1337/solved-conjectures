module

public import Conjectures.NuttallRepeatedTails
import all Conjectures.NuttallRepeatedTails
public import Conjectures.NuttallThetaTermSeries
public import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
public import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas

public section
namespace NuttallCumulants

open MeasureTheory Filter
open scoped Topology

private theorem tail_integrable_all {f : ℝ → ℝ} (hcont : Continuous f)
    (h0 : IntegrableOn f (Set.Ioi 0)) (x : ℝ) : IntegrableOn f (Set.Ioi x) := by
  by_cases hx : 0 ≤ x
  · exact h0.mono_set (Set.Ioi_subset_Ioi hx)
  · have h := (hcont.continuousOn.integrableOn_Icc (a := x) (b := 0) (μ := volume)).mono_set
      Set.Ioc_subset_Icc_self
    rw [← Set.Ioc_union_Ioi_eq_Ioi (le_of_not_ge hx)]
    exact h.union h0

private theorem hasDerivAt_tailIntegral {f : ℝ → ℝ} (hf : Continuous f)
    (h0 : IntegrableOn f (Set.Ioi 0)) (x : ℝ) :
    HasDerivAt (fun u => ∫ t in Set.Ioi u, f t) (-f x) x := by
  let c := ∫ t in Set.Ioi (0:ℝ), f t
  have hx := intervalIntegral.integral_hasDerivAt_right
    (hf.intervalIntegrable 0 x) hf.stronglyMeasurable.stronglyMeasurableAtFilter hf.continuousAt
  have he (u : ℝ) : (∫ t in Set.Ioi u, f t) = c - ∫ t in 0..u, f t := by
    have h := intervalIntegral.integral_Ioi_sub_Ioi' h0 (tail_integrable_all hf h0 u)
    change c - (∫ t in Set.Ioi u, f t) = _ at h
    linarith
  exact (hx.const_sub c).congr_of_eventuallyEq (Eventually.of_forall he)

theorem thetaKernel_continuous : Continuous thetaKernel := by
  have he : thetaKernel = (fun t => ∑' n, modeCore (modePolynomials 0) n t) := by
    simpa only [iteratedDeriv_zero] using iteratedDeriv_thetaKernel 0
  rw [he]
  exact continuous_iff_continuousAt.2 fun t =>
    (hasDerivAt_tsum_modeCore (modePolynomials 0) t).continuousAt

theorem repeatedTail_continuous (m : ℕ) : Continuous (repeatedTail m) := by
  induction m with
  | zero => exact thetaKernel_continuous
  | succ m ih =>
    exact continuous_iff_continuousAt.2 fun x =>
      (hasDerivAt_tailIntegral ih (repeatedTail_integrable m le_rfl) x).continuousAt

theorem repeatedTail_integrable_all (m : ℕ) (x : ℝ) :
    IntegrableOn (repeatedTail m) (Set.Ioi x) :=
  tail_integrable_all (repeatedTail_continuous m) (repeatedTail_integrable m le_rfl) x

/-- The fundamental theorem for the literal recursion, with no restriction
on the real endpoint. -/
theorem hasDerivAt_repeatedTail_succ (m : ℕ) (x : ℝ) :
    HasDerivAt (repeatedTail (m+1)) (-repeatedTail m x) x :=
  hasDerivAt_tailIntegral (repeatedTail_continuous m) (repeatedTail_integrable m le_rfl) x

/-- The iterated-derivative index shift used in the cumulant Wronskians. -/
theorem iteratedDeriv_repeatedTail_add (j m : ℕ) (x : ℝ) :
    iteratedDeriv j (repeatedTail (m+j)) x = (-1:ℝ)^j * repeatedTail m x := by
  induction j with
  | zero => simp only [Nat.add_zero, iteratedDeriv_zero, pow_zero, one_mul]
  | succ j ih =>
    rw [iteratedDeriv_succ', show m+(j+1)=m+j+1 by omega]
    have hD : deriv (repeatedTail (m+j+1)) = -repeatedTail (m+j) := by
      funext u
      exact (hasDerivAt_repeatedTail_succ (m+j) u).deriv
    rw [hD, iteratedDeriv_neg, ih, pow_succ]
    ring

private theorem iteratedDeriv_after (j m : ℕ) (f : ℝ → ℝ) :
    iteratedDeriv j (iteratedDeriv m f) = iteratedDeriv (m+j) f := by
  induction j with
  | zero => rw [iteratedDeriv_zero, Nat.add_zero]
  | succ j ih => rw [iteratedDeriv_succ, ih, show m+(j+1)=m+j+1 by omega,
      iteratedDeriv_succ]

/-- After exhausting the tail integrations, further derivatives are the
corresponding derivatives of the theta source, with the exact sign. -/
theorem iteratedDeriv_repeatedTail_after_order (m j : ℕ) (x : ℝ) :
    iteratedDeriv (m+j) (repeatedTail m) x = (-1:ℝ)^m * iteratedDeriv j thetaKernel x := by
  have he : iteratedDeriv m (repeatedTail m) = ((-1:ℝ)^m * thetaKernel ·) := by
    funext u
    simpa only [Nat.zero_add, show repeatedTail 0 = thetaKernel from rfl] using
      iteratedDeriv_repeatedTail_add m 0 u
  rw [← iteratedDeriv_after, he, iteratedDeriv_const_mul_field]

end NuttallCumulants
