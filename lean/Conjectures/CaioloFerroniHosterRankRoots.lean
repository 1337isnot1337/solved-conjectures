import Conjectures.CaioloFerroniHosterRankFlats
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-! # From gamma coefficients to real zeros -/

set_option linter.unusedSectionVars false

namespace CaioloFerroniHoster.Ranks

open Polynomial
open scoped Classical

noncomputable section

/-- The quantity `c₁² - 2 c₀ c₂` in Newton's inequality. -/
private def lag (p : ℝ[X]) : ℝ := p.coeff 1 ^ 2 - 2 * p.coeff 0 * p.coeff 2

private theorem lag_mul (p q : ℝ[X]) :
    lag (p * q) = lag p * q.coeff 0 ^ 2 + p.coeff 0 ^ 2 * lag q := by
  have h2 : (p * q).coeff 2 =
      p.coeff 0 * q.coeff 2 + p.coeff 1 * q.coeff 1 + p.coeff 2 * q.coeff 0 := by
    rw [coeff_mul, show Finset.antidiagonal 2 = {(0, 2), (1, 1), (2, 0)} from rfl]
    simp [add_assoc]
  simp only [lag, mul_coeff_zero, mul_coeff_one, h2]
  ring

private theorem lag_prod (m : Multiset ℝ) : 0 ≤ lag (m.map fun r => X - C r).prod := by
  induction m using Multiset.induction_on with
  | empty => simp [lag, coeff_one]
  | cons a m ih =>
    rw [Multiset.map_cons, Multiset.prod_cons, lag_mul]
    have : lag (X - C a) = 1 := by simp [lag, coeff_X, coeff_C]
    rw [this]
    positivity

/-- `Σ c X^j (1+X)^(n-2j)`. -/
def homog (l : List (ℝ × ℕ)) (n : ℕ) : ℝ[X] :=
  (l.map fun p => C p.1 * (X ^ p.2 * (1 + X) ^ (n - 2 * p.2))).sum

/-- `Σ c X^j`. -/
def gam (l : List (ℝ × ℕ)) : ℝ[X] := (l.map fun p => C p.1 * X ^ p.2).sum

private theorem eval_homog (l : List (ℝ × ℕ)) (n : ℕ) (hl : ∀ p ∈ l, 2 * p.2 ≤ n) (z x : ℂ)
    (hx : x = z * (1 + x) ^ 2) :
    ((homog l n).map (algebraMap ℝ ℂ)).eval x =
      (1 + x) ^ n * ((gam l).map (algebraMap ℝ ℂ)).eval z := by
  induction l with
  | nil => simp [homog, gam]
  | cons p l ih =>
    have h1 := ih fun q hq => hl q (List.mem_cons_of_mem _ hq)
    have h2 := hl p List.mem_cons_self
    simp only [homog, gam, List.map_cons, List.sum_cons, Polynomial.map_add, eval_add] at h1 ⊢
    rw [h1, mul_add]
    congr 1
    simp only [Polynomial.map_mul, Polynomial.map_pow, map_C, map_X, Polynomial.map_add,
      Polynomial.map_one, eval_mul, eval_pow, eval_C, eval_X, eval_add, eval_one]
    conv_rhs => rw [show n = 2 * p.2 + (n - 2 * p.2) by omega, pow_add, pow_mul]
    have : x ^ p.2 = z ^ p.2 * ((1 + x) ^ 2) ^ p.2 := by rw [← mul_pow, ← hx]
    rw [this]
    ring

private theorem real_root {p : ℝ[X]} (hp : p ≠ 0) (hs : p.Splits) {x : ℂ}
    (hx : (p.map (algebraMap ℝ ℂ)).eval x = 0) : ∃ r : ℝ, x = r := by
  rw [hs.eq_prod_roots, Polynomial.map_mul, map_C, eval_mul, eval_C, Polynomial.map_multiset_prod,
    Multiset.map_map] at hx
  rcases mul_eq_zero.1 hx with h | h
  · exfalso
    exact hp (leadingCoeff_eq_zero.1 ((map_eq_zero _).1 h))
  · rw [eval_multiset_prod, Multiset.prod_eq_zero_iff, Multiset.map_map, Multiset.mem_map] at h
    obtain ⟨r, _, hr⟩ := h
    refine ⟨r, ?_⟩
    simpa [sub_eq_zero] using hr

