import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Fintype.Pi
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Push

/-!
Finite weighted averaging for the Bernardi–Morales delta process.

The weights are algebraic Bernoulli weights. No positivity, measure-theoretic
independence, or probabilistic hypothesis is needed for these finite identities.
-/

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open Finset Matrix

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

def bitWeight (q : R) (b : Bool) : R := if b then q else 1 - q

def bitValue (b : Bool) : R := if b then 1 else 0

def weight (q : V → R) (s : V → Bool) : R := ∏ i, bitWeight (q i) (s i)

def average (q : V → R) (f : (V → Bool) → R) : R :=
  ∑ s, weight q s * f s

theorem bitWeight_sum (q : R) : ∑ b : Bool, bitWeight q b = 1 := by
  simp [bitWeight]

theorem bitWeight_value (q : R) :
    ∑ b : Bool, bitWeight q b * bitValue b = q := by
  simp [bitWeight, bitValue]

theorem sum_prod_choices (f : V → Bool → R) :
    (∑ s : V → Bool, ∏ i, f i (s i)) = ∏ i, ∑ b : Bool, f i b := by
  simpa only [Fintype.piFinset_univ] using (Finset.prod_univ_sum (fun _ : V => (Finset.univ : Finset Bool)) f).symm

theorem average_prod (q : V → R) (f : V → Bool → R) :
    average q (fun s => ∏ i, f i (s i)) =
      ∏ i, ∑ b : Bool, bitWeight (q i) b * f i b := by
  unfold average weight
  simp_rw [← Finset.prod_mul_distrib]
  exact sum_prod_choices (fun i b => bitWeight (q i) b * f i b)

theorem weight_sum (q : V → R) : ∑ s : V → Bool, weight q s = 1 := by
  unfold weight
  rw [sum_prod_choices]
  simp only [bitWeight_sum, Finset.prod_const_one]

theorem average_const (q : V → R) (c : R) : average q (fun _ => c) = c := by
  simp [average, ← Finset.sum_mul, weight_sum]

theorem average_add (q : V → R) (f g : (V → Bool) → R) :
    average q (fun s => f s + g s) = average q f + average q g := by
  simp [average, mul_add, Finset.sum_add_distrib]

theorem average_mul_const (q : V → R) (f : (V → Bool) → R) (c : R) :
    average q (fun s => f s * c) = average q f * c := by
  simp [average, mul_assoc, Finset.sum_mul]

theorem average_const_mul (q : V → R) (c : R) (f : (V → Bool) → R) :
    average q (fun s => c * f s) = c * average q f := by
  simpa [mul_comm] using average_mul_const q f c

