import Conjectures.AGYStepanov.PlaneCurvePointUpperBound
import Conjectures.AsgarliGhiocaYipPlaneDegree

/-! # The polynomial Stepanov bound with the AGY error budget -/

namespace Conjectures.AsgarliGhiocaYip

open Polynomial Finset
open scoped Polynomial.Bivariate

variable {K E : Type*} [Field K] [Fintype K] [Field E] [Algebra K E] [IsAlgClosed E]

omit [Fintype K] [Field K] [Algebra K E] [IsAlgClosed E] in
/-- A monic divisor of a plane polynomial with total degree equal to its
ordinate degree again has total degree equal to its ordinate degree. -/
theorem weightedDegree_one_of_monic_divisor {P F : PlanePolynomial E} (hP : P.Monic)
    (hF : F.Monic) (hd : F ∣ P) (hcoeff : ∀ j, (P.coeff j).natDegree ≤ P.natDegree - j) :
    Bivariate.WeightedDegreeLE 1 F.natDegree F := by
  obtain ⟨H, hH⟩ := hd
  have hmH : H.Monic := hF.of_mul_monic_left (hH ▸ hP)
  have htot := planeTotalDegree_le le_rfl hcoeff
  have hF0 : Bivariate.equivMvPolynomial E F ≠ 0 := by
    simpa only [map_zero] using (Bivariate.equivMvPolynomial E).injective.ne hF.ne_zero
  have hH0 : Bivariate.equivMvPolynomial E H ≠ 0 := by
    simpa only [map_zero] using (Bivariate.equivMvPolynomial E).injective.ne hmH.ne_zero
  have hHdeg := Bivariate.natDegree_le_totalDegree H
  unfold planeTotalDegree at htot
  rw [hH, map_mul, MvPolynomial.totalDegree_mul_of_isDomain hF0 hH0, hF.natDegree_mul hmH] at htot
  intro j hj
  have hj' := Bivariate.natDegree_coeff_add_le_totalDegree F j hj
  simp only [one_mul]
  omega

