import Conjectures.LonelinessHyperplaneBoundary
import Conjectures.LonelinessHyperplaneResidueKernel

/-! Comparing residue-class counts by an exact integer-kernel translation.
The loss consists of coordinate boundary strips and shifted coordinate
equalities. Real admissibility makes every such wall independent of the
normal, so the loss has one lower power of the box size. -/

namespace Loneliness.Hyperplane

open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def boundaryLevels (D N : ℕ) : Finset ℤ :=
  ((Finset.range D).image (fun j : ℕ => (j : ℤ) + 1)) ∪
    ((Finset.range D).image (fun j : ℕ => (N : ℤ) - (j : ℤ)))

theorem boundaryLevels_card_le (D N : ℕ) : (boundaryLevels D N).card ≤ 2 * D := by
  unfold boundaryLevels
  calc
    _ ≤ ((Finset.range D).image (fun j : ℕ => (j : ℤ) + 1)).card +
        ((Finset.range D).image (fun j : ℕ => (N : ℤ) - (j : ℤ))).card :=
      Finset.card_union_le _ _
    _ ≤ (Finset.range D).card + (Finset.range D).card :=
      Nat.add_le_add Finset.card_image_le Finset.card_image_le
    _ = _ := by simp; omega

theorem mem_boundaryLevels_of_translation_failure
    (D N : ℕ) (x z : ℤ) (hx : 1 ≤ x ∧ x ≤ (N : ℤ))
    (hz : |z| ≤ (D : ℤ))
    (hbad : ¬ (1 ≤ x + z ∧ x + z ≤ (N : ℤ))) : x ∈ boundaryLevels D N := by
  have hz' := abs_le.mp hz
  by_cases hlo : 1 ≤ x + z
  · have hupper : (N : ℤ) < x + z := by omega
    have hcast : (((N : ℤ) - x).toNat : ℤ) = (N : ℤ) - x :=
      Int.toNat_of_nonneg (by omega)
    apply Finset.mem_union_right
    apply Finset.mem_image.mpr
    refine ⟨((N : ℤ) - x).toNat, Finset.mem_range.mpr (by omega), ?_⟩
    omega
  · have hcast : ((x - 1).toNat : ℤ) = x - 1 :=
      Int.toNat_of_nonneg (by omega)
    apply Finset.mem_union_left
    apply Finset.mem_image.mpr
    refine ⟨(x - 1).toNat, Finset.mem_range.mpr (by omega), ?_⟩
    omega

def coordinateTranslationBoundary (m δ : ι → ℤ) (N : ℕ) : Finset (ι → Fin N) :=
  Finset.univ.biUnion (fun i : ι => positiveBoxAffineStrip m (coordinateFrequency i)
    (boundaryLevels (normalSize δ) N) N)

def collisionTranslationBoundary (m δ : ι → ℤ) (N : ℕ) : Finset (ι → Fin N) :=
  Finset.univ.biUnion (fun i : ι => Finset.univ.biUnion (fun j : ι =>
    if i = j then ∅ else
      positiveBoxAffineRelation m (differenceFrequency i j) (δ j - δ i) N))

def translationBoundary (m δ : ι → ℤ) (N : ℕ) : Finset (ι → Fin N) :=
  coordinateTranslationBoundary m δ N ∪ collisionTranslationBoundary m δ N

def translationBoundaryConstant (δ : ι → ℤ) : ℕ :=
  2 * Fintype.card ι * normalSize δ + Fintype.card ι * Fintype.card ι

