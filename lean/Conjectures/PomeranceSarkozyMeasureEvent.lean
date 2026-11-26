module
public import Conjectures.PomeranceSarkozyAtomicEvent
public import Conjectures.PomeranceSarkozyMatrixComparison

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory
open scoped ENNReal

variable {A : Type*} [MeasurableSpace A] [Countable A] [MeasurableSingletonClass A]

private theorem measure_as_atom_tsum (μ : Measure A) (S : Set A) :
    (∑' a : ↥S, μ {a.val})=μ S := by
  have h := tsum_measure_preimage_singleton (μ:=μ) (f:=id)
    (Set.to_countable S) (fun x _ => measurableSet_singleton x)
  simpa only [Set.preimage_id_eq,id_eq] using h

theorem measure_real_atoms_summable (μ : Measure A) [IsFiniteMeasure μ] :
    Summable (fun a => μ.real {a}) := by
  have h (a : A) : ENNReal.ofReal (μ.real {a})=μ {a} :=
    ENNReal.ofReal_toReal (measure_ne_top _ _)
  have hm : atomicMass (fun a => μ.real {a})=μ Set.univ := by
    unfold atomicMass
    simp_rw [h]
    rw [← (Equiv.Set.univ A).tsum_eq (fun a => μ {a})]
    exact measure_as_atom_tsum μ _
  exact atomicMass_summable_of_ne_top (fun _ => ENNReal.toReal_nonneg) (hm ▸ measure_ne_top _ _)

theorem measure_real_eq_atom_tsum (μ : Measure A) [IsFiniteMeasure μ] (S : Set A) :
    (∑' a : ↥S, μ.real {a.val})=μ.real S := by
  have hS : Summable (fun a : ↥S => μ.real {a.val}) :=
    (measure_real_atoms_summable μ).subtype S
  have hnonneg (a : ↥S) : 0≤μ.real {a.val} := ENNReal.toReal_nonneg
  have h (a : ↥S) : ENNReal.ofReal (μ.real {a.val})=μ {a.val} :=
    ENNReal.ofReal_toReal (measure_ne_top _ _)
  have he : ENNReal.ofReal (∑' a : ↥S, μ.real {a.val})=μ S := by
    rw [ENNReal.ofReal_tsum_of_nonneg hnonneg hS]
    simp_rw [h]
    exact measure_as_atom_tsum μ S
  rw [measureReal_def]
  exact (ENNReal.toReal_ofReal (tsum_nonneg hnonneg)).symm.trans (congrArg ENNReal.toReal he)

/-- Discrepancy of any event between two genuine countable laws is
at most their atomic L1 discrepancy. -/
theorem measure_event_difference_le_atomicL1 (μ ν : Measure A)
    [IsFiniteMeasure μ] [IsFiniteMeasure ν] (S : Set A) :
    ENNReal.ofReal |μ.real S-ν.real S| ≤
      atomicL1 (fun a => μ.real {a}) (fun a => ν.real {a}) := by
  have h := atomicEvent_difference_le (fun a => μ.real {a}) (fun a => ν.real {a})
    (measure_real_atoms_summable μ) (measure_real_atoms_summable ν)
    (fun _ => ENNReal.toReal_nonneg) (fun _ => ENNReal.toReal_nonneg) S
  rw [measure_real_eq_atom_tsum μ S,measure_real_eq_atom_tsum ν S] at h
  exact h

end PomeranceSarkozy
