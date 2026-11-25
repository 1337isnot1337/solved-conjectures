import Conjectures.NemethSeberryShuConcentration
import Conjectures.NemethSeberryShuFourierRepair
import Conjectures.NemethSeberryShuFourierTarget
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-! The exact, all-frequency support sampling and cardinality repair from
the Németh–Seberry–Shu proof. -/

open Finset

namespace NemethSeberryShu

noncomputable section

variable {p : ℕ} [NeZero p]

/-- Fourier coefficient of the indicator of a support. -/
def supportFourier (S : Finset (ZMod p)) (l : ZMod p) : ℂ :=
  ∑ i ∈ S, ZMod.stdAddChar (l * i)

/-- Fourier mean of the independent inclusion model. -/
def inclusionFourier (ρ a : ℝ) (l : ZMod p) : ℂ :=
  ∑ i : ZMod p, (inclusionProbability ρ a i : ℂ) * ZMod.stdAddChar (l * i)

private def realMode (l : ZMod p × Bool) (i : ZMod p) : ℝ :=
  if l.2 then (ZMod.stdAddChar (l.1 * i)).im else (ZMod.stdAddChar (l.1 * i)).re

private theorem realMode_bound (l : ZMod p × Bool) (i : ZMod p) : |realMode l i| ≤ 1 := by
  have hnorm : ‖ZMod.stdAddChar (l.1 * i)‖ = 1 := by simp [ZMod.stdAddChar_apply]
  cases l with
  | mk l b =>
    cases b
    · exact (Complex.abs_re_le_norm _).trans_eq hnorm
    · exact (Complex.abs_im_le_norm _).trans_eq hnorm

