import Conjectures.FeldheimWeightedTailReduction
import Conjectures.FeldheimWeightedTailLimits
import Conjectures.FeldheimWeightedTailStieltjes

/-!
# Feldheim–Feldheim’s weighted tail conjecture

Conjecture 1 of Naomi Dvora Feldheim and Ohad Noy Feldheim, *Mean and
Minimum of Independent Random Variables*, §1.1, arXiv:1609.03004v3,
Israel Journal of Mathematics 244 (2021), 857–882.

This formalizes the existing argument recorded by Cinna Davis in
`results/feldheim-weighted-tail/PROOF.md`, commit
`2f800fa5191a1d747f126fa20f7e9c2b3730b085`. The authors' earlier equal-weight
and iid results and inverse-increment idea are credited by that argument.
The entry's uncertainty about worldwide priority is preserved.

The theorem retains every weight 0 < t < 1, distinct arbitrary laws, atoms,
and singular laws. The final original statement uses nonnegative random
variables with no almost-sure finite upper bound. A stronger law theorem
and independent-variable theorem require only unboundedness above.
No stability, convex approximation, inverse-level, density, or Stieltjes
hypothesis remains in these endpoints.

The higher-dimensional norm and finite-threshold supplements are separate
and are not claimed as formalized here.
-/

open Set MeasureTheory ProbabilityTheory Filter
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

/-- The weighted-tail ratio exceeds every bound arbitrarily far out, for arbitrary laws. -/
theorem tailRatio_arbitrarily_large (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : UnboundedLaw μ) (hν : UnboundedLaw ν)
    {t : ℝ} (ht : 0 < t) (ht1 : t < 1) (C M : ℝ) :
    ∃ m : ℝ, M ≤ m ∧ C < tailRatio μ ν t m := by
  apply exists_large_tailRatio_of_log_integral μ ν hμ hν ?_ ht ht1 C M
  intro a b hab
  simpa only [logTail,survival] using
    log_tail_increment_le_inverse_tail_integral μ hμ hab

/-- The literal infinite limsup of the actual probability-law ratio. -/
theorem tailRatio_limsup_eq_top (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : UnboundedLaw μ) (hν : UnboundedLaw ν)
    {t : ℝ} (ht : 0 < t) (ht1 : t < 1) :
    Filter.limsup (fun m => ENNReal.ofReal (tailRatio μ ν t m)) atTop = ⊤ :=
  limsup_ofReal_eq_top_of_unbounded (tailRatio_arbitrarily_large μ ν hμ hν ht ht1)

/-- The joint-law bridge gives the same statement for arbitrary independent random variables. -/
theorem independent_tail_limsup {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsProbabilityMeasure P] (X Y : Ω → ℝ)
    (hX : Measurable X) (hY : Measurable Y) (hInd : IndepFun X Y P)
    (hXunbounded : ¬ ∃ m : ℝ, ∀ᵐ ω ∂P, X ω ≤ m)
    (hYunbounded : ¬ ∃ m : ℝ, ∀ᵐ ω ∂P, Y ω ≤ m)
    {t : ℝ} (ht : 0 < t) (ht1 : t < 1) :
    Filter.limsup (fun m => ENNReal.ofReal
      (P.real {ω | m < t*X ω+(1-t)*Y ω}/
        (P.real {ω | m < X ω}*P.real {ω | m < Y ω}))) atTop = ⊤ := by
  have hμ : UnboundedLaw (P.map X) := by
    intro m
    rw [survival_map P X hX m]
    exact (real_tail_positive_iff_not_bounded P X).mpr hXunbounded m
  have hν : UnboundedLaw (P.map Y) := by
    intro m
    rw [survival_map P Y hY m]
    exact (real_tail_positive_iff_not_bounded P Y).mpr hYunbounded m
  have hh := tailRatio_limsup_eq_top (P.map X) (P.map Y) hμ hν ht ht1
  simpa only [tailRatio_map P X Y hX hY hInd] using hh

/-- The original full nonnegative, distinct-law, arbitrary-weight conjecture. -/
theorem feldheim_feldheim_conjecture {Ω : Type*} [MeasurableSpace Ω]
    (P : Measure Ω) [IsProbabilityMeasure P] (X Y : Ω → ℝ)
    (hX : Measurable X) (hY : Measurable Y) (hInd : IndepFun X Y P)
    (hXnonnegative : ∀ᵐ ω ∂P, 0 ≤ X ω) (hYnonnegative : ∀ᵐ ω ∂P, 0 ≤ Y ω)
    (hXnoncompact : ¬ ∃ K : Set ℝ, IsCompact K ∧ ∀ᵐ ω ∂P, X ω ∈ K)
    (hYnoncompact : ¬ ∃ K : Set ℝ, IsCompact K ∧ ∀ᵐ ω ∂P, Y ω ∈ K)
    {t : ℝ} (ht : 0 < t) (ht1 : t < 1) :
    Filter.limsup (fun m => ENNReal.ofReal
      (P.real {ω | m < t*X ω+(1-t)*Y ω}/
        (P.real {ω | m < X ω}*P.real {ω | m < Y ω}))) atTop = ⊤ :=
  independent_tail_limsup P X Y hX hY hInd
    ((not_compactly_supported_iff_not_bounded P X hXnonnegative).mp hXnoncompact)
    ((not_compactly_supported_iff_not_bounded P Y hYnonnegative).mp hYnoncompact) ht ht1

end

end Conjectures.FeldheimWeightedTail
