import Conjectures.HartkeMatchingExcessDivergence

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Source-statement bridges: the eventual constant is unique, binary length is
one plus the base-two integer logarithm, and the same quantitative lower
bound holds for the attained minimum of every positive tail.
-/

namespace HartkeMatchingExcess

open Filter

theorem matchingExcess_unique (p : ℕ) (hp : 0 < p) (c : ℤ)
    (hc : ∃ n₀, ∀ n, n₀ ≤ n → (extremalEdges n p : ℤ) = (n : ℤ) ^ 2 + c) :
    c = matchingExcess p := by
  obtain ⟨k, hk⟩ := hc
  obtain ⟨l, hl⟩ := extremalEdges_eventually p hp
  have h₁ := hk (max k l) (Nat.le_max_left k l)
  have h₂ := hl (max k l) (Nat.le_max_right k l)
  omega

theorem binaryLength_eq_log {t : ℕ} (ht : 0 < t) :
    binaryLength t = 1 + Nat.log 2 t := by
  rw [binaryLength, Nat.length_digits 2 t (by omega) (by omega)]
  omega

theorem matchingExcess_log_lower_bound (p : ℕ) (hp : 2 ≤ p) :
    (Real.sqrt (8 * ((1 + Nat.log 2 (p - 1) : ℕ) : ℝ) + 1) - 3) / 4 ≤
      (matchingExcess p : ℝ) := by
  have h := matchingExcess_sqrt_lower_bound p hp
  rwa [binaryLength_eq_log (by omega : 0 < p - 1)] at h

theorem tailMinimum_sqrt_lower_bound (p : ℕ) (hp : 2 ≤ p) :
    (Real.sqrt (8 * (binaryLength (p - 1) : ℝ) + 1) - 3) / 4 ≤
      (tailMinimum p : ℝ) := by
  obtain ⟨q, hpq, he⟩ := tailMinimum_attained p (by omega)
  have h := matchingExcess_sqrt_lower_bound q (hp.trans hpq)
  rw [he] at h
  have hN : binaryLength (p - 1) ≤ binaryLength (q - 1) :=
    Nat.le_length_digits_le 2 (p - 1) (q - 1) (Nat.sub_le_sub_right hpq 1)
  have hNr : (binaryLength (p - 1) : ℝ) ≤ (binaryLength (q - 1) : ℝ) := by
    exact_mod_cast hN
  have hs := Real.sqrt_le_sqrt (by linarith :
    8 * (binaryLength (p - 1) : ℝ) + 1 ≤ 8 * (binaryLength (q - 1) : ℝ) + 1)
  linarith

/-- The conclusion holds for any constants specified by the source's exact
finite-order extremal formula, independently of how those constants are named. -/
theorem conjecture_9_15_eventual (c : ℕ → ℤ)
    (hc : ∀ p, 0 < p → ∃ n₀, ∀ n, n₀ ≤ n →
      (extremalEdges n p : ℤ) = (n : ℤ) ^ 2 + c p) :
    Tendsto (fun p : ℕ => sInf (c '' {q : ℕ | p ≤ q})) atTop atTop := by
  have he (p : ℕ) (hp : 0 < p) :
      c '' {q : ℕ | p ≤ q} = tailValues p := by
    ext x
    constructor
    · rintro ⟨q, hq, rfl⟩
      change p ≤ q at hq
      exact ⟨q, hq, (matchingExcess_unique q (by omega) (c q) (hc q (by omega))).symm⟩
    · rintro ⟨q, hq, rfl⟩
      change p ≤ q at hq
      exact ⟨q, hq, matchingExcess_unique q (by omega) (c q) (hc q (by omega))⟩
  apply tendsto_atTop_atTop.mpr
  intro b
  refine ⟨excessCutoff b.toNat, fun p hp => ?_⟩
  rw [he p ((excessCutoff_pos b.toNat).trans_le hp)]
  change b ≤ tailMinimum p
  have h := tailMinimum_gt_of_large b.toNat p hp
  omega

end HartkeMatchingExcess