private theorem fourier_tail_small (hp : 2 ≤ p) :
    2 * (Fintype.card (ZMod p × Bool) : ℝ) *
      Real.exp (-(2 * (Real.sqrt (2 * (p : ℝ) * Real.log p)) ^ 2) /
        (Fintype.card (ZMod p) : ℝ)) < 1 := by
  have hp2 : (2 : ℝ) ≤ p := by exact_mod_cast hp
  have hp0 : (0 : ℝ) < p := by linarith
  have hlog : 0 ≤ Real.log p := Real.log_nonneg (by linarith)
  rw [Fintype.card_prod]
  simp only [ZMod.card, Fintype.card_bool]
  push_cast
  rw [Real.sq_sqrt (by positivity : 0 ≤ 2 * (p : ℝ) * Real.log p)]
  rw [show -(2 * (2 * (p : ℝ) * Real.log p)) / p = -(4 * Real.log p) by
    field_simp [hp0.ne']
    ring]
  rw [Real.exp_neg, show (4 : ℝ) = ((4 : ℕ) : ℝ) by norm_num,
    Real.exp_nat_mul, Real.exp_log hp0]
  have hpow : (2 : ℝ) ^ 3 ≤ (p : ℝ) ^ 3 := pow_le_pow_left₀ (by norm_num) hp2 3
  have hp4 : 4 * (p : ℝ) < (p : ℝ) ^ 4 := by
    calc
      _ < (2 : ℝ) ^ 3 * p := by norm_num; linarith
      _ ≤ (p : ℝ) ^ 3 * p := mul_le_mul_of_nonneg_right hpow hp0.le
      _ = _ := by ring
  rw [← div_eq_mul_inv]
  apply (div_lt_iff₀ (by positivity)).2
  nlinarith

/-- Every admissible bias has a single binary support whose Fourier
coefficients are uniformly within the source sampling error. -/
theorem approximate_all_fourier_modes (hp : 2 ≤ p) {ρ a : ℝ}
    (hρ₀ : 1 / 3 ≤ ρ) (hρ₁ : ρ ≤ 2 / 3) (ha₀ : 1 / 24 ≤ a) (ha₁ : a ≤ 1 / 12) :
    ∃ S : Finset (ZMod p), ∀ l,
      ‖supportFourier S l - inclusionFourier ρ a l‖ ≤ 2 * Real.sqrt ((p : ℝ) * Real.log p) := by
  let q (i : ZMod p) := (inclusionProbability ρ a i).toNNReal
  have hq (i : ZMod p) : (q i : ℝ) = inclusionProbability ρ a i :=
    Real.coe_toNNReal _ (by linarith [(inclusionProbability_bounds hρ₀ hρ₁ ha₀ ha₁ i).1])
  have hq1 (i : ZMod p) : q i ≤ 1 := by
    apply NNReal.coe_le_coe.1
    rw [hq, NNReal.coe_one]
    exact (inclusionProbability_bounds hρ₀ hρ₁ ha₀ ha₁ i).2.trans (by norm_num)
  let t := Real.sqrt (2 * (p : ℝ) * Real.log p)
  have ht : 0 ≤ t := Real.sqrt_nonneg _
  obtain ⟨S, hS⟩ := select_real_modes q hq1 realMode realMode_bound ht (fourier_tail_small hp)
  refine ⟨S, fun l => ?_⟩
  let z := supportFourier S l - inclusionFourier ρ a l
  have hre : |z.re| < t := by
    have he := hS (l, false)
    simp only [hq, realMode, Bool.false_eq_true, ite_false] at he
    simpa [z, supportFourier, inclusionFourier, Complex.sub_re, Complex.re_sum, Complex.mul_re]
      using he
  have him : |z.im| < t := by
    have he := hS (l, true)
    simp only [hq, realMode, ite_true] at he
    simpa [z, supportFourier, inclusionFourier, Complex.sub_im, Complex.im_sum, Complex.mul_im]
      using he
  have hsquare {x : ℝ} (hx : |x| < t) : x ^ 2 ≤ t ^ 2 := by
    obtain ⟨hlo, hhi⟩ := abs_lt.1 hx
    nlinarith [mul_nonneg (sub_nonneg.2 hhi.le) (show 0 ≤ t + x by linarith)]
  have hpc : (1 : ℝ) ≤ p := by exact_mod_cast (show 1 ≤ p by omega)
  have hprod : 0 ≤ (p : ℝ) * Real.log p := by
    exact mul_nonneg (by positivity) (Real.log_nonneg hpc)
  have htsq : t ^ 2 = 2 * (p : ℝ) * Real.log p := Real.sq_sqrt (by
    have hlog := Real.log_nonneg hpc
    positivity)
  have hs : ‖z‖ ^ 2 ≤ (2 * Real.sqrt ((p : ℝ) * Real.log p)) ^ 2 := by
    rw [Complex.sq_norm, Complex.normSq_apply, mul_pow, Real.sq_sqrt hprod]
    nlinarith [hsquare hre, hsquare him]
  exact le_of_sq_le_sq hs (by positivity)

private theorem supportFourier_zero (S : Finset (ZMod p)) :
    supportFourier S 0 = (S.card : ℂ) := by
  simp [supportFourier, AddChar.map_zero_eq_one]

private theorem inclusionFourier_zero [Fact p.Prime] (k : ℕ) (a : ℝ) :
    inclusionFourier ((k : ℝ) / p) a (0 : ZMod p) = (k : ℂ) := by
  have hp0 : (p : ℂ) ≠ 0 := by
    exact_mod_cast (Fact.out : p.Prime).ne_zero
  unfold inclusionFourier
  rw [inclusionProbability_fourier]
  simp [Complex.ofReal_div, hp0]

private theorem card_error_real (x y : ℕ) :
    (((x - y) + (y - x) : ℕ) : ℝ) = |(x : ℝ) - y| := by
  rcases le_total x y with h | h
  · have hr : (x : ℝ) ≤ y := by exact_mod_cast h
    rw [Nat.sub_eq_zero_of_le h, zero_add, Nat.cast_sub h, abs_of_nonpos (sub_nonpos.2 hr)]
    ring
  · have hr : (y : ℝ) ≤ x := by exact_mod_cast h
    rw [Nat.sub_eq_zero_of_le h, Nat.add_zero, Nat.cast_sub h, abs_of_nonneg (sub_nonneg.2 hr)]

/-- A binary support with precisely row sum `k`, Fourier peak amplitude
`p*a`, and the uniform error of the written sampling argument. -/
theorem exact_row_fourier_sampling [Fact p.Prime] (k : ℕ) (hk : k ≤ p) {a : ℝ}
    (hρ₀ : 1 / 3 ≤ (k : ℝ) / p) (hρ₁ : (k : ℝ) / p ≤ 2 / 3)
    (ha₀ : 1 / 24 ≤ a) (ha₁ : a ≤ 1 / 12) :
    ∃ S : Finset (ZMod p), S.card = k ∧ ∀ l,
      ‖supportFourier S l - inclusionFourier ((k : ℝ) / p) a l‖ ≤
        4 * Real.sqrt ((p : ℝ) * Real.log p) := by
  obtain ⟨U, hU⟩ := approximate_all_fourier_modes (Fact.out : p.Prime).two_le hρ₀ hρ₁ ha₀ ha₁
  let E := 2 * Real.sqrt ((p : ℝ) * Real.log p)
  have hs0 : ‖(U.card : ℂ) - (k : ℂ)‖ ≤ E := by
    simpa only [supportFourier_zero, inclusionFourier_zero] using hU 0
  have hsize : (((U.card - k) + (k - U.card) : ℕ) : ℝ) ≤ E := by
    rw [card_error_real]
    simpa only [← Complex.ofReal_natCast, ← Complex.ofReal_sub, Complex.norm_real,
      Real.norm_eq_abs] using hs0
  let modes (l i : ZMod p) := ZMod.stdAddChar (l * i)
  have hmode (l i : ZMod p) : ‖modes l i‖ ≤ 1 := by
    simp [modes, ZMod.stdAddChar_apply]
  have hkp : k ≤ Fintype.card (ZMod p) := by simpa [ZMod.card] using hk
  obtain ⟨S, hS, hError⟩ := repair_with_uniform_error U hkp modes
    (inclusionFourier ((k : ℝ) / p) a) E hmode hsize hU
  refine ⟨S, hS, fun l => ?_⟩
  have hnorm := hError l
  change ‖supportFourier S l - inclusionFourier ((k : ℝ) / p) a l‖ ≤ 2 * E at hnorm
  refine hnorm.trans_eq ?_
  dsimp [E]
  ring

end

end NemethSeberryShu
