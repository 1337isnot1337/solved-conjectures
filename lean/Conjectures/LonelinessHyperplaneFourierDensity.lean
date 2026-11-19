import Mathlib.Analysis.Fourier.AddCircleMulti
import Mathlib.Analysis.Complex.Tietze
import Mathlib.LinearAlgebra.Finsupp.LinearCombination

/-! Finite integer-frequency approximation on compact subsets of a torus.
Mathlib supplies the global Fourier density theorem and complex Tietze
extension. Their combination applies to every compact subgroup as well. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι]

def characterSum (c : (ι → ℤ) →₀ ℂ) : C(UnitAddTorus ι, ℂ) :=
  c.sum (fun n a => a • UnitAddTorus.mFourier n)

theorem characterSum_apply (c : (ι → ℤ) →₀ ℂ) (x : UnitAddTorus ι) :
    characterSum c x = ∑ n ∈ c.support, c n * UnitAddTorus.mFourier n x := by
  simp [characterSum, Finsupp.sum, smul_eq_mul]

theorem exists_characterSum_approx (f : C(UnitAddTorus ι, ℂ))
    (ε : ℝ) (hε : 0 < ε) :
    ∃ c : (ι → ℤ) →₀ ℂ, ‖characterSum c - f‖ < ε := by
  have hf : f ∈ (Submodule.span ℂ
      (Set.range (UnitAddTorus.mFourier (d := ι)))).topologicalClosure := by
    rw [UnitAddTorus.span_mFourier_closure_eq_top]
    trivial
  change f ∈ closure ((Submodule.span ℂ
    (Set.range (UnitAddTorus.mFourier (d := ι)))) : Set C(UnitAddTorus ι, ℂ)) at hf
  obtain ⟨g, hg, hdist⟩ := Metric.mem_closure_iff.mp hf ε hε
  obtain ⟨c, hc⟩ := Finsupp.mem_span_range_iff_exists_finsupp.mp hg
  refine ⟨c, ?_⟩
  change ‖(c.sum (fun n a => a • UnitAddTorus.mFourier n)) - f‖ < ε
  rw [hc]
  simpa only [dist_eq_norm, norm_sub_rev] using hdist

theorem exists_characterSum_approx_on (K : Set (UnitAddTorus ι)) (hK : IsCompact K)
    (f : C(K, ℂ)) (ε : ℝ) (hε : 0 < ε) :
    ∃ c : (ι → ℤ) →₀ ℂ, ∀ x : K, ‖characterSum c (x : UnitAddTorus ι) - f x‖ < ε := by
  obtain ⟨g, hg⟩ := ContinuousMap.exists_restrict_eq hK.isClosed f
  obtain ⟨c, hc⟩ := exists_characterSum_approx g ε hε
  refine ⟨c, ?_⟩
  intro x
  have hpoint := ((characterSum c - g).norm_coe_le_norm (x : UnitAddTorus ι)).trans_lt hc
  change ‖characterSum c (x : UnitAddTorus ι) - g (x : UnitAddTorus ι)‖ < ε at hpoint
  have hgx : g (x : UnitAddTorus ι) = f x :=
    congrArg (fun h : C(K, ℂ) => h x) hg
  rw [hgx] at hpoint
  exact hpoint

/-- Every continuous function on a compact subset admits uniform
approximation by an explicit finite set of integer frequencies. -/
theorem exists_finite_character_approx_on
    (K : Set (UnitAddTorus ι)) (hK : IsCompact K) (f : C(K, ℂ))
    (ε : ℝ) (hε : 0 < ε) :
    ∃ S : Finset (ι → ℤ), ∃ a : (ι → ℤ) → ℂ,
      ∀ x : K, ‖(∑ n ∈ S, a n * UnitAddTorus.mFourier n (x : UnitAddTorus ι)) - f x‖ < ε := by
  obtain ⟨c, hc⟩ := exists_characterSum_approx_on K hK f ε hε
  refine ⟨c.support, c, ?_⟩
  intro x
  simpa only [characterSum_apply] using hc x

end

end Loneliness.Hyperplane
