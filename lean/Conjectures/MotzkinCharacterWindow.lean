import Conjectures.MotzkinCharacterWindowGeometry
import Conjectures.MotzkinMeasure
import Mathlib.Topology.Algebra.ContinuousMonoidHom

/-! The literal fixed witness from the note: the preimage of `[0,h)` has
measure exactly `h` when `h` is the smaller character distance. This works
for finite-image characters as well as full-circle images. -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure
open RationalIntervals

variable {G : Type*} [AddCommGroup G]

def characterWindow (χ : G →+ UnitAddCircle) (h : ℝ) : Set G :=
  χ ⁻¹' initialWindow h

theorem mem_characterWindow (χ : G →+ UnitAddCircle) (h : ℝ) (h1 : h ≤ 1) (x : G) :
    x ∈ characterWindow χ h ↔ representative (χ x) < h :=
  mem_initialWindow h h1 (χ x)

theorem measurable_characterWindow [MeasurableSpace G]
    (χ : G →+ UnitAddCircle) (hχ : Measurable χ) (h : ℝ) (h1 : h ≤ 1) :
    MeasurableSet (characterWindow χ h) := (measurable_initialWindow h h1).preimage hχ

theorem characterWindow_avoids_step (χ : G →+ UnitAddCircle) (h : ℝ) (hh : h ≤ 1/2)
    (a : G) (ha : h ≤ ‖χ a‖) : ∀ x ∈ characterWindow χ h, x+a ∉ characterWindow χ h := by
  intro x hx hxa
  have hlt := initialWindow_norm_sub_lt h hh hx hxa
  have he : χ (x+a)-χ x=χ a := by rw [map_add]; abel
  rw [he] at hlt
  exact (not_lt_of_ge ha) hlt

theorem exists_character_norm_preimage (χ : G →+ UnitAddCircle) (a : G) :
    ∃ c : G, χ c=((‖χ a‖:ℝ):UnitAddCircle) := by
  rcases coe_norm_eq_or_neg (χ a) with he | he
  · exact ⟨a,he.symm⟩
  · exact ⟨-a,(map_neg χ a).trans he.symm⟩

theorem exists_character_min_preimage (χ : G →+ UnitAddCircle) (a b : G) :
    ∃ c : G, χ c=((min ‖χ a‖ ‖χ b‖:ℝ):UnitAddCircle) := by
  rcases le_total ‖χ a‖ ‖χ b‖ with hab | hba
  · rw [min_eq_left hab]
    exact exists_character_norm_preimage χ a
  · rw [min_eq_right hba]
    exact exists_character_norm_preimage χ b

theorem indicator_characterWindow (χ : G →+ UnitAddCircle) (h : ℝ) (h1 : h ≤ 1) (x : G) :
    indicator (characterWindow χ h) x=if representative (χ x) < h then 1 else 0 := by
  classical
  simp only [indicator,Set.indicator_apply,mem_characterWindow χ h h1 x]

theorem integrable_characterRepresentative [MeasurableSpace G]
    (μ : Measure G) [IsFiniteMeasure μ] (χ : G →+ UnitAddCircle) (hχ : Measurable χ) :
    Integrable (fun x => representative (χ x)) μ := by
  apply (integrable_const (1:ℝ)).mono' (measurable_representative.comp hχ).aestronglyMeasurable
  exact Filter.Eventually.of_forall fun x => by
    rw [Real.norm_of_nonneg (representative_mem (χ x)).1]
    exact (representative_mem (χ x)).2.le

/-- If the circle endpoint is in the character image, the fixed half-open
window has exactly its length. Integrating the representative identity proves
this without classifying the image subgroup. -/
theorem characterWindow_measure [MeasurableSpace G] [MeasurableAdd G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (χ : G →+ UnitAddCircle) (hχ : Measurable χ)
    (h : ℝ) (h0 : 0 ≤ h) (h1 : h ≤ 1) (c : G) (hc : χ c=(h:UnitAddCircle)) :
    μ.real (characterWindow χ h)=h := by
  let f : G → ℝ := fun x => representative (χ x)
  have hf : Integrable f μ := integrable_characterRepresentative μ χ hχ
  have hm := measurable_characterWindow χ hχ h h1
  have hi := integrable_indicator μ hm
  have heq (x : G) : f (-c+x)=f x-h+indicator (characterWindow χ h) x := by
    have hshift : χ (-c+x)=χ x-(h:UnitAddCircle) := by
      rw [map_add,map_neg,hc]
      abel
    dsimp only [f]
    rw [hshift,representative_sub_window (χ x) h h0 h1,
      indicator_characterWindow χ h h1 x]
  have hint : (∫ x, f (-c+x) ∂μ)=
      (∫ x, f x-h+indicator (characterWindow χ h) x ∂μ) :=
    integral_congr_ae (Filter.Eventually.of_forall heq)
  have hconst : (∫ _x : G, h ∂μ)=h := by simp
  rw [integral_add_left_eq_self f (-c),
    integral_add (hf.sub (integrable_const h)) hi,
    integral_sub hf (integrable_const h),integral_indicator μ hm,hconst] at hint
  linarith

/-- The exact unshifted half-open witness, including the zero-score case. -/
theorem character_window_exact [MeasurableSpace G] [MeasurableAdd G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (χ : G →+ UnitAddCircle) (hχ : Measurable χ) (a b : G) :
    MeasurableSet (characterWindow χ (min ‖χ a‖ ‖χ b‖)) ∧
      Avoids (characterWindow χ (min ‖χ a‖ ‖χ b‖)) a b ∧
      μ.real (characterWindow χ (min ‖χ a‖ ‖χ b‖))=min ‖χ a‖ ‖χ b‖ := by
  let h : ℝ := min ‖χ a‖ ‖χ b‖
  have h0 : 0 ≤ h := le_min (norm_nonneg _) (norm_nonneg _)
  have hh : h ≤ 1/2 := by
    have hn := AddCircle.norm_le_half_period (1:ℝ) (x := χ a) (by norm_num)
    have hle : h ≤ ‖χ a‖ := min_le_left _ _
    norm_num only [abs_one] at hn
    linarith
  have h1 : h ≤ 1 := by linarith
  obtain ⟨c,hc⟩ := exists_character_min_preimage χ a b
  refine ⟨measurable_characterWindow χ hχ h h1,?_,
    characterWindow_measure μ χ hχ h h0 h1 c hc⟩
  intro x hx
  exact ⟨characterWindow_avoids_step χ h hh a (min_le_left _ _) x hx,
    characterWindow_avoids_step χ h hh b (min_le_right _ _) x hx⟩

theorem continuous_character_window_exact [TopologicalSpace G] [IsTopologicalAddGroup G]
    [MeasurableSpace G] [BorelSpace G]
    (μ : Measure G) [IsProbabilityMeasure μ] [IsAddLeftInvariant μ]
    (χ : G →ₜ+ UnitAddCircle) (a b : G) :
    MeasurableSet (characterWindow χ.toAddMonoidHom (min ‖χ a‖ ‖χ b‖)) ∧
      Avoids (characterWindow χ.toAddMonoidHom (min ‖χ a‖ ‖χ b‖)) a b ∧
      μ.real (characterWindow χ.toAddMonoidHom (min ‖χ a‖ ‖χ b‖))=min ‖χ a‖ ‖χ b‖ :=
  character_window_exact μ χ.toAddMonoidHom χ.continuous.measurable a b

end Motzkin
