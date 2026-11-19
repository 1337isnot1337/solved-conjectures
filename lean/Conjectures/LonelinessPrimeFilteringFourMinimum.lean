import Conjectures.LonelinessPrimeFilteringFourMinimumData
import Conjectures.LonelinessPrimeFilteringFourPlusTwo
import Conjectures.LonelinessModularWitness

/-!
# The actual loneliness bound when four speeds have minimum 7-adic level

The finite four-unit filter and the two-higher-speed seed give a witness
for the normalized speeds. Multiplying the modulus and every speed by
their common 7-power preserves each folded-residue inequality. The data
theorem derives the normalized representation from the original list.
-/

namespace Loneliness.PrimeFilteringFourMinimum

/-- Scaling both the modulus and the input scales the folded residue exactly. -/
theorem folded_mul_scale (c N x : ℕ) :
    Modular.folded (c * N) (c * x) = c * Modular.folded N x := by
  unfold Modular.folded
  rw [Nat.mul_mod_mul_left, ← Nat.mul_sub_left_distrib, Nat.mul_min_mul_left]

/-- The verified `4 + 2` grid lifts through an arbitrary common factor in the
actual speed representation. The modulus is scaled by the same factor. -/
theorem witness_of_four_two_representation (ds : List ℕ) (c : ℕ)
    {i m u v : ℕ} (hi : 1 ≤ i) (him : i ≤ m)
    (hu : u % 7 ≠ 0) (hv : v % 7 ≠ 0)
    (ns : Fin 4 → ℕ) (hn : ∀ x, ns x % 7 ≠ 0)
    (hrepresentation : ∀ d ∈ ds, (∃ x, d = c * ns x) ∨
      d = c * (7 ^ i * u) ∨ d = c * (7 ^ m * v)) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      Modular.Witness 7 (c * 7 ^ (m + 1)) a ds := by
  obtain ⟨a, ha, hlow, hfirst, hsecond⟩ :=
    PrimeFilteringTwoHigher.four_plus_two_grid hi him hu hv ns hn
  have hscale (n : ℕ) (hfold : 7 ^ m ≤ Modular.folded (7 ^ (m + 1)) (a * n)) :
      c * 7 ^ (m + 1) ≤ 7 * Modular.folded (c * 7 ^ (m + 1)) (a * (c * n)) := by
    rw [Nat.mul_left_comm a c n, folded_mul_scale]
    calc
      c * 7 ^ (m + 1) = 7 * (c * 7 ^ m) := by
        rw [pow_succ]
        ac_rfl
      _ ≤ 7 * (c * Modular.folded (7 ^ (m + 1)) (a * n)) :=
        Nat.mul_le_mul_left 7 (Nat.mul_le_mul_left c hfold)
  refine ⟨a, ha, ?_⟩
  intro d hd
  rcases hrepresentation d hd with ⟨x, rfl⟩ | rfl | rfl
  · exact hscale (ns x) (hlow x)
  · exact hscale (7 ^ i * u) hfirst
  · exact hscale (7 ^ m * v) hsecond

/-- Four distinct speeds at the minimum valuation and two above it give an
actual modular witness for the original positive speed list. -/
theorem four_minimum_witness (ds : List ℕ) (r : ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat 7 d)
    (hlowcard : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4)
    (hhighcard : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 2) :
    ∃ m a : ℕ, 1 ≤ m ∧ Nat.Coprime a (7 ^ (m + 1)) ∧
      Modular.Witness 7 (7 ^ r * 7 ^ (m + 1)) a ds := by
  obtain ⟨ns, i, m, u, v, hi, him, hn, hu, hv, hrepresentation⟩ :=
    PrimeFilteringFourMinimumData.exists_four_low_two_high_data ds r
      hpos hminimum hlowcard hhighcard
  obtain ⟨a, ha, hw⟩ :=
    witness_of_four_two_representation ds (7 ^ r) hi him hu hv ns hn hrepresentation
  exact ⟨m, a, hi.trans him, ha, hw⟩

/-- The `4 + 2` minimum-level case satisfies the actual real-time loneliness
bound. All representation and grid premises are discharged from the list. -/
theorem four_minimum_value (ds : List ℕ) (r : ℕ)
    (hpos : ∀ d ∈ ds, 0 < d)
    (hminimum : ∀ d ∈ ds, r ≤ padicValNat 7 d)
    (hlowcard : (ds.toFinset.filter (fun d => padicValNat 7 d = r)).card = 4)
    (hhighcard : (ds.toFinset.filter (fun d => r < padicValNat 7 d)).card = 2) :
    (1 : ℝ) / 7 ≤ Loneliness.value ds := by
  obtain ⟨m, a, _hm, _ha, hw⟩ :=
    four_minimum_witness ds r hpos hminimum hlowcard hhighcard
  exact Modular.witness_value_lower (by decide : 2 ≤ 7)
    (Nat.mul_pos (pow_pos (by decide : 0 < (7 : ℕ)) r)
      (pow_pos (by decide : 0 < (7 : ℕ)) (m + 1))) hw

end Loneliness.PrimeFilteringFourMinimum
