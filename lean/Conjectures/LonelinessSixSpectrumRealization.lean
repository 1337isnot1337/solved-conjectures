import Conjectures.LonelinessConsecutiveFamilyCertificates
import Conjectures.LonelinessSixProgression

/-! Every value in the proposed six-speed spectrum is attained by a primitive
list of six distinct positive integer speeds. This is the existence direction;
classification of arbitrary six-speed lists is a separate theorem. -/

namespace Loneliness.SixSpectrumRealization

theorem realizes_mod_six_one (P : ℕ) (hP : 7 ≤ P) (hmod : P % 6 = 1) :
    ∃ ds : List ℕ, ds.length = 6 ∧ ds.Nodup ∧ (∀ d ∈ ds, 0 < d) ∧
      ds.foldr Nat.gcd 0 = 1 ∧
      value ds = ((P : ℝ) - 1) / (6 * (P : ℝ)) ∧ value ds < 1 / 6 := by
  let s := P / 6
  have heq : P = 6 * s + 1 := by
    dsimp [s]
    omega
  have hs : 1 ≤ s := by omega
  obtain ⟨ds, hlen, hdistinct, hpositive, hprimitive, hvalue, hbelow⟩ :=
    ConsecutiveFamily.family_realizes 6 s (by decide) (by decide) hs
  refine ⟨ds, hlen, hdistinct, hpositive, hprimitive, ?_, hbelow⟩
  rw [hvalue]
  have heqR : (P : ℝ) = 6 * (s : ℝ) + 1 := by exact_mod_cast heq
  rw [heqR]
  have hden : (6 * (s : ℝ) + 1) ≠ 0 := by positivity
  apply (div_eq_div_iff hden (mul_ne_zero (by norm_num) hden)).2
  ring

theorem realizes (P : ℕ) (hP : 7 ≤ P) (hmod : P % 6 = 1 ∨ P % 6 = 5) :
    ∃ ds : List ℕ, ds.length = 6 ∧ ds.Nodup ∧ (∀ d ∈ ds, 0 < d) ∧
      ds.foldr Nat.gcd 0 = 1 ∧
      value ds = ((P : ℝ) - 1) / (6 * (P : ℝ)) ∧ value ds < 1 / 6 := by
  rcases hmod with hmod | hmod
  · exact realizes_mod_six_one P hP hmod
  · exact SixProgression.realizes_mod_six_five P (by omega) hmod

end Loneliness.SixSpectrumRealization
