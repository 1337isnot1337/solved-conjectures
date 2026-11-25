module

public import Conjectures.NuttallHankelPolynomial
import all Conjectures.NuttallHankelPolynomial
public import Mathlib.LinearAlgebra.Matrix.SchurComplement
public import Mathlib.RingTheory.Localization.FractionRing
public import Mathlib.Analysis.Polynomial.Basic

public section

open Matrix
namespace NuttallCumulants

section Blocks
variable {R m : Type*} [CommRing R] [Fintype m] [DecidableEq m]

def lastBlockCol (B : Matrix m (Fin 2) R) (j : Fin 2) : Matrix m (Fin 1) R :=
  fun i _ => B i j

def lastBlockRow (C : Matrix (Fin 2) m R) (i : Fin 2) : Matrix (Fin 1) m R :=
  fun _ j => C i j

def bordered (A : Matrix m m R) (B : Matrix m (Fin 2) R)
    (C : Matrix (Fin 2) m R) (D : Matrix (Fin 2) (Fin 2) R) (i j : Fin 2) :=
  Matrix.fromBlocks A (lastBlockCol B j) (lastBlockRow C i) (Matrix.of fun _ _ : Fin 1 => D i j)

theorem det_bordered (A : Matrix m m R) (B : Matrix m (Fin 2) R)
    (C : Matrix (Fin 2) m R) (D : Matrix (Fin 2) (Fin 2) R) [Invertible A] (i j : Fin 2) :
    (bordered A B C D i j).det = A.det * (D - C * ⅟A * B) i j := by
  unfold bordered
  rw [Matrix.det_fromBlocks₁₁ A (lastBlockCol B j) (lastBlockRow C i) (Matrix.of fun _ _ : Fin 1 => D i j), Matrix.det_fin_one]
  simp only [Matrix.sub_apply, Matrix.mul_apply, Matrix.of_apply, lastBlockCol, lastBlockRow]

/-- The adjacent-minor identity when the top-left block is invertible. -/
theorem det_fromBlocks_adjacent (A : Matrix m m R) (B : Matrix m (Fin 2) R)
    (C : Matrix (Fin 2) m R) (D : Matrix (Fin 2) (Fin 2) R) [Invertible A] :
    (Matrix.fromBlocks A B C D).det * A.det =
      (bordered A B C D 0 0).det * (bordered A B C D 1 1).det -
      (bordered A B C D 0 1).det * (bordered A B C D 1 0).det := by
  rw [Matrix.det_fromBlocks₁₁, Matrix.det_fin_two]
  simp only [det_bordered]
  ring
end Blocks

section Domain
variable {R m : Type*} [CommRing R] [IsDomain R] [Fintype m] [DecidableEq m]

theorem det_fromBlocks_adjacent_of_ne_zero (A : Matrix m m R) (B : Matrix m (Fin 2) R)
    (C : Matrix (Fin 2) m R) (D : Matrix (Fin 2) (Fin 2) R) (h : A.det ≠ 0) :
    (Matrix.fromBlocks A B C D).det * A.det =
      (bordered A B C D 0 0).det * (bordered A B C D 1 1).det -
      (bordered A B C D 0 1).det * (bordered A B C D 1 0).det := by
  let f := algebraMap R (FractionRing R)
  have hf : Function.Injective f := IsFractionRing.injective R _
  have ha : (f.mapMatrix A).det ≠ 0 := by
    rw [← RingHom.map_det]
    exact fun hz => h (hf (hz.trans (map_zero f).symm))
  let : Invertible (f.mapMatrix A) := Matrix.invertibleOfIsUnitDet _ (isUnit_iff_ne_zero.mpr ha)
  apply hf
  have hb (i j : Fin 2) :
      f.mapMatrix (bordered A B C D i j) = bordered (f.mapMatrix A) (B.map f) (C.map f) (f.mapMatrix D) i j := by
    ext (i' | i') (j' | j') <;> rfl
  have hm : f.mapMatrix (fromBlocks A B C D) = fromBlocks (f.mapMatrix A) (B.map f) (C.map f) (f.mapMatrix D) := by
    ext (i | i) (j | j) <;> rfl
  simp only [map_mul, map_sub, RingHom.map_det, hm, hb]
  exact det_fromBlocks_adjacent _ _ _ _
