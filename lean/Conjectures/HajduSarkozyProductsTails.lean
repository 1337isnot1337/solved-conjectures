import Conjectures.HajduSarkozyProductsSeries

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The infinite family and its actual coefficient-tail count. Every value in
the finite prefix chooses one representing coefficient. Its finite image
allows a finite union bound, so no uniqueness of representations is assumed.
-/

open Classical Finset Filter Asymptotics

namespace Conjectures.HajduSarkozy.Products

noncomputable section

def familyPowers (k : ℕ) (c : ℤ) (Q : ℕ → ℕ) : Set ℕ :=
  {n | ∃ i, n ∈ scaledPowers k c (Q i)}

def headPowers (k : ℕ) (c : ℤ) (Q : ℕ → ℕ) (T : ℕ) : Set ℕ :=
  {n | ∃ i < T, n ∈ scaledPowers k c (Q i)}

theorem headPowers_subset (k : ℕ) (c : ℤ) (Q : ℕ → ℕ) (T : ℕ) :
    headPowers k c Q T ⊆ familyPowers k c Q := by
  rintro n ⟨i, _, hi⟩
  exact ⟨i, hi⟩

theorem scaledPowers_subset_family (k : ℕ) (c : ℤ) (Q : ℕ → ℕ) (i : ℕ) :
    scaledPowers k c (Q i) ⊆ familyPowers k c Q := by
  intro n hn
  exact ⟨i, hn⟩

theorem count_finite_union_le {ι : Type*} (F : Finset ι) (S : ι → Set ℕ) (X : ℝ) :
    count {n | ∃ i ∈ F, n ∈ S i} X ≤ ∑ i ∈ F, count (S i) X := by
  induction F using Finset.induction_on with
  | empty => simp
  | @insert i F hi ih =>
      have he : {n | ∃ j ∈ insert i F, n ∈ S j} = S i ∪ {n | ∃ j ∈ F, n ∈ S j} := by
        ext n
        simp
      rw [he, sum_insert hi]
      exact (count_union_le _ _ X).trans (add_le_add le_rfl ih)

/-- Actual distinct tail values are bounded by the summable coefficient tail. -/
theorem coefficient_tail_count_le {k : ℕ} (hk : 0 < k) (c : ℤ) (Q : ℕ → ℕ)
    (hsum : Summable (fun i => coefficientWeight k (Q i))) (T : ℕ)
    {X : ℝ} (hX : 0 ≤ X) :
    count (familyPowers k c Q \ headPowers k c Q T) X ≤
      (X+(c.natAbs : ℝ))^(1/(k : ℝ))*tailMass (fun i => coefficientWeight k (Q i)) T := by
  let S := realPrefix (familyPowers k c Q \ headPowers k c Q T) X
  have hex (n : ℕ) (hn : n ∈ S) : ∃ i, n ∈ scaledPowers k c (Q i) :=
    (mem_realPrefix.mp hn).2.2.1
  let f : ℕ → ℕ := fun n => if hn : n ∈ S then Classical.choose (hex n hn) else 0
  have hf (n : ℕ) (hn : n ∈ S) : n ∈ scaledPowers k c (Q (f n)) := by
    simp only [f, dite_eq_left hn]
    exact Classical.choose_spec (hex n hn)
  have hindex (n : ℕ) (hn : n ∈ S) : T ≤ f n := by
    by_contra h
    exact (mem_realPrefix.mp hn).2.2.2 ⟨f n, by omega, hf n hn⟩
  let F := S.image f
  have hF : ∀ i ∈ F, T ≤ i := by
    intro i hi
    obtain ⟨n, hn, rfl⟩ := mem_image.mp hi
    exact hindex n hn
  let U : Set ℕ := {n | ∃ i ∈ F, n ∈ scaledPowers k c (Q i)}
  have hsub : S ⊆ realPrefix U X := by
    intro n hn
    obtain ⟨hn0, hnX, _⟩ := mem_realPrefix.mp hn
    exact mem_realPrefix.mpr ⟨hn0, hnX, f n, mem_image.mpr ⟨n, hn, rfl⟩, hf n hn⟩
  have hcount : count (familyPowers k c Q \ headPowers k c Q T) X ≤ count U X := by
    change (S.card : ℝ) ≤ ((realPrefix U X).card : ℝ)
    exact_mod_cast card_le_card hsub
  calc
    count (familyPowers k c Q \ headPowers k c Q T) X ≤ count U X := hcount
    _ ≤ ∑ i ∈ F, count (scaledPowers k c (Q i)) X := count_finite_union_le F _ X
    _ ≤ ∑ i ∈ F, (X+(c.natAbs : ℝ))^(1/(k : ℝ))*coefficientWeight k (Q i) :=
      sum_le_sum fun i _ => scaled_count_le hk c (Q i) hX
    _ = (X+(c.natAbs : ℝ))^(1/(k : ℝ))*(∑ i ∈ F, coefficientWeight k (Q i)) := by
      rw [mul_sum]
    _ ≤ (X+(c.natAbs : ℝ))^(1/(k : ℝ))*tailMass (fun i => coefficientWeight k (Q i)) T :=
      mul_le_mul_of_nonneg_left
        (sum_le_tailMass (fun i => coefficientWeight_nonneg k (Q i)) hsum T F hF)
        (Real.rpow_nonneg (by positivity) _)

end

end Conjectures.HajduSarkozy.Products
