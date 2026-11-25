module

public import Conjectures.XuZhouQuotientEnergy

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {n : ℕ}

theorem chainKernel_eq_zero_of_first {a : Fin n→ℕ} (x : Fin n→ℝ)
    (hMx : chainTridiagonal a *ᵥ x=0)
    (hfirst : ∀ i : Fin n,i.val=0 → x i=0) : x=0 := by
  have H (k : ℕ) : ∀ hk : k<n, x ⟨k,hk⟩=0 := by
    induction k using Nat.strong_induction_on with
    | h k ih =>
      intro hk
      by_cases h0 : k=0
      · exact hfirst ⟨k,hk⟩ h0
      · let i : Fin n := ⟨k-1,by omega⟩
        let j : Fin n := ⟨k,hk⟩
        have hji : i.val+1=j.val := by change k-1+1=k; omega
        have hne : i≠j := fun he => by
          have hh : i.val=j.val := congrArg Fin.val he
          omega
        have hsum : (∑ r,chainTridiagonal a i r*x r)=x j := by
          calc
            _ = chainTridiagonal a i j*x j := by
              apply Finset.sum_eq_single j
              · intro r _ hr
                by_cases hlt : r.val < k
                · have hz : x r=0 := ih r.val hlt r.isLt
                  simp [hz]
                · have hrk : r.val≠k := fun he => hr (Fin.ext he)
                  have hgr : k < r.val := by omega
                  have hri : i≠r := fun he => by
                    have hh : i.val=r.val := congrArg Fin.val he
                    change k-1=r.val at hh
                    omega
                  have hnc : ¬consecutive i r := by
                    unfold consecutive
                    change ¬(k-1+1=r.val ∨ r.val+1=k-1)
                    omega
                  simp [chainTridiagonal,hri,hnc]
              · simp
            _ = x j := by
              have hc : consecutive i j := Or.inl hji
              simp [chainTridiagonal,hne,hc]
        have hm := congrFun hMx i
        change (∑ r,chainTridiagonal a i r*x r)=0 at hm
        rw [hsum] at hm
        exact hm
  funext i
  exact H i.val i.isLt

theorem chainEnergy_zero_first_coordinate {a : Fin n→ℕ} (ha : ∀ i,0 < a i)
    (x : EuclideanSpace ℝ (Fin n)) (hx : ∀ i∈marked a,x i=0)
    (hQ : quadraticEnergy (chainTridiagonal a) x=0)
    (i : Fin n) (hf : i.val=0) : x i=0 := by
  by_cases hi : i∈marked a
  · exact hx i hi
  · by_contra hn
    have hl := chainResidual_negative_of_first ha hi hf
    have hsq : 0 < (x i)^2 := by positivity
    have ht : (∑ j,chainResidual a j*(x j)^2) < 0 := by
      calc
        _ < ∑ _ : Fin n,(0:ℝ) := by
          apply Finset.sum_lt_sum
          · intro j _
            by_cases hj : j∈marked a
            · simp [hx j hj]
            · exact mul_nonpos_of_nonpos_of_nonneg (chainResidual_nonpositive ha hj) (sq_nonneg _)
          · exact ⟨i,Finset.mem_univ _,mul_neg_of_neg_of_pos hl hsq⟩
        _ = _ := by simp
    rw [chainEnergy_on_unmarked x hx] at hQ
    linarith [quadraticEnergy_lapMatrix_nonneg (unmarkedPath a) x]

theorem chainKernel_eq_zero_of_unmarked {a : Fin n→ℕ} (ha : ∀ i,0 < a i)
    (x : EuclideanSpace ℝ (Fin n)) (hx : ∀ i∈marked a,x i=0)
    (hk : Matrix.toEuclideanLin (chainTridiagonal a) x=0) : x=0 := by
  have hQ : quadraticEnergy (chainTridiagonal a) x=0 := by simp [quadraticEnergy,hk]
  have hm : chainTridiagonal a *ᵥ x.ofLp=0 := by
    have h := congrArg WithLp.ofLp hk
    simpa [Matrix.toEuclideanLin,Matrix.toLpLin_apply] using h
  have hz := chainKernel_eq_zero_of_first x.ofLp hm (fun i hi =>
    chainEnergy_zero_first_coordinate ha x hx hQ i hi)
  exact congrArg (WithLp.toLp 2) hz

/-- The quotient matrix has at most one nonnegative eigenvalue per unit of
layer surplus. This includes all zero eigenvalues. -/
theorem chainTridiagonal_nonnegative_count {a : Fin n→ℕ} (ha : ∀ i,0 < a i) :
    Fintype.card {i : Fin n // 0 ≤ (chainTridiagonal_hermitian a).eigenvalues i} ≤
      ∑ i,(a i-1) := by
  let L : EuclideanSpace ℝ (Fin n) →ₗ[ℝ] (↥(marked a)→ℝ) :=
    { toFun := fun x i => x i.val
      map_add' := fun _ _ => rfl
      map_smul' := fun _ _ => rfl }
  have hL (x : EuclideanSpace ℝ (Fin n)) (hx : L x=0) : ∀ i∈marked a,x i=0 :=
    fun i hi => congrFun hx ⟨i,hi⟩
  have h := card_nonnegative_le_observation (chainTridiagonal_hermitian a) L
    (fun x hx => chainEnergy_nonpositive ha x (hL x hx))
    (fun x hx hk => chainKernel_eq_zero_of_unmarked ha x (hL x hx) hk)
  rw [Fintype.card_coe] at h
  exact h.trans (marked_card_le a)

end XuZhou
