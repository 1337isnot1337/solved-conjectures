module
public import Conjectures.PomeranceSarkozyAtomicPush

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory
open scoped ENNReal

variable {A B : Type*} [MeasurableSpace A] [MeasurableSpace B]
variable [Countable A] [MeasurableSingletonClass A] [MeasurableSingletonClass B]

/-- The push of real atom masses is the actual pushforward measure on
singletons, when the original law is a finite measure on a countable type. -/
theorem atomicPush_eq_measure_map_real (μ : Measure A) [IsFiniteMeasure μ] (f : A→B)
    (hf : Measurable f) (hS : Summable (fun a => μ.real {a})) (b : B) :
    atomicPush f (fun a => μ.real {a}) b=(μ.map f).real {b} := by
  let S : Set A := f ⁻¹' {b}
  have hs : Summable (fun a : ↥S => μ.real {a.val}) := hS.subtype S
  have hn (a : ↥S) : 0≤μ.real {a.val} := ENNReal.toReal_nonneg
  have hm : (∑' a : ↥S, μ {a.val})=μ S := by
    have hm' := tsum_measure_preimage_singleton (μ:=μ) (f:=id)
      (Set.to_countable S) (fun a _ => measurableSet_singleton a)
    simpa only [Set.preimage_id_eq,id_eq] using hm'
  have he : ENNReal.ofReal (atomicPush f (fun a => μ.real {a}) b) = μ S := by
    unfold atomicPush
    change ENNReal.ofReal (∑' a : ↥S,μ.real {a.val})=_
    rw [ENNReal.ofReal_tsum_of_nonneg hn hs]
    have hpt (a : ↥S) : ENNReal.ofReal (μ.real {a.val})=μ {a.val} :=
      ENNReal.ofReal_toReal (measure_ne_top _ _)
    simp_rw [hpt]
    exact hm
  have hnonneg : 0≤atomicPush f (fun a => μ.real {a}) b := by
    unfold atomicPush
    exact tsum_nonneg hn
  rw [measureReal_def,Measure.map_apply hf (measurableSet_singleton b)]
  exact (ENNReal.toReal_ofReal hnonneg).symm.trans (congrArg ENNReal.toReal he)

end PomeranceSarkozy
