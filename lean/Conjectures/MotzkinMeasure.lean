import Mathlib.MeasureTheory.Group.Integral
import Mathlib.MeasureTheory.Integral.Average
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-! Haar-measure bounds and finite-window averaging for two forbidden
differences. These statements use actual measurable sets and probability measures. -/
namespace Motzkin

open MeasureTheory
open MeasureTheory.Measure
open scoped BigOperators

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd G]

def Avoids (A : Set G) (a b : G) : Prop :=
  ∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A

noncomputable def indicator (A : Set G) : G → ℝ := A.indicator (fun _ => 1)

omit [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd G] in
@[simp] theorem indicator_of_mem {A : Set G} {x : G} (hx : x ∈ A) :
    indicator A x = 1 := Set.indicator_of_mem hx _

omit [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd G] in
@[simp] theorem indicator_of_not_mem {A : Set G} {x : G} (hx : x ∉ A) :
    indicator A x = 0 := Set.indicator_of_notMem hx _

omit [MeasurableSpace G] [MeasurableAdd G] in
theorem avoiding_indicator_le {A : Set G} {a : G}
    (ha : ∀ x ∈ A, x+a ∉ A) (x : G) :
    indicator A x+indicator A (a+x) ≤ 1 := by
  by_cases hx : x ∈ A
  · have hn : a+x ∉ A := by simpa only [add_comm a x] using ha x hx
    rw [indicator_of_mem hx,indicator_of_not_mem hn]
    norm_num
  · rw [indicator_of_not_mem hx,zero_add]
    by_cases ht : a+x ∈ A
    · rw [indicator_of_mem ht]
    · rw [indicator_of_not_mem ht]
      norm_num

omit [AddCommGroup G] [MeasurableAdd G] in
theorem integrable_indicator (μ : Measure G) [IsFiniteMeasure μ]
    {A : Set G} (hA : MeasurableSet A) : Integrable (indicator A) μ :=
  (integrable_const (1:ℝ)).indicator hA

omit [AddCommGroup G] [MeasurableAdd G] in
theorem integral_indicator (μ : Measure G) {A : Set G} (hA : MeasurableSet A) :
    ∫ x, indicator A x ∂μ = μ.real A := integral_indicator_one hA

/-- One forbidden translation already imposes the universal one-half bound. -/
theorem avoiding_measure_le_half (μ : Measure G) [IsProbabilityMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) {a : G}
    (ha : ∀ x ∈ A, x+a ∉ A) : μ.real A ≤ 1/2 := by
  have hi := integrable_indicator μ hA
  have ht := hi.comp_add_left a
  have hb := integral_mono (hi.add ht) (integrable_const (1:ℝ))
    (avoiding_indicator_le ha)
  change (∫ x, indicator A x+indicator A (a+x) ∂μ) ≤ (∫ _ : G, (1:ℝ) ∂μ) at hb
  rw [MeasureTheory.integral_add hi ht,
    integral_add_left_eq_self (indicator A) a,integral_indicator μ hA] at hb
  have hc : (∫ _ : G, (1:ℝ) ∂μ) = 1 := by simp
  rw [hc] at hb
  linarith

noncomputable def translatedCount (A : Set G) (B : Finset G) (t : G) : ℕ := by
  classical
  exact (B.filter (fun b => b+t ∈ A)).card

omit [MeasurableSpace G] [MeasurableAdd G] in
theorem translatedCount_eq_sum (A : Set G) (B : Finset G) (t : G) :
    (translatedCount A B t : ℝ) = ∑ b ∈ B, indicator A (b+t) := by
  classical
  simp only [translatedCount,Finset.card_filter,indicator,Set.indicator_apply]
  push_cast
  rfl

theorem integrable_translatedCount (μ : Measure G) [IsFiniteMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) (B : Finset G) :
    Integrable (fun t => (translatedCount A B t : ℝ)) μ := by
  simp only [translatedCount_eq_sum]
  exact integrable_finsetSum B (fun b _ => (integrable_indicator μ hA).comp_add_left b)

theorem integral_translatedCount (μ : Measure G) [IsFiniteMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) (B : Finset G) :
    (∫ t, (translatedCount A B t : ℝ) ∂μ) = (B.card:ℝ)*μ.real A := by
  simp only [translatedCount_eq_sum]
  rw [integral_finsetSum B (fun b _ => (integrable_indicator μ hA).comp_add_left b)]
  simp only [integral_add_left_eq_self,integral_indicator μ hA,Finset.sum_const,
    nsmul_eq_mul]

/-- Some translated finite window has occupied fraction at least the Haar
measure. No compactness or freeness assumption on the finite window is needed. -/
theorem exists_translatedCount_ge (μ : Measure G) [IsProbabilityMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) (B : Finset G) :
    ∃ t : G, (B.card:ℝ)*μ.real A ≤ (translatedCount A B t : ℝ) := by
  obtain ⟨t,ht⟩ := exists_integral_le (integrable_translatedCount μ hA B)
  rw [integral_translatedCount μ hA B] at ht
  exact ⟨t,ht⟩

end Motzkin
