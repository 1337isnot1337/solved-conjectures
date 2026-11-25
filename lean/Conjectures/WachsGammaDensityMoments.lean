module
public import Mathlib.Probability.Distributions.Gamma
public import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
public import Conjectures.WachsCompleteGraphGammaFactors

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory ProbabilityTheory

theorem gamma_density_nat_shape (n : ℕ) (a x : ℝ) :
    gammaPDFReal ((n+1:ℕ):ℝ) a x =
      if 0≤x then a^(n+1)/(n.factorial:ℝ)*x^n*Real.exp (-(a*x)) else 0 := by
  unfold gammaPDFReal
  rw [Nat.cast_add,Nat.cast_one,Real.Gamma_nat_eq_factorial,
    show (n:ℝ)+1-1 = (n:ℝ) by ring,
    ← Nat.cast_add_one,Real.rpow_natCast,Real.rpow_natCast]

/-- Tilting an integer-shape Gamma density by a power increments its
shape, with an exact normalizing factor. -/
theorem gamma_density_power (n j : ℕ) (a : ℝ) (ha : 0 < a) (x : ℝ) :
    gammaPDFReal ((n+1:ℕ):ℝ) a x * x^j =
      (((n+j).factorial:ℝ)/(n.factorial:ℝ)/a^j) *
        gammaPDFReal ((n+j+1:ℕ):ℝ) a x := by
  rw [gamma_density_nat_shape,gamma_density_nat_shape]
  split_ifs
  · rw [show n+j+1=n+1+j by omega,pow_add a,pow_add x]
    have h₁ : (n.factorial:ℝ) ≠ 0 := by positivity
    have h₂ : ((n+j).factorial:ℝ) ≠ 0 := by positivity
    have h₃ : a^j ≠ 0 := pow_ne_zero _ ha.ne'
    field_simp
    ring
  · simp

theorem gamma_measure_positive_ae (n : ℕ) (a : ℝ) :
    ∀ᵐ x ∂gammaMeasure ((n+1:ℕ):ℝ) a, 0 < x := by
  apply ae_iff.mpr
  have h : {x : ℝ | ¬0<x} = Set.Iic 0 := by ext x; simp
  rw [h,gammaMeasure,withDensity_apply _ measurableSet_Iic]
  have hd : Disjoint (Set.Iio (0:ℝ)) {0} := by
    rw [Set.disjoint_singleton_right]
    exact lt_irrefl _
  rw [← Set.Iio_union_right,lintegral_union (measurableSet_singleton 0) hd,
    lintegral_gammaPDF_of_nonpos (le_refl (0:ℝ))]
  simp

end WachsCompleteGraph
