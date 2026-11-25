module

public import Conjectures.LassalleBesselRealRoot
public import Conjectures.LassalleProductBound

@[expose] public section
namespace LassalleRefinement

/-- The first reciprocal moment rules out two positive roots in or below
the verified bracket. This formalizes why the bracket isolates the first. -/
theorem first_root_identified_by_moment (r : ℕ→ℝ) (hr : StrictMono r)
    (hpos : ∀ j,0<r j) (hs : Summable (fun j => 1/r j))
    (hm : (∑' j,1/r j)=1/2) (j : ℕ) (hj : r j≤(rootHi:ℝ)) : j=0 := by
  by_contra h0
  have hj' : 1≤j := by omega
  have h1 := (hr.monotone hj').trans hj
  have h00 := (hr.monotone (Nat.zero_le j)).trans hj
  have hH : (rootHi:ℝ)<4 := by norm_num [rootHi]
  have hl (k : ℕ) (hk : r k < 4) : (1/4:ℝ)<1/r k :=
    div_lt_div_of_pos_left (by norm_num) (hpos k) hk
  have hL0 := hl 0 (h00.trans_lt hH)
  have hL1 := hl 1 (h1.trans_lt hH)
  have h := hs.sum_le_tsum ({0,1}:Finset ℕ) (fun i _ => div_nonneg (by norm_num) (hpos i).le)
  rw [hm] at h
  norm_num at h hL0 hL1
  linarith

theorem besselRealSeries_first_root_in_bracket
    (r : ℕ→ℝ) (hr : StrictMono r) (hpos : ∀ j,0<r j)
    (hs : Summable (fun j => 1/r j)) (hm : (∑' j,1/r j)=1/2)
    (hzero : ∀ x, 0<x → besselRealSeries x=0 → ∃ j,r j=x) :
    r 0∈Set.Icc (rootLo:ℝ) (rootHi:ℝ) := by
  obtain ⟨x,hx,hf⟩ := besselRealSeries_root_in_bracket
  have hp : 0<x := (by norm_num [rootLo] : (0:ℝ)<(rootLo:ℝ)).trans_le hx.1
  obtain ⟨j,rfl⟩ := hzero x hp hf
  have hj := first_root_identified_by_moment r hr hpos hs hm j hx.2
  simpa [hj] using hx

set_option maxHeartbeats 2000000 in
/-- The two power sums after removal of the first root, with exact
constants from the rational bracket. -/
theorem bessel_residual_root_moments
    (r : ℕ→ℝ) (hpos : ∀ i,0<r i) (hhi : r 0≤(rootHi:ℝ))
    (hs : Summable (fun i => 1/r i)) (hs2 : Summable (fun i => (1/r i)^2))
    (hm : (∑' i,1/r i)=1/2) (hm2 : (∑' i,(1/r i)^2)=1/12) :
    let α (i : ℕ) := r 0/r (i+1)
    Summable α ∧ Summable (fun i => (α i)^2) ∧
    (∑' i,α i)≤21/25 ∧ (∑' i,(α i)^2)≤(9/25:ℝ)^2 := by
  let α (i : ℕ) := r 0/r (i+1)
  let b (i : ℕ) := 1/r (i+1)
  have hb : Summable b := (summable_nat_add_iff 1).2 hs
  have hb2 : Summable (fun i => (b i)^2) := (summable_nat_add_iff 1).2 hs2
  have hα (i : ℕ) : α i = r 0*b i := by unfold α b; rw [mul_one_div]
  have hsα : Summable α := by
    rw [show α=(fun i => r 0*b i) from funext hα]
    exact hb.mul_left _
  have hsα2 : Summable (fun i => (α i)^2) := by
    simp_rw [hα,mul_pow]
    exact hb2.mul_left _
  have M := hs.sum_add_tsum_nat_add 1
  have M2 := hs2.sum_add_tsum_nat_add 1
  change (∑ i ∈ Finset.range 1,1/r i)+(∑' i,b i)=_ at M
  change (∑ i ∈ Finset.range 1,(1/r i)^2)+(∑' i,(b i)^2)=_ at M2
  rw [hm,Finset.sum_range_one] at M
  rw [hm2,Finset.sum_range_one] at M2
  have E : (∑' i,b i)=1/2-1/r 0 := by linarith
  have E2 : (∑' i,(b i)^2)=1/12-(1/r 0)^2 := by linarith
  refine ⟨hsα,hsα2,?_,?_⟩
  · change (∑' i,α i)≤21/25
    simp_rw [hα,tsum_mul_left,E]
    have he : r 0*(1/2-1/r 0)=r 0/2-1 := by field_simp [(hpos 0).ne']
    rw [he]
    have hC : (rootHi:ℝ)/2-1<21/25 := by norm_num [rootHi]
    linarith
  · change (∑' i,(α i)^2)≤(9/25:ℝ)^2
    simp_rw [hα,mul_pow,tsum_mul_left,E2]
    have he : (r 0)^2*(1/12-(1/r 0)^2)=(r 0)^2/12-1 := by
      field_simp [(hpos 0).ne']
    rw [he]
    have hC : (rootHi:ℝ)^2/12-1<(9/25:ℝ)^2 := by norm_num [rootHi]
    have hR := pow_le_pow_left₀ (hpos 0).le hhi 2
    linarith

end LassalleRefinement