set_option maxHeartbeats 800000 in
/-- Bound the number of good points on one geometric factor satisfying one
twisted Frobenius equation. No descent of the curve or of the twist is needed. -/
theorem card_twisted_frobenius_le {F R B : PlanePolynomial E} (hF : F.Monic)
    (hi : Irreducible F) (hder : F.derivative ≠ 0) {N D : ℕ} (hN : 0 < N)
    (hmN : F.natDegree ≤ N) (hND : 2 * N ≤ D) (hq : D^8 ≤ Fintype.card K)
    (hw : Bivariate.WeightedDegreeLE 1 F.natDegree F)
    (hR : Bivariate.WeightedDegreeLE 1 N R) (hB : Bivariate.WeightedDegreeLE 1 N B)
    (S : Finset (E × E))
    (hS : ∀ P ∈ S, planeEval P.1 P.2 F = 0 ∧ planeEval P.1 P.2 F.derivative ≠ 0 ∧
      P.1 ^ Fintype.card K = P.1 ∧ planeEval P.1 P.2 B ≠ 0 ∧
      planeEval P.1 P.2 B * P.2 ^ Fintype.card K = planeEval P.1 P.2 R) :
    (S.card : ℝ) ≤ Fintype.card K + 8 * (N : ℝ)^2 * Real.sqrt (Fintype.card K) := by
  classical
  let q := Fintype.card K
  let m := F.natDegree
  have hm : 0 < m := hF.natDegree_pos_of_not_isUnit hi.not_isUnit
  obtain ⟨p, hpK, n, hp, hcard⟩ := FiniteField.card' K
  let : Fact p.Prime := ⟨hp⟩
  let : CharP K p := hpK
  let : CharP E p := charP_of_injective_algebraMap (algebraMap K E).injective p
  let : PerfectRing E p := PerfectField.toPerfectRing p
  let e : ℕ := n
  let a := e / 2
  let b := e - a
  let ρ := p ^ a
  let σ := p ^ b
  have hab : a + b = e := by dsimp [b]; omega
  have hqe : q = p ^ e := hcard
  have hqrs : q = ρ * σ := by rw [hqe, ← hab, pow_add]
  have he : 0 < e := n.pos
  have hρ : 1 ≤ ρ := Nat.one_le_pow _ _ hp.pos
  obtain ⟨l, hl, hlp, hlρ, hσl⟩ := Bivariate.exists_stepanov_k p e hp
  change l^2 * ρ ≤ σ at hlρ
  change σ ≤ 4 * l^2 * ρ at hσl
  have hqrs' : (q : ℝ) = (ρ : ℝ) * σ := by exact_mod_cast hqrs
  have hl' : (1 : ℝ) ≤ l := by exact_mod_cast hl
  have hq0 : (0 : ℝ) ≤ q := by positivity
  have hroot0 := Real.sqrt_nonneg (q : ℝ)
  have hrootSq := Real.sq_sqrt hq0
  have hlroot : (l : ℝ) * Real.sqrt q ≤ σ := by
    apply le_of_pow_le_pow_left₀ (by decide : 2 ≠ 0) (by positivity)
    rw [mul_pow, hrootSq, hqrs']
    have h : (l : ℝ)^2 * ρ ≤ σ := by exact_mod_cast hlρ
    nlinarith [mul_le_mul_of_nonneg_right h (show (0 : ℝ) ≤ σ by positivity)]
  have hσroot : (σ : ℝ) ≤ 2 * l * Real.sqrt q := by
    apply le_of_pow_le_pow_left₀ (by decide : 2 ≠ 0) (by positivity)
    rw [mul_pow, hrootSq, hqrs']
    have h : (σ : ℝ) ≤ 4 * (l : ℝ)^2 * ρ := by exact_mod_cast hσl
    nlinarith [mul_le_mul_of_nonneg_right h (show (0 : ℝ) ≤ σ by positivity)]
  have hDroot : (D : ℝ)^4 ≤ Real.sqrt q := by
    apply le_of_pow_le_pow_left₀ (by decide : 2 ≠ 0) (by positivity)
    rw [← pow_mul, hrootSq]
    exact_mod_cast hq
  have hNroot : 16 * (N : ℝ)^4 ≤ Real.sqrt q := by
    have h : 2 * (N : ℝ) ≤ D := by exact_mod_cast hND
    calc
      _ = (2 * (N : ℝ))^4 := by ring
      _ ≤ (D : ℝ)^4 := by gcongr
      _ ≤ _ := hDroot
  let A := m * (1 * (m - 1) + 1)
  let c := A + 1 * m^2 + 1
  let C₀ := 1 + c + m * (1 * (m - 1))
  let V := c + m * (N * m + 1)
  have hA : A = m^2 := by
    dsimp [A]; rw [one_mul, Nat.sub_add_cancel hm, pow_two]
  have hc : c = 2 * m^2 + 1 := by simp [c, hA, two_mul]
  have hN' : (1 : ℝ) ≤ N := by exact_mod_cast hN
  have hmN' : (m : ℝ) ≤ N := by exact_mod_cast hmN
  have hNm : (m : ℝ)^2 ≤ (N : ℝ)^2 := by gcongr
  have hn₂ : (1 : ℝ) ≤ (N : ℝ)^2 := by nlinarith [sq_nonneg ((N : ℝ) - 1)]
  have hn₄ : (N : ℝ)^2 ≤ (N : ℝ)^4 := by
    nlinarith [mul_le_mul_of_nonneg_left hn₂ (sq_nonneg (N : ℝ))]
  have hC₀ : (C₀ : ℝ) ≤ 4 * (N : ℝ)^2 := by
    have hm₁ : 1 ≤ m := hm
    dsimp [C₀]; rw [hc, one_mul]
    push_cast [Nat.cast_sub hm₁]
    nlinarith [sq_nonneg ((m : ℝ) - 1), show (1 : ℝ) ≤ m by exact_mod_cast hm₁]
  have hσ1 : 2 * (A * (c + 1)) + 1 ≤ σ := by
    rw [hA, hc]
    have hh : (m : ℝ)^4 ≤ (N : ℝ)^4 := by gcongr
    have hbnd : (2 : ℝ) * ((m : ℝ)^2 * (2 * (m : ℝ)^2 + 1 + 1)) + 1 ≤ σ := by
      nlinarith [mul_le_mul_of_nonneg_right hl' hroot0]
    exact_mod_cast hbnd
  have hσ2 : 2 * (l * V) ≤ σ := by
    have hV : (2 : ℝ) * V ≤ Real.sqrt q := by
      have hN3 : (N : ℝ)^3 ≤ (N : ℝ)^4 := by
        nlinarith [mul_le_mul_of_nonneg_right hN' (show (0 : ℝ) ≤ (N : ℝ)^3 by positivity)]
      have hNm' : (m : ℝ) * (N * (m : ℝ) + 1) ≤ (N : ℝ) * (N * (N : ℝ) + 1) := by gcongr
      have hNN : (N : ℝ) ≤ (N : ℝ)^2 := by nlinarith [sq_nonneg ((N : ℝ) - 1)]
      dsimp [V]; rw [hc]
      push_cast
      nlinarith
    have h := (mul_le_mul_of_nonneg_left hV (show (0 : ℝ) ≤ l by positivity)).trans hlroot
    exact_mod_cast (show (2 : ℝ) * (l * (V : ℝ)) ≤ σ by linarith)
  obtain ⟨aV, aW, hV, hcount, hfin⟩ :=
    Bivariate.stepanov_parameters_with_threshold m 1 N hm ρ σ l hl hρ hlρ hσ1 hσ2
  have hlq : l * ρ ≤ p ^ (a + b) := by
    rw [hab, ← hqe, hqrs]
    exact ((Nat.mul_le_mul_right ρ (Nat.le_self_pow two_ne_zero l)).trans hlρ).trans
      (Nat.le_mul_of_pos_left _ hρ)
  have hpoints : ∀ P ∈ S, F.evalEval P.1 P.2 = 0 ∧ F.derivative.evalEval P.1 P.2 ≠ 0 ∧
      P.1 ^ p ^ (a + b) = P.1 ∧ B.evalEval P.1 P.2 ≠ 0 ∧
      B.evalEval P.1 P.2 * P.2 ^ p ^ (a + b) = R.evalEval P.1 P.2 := by
    intro P hP
    rw [hab, ← hqe]
    simpa [planeEval, specialize, map_evalRingHom_eval] using hS P hP
  have hmain : l * S.card ≤ l * ρ * σ + σ * C₀ :=
    (Bivariate.card_mul_le_of_stepanov p hF hi hder (w := 1) (rfl : F.natDegree = m)
      (by simpa only [one_mul] using hw) hR hB hlp hlq hV hcount S hpoints).trans hfin
  have hmain' : (l : ℝ) * S.card ≤ l * ρ * σ + σ * C₀ := by exact_mod_cast hmain
  apply le_of_mul_le_mul_left _ (show (0 : ℝ) < l by linarith)
  have h1 := mul_le_mul_of_nonneg_right hσroot (show (0 : ℝ) ≤ C₀ by positivity)
  have h2 := mul_le_mul_of_nonneg_right hC₀ (show (0 : ℝ) ≤ 2 * l * Real.sqrt q by positivity)
  nlinarith

end Conjectures.AsgarliGhiocaYip
