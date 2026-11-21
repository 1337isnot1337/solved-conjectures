module

public import Conjectures.VishnyakovaTotalPositivityMinors
public import Conjectures.VishnyakovaTotalPositivityToeplitz
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.RingTheory.PowerSeries.Inverse
public import Mathlib.Algebra.BigOperators.Fin

/-!
# Positivity of the signed reciprocal series

The proof uses finite Toeplitz matrices. A Laplace expansion proves the sign
of the relevant inverse minor directly; it does not assume the classification
of totally positive generating functions.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Matrix
open scoped BigOperators

set_option backward.isDefEq.respectTransparency false

/-- Append signed coordinate rows to a rectangular matrix. The signs are the
cofactor signs for the appended row and its selected column. -/
noncomputable def signedUnitExtension {m k : ℕ}
    (A : Matrix (Fin m) (Fin (m + k)) ℝ) (r : Fin k → Fin (m + k)) :
    Matrix (Fin (m + k)) (Fin (m + k)) ℝ :=
  Matrix.of fun i j =>
    Fin.append (fun l => A l j)
      (fun l => if j = r l then (-1 : ℝ) ^ (m + l.val + (r l).val) else 0) i

/-- All full-row ordered minors of the original rectangle are enough to
control the determinant after appending signed coordinate rows. -/
theorem signedUnitExtension_det_nonneg (m k : ℕ)
    (A : Matrix (Fin m) (Fin (m + k)) ℝ) (r : Fin k → Fin (m + k))
    (hr : StrictMono r)
    (hA : ∀ c : Fin m → Fin (m + k), StrictMono c →
      0 ≤ Matrix.det (fun i j : Fin m => A i (c j))) :
    0 ≤ (signedUnitExtension A r).det := by
  induction k with
  | zero =>
    have heq : signedUnitExtension A r = A := by
      ext i j
      have hi : i = Fin.castAdd 0 i := rfl
      conv_lhs => rw [hi]
      simp only [signedUnitExtension, Matrix.of_apply, Fin.append_left]
    rw [heq]
    exact hA id strictMono_id
  | succ k ih =>
    let p : Fin (m + k + 1) := r (Fin.last k)
    let r' : Fin k → Fin (m + k) := fun i =>
      ⟨(r i.castSucc).val, lt_of_lt_of_le (hr (Fin.castSucc_lt_last i)) p.is_le⟩
    let A' : Matrix (Fin m) (Fin (m + k)) ℝ := Matrix.of fun i j => A i (p.succAbove j)
    have hr' : StrictMono r' := fun _ _ hij => hr hij
    have hA' : ∀ c : Fin m → Fin (m + k), StrictMono c →
        0 ≤ Matrix.det (fun i j : Fin m => A' i (c j)) := by
      intro c hc
      exact hA (fun j => p.succAbove (c j)) ((Fin.strictMono_succAbove p).comp hc)
    have hri (i : Fin k) : p.succAbove (r' i) = r i.castSucc := by
      rw [Fin.succAbove_of_castSucc_lt]
      · apply Fin.ext
        rfl
      · exact hr (Fin.castSucc_lt_last i)
    let B := signedUnitExtension A r
    have hlast (j : Fin (m + k + 1)) :
        B (Fin.last (m + k)) j =
          if j = p then (-1 : ℝ) ^ (m + k + p.val) else 0 := by
      have hl : Fin.last (m + k) = Fin.natAdd m (Fin.last k) := by
        apply Fin.ext
        rfl
      simp only [B, signedUnitExtension, Matrix.of_apply, hl, Fin.append_right, Fin.val_last, p]
    have hminor : B.submatrix Fin.castSucc p.succAbove = signedUnitExtension A' r' := by
      ext i j
      induction i using Fin.addCases with
      | left i =>
        have heq : (Fin.castAdd k i).castSucc = Fin.castAdd (k + 1) i := by
          apply Fin.ext
          rfl
        simp only [Matrix.submatrix_apply, heq, B, signedUnitExtension, Matrix.of_apply,
          Fin.append_left, A', Matrix.of_apply]
      | right i =>
        have heq : (Fin.natAdd m i).castSucc = Fin.natAdd m i.castSucc := by
          apply Fin.ext
          rfl
        simp only [Matrix.submatrix_apply, heq, B, signedUnitExtension, Matrix.of_apply,
          Fin.append_right, Fin.val_castSucc]
        have hc : p.succAbove j = r i.castSucc ↔ j = r' i := by
          rw [← hri i, Fin.succAbove_right_inj]
        simp only [hc]
        rfl
    have hdet : B.det = (B.submatrix Fin.castSucc p.succAbove).det := by
      calc
        B.det = ∑ j : Fin (m + k + 1),
            (-1 : ℝ) ^ (m + k + j.val) * B (Fin.last (m + k)) j *
              (B.submatrix (Fin.last (m + k)).succAbove j.succAbove).det :=
          Matrix.det_succ_row B (Fin.last (m + k))
        _ = (-1 : ℝ) ^ (m + k + p.val) * B (Fin.last (m + k)) p *
              (B.submatrix (Fin.last (m + k)).succAbove p.succAbove).det := by
          apply Finset.sum_eq_single p
          · intro j _ hj
            rw [hlast]
            simp only [ite_eq_right hj, mul_zero, zero_mul]
          · simp
        _ = (B.submatrix (Fin.last (m + k)).succAbove p.succAbove).det := by
          rw [hlast]
          simp [← mul_pow]
        _ = _ := congrArg (fun f : Fin (m + k) → Fin (m + k + 1) =>
          (B.submatrix f p.succAbove).det) Fin.succAbove_last
    rw [show signedUnitExtension A r = B from rfl, hdet, hminor]
    exact ih A' r' hr' hA'

theorem checkerboard_det {k : ℕ} (M : Matrix (Fin k) (Fin k) ℝ) :
    Matrix.det (Matrix.of fun i j : Fin k =>
      (-1 : ℝ) ^ i.val * ((-1 : ℝ) ^ j.val * M i j)) = M.det := by
  have hpow (i : Fin k) : (-1 : ℝ) ^ i.val * (-1 : ℝ) ^ i.val = 1 := by
    rw [← mul_pow]
    simp
  calc
    _ = (∏ i : Fin k, (-1 : ℝ) ^ i.val) *
        Matrix.det (Matrix.of fun i j : Fin k => (-1 : ℝ) ^ j.val * M i j) :=
      Matrix.det_mul_column (fun i : Fin k => (-1 : ℝ) ^ i.val) _
    _ = (∏ i : Fin k, (-1 : ℝ) ^ i.val) *
        ((∏ i : Fin k, (-1 : ℝ) ^ i.val) * M.det) := by
      exact congrArg (fun x => (∏ i : Fin k, (-1 : ℝ) ^ i.val) * x)
        (Matrix.det_mul_row (fun i : Fin k => (-1 : ℝ) ^ i.val) M)
    _ = M.det := by
      rw [← mul_assoc, ← Finset.prod_mul_distrib]
      simp only [hpow, Finset.prod_const_one, one_mul]

/-- The signed suffix minors of a right inverse are nonnegative. Only a
nonnegative inverse determinant is needed, so this statement also records
exactly what is used for triangular Toeplitz matrices. -/
theorem signed_inverse_suffix_minor_nonneg (m k : ℕ)
    (A C : Matrix (Fin (m + k)) (Fin (m + k)) ℝ)
    (hA : A.IsTotallyNonneg) (hAC : A * C = 1) (hC : 0 ≤ C.det)
    (r : Fin k → Fin (m + k)) (hr : StrictMono r) :
    0 ≤ Matrix.det (fun i j : Fin k => (-1 : ℝ) ^ ((r i).val + m + j.val) *
      C (r i) (Fin.natAdd m j)) := by
  let A' : Matrix (Fin m) (Fin (m + k)) ℝ := Matrix.of fun i j => A (Fin.castAdd k i) j
  let B := signedUnitExtension A' r
  let E : Matrix (Fin k) (Fin k) ℝ := Matrix.of fun i j =>
    (-1 : ℝ) ^ (m + i.val + (r i).val) * C (r i) (Fin.natAdd m j)
  let F : Matrix (Fin k) (Fin m) ℝ := Matrix.of fun i j =>
    (-1 : ℝ) ^ (m + i.val + (r i).val) * C (r i) (Fin.castAdd k j)
  have hB : 0 ≤ B.det := by
    apply signedUnitExtension_det_nonneg m k A' r hr
    intro c hc
    exact hA (rows := Fin.castAdd k) (cols := c) (fun _ _ h => h) hc
  have htop (i : Fin m) (j : Fin (m + k)) :
      (B * C) (Fin.castAdd k i) j = (1 : Matrix (Fin (m + k)) (Fin (m + k)) ℝ)
        (Fin.castAdd k i) j := by
    have h : (B * C) (Fin.castAdd k i) j = (A * C) (Fin.castAdd k i) j := by
      simp only [Matrix.mul_apply, B, signedUnitExtension, Matrix.of_apply, Fin.append_left, A', Matrix.of_apply]
    rw [h, hAC]
  have hbot (i : Fin k) (j : Fin (m + k)) :
      (B * C) (Fin.natAdd m i) j =
        (-1 : ℝ) ^ (m + i.val + (r i).val) * C (r i) j := by
    rw [Matrix.mul_apply]
    simp only [B, signedUnitExtension, Matrix.of_apply, Fin.append_right, ite_mul, zero_mul]
    simp
  let e : Fin m ⊕ Fin k ≃ Fin (m + k) := finSumFinEquiv
  have hblock : (B * C).submatrix e e = Matrix.fromBlocks 1 0 F E := by
    ext i j
    rcases i with i | i <;> rcases j with j | j
    · simp only [Matrix.submatrix_apply, e, finSumFinEquiv_apply_left,
        Matrix.fromBlocks_apply₁₁, htop, Matrix.one_apply, Fin.castAdd_inj]
    · have hne : Fin.castAdd k i ≠ Fin.natAdd m j := by
        intro h
        have hv := congrArg Fin.val h
        simp only [Fin.val_castAdd, Fin.val_natAdd] at hv
        omega
      simp only [Matrix.submatrix_apply, e, finSumFinEquiv_apply_left,
        finSumFinEquiv_apply_right, Matrix.fromBlocks_apply₁₂, htop,
        Matrix.one_apply, ite_eq_right hne, Matrix.zero_apply]
    · simp only [Matrix.submatrix_apply, e, finSumFinEquiv_apply_left,
        finSumFinEquiv_apply_right, Matrix.fromBlocks_apply₂₁, hbot, F, Matrix.of_apply]
    · simp only [Matrix.submatrix_apply, e, finSumFinEquiv_apply_right,
        Matrix.fromBlocks_apply₂₂, hbot, E, Matrix.of_apply]
  have hE : 0 ≤ E.det := by
    have hp : 0 ≤ (B * C).det := by
      rw [Matrix.det_mul]
      exact mul_nonneg hB hC
    rw [← Matrix.det_submatrix_equiv_self e (B * C), hblock,
      Matrix.det_fromBlocks_zero₁₂, Matrix.det_one, one_mul] at hp
    exact hp
  let D : Matrix (Fin k) (Fin k) ℝ := Matrix.of fun i j =>
    (-1 : ℝ) ^ ((r i).val + m + j.val) * C (r i) (Fin.natAdd m j)
  have heq : E = Matrix.of fun i j =>
      (-1 : ℝ) ^ i.val * ((-1 : ℝ) ^ j.val * D i j) := by
    ext i j
    have hj : (-1 : ℝ) ^ j.val * (-1 : ℝ) ^ j.val = 1 := by
      rw [← mul_pow]
      simp
    simp only [E, D, Matrix.of_apply, pow_add]
    calc
      _ = ((-1 : ℝ) ^ j.val * (-1 : ℝ) ^ j.val) *
          ((-1 : ℝ) ^ m * (-1 : ℝ) ^ i.val * (-1 : ℝ) ^ (r i).val *
            C (r i) (Fin.natAdd m j)) := by rw [hj, one_mul]
      _ = _ := by ring
  rw [heq, checkerboard_det] at hE
  exact hE

theorem signed_reciprocal_inverse (a b : ℕ → ℝ)
    (hinv : PowerSeries.mk (fun n => (-1 : ℝ) ^ n * a n) * PowerSeries.mk b = 1) :
    PowerSeries.mk a * PowerSeries.mk (fun n => (-1 : ℝ) ^ n * b n) = 1 := by
  have ha : PowerSeries.rescale (-1 : ℝ)
      (PowerSeries.mk (fun n => (-1 : ℝ) ^ n * a n)) = PowerSeries.mk a := by
    rw [← PowerSeries.rescale_mk, PowerSeries.rescale_rescale]
    simp
  have h := congrArg (PowerSeries.rescale (-1 : ℝ)) hinv
  rw [map_mul, map_one, ha, PowerSeries.rescale_mk] at h
  exact h

theorem signed_reciprocal_constant_pos (a b : ℕ → ℝ) (ha : 0 < a 0)
    (hinv : PowerSeries.mk (fun n => (-1 : ℝ) ^ n * a n) * PowerSeries.mk b = 1) :
    0 < b 0 := by
  have hab : a 0 * b 0 = 1 := by
    simpa using congrArg PowerSeries.constantCoeff hinv
  by_contra hb
  have hnonpos := mul_nonpos_of_nonneg_of_nonpos ha.le (le_of_not_gt hb)
  linarith

/-- The signed reciprocal of a totally nonnegative Toeplitz sequence has
nonnegative consecutive-column minors. The series inverse is exact and no
analytic classification theorem is used. -/
theorem signed_reciprocal_consecutiveMinors (a b : ℕ → ℝ)
    (ha : (toeplitz a).IsTotallyNonneg) (ha0 : 0 < a 0)
    (hinv : PowerSeries.mk (fun n => (-1 : ℝ) ^ n * a n) * PowerSeries.mk b = 1) :
    ConsecutiveColumnMinorsNonneg b := by
  classical
  intro k rows start hrows
  by_cases hbound : ∀ i, rows i < start + k
  · let r : Fin k → Fin (start + k) := fun i => ⟨rows i, hbound i⟩
    have hr : StrictMono r := fun _ _ h => hrows h
    let A := finiteToeplitz a (start + k)
    let C := finiteToeplitz (fun n => (-1 : ℝ) ^ n * b n) (start + k)
    have hA : A.IsTotallyNonneg := finiteToeplitz_totallyNonneg ha (start + k)
    have hAC : A * C = 1 := by
      have hi := signed_reciprocal_inverse a b hinv
      simpa only [A, C, hi, finiteToeplitz_one, PowerSeries.coeff_mk] using
        (finiteToeplitz_mul (PowerSeries.mk a)
          (PowerSeries.mk (fun n => (-1 : ℝ) ^ n * b n)) (start + k)).symm
    have hC : 0 ≤ C.det := by
      have hb := signed_reciprocal_constant_pos a b ha0 hinv
      simp only [C, finiteToeplitz_det, pow_zero, one_mul]
      exact pow_nonneg hb.le _
    have hm := signed_inverse_suffix_minor_nonneg start k A C hA hAC hC r hr
    have heq :
        Matrix.of (fun i j : Fin k => (-1 : ℝ) ^ ((r i).val + start + j.val) *
          C (r i) (Fin.natAdd start j)) =
        Matrix.of (fun i j : Fin k => toeplitz b (rows i) (start + j.val)) := by
      ext i j
      simpa only [C, finiteToeplitz, Matrix.of_apply, Matrix.submatrix_apply,
        Fin.val_natAdd, r, Nat.add_assoc] using
        finiteToeplitz_checkerboard b (start + k) (r i) (Fin.natAdd start j)
    change 0 ≤ (Matrix.of (fun i j : Fin k =>
      (-1 : ℝ) ^ ((r i).val + start + j.val) * C (r i) (Fin.natAdd start j))).det at hm
    rw [heq] at hm
    exact hm
  · push Not at hbound
    obtain ⟨i, hi⟩ := hbound
    have hz : Matrix.det (fun i j : Fin k => toeplitz b (rows i) (start + j.val)) = 0 := by
      apply Matrix.det_eq_zero_of_row_eq_zero i
      intro j
      have hlt := j.isLt
      exact ite_eq_right (by omega : ¬ rows i ≤ start + j.val)
    simpa only [hz] using (le_refl (0 : ℝ))

end VishnyakovaTotalPositivity
