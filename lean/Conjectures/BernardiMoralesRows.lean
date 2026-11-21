import Conjectures.BernardiMoralesCycle

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open Finset Matrix

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

/-- Selected rows of `K`, with selected scalar factors; other rows of `B`. -/
def replaceRows (A : Finset V) (d : V → R) (K B : Matrix V V R) : Matrix V V R :=
  fun i j => if i ∈ A then d i * K i j else B i j

theorem replaceRows_mul (A : Finset V) (d : V → R) (K B W : Matrix V V R)
    (hK : K * W = 1) :
    replaceRows A d K B * W = diagonalRows A d (B * W) := by
  ext i j
  by_cases hi : i ∈ A
  · simp only [Matrix.mul_apply, replaceRows, hi, ite_true, mul_assoc, ← Finset.mul_sum]
    rw [← Matrix.mul_apply, hK]
    by_cases hij : i = j
    · subst j
      simp [diagonalRows, hi]
    · simp [diagonalRows, hi, Matrix.diagonal_apply, Matrix.one_apply, hij]
  · simp [Matrix.mul_apply, replaceRows, diagonalRows, hi]

def markFactor (D : Finset V) (q : V → R) (i : V) : R :=
  if i ∈ D then q i else 1

omit [Fintype V] in
theorem average_markFactor (D : Finset V) (q : V → R) (i : V) :
    (∑ b : Bool, bitWeight (q i) b * (if i ∈ D then bitValue b else 1)) =
      markFactor D q i := by
  by_cases hi : i ∈ D <;> simp [hi, markFactor, bitWeight, bitValue]

omit [DecidableEq V] in
theorem binary_product (s : V → Bool) :
    (∏ i, (bitValue (s i) : R)) = if ∀ i, s i = true then 1 else 0 := by
  by_cases hs : ∀ i, s i = true
  · simp [hs, bitValue]
  · rw [ite_eq_right hs]
    push Not at hs
    obtain ⟨i, hi⟩ := hs
    apply Finset.prod_eq_zero (Finset.mem_univ i)
    simp [bitValue, hi]

/-- The singular full-subset case is included: a selected row repeats the
fixed root row, while the transformed root row is zero. -/
theorem replaceRows_binary_det (C : CyclicOrder V) (root : V)
    (A D : Finset V) (ha : A.Nonempty) (hr : root ∉ A)
    (B : Matrix V V R) (hB : ∀ j, B root j = 1) (s : V → Bool) :
    (replaceRows A (markFactor D (fun i => bitValue (s i)))
      (intervalKernel C.pred (fun i => bitValue (s i))) B).det =
    (diagonalRows A (markFactor D (fun i => bitValue (s i)))
      (B * cycleMatrix C.pred (fun i => bitValue (s i)))).det := by
  by_cases hs : ∀ i, s i = true
  · have hv : (fun i => (bitValue (s i) : R)) = fun _ => 1 := by
      funext i
      simp [bitValue, hs]
    rw [hv, intervalKernel_full]
    obtain ⟨a, ha⟩ := ha
    have har : a ≠ root := by
      intro he
      exact hr (he ▸ ha)
    rw [Matrix.det_zero_of_row_eq har]
    · symm
      apply Matrix.det_eq_zero_of_row_eq_zero root
      intro j
      rw [mul_cycleMatrix]
      simp [diagonalRows, hr, hB]
    · funext j
      simp [replaceRows, ha, hr, hB, markFactor]
  · have hp : (∏ i, (bitValue (s i) : R)) = 0 := by
      simp [binary_product, hs]
    have hW : (cycleMatrix C.pred (fun i => (bitValue (s i) : R))).det = 1 := by
      rw [cycleMatrix_det, hp, sub_zero]
    have hK : intervalKernel C.pred (fun i => (bitValue (s i) : R)) *
        cycleMatrix C.pred (fun i => bitValue (s i)) = 1 := by
      rw [intervalKernel_mul_cycleMatrix, hp, sub_zero, one_smul]
    rw [← replaceRows_mul A _ _ B _ hK, Matrix.det_mul, hW, mul_one]

variable {K : Type*} [Field K]

/-- The geometric interval kernel divided by the cyclic determinant. -/
noncomputable def meanKernel (C : CyclicOrder V) (q : V → K) : Matrix V V K :=
  (1 - ∏ i, q i)⁻¹ • intervalKernel C.pred q

theorem meanKernel_mul (C : CyclicOrder V) (q : V → K)
    (hq : 1 - ∏ i, q i ≠ 0) : meanKernel C q * cycleMatrix C.pred q = 1 := by
  rw [meanKernel, Matrix.smul_mul, intervalKernel_mul_cycleMatrix, smul_smul,
    inv_mul_cancel₀ hq, one_smul]

/-- One color can be averaged even when it supplies several correlated rows.
The nonempty fiber condition handles the singular full-subset contribution. -/
theorem average_replaceRows (C : CyclicOrder V) (root : V)
    (A D : Finset V) (ha : A.Nonempty) (hr : root ∉ A)
    (B : Matrix V V K) (hB : ∀ j, B root j = 1) (q : V → K)
    (hq : 1 - ∏ i, q i ≠ 0) :
    average q (fun s => (replaceRows A (markFactor D (fun i => bitValue (s i)))
      (intervalKernel C.pred (fun i => bitValue (s i))) B).det) =
      (1 - ∏ i, q i) * (replaceRows A (markFactor D q) (meanKernel C q) B).det := by
  simp_rw [replaceRows_binary_det C root A D ha hr B hB, mul_cycleMatrix]
  change average q (fun s => (diagonalRows A (fun i => if i ∈ D then bitValue (s i) else 1)
    (Matrix.of fun i j => B i j - bitValue (s j) * B i (C.pred j))).det) = _
  rw [average_diagonalRows_columns q A (fun i b => if i ∈ D then bitValue b else 1)
    (fun j b i => B i j - bitValue b * B i (C.pred j))]
  simp_rw [average_markFactor]
  have hc (i j : V) :
      (∑ b : Bool, bitWeight (q j) b * (B i j - bitValue b * B i (C.pred j))) =
        B i j - q j * B i (C.pred j) := by
    simp [bitWeight, bitValue]
    ring
  simp_rw [hc]
  change (diagonalRows A (markFactor D q)
    (Matrix.of fun i j => B i j - q j * B i (C.pred j))).det = _
  rw [← mul_cycleMatrix]
  change (diagonalRows A (markFactor D q) (B * cycleMatrix C.pred q)).det = _
  rw [← replaceRows_mul A _ _ B _ (meanKernel_mul C q hq),
    Matrix.det_mul, cycleMatrix_det, mul_comm]

end BernardiMorales
