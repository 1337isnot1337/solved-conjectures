import Conjectures.SteinerbergerGreedySequence
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

/-!
# Steinerberger's greedy-energy Fourier conjecture

Actual complex exponential sums for the infinite van der Corput sequence.
Rotating each prefix by its next greedy point makes the relevant sums real.
The recurrences below are the binary-block Fourier argument of the existing
`results/steinerberger-greedy-fourier/PROOF.md`, specialized to the classical
sequence whose admissibility was proved in `SteinerbergerGreedySequence`.
-/

open Finset

namespace Conjectures.SteinerbergerGreedy

noncomputable section

/-- The ordinary complex Fourier character, with natural frequency. -/
def character (l : ℕ) (t : ℝ) : ℂ :=
  Complex.exp ((2 * Real.pi * (l : ℝ) * t : ℝ) * Complex.I)

theorem character_add (l : ℕ) (s t : ℝ) :
    character l (s+t) = character l s * character l t := by
  simp [character, mul_add, Complex.ofReal_add, Complex.exp_add, add_mul]

theorem character_norm (l : ℕ) (t : ℝ) : ‖character l t‖ = 1 := by
  exact Complex.norm_exp_ofReal_mul_I _

theorem character_one (l : ℕ) : character l 1 = 1 := by
  unfold character
  rw [show ((2 * Real.pi * (l : ℝ) * 1 : ℝ) : ℂ) * Complex.I =
    (l : ℂ) * (2 * (Real.pi : ℂ) * Complex.I) by push_cast; ring]
  exact Complex.exp_nat_mul_two_pi_mul_I l

theorem character_half (l : ℕ) : character l (1/2) = (-1 : ℂ)^l := by
  unfold character
  rw [show ((2 * Real.pi * (l : ℝ) * (1/2) : ℝ) : ℂ) * Complex.I =
    (l : ℂ) * ((Real.pi : ℂ) * Complex.I) by push_cast; ring]
  rw [Complex.exp_nat_mul, Complex.exp_pi_mul_I]

theorem character_add_one (l : ℕ) (t : ℝ) : character l (t+1) = character l t := by
  rw [character_add, character_one, mul_one]

theorem character_sub_one (l : ℕ) (t : ℝ) : character l (t-1) = character l t := by
  have h := character_add_one l (t-1)
  simpa only [sub_add_cancel] using h.symm

theorem character_add_half (l : ℕ) (t : ℝ) :
    character l (t+1/2) = character l t * (-1 : ℂ)^l := by
  rw [character_add, character_half]

theorem character_sub_half (l : ℕ) (t : ℝ) :
    character l (t-1/2) = character l t * (-1 : ℂ)^l := by
  rw [show t-1/2 = (t+1/2)-1 by ring, character_sub_one, character_add_half]

theorem character_even_half (l : ℕ) (t : ℝ) :
    character (2*l) (t/2) = character l t := by
  unfold character
  congr 1
  push_cast
  ring

/-- The source's unnormalized Fourier sum over a finite prefix. -/
def fourierSum (n l : ℕ) : ℂ := ∑ a ∈ range n, character l (vdc a)

/-- Rotation by the next greedy point does not change the Fourier magnitude. -/
def rotatedSum (n l : ℕ) : ℂ :=
  ∑ a ∈ range n, character l (vdc a - vdc n)

theorem rotatedSum_eq (n l : ℕ) :
    rotatedSum n l = fourierSum n l * character l (-vdc n) := by
  unfold rotatedSum fourierSum
  simp_rw [sub_eq_add_neg, character_add]
  exact (sum_mul _ _ _).symm

theorem rotatedSum_norm (n l : ℕ) : ‖rotatedSum n l‖ = ‖fourierSum n l‖ := by
  rw [rotatedSum_eq, norm_mul, character_norm, mul_one]

theorem rotatedSum_even_even (n l : ℕ) :
    rotatedSum (2*n) (2*l) = 2 * rotatedSum n l := by
  rw [rotatedSum, sum_pairs]
  simp_rw [vdc_even, vdc_odd]
  calc
    _ = ∑ a ∈ range n, 2 * character l (vdc a-vdc n) := by
      apply sum_congr rfl
      intro a _
      rw [show vdc a/2-vdc n/2 = (vdc a-vdc n)/2 by ring,
        show (vdc a+1)/2-vdc n/2 = (vdc a-vdc n)/2+1/2 by ring,
        character_add_half, character_even_half]
      simp [two_mul]
    _ = 2 * rotatedSum n l := by rw [← mul_sum]; rfl

