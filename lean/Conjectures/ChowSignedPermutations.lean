module

public import Conjectures.ChowSignedPermutationsParity
public import Conjectures.ChowRefinement
public import Mathlib.Data.Fin.VecNotation

/-!
# The refined recurrence enumerates the source signed permutations

The proof deletes or appends the final signed letter and standardizes the
remaining absolute values in order. Thus the recurrence is proved from the
literal source statistic, rather than used as a definition of its enumerator.
-/

@[expose] public section

namespace Chow

open Polynomial
open scoped BigOperators

theorem liftLetter_gt_iff_cutoff {n : ℕ} (a : SignedLetter (n + 1))
    (x : SignedLetter n) :
    letterValue (liftLetter a.1 x) > letterValue a ↔
      (letterIndex x).val < cutoff n (letterIndex a).val := by
  rcases a with ⟨a, b⟩
  rcases x with ⟨x, c⟩
  have ha := a.isLt
  have hx := x.isLt
  cases b <;> cases c <;>
    simp only [letterValue, liftLetter, letterIndex, cutoff, Fin.succAbove,
      Bool.false_eq_true, ite_false, ite_true, Fin.lt_def,
      Fin.val_castSucc] <;>
    split_ifs <;> simp only [Fin.val_castSucc, Fin.val_succ] at * <;> omega

/-- Appending a signed letter adds exactly the last comparison prescribed by
the refinement cutoff; the first-sum descent is preserved by standardization. -/
theorem desD_appendSigned (r : ℕ) (a : SignedLetter (r + 3))
    (σ : SignedPermutation (r + 2)) :
    desD (r + 1) (appendSigned a σ) = desD r σ +
      if (lastIndex σ).val < cutoff (r + 2) (letterIndex a).val then 1 else 0 := by
  have h0 : entry (appendSigned a σ) 0 =
      letterValue (liftLetter a.1 (σ.1 0, σ.2 0)) := by
    simpa using appendSigned_entry_castSucc a σ (0 : Fin (r + 2))
  have h1 : entry (appendSigned a σ) 1 =
      letterValue (liftLetter a.1 (σ.1 1, σ.2 1)) := by
    simpa using appendSigned_entry_castSucc a σ (1 : Fin (r + 2))
  have hfirst : (entry (appendSigned a σ) 0 + entry (appendSigned a σ) 1 < 0) ↔
      entry σ 0 + entry σ 1 < 0 := by
    rw [h0, h1]
    exact letterValue_lift_sum_neg_iff a.1 _ _
  have hprefix (j : Fin (r + 1)) :
      (entry (appendSigned a σ) j.castSucc.castSucc >
        entry (appendSigned a σ) j.castSucc.succ) ↔ entry σ j.castSucc > entry σ j.succ := by
    have hcast : j.castSucc.succ = j.succ.castSucc := by apply Fin.ext; rfl
    rw [hcast, appendSigned_entry_castSucc, appendSigned_entry_castSucc]
    exact letterValue_lift_lt_iff a.1 _ _
  have hlast :
      (entry (appendSigned a σ) (Fin.last (r + 1)).castSucc >
        entry (appendSigned a σ) (Fin.last (r + 1)).succ) ↔
      (lastIndex σ).val < cutoff (r + 2) (letterIndex a).val := by
    rw [appendSigned_entry_castSucc]
    change letterValue (liftLetter a.1
      (σ.1 (Fin.last (r + 1)), σ.2 (Fin.last (r + 1)))) >
      entry (appendSigned a σ) (Fin.last (r + 2)) ↔ _
    rw [appendSigned_entry_last]
    exact liftLetter_gt_iff_cutoff a _
  unfold desD
  rw [Fin.sum_univ_castSucc]
  simp only [hfirst, hprefix, hlast]
  omega

theorem weighted_literalRefinedRow (r : ℕ) (g : Fin (2 * (r + 2)) → ℝ[X]) :
    (∑ σ : SignedPermutation (r + 2), g (lastIndex σ) * X ^ desD r σ) =
      ∑ j, g j * literalRefinedRow r j := by
  unfold literalRefinedRow
  simp_rw [Finset.mul_sum, mul_ite, mul_zero]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro σ _
  simp

