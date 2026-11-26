module

public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Logic.Equiv.Fin.Basic
public import Mathlib.Algebra.Group.Equiv.Basic

/-! Literal displacements in direct and skew sums of permutations.
The disjoint displacement intervals at skew nodes force the lowest
common ancestor of a same-diagonal pair to be a direct-sum node. -/

@[expose] public section

open scoped BigOperators

namespace SeparableDerangements

/-- The direct or skew sum of two finite permutations. The definition
    uses the same finite equivalences as the upstream CKZ block sum. -/
def blockSum {m k : ℕ} (skew : Bool)
    (α : Equiv.Perm (Fin m)) (β : Equiv.Perm (Fin k)) : Equiv.Perm (Fin (m + k)) :=
  finSumFinEquiv.symm.trans ((Equiv.sumCongr α β).trans
    (if skew then (Equiv.sumComm _ _).trans
      (finSumFinEquiv.trans (finCongr (Nat.add_comm k m))) else finSumFinEquiv))

/-- Value minus position, using the actual entries of the permutation. -/
def displacement {n : ℕ} (π : Equiv.Perm (Fin n)) (i : Fin n) : ℤ :=
  (π i).val - (i.val : ℤ)

theorem displacement_left_block {m k : ℕ} (skew : Bool)
    (α : Equiv.Perm (Fin m)) (β : Equiv.Perm (Fin k)) (i : Fin m) :
    displacement (blockSum skew α β) (Fin.castAdd k i) =
      displacement α i + (if skew then (k : ℤ) else 0) := by
  have h : (blockSum skew α β (Fin.castAdd k i)).val =
      (if skew then k else 0) + (α i).val := by
    cases skew <;> simp [blockSum, Equiv.sumCongr, Equiv.sumComm, Nat.add_comm]
  unfold displacement
  rw [h]
  cases skew <;> simp
  omega

theorem displacement_right_block {m k : ℕ} (skew : Bool)
    (α : Equiv.Perm (Fin m)) (β : Equiv.Perm (Fin k)) (i : Fin k) :
    displacement (blockSum skew α β) (Fin.natAdd m i) =
      displacement β i - (if skew then (m : ℤ) else 0) := by
  have h : (blockSum skew α β (Fin.natAdd m i)).val =
      (if skew then 0 else m) + (β i).val := by
    cases skew <;> simp [blockSum, Equiv.sumCongr, Equiv.sumComm]
  unfold displacement
  rw [h]
  cases skew <;> simp
  omega

/-- The length of the blocks before block `i`. -/
def before : {k : ℕ} → (Fin k → ℕ) → Fin k → ℕ
  | 0, _, i => Fin.elim0 i
  | k + 1, m, i => Fin.cases 0 (fun j : Fin k => m 0 + before (m ∘ Fin.succ) j) i

/-- The length of the blocks after block `i`. -/
def after : {k : ℕ} → (Fin k → ℕ) → Fin k → ℕ
  | 0, _, i => Fin.elim0 i
  | k + 1, m, i => Fin.cases (∑ j : Fin k, m j.succ) (fun j => after (m ∘ Fin.succ) j) i

theorem before_add_length_add_after {k : ℕ} (m : Fin k → ℕ) (i : Fin k) :
    before m i + m i + after m i = ∑ j, m j := by
  induction k with
  | zero => exact Fin.elim0 i
  | succ k ih =>
    rcases Fin.eq_zero_or_eq_succ i with h | ⟨j, h⟩
    · subst i
      simp [before, after, Fin.sum_univ_succ]
    · subst i
      have ht := ih (m ∘ Fin.succ) j
      simp only [before, after, Fin.cases_succ, Function.comp_apply] at *
      rw [Fin.sum_univ_succ]
      omega

/-- The position occupied by a point of the `i`th child. -/
def blockPosition {k : ℕ} (m : Fin k → ℕ) (i : Fin k) (j : Fin (m i)) :
    Fin (∑ i, m i) :=
  ⟨before m i + j.val, by
    have h := before_add_length_add_after m i
    have hj := j.isLt
    omega⟩

/-- Repeated direct sum or repeated skew sum in the actual symmetric group. -/
def blockSums (skew : Bool) :
    {k : ℕ} → (m : Fin k → ℕ) → (∀ i, Equiv.Perm (Fin (m i))) → Equiv.Perm (Fin (∑ i, m i))
  | 0, _, _ => Equiv.refl _
  | k + 1, m, π =>
    let e := finCongr (Fin.sum_univ_succ m)
    e.trans ((blockSum skew (π 0) (blockSums skew (m ∘ Fin.succ) fun i : Fin k => π i.succ)).trans
      e.symm)

private theorem blockPosition_zero {k : ℕ} (m : Fin (k + 1) → ℕ) (j : Fin (m 0)) :
    finCongr (Fin.sum_univ_succ m) (blockPosition m 0 j) =
      Fin.castAdd (∑ i : Fin k, m i.succ) j := by
  apply Fin.ext
  change before m 0 + j.val = j.val
  simp [before]

private theorem blockPosition_succ {k : ℕ} (m : Fin (k + 1) → ℕ) (i : Fin k)
    (j : Fin (m i.succ)) :
    finCongr (Fin.sum_univ_succ m) (blockPosition m i.succ j) =
      Fin.natAdd (m 0) (blockPosition (m ∘ Fin.succ) i j) := by
  apply Fin.ext
  change m 0 + before (m ∘ Fin.succ) i + j.val =
    m 0 + (before (m ∘ Fin.succ) i + j.val)
  exact add_assoc _ _ _

