import Conjectures.LonelinessPrimeFilteringFourSoundness
import Conjectures.LonelinessPrimeFilteringFourCellMap
import Conjectures.LonelinessPrimeFilteringSampling
import Mathlib.Tactic.FinCases

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem sampled_four_choices
    (hgood : ∀ a b c d : Fin 210, GoodFour a b c d)
    (cells : Fin 4 → Fin 420) (rs : Fin 4 → Fin 6) :
    ∃ (j : Fin 5) (k : Fin 7), ∀ i : Fin 4,
      (sampleQuotient (cells i) j + k.val * ((rs i).val + 1)) % 7 ≠ 0 ∧
      (sampleQuotient (cells i) j + k.val * ((rs i).val + 1)) % 7 ≠ 6 := by
  obtain ⟨j, k, h0, h1, h2, h3⟩ := hgood
    (profileFor (cells 0) (rs 0)) (profileFor (cells 1) (rs 1))
    (profileFor (cells 2) (rs 2)) (profileFor (cells 3) (rs 3))
  refine ⟨j, k, fun i => ?_⟩
  fin_cases i
  · exact (profileFor_accepts (cells 0) (rs 0) j k).mp h0
  · exact (profileFor_accepts (cells 1) (rs 1) j k).mp h1
  · exact (profileFor_accepts (cells 2) (rs 2) j k).mp h2
  · exact (profileFor_accepts (cells 3) (rs 3) j k).mp h3

theorem bounded_four_choices
    (hgood : ∀ a b c d : Fin 210, GoodFour a b c d)
    (M : ℕ) (xs rs : Fin 4 → ℕ) (hx : ∀ i, xs i < 7 * M)
    (hr : ∀ i, 0 < rs i ∧ rs i < 7) :
    ∃ (j : Fin 5) (k : Fin 7), ∀ i : Fin 4,
      (((j.val + 1) * xs i / M) % 7 + k.val * rs i) % 7 ≠ 0 ∧
      (((j.val + 1) * xs i / M) % 7 + k.val * rs i) % 7 ≠ 6 := by
  classical
  have hs (i : Fin 4) := PrimeFilteringSampling.exists_five_quotient_sample (hx i)
  let cells (i : Fin 4) : Fin 420 := Classical.choose (hs i)
  have hc (i : Fin 4) (j : Fin 5) :
      ((j.val + 1) * xs i / M) % 7 = sampleQuotient (cells i) j :=
    Classical.choose_spec (hs i) j
  let residues (i : Fin 4) : Fin 6 := ⟨rs i - 1, by have h := hr i; omega⟩
  have hv (i : Fin 4) : (residues i).val + 1 = rs i := by
    have h := hr i
    dsimp [residues]
    omega
  obtain ⟨j, k, h⟩ := sampled_four_choices hgood cells residues
  refine ⟨j, k, fun i => ?_⟩
  simpa only [← hc i j, hv i] using h i

theorem quotient_mod_period (q n M : ℕ) :
    (q * (n % (7 * M)) / M) % 7 = (q * n / M) % 7 := by
  rw [← Nat.mod_mul_left_div_self (q * (n % (7 * M))) M 7,
    ← Nat.mod_mul_left_div_self (q * n) M 7]
  rw [Nat.mul_mod_mod]

theorem arbitrary_four_choices
    (hgood : ∀ a b c d : Fin 210, GoodFour a b c d)
    {M : ℕ} (hM : 0 < M) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7), ∀ i : Fin 4,
      (((j.val + 1) * ns i / M) % 7 + k.val * (ns i % 7)) % 7 ≠ 0 ∧
      (((j.val + 1) * ns i / M) % 7 + k.val * (ns i % 7)) % 7 ≠ 6 := by
  obtain ⟨j, k, h⟩ := bounded_four_choices hgood M
    (fun i => ns i % (7 * M)) (fun i => ns i % 7)
    (fun _ => Nat.mod_lt _ (by omega))
    (fun i => ⟨by have h := hn i; omega, Nat.mod_lt _ (by decide)⟩)
  exact ⟨j, k, fun i => by simpa only [quotient_mod_period] using h i⟩

theorem shifted_quotient {M : ℕ} (hM : 0 < M) (n j k : ℕ) :
    ((j + k * M) * n / M) % 7 = ((j * n / M) % 7 + k * (n % 7)) % 7 := by
  have he : (j + k * M) * n = j * n + M * (k * n) := by ring
  rw [he, Nat.add_mul_div_left _ _ hM]
  simp only [Nat.add_mod, Nat.mul_mod, Nat.mod_mod]

theorem four_filter_of_canonical_checks
    (h : ∀ f : Fin 10, canonicalCheck f = true)
    {M : ℕ} (hM : 0 < M) (ns : Fin 4 → ℕ) (hn : ∀ i, ns i % 7 ≠ 0) :
    ∃ (j : Fin 5) (k : Fin 7), ∀ i : Fin 4,
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 0 ∧
      ((j.val + 1 + k.val * M) * ns i / M) % 7 ≠ 6 := by
  obtain ⟨j, k, hs⟩ := arbitrary_four_choices (goodFour_of_canonical_checks h) hM ns hn
  exact ⟨j, k, fun i => by simpa only [shifted_quotient hM] using hs i⟩

end Loneliness.PrimeFilteringFourProfiles
