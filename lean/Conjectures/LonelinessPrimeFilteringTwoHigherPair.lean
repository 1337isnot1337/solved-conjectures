import Conjectures.LonelinessPrimeFilteringTwoHigherSeed

namespace Loneliness.PrimeFilteringTwoHigher

theorem top_level_multiples {m a v : ℕ}
    (ha : Nat.Coprime a (7 ^ (m + 1))) (hv : v % 7 ≠ 0)
    {j : ℕ} (hj : 1 ≤ j) (hj5 : j ≤ 5) :
    7 ^ m ≤ min ((j * (a * (7 ^ m * v))) % 7 ^ (m + 1))
      (7 ^ (m + 1) - (j * (a * (7 ^ m * v))) % 7 ^ (m + 1)) := by
  have hdiv : 7 ∣ 7 ^ (m + 1) := by
    simpa only [pow_one] using Nat.pow_dvd_pow 7 (show 1 ≤ m + 1 by omega)
  have ha7 : Nat.Coprime a 7 := Nat.Coprime.of_dvd_right hdiv ha
  have hjmod : j % 7 ≠ 0 := by
    rw [Nat.mod_eq_of_lt (by omega)]
    omega
  have hj7 : Nat.Coprime j 7 := by simpa only [pow_one] using coprime_seven_power hjmod 1
  have hv7 : Nat.Coprime v 7 := by simpa only [pow_one] using coprime_seven_power hv 1
  have hcop : Nat.Coprime (j * a * v) 7 := (hj7.mul_left ha7).mul_left hv7
  have hq : (j * a * v) % 7 ≠ 0 := by
    intro h
    exact (Nat.Prime.coprime_iff_not_dvd (by decide : Nat.Prime 7)).mp hcop.symm
      (Nat.dvd_of_mod_eq_zero h)
  have he : j * (a * (7 ^ m * v)) = 7 ^ m * (j * a * v) := by ring
  rw [he]
  exact top_level_folded m (j * a * v) hq

theorem two_level_seed {i m u v : ℕ} (him : i ≤ m)
    (hu : u % 7 ≠ 0) (hv : v % 7 ≠ 0) :
    ∃ a : ℕ, Nat.Coprime a (7 ^ (m + 1)) ∧
      ∀ j : ℕ, 1 ≤ j → j ≤ 5 →
        (7 ^ m ≤ min ((j * (a * (7 ^ i * u))) % 7 ^ (m + 1))
          (7 ^ (m + 1) - (j * (a * (7 ^ i * u))) % 7 ^ (m + 1))) ∧
        (7 ^ m ≤ min ((j * (a * (7 ^ m * v))) % 7 ^ (m + 1))
          (7 ^ (m + 1) - (j * (a * (7 ^ m * v))) % 7 ^ (m + 1))) := by
  by_cases heq : i = m
  · subst i
    refine ⟨1, by simp, fun j hj hj5 => ?_⟩
    exact ⟨top_level_multiples (by simp) hu hj hj5,
      top_level_multiples (by simp) hv hj hj5⟩
  · have hlt : i < m := by omega
    obtain ⟨a, ha, htarget⟩ := exists_lower_level_target hlt hu
    refine ⟨a, ha, fun j hj hj5 => ?_⟩
    exact ⟨lower_level_target_multiples hlt htarget hj hj5,
      top_level_multiples ha hv hj hj5⟩

end Loneliness.PrimeFilteringTwoHigher
