import Conjectures.BernardiMoralesColors

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open Finset Matrix

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

def properWeight (q : V → R) (s : V → Bool) : R :=
  if s = (fun _ => true) then 0 else weight q s

def properAverage (q : V → R) (F : (V → Bool) → R) : R :=
  ∑ s, properWeight q s * F s

theorem properAverage_eq (q : V → R) (F : (V → Bool) → R) :
    properAverage q F = average q F - (∏ i, q i) * F (fun _ => true) := by
  have he : properAverage q F =
      ∑ s ∈ Finset.univ.erase (fun _ : V => true), weight q s * F s := by
    rw [← Finset.filter_ne']
    simp [properAverage, properWeight, Finset.sum_filter]
  rw [he]
  apply eq_sub_iff_add_eq.mpr
  change (∑ s ∈ Finset.univ.erase (fun _ : V => true), weight q s * F s) +
    (∏ i, q i) * F (fun _ => true) = ∑ s, weight q s * F s
  have hfull : weight q (fun _ : V => true) = ∏ i, q i := by simp [weight, bitWeight]
  rw [← hfull]
  exact Finset.sum_erase_add Finset.univ (fun s => weight q s * F s)
    (Finset.mem_univ (fun _ : V => true))

theorem properAverage_const (q : V → R) (a : R) :
    properAverage q (fun _ => a) = (1 - ∏ i, q i) * a := by
  rw [properAverage_eq, average_const]
  ring

theorem replaceRows_vacancy_full (C : CyclicOrder V) (A : Finset V) (ha : A.Nonempty)
    (B : Matrix V V R) :
    (replaceRows A (fun _ => (0 : R)) (intervalKernel C.pred (fun _ => 1)) B).det = 0 := by
  obtain ⟨i, hi⟩ := ha
  apply Matrix.det_eq_zero_of_row_eq_zero i
  intro j
  simp [replaceRows, hi]

theorem replaceRows_vacancy_binary_det (C : CyclicOrder V) (root : V)
    (A : Finset V) (ha : A.Nonempty) (hr : root ∉ A)
    (B : Matrix V V R) (hB : ∀ j, B root j = 1) (s : V → Bool) :
    (replaceRows A (fun i => 1 - bitValue (s i))
      (intervalKernel C.pred (fun i => bitValue (s i))) B).det =
    (diagonalRows A (fun i => 1 - bitValue (s i))
      (B * cycleMatrix C.pred (fun i => bitValue (s i)))).det := by
  by_cases hs : ∀ i, s i = true
  · have hv : (fun i => (bitValue (s i) : R)) = fun _ => 1 := by
      funext i
      simp [bitValue, hs]
    have hd : (fun i => (1 - bitValue (s i) : R)) = fun _ => 0 := by
      funext i
      simp [bitValue, hs]
    rw [hd, hv]
    rw [replaceRows_vacancy_full C A ha B]
    symm
    apply Matrix.det_eq_zero_of_row_eq_zero root
    intro j
    rw [mul_cycleMatrix]
    simp [diagonalRows, hr, hB]
  · have hp : (∏ i, (bitValue (s i) : R)) = 0 := by simp [binary_product, hs]
    have hW : (cycleMatrix C.pred (fun i => (bitValue (s i) : R))).det = 1 := by
      rw [cycleMatrix_det, hp, sub_zero]
    have hK : intervalKernel C.pred (fun i => (bitValue (s i) : R)) *
        cycleMatrix C.pred (fun i => bitValue (s i)) = 1 := by
      rw [intervalKernel_mul_cycleMatrix, hp, sub_zero, one_smul]
    rw [← replaceRows_mul A _ _ B _ hK, Matrix.det_mul, hW, mul_one]

variable {K : Type*} [Field K]

/-- Proper-subset averaging works even for an empty color fiber: an unused
color contributes its total proper-subset weight. Thus surjectivity is not
needed for the tree identity. -/
theorem properAverage_replaceRows_vacancy (C : CyclicOrder V) (root : V)
    (A : Finset V) (hr : root ∉ A) (B : Matrix V V K) (hB : ∀ j, B root j = 1)
    (q : V → K) (hq : 1 - ∏ i, q i ≠ 0) :
    properAverage q (fun s => (replaceRows A (fun i => 1 - bitValue (s i))
      (intervalKernel C.pred (fun i => bitValue (s i))) B).det) =
      (1 - ∏ i, q i) * (replaceRows A (fun i => 1 - q i) (meanKernel C q) B).det := by
  by_cases ha : A.Nonempty
  · have hfull : (replaceRows A (fun _ => 1 - (bitValue true : K))
        (intervalKernel C.pred (fun _ => bitValue true)) B).det = 0 := by
      simpa [bitValue] using replaceRows_vacancy_full C A ha B
    rw [properAverage_eq, hfull, mul_zero, sub_zero]
    simp_rw [replaceRows_vacancy_binary_det C root A ha hr B hB, mul_cycleMatrix]
    change average q (fun s => (diagonalRows A (fun i => 1 - bitValue (s i))
      (Matrix.of fun i j => B i j - bitValue (s j) * B i (C.pred j))).det) = _
    rw [average_diagonalRows_columns q A (fun _ b => 1 - bitValue b)
      (fun j b i => B i j - bitValue b * B i (C.pred j))]
    have hd (i : V) : (∑ b : Bool, bitWeight (q i) b * (1 - bitValue b)) = 1 - q i := by
      simp [bitWeight, bitValue]
    have hc (i j : V) :
        (∑ b : Bool, bitWeight (q j) b * (B i j - bitValue b * B i (C.pred j))) =
          B i j - q j * B i (C.pred j) := by
      simp [bitWeight, bitValue]
      ring
    simp_rw [hd, hc]
    rw [← mul_cycleMatrix]
    change (diagonalRows A (fun i => 1 - q i) (B * cycleMatrix C.pred q)).det = _
    rw [← replaceRows_mul A _ _ B _ (meanKernel_mul C q hq),
      Matrix.det_mul, cycleMatrix_det, mul_comm]
  · have he : A = ∅ := Finset.not_nonempty_iff_eq_empty.mp ha
    subst A
    have hz (d : V → K) (M : Matrix V V K) : replaceRows ∅ d M B = B := by
      ext i j
      simp [replaceRows]
    simp_rw [hz]
    exact properAverage_const q B.det

def vacancyMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool) : Matrix V V R :=
  colorMatrix root f (fun c => Matrix.of fun i j =>
    (1 - bitValue (s c i)) * intervalKernel C.pred (fun v => bitValue (s c v)) i j)

