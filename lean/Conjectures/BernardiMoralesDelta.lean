import Conjectures.BernardiMoralesEvents
import Conjectures.BernardiMoralesFunctionalGraph
import Conjectures.BernardiMoralesVacancy

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open scoped Classical
open Finset Matrix

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A complement successor is outside `S` and all vertices strictly between
`i` and it in the cyclic order belong to `S`. This includes the full cyclic
walk back to `i` when `i` is the only vertex outside `S`. -/
def complementSuccessor (C : CyclicOrder V) (s : V → Bool) (i j : V) : Prop :=
  s j = false ∧ intervalEvent C s i (C.pred j)

theorem complementSuccessor_indicator (C : CyclicOrder V) (s : V → Bool) (i j : V) :
    (if complementSuccessor C s i j then (1 : ℚ) else 0) =
      (1 - bitValue (s j)) * intervalKernel C.pred (fun v => bitValue (s v)) i (C.pred j) := by
  classical
  rw [intervalKernel_binary]
  cases hs : s j <;> by_cases hi : intervalEvent C s i (C.pred j) <;>
    simp [complementSuccessor, hs, hi, intervalEvent, bitValue] at *

theorem complementSuccessor_unique (C : CyclicOrder V) (s : V → Bool)
    (hs : s ≠ fun _ => true) (i : V) : ∃! j, complementSuccessor C s i j := by
  classical
  have hproper : ¬ ∀ v, s v = true := by
    intro he
    exact hs (funext he)
  have hp : (∏ v, (bitValue (s v) : ℚ)) = 0 := by simp [binary_product, hproper]
  have hw : intervalKernel C.pred (fun v => (bitValue (s v) : ℚ)) *
      cycleMatrix C.pred (fun v => bitValue (s v)) = 1 := by
    rw [intervalKernel_mul_cycleMatrix, hp, sub_zero, one_smul]
  have hrow (j : V) :
      intervalKernel C.pred (fun v => (bitValue (s v) : ℚ)) i j -
        bitValue (s j) * intervalKernel C.pred (fun v => bitValue (s v)) i (C.pred j) =
          (1 : Matrix V V ℚ) i j := by
    simpa only [mul_cycleMatrix] using congrArg (fun M : Matrix V V ℚ => M i j) hw
  have hsum : (∑ j, if complementSuccessor C s i j then (1 : ℚ) else 0) = 1 := by
    simp_rw [complementSuccessor_indicator]
    have hsums := congrArg (fun t : V → ℚ => ∑ j, t j) (funext hrow)
    have hperm : (∑ j, intervalKernel C.pred (fun v => (bitValue (s v) : ℚ)) i (C.pred j)) =
        ∑ j, intervalKernel C.pred (fun v => (bitValue (s v) : ℚ)) i j :=
      Equiv.sum_comp C.pred _
    simp only [Finset.sum_sub_distrib] at hsums
    simp only [sub_mul, one_mul, Finset.sum_sub_distrib]
    rw [hperm]
    simpa [Matrix.one_apply] using hsums
  have hcard : ((Finset.univ.filter (complementSuccessor C s i)).card : ℚ) = 1 := by
    simpa only [Finset.sum_boole] using hsum
  have hc : (Finset.univ.filter (complementSuccessor C s i)).card = 1 := Nat.cast_inj.mp hcard
  obtain ⟨j, hj⟩ := Finset.card_eq_one.mp hc
  refine ⟨j, ?_, ?_⟩
  · have hm : j ∈ Finset.univ.filter (complementSuccessor C s i) := by rw [hj]; simp
    exact (Finset.mem_filter.mp hm).2
  · intro z hz
    have hm : z ∈ Finset.univ.filter (complementSuccessor C s i) := by simp [hz]
    rw [hj] at hm
    exact Finset.mem_singleton.mp hm

/-- The source delta rule: selected vertices stay fixed; an unselected vertex
moves to the next unselected vertex in the cyclic order. -/
noncomputable def delta (C : CyclicOrder V) (s : V → Bool) (hs : s ≠ fun _ => true) (i : V) : V :=
  if s i then i else Classical.choose (complementSuccessor_unique C s hs i)

theorem delta_selected (C : CyclicOrder V) (s : V → Bool) (hs : s ≠ fun _ => true)
    (i : V) (hi : s i = true) : delta C s hs i = i := by simp [delta, hi]

theorem delta_unselected (C : CyclicOrder V) (s : V → Bool) (hs : s ≠ fun _ => true)
    (i : V) (hi : s i = false) : complementSuccessor C s i (delta C s hs i) := by
  simp only [delta, hi, Bool.false_eq_true, ite_false]
  exact (Classical.choose_spec (complementSuccessor_unique C s hs i)).1