/-- The complete, all-rank recurrence follows from the signed-permutation
insertion bijection and the exact descent identity. -/
theorem literalRefinedRow_succ (r : ℕ) (i : Fin (2 * (r + 3))) :
    literalRefinedRow (r + 1) i = nextRow (r + 2) (literalRefinedRow r) i := by
  have hsum := Equiv.sum_comp (appendSignedEquiv (r + 2))
    (fun σ : SignedPermutation (r + 3) =>
      if lastIndex σ = i then (X : ℝ[X]) ^ desD (r + 1) σ else 0)
  unfold literalRefinedRow
  rw [← hsum, Fintype.sum_prod_type]
  change (∑ a : SignedLetter (r + 3), ∑ σ : SignedPermutation (r + 2),
    if lastIndex (appendSigned a σ) = i then X ^ desD (r + 1) (appendSigned a σ) else 0) = _
  simp only [appendSigned_lastIndex, desD_appendSigned]
  rw [Finset.sum_eq_single (indexLetter (r + 3) i)]
  · simp only [letterIndex_indexLetter, ite_true]
    change (∑ σ : SignedPermutation (r + 2),
      X ^ (desD r σ + if (lastIndex σ).val < cutoff (r + 2) i.val then 1 else 0)) =
        nextRow (r + 2) (literalRefinedRow r) i
    calc
      _ = ∑ σ : SignedPermutation (r + 2),
          (if (lastIndex σ).val < cutoff (r + 2) i.val then X else 1) * X ^ desD r σ := by
        apply Finset.sum_congr rfl
        intro σ _
        split_ifs <;> simp [pow_succ, mul_comm]
      _ = ∑ j : Fin (2 * (r + 2)),
          (if j.val < cutoff (r + 2) i.val then X else 1) * literalRefinedRow r j :=
        weighted_literalRefinedRow r
          (fun j => if j.val < cutoff (r + 2) i.val then X else 1)
      _ = nextRow (r + 2) (literalRefinedRow r) i := by
        apply Finset.sum_congr rfl
        intro j _
        split_ifs <;> simp
  · intro a _ ha
    have hne : letterIndex a ≠ i := by
      intro h
      apply ha
      rw [← h, indexLetter_letterIndex]
    simp [hne]
  · simp

private theorem univ_perm_two :
    (Finset.univ : Finset (Equiv.Perm (Fin 2))) = {1, Equiv.swap 0 1} := by decide

private theorem univ_signs_two :
    (Finset.univ : Finset (Fin 2 → Bool)) =
      {![false,false], ![false,true], ![true,false], ![true,true]} := by decide

private theorem desD_two (σ : SignedPermutation 2) :
    desD 0 σ = (if entry σ 0 + entry σ 1 < 0 then 1 else 0) +
      (if entry σ 0 > entry σ 1 then 1 else 0) := by
  unfold desD
  rw [Fin.sum_univ_one]
  rfl

/-- The initial four counts come from enumerating all eight actual signed
permutations of rank two. -/
theorem literalRefinedRow_zero (i : Fin 4) : literalRefinedRow 0 i = baseRow2 i := by
  unfold literalRefinedRow
  rw [Fintype.sum_prod_type]
  rw [univ_perm_two]
  rw [Finset.sum_pair (by decide : (1 : Equiv.Perm (Fin 2)) ≠ Equiv.swap 0 1)]
  rw [univ_signs_two]
  simp only [desD_two]
  fin_cases i <;>
    norm_num [lastIndex, letterIndex, entry, letterValue, baseRow2,
      Fin.last, Fin.castSucc, Fin.succ, Equiv.swap_apply_def,
      Finset.sum_insert, Finset.sum_singleton, Polynomial.C_ofNat] <;> ring

/-- The recurrence-defined refinement is exactly the literal source enumerator. -/
theorem literalRefinedRow_eq_refinedRow (r : ℕ) : literalRefinedRow r = refinedRow r := by
  induction r with
  | zero =>
    funext i
    exact literalRefinedRow_zero i
  | succ r ih =>
    funext i
    rw [literalRefinedRow_succ, refinedRow_succ, ih]

/-- Exact source bridge: the row total is twice the ordinary type-D Eulerian
polynomial of the even-signed permutations at actual rank `r+2`. -/
theorem totalRow_eq_two_typeDEulerian (r : ℕ) : totalRow r = C 2 * typeDEulerian r := by
  rw [totalRow, ← literalRefinedRow_eq_refinedRow, sum_literalRefinedRow,
    allSignedEulerian_eq_two_typeDEulerian]

end Chow
