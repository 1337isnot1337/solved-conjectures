import Mathlib.Analysis.SpecialFunctions.Complex.CircleAddChar
import Mathlib.Analysis.RCLike.Basic
import Mathlib.Tactic

/-! The deterministic Fourier target for Németh–Seberry–Shu. The
probabilities of the biased support are admissible and their Fourier
means have exactly the three prescribed modes. -/

open Finset
open scoped ComplexConjugate

namespace NemethSeberryShu

noncomputable section

variable {p : ℕ} [NeZero p]

/-- The inclusion probability for a coordinate of the circulant support. -/
def inclusionProbability (ρ a : ℝ) (i : ZMod p) : ℝ :=
  ρ + 2 * a * (ZMod.stdAddChar i).re

theorem inclusionProbability_bounds {ρ a : ℝ} (hρ₀ : 1 / 3 ≤ ρ) (hρ₁ : ρ ≤ 2 / 3)
    (ha₀ : 1 / 24 ≤ a) (ha₁ : a ≤ 1 / 12) (i : ZMod p) :
    1 / 6 ≤ inclusionProbability ρ a i ∧ inclusionProbability ρ a i ≤ 5 / 6 := by
  have hnorm : ‖ZMod.stdAddChar i‖ = 1 := by simp [ZMod.stdAddChar_apply]
  have h := Complex.abs_re_le_norm (ZMod.stdAddChar i)
  rw [hnorm] at h
  have hRe := abs_le.1 h
  have h0 : 0 ≤ 2 * a := by linarith
  have hl := mul_le_mul_of_nonneg_left hRe.1 h0
  have hu := mul_le_mul_of_nonneg_left hRe.2 h0
  unfold inclusionProbability
  exact ⟨by linarith, by linarith⟩

theorem standardCharacter_neg (i : ZMod p) :
    ZMod.stdAddChar (-i) = conj (ZMod.stdAddChar i) := by
  simp only [ZMod.stdAddChar_apply, AddChar.map_neg_eq_inv]
  exact Circle.coe_inv_eq_conj _

theorem standardCharacter_sum (t : ZMod p) :
    ∑ i : ZMod p, ZMod.stdAddChar (t * i) = if t = 0 then (p : ℂ) else 0 := by
  split_ifs with h
  · simp only [h, zero_mul, AddChar.map_zero_eq_one, sum_const, card_univ, ZMod.card,
      nsmul_eq_mul, mul_one]
  · exact AddChar.sum_eq_zero_of_ne_one (ZMod.isPrimitive_stdAddChar p h)

private theorem character_expand (ρ a : ℝ) (i l : ZMod p) :
    (inclusionProbability ρ a i : ℂ) * ZMod.stdAddChar (l * i) =
      (ρ : ℂ) * ZMod.stdAddChar (l * i) +
      (a : ℂ) * ZMod.stdAddChar ((l + 1) * i) +
      (a : ℂ) * ZMod.stdAddChar ((l - 1) * i) := by
  have hc : ZMod.stdAddChar i + ZMod.stdAddChar (-i) =
      (2 : ℂ) * (ZMod.stdAddChar i).re := by
    rw [standardCharacter_neg]
    exact RCLike.add_conj _
  have hprob : (inclusionProbability ρ a i : ℂ) =
      (ρ : ℂ) + (a : ℂ) * (ZMod.stdAddChar i + ZMod.stdAddChar (-i)) := by
    rw [hc]
    unfold inclusionProbability
    push_cast
    ring
  rw [hprob, add_mul l 1 i, sub_mul l 1 i, one_mul,
    sub_eq_add_neg (l * i) i,
    AddChar.map_add_eq_mul ZMod.stdAddChar (l * i) i,
    AddChar.map_add_eq_mul ZMod.stdAddChar (l * i) (-i)]
  ring

/-- The exact complex Fourier mean of the biased support. Including frequency
collisions makes the identity valid at every positive order. -/
theorem inclusionProbability_fourier (ρ a : ℝ) (l : ZMod p) :
    (∑ i : ZMod p, (inclusionProbability ρ a i : ℂ) * ZMod.stdAddChar (l * i)) =
      (ρ : ℂ) * (if l = 0 then (p : ℂ) else 0) +
      (a : ℂ) * (if l + 1 = 0 then (p : ℂ) else 0) +
      (a : ℂ) * (if l - 1 = 0 then (p : ℂ) else 0) := by
  simp only [character_expand, sum_add_distrib, ← mul_sum, standardCharacter_sum]

end

end NemethSeberryShu
