import Conjectures.ChernFuLinThreeStatisticMarked
import Conjectures.ChernFuLinThreeStatisticFibre
import Conjectures.ChernFuLinThreeStatisticIDes

/-! # Actual monomial weights and the scalar obtained by forgetting the marks -/

namespace Conjectures.ChernFuLinThreeStatistic

open Polynomial Finset Expansion
noncomputable section
open Classical

def T : WeightField := algebraMap WeightRing WeightField X
def Z : WeightField := algebraMap WeightRing WeightField (C (X : Polynomial ℚ))
def wt {n : ℕ} (π : Equiv.Perm (Fin n)) : WeightField := T^ides π * Z^rma π

theorem T_ne : T ≠ 0 := (map_ne_zero_iff _ (IsFractionRing.injective WeightRing WeightField)).mpr X_ne_zero
theorem Z_ne : Z ≠ 0 := (map_ne_zero_iff _ (IsFractionRing.injective WeightRing WeightField)).mpr (C_ne_zero.mpr X_ne_zero)

theorem markedWeight_sum {n : ℕ} (P : Equiv.Perm (Fin n) → Prop) (L : Finset (Fin n)) :
    markedWeight P L = ∑ π : Equiv.Perm (Fin n), if P π ∧ lmi π=L then wt π else 0 := by
  unfold markedWeight markedPolynomial; rw [map_sum]; apply sum_congr rfl; intro π _
  split_ifs
  · rw [← C_mul_X_pow_eq_monomial,← C_mul_X_pow_eq_monomial]; simp [wt,T,Z,mul_comm]
  · exact map_zero _

theorem markedWeight_subtype {n : ℕ} (P : Equiv.Perm (Fin n) → Prop) (L : Finset (Fin n)) :
    markedWeight P L = ∑ π : {π : Equiv.Perm (Fin n) // P π ∧ lmi π=L}, wt π.val := by
  rw [markedWeight_sum,← sum_filter]
  exact sum_subtype _ (by simp) _

def totalWeight (z : Bool) (n : ℕ) : WeightField :=
  ∑ π : Equiv.Perm (Fin n), if inClass z π then wt π else 0

theorem cast_weight {n m : ℕ} (he : n=m) (z : Bool) (L : Finset (Fin n)) :
    markedWeight (@inClass n z) L = markedWeight (@inClass m z) (L.map (finCongr he).toEmbedding) := by
  subst m; simp

theorem markWeight_ofFn {n : ℕ} (hn : 0<n) (z : Bool) (w : Fin n → Bool) :
    markWeight z (List.ofFn w) = markedWeight (@inClass n z) (univ.filter fun i => w i) := by
  have h : (List.ofFn w).length=n := List.length_ofFn
  have hn' : List.ofFn w ≠ [] := fun e => by rw [e] at h; simp at h; omega
  have hp (k : ℕ) : (if z then @InZ k else @BursteinA218225.InX k) = @inClass k z := by cases z <;> rfl
  simp only [markWeight,ite_eq_right hn',hp]
  rw [cast_weight h]; congr 1; ext i; rw [mem_map]; constructor
  · rintro ⟨j,hj,rfl⟩
    apply mem_filter.mpr; refine ⟨mem_univ _,?_⟩
    change w ⟨j.val,by omega⟩ = true
    simpa only [markedPositions,mem_filter,mem_univ,true_and,List.getElem_ofFn] using hj
  · intro hi; refine ⟨Fin.cast h.symm i,?_,by simp⟩
    simpa only [markedPositions,mem_filter,mem_univ,true_and,List.getElem_ofFn,Fin.val_cast,Fin.eta] using hi

theorem scalar_markWeight {n : ℕ} (hn : 0<n) (z : Bool) : scalar (markWeight z) n = totalWeight z n := by
  unfold scalar totalWeight
  simp only [markWeight_ofFn hn z,markedWeight_sum]; rw [sum_comm]
  apply sum_congr rfl; intro π _
  let w : Fin n → Bool := fun i => decide (i∈lmi π)
  have he (v : Fin n → Bool) : lmi π=univ.filter (fun i => v i) ↔ w=v := by
    constructor
    · intro e; funext i; have hi := Finset.ext_iff.mp e i
      simp only [mem_filter,mem_univ,true_and] at hi
      cases h : v i <;> simp_all [w]
    · rintro rfl; ext i; simp [w]
  simp only [he]; by_cases hπ : inClass z π <;> simp [hπ]

theorem wt_expand (m a b : ℕ) (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b)))
    (hc : b=0 ↔ (σ (Fin.last m)).val=0) :
    wt (expand σ ν) = wt σ * (T^(internal (pos ν) 0 a + internal (pos ν) a b) * Z^rma ν) *
      (if b=0 then 1 else T) * (if a+b=0 then 1 else Z⁻¹) := by
  have hr := rma_expand σ ν hc; have hd := ides_expand σ ν hc
  unfold wt; rw [hd]; by_cases h : a+b=0
  · have hb : b=0 := by omega
    simp only [ite_eq_left hb,ite_eq_left h] at hr ⊢
    have e : rma (expand σ ν) = rma σ + rma ν := by omega
    rw [e]; simp only [pow_add,pow_zero,mul_one]; ring
  · simp only [ite_eq_right h] at hr ⊢
    have e := congrArg (fun j : ℕ => Z^j) hr
    simp only [Nat.add_zero,pow_succ,pow_add] at e
    have e' : Z ^ rma (expand σ ν) = Z ^ rma σ * Z ^ rma ν * Z⁻¹ :=
      (eq_mul_inv_iff_mul_eq₀ Z_ne).mpr e
    rw [e']; by_cases hb : b=0 <;> simp [hb,pow_add] <;> ring

end
end Conjectures.ChernFuLinThreeStatistic