private theorem coeff_zero_homog (l : List (ℝ × ℕ)) (n : ℕ) :
    (homog l n).eval 0 = (gam l).eval 0 := by
  induction l with
  | nil => simp [homog, gam]
  | cons p l ih =>
    simp only [homog, gam, List.map_cons, List.sum_cons, eval_add] at ih ⊢
    rw [ih]; simp

/-- If `c₁² < 2 c₀ c₂` then `Σ c_j X^j (1+X)^(n-2j)` is not real-rooted. -/
theorem not_splits (l : List (ℝ × ℕ)) (n : ℕ) (hl : ∀ p ∈ l, 2 * p.2 ≤ n)
    (h0 : 0 < (gam l).coeff 0)
    (hbad : (gam l).coeff 1 ^ 2 < 2 * (gam l).coeff 0 * (gam l).coeff 2) :
    ¬ (homog l n).Splits := by
  intro hs
  have hne : homog l n ≠ 0 := by
    intro h
    have := coeff_zero_homog l n
    rw [h, eval_zero, ← coeff_zero_eq_eval_zero] at this
    linarith
  set G := (gam l).map (algebraMap ℝ ℂ) with hG
  have hroots : ∀ z ∈ G.roots, ∃ r : ℝ, z = r := by
    intro z hz
    have hz0 : G.eval z = 0 := (mem_roots'.1 hz).2
    have hzne : z ≠ 0 := by
      rintro rfl
      rw [← coeff_zero_eq_eval_zero, hG, coeff_map] at hz0
      exact h0.ne' ((map_eq_zero _).1 hz0)
    obtain ⟨s, hsq⟩ := IsAlgClosed.exists_pow_nat_eq (1 - 4 * z) (n := 2) (by norm_num)
    let x : ℂ := (1 - 2 * z + s) / (2 * z)
    have hx : x = z * (1 + x) ^ 2 := by
      simp only [x]
      field_simp
      ring_nf
      rw [hsq]
      ring
    have hx1 : (1 + x) ≠ 0 := by
      intro h
      have hxx := hx
      rw [h] at hxx
      have : x = 0 := by simpa using hxx
      rw [this] at h
      simp at h
    obtain ⟨r, hr⟩ := real_root hne hs (x := x) (by rw [eval_homog l n hl z x hx, hz0, mul_zero])
    refine ⟨r / (1 + r) ^ 2, ?_⟩
    have hz' : z = x / (1 + x) ^ 2 := by
      rw [eq_div_iff (pow_ne_zero 2 hx1)]; exact hx.symm
    rw [hz', hr]; push_cast; rfl
  have hfac : gam l = C (gam l).leadingCoeff *
      ((G.roots.map Complex.re).map fun r => X - C r).prod := by
    apply Polynomial.map_injective (algebraMap ℝ ℂ) (algebraMap ℝ ℂ).injective
    rw [Polynomial.map_mul, map_C, Polynomial.map_multiset_prod, Multiset.map_map, Multiset.map_map]
    have hsp := (IsAlgClosed.splits G).eq_prod_roots
    rw [← hG]
    conv_lhs => rw [hsp]
    congr 1
    · rw [hG, leadingCoeff_map]
    · congr 1
      apply Multiset.map_congr rfl
      intro z hz
      obtain ⟨r, rfl⟩ := hroots z hz
      simp
  have hL : 0 ≤ lag (gam l) := by
    rw [hfac, lag_mul]
    have h1 : lag (C (gam l).leadingCoeff) = 0 := by simp [lag, coeff_C]
    rw [h1, zero_mul, zero_add]
    exact mul_nonneg (sq_nonneg _) (lag_prod _)
  simp only [lag] at hL
  linarith

/-- `a (1+X)² + b X` has two negative real zeros when `a > 0` and `b ≥ 0`. -/
theorem quad_splits {a b : ℝ} (ha : 0 < a) (hb : 0 ≤ b) :
    ∃ u v : ℝ, u < 0 ∧ v < 0 ∧ C a * (1 + X) ^ 2 + C b * X = C a * ((X - C u) * (X - C v)) := by
  let s := Real.sqrt (b ^ 2 + 4 * a * b)
  have hs : s ^ 2 = b ^ 2 + 4 * a * b := Real.sq_sqrt (by positivity)
  have hs0 : 0 ≤ s := Real.sqrt_nonneg _
  have hlt : s < 2 * a + b := by nlinarith
  refine ⟨(-(2 * a + b) + s) / (2 * a), (-(2 * a + b) - s) / (2 * a),
    div_neg_of_neg_of_pos (by linarith) (by linarith),
    div_neg_of_neg_of_pos (by linarith) (by linarith), ?_⟩
  set u := (-(2 * a + b) + s) / (2 * a) with hu
  set v := (-(2 * a + b) - s) / (2 * a) with hv
  have h1 : a * (u + v) = -(2 * a + b) := by rw [hu, hv]; field_simp; ring
  have h2 : u * v = 1 := by
    rw [hu, hv]; field_simp; nlinarith
  have e : C a * ((X - C u) * (X - C v)) =
      C a * X ^ 2 - C (a * (u + v)) * X + C (a * (u * v)) := by
    simp only [C_mul, C_add]; ring
  rw [e, h1, h2]
  simp only [C_mul, C_add, C_neg, mul_one, C_ofNat]
  ring

/-- Real-rooted with all zeros negative. -/
def NegRooted (p : ℝ[X]) : Prop := p ≠ 0 ∧ p.Splits ∧ ∀ x, p.IsRoot x → x < 0

theorem NegRooted.mul {p q : ℝ[X]} (hp : NegRooted p) (hq : NegRooted q) : NegRooted (p * q) :=
  ⟨mul_ne_zero hp.1 hq.1, hp.2.1.mul hq.2.1, fun x hx =>
    (root_mul.1 hx).elim (hp.2.2 x) (hq.2.2 x)⟩

theorem negRooted_one : NegRooted 1 := ⟨one_ne_zero, .one, fun x hx => by simp [IsRoot] at hx⟩

theorem negRooted_C {a : ℝ} (ha : a ≠ 0) : NegRooted (C a) :=
  ⟨C_ne_zero.2 ha, .C a, fun x hx => absurd (by simpa [IsRoot] using hx) ha⟩

theorem negRooted_X_sub_C {u : ℝ} (hu : u < 0) : NegRooted (X - C u) :=
  ⟨X_sub_C_ne_zero u, .X_sub_C u, fun x hx => by
    have : x = u := by simpa [IsRoot, sub_eq_zero] using hx
    rwa [this]⟩

theorem negRooted_one_add_X : NegRooted (1 + X : ℝ[X]) := by
  have : (1 + X : ℝ[X]) = X - C (-1) := by simp [add_comm]
  rw [this]; exact negRooted_X_sub_C (by norm_num)

theorem negRooted_quad {a b : ℝ} (ha : 0 < a) (hb : 0 ≤ b) :
    NegRooted (C a * (1 + X) ^ 2 + C b * X) := by
  obtain ⟨u, v, hu, hv, h⟩ := quad_splits ha hb
  rw [h]
  exact (negRooted_C ha.ne').mul ((negRooted_X_sub_C hu).mul (negRooted_X_sub_C hv))

/-! ### Ranks at most four -/

variable {E : Type*} [Finite E] (M : Matroid E)

/-- Dual Chow polynomials over the reals. -/
abbrev realChow : ℝ[X] := (dualChow M).map (Int.castRingHom ℝ)
abbrev realAug : ℝ[X] := (dualAug M).map (Int.castRingHom ℝ)

private theorem bn {M : Matroid E} {F : Flats M} (t : List ℕ)
    (h : FlatSystem.Good (flatRk M F) t) : (0 : ℝ) ≤ (beta (flatRk M) F t : ℝ) := by
  exact_mod_cast matroid_beta_nonneg M h

private theorem bp {M : Matroid E} {F : Flats M} {n : ℕ} (h : flatRk M F = n + 1) :
    (0 : ℝ) < (beta (flatRk M) F (FlatSystem.full n) : ℝ) := by
  exact_mod_cast matroid_beta_full_pos M h

private theorem top_rank_zero (h : M.eRank = 0) : (⊤ : Flats M) = ⊥ := by
  by_contra hne
  have h1 := (flatSystem M).rk_mono (bot_lt_iff_ne_bot.2 hne)
  have h2 : (flatSystem M).rk ⊤ = 0 := flatRk_top M (r := 0) (by simpa using h)
  omega

/-- CFH Conjecture 7.3 holds in every rank at most four. -/
theorem dualChow_negRooted_of_rank_le_four {r : ℕ} (hr : M.eRank = r) (h4 : r ≤ 4) :
    NegRooted (realChow M) := by
  match r, hr, h4 with
  | 0, hr, _ =>
    have ht := top_rank_zero M (by simpa using hr)
    have : dualChow M = 1 := by
      rw [dualChow, ht, Hstar]
      have : Finset.univ.filter (fun y : Flats M => y ≤ ⊥) = {⊥} := by ext; simp
      rw [this, Finset.sum_singleton, Fstar_bot]; simp
    rw [realChow, this, Polynomial.map_one]; exact negRooted_one
  | 1, hr, _ =>
    rw [realChow, dualChow_eq M (n := 0) hr, gammaSum_zero, Polynomial.map_one]
    exact negRooted_one
  | 2, hr, _ =>
    have hk := flatRk_top M hr
    have hb := bp (n := 1) hk
    have e : realChow M = C (beta (flatRk M) ⊤ (FlatSystem.full 1) : ℝ) * (1 + X) := by
      rw [realChow, dualChow_eq M (n := 1) hr]; simp [gammaSum, stab, FlatSystem.full]
    rw [e]; exact (negRooted_C hb.ne').mul negRooted_one_add_X
  | 3, hr, _ =>
    have hk := flatRk_top M hr
    have hb := bp (n := 2) hk
    have hc := bn (F := (⊤ : Flats M)) [2] (by rw [hk]; simp [FlatSystem.Good])
    have e : realChow M = C (beta (flatRk M) ⊤ (FlatSystem.full 2) : ℝ) * (1 + X) ^ 2 +
        C (beta (flatRk M) ⊤ [2] : ℝ) * X := by
      rw [realChow, dualChow_eq M (n := 2) hr]; simp [gammaSum, stab, FlatSystem.full]
    rw [e]; exact negRooted_quad hb hc
  | 4, hr, _ =>
    have hk := flatRk_top M hr
    have hb := bp (n := 3) hk
    have hc := bn (F := (⊤ : Flats M)) [3, 2] (by rw [hk]; simp [FlatSystem.Good])
    have hd := bn (F := (⊤ : Flats M)) [3, 1] (by rw [hk]; simp [FlatSystem.Good])
    have e : realChow M = (1 + X) * (C (beta (flatRk M) ⊤ (FlatSystem.full 3) : ℝ) * (1 + X) ^ 2 +
        C ((beta (flatRk M) ⊤ [3, 2] : ℝ) + (beta (flatRk M) ⊤ [3, 1] : ℝ)) * X) := by
      rw [realChow, dualChow_eq M (n := 3) hr]; simp [gammaSum, stab, FlatSystem.full]; ring
    rw [e]; exact negRooted_one_add_X.mul (negRooted_quad hb (by linarith))

/-- The augmented statement holds in every rank at most three. -/
theorem dualAug_negRooted_of_rank_le_three {r : ℕ} (hr : M.eRank = r) (h3 : r ≤ 3) :
    NegRooted (realAug M) := by
  match r, hr, h3 with
  | 0, hr, _ =>
    have ht := top_rank_zero M (by simpa using hr)
    rw [realAug, dualAug, ht, Fstar_bot, Polynomial.map_one]; exact negRooted_one
  | 1, hr, _ =>
    have e : realAug M = 1 + X := by
      rw [realAug, dualAug_eq M (n := 0) hr]; simp [gammaSumAug, gammaSum_zero]
    rw [e]; exact negRooted_one_add_X
  | 2, hr, _ =>
    have hk := flatRk_top M hr
    have hb := bp (n := 1) hk
    have e : realAug M = C (beta (flatRk M) ⊤ (FlatSystem.full 1) : ℝ) * (1 + X) ^ 2 + C 1 * X := by
      rw [realAug, dualAug_eq M (n := 1) hr]
      simp [gammaSumAug, gammaSum, stab, beta, FlatSystem.full]; ring
    rw [e]; exact negRooted_quad hb (by norm_num)
  | 3, hr, _ =>
    have hk := flatRk_top M hr
    have hb := bp (n := 2) hk
    have hc := bn (F := (⊤ : Flats M)) [2] (by rw [hk]; simp [FlatSystem.Good])
    have hd := bn (F := (⊤ : Flats M)) [1] (by rw [hk]; simp [FlatSystem.Good])
    have e : realAug M = (1 + X) * (C (beta (flatRk M) ⊤ (FlatSystem.full 2) : ℝ) * (1 + X) ^ 2 +
        C ((beta (flatRk M) ⊤ [2] : ℝ) + (beta (flatRk M) ⊤ [1] : ℝ)) * X) := by
      rw [realAug, dualAug_eq M (n := 2) hr]
      simp [gammaSumAug, gammaSum, stab, FlatSystem.full]; ring
    rw [e]; exact negRooted_one_add_X.mul (negRooted_quad hb (by linarith))

end
end CaioloFerroniHoster.Ranks