end Domain

def extendedIndex (n : ℕ) (k : Fin 2) (i : Fin n ⊕ Fin 1) : ℕ :=
  Sum.elim Fin.val (fun _ => n + k.val) i

theorem extendedIndex_zero (n : ℕ) (i : Fin n ⊕ Fin 1) :
    extendedIndex n 0 i = (finSumFinEquiv i : Fin (n+1)).val := by
  cases i with
  | inl a => simp [extendedIndex, finSumFinEquiv_apply_left]
  | inr a =>
    simp [extendedIndex, finSumFinEquiv_apply_right]

theorem extendedIndex_one (n : ℕ) (i : Fin n ⊕ Fin 1) :
    extendedIndex n 1 i = lastShift n (finSumFinEquiv i) := by
  cases i with
  | inl a =>
    rw [finSumFinEquiv_apply_left]
    have hn : Fin.castAdd 1 a ≠ Fin.last n := by
      intro h
      have he : a.val = n := congrArg Fin.val h
      exact (Nat.ne_of_lt a.isLt) he
    simp [extendedIndex, lastShift, hn]
  | inr a =>
    have ha : a = 0 := Subsingleton.elim _ _
    subst a
    rw [finSumFinEquiv_apply_right]
    have hh : Fin.natAdd n (0 : Fin 1) = Fin.last n := Fin.ext (Nat.add_zero _)
    rw [hh]
    simp [extendedIndex, lastShift]

open Polynomial

noncomputable def hankelAblock (n : ℕ) : Matrix (Fin n) (Fin n) ℝ[X] :=
  modeHankelMatrix Fin.val Fin.val
noncomputable def hankelBblock (n : ℕ) : Matrix (Fin n) (Fin 2) ℝ[X] :=
  Matrix.of fun i j => modePolynomials (i.val + (n+j.val))
noncomputable def hankelCblock (n : ℕ) : Matrix (Fin 2) (Fin n) ℝ[X] :=
  Matrix.of fun i j => modePolynomials ((n+i.val)+j.val)
noncomputable def hankelDblock (n : ℕ) : Matrix (Fin 2) (Fin 2) ℝ[X] :=
  Matrix.of fun i j => modePolynomials ((n+i.val)+(n+j.val))

theorem hankel_bordered_apply (n : ℕ) (a b : Fin 2) (i j : Fin n ⊕ Fin 1) :
    bordered (hankelAblock n) (hankelBblock n) (hankelCblock n) (hankelDblock n) a b i j =
      modePolynomials (extendedIndex n a i + extendedIndex n b j) := by
  cases i <;> cases j <;> rfl

theorem hankel_block_full_det (n : ℕ) :
    (fromBlocks (hankelAblock n) (hankelBblock n) (hankelCblock n) (hankelDblock n)).det =
      polyHankelA (n+2) := by
  unfold polyHankelA
  rw [← Matrix.det_submatrix_equiv_self (finSumFinEquiv : Fin n ⊕ Fin 2 ≃ Fin (n+2))]
  congr 1
  ext (i | i) (j | j) <;>
    simp only [fromBlocks_apply₁₁, fromBlocks_apply₁₂, fromBlocks_apply₂₁, fromBlocks_apply₂₂,
      Matrix.submatrix_apply, hankelAblock, hankelBblock, hankelCblock, hankelDblock,
      modeHankelMatrix, of_apply, finSumFinEquiv_apply_left, finSumFinEquiv_apply_right,
      Fin.val_castAdd, Fin.val_natAdd]

def hankelIndex (n : ℕ) (a : Fin 2) : Fin (n+1) → ℕ :=
  if a = 0 then Fin.val else lastShift n

theorem extendedIndex_eq_hankelIndex (n : ℕ) (a : Fin 2) (i : Fin n ⊕ Fin 1) :
    extendedIndex n a i = hankelIndex n a (finSumFinEquiv i) := by
  fin_cases a
  · simpa [hankelIndex] using extendedIndex_zero n i
  · simpa [hankelIndex] using extendedIndex_one n i

