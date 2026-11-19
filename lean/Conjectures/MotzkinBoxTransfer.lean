import Conjectures.MotzkinBoxes
import Conjectures.MotzkinAveraging
import Conjectures.MotzkinFinite

/-! Haar averaging over an interior box transfers an avoiding set to an actual
independent set in a finite quotient, with the exact cardinality ratio. -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure

theorem closure_pair_image {H Q : Type*} [AddCommGroup H] [AddCommGroup Q]
    (q : H →+ Q) (hq : Function.Surjective q) (a b : H)
    (hgen : AddSubgroup.closure ({a,b} : Set H)=⊤) :
    AddSubgroup.closure ({q a,q b} : Set Q)=⊤ := by
  have h := q.map_closure ({a,b} : Set H)
  rw [hgen,AddSubgroup.map_top_of_surjective q hq] at h
  simpa only [Set.image_insert_eq,Set.image_singleton] using h.symm

variable {F I G : Type*} [AddCommGroup F] [Fintype F] [Fintype I]
variable [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd G]

theorem box_measure_character (μ : Measure G) [IsProbabilityMeasure μ]
    [IsAddLeftInvariant μ] (f : (F × (I → ℤ)) →+ G)
    (a b : F × (I → ℤ)) (hgen : AddSubgroup.closure ({a,b} : Set (F × (I → ℤ)))=⊤)
    {A : Set G} (hA : MeasurableSet A) (havoid : Avoids A (f a) (f b))
    (L m : ℕ) (hm : 0 < m)
    (ha : ∀ i, |a.2 i| ≤ (L:ℤ)) (hb : ∀ i, |b.2 i| ≤ (L:ℤ)) :
    ∃ ψ : (F × (I → ℤ)) →+ UnitAddCircle,
      μ.real A * ((m:ℝ)/(m+2*L:ℝ))^Fintype.card I ≤ min ‖ψ a‖ ‖ψ b‖ := by
  classical
  let _ : NeZero (m+2*L) := ⟨by omega⟩
  let Q := F × (I → ZMod (m+2*L))
  let J := F × (I → Fin m)
  let q : (F × (I → ℤ)) →+ Q := boxQuotient (m+2*L)
  obtain ⟨t,ht⟩ := exists_familyCount_ge μ hA (fun x : J => f (boxLift L x))
  let S : Finset J := Finset.univ.filter (fun x => f (boxLift L x)+t ∈ A)
  let B : Finset Q := S.image (boxProject L m)
  have hcard : B.card=familyCount A (fun x : J => f (boxLift L x)) t := by
    rw [Finset.card_image_of_injective S (boxProject_injective L m)]
    rfl
  have hno (δ : F × (I → ℤ)) (hδ : ∀ i, |δ.2 i| ≤ (L:ℤ))
      (hstep : ∀ z ∈ A, z+f δ ∉ A) : ∀ z ∈ B, z+q δ ∉ B := by
    intro z hz hzδ
    obtain ⟨x,hx,rfl⟩ := Finset.mem_image.mp hz
    obtain ⟨y,hy,he⟩ := Finset.mem_image.mp hzδ
    have hexy := boxLift_eq_of_project_step L m δ hδ x y he
    have hxA : f (boxLift L x)+t ∈ A := (Finset.mem_filter.mp hx).2
    have hyA : f (boxLift L y)+t ∈ A := (Finset.mem_filter.mp hy).2
    have heA : f (boxLift L y)+t=(f (boxLift L x)+t)+f δ := by
      rw [hexy,map_add]
      abel
    rw [heA] at hyA
    exact hstep _ hxA hyA
  have hB : ∀ z ∈ B, z+q a ∉ B ∧ z+q b ∉ B := by
    intro z hz
    exact ⟨hno a ha (fun w hw => (havoid w hw).1) z hz,
      hno b hb (fun w hw => (havoid w hw).2) z hz⟩
  have hgenQ : AddSubgroup.closure ({q a,q b} : Set Q)=⊤ :=
    closure_pair_image q (boxQuotient_surjective (m+2*L)) a b hgen
  obtain ⟨χ,hχ⟩ := finite_independent_character (q a) (q b) hgenQ B hB
  have hQ : (0:ℝ) < Fintype.card Q := by exact_mod_cast Fintype.card_pos
  have hocc : (Fintype.card J:ℝ)*μ.real A ≤ (B.card:ℝ) := by rwa [hcard]
  have hratio : (Fintype.card J:ℝ)/(Fintype.card Q:ℝ) =
      ((m:ℝ)/(m+2*L:ℝ))^Fintype.card I := by
    have hF : (Fintype.card F:ℝ) ≠ 0 := by exact_mod_cast Fintype.card_ne_zero
    change (Fintype.card (F × (I → Fin m)):ℝ)/(Fintype.card (F × (I → ZMod (m+2*L))):ℝ)=_
    rw [box_index_card,box_quotient_card]
    push_cast
    rw [mul_div_mul_left _ _ hF,div_pow]
  refine ⟨χ.comp q,?_⟩
  change μ.real A * ((m:ℝ)/(m+2*L:ℝ))^Fintype.card I ≤ min ‖χ (q a)‖ ‖χ (q b)‖
  rw [← hratio]
  calc
    μ.real A*((Fintype.card J:ℝ)/(Fintype.card Q:ℝ)) =
        ((Fintype.card J:ℝ)*μ.real A)/(Fintype.card Q:ℝ) := by ring
    _ ≤ (B.card:ℝ)/(Fintype.card Q:ℝ) := div_le_div_of_nonneg_right hocc hQ.le
    _ ≤ min ‖χ (q a)‖ ‖χ (q b)‖ := hχ

end Motzkin
