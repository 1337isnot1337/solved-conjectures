import Mathlib.Analysis.Convex.Function
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic.Convert
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Mathlib.Tactic.SplitIfs
import Mathlib.Tactic.Tauto
open Set
namespace JohnsonPfaffian

theorem convex_four_point (g : ℝ → ℝ) (h : ConvexOn ℝ (Ioi 0) g)
    (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    g (b+a) + g (b+c) ≤ g b + g (b+a+c) := by
  have hs : 0 < a+c := by positivity
  have hα : 0 ≤ a/(a+c) := by positivity
  have hβ : 0 ≤ c/(a+c) := by positivity
  have hab : a/(a+c)+c/(a+c)=1 := by field_simp
  have h1 := h.2 (show b ∈ Ioi 0 from hb) (show b+a+c ∈ Ioi 0 by change 0 < b+a+c; positivity) hβ hα (by linarith)
  have h2 := h.2 (show b ∈ Ioi 0 from hb) (show b+a+c ∈ Ioi 0 by change 0 < b+a+c; positivity) hα hβ hab
  simp only [smul_eq_mul] at h1 h2
  have he1 : c/(a+c)*b + a/(a+c)*(b+a+c) = b+a := by field_simp; ring
  have he2 : a/(a+c)*b + c/(a+c)*(b+a+c) = b+c := by field_simp; ring
  rw [he1] at h1
  rw [he2] at h2
  have he3 : c/(a+c)*g b + a/(a+c)*g (b+a+c) + (a/(a+c)*g b + c/(a+c)*g (b+a+c)) = g b + g (b+a+c) := by field_simp; ring
  linarith

theorem logconvex_crossing (f : ℝ → ℝ) (hf : ∀ x > 0, 0 < f x)
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    f (b+a)*f (b+c) ≤ f b*f (b+a+c) := by
  have h := convex_four_point (fun x => Real.log (f x)) hconv a b c ha hb hc
  have hh := Real.exp_le_exp.mpr h
  rw [Real.exp_add, Real.exp_add, Real.exp_log (hf _ (by positivity)), Real.exp_log (hf _ (by positivity)),
    Real.exp_log (hf _ hb), Real.exp_log (hf _ (by positivity))] at hh
  exact hh

theorem four_node_kernel (f : ℝ → ℝ) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    let p := f a*f c - f (a+b)*f (b+c) + f (a+b+c)*f b
    f a*f c ≤ p ∧ f (a+b)*f (b+c) ≤ p ∧ f (a+b+c)*f b ≤ p := by
  dsimp
  have hcross := logconvex_crossing f hf hconv a b c ha hb hc
  have hleft : f (a+b) ≤ f a := hanti (show a ∈ Ioi 0 from ha) (show a+b ∈ Ioi 0 by change 0<a+b; positivity) (by linarith)
  have hright : f (b+c) ≤ f c := hanti (show c ∈ Ioi 0 from hc) (show b+c ∈ Ioi 0 by change 0<b+c; positivity) (by linarith)
  have hprod : f (a+b)*f (b+c) ≤ f a*f c := mul_le_mul hleft hright (hf _ (by positivity)).le (hf _ ha).le
  have hr : f (a+b)*f (b+c) ≤ f (a+b+c)*f b := by
    simpa [add_comm, add_left_comm, add_assoc, mul_comm] using hcross
  constructor <;> [linarith; constructor <;> linarith]

noncomputable def pfaffian4 (f : ℝ → ℝ) (x₁ x₂ x₃ x₄ : ℝ) : ℝ :=
  f (x₂-x₁)*f (x₄-x₃) - f (x₃-x₁)*f (x₄-x₂) + f (x₄-x₁)*f (x₃-x₂)

theorem four_node_source_conjecture (f : ℝ → ℝ) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (x₁ x₂ x₃ x₄ : ℝ) (h12 : x₁ < x₂) (h23 : x₂ < x₃) (h34 : x₃ < x₄) :
    f (x₂-x₁)*f (x₄-x₃) ≤ pfaffian4 f x₁ x₂ x₃ x₄ ∧
    f (x₃-x₁)*f (x₄-x₂) ≤ pfaffian4 f x₁ x₂ x₃ x₄ ∧
    f (x₄-x₁)*f (x₃-x₂) ≤ pfaffian4 f x₁ x₂ x₃ x₄ := by
  have hh := four_node_kernel f hf hanti hconv (x₂-x₁) (x₃-x₂) (x₄-x₃)
    (by linarith) (by linarith) (by linarith)
  have ha : (x₂-x₁)+(x₃-x₂)=x₃-x₁ := by ring
  have hb : (x₃-x₂)+(x₄-x₃)=x₄-x₂ := by ring
  have hc : (x₂-x₁)+(x₃-x₂)+(x₄-x₃)=x₄-x₁ := by ring
  have hd : (x₃-x₁)+(x₄-x₃)=x₄-x₁ := by ring
  simpa only [pfaffian4, ha, hb, hc, hd] using hh
end JohnsonPfaffian