theorem coordinateTranslationBoundary_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (δ : ι → ℤ) (N : ℕ) :
    (coordinateTranslationBoundary m δ N).card ≤
      (2 * Fintype.card ι * normalSize δ) * N ^ (Fintype.card ι - 2) := by
  classical
  unfold coordinateTranslationBoundary
  calc
    _ ≤ ∑ i : ι, (positiveBoxAffineStrip m (coordinateFrequency i)
        (boundaryLevels (normalSize δ) N) N).card := Finset.card_biUnion_le
    _ ≤ ∑ _i : ι, (2 * normalSize δ) * N ^ (Fintype.card ι - 2) := by
      apply Finset.sum_le_sum
      intro i _
      exact (positiveBoxAffineStrip_card_le m hm (coordinateFrequency i)
        (coordinateFrequency_not_multiple m hreal i) _ N).trans
        (Nat.mul_le_mul_right _ (boundaryLevels_card_le (normalSize δ) N))
    _ = _ := by simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, Nat.cast_id]; ring

theorem collisionTranslationBoundary_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (δ : ι → ℤ) (N : ℕ) :
    (collisionTranslationBoundary m δ N).card ≤
      (Fintype.card ι * Fintype.card ι) * N ^ (Fintype.card ι - 2) := by
  classical
  unfold collisionTranslationBoundary
  calc
    _ ≤ ∑ i : ι, (Finset.univ.biUnion (fun j : ι =>
        if i = j then ∅ else
          positiveBoxAffineRelation m (differenceFrequency i j) (δ j - δ i) N)).card :=
      Finset.card_biUnion_le
    _ ≤ ∑ _i : ι, Fintype.card ι * N ^ (Fintype.card ι - 2) := by
      apply Finset.sum_le_sum
      intro i _
      calc
        _ ≤ ∑ j : ι, (if i = j then ∅ else
            positiveBoxAffineRelation m (differenceFrequency i j) (δ j - δ i) N).card :=
          Finset.card_biUnion_le
        _ ≤ ∑ _j : ι, N ^ (Fintype.card ι - 2) := by
          apply Finset.sum_le_sum
          intro j _
          by_cases hij : i = j
          · simp only [ite_eq_left hij, Finset.card_empty]
            exact Nat.zero_le _
          · rw [ite_eq_right hij]
            exact positiveBoxAffineRelation_card_le m hm (differenceFrequency i j)
              (differenceFrequency_not_multiple m hreal i j hij) _ N
        _ = _ := by simp
    _ = _ := by simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, Nat.cast_id]; ring

theorem translationBoundary_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (δ : ι → ℤ) (N : ℕ) :
    (translationBoundary m δ N).card ≤
      translationBoundaryConstant δ * N ^ (Fintype.card ι - 2) := by
  calc
    _ ≤ (coordinateTranslationBoundary m δ N).card +
        (collisionTranslationBoundary m δ N).card := Finset.card_union_le _ _
    _ ≤ (2 * Fintype.card ι * normalSize δ) * N ^ (Fintype.card ι - 2) +
        (Fintype.card ι * Fintype.card ι) * N ^ (Fintype.card ι - 2) :=
      Nat.add_le_add (coordinateTranslationBoundary_card_le m hm hreal δ N)
        (collisionTranslationBoundary_card_le m hm hreal δ N)
    _ = _ := by rw [translationBoundaryConstant, Nat.add_mul]

theorem translated_coordinates_bounds
    (m δ : ι → ℤ) {N : ℕ} (v : ι → Fin N)
    (hv : integerPairing m (positiveBoxCoordinates v) = 0)
    (hout : v ∉ translationBoundary m δ N) :
    ∀ i, 1 ≤ (positiveBoxCoordinates v + δ) i ∧
      (positiveBoxCoordinates v + δ) i ≤ (N : ℤ) := by
  intro i
  by_contra hbad
  have hlevel := mem_boundaryLevels_of_translation_failure (normalSize δ) N
    (positiveBoxCoordinates v i) (δ i) (positiveBoxCoordinates_bounds v i)
    (abs_le_normalSize δ i) hbad
  apply hout
  apply Finset.mem_union_left
  apply Finset.mem_biUnion.mpr
  refine ⟨i, Finset.mem_univ i, ?_⟩
  apply Finset.mem_filter.mpr
  refine ⟨Finset.mem_univ v, hv, ?_⟩
  simpa only [integerPairing_coordinateFrequency] using hlevel

