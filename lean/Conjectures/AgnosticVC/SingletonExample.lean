module

public import Conjectures.AgnosticVC.Kernel
public import Mathlib.MeasureTheory.MeasurableSpace.Embedding

/-! A zero classifier together with point classifiers indexed by an arbitrary set.
Realizability of the one-point positive trace detects the index set. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory

variable {X H : Type*}

/-- The one-point positive trace event is a necessary part of measurable trace selection. -/
theorem measurableSet_positive_locus_of_selection [MeasurableSpace X] [TraceOrder H]
    {predict : H → X → Bool} (hs : HasMeasurableTraceSelection predict) :
    MeasurableSet {x : X | ∃ h, predict h x = true} := by
  classical
  let diag (x : X) (_ : Unit) := x
  have hm : Measurable diag := Measurable.of_eval fun _ => measurable_id
  convert hm (hs.realizes Unit Finset.univ) using 1
  ext x
  change (∃ h, predict h x = true) ↔ Finset.univ ∈ sampleFamily predict (diag x)
  rw [mem_sampleFamily]
  constructor
  · rintro ⟨h, hh⟩
    exact ⟨h, Finset.ext fun i => by simp [diag, hh]⟩
  · rintro ⟨h, hh⟩
    refine ⟨h, (mem_sampleTrace predict (diag x) h ()).mp ?_⟩
    rw [hh]
    exact Finset.mem_univ _

/-- The left summand names the zero classifier, the right summand a point of the index set. -/
noncomputable def singletonPredict (B : Set X) : Unit ⊕ B → X → Bool := by
  classical
  exact Sum.elim (fun _ _ => false) (fun b x => decide (x = b.val))

theorem singletonPredict_positive_locus (B : Set X) :
    {x : X | ∃ h, singletonPredict B h x = true} = B := by
  classical
  ext x
  constructor
  · rintro ⟨(_ | b), hh⟩
    · simp [singletonPredict] at hh
    · have hx : x = b.val := by simpa [singletonPredict] using hh
      exact hx ▸ b.property
  · intro hx
    exact ⟨Sum.inr ⟨x,hx⟩, by simp [singletonPredict]⟩

/-- Two distinct positive points cannot occur in a single trace. -/
theorem singletonPredict_vc_le_one (B : Set X) : HasVCDimensionAtMost (singletonPredict B) 1 := by
  classical
  intro S hs
  obtain ⟨h, hh⟩ := hs S (Finset.Subset.refl S)
  apply Finset.card_le_one.mpr
  intro x hx y hy
  have px := (hh x hx).mpr hx
  have py := (hh y hy).mpr hy
  cases h with
  | inl u => simp [singletonPredict] at px
  | inr b =>
    simp only [singletonPredict, Sum.elim_inr, decide_eq_true_eq] at px py
    exact px.trans py.symm

/-- A point of the index set can receive either label. -/
theorem singletonPredict_vc_not_zero {B : Set X} (hB : B.Nonempty) :
    ¬HasVCDimensionAtMost (singletonPredict B) 0 := by
  classical
  obtain ⟨x,hx⟩ := hB
  intro hz
  have hc := hz {x} (by
    intro t _
    by_cases ht : x ∈ t
    · exact ⟨Sum.inr ⟨x,hx⟩, by simp [singletonPredict,ht]⟩
    · exact ⟨Sum.inl (), by simp [singletonPredict,ht]⟩)
  simp at hc

/-- Joint evaluation is measurable even when the index set is nonmeasurable.
The subtype of names carries the trace sigma-algebra. -/
theorem measurable_singletonPredict [MeasurableSpace X] [MeasurableEq X] (B : Set X) :
    Measurable (fun p : X × (Unit ⊕ B) => singletonPredict B p.2 p.1) := by
  classical
  let e := MeasurableEquiv.prodSumDistrib X Unit B
  let f : X × Unit ⊕ X × B → Bool :=
    Sum.elim (fun _ => false) (fun p => decide (p.1 = p.2.val))
  have hf : Measurable f := by
    apply Measurable.sumElim measurable_const
    apply measurable_to_bool
    change MeasurableSet {p : X × B | decide (p.1 = p.2.val) = true}
    simp only [decide_eq_true_eq]
    exact measurableSet_eq_fun (measurable_fst : Measurable (Prod.fst : X × B → X))
      (measurable_subtype_coe.comp measurable_snd)
  convert hf.comp e.measurable using 1
  funext p
  rcases p with ⟨x, u | b⟩ <;> rfl

/-- A nonmeasurable positive index set rules out every choice of canonical order. -/
theorem singletonPredict_no_measurable_selection [MeasurableSpace X] {B : Set X}
    (hB : ¬ MeasurableSet B) (order : TraceOrder (Unit ⊕ B)) :
    letI := order
    ¬ HasMeasurableTraceSelection (singletonPredict B) := by
  intro hs
  exact hB (singletonPredict_positive_locus B ▸ measurableSet_positive_locus_of_selection hs)

end AgnosticVC
