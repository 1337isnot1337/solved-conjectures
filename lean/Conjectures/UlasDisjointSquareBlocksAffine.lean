import Conjectures.UlasDisjointSquareBlocksParity
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic.Linarith

/-!
# Repeating affine square-product block families

Section 1 of the repository's Ulas argument constructs a fixed finite family
of affine starts. This file checks the exact passage from such a family to
arbitrarily distant disjoint blocks of the same fixed cardinality.
-/

open Finset

namespace UlasDisjointSquareBlocks

/-- Positive slopes and separated equal-slope offsets make an affine family
disjoint after a finite threshold. A square-product identity then gives a
repeatable block count, preserving the cardinality of the index set. -/
theorem repeatable_of_affine_family {ι : Type*} [DecidableEq ι]
    (s : Finset ι) {length : ℕ} (hlength : 0 < length) (slope offset : ι → ℕ)
    (hslope : ∀ i ∈ s, 0 < slope i)
    (hoffset : ∀ i ∈ s, ∀ j ∈ s, i ≠ j → slope i = slope j →
      offset i + length ≤ offset j ∨ offset j + length ≤ offset i)
    (hsquare : ∀ t : ℕ, IsSquare (∏ i ∈ s,
      blockProduct length (slope i * t + offset i))) :
    Repeatable length s.card := by
  intro T
  let t := T + s.sup offset + length + 1
  let start := fun i => slope i * t + offset i
  have htpos : 0 < t := by dsimp [t]; omega
  have hT : T ≤ t := by dsimp [t]; omega
  have hbound : ∀ i ∈ s, offset i + length ≤ t := by
    intro i hi
    have hi' := Finset.le_sup (f := offset) hi
    dsimp [t]
    omega
  have hstart : ∀ i ∈ s, t ≤ start i := by
    intro i hi
    have hsl := hslope i hi
    dsimp [start]
    nlinarith
  have hltsep : ∀ i ∈ s, ∀ j ∈ s, slope i < slope j →
      start i + length ≤ start j := by
    intro i hi j _ hij
    have hib := hbound i hi
    have hm : (slope i + 1) * t ≤ slope j * t :=
      Nat.mul_le_mul_right t hij
    dsimp [start]
    nlinarith
  have hpair : ∀ i ∈ s, ∀ j ∈ s, i ≠ j →
      start i + length ≤ start j ∨ start j + length ≤ start i := by
    intro i hi j hj hij
    rcases lt_trichotomy (slope i) (slope j) with hlt | heq | hgt
    · exact Or.inl (hltsep i hi j hj hlt)
    · rcases hoffset i hi j hj hij heq with hle | hle
      · left
        dsimp [start]
        rw [heq]
        omega
      · right
        dsimp [start]
        rw [heq]
        omega
    · exact Or.inr (hltsep j hj i hi hgt)
  have hinj : Set.InjOn start s := by
    intro i hi j hj heq
    by_contra hij
    rcases hpair i hi j hj hij with hle | hle <;> omega
  refine ⟨s.image start, Finset.card_image_of_injOn hinj, ?_⟩
  refine ⟨⟨?_, ?_, ?_⟩, ?_⟩
  · intro a ha
    obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp ha
    exact htpos.trans_le (hstart i hi)
  · intro a ha b hb hab
    obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp ha
    obtain ⟨j, hj, rfl⟩ := Finset.mem_image.mp hb
    have hij : i ≠ j := by intro h; subst j; omega
    rcases hpair i hi j hj hij with hle | hle
    · exact hle
    · omega
  · rw [Finset.prod_image hinj]
    exact hsquare t
  · intro a ha
    obtain ⟨i, hi, rfl⟩ := Finset.mem_image.mp ha
    exact hT.trans (hstart i hi)

/-- An overfull finite factor encoding of affine block products supplies a
positive repeatable count. Its selected subset is fixed before the tail
threshold, because the parity relation holds for every evaluation parameter. -/
theorem exists_repeatable_of_factor_encoding {ι κ : Type*}
    [Fintype ι] [Fintype κ] [DecidableEq ι]
    {length : ℕ} (hlength : 0 < length) (slope offset : ι → ℕ)
    (hslope : ∀ i, 0 < slope i)
    (hoffset : ∀ i j, i ≠ j → slope i = slope j →
      offset i + length ≤ offset j ∨ offset j + length ≤ offset i)
    (factors : ι → Multiset κ) (value : ℕ → κ → ℚ)
    (hencoding : ∀ t i, (blockProduct length (slope i * t + offset i) : ℚ) =
      ((factors i).map (value t)).prod)
    (hcard : Fintype.card κ < Fintype.card ι) :
    ∃ count : ℕ, 0 < count ∧ Repeatable length count := by
  obtain ⟨s, hs, hsquare⟩ := exists_nonempty_square_subfamily factors hcard
  refine ⟨s.card, Finset.card_pos.mpr hs,
    repeatable_of_affine_family s hlength slope offset
      (fun i _ => hslope i) (fun i _ j _ => hoffset i j) ?_⟩
  intro t
  apply Rat.isSquare_natCast_iff.mp
  rw [Nat.cast_prod]
  simp_rw [hencoding]
  exact hsquare (value t)

end UlasDisjointSquareBlocks