theorem translated_coordinates_injective
    (m δ : ι → ℤ) {N : ℕ} (v : ι → Fin N)
    (hv : integerPairing m (positiveBoxCoordinates v) = 0)
    (hout : v ∉ translationBoundary m δ N) :
    Function.Injective (positiveBoxCoordinates v + δ) := by
  intro i j hij
  by_contra hne
  apply hout
  apply Finset.mem_union_right
  apply Finset.mem_biUnion.mpr
  refine ⟨i, Finset.mem_univ i, Finset.mem_biUnion.mpr ?_⟩
  refine ⟨j, Finset.mem_univ j, ?_⟩
  rw [ite_eq_right hne]
  apply Finset.mem_filter.mpr
  refine ⟨Finset.mem_univ v, hv, ?_⟩
  rw [integerPairing_differenceFrequency]
  change positiveBoxCoordinates v i + δ i = positiveBoxCoordinates v j + δ j at hij
  omega

def positiveBoxResidue (m : ι → ℤ) (Q : ℕ) (r : ι → ZMod Q) (N : ℕ) :
    Finset (ι → Fin N) :=
  (positiveBoxAdmissible m N).filter
    (fun v => ∀ i, (positiveBoxCoordinates v i : ZMod Q) = r i)

/-- An exact lattice translation injects every source point outside its
boundary loss into the destination residue class in the same box. -/
theorem positiveBoxResidue_translation_card_le
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (Q : ℕ) (r s : ι → ZMod Q) (δ : ι → ℤ)
    (hδ : integerPairing m δ = 0)
    (hres : ∀ i, r i + (δ i : ZMod Q) = s i) (N : ℕ) :
    (positiveBoxResidue m Q r N).card ≤ (positiveBoxResidue m Q s N).card +
      translationBoundaryConstant δ * N ^ (Fintype.card ι - 2) := by
  classical
  let X := positiveBoxResidue m Q r N \ translationBoundary m δ N
  have hxkernel : ∀ x : X, integerPairing m (positiveBoxCoordinates x.1) = 0 := by
    intro x
    exact (Finset.mem_filter.mp
      (Finset.mem_filter.mp (Finset.mem_sdiff.mp x.2).1).1).2.1
  have hxout : ∀ x : X, x.1 ∉ translationBoundary m δ N := by
    intro x
    exact (Finset.mem_sdiff.mp x.2).2
  have hxbox : ∀ x : X, ∃ v : ι → Fin N,
      positiveBoxCoordinates v = positiveBoxCoordinates x.1 + δ := by
    intro x
    exact exists_positiveBoxCoordinates _
      (translated_coordinates_bounds m δ x.1 (hxkernel x) (hxout x))
  choose F hF using hxbox
  have hFmem : ∀ x : X, F x ∈ positiveBoxResidue m Q s N := by
    intro x
    apply Finset.mem_filter.mpr
    constructor
    · apply Finset.mem_filter.mpr
      refine ⟨Finset.mem_univ _, ?_, ?_⟩
      · rw [hF, integerPairing_add, hxkernel, hδ, add_zero]
      · have hcoords : Function.Injective (positiveBoxCoordinates (F x)) := by
          rw [hF]
          exact translated_coordinates_injective m δ x.1 (hxkernel x) (hxout x)
        intro i j hij
        apply hcoords
        exact congrArg (positiveBoxEntry (N := N)) hij
    · intro i
      have hxr := (Finset.mem_filter.mp (Finset.mem_sdiff.mp x.2).1).2 i
      rw [hF]
      change ((positiveBoxCoordinates x.1 i + δ i : ℤ) : ZMod Q) = s i
      rw [Int.cast_add, hxr, hres]
  let G : X → positiveBoxResidue m Q s N := fun x => ⟨F x, hFmem x⟩
  have hG : Function.Injective G := by
    intro x y hxy
    apply Subtype.ext
    apply positiveBoxCoordinates_injective N
    have hFxy : F x = F y := congrArg Subtype.val hxy
    have heq := congrArg (positiveBoxCoordinates (ι := ι)) hFxy
    rw [hF x, hF y] at heq
    exact add_right_cancel heq
  have hgood : X.card ≤ (positiveBoxResidue m Q s N).card := by
    simpa only [Fintype.card_coe] using Fintype.card_le_of_injective G hG
  calc
    _ ≤ X.card + (translationBoundary m δ N).card :=
      Finset.card_le_card_sdiff_add_card
    _ ≤ _ := Nat.add_le_add hgood (translationBoundary_card_le m hm hreal δ N)

