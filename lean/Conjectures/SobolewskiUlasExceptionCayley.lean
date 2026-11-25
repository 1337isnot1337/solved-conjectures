module

public import Conjectures.SobolewskiUlasExceptionRepeatedInput
public import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic

@[expose] public section
namespace SobolewskiUlasException

open Polynomial

/-- A homogeneous recurrence with a monic, nonzero characteristic
polynomial. Terms start at index zero, and no fixed order is assumed. -/
def HasMonicRecurrence (f : ℕ→ℤ) : Prop :=
  ∃ p : ℤ[X],p.Monic ∧ ∀ k : ℕ,
    ∑ i ∈ Finset.range (p.natDegree+1),p.coeff i * f (k+i)=0

theorem matrix_orbit_recurrent {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : Matrix ι ι ℤ) (L : Matrix ι ι ℤ →ₗ[ℤ] ℤ) :
    HasMonicRecurrence (fun k => L (M^k)) := by
  refine ⟨M.charpoly,Matrix.charpoly_monic M,?_⟩
  intro k
  let p := M.charpoly
  let R := Finset.range (p.natDegree+1)
  have hq : ∑ i ∈ R,p.coeff i • M^i=0 := by
    have hm := Matrix.aeval_self_charpoly M
    change aeval M p=0 at hm
    rw [aeval_eq_sum_range] at hm
    simpa only [R,Algebra.algebraMap_eq_smul_one,smul_mul_assoc,one_mul] using hm
  change (∑ i ∈ R,p.coeff i * L (M^(k+i)))=0
  calc
    _ = L (∑ i ∈ R,p.coeff i • (M^(k+i))) := by
      simp only [map_sum,map_smul,smul_eq_mul]
    _ = L (M^k*(∑ i ∈ R,p.coeff i • M^i)) := by
      rw [Finset.mul_sum]
      congr 1
      apply Finset.sum_congr rfl
      intro i _
      rw [pow_add,mul_smul_comm]
    _ = (0 : ℤ) := by rw [hq,mul_zero,map_zero]

/-- A digit representation in base sixteen, with a linear functional
recording the initial and final vectors. Digits are read least first. -/
structure DigitRepresentation16 {ι : Type*} [Fintype ι] [DecidableEq ι] (f : ℕ→ℤ) where
  digit : ℕ→Matrix ι ι ℤ
  finish : Matrix ι ι ℤ →ₗ[ℤ] ℤ
  represents (n : ℕ) : f n=finish (List.prod ((Nat.digits 16 n).map digit))

def matrixSandwich {ι : Type*} [Fintype ι] [DecidableEq ι] (A B : Matrix ι ι ℤ) :
    Matrix ι ι ℤ →ₗ[ℤ] Matrix ι ι ℤ where
  toFun X := A*X*B
  map_add' X Y := by rw [mul_add,add_mul]
  map_smul' c X := by rw [mul_smul_comm,smul_mul_assoc]; rfl

/-- A base-sixteen linear representation on the exact written input
forces a monic recurrence by Cayley–Hamilton. -/
theorem digitRepresentation_repeated_recurrent {ι : Type*} [Fintype ι] [DecidableEq ι]
    {f : ℕ→ℤ} (R : @DigitRepresentation16 ι _ _ f) :
    HasMonicRecurrence (fun k => f (repeatedIndex (k+2))) := by
  let L := R.finish.comp (matrixSandwich (R.digit 10) (R.digit 1))
  have H := matrix_orbit_recurrent (R.digit 9) L
  have he : (fun k => f (repeatedIndex (k+2))) = fun k => L (R.digit 9 ^ k) := by
    funext k
    rw [R.represents,repeatedIndex_digits]
    change R.finish (((10::(List.replicate k 9 ++ [1])).map R.digit).prod)=_
    simp only [List.map_cons,List.prod_cons,List.map_append,List.prod_append,List.map_replicate,
      List.prod_replicate,List.map_nil,List.prod_nil,mul_one,L,LinearMap.comp_apply,matrixSandwich,
      LinearMap.coe_mk,AddHom.coe_mk,mul_assoc]
  exact he.symm ▸ H

end SobolewskiUlasException
