module

public import Conjectures.GrochenigDensityDefinitions
public import Mathlib.Analysis.Analytic.IsolatedZeros
public import Mathlib.Analysis.Complex.CauchyIntegral
public import Mathlib.Topology.DiscreteSubset

/-!
# Local finiteness of the real zero set

The source density counts actual real zeros. A nonzero entire extension
ensures that every bounded real interval contains finitely many of them.
This proof uses the analytic identity theorem and compactness; it does not
assume a positive lower bound on the spacing of all zeros.
-/

@[expose] public section

namespace Grochenig

open Filter Set

theorem zeroSet_locallyFinite_of_entire (F : ℂ → ℂ) (hF : Differentiable ℂ F)
    (f : ℝ → ℝ) (hrestrict : ∀ x : ℝ, F (x : ℂ) = (f x : ℂ))
    (hne : ∃ x : ℝ, f x ≠ 0) : LocallyFiniteSet (zeroSet f) := by
  have han : AnalyticOnNhd ℂ F univ := hF.differentiableOn.analyticOnNhd isOpen_univ
  have hnzero : ¬EqOn F 0 univ := by
    intro hz
    obtain ⟨x, hx⟩ := hne
    have hFx := hz (mem_univ (x : ℂ))
    change F (x : ℂ) = 0 at hFx
    rw [hrestrict] at hFx
    exact hx (Complex.ofReal_eq_zero.mp hFx)
  have hcod : {z : ℂ | F z ≠ 0} ∈ codiscreteWithin (univ : Set ℂ) :=
    (han.eqOn_zero_or_eventually_ne_zero_of_preconnected isPreconnected_univ).resolve_left hnzero
  intro a b
  let K : Set ℂ := Complex.ofReal '' Icc a b
  have hK : IsCompact K := isCompact_Icc.image Complex.continuous_ofReal
  have hfinite : (K \ {z : ℂ | F z ≠ 0}).Finite :=
    hK.finite_sdiff_of_mem_codiscreteWithin
      ((codiscreteWithin_mono (subset_univ K)) hcod)
  apply (hfinite.preimage Complex.ofReal_injective.injOn).subset
  intro x hx
  refine ⟨⟨x, hx.2, rfl⟩, ?_⟩
  intro hFx
  apply hFx
  rw [hrestrict, (mem_zeroSet f x).mp hx.1, Complex.ofReal_zero]

end Grochenig
