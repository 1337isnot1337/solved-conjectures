import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.Tactic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

Elementary analytic interfaces for the existing recorded proof in
`results/feldheim-weighted-tail/PROOF.md`, commit
`2f800fa5191a1d747f126fa20f7e9c2b3730b085`.

Naomi Dvora Feldheim and Ohad Noy Feldheim posed Conjecture 1 in
*Mean and Minimum of Independent Random Variables*, §1.1,
arXiv:1609.03004v3, Israel J. Math. 244 (2021), 857–882.
Cinna Davis recorded the argument used here. The source credits the
authors' earlier equal-weight and identical-law results and does not
infer worldwide priority from its bounded literature search.

These definitions and algebraic lemmas are ingredients. They do not by
themselves assert the probability theorem.
-/

open Set

namespace Conjectures.FeldheimWeightedTail

noncomputable section

/-- The fixed-weight approximate Wright inequality in the recorded proof. -/
def WrightBoundOn (F : ℝ → ℝ) (S : Set ℝ) (t e : ℝ) : Prop :=
  ∀ x ∈ S, ∀ y ∈ S,
    F ((1-t)*x+t*y) + F (t*x+(1-t)*y) ≤ F x+F y+e

/-- The rectangle inequality forced by an eventually bounded probability ratio. -/
def RectangleBoundOn (f g : ℝ → ℝ) (S : Set ℝ) (t L : ℝ) : Prop :=
  ∀ x ∈ S, ∀ y ∈ S,
    f (t*x+(1-t)*y) + g (t*x+(1-t)*y) ≤ f x+g y+L

def wrightConstant (t : ℝ) : ℝ := max 3 (1+(1-t)/t^2)

/-- A uniform additive upper bound above every chord on a half-line. -/
def ChordBoundOn (F : ℝ → ℝ) (T E : ℝ) : Prop :=
  ∀ a, T ≤ a → ∀ b, a < b → ∀ z ∈ Icc a b,
    F z ≤ ((b-z)/(b-a))*F a+((z-a)/(b-a))*F b+E

theorem convexCombination_mem_unit {t x y : ℝ}
    (ht : 0 ≤ t) (ht1 : t ≤ 1) (hx : x ∈ Icc (0 : ℝ) 1)
    (hy : y ∈ Icc (0 : ℝ) 1) : (1-t)*x+t*y ∈ Icc (0 : ℝ) 1 := by
  constructor
  · exact add_nonneg (mul_nonneg (sub_nonneg.mpr ht1) hx.1) (mul_nonneg ht hy.1)
  · have h₁ := mul_le_mul_of_nonneg_left hx.2 (by linarith : 0 ≤ 1-t)
    have h₂ := mul_le_mul_of_nonneg_left hy.2 ht
    nlinarith

theorem WrightBoundOn.mono {F : ℝ → ℝ} {S T : Set ℝ} {t e : ℝ}
    (h : WrightBoundOn F S t e) (hTS : T ⊆ S) : WrightBoundOn F T t e := by
  intro x hx y hy
  exact h x (hTS hx) y (hTS hy)

theorem WrightBoundOn.symm_weight {F : ℝ → ℝ} {S : Set ℝ} {t e : ℝ}
    (h : WrightBoundOn F S t e) : WrightBoundOn F S (1-t) e := by
  intro x hx y hy
  have hh := h x hx y hy
  simp only [sub_sub_cancel] at *
  linarith

theorem RectangleBoundOn.wright {f g : ℝ → ℝ} {S : Set ℝ} {t L : ℝ}
    (h : RectangleBoundOn f g S t L) :
    WrightBoundOn (fun x => f x+g x) S t (2*L) := by
  intro x hx y hy
  have h₁ := h x hx y hy
  have h₂ := h y hy x hx
  have he : t*y+(1-t)*x = (1-t)*x+t*y := by ring
  rw [he] at h₂
  dsimp only
  linarith

theorem WrightBoundOn.sub_affine {F : ℝ → ℝ} {S : Set ℝ} {t e : ℝ}
    (h : WrightBoundOn F S t e) (s c : ℝ) :
    WrightBoundOn (fun x => F x-(s*x+c)) S t e := by
  intro x hx y hy
  have hh := h x hx y hy
  dsimp only
  nlinarith

theorem WrightBoundOn.comp_affine {F : ℝ → ℝ} {S T : Set ℝ} {t e a b : ℝ}
    (h : WrightBoundOn F S t e) (hmap : ∀ x ∈ T, a*x+b ∈ S) :
    WrightBoundOn (fun x => F (a*x+b)) T t e := by
  intro x hx y hy
  have hh := h (a*x+b) (hmap x hx) (a*y+b) (hmap y hy)
  have he₁ : (1-t)*(a*x+b)+t*(a*y+b) = a*((1-t)*x+t*y)+b := by ring
  have he₂ : t*(a*x+b)+(1-t)*(a*y+b) = a*(t*x+(1-t)*y)+b := by ring
  simpa only [he₁, he₂] using hh

theorem WrightBoundOn.reflect_unit {F : ℝ → ℝ} {t e : ℝ}
    (h : WrightBoundOn F (Icc (0 : ℝ) 1) t e) :
    WrightBoundOn (fun x => F (1-x)) (Icc (0 : ℝ) 1) t e := by
  have hh := h.comp_affine (a := -1) (b := 1) (T := Icc (0 : ℝ) 1) (by
    intro x hx
    constructor <;> linarith [hx.1, hx.2])
  simpa only [neg_one_mul, neg_add_eq_sub] using hh

theorem wrightConstant_ge_three (t : ℝ) : 3 ≤ wrightConstant t := le_max_left _ _

theorem wrightConstant_ge_interior (t : ℝ) :
    1+(1-t)/t^2 ≤ wrightConstant t := le_max_right _ _

end

end Conjectures.FeldheimWeightedTail
