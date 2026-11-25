module

public import Conjectures.LassalleOriginalReduction
public import Conjectures.LassalleBesselSourceReduction
public import Conjectures.LassalleFirstRootMoments

@[expose] public section
namespace LassalleRefinement

/-- The remaining classical Bessel-product data, stated without any
hypothesis about the rational bracket, interval boxes, or quotient
inequalities. The same root list determines both moment and product data. -/
def ClassicalBesselProductData : Prop :=
  ∃ (r : ℕ→ℝ) (M : ℝ) (g : ℕ→ℝ),
    StrictMono r ∧ (∀ j,0<r j) ∧
    (∀ x,0<x → besselRealSeries x=0 → ∃ j,r j=x) ∧
    Summable (fun i => 1/r i) ∧ Summable (fun i => (1/r i)^2) ∧
    (∑' i,1/r i)=1/2 ∧ (∑' i,(1/r i)^2)=1/12 ∧
    0<M ∧ (∀ i,0≤g i) ∧ Summable g ∧ Summable (fun i => g i*2^i) ∧
    (∑' i,g i)=M ∧
    (∀ k, normalizedInverse (r 0) M k = (∑ i ∈ Finset.range (k+1),g i)/M) ∧
    (let α (i : ℕ) := r 0/r (i+1)
     HasProd (fun i => 1+α i/(1-2*α i)) ((∑' i,g i*2^i)/M))

theorem bessel_source_from_classical_product (h : ClassicalBesselProductData) :
    BesselSourceDecomposition := by
  obtain ⟨r,M,g,hr,hrPos,hrZero,hrSum,hrSum2,hrM,hrM2,hM,hg,hgs,hgw,hgM,hcoeff,hprod⟩ := h
  have hB := besselRealSeries_first_root_in_bracket r hr hrPos hrSum hrM hrZero
  let α (i : ℕ) := r 0/r (i+1)
  have hMom := bessel_residual_root_moments r hrPos hB.2 hrSum hrSum2 hrM hrM2
  exact ⟨r 0,M,g,α,hB.1,hB.2,hM,hg,hgs,hgw,hgM,hcoeff,
    (fun i => div_nonneg (hrPos 0).le (hrPos (i+1)).le),hMom.1,hMom.2.1,
    hMom.2.2.1,hMom.2.2.2,hprod⟩

/-- The original West-permutation conjecture, conditional only on its
two remaining source bridges. All finite and eventual arithmetic,
coverage, and approximation steps are independent Lean theorems. -/
theorem exactLassalleConjecture_of_bessel_and_permutation_inputs
    (hcount : RefinedCoefficientBridge) (hBessel : ClassicalBesselProductData) :
    ExactLassalleConjecture :=
  exactLassalleConjecture_of_source_inputs hcount
    (uniform_estimate_of_bessel_source_decomposition (bessel_source_from_classical_product hBessel))

end LassalleRefinement
