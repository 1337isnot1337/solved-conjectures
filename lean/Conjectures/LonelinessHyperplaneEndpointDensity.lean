import Conjectures.LonelinessHyperplaneEndpointGeometry
import Conjectures.LonelinessHyperplaneHitDensity

/-! The exact unshifted endpoint probability for a full-support normal.
The finite sample includes all positive, pairwise distinct integer
velocities in the box, without a primitive-velocity restriction. -/

namespace Loneliness.Hyperplane

open Filter
open scoped BigOperators Topology

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

def positiveBoxEndpoint (m : ι → ℤ) (N : ℕ) : Finset (ι → Fin N) := by
  classical
  exact (positiveBoxAdmissible m N).filter (fun v =>
    shiftedVelocityValue (positiveBoxCoordinates v) 0 = predictedValue m 0)

def endpointFrequency (m : ι → ℤ) (N : ℕ) : ℝ :=
  ((positiveBoxEndpoint m N).card : ℝ) / (positiveBoxAdmissible m N).card

theorem positiveBoxEndpoint_eq_hitsResidue
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hsupport : ∀ i, m i ≠ 0)
    [NeZero (endpointModulus m)] (N : ℕ) :
    positiveBoxEndpoint m N =
      positiveBoxHitsResidue m (canonicalResidue m (endpointModulus m)) N := by
  classical
  unfold positiveBoxEndpoint positiveBoxHitsResidue
  apply Finset.filter_congr
  intro v hv
  exact unshifted_endpoint_iff_canonical m hm hsupport (positiveBoxCoordinates v)
    (Finset.mem_filter.mp hv).2.1

/-- The original endpoint formula, including relation dimension one.
The positivity and distinctness hypothesis is on the real normal
kernel; every normal coordinate is explicitly assumed nonzero. -/
theorem endpointFrequency_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (hsupport : ∀ i, m i ≠ 0) :
    Tendsto (endpointFrequency m) atTop
      (𝓝 ((Nat.totient (endpointModulus m) : ℝ) /
        (((endpointModulus m : ℕ) : ℝ) ^ (Fintype.card ι - 1) *
          ∏ p ∈ (endpointModulus m).primeFactors,
            (1 - ((p : ℝ) ^ (Fintype.card ι - 1))⁻¹)))) := by
  letI : NeZero (endpointModulus m) := ⟨(endpointModulus_pos m hm).ne'⟩
  let i := Classical.arbitrary ι
  have ht := residueHitFrequency_tendsto m hm hreal hdim
    (canonicalResidue m (endpointModulus m)) i (canonicalResidue_isUnit m _ i)
    (canonicalEndpointResidue_mem_kernel m)
  change Tendsto (fun N => residueHitFrequency m
    (canonicalResidue m (endpointModulus m)) N) atTop _ at ht
  change Tendsto (fun N => endpointFrequency m N) atTop _
  simpa only [endpointFrequency, residueHitFrequency,
    positiveBoxEndpoint_eq_hitsResidue m hm hsupport] using ht

end

end Loneliness.Hyperplane