theorem exists_residue_count_one_sided_bound
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (Q : ℕ) (hQ : 0 < Q) (r s : ι → ZMod Q)
    (hr : residueNormalHom m Q r = 0) (hs : residueNormalHom m Q s = 0) :
    ∃ C : ℕ, ∀ N : ℕ,
      (positiveBoxResidue m Q r N).card ≤ (positiveBoxResidue m Q s N).card +
        C * N ^ (Fintype.card ι - 2) := by
  obtain ⟨δ, hδ, hres⟩ := exists_integer_kernel_residue_translation m hm Q hQ r s hr hs
  exact ⟨translationBoundaryConstant δ,
    positiveBoxResidue_translation_card_le m hm hreal Q r s δ hδ hres⟩

/-- Counts in any two genuine residue-kernel classes differ by at most
a fixed multiple of `N^(k-2)`. The bound includes every finite box. -/
theorem exists_residue_count_difference_bound
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (Q : ℕ) (hQ : 0 < Q) (r s : ι → ZMod Q)
    (hr : residueNormalHom m Q r = 0) (hs : residueNormalHom m Q s = 0) :
    ∃ C : ℕ, ∀ N : ℕ,
      |((positiveBoxResidue m Q r N).card : ℤ) -
          ((positiveBoxResidue m Q s N).card : ℤ)| ≤
        (C : ℤ) * (N : ℤ) ^ (Fintype.card ι - 2) := by
  obtain ⟨C₁, h₁⟩ := exists_residue_count_one_sided_bound m hm hreal Q hQ r s hr hs
  obtain ⟨C₂, h₂⟩ := exists_residue_count_one_sided_bound m hm hreal Q hQ s r hs hr
  refine ⟨max C₁ C₂, ?_⟩
  intro N
  have h₁' : (positiveBoxResidue m Q r N).card ≤
      (positiveBoxResidue m Q s N).card + max C₁ C₂ * N ^ (Fintype.card ι - 2) :=
    (h₁ N).trans (Nat.add_le_add_left
      (Nat.mul_le_mul_right _ (le_max_left C₁ C₂)) _)
  have h₂' : (positiveBoxResidue m Q s N).card ≤
      (positiveBoxResidue m Q r N).card + max C₁ C₂ * N ^ (Fintype.card ι - 2) :=
    (h₂ N).trans (Nat.add_le_add_left
      (Nat.mul_le_mul_right _ (le_max_right C₁ C₂)) _)
  have h₁Z : ((positiveBoxResidue m Q r N).card : ℤ) ≤
      ((positiveBoxResidue m Q s N).card : ℤ) +
        ((max C₁ C₂ : ℕ) : ℤ) * (N : ℤ) ^ (Fintype.card ι - 2) := by
    exact_mod_cast h₁'
  have h₂Z : ((positiveBoxResidue m Q s N).card : ℤ) ≤
      ((positiveBoxResidue m Q r N).card : ℤ) +
        ((max C₁ C₂ : ℕ) : ℤ) * (N : ℤ) ^ (Fintype.card ι - 2) := by
    exact_mod_cast h₂'
  exact abs_le.mpr ⟨by omega, by omega⟩

end

end Loneliness.Hyperplane