noncomputable def meanVacancyMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (q : V → K) : Matrix V V K :=
  colorMatrix root f (fun _ => Matrix.of fun i j => (1 - q i) * meanKernel C q i j)

theorem properAverage_vacancyMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (q : V → K) (hq : 1 - ∏ i, q i ≠ 0) :
    (∑ s : Fin r → V → Bool, (∏ c, properWeight q (s c)) *
      (vacancyMatrix C root f s).det) =
      (1 - ∏ i, q i) ^ r * (meanVacancyMatrix C root f q).det := by
  apply (sum_product_replace r (fun _ => properWeight q)
    (fun _ s => Matrix.of fun i j => (1 - bitValue (s i)) *
      intervalKernel C.pred (fun v => bitValue (s v)) i j)
    (fun _ => Matrix.of fun i j => (1 - q i) * meanKernel C q i j)
    (fun _ => 1 - ∏ i, q i) (fun H => (colorMatrix root f H).det) ?_).trans
  · simp [meanVacancyMatrix]
  · intro c H
    simp_rw [colorMatrix_update]
    exact properAverage_replaceRows_vacancy C root (colorFiber root f c)
      (root_not_colorFiber root f c) (colorMatrix root f H)
      (by intro j; simp [colorMatrix]) q hq

theorem meanVacancyMatrix_det (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (q : V → K) (hq : 1 - ∏ i, q i ≠ 0) :
    (1 - ∏ i, q i) * (meanVacancyMatrix C root f q).det = ∏ i, (1 - q i) := by
  have he : meanVacancyMatrix C root f q =
      replaceRows (Finset.univ.erase root) (fun i => 1 - q i) (meanKernel C q)
        (Matrix.of fun _ _ => 1) := by
    ext i j
    by_cases hi : i = root <;> simp [meanVacancyMatrix, colorMatrix, replaceRows, hi]
  rw [he, mul_comm, ← cycleMatrix_det C q, ← Matrix.det_mul,
    replaceRows_mul _ _ _ _ _ (meanKernel_mul C q hq), det_diagonal_except_root,
    mul_cycleMatrix]
  simp only [Matrix.of_apply, mul_one]
  exact Finset.mul_prod_erase Finset.univ (fun i : V => (1 - q i : K)) (Finset.mem_univ root)

theorem weighted_vacancy_identity (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (q : V → K) (hq : 1 - ∏ i, q i ≠ 0) :
    (∑ s : Fin (r+1) → V → Bool, (∏ c, properWeight q (s c)) *
      (vacancyMatrix C root f s).det) =
      (1 - ∏ i, q i) ^ r * ∏ i, (1 - q i) := by
  rw [properAverage_vacancyMatrix C root f q hq, pow_succ, mul_assoc,
    meanVacancyMatrix_det C root f q hq]

end BernardiMorales
