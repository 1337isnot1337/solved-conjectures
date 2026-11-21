import Conjectures.JohnsonPfaffianFour
open Set
namespace JohnsonPfaffian

theorem kernel_uncrossing (f : ℝ → ℝ) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (x₁ x₂ x₃ x₄ : ℝ) (h12 : x₁ < x₂) (h23 : x₂ < x₃) (h34 : x₃ < x₄) :
    f (x₃-x₁)*f (x₄-x₂) ≤ f (x₂-x₁)*f (x₄-x₃) ∧
    f (x₃-x₁)*f (x₄-x₂) ≤ f (x₄-x₁)*f (x₃-x₂) := by
  have a : 0 < x₂-x₁ := by linarith
  have b : 0 < x₃-x₂ := by linarith
  have c : 0 < x₄-x₃ := by linarith
  have hleft : f (x₃-x₁) ≤ f (x₂-x₁) := hanti (show x₂-x₁ ∈ Ioi 0 from a) (show x₃-x₁ ∈ Ioi 0 by change 0<x₃-x₁; linarith) (by linarith)
  have hright : f (x₄-x₂) ≤ f (x₄-x₃) := hanti (show x₄-x₃ ∈ Ioi 0 from c) (show x₄-x₂ ∈ Ioi 0 by change 0<x₄-x₂; linarith) (by linarith)
  constructor
  · exact mul_le_mul hleft hright (hf _ (by linarith)).le (hf _ a).le
  · have hh := logconvex_crossing f hf hconv (x₂-x₁) (x₃-x₂) (x₄-x₃) a b c
    have h1 : (x₃-x₂)+(x₂-x₁)=x₃-x₁ := by ring
    have h2 : (x₃-x₂)+(x₄-x₃)=x₄-x₂ := by ring
    have h3 : (x₃-x₂)+(x₂-x₁)+(x₄-x₃)=x₄-x₁ := by ring
    have h4 : (x₃-x₁)+(x₄-x₃)=x₄-x₁ := by ring
    simpa only [h1,h2,h3,h4,mul_comm] using hh

theorem uncrossing_improves_matching (f : ℝ → ℝ) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (nodes : ℕ → ℝ) (hnodes : StrictMono nodes) (i j k l : ℕ)
    (hij : i<j) (hjk : j<k) (hkl : k<l) (W : ℝ) (hW : 0 ≤ W) :
    W*(f (nodes k-nodes i)*f (nodes l-nodes j)) ≤
      W*(f (nodes j-nodes i)*f (nodes l-nodes k)) ∧
    W*(f (nodes k-nodes i)*f (nodes l-nodes j)) ≤
      W*(f (nodes l-nodes i)*f (nodes k-nodes j)) ∧
    (j-i)+(l-k) < (k-i)+(l-j) := by
  have hh := kernel_uncrossing f hf hanti hconv (nodes i) (nodes j) (nodes k) (nodes l)
    (hnodes hij) (hnodes hjk) (hnodes hkl)
  exact ⟨mul_le_mul_of_nonneg_left hh.1 hW, mul_le_mul_of_nonneg_left hh.2 hW, by omega⟩
end JohnsonPfaffian
