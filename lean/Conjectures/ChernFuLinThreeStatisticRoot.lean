import Conjectures.ChernFuLinThreeStatisticKernel
import Mathlib.Algebra.CubicDiscriminant
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.PowerSeries.Inverse

/-! # The second, positive-order root of the weighted tail kernel -/

namespace Conjectures.ChernFuLinThreeStatistic.Kernel

open PowerSeries

variable {K : Type*} [Field K]

/-- Hensel lifting of the simple root zero of a monic cubic modulo `X`. -/
private theorem lift_cubic (a b c : PowerSeries K) (hb : constantCoeff b = 1)
    (hc : constantCoeff c = 0) :
    ∃ r : PowerSeries K, constantCoeff r = 0 ∧ r^3+a*r^2+b*r+c = 0 := by
  let p : Cubic (PowerSeries K) := ⟨1,a,b,c⟩
  have hmonic : p.toPoly.Monic := p.leadingCoeff_of_a_ne_zero one_ne_zero
  let I := Ideal.span {(X : PowerSeries K)}
  have hc' : p.toPoly.eval 0 ∈ I := by
    rw [← Polynomial.coeff_zero_eq_eval_zero, p.coeff_eq_d, Ideal.mem_span_singleton, X_dvd_iff]
    exact hc
  have hb' : IsUnit (p.toPoly.derivative.eval 0) := by
    rw [← Polynomial.coeff_zero_eq_eval_zero, Polynomial.coeff_derivative]
    simpa [p.coeff_eq_c] using (isUnit_iff_constantCoeff.mpr (by rw [hb]; exact isUnit_one) : IsUnit b)
  obtain ⟨r,hroot,hr⟩ := HenselianRing.is_henselian (I := I) p.toPoly hmonic 0 hc'
    (hb'.map (Ideal.Quotient.mk I))
  refine ⟨r, X_dvd_iff.mp (Ideal.mem_span_singleton.mp (by simpa using hr : r ∈ I)), ?_⟩
  simpa [Polynomial.IsRoot, Cubic.toPoly, p] using hroot

/-- The specialized cubic really has a root distinct from `X`, with all the
nonvanishing required for division-free elimination. -/
theorem formal_root {t z : K} (ht : t ≠ 0) (hz : z ≠ 0) (hz' : z+1 ≠ 0) :
    let x : PowerSeries K := X
    let k := x*C t*C z
    ∃ r : PowerSeries K, constantCoeff r = 0 ∧ cubic r x k (C z) = 0 ∧ r ≠ x ∧
      H r k (C z) ≠ 0 ∧ H x k (C z) ≠ 0 ∧ k ≠ 0 ∧ x*C z-x+1 ≠ 0 ∧ D r k ≠ 0 := by
  let x : PowerSeries K := X
  let k := x*C t*C z
  let v : PowerSeries K := C z⁻¹
  have hx : x ≠ 0 := PowerSeries.X_ne_zero
  have hzC : C z ≠ 0 := fun h => hz (by simpa using congrArg constantCoeff h)
  have htC : C t ≠ 0 := fun h => ht (by simpa using congrArg constantCoeff h)
  have hv : C z * v = 1 := by simp [v, ← map_mul, hz]
  have hk : k ≠ 0 := mul_ne_zero (mul_ne_zero hx htC) hzC
  have hx0 : constantCoeff x = 0 := constantCoeff_X
  have hk0 : constantCoeff k = 0 := by simp [k,hx0]
  let a := k*(2+v)-x-2
  let b := k^2*(1+v)-2*k*x-2*k-k*v+2*x+1
  let c := k*x-x
  obtain ⟨r,hr0,hroot⟩ := lift_cubic a b c (by simp [b,hk0,hx0]) (by simp [c,hk0,hx0])
  have hr : cubic r x k (C z) = 0 := by
    dsimp [a,b,c] at hroot
    unfold cubic
    linear_combination -(C z)*hroot + (k*r^2+k^2*r-k*r)*hv
  have const_ne {f : PowerSeries K} (h : constantCoeff f ≠ 0) : f ≠ 0 :=
    fun e => h (e ▸ map_zero _)
  have hki : k-1 ≠ 0 := const_ne (by simp [hk0])
  have hrne : r ≠ 0 := by
    rintro rfl
    have hc : (k-1)*x = 0 := by simpa [c,sub_mul] using hroot
    exact mul_ne_zero hki hx hc
  have hrx : r ≠ x := by
    rintro rfl
    rw [cubic_at_x] at hr
    have hn : k*C z+k+x-C z-1 ≠ 0 := const_ne (by
      simp [hk0,hx0]
      intro h; apply hz'; linear_combination -h)
    exact mul_ne_zero (mul_ne_zero (neg_ne_zero.mpr hk) hx) hn hr
  have hH (s : PowerSeries K) (hs : s ≠ 0) (hs0 : constantCoeff s = 0) : H s k (C z) ≠ 0 :=
    mul_ne_zero (mul_ne_zero (mul_ne_zero hs hzC) (const_ne (by simp [hs0])))
      (const_ne (by simp [hk0,hs0]))
  exact ⟨r,hr0,hr,hrx,hH r hrne hr0,hH x hx hx0,hk,const_ne (by simp),
    const_ne (by simp [D,hr0])⟩

end Conjectures.ChernFuLinThreeStatistic.Kernel
