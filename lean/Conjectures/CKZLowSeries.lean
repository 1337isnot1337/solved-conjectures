import Conjectures.CKZComposition

/-! Direct Pell certificates for the three low-record comparisons. -/
namespace CKZLowSeries
open CKZCertificates CKZComposition
open scoped Polynomial

def f1 : List ℤ := [0,0,1,-1,-1]
def f2 : List ℤ := [1,2,-1,-3,2,5,2]
def f3 : List ℤ := [1,1,-1,0,1]

theorem f1_nonneg : SeriesNonneg (((toPolynomial f1 : ℤ[X]) : PowerSeries ℤ).subst R) :=
  certified_composition_nonneg _ (by decide +kernel) (by decide +kernel)
theorem f2_nonneg : SeriesNonneg (((toPolynomial f2 : ℤ[X]) : PowerSeries ℤ).subst R) :=
  certified_composition_nonneg _ (by decide +kernel) (by decide +kernel)
theorem f3_nonneg : SeriesNonneg (((toPolynomial f3 : ℤ[X]) : PowerSeries ℤ).subst R) :=
  certified_composition_nonneg _ (by decide +kernel) (by decide +kernel)

theorem f1_eval : (((toPolynomial f1 : ℤ[X]) : PowerSeries ℤ).subst R) = R^2*(1-R-R^2) := by
  let φ : PowerSeries ℤ →ₐ[ℤ] PowerSeries ℤ := PowerSeries.substAlgHom (PowerSeries.HasSubst.of_constantCoeff_zero' R_constant)
  have hφX : φ PowerSeries.X = R := PowerSeries.substAlgHom_X _
  have hφ : φ (((toPolynomial f1 : ℤ[X]) : PowerSeries ℤ)) = R^2*(1-R-R^2) := by
    simp [f1, toPolynomial, hφX]
    all_goals try ring
  simpa only [φ, PowerSeries.coe_substAlgHom] using hφ

theorem f2_eval : (((toPolynomial f2 : ℤ[X]) : PowerSeries ℤ).subst R) = (1+R)^3*(1-R-R^2+2*R^3) := by
  let φ : PowerSeries ℤ →ₐ[ℤ] PowerSeries ℤ := PowerSeries.substAlgHom (PowerSeries.HasSubst.of_constantCoeff_zero' R_constant)
  have hφX : φ PowerSeries.X = R := PowerSeries.substAlgHom_X _
  have h2 : φ (((2 : ℤ[X]) : PowerSeries ℤ)) = 2 := by
    rw [show ((2 : ℤ[X]) : PowerSeries ℤ) = 2 from map_ofNat Polynomial.coeToPowerSeries.ringHom 2]
    exact map_ofNat φ 2
  have h3 : φ (((3 : ℤ[X]) : PowerSeries ℤ)) = 3 := by
    rw [show ((3 : ℤ[X]) : PowerSeries ℤ) = 3 from map_ofNat Polynomial.coeToPowerSeries.ringHom 3]
    exact map_ofNat φ 3
  have h5 : φ (((5 : ℤ[X]) : PowerSeries ℤ)) = 5 := by
    rw [show ((5 : ℤ[X]) : PowerSeries ℤ) = 5 from map_ofNat Polynomial.coeToPowerSeries.ringHom 5]
    exact map_ofNat φ 5
  have hφ : φ (((toPolynomial f2 : ℤ[X]) : PowerSeries ℤ)) = (1+R)^3*(1-R-R^2+2*R^3) := by
    simp [f2, toPolynomial, hφX, h2, h3, h5]
    all_goals try ring
  simpa only [φ, PowerSeries.coe_substAlgHom] using hφ

theorem f3_eval : (((toPolynomial f3 : ℤ[X]) : PowerSeries ℤ).subst R) = (1+R)*(1-R^2+R^3) := by
  let φ : PowerSeries ℤ →ₐ[ℤ] PowerSeries ℤ := PowerSeries.substAlgHom (PowerSeries.HasSubst.of_constantCoeff_zero' R_constant)
  have hφX : φ PowerSeries.X = R := PowerSeries.substAlgHom_X _
  have hφ : φ (((toPolynomial f3 : ℤ[X]) : PowerSeries ℤ)) = (1+R)*(1-R^2+R^3) := by
    simp [f3, toPolynomial, hφX]
    all_goals try ring
  simpa only [φ, PowerSeries.coe_substAlgHom] using hφ

noncomputable def t : PowerSeries ℤ := PowerSeries.X
noncomputable def F1 : PowerSeries ℤ := t*(1+R)
noncomputable def F2 : PowerSeries ℤ := t^2*(1+R)^3
noncomputable def F3 : PowerSeries ℤ := t^3*(1+R)^4*(1+2*R)
noncomputable def H2 : PowerSeries ℤ := t^2*R*(1+R)^2

theorem t_nonneg : SeriesNonneg t := seriesNonneg_X

theorem t_relation : t*(1+R) = R*(1-R) := by
  dsimp [t]
  linear_combination -R_equation

theorem first_identity : F2-F1+t = t*(R^2*(1-R-R^2)) := by
  dsimp [F1,F2]
  linear_combination t*(1+R)^2*t_relation

theorem second_identity : F2-F3 = t^2*((1+R)^3*(1-R-R^2+2*R^3)) := by
  dsimp [F2,F3]
  linear_combination -t^2*(1+R)^3*(1+2*R)*t_relation

theorem third_identity : F1-H2 = t*((1+R)*(1-R^2+R^3)) := by
  dsimp [F1,H2]
  linear_combination -t*(1+R)*R*t_relation

theorem low1_nonneg : SeriesNonneg (F2-F1+t) := by
  rw [first_identity, ← f1_eval]
  exact seriesNonneg_mul t_nonneg f1_nonneg

theorem low2_nonneg : SeriesNonneg (F2-F3) := by
  rw [second_identity, ← f2_eval]
  exact seriesNonneg_mul (seriesNonneg_pow t_nonneg 2) f2_nonneg

theorem low3_nonneg : SeriesNonneg (F1-H2) := by
  rw [third_identity, ← f3_eval]
  exact seriesNonneg_mul t_nonneg f3_nonneg

theorem low1_coeff (n : ℕ) (hn : n ≠ 1) :
    PowerSeries.coeff n F1 ≤ PowerSeries.coeff n F2 := by
  have h := low1_nonneg n
  simp only [map_add, map_sub] at h
  simp [t, PowerSeries.coeff_X, hn] at h
  omega

theorem low2_coeff (n : ℕ) :
    PowerSeries.coeff n F3 ≤ PowerSeries.coeff n F2 := by
  have h := low2_nonneg n
  simp only [map_sub] at h
  omega

theorem low3_coeff (n : ℕ) :
    PowerSeries.coeff n H2 ≤ PowerSeries.coeff n F1 := by
  have h := low3_nonneg n
  simp only [map_sub] at h
  omega

end CKZLowSeries