theorem hankel_bordered_det (n : ℕ) (a b : Fin 2) :
    (bordered (hankelAblock n) (hankelBblock n) (hankelCblock n) (hankelDblock n) a b).det =
      (modeHankelMatrix (hankelIndex n a) (hankelIndex n b)).det := by
  rw [← Matrix.det_submatrix_equiv_self (finSumFinEquiv : Fin n ⊕ Fin 1 ≃ Fin (n+1))]
  congr 1
  ext i j
  simp only [hankel_bordered_apply, extendedIndex_eq_hankelIndex, Matrix.submatrix_apply,
    modeHankelMatrix, Matrix.of_apply]

theorem polyHankel_adjacent (n : ℕ) (h : polyHankelA n ≠ 0) :
    polyHankelA (n+2) * polyHankelA n =
      polyHankelA (n+1) * polyHankelC n - (polyHankelB n)^2 := by
  have ha : (hankelAblock n).det = polyHankelA n := rfl
  have ht := det_fromBlocks_adjacent_of_ne_zero (hankelAblock n) (hankelBblock n)
    (hankelCblock n) (hankelDblock n) (ha.symm ▸ h)
  rw [hankel_block_full_det, ha] at ht
  have hz : hankelIndex n 0 = Fin.val := by simp [hankelIndex]
  have ho : hankelIndex n 1 = lastShift n := by simp [hankelIndex]
  simp only [hankel_bordered_det, hz, ho] at ht
  have hb : (modeHankelMatrix (lastShift n) Fin.val).det = polyHankelB n := by
    rw [← Matrix.det_transpose, modeHankel_transpose]
    rfl
  rw [hb] at ht
  simpa only [polyHankelA, polyHankelB, polyHankelC, pow_two] using ht

theorem polyHankelA_zero : polyHankelA 0 = 1 := by
  simp [polyHankelA]

theorem polyHankelA_one : polyHankelA 1 = modePolynomials 0 := by
  rw [polyHankelA, Matrix.det_fin_one]
  rfl

theorem polyHankelA_step (n : ℕ) :
    polyHankelA n ≠ 0 ∧ polyHankelA (n+1) ≠ 0 ∧
      (polyHankelA (n+1)).natDegree = (polyHankelA n).natDegree + n + 2 := by
  induction n with
  | zero =>
    rw [polyHankelA_zero, polyHankelA_one]
    have hl := (modePolynomials_top 0).2
    refine ⟨one_ne_zero, ?_, by simp [(modePolynomials_top 0).1]⟩
    intro hz
    rw [hz] at hl
    norm_num at hl
  | succ n ih =>
    obtain ⟨hn, hn1, hd⟩ := ih
    have hadj := polyHankel_adjacent n hn
    obtain ⟨ht, hl⟩ := polyHankel_square_difference_top n hn1
    have hprod : polyHankelA (n+2) * polyHankelA n ≠ 0 := by
      rw [hadj]
      intro hz
      rw [hz, natDegree_zero] at ht
      omega
    have hn2 : polyHankelA (n+2) ≠ 0 := left_ne_zero_of_mul hprod
    refine ⟨hn1, hn2, ?_⟩
    have h := congrArg natDegree hadj
    rw [natDegree_mul hn2 hn, ht] at h
    change (polyHankelA (n+2)).natDegree = (polyHankelA (n+1)).natDegree + (n+1) + 2
    omega

theorem polyHankelA_ne_zero (n : ℕ) : polyHankelA n ≠ 0 := (polyHankelA_step n).1

theorem polyHankelA_degree_twice (n : ℕ) :
    2 * (polyHankelA n).natDegree = n * (n+3) := by
  induction n with
  | zero => simp [polyHankelA_zero]
  | succ n ih =>
    rw [(polyHankelA_step n).2.2, show ∀ d : ℕ, 2 * (d + n + 2) = 2*d + 2*n + 4 by
      intro d; ring, ih]
    ring

