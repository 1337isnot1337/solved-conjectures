module
public import Conjectures.NovelliThibonSignedShape
public import Mathlib.Algebra.Polynomial.Coeff
public import Mathlib.Algebra.Polynomial.Eval.Defs

@[expose] public section
namespace NovelliThibon

open Polynomial
open Classical

theorem alternating_product_coefficient {R ι : Type*} [CommRing R] (s : Finset ι)
    (f : ι → R) (k : ℕ) :
    (∏ i ∈ s,(1-C (f i)*X)).coeff k = (-1:R)^k *
      ∑ T ∈ s.powersetCard k,∏ i ∈ T,f i := by
  simp_rw [sub_eq_add_neg,← neg_mul,← map_neg,Finset.prod_one_add,
    Finset.prod_mul_distrib,← map_prod,Finset.prod_const,finsetSum_coeff,coeff_C_mul_X_pow]
  rw [Finset.powersetCard_eq_filter,Finset.sum_filter,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro T _
  by_cases hk : k=T.card
  · subst k
    have hp : (∏ i ∈ T,-f i) = (-1:R)^T.card * ∏ i ∈ T,f i := by
      calc
        _ = ∏ i ∈ T,((-1:R)*f i) := by simp
        _ = _ := by rw [Finset.prod_mul_distrib,Finset.prod_const]
    simp [hp]
  · simp [hk,Ne.symm hk]

def distinguishedHookCell (μ : YoungDiagram) (h : 0<μ.card) : Cell μ :=
  ⟨(0,0),by
    obtain ⟨a,ha⟩ := Finset.card_pos.mp h
    exact μ.isLowerSet (show (0,0)≤a from ⟨Nat.zero_le _,Nat.zero_le _⟩) ha⟩

def hookCellWeight {K : Type*} [CommRing K] {μ : YoungDiagram}
    (q : K) (t : ℕ → K) (b : Cell μ) : K :=
  q^col b * (if row b=0 then 1 else t (row b))

theorem hookCellWeight_distinguished {K : Type*} [CommRing K]
    (μ : YoungDiagram) (h : 0<μ.card) (q : K) (t : ℕ → K) :
    hookCellWeight q t (distinguishedHookCell μ h)=1 := by
  change q^0*(if (0:ℕ)=0 then 1 else t 0)=1
  simp

noncomputable def residualHookProduct {K : Type*} [CommRing K]
    (μ : YoungDiagram) (h : 0<μ.card) (q : K) (t : ℕ → K) : K[X] :=
  ∏ b ∈ Finset.univ.erase (distinguishedHookCell μ h),(1-C (hookCellWeight q t b)*X)

theorem signedSourceShapeEvaluation_eq_residualHookProduct {K : Type*} [Field K] {n : ℕ}
    (μ : YoungDiagram) (hs : μ.card=n+1) (q z : K) (hq : q≠0) (hq1 : q≠1) (t : ℕ → K) :
    signedSourceShapeEvaluation μ hs q z t =
      (1-z)*(residualHookProduct μ (by omega) q t).eval z := by
  rw [signedSourceShapeEvaluation_cell_product μ hs q z hq hq1]
  unfold residualHookProduct
  simp only [eval_prod,eval_sub,eval_one,eval_mul,eval_C,eval_X]
  simp_rw [mul_comm (hookCellWeight q t _) z]
  let b := distinguishedHookCell μ (by omega)
  let f (x : Cell μ) := 1-z*hookCellWeight q t x
  change (∏ x : Cell μ,f x) = (1-z)*∏ x ∈ Finset.univ.erase b,f x
  have hb : f b=1-z := by simp [f,b,hookCellWeight_distinguished]
  rw [← hb,mul_comm,Finset.prod_erase_mul _ _ (Finset.mem_univ b)]

/-- The exact subset-sum coefficient after removing the one unit weight
in the signed product. This verifies the right side of the hook formula. -/
theorem residualHookProduct_coefficient {K : Type*} [CommRing K]
    (μ : YoungDiagram) (h : 0<μ.card) (q : K) (t : ℕ → K) (k : ℕ) :
    (residualHookProduct μ h q t).coeff k = (-1:K)^k *
      ∑ T ∈ (Finset.univ.erase (distinguishedHookCell μ h)).powersetCard k,
        ∏ b ∈ T,hookCellWeight q t b := by
  exact alternating_product_coefficient _ _ _

end NovelliThibon
