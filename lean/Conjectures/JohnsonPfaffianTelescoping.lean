import Conjectures.JohnsonPfaffianSummation
namespace JohnsonPfaffian

def intervalCoefficient (F : ℕ → ℕ → ℝ) (a b : ℕ) : ℝ :=
  F (a+1) b - F a b - F (a+1) (b+1) + F a (b+1)

theorem interval_row_telescope (F : ℕ → ℕ → ℝ) (a j : ℕ) : ∀ m,
    (∑ k ∈ Finset.range m, intervalCoefficient F a (j+k)) =
      F (a+1) j-F a j-F (a+1) (j+m)+F a (j+m) := by
  intro m
  induction m with
  | zero => simp
  | succ m ih =>
    rw [Finset.sum_range_succ, ih]
    unfold intervalCoefficient
    have he : j+(m+1)=j+m+1 := by omega
    rw [he]
    ring

theorem interval_telescope (F : ℕ → ℕ → ℝ) (j m : ℕ) : ∀ i,
    (∑ a ∈ Finset.range i, ∑ k ∈ Finset.range m, intervalCoefficient F a (j+k)) =
      F i j-F 0 j-F i (j+m)+F 0 (j+m) := by
  intro i
  induction i with
  | zero => simp
  | succ i ih =>
    rw [Finset.sum_range_succ, ih, interval_row_telescope]
    ring

theorem logconvex_interval_coefficient_nonnegative (f : ℝ → ℝ)
    (hconv : ConvexOn ℝ (Set.Ioi 0) (fun x => Real.log (f x)))
    (a b c : ℝ) (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    0 ≤ Real.log (f b) - Real.log (f (b+a)) - Real.log (f (b+c)) + Real.log (f (b+a+c)) := by
  have hh := convex_four_point (fun x => Real.log (f x)) hconv a b c ha hb hc
  linarith

theorem interval_product_representation (F : ℕ → ℕ → ℝ) (i j m : ℕ)
    (h0 : F 0 j = 0) (hN : F i (j+m) = 0) (h00 : F 0 (j+m) = 0) :
    Real.exp (F i j) = ∏ a ∈ Finset.range i, ∏ k ∈ Finset.range m, Real.exp (intervalCoefficient F a (j+k)) := by
  have ht := interval_telescope F j m i
  rw [h0,hN,h00] at ht
  have he : F i j = ∑ a ∈ Finset.range i, ∑ k ∈ Finset.range m, intervalCoefficient F a (j+k) := by linarith
  rw [he]
  simp only [Real.exp_sum]

theorem interval_factor_at_least_one (F : ℕ → ℕ → ℝ) (a b : ℕ)
    (h : 0 ≤ intervalCoefficient F a b) : 1 ≤ Real.exp (intervalCoefficient F a b) := by
  exact Real.one_le_exp h

theorem log_boundary_coefficient_nonnegative (f : ℝ → ℝ) (hf : ∀ x > 0, 0 < f x)
    (hanti : AntitoneOn f (Set.Ioi 0)) (d D : ℝ) (hd : 0 < d) (hD : 0 < D) (h : d ≤ D) :
    0 ≤ Real.log (f d)-Real.log (f D) := by
  have hm : f D ≤ f d := hanti hd hD h
  exact sub_nonneg.mpr (Real.log_le_log (hf D hD) hm)

theorem source_kernel_interval_product (f : ℝ → ℝ) (d D : ℝ)
    (hd : 0 < f d) (hD : 0 < f D) (F : ℕ → ℕ → ℝ) (i j m : ℕ)
    (hval : F i j = Real.log (f d)-Real.log (f D))
    (h0 : F 0 j = 0) (hN : F i (j+m) = 0) (h00 : F 0 (j+m) = 0) :
    f d = f D * ∏ a ∈ Finset.range i, ∏ k ∈ Finset.range m, Real.exp (intervalCoefficient F a (j+k)) := by
  have hp := interval_product_representation F i j m h0 hN h00
  rw [hval, Real.exp_sub, Real.exp_log hd, Real.exp_log hD] at hp
  rw [← hp]
  field_simp
end JohnsonPfaffian