/-- For direct sums there is no shift. For skew sums the signed shift
    is the sum of lengths after the child minus the sum before it. -/
theorem displacement_blockSums {k : ℕ} (skew : Bool) (m : Fin k → ℕ)
    (π : ∀ i, Equiv.Perm (Fin (m i))) (i : Fin k) (j : Fin (m i)) :
    displacement (blockSums skew m π) (blockPosition m i j) =
      displacement (π i) j + (if skew then (after m i : ℤ) - before m i else 0) := by
  induction k with
  | zero => exact Fin.elim0 i
  | succ k ih =>
    revert j
    refine Fin.cases ?_ (fun s => ?_) i
    · intro j
      change displacement (blockSum skew (π 0) (blockSums skew (m ∘ Fin.succ) fun i => π i.succ))
        (finCongr (Fin.sum_univ_succ m) (blockPosition m 0 j)) = _
      rw [blockPosition_zero]
      have hh := displacement_left_block skew (π 0)
        (blockSums skew (m ∘ Fin.succ) fun i => π i.succ) j
      exact hh.trans (by cases skew <;> simp [before, after])
    · intro j
      change displacement (blockSum skew (π 0) (blockSums skew (m ∘ Fin.succ) fun i => π i.succ))
        (finCongr (Fin.sum_univ_succ m) (blockPosition m s.succ j)) = _
      rw [blockPosition_succ]
      have hh := displacement_right_block skew (π 0)
        (blockSums skew (m ∘ Fin.succ) fun i => π i.succ) (blockPosition (m ∘ Fin.succ) s j)
      refine hh.trans ?_
      rw [ih]
      cases skew <;> simp [before, after]
      omega

theorem before_add_length_le_of_lt {k : ℕ} (m : Fin k → ℕ) {i j : Fin k} (h : i < j) :
    before m i + m i ≤ before m j := by
  induction k with
  | zero => exact Fin.elim0 i
  | succ k ih =>
    rcases Fin.eq_zero_or_eq_succ j with hJ | ⟨v, hJ⟩
    · subst j
      exact (Fin.not_lt_zero i h).elim
    subst j
    rcases Fin.eq_zero_or_eq_succ i with hI | ⟨u, hI⟩
    · subst i
      simp [before]
    subst i
    have huv : u < v := Fin.succ_lt_succ_iff.mp h
    have hRec := ih (m ∘ Fin.succ) huv
    simp only [before, Fin.cases_succ, Function.comp_apply] at *
    omega

/-- At a skew node the displacement of every point in an earlier child
    is strictly greater than that of every point in a later child. -/
theorem skew_displacements_strictly_separated {k : ℕ} (m : Fin k → ℕ)
    (π : ∀ i, Equiv.Perm (Fin (m i))) {i j : Fin k} (h : i < j)
    (a : Fin (m i)) (b : Fin (m j)) :
    displacement (blockSums true m π) (blockPosition m j b) <
      displacement (blockSums true m π) (blockPosition m i a) := by
  rw [displacement_blockSums, displacement_blockSums]
  simp only [ite_true]
  have hBefore := before_add_length_le_of_lt m h
  have hI := before_add_length_add_after m i
  have hJ := before_add_length_add_after m j
  have ha := a.isLt
  have hb := b.isLt
  have hA := (π i a).isLt
  have hB := (π j b).isLt
  unfold displacement
  omega

private theorem before_eq_prefix_sum {k : ℕ} (m : Fin k → ℕ) (i : Fin k) :
    before m i = ∑ j : Fin i.val, m (Fin.castLE i.isLt.le j) := by
  induction k with
  | zero => exact Fin.elim0 i
  | succ k ih =>
    rcases Fin.eq_zero_or_eq_succ i with h | ⟨j, h⟩
    · subst i
      change 0 = ∑ j : Fin 0, m (Fin.castLE (Nat.zero_le _) j)
      simp
    · subst i
      simp only [before, Fin.cases_succ, Fin.val_succ]
      rw [Fin.sum_univ_succ, ih]
      rfl

/-- The position map is the canonical enumeration by consecutive blocks. -/
theorem blockPosition_eq_finSigmaFinEquiv {k : ℕ} (m : Fin k → ℕ) (i : Fin k) (j : Fin (m i)) :
    blockPosition m i j = finSigmaFinEquiv ⟨i, j⟩ := by
  apply Fin.ext
  rw [finSigmaFinEquiv_apply]
  change before m i + j.val = (∑ l : Fin i.val, m (Fin.castLE i.isLt.le l)) + j.val
  rw [before_eq_prefix_sum]

/-- Two points on the same diagonal of a skew sum have the same child. -/
theorem same_skew_displacement_implies_same_block {k : ℕ} (m : Fin k → ℕ)
    (π : ∀ i, Equiv.Perm (Fin (m i))) {i j : Fin k} (a : Fin (m i)) (b : Fin (m j))
    (h : displacement (blockSums true m π) (blockPosition m i a) =
      displacement (blockSums true m π) (blockPosition m j b)) :
    i = j := by
  by_contra hNe
  rcases lt_or_gt_of_ne hNe with hLt | hGt
  · exact (ne_of_lt (skew_displacements_strictly_separated m π hLt a b)) h.symm
  · exact (ne_of_lt (skew_displacements_strictly_separated m π hGt b a)) h

end SeparableDerangements