theorem rotatedSum_even_odd (n l : ℕ) :
    rotatedSum (2*n) (2*l+1) = 0 := by
  rw [rotatedSum, sum_pairs]
  simp_rw [vdc_even, vdc_odd]
  apply sum_eq_zero
  intro a _
  rw [show (vdc a+1)/2-vdc n/2 = (vdc a/2-vdc n/2)+1/2 by ring,
    character_add_half]
  simp [pow_add, pow_mul]

theorem rotatedSum_succ (n l : ℕ) :
    rotatedSum (n+1) l = (rotatedSum n l+1) * character l (vdc n-vdc (n+1)) := by
  rw [rotatedSum, sum_range_succ]
  calc
    _ = (∑ a ∈ range n, character l (vdc a-vdc n) *
        character l (vdc n-vdc (n+1))) + character l (vdc n-vdc (n+1)) := by
      congr 1
      apply sum_congr rfl
      intro a _
      rw [← character_add]
      congr 1
      ring
    _ = _ := by rw [← sum_mul]; unfold rotatedSum; ring

theorem rotatedSum_odd (n l : ℕ) :
    rotatedSum (2*n+1) l = (rotatedSum (2*n) l+1) * (-1 : ℂ)^l := by
  rw [rotatedSum_succ, vdc_even, vdc_odd,
    show vdc n/2-(vdc n+1)/2 = (1/2:ℝ)-1 by ring,
    character_sub_one, character_half]

theorem rotatedSum_odd_even (n l : ℕ) :
    rotatedSum (2*n+1) (2*l) = 2 * rotatedSum n l + 1 := by
  rw [rotatedSum_odd, rotatedSum_even_even]
  simp [pow_mul]

theorem rotatedSum_odd_odd (n l : ℕ) :
    rotatedSum (2*n+1) (2*l+1) = -1 := by
  rw [rotatedSum_odd, rotatedSum_even_odd]
  simp [pow_mul, pow_add]

/-- Prefix lengths whose binary expansion consists of alternating ones and zeros. -/
def alternatingPrefix : ℕ → ℕ
  | 0 => 1
  | m+1 => 4 * alternatingPrefix m + 1

theorem alternatingPrefix_pos (m : ℕ) : 0 < alternatingPrefix m := by
  cases m <;> simp [alternatingPrefix]

theorem alternatingPrefix_odd (m : ℕ) : ∃ n, alternatingPrefix m = 2*n+1 := by
  cases m with
  | zero => exact ⟨0, rfl⟩
  | succ m => exact ⟨2*alternatingPrefix m, by simp [alternatingPrefix]; omega⟩

theorem alternatingPrefix_lower (m : ℕ) : 4^m ≤ alternatingPrefix m := by
  induction m with
  | zero => rfl
  | succ m ih => simp only [alternatingPrefix, pow_succ]; omega

theorem alternatingPrefix_upper (m : ℕ) : alternatingPrefix m < 4^(m+1) := by
  induction m with
  | zero => norm_num [alternatingPrefix]
  | succ m ih => simp only [alternatingPrefix, pow_succ] at *; omega

/-- An exact real Fourier amplitude for every odd multiplier on the selected scales. -/
theorem rotatedSum_alternating (m j q : ℕ) (hj : j ≤ m) :
    rotatedSum (alternatingPrefix m) (4^j*(2*q+1)) =
      -((2*(4:ℂ)^j+1)/3) := by
  induction j generalizing m with
  | zero =>
    obtain ⟨n, hn⟩ := alternatingPrefix_odd m
    rw [hn]
    norm_num [rotatedSum_odd_odd]
  | succ j ih =>
    cases m with
    | zero => omega
    | succ m =>
      rw [alternatingPrefix,
        show 4*alternatingPrefix m+1 = 2*(2*alternatingPrefix m)+1 by omega,
        show 4^(j+1)*(2*q+1) = 2*(2*(4^j*(2*q+1))) by ring,
        rotatedSum_odd_even, rotatedSum_even_even, ih m (by omega)]
      ring

theorem fourierSum_alternating_norm (m j q : ℕ) (hj : j ≤ m) :
    ‖fourierSum (alternatingPrefix m) (4^j*(2*q+1))‖ =
      (2*(4:ℝ)^j+1)/3 := by
  rw [← rotatedSum_norm, rotatedSum_alternating m j q hj, norm_neg]
  have h : (0:ℝ) ≤ (2*(4:ℝ)^j+1)/3 := by positivity
  have he : (2*(4:ℂ)^j+1)/3 = (((2*(4:ℝ)^j+1)/3 : ℝ) : ℂ) := by push_cast; rfl
  rw [he, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg h]

end
end Conjectures.SteinerbergerGreedy
