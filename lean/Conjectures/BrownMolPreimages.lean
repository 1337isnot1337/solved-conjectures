import Conjectures.BrownMolRootTargets
import Mathlib.Analysis.Calculus.InverseFunctionTheorem.Deriv
import Mathlib.Analysis.Calculus.Deriv.Polynomial

open Polynomial Filter
open scoped Topology
noncomputable section
namespace BrownMol

theorem exists_local_preimages (a : ℂ[X]) (z0 b0 : ℂ)
    (ha : ‖a.eval z0‖ = 1) (ha' : a.derivative.eval z0 ≠ 0) (hb : b0 ≠ 0) :
    ∃ x : ℕ → ℂ, Tendsto x atTop (𝓝 z0) ∧
      ∀ᶠ n in atTop, (a.eval (x n))^n = -((n : ℂ)*b0) := by
  let f : ℂ → ℂ := fun z => a.eval z
  have hf : HasStrictDerivAt f (a.derivative.eval z0) z0 := a.hasStrictDerivAt z0
  let inv := hf.localInverse f (a.derivative.eval z0) z0 ha'
  have hinv : inv (f z0) = z0 := (hf.eventually_left_inverse ha').self_of_nhds
  have ht : Tendsto (BrownTargets.t (f z0) b0) atTop (𝓝 (f z0)) :=
    BrownTargets.target_tendsto _ _ ha hb
  have hx : Tendsto (fun n => inv (BrownTargets.t (f z0) b0 n)) atTop (𝓝 z0) := by
    have hc : Tendsto inv (𝓝 (f z0)) (𝓝 (inv (f z0))) :=
      (hf.to_localInverse ha').hasDerivAt.continuousAt.tendsto
    have hh := hc.comp ht
    rw [hinv] at hh
    exact hh
  refine ⟨fun n => inv (BrownTargets.t (f z0) b0 n), hx, ?_⟩
  have hright := ht.eventually (hf.eventually_right_inverse ha')
  filter_upwards [hright, Filter.eventually_ge_atTop 1] with n hn hnpos
  change f (inv (BrownTargets.t (f z0) b0 n)) = BrownTargets.t (f z0) b0 n at hn
  change (f (inv (BrownTargets.t (f z0) b0 n)))^n = -((n : ℂ)*b0)
  rw [hn]
  exact BrownTargets.target_power _ _ ha hb (by omega)

end BrownMol
end
