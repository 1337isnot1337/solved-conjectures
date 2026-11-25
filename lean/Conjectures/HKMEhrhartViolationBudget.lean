module

public import Conjectures.HKMEhrhartPairViolation
public import Conjectures.HKMEhrhartSignedBudget
import all Conjectures.HKMEhrhartSupportShells

@[expose] public section
namespace HKMEhrhart
open Finset Polynomial
open scoped BigOperators Polynomial

theorem natPosNegMass_sum (a : ℤ) :
    natPositiveMass a+natNegativeMass a = a.natAbs := by
  unfold natPositiveMass natNegativeMass
  omega

theorem restMass_eq_sum_abs {α : Type*} [Fintype α] (w : α→ℤ) :
    restPos w+restNeg w = ∑ i,(w i).natAbs := by
  unfold restPos restNeg
  rw [← Finset.sum_add_distrib]
  simp only [natPosNegMass_sum]

def packPivot (c : ℤ) (q : ℕ) : ℕ×ℕ :=
  (natPositiveMass c+q,natNegativeMass c+q)

def unpackPivot (v : ℕ×ℕ) : ℤ×ℕ :=
  ((v.1:ℤ)-(v.2:ℤ),min v.1 v.2)

theorem unpackPivot_packPivot (c : ℤ) (q : ℕ) :
    unpackPivot (packPivot c q) = (c,q) := by
  apply Prod.ext
  · have hc := natPosNegMass_cast_difference c
    unfold packPivot unpackPivot
    push_cast
    omega
  · unfold packPivot unpackPivot natPositiveMass natNegativeMass
    omega

theorem packPivot_unpackPivot (v : ℕ×ℕ) :
    packPivot (unpackPivot v).1 (unpackPivot v).2 = v := by
  apply Prod.ext <;> (unfold packPivot unpackPivot natPositiveMass natNegativeMass; omega)

theorem packPivot_sum (c : ℤ) (q : ℕ) :
    (packPivot c q).1 + (packPivot c q).2 = c.natAbs+2*q := by
  have hc := natPosNegMass_sum c
  unfold packPivot
  omega

theorem unpackPivot_sum (v : ℕ×ℕ) :
    (unpackPivot v).1.natAbs+2*(unpackPivot v).2 = v.1+v.2 := by
  simpa only [packPivot_unpackPivot] using (packPivot_sum (unpackPivot v).1 (unpackPivot v).2).symm

def violationTailToBudget {n m : ℕ} (v : ViolationTail (Fin (n+1)) m) : SignedBudget n m :=
  ⟨(packPivot (v.val.1 0) v.val.2,fun i => v.val.1 i.succ),by
    rw [budgetWeight_eq,packPivot_sum]
    change (v.val.1 0).natAbs + 2*v.val.2 + (∑ i : Fin n,(v.val.1 i.succ).natAbs) < m
    have h := v.property
    rw [restMass_eq_sum_abs,Fin.sum_univ_succ] at h
    omega⟩

def budgetToViolationTail {n m : ℕ} (w : SignedBudget n m) : ViolationTail (Fin (n+1)) m :=
  ⟨(Fin.cons (unpackPivot w.val.1).1 w.val.2,(unpackPivot w.val.1).2),by
    rw [restMass_eq_sum_abs,Fin.sum_univ_succ]
    simp only [Fin.cons_zero,Fin.cons_succ]
    have h := w.property
    rw [budgetWeight_eq] at h
    have h' := unpackPivot_sum w.val.1
    omega⟩

def violationTailEquiv (n m : ℕ) : ViolationTail (Fin (n+1)) m ≃ SignedBudget n m where
  toFun := violationTailToBudget
  invFun := budgetToViolationTail
  left_inv v := by
    apply Subtype.ext
    have h := unpackPivot_packPivot (v.val.1 0) v.val.2
    apply Prod.ext
    · funext i
      refine Fin.cases ?_ (fun j => ?_) i
      · simp [violationTailToBudget,budgetToViolationTail,h]
      · simp [violationTailToBudget,budgetToViolationTail]
    · simp [violationTailToBudget,budgetToViolationTail,h]
  right_inv w := by
    apply Subtype.ext
    apply Prod.ext
    · simpa only [violationTailToBudget,budgetToViolationTail,Fin.cons_zero] using
        packPivot_unpackPivot w.val.1
    · funext i
      simp [violationTailToBudget,budgetToViolationTail]

theorem pairViolation_natCard (n m : ℕ) :
    Nat.card (PairViolationData (Fin (n+1)) m) = 2*Fintype.card (SignedBudget n m) := by
  rw [Nat.card_congr (pairViolationEquiv m),
    Nat.card_congr (Equiv.prodCongr (Equiv.refl Bool) (violationTailEquiv n m)),
    Nat.card_eq_fintype_card,Fintype.card_prod,Fintype.card_bool]

noncomputable def pairViolationPolynomial (n : ℕ) : ℚ[X] := C 2 * signedBudgetPolynomial n

theorem pairViolationPolynomial_eval (n m : ℕ) :
    (pairViolationPolynomial n).eval (m:ℚ) = (Nat.card (PairViolationData (Fin (n+1)) m):ℚ) := by
  rw [pairViolationPolynomial,eval_mul,eval_C,signedBudgetPolynomial_eval,pairViolation_natCard]
  push_cast
  rfl

theorem pairViolationPolynomial_degree (n : ℕ) :
    (pairViolationPolynomial n).natDegree ≤ n+2 := by
  unfold pairViolationPolynomial
  apply natDegree_mul_le.trans
  rw [natDegree_C,zero_add]
  exact signedBudgetPolynomial_degree n

end HKMEhrhart
