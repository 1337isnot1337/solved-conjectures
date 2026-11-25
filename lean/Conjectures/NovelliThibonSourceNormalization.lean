module
public import Conjectures.NovelliThibonOptionalEdges

@[expose] public section
namespace NovelliThibon

variable {V K : Type*} [Field K]

open Classical in
noncomputable def intermediateContribution (U : Finset V) (q : K) (t : V → K)
    (arm : V → ℕ) (desc : V → Bool) : K :=
  ∑ S ∈ U.powerset,
    (∏ u ∈ S,includeVertical q (t u) (arm u) (desc u)) *
      (∏ u ∈ U\S,excludeVertical q (t u) (arm u))

theorem arm_sum_parts (U : Finset V) (arm : V → ℕ) (desc : V → Bool) :
    (∑ u ∈ U, if desc u then 0 else arm u)+
      (∑ u ∈ U, if desc u then arm u else 0) = ∑ u ∈ U,arm u := by
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro u _
  cases desc u <;> simp

theorem local_factors_split (U : Finset V) (q : K) (t : V → K)
    (arm : V → ℕ) (desc : V → Bool) :
    (∏ u ∈ U, if desc u then t u else q^(arm u)) =
      (∏ u ∈ U, if desc u then t u else 1) *
         q^(∑ u ∈ U, if desc u then 0 else arm u) := by
  rw [← Finset.prod_pow_eq_pow_sum,← Finset.prod_mul_distrib]
  apply Finset.prod_congr rfl
  intro u _
  cases desc u <;> simp

/-- The full arm and optional-edge normalization of a fixed permutation
contribution in the modified convention of Definition 5.3. The result
is valid with signed q exponents. -/
theorem source_optional_contribution (U : Finset V) (q : K) (hq₀ : q ≠ 0) (hq₁ : q ≠ 1)
    (t : V → K) (arm : V → ℕ) (desc : V → Bool) (inversions : ℕ) :
    q^inversions * (intermediateContribution U q t arm desc / (q-1)^U.card) /
      q^(∑ u ∈ U,arm u) =
    q^((inversions:ℤ)-((∑ u ∈ U, if desc u then arm u else 0 : ℕ):ℤ)) *
      (∏ u ∈ U,if desc u then t u else 1) := by
  have hnorm :
      intermediateContribution U q t arm desc / (q-1)^U.card =
        ∏ u ∈ U,if desc u then t u else q^(arm u) :=
    optional_vertical_normalized U q hq₁ t arm desc
  rw [hnorm,local_factors_split,zpow_sub₀ hq₀,zpow_natCast,zpow_natCast]
  rw [← arm_sum_parts U arm desc,pow_add]
  field_simp [hq₀]

end NovelliThibon
