module
public import Conjectures.LassalleBoxCoverage
public import Conjectures.LassalleFiniteCoverage

@[expose] public section
namespace LassalleRefinement

/-- The two remaining source bridges are explicit hypotheses, not axioms. -/
theorem exactLassalleConjecture_of_source_inputs
    (hcount : RefinedCoefficientBridge) (hanalytic : UniformLassalleEstimate) :
    ExactLassalleConjecture := by
  apply exactLogConcavity_of_coefficients hcount
  intro k a ha hi
  by_cases hk : k<54
  · exact (quotientRow_strict_through_53 k a hk ha hi).le
  · exact (lassalle_eventual_from_uniform_estimate hanalytic k a (by omega) ha hi).le

end LassalleRefinement
