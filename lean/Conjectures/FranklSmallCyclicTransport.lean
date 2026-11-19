module

public import Conjectures.FranklFCClosure

/-! Relabelling distinct unions and their exact frequencies. These lemmas
connect finite cyclic coordinates with natural-number masks and residues. -/
@[expose] public section

namespace FranklSmallCyclic

open Frankl

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

theorem generatedUnions_image_eq (f : α → β) (G : Finset (Finset α)) :
    generatedUnions (G.image (Finset.image f)) =
      (generatedUnions G).image (Finset.image f) := by
  simp only [generatedUnions, Finset.powerset_image, Finset.image_image]
  apply Finset.image_congr
  intro H _
  exact (image_generatedUnion f H).symm

theorem frequency_image (f : α → β) (hf : Function.Injective f)
    (F : Finset (Finset α)) (x : α) :
    frequency (F.image (Finset.image f)) (f x) = frequency F x := by
  have hmem : ∀ S : Finset α, f x ∈ S.image f ↔ x ∈ S := by
    intro S
    constructor
    · intro hx
      obtain ⟨y, hy, hyx⟩ := Finset.mem_image.mp hx
      exact hf hyx ▸ hy
    · exact Finset.mem_image_of_mem f
  unfold frequency
  rw [Finset.filter_image]
  simp only [hmem]
  exact Finset.card_image_of_injective _ (Finset.image_injective hf)

theorem abundant_image_iff (f : α → β) (hf : Function.Injective f)
    (F : Finset (Finset α)) (x : α) :
    Abundant (F.image (Finset.image f)) (f x) ↔ Abundant F x := by
  unfold Abundant
  rw [Finset.card_image_of_injective _ (Finset.image_injective hf), frequency_image f hf]

theorem generator_abundant_image_iff (f : α → β) (hf : Function.Injective f)
    (G : Finset (Finset α)) (x : α) :
    Abundant (generatedUnions (G.image (Finset.image f))) (f x) ↔
      Abundant (generatedUnions G) x := by
  rw [generatedUnions_image_eq]
  exact abundant_image_iff f hf _ x

end FranklSmallCyclic