theorem polyHankelA_leading_sign_step (n : ℕ) :
    (polyHankelA (n+2)).leadingCoeff * (polyHankelA n).leadingCoeff < 0 := by
  have hadj := polyHankel_adjacent n (polyHankelA_ne_zero n)
  have ht := (polyHankel_square_difference_top n (polyHankelA_ne_zero (n+1))).2
  rw [← leadingCoeff_mul, hadj, ht]
  have hl : (polyHankelA (n+1)).leadingCoeff ≠ 0 :=
    fun h => polyHankelA_ne_zero _ (leadingCoeff_eq_zero.mp h)
  have hp : (0:ℝ) < ((n+1 : ℕ) : ℝ) := by positivity
  exact mul_neg_of_neg_of_pos (neg_neg_of_pos (mul_pos (by norm_num) hp)) (sq_pos_of_ne_zero hl)

/-- After removing the parity of its degree, every first-mode Hankel
polynomial has positive leading coefficient. -/
theorem polyHankelA_leading_sign (n : ℕ) :
    (-1 : ℝ) ^ (polyHankelA n).natDegree * (polyHankelA n).leadingCoeff > 0 := by
  induction n using Nat.twoStepInduction with
  | zero => simp [polyHankelA_zero]
  | one =>
    rw [polyHankelA_one, (modePolynomials_top 0).1, (modePolynomials_top 0).2]
    norm_num
  | more n ih _ =>
    have h := polyHankelA_leading_sign_step n
    have hsum : (polyHankelA (n+2)).natDegree + (polyHankelA n).natDegree =
        2 * (polyHankelA (n+1)).natDegree + 1 := by
      have h₁ := (polyHankelA_step n).2.2
      have h₂ := (polyHankelA_step (n+1)).2.2
      change (polyHankelA (n+2)).natDegree = (polyHankelA (n+1)).natDegree + (n+1) + 2 at h₂
      omega
    have hs :
        (((-1:ℝ) ^ (polyHankelA (n+2)).natDegree) * (polyHankelA (n+2)).leadingCoeff) *
        (((-1:ℝ) ^ (polyHankelA n).natDegree) * (polyHankelA n).leadingCoeff) > 0 := by
      calc
        _ = (-1 : ℝ) ^ ((polyHankelA (n+2)).natDegree + (polyHankelA n).natDegree) *
            ((polyHankelA (n+2)).leadingCoeff * (polyHankelA n).leadingCoeff) := by
          rw [pow_add]
          ring
        _ > 0 := by
          rw [hsum, pow_succ, pow_mul]
          norm_num
          linarith
    exact pos_of_mul_pos_left hs ih.le

theorem polyHankelA_degree (n : ℕ) :
    (polyHankelA n).natDegree = 2*n+n.choose 2 := by
  induction n with
  | zero => simp [polyHankelA_zero]
  | succ n ih =>
    rw [(polyHankelA_step n).2.2, ih, Nat.choose_succ_succ, Nat.choose_one_right]
    change 2*n+n.choose 2+n+2 = 2*(n+1)+(n+n.choose 2)
    omega

theorem polyHankelA_leading_choose_sign (n : ℕ) :
    (-1 : ℝ) ^ n.choose 2 * (polyHankelA n).leadingCoeff > 0 := by
  simpa only [polyHankelA_degree, pow_add, pow_mul, neg_one_sq, one_pow, one_mul] using
    polyHankelA_leading_sign n

open Filter Topology

theorem polyHankelA_eval_normalized (n : ℕ) :
    Tendsto (fun x : ℝ => (polyHankelA n).eval x / x ^ (polyHankelA n).natDegree) atTop
      (𝓝 (polyHankelA n).leadingCoeff) := by
  let P := polyHankelA n
  have hd : P.degree = (X ^ P.natDegree : ℝ[X]).degree := by
    rw [degree_eq_natDegree (polyHankelA_ne_zero n), degree_X_pow]
  simpa only [eval_pow, eval_X, leadingCoeff_pow, leadingCoeff_X, one_pow, div_one] using
    div_tendsto_atTop_leadingCoeff_div_of_degree_eq P (X ^ P.natDegree) hd

end NuttallCumulants
