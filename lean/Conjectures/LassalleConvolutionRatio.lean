module

public import Conjectures.LassalleTailWeight

@[expose] public section
namespace LassalleRefinement

theorem besselConvolution_ratio {R : ℝ} (hR : 0≤R) (m : ℕ) (hm : 15≤m+1) :
    besselConvolution R (m+1) ≤ (2*R/72)*besselConvolution R m := by
  classical
  let P : ℕ → Prop := fun i => m+1-i≤ i
  let U := (Finset.range (m+1+1)).filter P
  let L := (Finset.range (m+1+1)).filter fun i => ¬P i
  let f (i : ℕ) := besselTerm R i*besselTerm R (m+1-i)
  let g (i : ℕ) := besselTerm R i*besselTerm R (m-i)
  have hU (i : ℕ) (hi : i∈U) : i≤m+1 ∧ 8≤ i := by
    obtain ⟨h₁,h₂⟩ := Finset.mem_filter.mp hi
    have hh := Finset.mem_range.mp h₁
    change m+1-i≤ i at h₂
    omega
  have hL (i : ℕ) (hi : i∈L) : i≤m ∧ 8≤m+1-i := by
    obtain ⟨h₁,h₂⟩ := Finset.mem_filter.mp hi
    have hh := Finset.mem_range.mp h₁
    change ¬(m+1-i≤ i) at h₂
    omega
  have gpos (i : ℕ) : 0≤(R/72)*g i := by
    exact mul_nonneg (by positivity)
      (mul_nonneg (besselTerm_nonneg hR _) (besselTerm_nonneg hR _))
  have hupper : (∑ i ∈ U, f i)≤(R/72)*besselConvolution R m := by
    have hsub : U.image (fun i => i-1) ⊆ Finset.range (m+1) := by
      intro i hi
      obtain ⟨j,hj,rfl⟩ := Finset.mem_image.mp hi
      have h := hU j hj
      exact Finset.mem_range.mpr (by omega)
    calc
      _ ≤ ∑ i ∈ U, (R/72)*g (i-1) := by
        apply Finset.sum_le_sum
        intro i hi
        have hh := hU i hi
        have h := mul_le_mul_of_nonneg_right (besselTerm_small_ratio hR hh.2)
          (besselTerm_nonneg hR (m+1-i))
        unfold f g
        rw [show m-(i-1)=m+1-i by omega]
        simpa only [mul_assoc] using h
      _ = ∑ i ∈ U.image (fun i => i-1), (R/72)*g i := by
        symm
        apply Finset.sum_image
        intro i hi j hj he
        have hi' := hU i hi
        have hj' := hU j hj
        change i-1=j-1 at he
        omega
      _ ≤ ∑ i ∈ Finset.range (m+1), (R/72)*g i :=
        Finset.sum_le_sum_of_subset_of_nonneg hsub (fun i _ _ => gpos i)
      _ = _ := by rw [←Finset.mul_sum]; rfl
  have hlower : (∑ i ∈ L, f i)≤(R/72)*besselConvolution R m := by
    have hsub : L ⊆ Finset.range (m+1) := fun i hi => Finset.mem_range.mpr (by have := hL i hi; omega)
    calc
      _ ≤ ∑ i ∈ L, (R/72)*g i := by
        apply Finset.sum_le_sum
        intro i hi
        have hh := hL i hi
        have h := mul_le_mul_of_nonneg_left (besselTerm_small_ratio hR hh.2)
          (besselTerm_nonneg hR i)
        unfold f g
        rw [show m+1-i-1=m-i by omega] at h
        simpa only [mul_left_comm] using h
      _ ≤ ∑ i ∈ Finset.range (m+1), (R/72)*g i :=
        Finset.sum_le_sum_of_subset_of_nonneg hsub (fun i _ _ => gpos i)
      _ = _ := by rw [←Finset.mul_sum]; rfl
  have he : (∑ i ∈ U, f i)+(∑ i ∈ L, f i)=besselConvolution R (m+1) :=
    Finset.sum_filter_add_sum_filter_not (Finset.range (m+1+1)) P f
  rw [←he]
  linarith

end LassalleRefinement