/-- Averaging a determinant whose columns use separate coordinates replaces
each column by its weighted average. -/
theorem average_det_columns (q : V → R) (C : V → Bool → V → R) :
    average q (fun s => Matrix.det (Matrix.of fun i j => C j (s j) i)) =
      Matrix.det (Matrix.of fun i j => ∑ b : Bool, bitWeight (q j) b * C j b i) := by
  unfold average
  simp_rw [Matrix.det_apply', Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro σ _
  calc
    (∑ s : V → Bool, weight q s *
        (((Equiv.Perm.sign σ : ℤ) : R) * ∏ i, C i (s i) (σ i))) =
        ((Equiv.Perm.sign σ : ℤ) : R) *
          average q (fun s => ∏ i, C i (s i) (σ i)) := by
      rw [average, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro s _
      ring
    _ = _ := by
      congr 1
      exact average_prod q (fun i b => C i b (σ i))

/-- The matrix with rows in `A` replaced by standard basis rows. -/
def fixedRows (A : Finset V) (B : Matrix V V R) : Matrix V V R :=
  fun i j => if i ∈ A then (1 : Matrix V V R) i j else B i j

/-- Standard basis rows allow their columns to be cleared without changing
the determinant. The remaining columns retain the complementary entries. -/
def fixedRowsCleared (A : Finset V) (B : Matrix V V R) : Matrix V V R :=
  fun i j => if j ∈ A then (1 : Matrix V V R) i j
    else if i ∈ A then 0 else B i j

theorem det_fixedRowsCleared (A : Finset V) (B : Matrix V V R) :
    (fixedRowsCleared A B).det = (fixedRows A B).det := by
  rw [Matrix.det_apply', Matrix.det_apply']
  apply Finset.sum_congr rfl
  intro σ _
  congr 1
  by_cases hσ : ∀ i ∈ A, σ i = i
  · apply Finset.prod_congr rfl
    intro i _
    by_cases hi : i ∈ A
    · simp [fixedRowsCleared, fixedRows, hi, hσ i hi]
    · have hsi : σ i ∉ A := by
        intro hs
        have hh := hσ (σ i) hs
        have he : σ i = i := σ.injective hh
        exact hi (he ▸ hs)
      simp [fixedRowsCleared, fixedRows, hi, hsi]
  · push Not at hσ
    obtain ⟨i, hi, hne⟩ := hσ
    have hleft : (∏ j, fixedRowsCleared A B (σ j) j) = 0 := by
      apply Finset.prod_eq_zero (Finset.mem_univ i)
      simp [fixedRowsCleared, hi, Matrix.one_apply, hne]
    have hright : (∏ j, fixedRows A B (σ j) j) = 0 := by
      apply Finset.prod_eq_zero (Finset.mem_univ (σ.symm i))
      have hs : i ≠ σ.symm i := by
        intro he
        apply hne
        exact (congrArg σ he).trans (σ.apply_symm_apply i)
      simp [fixedRows, hi, Matrix.one_apply, hs]
    rw [hleft, hright]

def diagonalRows (A : Finset V) (d : V → R) (B : Matrix V V R) : Matrix V V R :=
  fun i j => if i ∈ A then Matrix.diagonal d i j else B i j

def diagonalRowsCleared (A : Finset V) (d : V → R) (B : Matrix V V R) : Matrix V V R :=
  fun i j => if j ∈ A then Matrix.diagonal d i j
    else if i ∈ A then 0 else B i j

theorem det_diagonalRowsCleared (A : Finset V) (d : V → R) (B : Matrix V V R) :
    (diagonalRowsCleared A d B).det = (diagonalRows A d B).det := by
  rw [Matrix.det_apply', Matrix.det_apply']
  apply Finset.sum_congr rfl
  intro σ _
  congr 1
  by_cases hσ : ∀ i ∈ A, σ i = i
  · apply Finset.prod_congr rfl
    intro i _
    by_cases hi : i ∈ A
    · simp [diagonalRowsCleared, diagonalRows, hi, hσ i hi]
    · have hsi : σ i ∉ A := by
        intro hs
        have hh := hσ (σ i) hs
        have he : σ i = i := σ.injective hh
        exact hi (he ▸ hs)
      simp [diagonalRowsCleared, diagonalRows, hi, hsi]
  · push Not at hσ
    obtain ⟨i, hi, hne⟩ := hσ
    have hleft : (∏ j, diagonalRowsCleared A d B (σ j) j) = 0 := by
      apply Finset.prod_eq_zero (Finset.mem_univ i)
      simp [diagonalRowsCleared, hi, Matrix.diagonal_apply, hne]
    have hright : (∏ j, diagonalRows A d B (σ j) j) = 0 := by
      apply Finset.prod_eq_zero (Finset.mem_univ (σ.symm i))
      have hs : i ≠ σ.symm i := by
        intro he
        apply hne
        exact (congrArg σ he).trans (σ.apply_symm_apply i)
      simp [diagonalRows, hi, Matrix.diagonal_apply, hs]
    rw [hleft, hright]

/-- A selected row can carry a factor depending on its own coordinate, even
when that coordinate also occurs elsewhere in the same column. Clearing
the selected columns removes that apparent dependence before averaging. -/
theorem average_diagonalRows_columns (q : V → R) (A : Finset V)
    (d : V → Bool → R) (C : V → Bool → V → R) :
    average q (fun s => (diagonalRows A (fun i => d i (s i))
      (Matrix.of fun i j => C j (s j) i)).det) =
    (diagonalRows A (fun i => ∑ b : Bool, bitWeight (q i) b * d i b)
      (Matrix.of fun i j => ∑ b : Bool, bitWeight (q j) b * C j b i)).det := by
  let K : V → Bool → V → R := fun j b i =>
    if j ∈ A then if i = j then d j b else 0
    else if i ∈ A then 0 else C j b i
  have hleft (s : V → Bool) :
      (diagonalRows A (fun i => d i (s i)) (Matrix.of fun i j => C j (s j) i)).det =
        Matrix.det (Matrix.of fun i j => K j (s j) i) := by
    rw [← det_diagonalRowsCleared]
    congr 1
    ext i j
    by_cases hi : i = j
    · subst j
      simp [diagonalRowsCleared, K, Matrix.diagonal_apply]
    · simp [diagonalRowsCleared, K, Matrix.diagonal_apply, hi]
  simp_rw [hleft]
  rw [average_det_columns, ← det_diagonalRowsCleared]
  congr 1
  ext i j
  by_cases hj : j ∈ A
  · by_cases hij : i = j
    · subst j
      simp [K, hj, diagonalRowsCleared, Matrix.diagonal_apply]
    · simp [K, hj, hij, diagonalRowsCleared, Matrix.diagonal_apply]
  · by_cases hi : i ∈ A
    · simp [K, hj, hi, diagonalRowsCleared]
    · simp [K, hj, hi, diagonalRowsCleared]

end BernardiMorales
