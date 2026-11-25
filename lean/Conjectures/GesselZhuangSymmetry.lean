module

public import Conjectures.GesselZhuangPolynomial
public import Mathlib.Algebra.Polynomial.Reverse
public import Mathlib.Data.Fin.Rev

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

Reflection of the refined row reverses the gap-position index. This proves
fixed-path symmetry directly from the exact insertion recurrence.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped BigOperators

def SymmetricVector {n : ℕ} (d : ℕ) (f : Fin n → ℝ[X]) : Prop :=
  ∀ i, reflect d (f i) = f i.rev

theorem reflect_finsetSum {ι : Type*} (s : Finset ι) (f : ι → ℝ[X]) (d : ℕ) :
    reflect d (∑ i ∈ s, f i) = ∑ i ∈ s, reflect d (f i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih => simp [ha, ih]

theorem reflect_succ_of_natDegree_le {d : ℕ} {p : ℝ[X]} (hp : p.natDegree ≤ d) :
    reflect (d + 1) p = X * reflect d p := by
  simpa [add_comm, mul_comm] using
    (reflect_mul (1 : ℝ[X]) p (F := 1) (G := d) (by simp) hp)

theorem reflect_succ_X_mul {d : ℕ} {p : ℝ[X]} (hp : p.natDegree ≤ d) :
    reflect (d + 1) (X * p) = reflect d p := by
  simpa [add_comm] using
    (reflect_mul (X : ℝ[X]) p (F := 1) (G := d) (by simp) hp)

theorem reflect_cutPolynomial {n d : ℕ} {f : Fin n → ℝ[X]}
    (hf : SymmetricVector d f) (hd : ∀ i, (f i).natDegree ≤ d)
    (k : ℕ) (hk : k ≤ n) :
    reflect (d + 1) (cutPolynomial f k) = cutPolynomial f (n - k) := by
  rw [cutPolynomial, reflect_finsetSum]
  have hterm (i : Fin n) :
      reflect (d + 1) (if i.val < k then X * f i else f i) =
        if i.val < k then f i.rev else X * f i.rev := by
    split_ifs
    · rw [reflect_succ_X_mul (hd i), hf i]
    · rw [reflect_succ_of_natDegree_le (hd i), hf i]
  simp_rw [hterm]
  rw [← Equiv.sum_comp Fin.revPerm
    (fun i : Fin n => if i.val < k then f i.rev else X * f i.rev)]
  simp only [Fin.revPerm_apply, Fin.rev_rev]
  apply Finset.sum_congr rfl
  intro i _
  have hi := i.isLt
  have hrev : i.rev.val = n - (i.val + 1) := rfl
  split_ifs <;> simp_all <;> omega

theorem symmetricVector_one : SymmetricVector 0 (fun _ : Fin 1 => (1 : ℝ[X])) := by
  intro i
  simp

theorem SymmetricVector.up {h d : ℕ} {f : Fin (h + 1) → ℝ[X]}
    (hf : SymmetricVector d f) (hd : ∀ i, (f i).natDegree ≤ d) :
    SymmetricVector (d + 1) (upVector f) := by
  intro i
  rw [upVector, reflect_cutPolynomial hf hd _ (by have := i.isLt; omega)]
  change cutPolynomial f (h + 1 - i.val) = cutPolynomial f (h + 2 - (i.val + 1))
  congr 1
  omega

theorem SymmetricVector.flat {h d : ℕ} {f : Fin (h + 1) → ℝ[X]}
    (hf : SymmetricVector d f) (hd : ∀ i, (f i).natDegree ≤ d) :
    SymmetricVector (d + 1) (flatVector f) := by
  intro i
  rw [flatVector, reflect_add,
    reflect_cutPolynomial hf hd _ (by have := i.isLt; omega),
    reflect_cutPolynomial hf hd _ (by have := i.isLt; omega)]
  change cutPolynomial f (h + 1 - i.val) + cutPolynomial f (h + 1 - (i.val + 1)) =
    cutPolynomial f i.rev.val + cutPolynomial f (i.rev.val + 1)
  have hi := i.isLt
  have hr : i.rev.val = h + 1 - (i.val + 1) := rfl
  rw [hr, show h + 1 - i.val = (h + 1 - (i.val + 1)) + 1 by omega]
  exact add_comm _ _

theorem SymmetricVector.down {h d : ℕ} {f : Fin (h + 2) → ℝ[X]}
    (hf : SymmetricVector d f) (hd : ∀ i, (f i).natDegree ≤ d) :
    SymmetricVector (d + 1) (downVector f) := by
  intro i
  rw [downVector, reflect_cutPolynomial hf hd _ (by have := i.isLt; omega)]
  change cutPolynomial f (h + 2 - (i.val + 1)) = cutPolynomial f (i.rev.val + 1)
  congr 1
  have hi := i.isLt
  change h + 2 - (i.val + 1) = h + 1 - (i.val + 1) + 1
  omega

theorem SymmetricVector.sum {n d : ℕ} {f : Fin n → ℝ[X]}
    (hf : SymmetricVector d f) : reflect d (∑ i, f i) = ∑ i, f i := by
  rw [reflect_finsetSum]
  change ∀ i, reflect d (f i) = f i.rev at hf
  simp_rw [hf]
  exact Equiv.sum_comp Fin.revPerm f

end GesselZhuang
