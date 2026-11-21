import Conjectures.JohnsonPfaffianTelescoping
open Set
namespace JohnsonPfaffian

noncomputable def sourceLogMatrix (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n a b : ℕ) : ℝ :=
  if a=0 ∨ b=n then 0 else Real.log (f (nodes b-nodes (a-1))) - Real.log (f (nodes (n-1)-nodes 0))

theorem source_interior_coefficient_nonnegative (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n a b : ℕ)
    (hnodes : StrictMono nodes)
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (ha : 0 < a) (hab : a < b) (hb : b+1 < n) :
    0 ≤ intervalCoefficient (sourceLogMatrix f nodes n) a b := by
  have hA : 0 < nodes a-nodes (a-1) := sub_pos.mpr (hnodes (by omega))
  have hB : 0 < nodes b-nodes a := sub_pos.mpr (hnodes hab)
  have hC : 0 < nodes (b+1)-nodes b := sub_pos.mpr (hnodes (by omega))
  have hh := logconvex_interval_coefficient_nonnegative f hconv
    (nodes a-nodes (a-1)) (nodes b-nodes a) (nodes (b+1)-nodes b) hA hB hC
  have h1 : (nodes b-nodes a)+(nodes a-nodes (a-1))=nodes b-nodes (a-1) := by ring
  have h2 : (nodes b-nodes a)+(nodes (b+1)-nodes b)=nodes (b+1)-nodes a := by ring
  have h3 : (nodes b-nodes a)+(nodes a-nodes (a-1))+(nodes (b+1)-nodes b)=nodes (b+1)-nodes (a-1) := by ring
  simp only [h1,h2,h3] at hh
  unfold intervalCoefficient sourceLogMatrix
  simp only [show a+1 ≠ 0 by omega, show a ≠ 0 by omega, show b ≠ n by omega,
    show b+1 ≠ n by omega, false_or, if_false, Nat.add_sub_cancel]
  have h4 : nodes b-nodes (a-1)+(nodes (b+1)-nodes b)=nodes (b+1)-nodes (a-1) := by ring
  rw [h4] at hh
  linarith

theorem source_left_coefficient_nonnegative (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n b : ℕ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0)) (hb0 : 0 < b) (hb : b+1 < n) :
    0 ≤ intervalCoefficient (sourceLogMatrix f nodes n) 0 b := by
  have hd : 0 < nodes b-nodes 0 := sub_pos.mpr (hnodes hb0)
  have hD : 0 < nodes (b+1)-nodes 0 := sub_pos.mpr (hnodes (by omega))
  have hle : nodes b-nodes 0 ≤ nodes (b+1)-nodes 0 := by have hh := hnodes (show b<b+1 by omega); linarith
  have hh := log_boundary_coefficient_nonnegative f hf hanti (nodes b-nodes 0) (nodes (b+1)-nodes 0) hd hD hle
  unfold intervalCoefficient sourceLogMatrix
  simp only [show (0:ℕ)+1 ≠ 0 by omega, show b ≠ n by omega, show b+1 ≠ n by omega,
    false_or, true_or, if_false, if_true, Nat.add_sub_cancel]
  linarith

theorem source_right_coefficient_nonnegative (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n a b : ℕ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0)) (ha : 0 < a) (hab : a < b) (hb : b+1 = n) :
    0 ≤ intervalCoefficient (sourceLogMatrix f nodes n) a b := by
  have hd : 0 < nodes b-nodes a := sub_pos.mpr (hnodes hab)
  have hD : 0 < nodes b-nodes (a-1) := sub_pos.mpr (hnodes (by omega))
  have hle : nodes b-nodes a ≤ nodes b-nodes (a-1) := by have hh := hnodes (show a-1<a by omega); linarith
  have hh := log_boundary_coefficient_nonnegative f hf hanti (nodes b-nodes a) (nodes b-nodes (a-1)) hd hD hle
  unfold intervalCoefficient sourceLogMatrix
  simp only [show a+1 ≠ 0 by omega, show a ≠ 0 by omega, show b ≠ n by omega,
    hb, false_or, or_true, if_false, if_true, Nat.add_sub_cancel]
  linarith

theorem source_corner_coefficient_zero (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n b : ℕ)
    (hb : b+1 = n) : intervalCoefficient (sourceLogMatrix f nodes n) 0 b = 0 := by
  unfold intervalCoefficient sourceLogMatrix
  have hbn : b ≠ n := by omega
  have hlast : n-1=b := by omega
  simp [hb,hbn,hlast]

theorem source_all_coefficients_nonnegative (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n a b : ℕ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (hab : a < b) (hb : b < n) :
    0 ≤ intervalCoefficient (sourceLogMatrix f nodes n) a b := by
  by_cases ha : a=0
  · subst a
    by_cases hlast : b+1=n
    · rw [source_corner_coefficient_zero f nodes n b hlast]
    · exact source_left_coefficient_nonnegative f nodes n b hnodes hf hanti (by omega) (by omega)
  · by_cases hlast : b+1=n
    · exact source_right_coefficient_nonnegative f nodes n a b hnodes hf hanti (by omega) hab hlast
    · exact source_interior_coefficient_nonnegative f nodes n a b hnodes hconv (by omega) hab (by omega)

theorem source_kernel_all_interval_factors (f : ℝ → ℝ) (nodes : ℕ → ℝ) (n i j : ℕ)
    (hnodes : StrictMono nodes) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Ioi 0))
    (hconv : ConvexOn ℝ (Ioi 0) (fun x => Real.log (f x)))
    (hn : 2 ≤ n) (hi : 0 < i) (hij : i ≤ j) (hj : j<n) :
    f (nodes j-nodes (i-1)) = f (nodes (n-1)-nodes 0) *
      ∏ a ∈ Finset.range i, ∏ k ∈ Finset.range (n-j),
        Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) a (j+k)) ∧
    (∀ a < i, ∀ k < n-j, 1 ≤ Real.exp (intervalCoefficient (sourceLogMatrix f nodes n) a (j+k))) := by
  have hd : 0 < nodes j-nodes (i-1) := sub_pos.mpr (hnodes (by omega))
  have hD : 0 < nodes (n-1)-nodes 0 := sub_pos.mpr (hnodes (by omega))
  have hsum : j+(n-j)=n := by omega
  have hval : sourceLogMatrix f nodes n i j =
      Real.log (f (nodes j-nodes (i-1)))-Real.log (f (nodes (n-1)-nodes 0)) := by
    simp [sourceLogMatrix, show i ≠ 0 by omega, show j ≠ n by omega]
  have h0 : sourceLogMatrix f nodes n 0 j = 0 := by simp [sourceLogMatrix]
  have hN : sourceLogMatrix f nodes n i (j+(n-j)) = 0 := by simp [sourceLogMatrix,hsum]
  have h00 : sourceLogMatrix f nodes n 0 (j+(n-j)) = 0 := by simp [sourceLogMatrix]
  constructor
  · exact source_kernel_interval_product f _ _ (hf _ hd) (hf _ hD) _ i j (n-j) hval h0 hN h00
  · intro a ha k hk
    apply interval_factor_at_least_one
    exact source_all_coefficients_nonnegative f nodes n a (j+k) hnodes hf hanti hconv (by omega) (by omega)
end JohnsonPfaffian
