module

public import Conjectures.RossiPermutohedronBulkTailTerm
public import Mathlib.Topology.Algebra.InfiniteSum.Real
public import Mathlib.Analysis.Normed.Group.InfiniteSum

@[expose] public section
namespace RossiPermutohedron
open Complex Filter
open scoped Topology

noncomputable def poleTerm (N : ℕ) (x : ℝ) (k : ℤ) : ℂ :=
  1/(oddPole x k)^N

noncomputable def pairTailTerm (N : ℕ) (x : ℝ) (m : ℕ) : ℂ :=
  poleTerm N x ((m+1:ℕ):ℤ)+poleTerm N x (-((m+1:ℕ):ℤ)-1)

theorem poleTerm_conj (N : ℕ) (x : ℝ) (k : ℤ) :
    poleTerm N x (-k-1)=star (poleTerm N x k) := by
  simp [poleTerm,oddPole_conj]

theorem poleTerm_norm (N : ℕ) (x : ℝ) (k : ℤ) :
    ‖poleTerm N x k‖=(‖oddPole x k‖^N)⁻¹ := by
  simp [poleTerm,one_div]

theorem poleTerm_tail_norm_lt {N : ℕ} (hN : 128≤N) {x : ℝ}
    (hx : ‖oddPole x 0‖^2 ≤ 10*(N:ℝ)) {k : ℕ} (hk : 1≤k) :
    ‖poleTerm N x k‖ < (‖oddPole x 0‖^N)⁻¹ * (((k:ℝ)*(k+1))^2)⁻¹ := by
  have H := bulkPole_ratio_lt N hN x hx k hk
  have h0 := oddPole_near_norm_pos x
  have hK : 0<(‖oddPole x 0‖^N)⁻¹ := inv_pos.mpr (pow_pos h0 _)
  have hi := mul_lt_mul_of_pos_left H hK
  have hEq : (‖oddPole x 0‖^N)⁻¹ * (‖oddPole x 0‖/‖oddPole x (k:ℤ)‖)^N =
      ‖poleTerm N x k‖ := by
    rw [poleTerm_norm,div_pow,div_eq_mul_inv,← mul_assoc,inv_mul_cancel₀ (pow_ne_zero _ h0.ne'),one_mul]
  rwa [hEq] at hi

noncomputable def reciprocalDrop (m : ℕ) : ℝ :=
  ((m:ℝ)+1)⁻¹-((m:ℝ)+2)⁻¹

theorem reciprocalDrop_eq (m : ℕ) :
    reciprocalDrop m = (((m:ℝ)+1)*((m:ℝ)+2))⁻¹ := by
  unfold reciprocalDrop
  have h1 : (m:ℝ)+1≠0 := by positivity
  have h2 : (m:ℝ)+2≠0 := by positivity
  field_simp [h1,h2]
  ring

theorem reciprocalDrop_nonneg (m : ℕ) : 0≤reciprocalDrop m := by
  rw [reciprocalDrop_eq]
  positivity

theorem reciprocalDrop_sum_range (M : ℕ) :
    ∑ m ∈ Finset.range M,reciprocalDrop m=1-((M:ℝ)+1)⁻¹ := by
  induction M with
  | zero => norm_num
  | succ m ih =>
    rw [Finset.sum_range_succ,ih,reciprocalDrop]
    push_cast
    ring_nf

theorem reciprocalDrop_hasSum : HasSum reciprocalDrop 1 := by
  apply (hasSum_iff_tendsto_nat_of_nonneg reciprocalDrop_nonneg 1).mpr
  simp_rw [reciprocalDrop_sum_range]
  have h := tendsto_one_div_add_atTop_nhds_zero_nat (𝕜 := ℝ)
  simpa [one_div] using (tendsto_const_nhds (x := (1:ℝ))).sub h

theorem pairTailTerm_norm_lt {N : ℕ} (hN : 128≤N) {x : ℝ}
    (hx : ‖oddPole x 0‖^2 ≤ 10*(N:ℝ)) (m : ℕ) :
    ‖pairTailTerm N x m‖ < (‖oddPole x 0‖^N)⁻¹ * reciprocalDrop m := by
  let k : ℝ := ((m:ℝ)+1)*((m:ℝ)+2)
  have hk : 2≤k := by
    have hm : 0≤(m:ℝ) := by positivity
    dsimp [k]
    nlinarith [sq_nonneg (m:ℝ)]
  have hkpos : 0<k := by linarith
  have hmono : 2*(k^2)⁻¹ ≤ k⁻¹ := by
    rw [←div_eq_mul_inv,←one_div]
    apply (div_le_div_iff₀ (by positivity) hkpos).mpr
    nlinarith [mul_nonneg (sub_nonneg.mpr hk) hkpos.le]
  calc
    _ ≤ 2*‖poleTerm N x ((m+1:ℕ):ℤ)‖ := by
      unfold pairTailTerm
      rw [poleTerm_conj,two_mul]
      simpa using norm_add_le
        (poleTerm N x ((m+1:ℕ):ℤ)) (star (poleTerm N x ((m+1:ℕ):ℤ)))
    _ < 2*((‖oddPole x 0‖^N)⁻¹ * (k^2)⁻¹) := by
      apply mul_lt_mul_of_pos_left _ (by norm_num : (0:ℝ)<2)
      convert poleTerm_tail_norm_lt hN hx (k := m+1) (by omega) using 1
      dsimp [k]
      push_cast
      ring_nf
    _ = (‖oddPole x 0‖^N)⁻¹ * (2*(k^2)⁻¹) := by ring
    _ ≤ _ := by
      rw [reciprocalDrop_eq]
      exact mul_le_mul_of_nonneg_left hmono (by positivity)

theorem paired_bulk_tail_lt {N : ℕ} (hN : 128≤N) {x : ℝ}
    (hx : ‖oddPole x 0‖^2 ≤ 10*(N:ℝ)) :
    ‖∑' m : ℕ,pairTailTerm N x m‖ < (‖oddPole x 0‖^N)⁻¹ := by
  have ha := (reciprocalDrop_hasSum).mul_left (‖oddPole x 0‖^N)⁻¹
  have hlt := Summable.tsum_lt_tsum_of_nonneg (i := 0) (fun m => norm_nonneg _)
    (fun m => (pairTailTerm_norm_lt hN hx m).le)
    (pairTailTerm_norm_lt hN hx 0) ha.summable
  rw [ha.tsum_eq,mul_one] at hlt
  exact (norm_tsum_le_tsum_norm (Summable.of_nonneg_of_le (fun _ => norm_nonneg _)
    (fun m => (pairTailTerm_norm_lt hN hx m).le) ha.summable)).trans_lt hlt

theorem pole_sum_split {N : ℕ} (hN : 128≤N) {x : ℝ}
    (hx : ‖oddPole x 0‖^2 ≤ 10*(N:ℝ)) :
    (∑' k : ℤ,poleTerm N x k)=
      (poleTerm N x 0+poleTerm N x (-1))+ ∑' m : ℕ,pairTailTerm N x m := by
  let f := poleTerm N x
  let g : ℕ → ℂ := fun m => f ((m:ℤ)+1)
  let r : ℕ → ℂ := fun m => f (-((m:ℤ)+1)-1)
  let r' : ℕ → ℂ := fun m => f (-((m:ℤ)+1))
  have hdom (m : ℕ) : ‖g m‖ ≤
      (‖oddPole x 0‖^N)⁻¹ * reciprocalDrop m := by
    have h := poleTerm_tail_norm_lt hN hx (k := m+1) (by omega)
    have hk : (2:ℝ) ≤ ((m:ℝ)+1)*((m:ℝ)+2) := by
      have hm : (0:ℝ) ≤ m := by positivity
      nlinarith [sq_nonneg (m:ℝ)]
    have hm0 : 0 < ((m:ℝ)+1)*((m:ℝ)+2) := by positivity
    have hinv : ((((m:ℝ)+1)*((m:ℝ)+2))^2)⁻¹ ≤ (((m:ℝ)+1)*((m:ℝ)+2))⁻¹ := by
      apply inv_anti₀ hm0
      nlinarith [mul_nonneg (sub_nonneg.mpr (show (1:ℝ)≤((m:ℝ)+1)*((m:ℝ)+2) by linarith)) hm0.le]
    rw [reciprocalDrop_eq]
    refine (show ‖g m‖ < (‖oddPole x 0‖ ^ N)⁻¹ * ((((m:ℝ)+1)*((m:ℝ)+2))^2)⁻¹ from ?_).le.trans
      (mul_le_mul_of_nonneg_left hinv (by positivity))
    have hkE : (((m+1:ℕ):ℝ)+1)=(m:ℝ)+2 := by push_cast; ring
    rw [hkE] at h
    simpa [g,f,Nat.cast_add,Nat.cast_one] using h
  have hA := (reciprocalDrop_hasSum.mul_left (‖oddPole x 0‖^N)⁻¹).summable
  have hg : Summable g := Summable.of_norm_bounded hA hdom
  have hr : Summable r := Summable.of_norm_bounded hA (fun m => by
    have hh : r m=star (g m) := poleTerm_conj N x ((m:ℤ)+1)
    rw [hh,norm_star]
    exact hdom m)
  have hrEq : (fun m : ℕ => r' (m+1))=r := by
    funext m
    dsimp [r',r]
    congr 1
  have hfull : Summable r' := (summable_nat_add_iff 1).mp (by rw [hrEq]; exact hr)
  have hdec : (∑' k : ℤ,f k)=(∑' m,g m)+f 0+∑' m,r' m := by
    exact tsum_of_add_one_of_neg_add_one hg hfull
  have hr0 : r' 0 = f (-1) := rfl
  change (∑' k : ℤ,f k)=f 0+f (-1)+ ∑' m : ℕ,pairTailTerm N x m
  rw [hdec,hfull.tsum_eq_zero_add,hrEq,hr0]
  have hs : (fun m => g m+r m)=pairTailTerm N x := by
    funext m
    simp [pairTailTerm,g,r,f,Nat.cast_add,Nat.cast_one]
  rw [←hs,Summable.tsum_add hg hr]
  abel

end RossiPermutohedron
