module
public import Conjectures.NovelliThibonHookJacobiTrudi
public import Conjectures.NovelliThibonHookProductCoefficients

@[expose] public section
namespace NovelliThibon

open Polynomial
open Classical

noncomputable def signedHookSeries {K : Type*} [CommRing K] (n : ℕ) (a : ℕ → K) : K[X] :=
  ∑ j ∈ Finset.range n,C ((-1)^j*a j)*X^j

theorem signedHookSeries_coeff {K : Type*} [CommRing K]
    (n : ℕ) (a : ℕ → K) (k : ℕ) (hk : k<n) :
    (signedHookSeries n a).coeff k = (-1)^k*a k := by
  unfold signedHookSeries
  simp only [finsetSum_coeff,coeff_C_mul_X_pow]
  rw [Finset.sum_eq_single k]
  · simp
  · intro j _ hj
    simp [Ne.symm hj]
  · intro hk'
    exact (hk' (Finset.mem_range.mpr hk)).elim

/-- Once the actual Schur expansion has the signed hook-series
specialization, compare its coefficients with the literal cell product.
This theorem makes that input an explicit hypothesis. -/
theorem hook_coeff_from_signed_polynomial {K : Type*} [Field K]
    (μ : YoungDiagram) (h : 0<μ.card) (q : K) (t : ℕ → K)
    (a : ℕ → K)
    (hEq : (1-X) * signedHookSeries μ.card a = (1-X) * residualHookProduct μ h q t)
    (k : ℕ) (hk : k<μ.card) :
    a k = ∑ T ∈ (Finset.univ.erase (distinguishedHookCell μ h)).powersetCard k,
      ∏ b ∈ T,hookCellWeight q t b := by
  have hn : (1-X : K[X]) ≠ 0 := by
    intro he
    have hh := congrArg (fun p : K[X] => p.coeff 1) he
    simp [Polynomial.coeff_one] at hh
  have he := mul_left_cancel₀ hn hEq
  have hc := congrArg (fun p : K[X] => p.coeff k) he
  rw [signedHookSeries_coeff _ _ _ hk,residualHookProduct_coefficient] at hc
  exact mul_left_cancel₀ (pow_ne_zero _ (neg_ne_zero.mpr (one_ne_zero : (1:K)≠0))) hc

end NovelliThibon
