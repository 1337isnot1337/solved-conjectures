import Conjectures.LonelinessPrimeFilteringCases
import Conjectures.LonelinessPrimePowerFiveSpeedSeed

/-!
# Partial filtering with a proved higher-family seed

The five-speed bound supplies coprime seeds on arbitrarily fine seven-power
grids. Consequently the higher-family distance premise of Corollary 3 is
discharged whenever that family contains at most five distinct speeds.
Lower levels still have the exact bound of three distinct speeds per level.
-/

namespace Loneliness.PrimeFiltering

/-- Partial filtering preserves every higher residue of the supplied seed.
The exponent is chosen above both the requested resolution and the cutoff. -/
theorem arbitrarily_fine_witness_of_sparse_low_and_five_high
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) (r : ℕ)
    (hlow : ∀ j ≤ r,
      (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3)
    (hhigh : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card ≤ 5)
    (M : ℕ) :
    ∃ m ≥ M, r < m ∧ ∃ a b : ℕ,
      a % 7 = 1 ∧ Nat.Coprime a (7 ^ (m + 1)) ∧
      Nat.Coprime b (7 ^ (m + 1)) ∧ Modular.Witness 7 (7 ^ (m + 1)) b ds ∧
      ∀ x : ℕ, 7 ^ (r + 1) ∣ x →
        (b * x) % 7 ^ (m + 1) = (a * x) % 7 ^ (m + 1) := by
  let : Fact (Nat.Prime 7) := ⟨by decide⟩
  let higher := ds.toFinset.filter (fun d => r < padicValNat 7 d)
  have hhpos : ∀ d ∈ higher.toList, 0 < d := by
    intro d hd
    have hmem := Finset.mem_filter.mp (Finset.mem_toList.mp hd)
    exact hpos d (List.mem_toFinset.mp hmem.1)
  have hhcard : higher.toList.toFinset.card ≤ 5 := by simpa [higher] using hhigh
  obtain ⟨m, hm, a, ha, hcop, hseed⟩ :=
    PrimePowerUnitGrid.arbitrarily_fine_seven_seed_of_five_distinct
      higher.toList hhpos hhcard (max M (r + 1))
  have hrm : r < m := by have := le_max_right M (r + 1); omega
  have hcounts : ∀ j ≤ r,
      (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ (7 - 1) / 2 := by
    simpa using hlow
  have hfolded : ∀ d ∈ ds, r < padicValNat 7 d →
      7 ^ m ≤ Modular.folded (7 ^ (m + 1)) (a * d) := by
    intro d hd hrd
    exact hseed d (Finset.mem_toList.mpr
      (Finset.mem_filter.mpr ⟨List.mem_toFinset.mpr hd, hrd⟩))
  obtain ⟨b, hb, hw, hpreserve⟩ := corollary_three_witness_padic_of_coprime_seed
    ds hpos hrm hcounts a hcop hfolded
  exact ⟨m, (le_max_left M (r + 1)).trans hm, hrm, a, b, ha, hcop, hb, hw, hpreserve⟩

/-- The higher seed is proved internally from Renault's five-speed theorem. -/
theorem one_seventh_of_sparse_low_and_five_high
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) (r : ℕ)
    (hlow : ∀ j ≤ r,
      (ds.toFinset.filter (fun d => padicValNat 7 d = j)).card ≤ 3)
    (hhigh : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card ≤ 5) :
    (1 / 7 : ℝ) ≤ value ds := by
  obtain ⟨m, _, _, a, b, _ha, _hcop, _hb, hw, _hpreserve⟩ :=
    arbitrarily_fine_witness_of_sparse_low_and_five_high ds hpos r hlow hhigh 0
  exact Modular.witness_value_lower (by decide) (pow_pos (by decide) _) hw

/-- For a family of at most six distinct speeds, an occupied lowest level
of size at most three satisfies the runner bound, regardless of higher levels. -/
theorem one_seventh_of_small_minimum_level
    (ds : List ℕ) (hpos : ∀ d ∈ ds, 0 < d) (r : ℕ)
    (htotal : ds.toFinset.card ≤ 6)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat 7 d)
    (hattain : ∃ d ∈ ds, padicValNat 7 d = r)
    (hcount : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card ≤ 3) :
    (1 / 7 : ℝ) ≤ value ds := by
  apply one_seventh_of_sparse_low_and_five_high ds hpos r
  · intro j hj
    by_cases hjeq : j = r
    · simpa only [hjeq] using hcount
    have hempty : ds.toFinset.filter (fun d => padicValNat 7 d = j) = ∅ := by
      apply Finset.eq_empty_iff_forall_notMem.mpr
      intro d hd
      obtain ⟨hd, hlevel⟩ := Finset.mem_filter.mp hd
      have hbound := hminimum d (List.mem_toFinset.mp hd)
      omega
    simp only [hempty, Finset.card_empty]
    omega
  · obtain ⟨d, hd, hlevel⟩ := hattain
    let higher := ds.toFinset.filter (fun e => r < padicValNat 7 e)
    have hnot : d ∉ higher := by simp [higher, hlevel]
    have hsubset : insert d higher ⊆ ds.toFinset := by
      intro e he
      rcases Finset.mem_insert.mp he with rfl | he
      · exact List.mem_toFinset.mpr hd
      · exact (Finset.mem_filter.mp he).1
    have hsize : higher.card + 1 ≤ ds.toFinset.card := by
      simpa only [Finset.card_insert_of_notMem hnot] using Finset.card_le_card hsubset
    have hbound : higher.card ≤ 5 := by omega
    exact hbound

end Loneliness.PrimeFiltering
