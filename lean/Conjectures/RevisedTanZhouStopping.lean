import Conjectures.RevisedTanZhouUpper
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics

/-!
# Stopping Lüroth cylinders at a favorable scale

Only a finite union bound for large digits is needed. The chosen cylinders
have comparable location scales and contain equal-length target intervals.
-/

open Set Finset Filter MeasureTheory
open scoped Topology ENNReal

namespace RevisedTanZhou

open GravgaardLeeLargeLuroth

noncomputable section

def badDigit (j M : ℕ) : Set ℝ :=
  ⋃ p : Word j × ℕ, cylinder (show Word (j + 1) from (p.1, M + p.2))

def badPrefix (N M : ℕ) : Set ℝ := ⋃ j : Fin N, badDigit j M

theorem volume_cylinder {n : ℕ} (w : Word n) :
    volume (cylinder w) = ENNReal.ofReal (lengthOf w) := by
  rw [cylinder, Real.volume_Ioc, add_sub_cancel_left]

theorem volume_badDigit (j M : ℕ) :
    volume (badDigit j M) ≤ ENNReal.ofReal (1 / ((M : ℝ) + 1)) := by
  refine (measure_iUnion_le _).trans_eq ?_
  simp_rw [volume_cylinder, length_snoc, ENNReal.ofReal_mul (length_pos _).le]
  rw [ENNReal.tsum_prod']
  simp [ENNReal.tsum_mul_left, ENNReal.tsum_mul_right, tsum_width, tsum_cylinder_lengths]

theorem volume_badPrefix (N M : ℕ) :
    volume (badPrefix N M) ≤ ENNReal.ofReal ((N : ℝ) / ((M : ℝ) + 1)) := by
  apply (measure_iUnion_fintype_le _ _).trans
  calc
    _ ≤ ∑ _i : Fin N, ENNReal.ofReal (1 / ((M : ℝ) + 1)) :=
      sum_le_sum fun j _ => volume_badDigit j M
    _ = _ := by
      simp only [sum_const, card_fin, nsmul_eq_mul]
      rw [← ENNReal.ofReal_natCast, ← ENNReal.ofReal_mul (Nat.cast_nonneg _), mul_one_div]

private theorem digit_lt_of_good {x : ℝ} {a : ℕ → ℕ} (ha : value (fun i => a i + 2) = x)
    {M N : ℕ} (hx : x ∉ badPrefix N M) {j : ℕ} (hj : j < N) :
    a j < M := by
  by_contra! h
  obtain ⟨d, hd⟩ := Nat.exists_eq_add_of_le h
  apply hx
  refine mem_iUnion.mpr ⟨⟨j, hj⟩, mem_iUnion.mpr ⟨(wordOf a j, d), ?_⟩⟩
  have he : (show Word (j + 1) from (wordOf a j, M + d)) = wordOf a (j + 1) := by
    simp only [wordOf, ← hd]
  rw [he, ← ha]
  exact value_mem_cylinder a _

private theorem A_wordOf_step (a : ℕ → ℕ) (n : ℕ) :
    A (n + 1) (wordOf a (n + 1)) =
      A n (wordOf a n) * ((a n + 2) * (a n + 1)) := by
  change A n (wordOf a n) * (a n + 2) * (a n + 1) = _
  rw [Nat.mul_assoc]

/-- The first sufficiently short cylinder stays below the favorable
denominator cutoff when all inspected digits are bounded. -/
theorem stopping_word {x : ℝ} (hx : x ∈ Set.Ioc 0 1) {N M K q : ℕ} {R : ℝ}
    (hgood : x ∉ badPrefix N M) (hR : 1 ≤ R) (hN : R < (2 : ℝ) ^ N)
    (hK : (((M : ℝ) + 2) ^ 2) ^ K ≤ R)
    (hmax : R * ((M : ℝ) + 2) ^ 2 ≤ q) :
    ∃ n ≥ K, ∃ w : Word (n + 1), x ∈ cylinder w ∧ R < A (n + 1) w ∧ A (n + 1) w ≤ q := by
  obtain ⟨a, ha⟩ := exists_digit_string hx
  have hbound (i : ℕ) (hi : i < N) :
      ((a i + 2) * (a i + 1) : ℕ) ≤ (M + 2) ^ 2 := by
    have hd := digit_lt_of_good ha hgood hi
    simpa [pow_two] using Nat.mul_le_mul (show a i + 2 ≤ M + 2 by omega)
      (show a i + 1 ≤ M + 2 by omega)
  have hprod (n : ℕ) (hn : n ≤ N) : A n (wordOf a n) ≤ ((M + 2) ^ 2) ^ n := by
    induction n with
    | zero => simp [A]
    | succ n ih =>
      rw [A_wordOf_step, pow_succ]
      exact Nat.mul_le_mul (ih (by omega)) (hbound _ (by omega))
  have hA_N : R < A N (wordOf a N) :=
    hN.trans_le (by exact_mod_cast two_pow_le_A N (wordOf a N))
  let P (n : ℕ) := R < (A n (wordOf a n) : ℝ)
  classical
  have hex : ∃ n, P n := ⟨N, hA_N⟩
  let n := Nat.find hex
  have hnN : n ≤ N := Nat.find_min' hex hA_N
  have hn : R < A n (wordOf a n) := Nat.find_spec hex
  have hnK : K < n := by
    by_contra! h
    have hh : (((M : ℝ) + 2) ^ 2) ^ n ≤ (((M : ℝ) + 2) ^ 2) ^ K :=
      pow_le_pow_right₀ (by have := Nat.cast_nonneg (α := ℝ) M; nlinarith [sq_nonneg (M : ℝ)]) h
    have hprodR : (A n (wordOf a n) : ℝ) ≤ (((M : ℝ) + 2) ^ 2) ^ n := by
      exact_mod_cast hprod n hnN
    exact (not_le_of_gt hn) (hprodR.trans (hh.trans hK))
  obtain ⟨j, hj⟩ := Nat.exists_eq_succ_of_ne_zero (show n ≠ 0 by omega)
  have hjR : (A j (wordOf a j) : ℝ) ≤ R := le_of_not_gt (Nat.find_min hex (by omega))
  have ha_q : A n (wordOf a n) ≤ q := by
    rw [hj, A_wordOf_step]
    exact_mod_cast (show ((A j (wordOf a j) * ((a j + 2) * (a j + 1)) : ℕ) : ℝ) ≤ q by
      rw [Nat.cast_mul]
      have hb : (((a j + 2) * (a j + 1) : ℕ) : ℝ) ≤ ((M : ℝ) + 2) ^ 2 := by
        exact_mod_cast hbound j (by omega)
      exact (mul_le_mul hjR hb (by positivity) (hR.trans' zero_le_one)).trans hmax)
  refine ⟨j, by omega, wordOf a (j + 1), ?_, ?_, ?_⟩
  · rw [← ha]
    exact value_mem_cylinder a _
  · rwa [hj] at hn
  · rwa [hj] at ha_q

/-- A favorable cutoff gives a genuine closed target interval near each
point satisfying the finite digit restriction. -/
theorem target_near_good {ψ : ℕ → ℝ} (hmono : Antitone ψ) {x : ℝ} (hx : x ∈ Set.Ioc 0 1)
    {N M K q : ℕ} {R t : ℝ} (hgood : x ∉ badPrefix N M)
    (hR : 1 ≤ R) (hN : R < (2 : ℝ) ^ N)
    (hK : (((M : ℝ) + 2) ^ 2) ^ K ≤ R)
    (hmax : R * ((M : ℝ) + 2) ^ 2 ≤ q) (ht : 0 ≤ t) (hq : 1 ≤ q)
    (hψ : (q : ℝ) ^ (-t) ≤ ψ q) :
    ∃ y, |y - x| ≤ 1 / R ∧ ∃ n ≥ K, ∃ w : Word (n + 1),
      Set.Icc y (y + (q : ℝ) ^ (-(1 + t)) / 4) ⊆ target ψ w := by
  obtain ⟨n, hn, w, hw, hRw, hwq⟩ := stopping_word hx hgood hR hN hK hmax
  let ρ := (q : ℝ) ^ (-(1 + t)) / 4
  let p := center (n + 1) w
  let y := p + ρ
  have hqR : (1 : ℝ) ≤ (q : ℝ) := by exact_mod_cast hq
  have hqpos : 0 < (q : ℝ) := by linarith
  have hρ : 0 < ρ := div_pos (Real.rpow_pos_of_pos hqpos _) (by norm_num)
  have hρq : 4 * ρ = (q : ℝ) ^ (-t) / q := by
    dsimp [ρ]
    rw [show (q : ℝ) ^ (-t) / q = (q : ℝ) ^ (-t - 1) by
      rw [Real.rpow_sub hqpos, Real.rpow_one], show -t - 1 = -(1 + t) by ring]
    ring
  have hρA : 4 * ρ ≤ lengthOf w := by
    have hh := Real.rpow_le_rpow_of_exponent_le hqR (show -(1 + t) ≤ -1 by linarith)
    rw [Real.rpow_neg_one] at hh
    have ha : (0 : ℝ) < A (n + 1) w := by exact_mod_cast A_pos w
    calc
      _ = (q : ℝ) ^ (-(1 + t)) := by dsimp [ρ]; ring
      _ ≤ 1 / (q : ℝ) := by simpa [one_div] using hh
      _ ≤ _ := one_div_le_one_div_of_le ha (by exact_mod_cast hwq)
  have hρψ : 4 * ρ ≤ ψ (Q n w) / Q n w := by
    have hQ : Q n w ≤ q := (Q_le_A n w).trans hwq
    have hQpos : (0 : ℝ) < Q n w := by exact_mod_cast Q_pos w
    rw [hρq]
    calc
      _ ≤ (q : ℝ) ^ (-t) / Q n w :=
        div_le_div_of_nonneg_left (Real.rpow_nonneg hqpos.le _) hQpos (by exact_mod_cast hQ)
      _ ≤ _ := div_le_div_of_nonneg_right (hψ.trans (hmono hQ)) hQpos.le
  have hy : y ∈ cylinder w := ⟨by dsimp [y, p]; linarith, by dsimp [y, p]; linarith⟩
  have hlen : lengthOf w ≤ 1 / R :=
    one_div_le_one_div_of_le (zero_lt_one.trans_le hR) hRw.le
  refine ⟨y, ?_, n, hn, w, ?_⟩
  · apply abs_le.mpr
    have hy₁ := hy.1
    have hy₂ := hy.2
    have hw₁ := hw.1
    have hw₂ := hw.2
    constructor <;> linarith
  · intro z hz
    have hz₁ := hz.1
    have hz₂ := hz.2
    change y ≤ z at hz₁
    change z ≤ y + ρ at hz₂
    change z ∈ cylinder w ∩ Set.Ioo p (p + ψ (Q n w) / Q n w)
    exact ⟨⟨by dsimp [y, p] at *; linarith, by dsimp [y, p] at *; linarith⟩,
      ⟨by dsimp [y] at *; linarith, by dsimp [y] at *; linarith⟩⟩

end
end RevisedTanZhou
