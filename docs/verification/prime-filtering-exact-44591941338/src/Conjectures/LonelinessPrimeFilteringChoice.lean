import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Finite choices for prime filtering

These counting lemmas supply the choice of a multiplier at one p-adic level
in the prime-filtering argument of Barajas and Serra, *The lonely runner with
seven runners*, Electronic Journal of Combinatorics 15 (2008), R48,
doi:10.37236/772. They do not yet prove the full filtering lemma or a runner
bound. Each forbidden set is pulled back through an actual permutation; the
union bound then gives a parameter avoiding all the sets simultaneously.
-/

open scoped BigOperators

namespace Loneliness.PrimeFiltering

/-- Fewer forbidden parameters than available parameters leave a simultaneous
choice. The separate set `B` can exclude zero at the highest p-adic level. -/
theorem exists_avoiding_permutations {ι A : Type*} [Fintype A]
    (s : Finset ι) (B : Finset A) (F : ι → Finset A) (e : ι → A ≃ A)
    (hcard : B.card + ∑ i ∈ s, (F i).card < Fintype.card A) :
    ∃ a : A, a ∉ B ∧ ∀ i ∈ s, e i a ∉ F i := by
  classical
  let U : Finset A := s.biUnion (fun i => (F i).image (e i).symm)
  have hU : U.card ≤ ∑ i ∈ s, (F i).card := by
    calc
      U.card ≤ ∑ i ∈ s, ((F i).image (e i).symm).card := Finset.card_biUnion_le
      _ = ∑ i ∈ s, (F i).card := by
        apply Finset.sum_congr rfl
        intro i _hi
        exact Finset.card_image_of_injective _ (e i).symm.injective
  have hbad : (B ∪ U).card < Fintype.card A :=
    lt_of_le_of_lt ((Finset.card_union_le B U).trans (Nat.add_le_add_left hU B.card)) hcard
  have hex : ∃ a : A, a ∉ B ∪ U := by
    by_contra hn
    have hsub : (Finset.univ : Finset A) ⊆ B ∪ U := by
      intro a _ha
      by_contra h
      exact hn ⟨a, h⟩
    have hle : Fintype.card A ≤ (B ∪ U).card := by
      simpa only [Finset.card_univ] using Finset.card_le_card hsub
    exact (Nat.not_lt_of_ge hle) hbad
  obtain ⟨a, ha⟩ := hex
  refine ⟨a, fun h => ha (Finset.mem_union_left U h), ?_⟩
  intro i hi hf
  apply ha
  apply Finset.mem_union_right
  apply Finset.mem_biUnion.mpr
  refine ⟨i, hi, Finset.mem_image.mpr ?_⟩
  exact ⟨e i a, hf, (e i).symm_apply_apply a⟩

/-- An affine map with a nonzero slope is a permutation of a field. -/
noncomputable def affinePermutation {K : Type*} [Field K]
    (a b : K) (hb : b ≠ 0) : K ≃ K where
  toFun x := a + x * b
  invFun x := (x - a) / b
  left_inv x := by simp [add_sub_cancel_left, hb]
  right_inv x := by simp [div_mul_cancel₀ _ hb]

/-- The exact one-level filtering choice for affine residue maps. -/
theorem exists_affine_avoiding {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (B : Finset (ZMod p)) (F : ι → Finset (ZMod p))
    (a b : ι → ZMod p) (hb : ∀ i ∈ s, b i ≠ 0)
    (hcard : B.card + ∑ i ∈ s, (F i).card < p) :
    ∃ k : ZMod p, k ∉ B ∧ ∀ i ∈ s, a i + k * b i ∉ F i := by
  classical
  let e (i : ι) : ZMod p ≃ ZMod p :=
    if h : i ∈ s then affinePermutation (a i) (b i) (hb i h) else Equiv.refl _
  have hbound : B.card + ∑ i ∈ s, (F i).card < Fintype.card (ZMod p) := by
    simpa only [ZMod.card] using hcard
  obtain ⟨k, hk, havoid⟩ := exists_avoiding_permutations s B F e hbound
  refine ⟨k, hk, ?_⟩
  intro i hi
  have h := havoid i hi
  simp only [e, dite_eq_left hi] at h
  exact h

/-- The residue parameter can be chosen as a natural number below the prime. -/
theorem exists_nat_affine_avoiding {ι : Type*} {p : ℕ} [Fact p.Prime]
    (s : Finset ι) (B : Finset (ZMod p)) (F : ι → Finset (ZMod p))
    (a b : ι → ZMod p) (hb : ∀ i ∈ s, b i ≠ 0)
    (hcard : B.card + ∑ i ∈ s, (F i).card < p) :
    ∃ k : ℕ, k < p ∧ (k : ZMod p) ∉ B ∧
      ∀ i ∈ s, a i + (k : ZMod p) * b i ∉ F i := by
  obtain ⟨k, hk, havoid⟩ := exists_affine_avoiding s B F a b hb hcard
  refine ⟨k.val, k.val_lt, ?_, ?_⟩
  · simpa only [ZMod.natCast_zmod_val] using hk
  · simpa only [ZMod.natCast_zmod_val] using havoid

end Loneliness.PrimeFiltering
