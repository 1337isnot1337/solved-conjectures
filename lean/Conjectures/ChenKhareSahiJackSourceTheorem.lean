import Conjectures.ChenKhareSahiJackSourceSemiring
import Conjectures.ChenKhareSahiJackSourceWitness

namespace ChenKhareSahi.Jack.Source

noncomputable section

/-- Chen–Khare–Sahi Conjecture 4, refuted directly using the defining source
unit-parameter Jack scalar product. The result includes all homogeneous choices for
higher-degree source generators. No Jack-to-Schur identification is assumed. -/
theorem conjecture4_unit_parameter_counterexample :
    Dominates ![3,2,0,0,0] ![3,1,1,0,0] ∧
    (∃ G, SourceFamily G) ∧ (∃! F : Index → Index → ℝ, IsJackFamily F) ∧
    ∀ G, SourceFamily G → ∀ F : Index → Index → ℝ, IsJackFamily F →
      ¬ Generated (normalized G) (jackTarget F) := by
  refine ⟨conjecture4_counterexample.1, ⟨completion, completion_family⟩, family_exists_unique, ?_⟩
  intro G hG F hF
  apply exclude_target _ hG.values F hF
  intro p hp t x
  simp only [normalized, hG.homogeneous p hp]
  ring

end

end ChenKhareSahi.Jack.Source