theorem delta_difference (C : CyclicOrder V) (s : V → Bool) (hs : s ≠ fun _ => true)
    (i j : V) :
    (1 - (bitValue (s i) : ℚ)) *
      (intervalKernel C.pred (fun v => bitValue (s v)) i j -
        intervalKernel C.pred (fun v => bitValue (s v)) i (C.pred j)) =
    (1 : Matrix V V ℚ) i j - if delta C s hs i = j then 1 else 0 := by
  classical
  cases hi : s i
  · have hproper : ¬ ∀ v, s v = true := by intro he; exact hs (funext he)
    have hp : (∏ v, (bitValue (s v) : ℚ)) = 0 := by simp [binary_product, hproper]
    have hw := intervalKernel_mul_cycleMatrix C (fun v => (bitValue (s v) : ℚ))
    rw [hp, sub_zero, one_smul, mul_cycleMatrix] at hw
    have he := congrArg (fun M : Matrix V V ℚ => M i j) hw
    have hsucc : complementSuccessor C s i j ↔ delta C s hs i = j := by
      constructor
      · intro hj
        have hu := (Classical.choose_spec (complementSuccessor_unique C s hs i)).2 j hj
        simpa [delta, hi] using hu.symm
      · intro hj
        rw [← hj]
        exact delta_unselected C s hs i hi
    have hind := complementSuccessor_indicator C s i j
    rw [hsucc] at hind
    have hbi : (bitValue false : ℚ) = 0 := rfl
    rw [hbi, sub_zero, one_mul]
    by_cases hd : delta C s hs i = j
    · simp only [ite_eq_left hd] at hind ⊢
      linear_combination he + hind
    · simp only [ite_eq_right hd] at hind ⊢
      linear_combination he + hind
  · rw [delta_selected C s hs i hi]
    simp [bitValue, hi, Matrix.one_apply]

noncomputable def deltaGraph (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool)
    (hs : ∀ c, s c ≠ fun _ => true) : V → V :=
  fun i => if hi : i = root then root else delta C (s (f ⟨i, hi⟩)) (hs _) i

theorem det_eq_of_root_columns (root : V) (M N : Matrix V V ℚ)
    (hM : ∀ j, M root j = (1 : Matrix V V ℚ) root j)
    (hN : ∀ j, N root j = (1 : Matrix V V ℚ) root j)
    (he : ∀ i j, j ≠ root → M i j = N i j) : M.det = N.det := by
  have hf (B : Matrix V V ℚ) (hB : ∀ j, B root j = (1 : Matrix V V ℚ) root j) :
      fixedRows {root} B = B := by
    ext i j
    by_cases hi : i = root
    · subst i; simp [fixedRows, hB]
    · simp [fixedRows, hi]
  have hc : fixedRowsCleared {root} M = fixedRowsCleared {root} N := by
    ext i j
    by_cases hj : j = root
    · simp [fixedRowsCleared, hj]
    · by_cases hi : i = root <;> simp [fixedRowsCleared, hj, hi, he i j hj]
  rw [← hf M hM, ← det_fixedRowsCleared, hc, det_fixedRowsCleared, hf N hN]

/-- The determinant of the vacancy interval matrix is exactly the rooted
functional-graph determinant of the literal delta successor rule. -/
theorem vacancyMatrix_det_functional (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool)
    (hs : ∀ c, s c ≠ fun _ => true) :
    (vacancyMatrix C root f s : Matrix V V ℚ).det =
      (functionalLaplacian (deltaGraph C root f s hs) root).det := by
  let q : V → ℚ := fun j => if j = root then 0 else 1
  let B : Matrix V V ℚ := cycleMatrix C.pred q
  have hB : B.det = 1 := by
    rw [cycleMatrix_det]
    have hp : (∏ j, q j) = 0 := Finset.prod_eq_zero (Finset.mem_univ root) (by simp [q])
    rw [hp, sub_zero]
  rw [← mul_one (vacancyMatrix C root f s : Matrix V V ℚ).det, ← hB, ← Matrix.det_mul]
  apply det_eq_of_root_columns root
  · intro j
    rw [mul_cycleMatrix]
    by_cases hj : j = root
    · subst j; simp [vacancyMatrix, colorMatrix, q, Matrix.one_apply]
    · simp [vacancyMatrix, colorMatrix, q, hj, Matrix.one_apply, Ne.symm hj]
  · intro j
    simp [functionalLaplacian]
  · intro i j hj
    rw [mul_cycleMatrix]
    by_cases hi : i = root
    · subst i
      simp [vacancyMatrix, colorMatrix, functionalLaplacian, q, hj, Matrix.one_apply, Ne.symm hj]
    · simp only [functionalLaplacian, hi, ite_false, deltaGraph, dite_false]
      simpa [vacancyMatrix, colorMatrix, hi, q, hj, mul_sub] using
        delta_difference C (s (f ⟨i, hi⟩)) (hs _) i j

theorem vacancyMatrix_tree_indicator (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (s : Fin r → V → Bool)
    (hs : ∀ c, s c ≠ fun _ => true) :
    (vacancyMatrix C root f s : Matrix V V ℚ).det =
      if isRootedTree (deltaGraph C root f s hs) root then 1 else 0 := by
  rw [vacancyMatrix_det_functional C root f s hs, functionalLaplacian_det]

end BernardiMorales
