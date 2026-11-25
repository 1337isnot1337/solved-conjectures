module

public import Conjectures.LassalleResidualReduction
public import Conjectures.LassallePositiveSeriesTail
public import Conjectures.LassalleProductBound

@[expose] public section
namespace LassalleRefinement

/-- The exact analytic input left from the Bessel-product argument.
It specifies the residual series after removal of the first root and
its normalized coefficient and product identities. -/
def BesselSourceDecomposition : Prop :=
  ∃ (R M : ℝ) (g α : ℕ→ℝ),
    (rootLo:ℝ)≤R ∧ R≤(rootHi:ℝ) ∧ 0<M ∧
    (∀ i,0≤g i) ∧ Summable g ∧ Summable (fun i => g i*2^i) ∧
    (∑' i,g i)=M ∧
    (∀ m, normalizedInverse R M m = (∑ i ∈ Finset.range (m+1),g i)/M) ∧
    (∀ i,0≤α i) ∧ Summable α ∧ Summable (fun i => (α i)^2) ∧
    (∑' i,α i)≤21/25 ∧ (∑' i,(α i)^2)≤(9/25:ℝ)^2 ∧
    HasProd (fun i => 1+α i/(1-2*α i)) ((∑' i,g i*2^i)/M)

theorem besselInverseResidual_of_source_decomposition (h : BesselSourceDecomposition) :
    BesselInverseResidual := by
  obtain ⟨R,M,g,α,hlo,hhi,hM,hg,hs,hw,ht,hN,hα,ha,ha2,h1,h2,hP⟩ := h
  have hp := bessel_product_bound_limit α _ hα ha ha2 h1 h2 hP
  have hweight : (∑' i,g i*2^i)≤32*M := ((div_lt_iff₀ hM).mp hp).le
  refine ⟨R,M,hlo,hhi,hM,?_⟩
  intro m
  rw [hN]
  exact normalized_positive_series_tail g M hM hg hs hw ht hweight m

theorem uniform_estimate_of_bessel_source_decomposition (h : BesselSourceDecomposition) :
    UniformLassalleEstimate :=
  uniform_estimate_of_bessel_residual (besselInverseResidual_of_source_decomposition h)

end LassalleRefinement
