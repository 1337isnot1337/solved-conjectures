module

public import Mathlib.Analysis.Real.Cardinality
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.MeasureTheory.Constructions.Polish.Basic
public import Mathlib.MeasureTheory.MeasurableSpace.Card

/-! A full outer-measure set of tuples with injective coordinate projections. -/

@[expose] public section

open Set MeasureTheory MeasurableSpace Cardinal
open scoped Ordinal

namespace AgnosticVC

private theorem cardinal_nonnull_standardBorel {X : Type} [MeasurableSpace X]
    [StandardBorelSpace X] (D : Measure X) [NullSingletonClass D]
    {s : Set X} (hs : MeasurableSet s) (hpos : D s ≠ 0) : #s = 𝔠 := by
  have hunc : ¬ Countable s := by
    intro h
    exact hpos ((countable_coe_iff.mp h).measure_zero D)
  let : StandardBorelSpace s := hs.standardBorel
  exact (Cardinal.mk_congr (PolishSpace.measurableEquivOfNotCountable hunc
    Cardinal.not_countable_real).toEquiv).trans Cardinal.mk_univ_real

private theorem exists_mem_avoiding_small {X : Type} [MeasurableSpace X]
    [StandardBorelSpace X] (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D]
    {n : ℕ} (s : Set (Fin n → X)) (hs : MeasurableSet s)
    (hpos : (Measure.pi fun _ : Fin n => D) s ≠ 0)
    (forbidden : Fin n → Set X) (hsmall : ∀ i, #(forbidden i) < 𝔠) :
    ∃ x ∈ s, ∀ i, x i ∉ forbidden i := by
  induction n with
  | zero =>
    have hsne : s.Nonempty := nonempty_iff_ne_empty.mpr (fun h => hpos (h ▸ measure_empty))
    obtain ⟨x,hx⟩ := hsne
    exact ⟨x,hx,fun i => i.elim0⟩
  | succ n ih =>
    let i : Fin (n + 1) := 0
    let e := MeasurableEquiv.piFinSuccAbove (fun _ : Fin (n + 1) => X) i
    let ν := Measure.pi fun _ : Fin n => D
    let t := e.symm ⁻¹' s
    have ht : MeasurableSet t := e.symm.measurable hs
    have hm : (D.prod ν) t ≠ 0 := by
      have hp : MeasurePreserving e (Measure.pi fun _ : Fin (n + 1) => D) (D.prod ν) :=
        measurePreserving_piFinSuccAbove (fun _ => D) i
      rw [← hp.map_eq, Measure.map_apply e.measurable ht]
      have he : e ⁻¹' t = s := by
        ext a
        change e.symm (e a) ∈ s ↔ a ∈ s
        rw [e.symm_apply_apply]
      rwa [he]
    let T : Set X := {a | ν (Prod.mk a ⁻¹' t) ≠ 0}
    have hT : MeasurableSet T := (measurableSet_eq_fun (measurable_measure_prodMk_left ht)
      measurable_const).compl
    have hTpos : D T ≠ 0 := fun h => hm ((Measure.measure_prod_null ht).2 (ae_iff.mpr h))
    obtain ⟨a,ha,haf⟩ : ∃ a ∈ T, a ∉ forbidden i := by
      by_contra! h
      have hh : T ⊆ forbidden i := h
      have hc := Cardinal.mk_le_mk_of_subset hh
      rw [cardinal_nonnull_standardBorel D hT hTpos] at hc
      exact (hsmall i).not_ge hc
    obtain ⟨b,hb,hbf⟩ := ih (Prod.mk a ⁻¹' t) (measurable_prodMk_left ht) ha
      (fun j => forbidden (i.succAbove j)) (fun j => hsmall (i.succAbove j))
    refine ⟨e.symm (a,b), hb, (i.forall_iff_succAbove).2 ⟨?_,?_⟩⟩
    · simpa [e] using haf
    · intro j
      simpa [e] using hbf j

private theorem cardinal_measurable_le_continuum (α : Type) [m : MeasurableSpace α]
    [MeasurableSpace.CountablyGenerated α] : #{s : Set α | MeasurableSet s} ≤ 𝔠 := by
  obtain ⟨g,hg,hm⟩ := MeasurableSpace.CountablyGenerated.isCountablyGenerated (α := α)
  have hcard : #g ≤ 𝔠 := ((Cardinal.mk_le_aleph0_iff).mpr hg.to_subtype).trans
    Cardinal.aleph0_le_continuum
  change #{s : Set α | @MeasurableSet α m s} ≤ 𝔠
  rw [hm]
  exact MeasurableSpace.cardinal_measurableSet_le_continuum hcard

/-- For any fixed finite product of a nonatomic standard Borel probability, some
set has full outer measure while each coordinate separately determines the tuple. -/
theorem exists_fullOuter_coordinateMatching {X : Type} [MeasurableSpace X]
    [StandardBorelSpace X] (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D] (n : ℕ) :
    ∃ G : Set (Fin n → X), (Measure.pi fun _ : Fin n => D) G = 1 ∧
      ∀ (i : Fin n), Set.InjOn (Function.eval i) G := by
  classical
  let μ := Measure.pi fun _ : Fin n => D
  let α := {s : Set (Fin n → X) // MeasurableSet s ∧ μ s ≠ 0}
  let β := (𝔠 : Cardinal).ord.ToType
  have hcard : #α ≤ #β := by
    rw [Cardinal.mk_toType, Cardinal.card_ord]
    let u (a : α) : {s : Set (Fin n → X) | MeasurableSet s} := ⟨a.val, a.property.1⟩
    have hu : Function.Injective u := by
      intro a b h
      exact Subtype.ext (congrArg (fun x : {s : Set (Fin n → X) | MeasurableSet s} => x.val) h)
    exact (Cardinal.mk_le_of_injective hu).trans (cardinal_measurable_le_continuum (Fin n → X))
  obtain ⟨e⟩ := (Cardinal.le_def α β).mp hcard
  let fallback : α := ⟨univ, MeasurableSet.univ, by simp [μ]⟩
  let B (i : β) : α := if h : ∃ a : α, e a = i then h.choose else fallback
  have hB (a : α) : B (e a) = a := by
    have h : ∃ b : α, e b = e a := ⟨a,rfl⟩
    change (if h : ∃ b : α, e b = e a then h.choose else fallback) = a
    rw [dite_eq_left h]
    exact e.injective h.choose_spec
  have hIio (i : β) : #(Iio i) < 𝔠 := by
    have h : (#β).ord = typeLT β := by
      simp [β, Cardinal.mk_toType, Ordinal.type_toType]
    simpa [β, Cardinal.mk_toType] using Cardinal.mk_Iio_lt i h
  let value (i : β) (prev : ∀ j : β, j < i → (Fin n → X)) : Fin n → X :=
    (exists_mem_avoiding_small D (B i).val (B i).property.1 (B i).property.2
      (fun k => range (fun j : Iio i => prev j.val j.property k))
      (fun _ => Cardinal.mk_range_le.trans_lt (hIio i))).choose
  let f : β → Fin n → X := wellFounded_lt.fix value
  have hsel (i : β) : f i ∈ (B i).val ∧
      ∀ k : Fin n, f i k ∉ range (fun j : Iio i => f j.val k) := by
    rw [show f i = value i (fun j _ => f j) from wellFounded_lt.fix_eq value i]
    exact (exists_mem_avoiding_small D (B i).val (B i).property.1 (B i).property.2
      (fun k => range (fun j : Iio i => f j.val k))
      (fun _ => Cardinal.mk_range_le.trans_lt (hIio i))).choose_spec
  let G := range f
  refine ⟨G, ?_, ?_⟩
  · have hmeet (s : Set (Fin n → X)) (hs : MeasurableSet s) (hpos : μ s ≠ 0) : (G ∩ s).Nonempty := by
      let a : α := ⟨s,hs,hpos⟩
      exact ⟨f (e a), mem_range_self _, by simpa only [hB] using (hsel (e a)).1⟩
    have hzero : μ (toMeasurable μ G)ᶜ = 0 := by
      by_contra h
      obtain ⟨x,hxG,hxc⟩ := hmeet _ (measurableSet_toMeasurable μ G).compl h
      exact hxc (subset_toMeasurable μ G hxG)
    have hfull := measure_compl (μ := μ) (measurableSet_toMeasurable μ G) (measure_ne_top μ _)
    rw [hzero, measure_univ, measure_toMeasurable] at hfull
    have hle : 1 ≤ μ G := tsub_eq_zero_iff_le.mp hfull.symm
    have hupper := measure_mono (μ := μ) (subset_univ G)
    rw [measure_univ] at hupper
    exact le_antisymm hupper hle
  · intro k x hx y hy he
    obtain ⟨i,hi⟩ := hx
    obtain ⟨j,hj⟩ := hy
    rw [← hi, ← hj] at he ⊢
    rcases lt_trichotomy i j with h | rfl | h
    · exact ((hsel j).2 k ⟨⟨i,h⟩,he⟩).elim
    · rfl
    · exact ((hsel i).2 k ⟨⟨j,h⟩,he.symm⟩).elim

end AgnosticVC
