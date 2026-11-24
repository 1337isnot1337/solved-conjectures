import Mathlib.Analysis.Complex.Norm
import Mathlib.Tactic

/-!
# Dilcher–Kidwai–Tomkins's Stern-polynomial half-plane conjecture

An algebraic form of the finite parabolic element-set criterion used in
Section 1 of the existing proof. The real parameter is the tangent of the
angle, so rational certificate parameters require no trigonometric rounding.
The invariant half-plane proof is the finite continued-fraction formulation
credited to Altizio and the earlier Parabola Theorem in the source.
-/

namespace Conjectures.SternHalfPlane

def Parabolic (t : ℝ) (a : ℂ) : Prop :=
  (1 + t ^ 2) * ‖a‖ - (1 - t ^ 2) * a.re - 2 * t * a.im ≤ 1 / 2

def ValueHalfPlane (t : ℝ) (v : ℂ) : Prop := -(1 / 2 : ℝ) ≤ v.re + t * v.im

theorem parabolic_coordinates {t : ℝ} {a : ℂ} (ha : Parabolic t a) :
    ((1 - t ^ 2) * a.im - 2 * t * a.re) ^ 2 ≤
      (1 - t ^ 2) * a.re + 2 * t * a.im + 1 / 4 := by
  let A := (1 - t ^ 2) * a.re + 2 * t * a.im
  let B := (1 - t ^ 2) * a.im - 2 * t * a.re
  let N := (1 + t ^ 2) * ‖a‖
  have hN : 0 ≤ N := by dsimp [N]; positivity
  have hle : N ≤ A + 1 / 2 := by dsimp [N, A]; dsimp [Parabolic] at ha; linarith
  have hs : A ^ 2 + B ^ 2 = N ^ 2 := by
    dsimp [A, B, N]
    rw [mul_pow, Complex.sq_norm, Complex.normSq_apply]
    ring
  have hsq : N ^ 2 ≤ (A + 1 / 2) ^ 2 :=
    (sq_le_sq₀ hN (by linarith)).mpr hle
  change B ^ 2 ≤ A + 1 / 4
  nlinarith

theorem parabola_quadratic_nonneg {A B p q : ℝ}
    (hAB : B ^ 2 ≤ A + 1 / 4) (hp : 1 / 2 ≤ p) :
    0 ≤ p ^ 2 + q ^ 2 + 2 * A * p + 2 * B * q := by
  have hA : -(1 / 4 : ℝ) ≤ A := by nlinarith [sq_nonneg B]
  have hprod : 0 ≤ (p - 1 / 2) * (p + 1 / 2 + 2 * A) :=
    mul_nonneg (by linarith) (by linarith)
  nlinarith [sq_nonneg (q + B)]

theorem one_add_ne_zero {t : ℝ} {v : ℂ} (hv : ValueHalfPlane t v) :
    1 + v ≠ 0 := by
  intro h
  have hr := congrArg Complex.re h
  have hi := congrArg Complex.im h
  simp only [Complex.add_re, Complex.one_re, Complex.zero_re] at hr
  simp only [Complex.add_im, Complex.one_im, Complex.zero_im, zero_add] at hi
  dsimp [ValueHalfPlane] at hv
  rw [hi, mul_zero, add_zero] at hv
  linarith

theorem parabolic_div_preserves {t : ℝ} {a v : ℂ}
    (ha : Parabolic t a) (hv : ValueHalfPlane t v) :
    ValueHalfPlane t (a / (1 + v)) := by
  let u : ℂ := 1 + v
  have hu : u ≠ 0 := one_add_ne_zero hv
  have hd : 0 < Complex.normSq u := by
    rw [Complex.normSq_eq_norm_sq]
    exact sq_pos_of_pos (norm_pos_iff.mpr hu)
  have hp : 1 / 2 ≤ u.re + t * u.im := by
    dsimp [u, ValueHalfPlane] at *
    linarith
  have hq := parabola_quadratic_nonneg (parabolic_coordinates ha) hp
    (q := u.im - t * u.re)
  have he :
      (u.re + t * u.im) ^ 2 + (u.im - t * u.re) ^ 2 +
        2 * ((1 - t ^ 2) * a.re + 2 * t * a.im) * (u.re + t * u.im) +
        2 * ((1 - t ^ 2) * a.im - 2 * t * a.re) * (u.im - t * u.re) =
      (1 + t ^ 2) * (Complex.normSq u +
        2 * (a.re * u.re + a.im * u.im + t * (a.im * u.re - a.re * u.im))) := by
    rw [Complex.normSq_apply]
    ring
  rw [he] at hq
  have hn := (mul_nonneg_iff_of_pos_left (show 0 < 1 + t ^ 2 by positivity)).mp hq
  change -(1 / 2 : ℝ) ≤ (a / u).re + t * (a / u).im
  have heqdiv : (a / u).re + t * (a / u).im =
      (a.re * u.re + a.im * u.im + t * (a.im * u.re - a.re * u.im)) /
        Complex.normSq u := by
    rw [Complex.div_re, Complex.div_im]
    ring
  rw [heqdiv]
  apply (le_div_iff₀ hd).mpr
  nlinarith

noncomputable def continuedValue : List ℂ → ℂ
  | [] => 0
  | a :: l => a / (1 + continuedValue l)

theorem continuedValue_mem {t : ℝ} {l : List ℂ}
    (h : ∀ a ∈ l, Parabolic t a) : ValueHalfPlane t (continuedValue l) := by
  induction l with
  | nil => norm_num [continuedValue, ValueHalfPlane]
  | cons a l ih =>
    exact parabolic_div_preserves (h a (by simp))
      (ih (fun b hb => h b (by simp [hb])))

theorem continuedValue_denominator_ne_zero {t : ℝ} {l : List ℂ}
    (h : ∀ a ∈ l, Parabolic t a) : 1 + continuedValue l ≠ 0 :=
  one_add_ne_zero (continuedValue_mem h)

end Conjectures.SternHalfPlane
