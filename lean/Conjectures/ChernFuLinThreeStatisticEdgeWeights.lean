import Conjectures.ChernFuLinThreeStatisticFlagsLiteral

/-! # Weights for all legal child gaps of the flag-word tree -/

namespace Conjectures.ChernFuLinThreeStatistic.Growth

open BursteinA218225 Kernel Finset

theorem wt_inverse {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (g : Fin (n+2))
    (hg : g.val≤(maxGap π).val) : wt (insertMax π g) = wt π * (T*Z) := by
  simp [wt,ides_inverse_edge π hg,rma_inverse_edge π hg,pow_add]; ring

private theorem wt_after {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (g : Fin (n+2)) (hX : InX π)
    (hA : least213Mid π=kX π) (hg : firstDescent π-1≤g.val) (hk : g.val<kX π) :
    wt (insertMax π g) = wt π * (Z⁻¹)^(((flags π (firstDescent π-1) (kX π-firstDescent π)).take
      (g.val-(firstDescent π-1))).count true) := by
  have loc : firstDescent π=(maxGap π).val+2 := by rcases max_location hX with ⟨_,h⟩|⟨_,_,_⟩; exact h; omega
  have hd := ides_insertMax π g
  have hn : ¬ g<g.succAbove (maxGap π) := by rw [Fin.lt_succAbove_iff_le_castSucc]; change ¬g.val≤(maxGap π).val; omega
  simp only [ite_eq_right hn,Nat.add_zero] at hd
  have hr := rma_update π g; rw [high_loss π hX hA hg hk] at hr
  let loss := ((flags π (firstDescent π-1) (kX π-firstDescent π)).take (g.val-(firstDescent π-1))).count true
  have hh : rma (insertMax π g)+loss=rma π := by dsimp [loss]; omega
  have hp := congrArg (fun l : ℕ => Z^l) hh; simp only [pow_add] at hp
  unfold wt; rw [hd,inv_pow,← hp]; change _ = _ * (Z^loss)⁻¹
  rw [mul_assoc, mul_assoc, mul_inv_cancel₀ (pow_ne_zero _ Z_ne),mul_one]

noncomputable def childSum {n : ℕ} (π : Equiv.Perm (Fin n)) {R : Type*} [CommRing R]
    (φ : WeightField →+* R) (F : State → R) : R := by
  classical
  exact ∑ g : Fin (n+1), if LegalGapX π g then φ (wt (insertMax π g))*F (state (insertMax π g)) else 0

private theorem gap_sum {n k : ℕ} (hk : k≤n+1) {R : Type*} [CommRing R] (f : Fin (n+1) → R) :
    (∑ g : Fin (n+1), if g.val<k then f g else 0) =
    ∑ i ∈ range k, (if h : i<n+1 then f ⟨i,h⟩ else 0) := by
  let F (i : ℕ) := if h : i<n+1 then f ⟨i,h⟩ else 0
  change _ = ∑ i ∈ range k, F i
  have eq (g : Fin (n+1)) : f g=F g.val := by simp only [F,dite_eq_left g.isLt]
  simp_rw [eq]; rw [Fin.sum_univ_eq_sum_range (fun i => if i<k then F i else 0),←sum_filter]
  congr 1; ext i; simp; omega

/-- A weighted sum over genuine children is exactly one step of the abstract
flag-word tree. The coefficient hom permits both scalar and series weights. -/
theorem childSum_eq {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hx : InX π)
    {R : Type*} [CommRing R] (φ : WeightField →+* R) (F : State → R) :
    childSum π φ F = φ (wt π)*step (φ (T*Z)) (φ Z⁻¹) F (state π) := by
  classical
  let d := firstDescent π; let k := kX π; let a := d-1; let j := k-d; let W := flags π a j
  have ⟨hd,hdb,hbk,hkn⟩ := invariantsX_bounds π
  have had : d=a+1 := by dsimp [a,d]; omega
  have hkd : k=d+j := by dsimp [j,k,d]; omega
  let term (i : ℕ) := if h : i<n+2 then φ (wt (insertMax π ⟨i,h⟩))*F (state (insertMax π ⟨i,h⟩)) else 0
  have tm (g : Fin (n+2)) : term g.val=φ (wt (insertMax π g))*F (state (insertMax π g)) := by
    simp only [term,dite_eq_left g.isLt]
  have sumEq : childSum π φ F = ∑ i ∈ range k, term i := by
    unfold childSum; simp_rw [legalGapX_iff_lt_kX hx]; exact gap_sum hkn _
  rw [sumEq,hkd,sum_range_add]
  rcases max_location hx with ⟨hA,hmax⟩ | ⟨hB,hlt,hmax⟩
  · have sA : state π=.A a W := by simp [state,hA,a,j,d,k,W]
    have loc : (maxGap π).val+1=a := by dsimp [a,d]; omega
    have he (i) (hi : i<a) : term i = φ (wt π)*φ (T*Z)*F (.A (i+1) (pre (a-1-i)++W)) := by
      let g : Fin (n+2) := ⟨i,by omega⟩
      rw [tm g,wt_inverse π g (by change i≤_; omega),state_A_low π hx hA g hi,map_mul]
    have hm : term a=φ (wt π)*F (.A (a+1) W) := by
      let g : Fin (n+2) := ⟨a,by dsimp [k] at hkd; omega⟩
      rw [tm g,wt_after π g hx hA le_rfl (by change a < k; omega),state_A_after π hx hA g rfl]
      simp [g,a,W,j,k,d]
    have hh (i) (hi : i<j) : term (d+i)=φ (wt π)*((φ Z⁻¹)^((W.take (i+1)).count true))*F (.B a (i+1)) := by
      let g : Fin (n+2) := ⟨d+i,by dsimp [k] at hkd; omega⟩
      have hge : d≤g.val := by dsimp [g]; omega
      have hke : g.val<k := by dsimp [g]; omega
      rw [tm g,wt_after π g hx hA (by change a≤_; omega) hke,state_high π hx g hge hke,map_mul,map_pow]
      change _ * _^((W.take (g.val-a)).count true) * F (.B a (g.val+1-d)) = _
      rw [show g.val-a=i+1 by dsimp [g]; omega,show g.val+1-d=i+1 by dsimp [g]; omega]
    rw [sA,step,show W.length=j from flags_length ..]
    conv_lhs => lhs; rw [had,sum_range_succ,hm]
    rw [sum_congr rfl (fun i hi => he i (mem_range.mp hi)),sum_congr rfl (fun i hi => hh i (mem_range.mp hi))]
    simp only [mul_add,mul_sum,← mul_assoc]; ring
  · have ne : least213Mid π≠kX π := by omega
    have sB : state π=.B a j := by simp [state,ne,a,j,k,d]
    have he (i) (hi : i<d) : term i=φ (wt π)*φ (T*Z)*F (.A (i+1) (List.replicate (a-i) false)) := by
      let g : Fin (n+2) := ⟨i,by dsimp [k] at hkd; omega⟩
      rw [tm g,wt_inverse π g (by change i≤_; dsimp [k] at hkd; omega),map_mul,state_B_low π hx ne g hi]
    have hh (i) (hi : i<j) : term (d+i)=φ (wt π)*φ (T*Z)*F (.B a (i+1)) := by
      let g : Fin (n+2) := ⟨d+i,by dsimp [k] at hkd; omega⟩
      have hge : d≤g.val := by dsimp [g]; omega
      have hke : g.val<k := by dsimp [g]; omega
      rw [tm g,wt_inverse π g (by change d+i≤_; dsimp [k] at hkd; omega),map_mul,state_high π hx g hge hke]
      change _ * F (.B a (g.val+1-d)) = _; rw [show g.val+1-d=i+1 by dsimp [g]; omega]
    rw [sum_congr rfl (fun i hi => he i (mem_range.mp hi)),sum_congr rfl (fun i hi => hh i (mem_range.mp hi)),sB,step,← had]
    simp only [mul_add,mul_sum,←mul_assoc]

end Conjectures.ChernFuLinThreeStatistic.Growth
