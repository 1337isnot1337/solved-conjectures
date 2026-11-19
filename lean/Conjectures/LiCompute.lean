import Conjectures.LiDualFull
import Conjectures.LiEliminate
import Conjectures.LiBasic

/-!
# Numerical certificate for the Li coefficient, over the dual numbers

Each step of the leaf-elimination chain records only the updated weight of the
parent vertex.  The final root value is therefore a concrete dual number and
the kernel arithmetic is small.  The result is the `t`-coefficient `29`.
-/

open SimpleGraph
open scoped BigOperators

namespace LiCompute

abbrev R := Dual

/-- The three truncated weights. -/
def wR : Fin 3 → Dual :=
  ![Dual.mk 1 (1/2), Dual.mk (-1) (1/2), Dual.mk 0 (-1)]

def W0 : Fin 31 → Fin 3 → Dual := fun _ => wR

def T1 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-1), Dual.mk (-1) 1, Dual.mk 0 0]

def W1 : Fin 31 → Fin 3 → Dual := fun v i => if v = 29 then T1 i else W0 v i

def T2 : Fin 3 → Dual :=
  ![Dual.mk (-1) (1/2), Dual.mk 1 (1/2), Dual.mk 0 2]

def W2 : Fin 31 → Fin 3 → Dual := fun v i => if v = 28 then T2 i else W1 v i

def T3 : Fin 3 → Dual :=
  ![Dual.mk 1 3, Dual.mk 1 (-3), Dual.mk 0 0]

def W3 : Fin 31 → Fin 3 → Dual := fun v i => if v = 27 then T3 i else W2 v i

def T4 : Fin 3 → Dual :=
  ![Dual.mk 1 (-5/2), Dual.mk (-1) (-5/2), Dual.mk 0 (-2)]

def W4 : Fin 31 → Fin 3 → Dual := fun v i => if v = 26 then T4 i else W3 v i

def T5 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-5), Dual.mk (-1) 5, Dual.mk 0 0]

def W5 : Fin 31 → Fin 3 → Dual := fun v i => if v = 25 then T5 i else W4 v i

def T6 : Fin 3 → Dual :=
  ![Dual.mk (-1) (9/2), Dual.mk 1 (9/2), Dual.mk 0 2]

def W6 : Fin 31 → Fin 3 → Dual := fun v i => if v = 24 then T6 i else W5 v i

def T7 : Fin 3 → Dual :=
  ![Dual.mk 1 7, Dual.mk 1 (-7), Dual.mk 0 0]

def W7 : Fin 31 → Fin 3 → Dual := fun v i => if v = 23 then T7 i else W6 v i

def T8 : Fin 3 → Dual :=
  ![Dual.mk 1 (-13/2), Dual.mk (-1) (-13/2), Dual.mk 0 (-2)]

def W8 : Fin 31 → Fin 3 → Dual := fun v i => if v = 22 then T8 i else W7 v i

def T9 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-9), Dual.mk (-1) 9, Dual.mk 0 0]

def W9 : Fin 31 → Fin 3 → Dual := fun v i => if v = 21 then T9 i else W8 v i

def T10 : Fin 3 → Dual :=
  ![Dual.mk (-1) (17/2), Dual.mk 1 (17/2), Dual.mk 0 2]

def W10 : Fin 31 → Fin 3 → Dual := fun v i => if v = 20 then T10 i else W9 v i

def T11 : Fin 3 → Dual :=
  ![Dual.mk 1 11, Dual.mk 1 (-11), Dual.mk 0 0]

def W11 : Fin 31 → Fin 3 → Dual := fun v i => if v = 19 then T11 i else W10 v i

def T12 : Fin 3 → Dual :=
  ![Dual.mk 1 (-21/2), Dual.mk (-1) (-21/2), Dual.mk 0 (-2)]

def W12 : Fin 31 → Fin 3 → Dual := fun v i => if v = 18 then T12 i else W11 v i

def T13 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-13), Dual.mk (-1) 13, Dual.mk 0 0]

def W13 : Fin 31 → Fin 3 → Dual := fun v i => if v = 17 then T13 i else W12 v i

def T14 : Fin 3 → Dual :=
  ![Dual.mk (-1) (25/2), Dual.mk 1 (25/2), Dual.mk 0 2]

def W14 : Fin 31 → Fin 3 → Dual := fun v i => if v = 16 then T14 i else W13 v i

def T15 : Fin 3 → Dual :=
  ![Dual.mk 1 15, Dual.mk 1 (-15), Dual.mk 0 0]

def W15 : Fin 31 → Fin 3 → Dual := fun v i => if v = 0 then T15 i else W14 v i

def T16 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-1), Dual.mk (-1) 1, Dual.mk 0 0]

def W16 : Fin 31 → Fin 3 → Dual := fun v i => if v = 13 then T16 i else W15 v i

def T17 : Fin 3 → Dual :=
  ![Dual.mk (-1) (1/2), Dual.mk 1 (1/2), Dual.mk 0 2]

def W17 : Fin 31 → Fin 3 → Dual := fun v i => if v = 12 then T17 i else W16 v i

def T18 : Fin 3 → Dual :=
  ![Dual.mk 1 3, Dual.mk 1 (-3), Dual.mk 0 0]

def W18 : Fin 31 → Fin 3 → Dual := fun v i => if v = 11 then T18 i else W17 v i

def T19 : Fin 3 → Dual :=
  ![Dual.mk 1 (-5/2), Dual.mk (-1) (-5/2), Dual.mk 0 (-2)]

def W19 : Fin 31 → Fin 3 → Dual := fun v i => if v = 10 then T19 i else W18 v i

def T20 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-5), Dual.mk (-1) 5, Dual.mk 0 0]

def W20 : Fin 31 → Fin 3 → Dual := fun v i => if v = 9 then T20 i else W19 v i

def T21 : Fin 3 → Dual :=
  ![Dual.mk (-1) (9/2), Dual.mk 1 (9/2), Dual.mk 0 2]

def W21 : Fin 31 → Fin 3 → Dual := fun v i => if v = 8 then T21 i else W20 v i

def T22 : Fin 3 → Dual :=
  ![Dual.mk 1 (-4), Dual.mk 1 4, Dual.mk 0 0]

def W22 : Fin 31 → Fin 3 → Dual := fun v i => if v = 8 then T22 i else W21 v i

def T23 : Fin 3 → Dual :=
  ![Dual.mk 1 (9/2), Dual.mk (-1) (9/2), Dual.mk 0 (-2)]

def W23 : Fin 31 → Fin 3 → Dual := fun v i => if v = 7 then T23 i else W22 v i

def T24 : Fin 3 → Dual :=
  ![Dual.mk (-1) 2, Dual.mk (-1) (-2), Dual.mk 0 0]

def W24 : Fin 31 → Fin 3 → Dual := fun v i => if v = 6 then T24 i else W23 v i

def T25 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-5/2), Dual.mk 1 (-5/2), Dual.mk 0 2]

def W25 : Fin 31 → Fin 3 → Dual := fun v i => if v = 5 then T25 i else W24 v i

def T26 : Fin 3 → Dual :=
  ![Dual.mk 1 0, Dual.mk 1 0, Dual.mk 0 0]

def W26 : Fin 31 → Fin 3 → Dual := fun v i => if v = 4 then T26 i else W25 v i

def T27 : Fin 3 → Dual :=
  ![Dual.mk 1 15, Dual.mk 1 (-15), Dual.mk 0 0]

def W27 : Fin 31 → Fin 3 → Dual := fun v i => if v = 0 then T27 i else W26 v i

def T28 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-1), Dual.mk (-1) 1, Dual.mk 0 0]

def W28 : Fin 31 → Fin 3 → Dual := fun v i => if v = 2 then T28 i else W27 v i

def T29 : Fin 3 → Dual :=
  ![Dual.mk (-1) (-14), Dual.mk (-1) 14, Dual.mk 0 0]

def W29 : Fin 31 → Fin 3 → Dual := fun v i => if v = 0 then T29 i else W28 v i

def T30 : Fin 3 → Dual :=
  ![Dual.mk 1 (29/2), Dual.mk (-1) (29/2), Dual.mk 0 0]

def W30 : Fin 31 → Fin 3 → Dual := fun v i => if v = 0 then T30 i else W29 v i

lemma update1 :
    Function.update W0 29 (fun i => W0 29 i * ((∑ j : Fin 3, W0 30 j) - W0 30 i)) = W1 := by
  funext v i
  by_cases hv : v = 29
  · subst hv
    simp only [Function.update_self, W1]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W0 29 0 * ((∑ j : Fin 3, W0 30 j) - W0 30 0) = Dual.mk (-1) (-1)
      simp only [W0, wR, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W0 29 1 * ((∑ j : Fin 3, W0 30 j) - W0 30 1) = Dual.mk (-1) 1
      simp only [W0, wR, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W0 29 2 * ((∑ j : Fin 3, W0 30 j) - W0 30 2) = Dual.mk 0 0
      simp only [W0, wR, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W1, ite_eq_right hv]

lemma update2 :
    Function.update W1 28 (fun i => W1 28 i * ((∑ j : Fin 3, W1 29 j) - W1 29 i)) = W2 := by
  funext v i
  by_cases hv : v = 28
  · subst hv
    simp only [Function.update_self, W2]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W1 28 0 * ((∑ j : Fin 3, W1 29 j) - W1 29 0) = Dual.mk (-1) (1/2)
      simp only [W0, W1, wR, T1, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W1 28 1 * ((∑ j : Fin 3, W1 29 j) - W1 29 1) = Dual.mk 1 (1/2)
      simp only [W0, W1, wR, T1, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W1 28 2 * ((∑ j : Fin 3, W1 29 j) - W1 29 2) = Dual.mk 0 2
      simp only [W0, W1, wR, T1, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W2, ite_eq_right hv]

lemma update3 :
    Function.update W2 27 (fun i => W2 27 i * ((∑ j : Fin 3, W2 28 j) - W2 28 i)) = W3 := by
  funext v i
  by_cases hv : v = 27
  · subst hv
    simp only [Function.update_self, W3]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W2 27 0 * ((∑ j : Fin 3, W2 28 j) - W2 28 0) = Dual.mk 1 3
      simp only [W0, W1, W2, wR, T1, T2, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W2 27 1 * ((∑ j : Fin 3, W2 28 j) - W2 28 1) = Dual.mk 1 (-3)
      simp only [W0, W1, W2, wR, T1, T2, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W2 27 2 * ((∑ j : Fin 3, W2 28 j) - W2 28 2) = Dual.mk 0 0
      simp only [W0, W1, W2, wR, T1, T2, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W3, ite_eq_right hv]

lemma update4 :
    Function.update W3 26 (fun i => W3 26 i * ((∑ j : Fin 3, W3 27 j) - W3 27 i)) = W4 := by
  funext v i
  by_cases hv : v = 26
  · subst hv
    simp only [Function.update_self, W4]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W3 26 0 * ((∑ j : Fin 3, W3 27 j) - W3 27 0) = Dual.mk 1 (-5/2)
      simp only [W0, W1, W2, W3, wR, T1, T2, T3, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W3 26 1 * ((∑ j : Fin 3, W3 27 j) - W3 27 1) = Dual.mk (-1) (-5/2)
      simp only [W0, W1, W2, W3, wR, T1, T2, T3, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W3 26 2 * ((∑ j : Fin 3, W3 27 j) - W3 27 2) = Dual.mk 0 (-2)
      simp only [W0, W1, W2, W3, wR, T1, T2, T3, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W4, ite_eq_right hv]

lemma update5 :
    Function.update W4 25 (fun i => W4 25 i * ((∑ j : Fin 3, W4 26 j) - W4 26 i)) = W5 := by
  funext v i
  by_cases hv : v = 25
  · subst hv
    simp only [Function.update_self, W5]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W4 25 0 * ((∑ j : Fin 3, W4 26 j) - W4 26 0) = Dual.mk (-1) (-5)
      simp only [W0, W1, W2, W3, W4, wR, T1, T2, T3, T4, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W4 25 1 * ((∑ j : Fin 3, W4 26 j) - W4 26 1) = Dual.mk (-1) 5
      simp only [W0, W1, W2, W3, W4, wR, T1, T2, T3, T4, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W4 25 2 * ((∑ j : Fin 3, W4 26 j) - W4 26 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, wR, T1, T2, T3, T4, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W5, ite_eq_right hv]

lemma update6 :
    Function.update W5 24 (fun i => W5 24 i * ((∑ j : Fin 3, W5 25 j) - W5 25 i)) = W6 := by
  funext v i
  by_cases hv : v = 24
  · subst hv
    simp only [Function.update_self, W6]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W5 24 0 * ((∑ j : Fin 3, W5 25 j) - W5 25 0) = Dual.mk (-1) (9/2)
      simp only [W0, W1, W2, W3, W4, W5, wR, T1, T2, T3, T4, T5, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W5 24 1 * ((∑ j : Fin 3, W5 25 j) - W5 25 1) = Dual.mk 1 (9/2)
      simp only [W0, W1, W2, W3, W4, W5, wR, T1, T2, T3, T4, T5, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W5 24 2 * ((∑ j : Fin 3, W5 25 j) - W5 25 2) = Dual.mk 0 2
      simp only [W0, W1, W2, W3, W4, W5, wR, T1, T2, T3, T4, T5, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W6, ite_eq_right hv]

lemma update7 :
    Function.update W6 23 (fun i => W6 23 i * ((∑ j : Fin 3, W6 24 j) - W6 24 i)) = W7 := by
  funext v i
  by_cases hv : v = 23
  · subst hv
    simp only [Function.update_self, W7]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W6 23 0 * ((∑ j : Fin 3, W6 24 j) - W6 24 0) = Dual.mk 1 7
      simp only [W0, W1, W2, W3, W4, W5, W6, wR, T1, T2, T3, T4, T5, T6, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W6 23 1 * ((∑ j : Fin 3, W6 24 j) - W6 24 1) = Dual.mk 1 (-7)
      simp only [W0, W1, W2, W3, W4, W5, W6, wR, T1, T2, T3, T4, T5, T6, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W6 23 2 * ((∑ j : Fin 3, W6 24 j) - W6 24 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, wR, T1, T2, T3, T4, T5, T6, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W7, ite_eq_right hv]

lemma update8 :
    Function.update W7 22 (fun i => W7 22 i * ((∑ j : Fin 3, W7 23 j) - W7 23 i)) = W8 := by
  funext v i
  by_cases hv : v = 22
  · subst hv
    simp only [Function.update_self, W8]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W7 22 0 * ((∑ j : Fin 3, W7 23 j) - W7 23 0) = Dual.mk 1 (-13/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, wR, T1, T2, T3, T4, T5, T6, T7, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W7 22 1 * ((∑ j : Fin 3, W7 23 j) - W7 23 1) = Dual.mk (-1) (-13/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, wR, T1, T2, T3, T4, T5, T6, T7, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W7 22 2 * ((∑ j : Fin 3, W7 23 j) - W7 23 2) = Dual.mk 0 (-2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, wR, T1, T2, T3, T4, T5, T6, T7, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W8, ite_eq_right hv]

lemma update9 :
    Function.update W8 21 (fun i => W8 21 i * ((∑ j : Fin 3, W8 22 j) - W8 22 i)) = W9 := by
  funext v i
  by_cases hv : v = 21
  · subst hv
    simp only [Function.update_self, W9]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W8 21 0 * ((∑ j : Fin 3, W8 22 j) - W8 22 0) = Dual.mk (-1) (-9)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, wR, T1, T2, T3, T4, T5, T6, T7, T8, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W8 21 1 * ((∑ j : Fin 3, W8 22 j) - W8 22 1) = Dual.mk (-1) 9
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, wR, T1, T2, T3, T4, T5, T6, T7, T8, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W8 21 2 * ((∑ j : Fin 3, W8 22 j) - W8 22 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, wR, T1, T2, T3, T4, T5, T6, T7, T8, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W9, ite_eq_right hv]

lemma update10 :
    Function.update W9 20 (fun i => W9 20 i * ((∑ j : Fin 3, W9 21 j) - W9 21 i)) = W10 := by
  funext v i
  by_cases hv : v = 20
  · subst hv
    simp only [Function.update_self, W10]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W9 20 0 * ((∑ j : Fin 3, W9 21 j) - W9 21 0) = Dual.mk (-1) (17/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W9 20 1 * ((∑ j : Fin 3, W9 21 j) - W9 21 1) = Dual.mk 1 (17/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W9 20 2 * ((∑ j : Fin 3, W9 21 j) - W9 21 2) = Dual.mk 0 2
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W10, ite_eq_right hv]

lemma update11 :
    Function.update W10 19 (fun i => W10 19 i * ((∑ j : Fin 3, W10 20 j) - W10 20 i)) = W11 := by
  funext v i
  by_cases hv : v = 19
  · subst hv
    simp only [Function.update_self, W11]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W10 19 0 * ((∑ j : Fin 3, W10 20 j) - W10 20 0) = Dual.mk 1 11
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W10 19 1 * ((∑ j : Fin 3, W10 20 j) - W10 20 1) = Dual.mk 1 (-11)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W10 19 2 * ((∑ j : Fin 3, W10 20 j) - W10 20 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W11, ite_eq_right hv]

lemma update12 :
    Function.update W11 18 (fun i => W11 18 i * ((∑ j : Fin 3, W11 19 j) - W11 19 i)) = W12 := by
  funext v i
  by_cases hv : v = 18
  · subst hv
    simp only [Function.update_self, W12]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W11 18 0 * ((∑ j : Fin 3, W11 19 j) - W11 19 0) = Dual.mk 1 (-21/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W11 18 1 * ((∑ j : Fin 3, W11 19 j) - W11 19 1) = Dual.mk (-1) (-21/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W11 18 2 * ((∑ j : Fin 3, W11 19 j) - W11 19 2) = Dual.mk 0 (-2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W12, ite_eq_right hv]

lemma update13 :
    Function.update W12 17 (fun i => W12 17 i * ((∑ j : Fin 3, W12 18 j) - W12 18 i)) = W13 := by
  funext v i
  by_cases hv : v = 17
  · subst hv
    simp only [Function.update_self, W13]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W12 17 0 * ((∑ j : Fin 3, W12 18 j) - W12 18 0) = Dual.mk (-1) (-13)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W12 17 1 * ((∑ j : Fin 3, W12 18 j) - W12 18 1) = Dual.mk (-1) 13
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W12 17 2 * ((∑ j : Fin 3, W12 18 j) - W12 18 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W13, ite_eq_right hv]

lemma update14 :
    Function.update W13 16 (fun i => W13 16 i * ((∑ j : Fin 3, W13 17 j) - W13 17 i)) = W14 := by
  funext v i
  by_cases hv : v = 16
  · subst hv
    simp only [Function.update_self, W14]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W13 16 0 * ((∑ j : Fin 3, W13 17 j) - W13 17 0) = Dual.mk (-1) (25/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W13 16 1 * ((∑ j : Fin 3, W13 17 j) - W13 17 1) = Dual.mk 1 (25/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W13 16 2 * ((∑ j : Fin 3, W13 17 j) - W13 17 2) = Dual.mk 0 2
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W14, ite_eq_right hv]

lemma update15 :
    Function.update W14 0 (fun i => W14 0 i * ((∑ j : Fin 3, W14 16 j) - W14 16 i)) = W15 := by
  funext v i
  by_cases hv : v = 0
  · subst hv
    simp only [Function.update_self, W15]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W14 0 0 * ((∑ j : Fin 3, W14 16 j) - W14 16 0) = Dual.mk 1 15
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W14 0 1 * ((∑ j : Fin 3, W14 16 j) - W14 16 1) = Dual.mk 1 (-15)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W14 0 2 * ((∑ j : Fin 3, W14 16 j) - W14 16 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W15, ite_eq_right hv]

lemma update16 :
    Function.update W15 13 (fun i => W15 13 i * ((∑ j : Fin 3, W15 14 j) - W15 14 i)) = W16 := by
  funext v i
  by_cases hv : v = 13
  · subst hv
    simp only [Function.update_self, W16]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W15 13 0 * ((∑ j : Fin 3, W15 14 j) - W15 14 0) = Dual.mk (-1) (-1)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W15 13 1 * ((∑ j : Fin 3, W15 14 j) - W15 14 1) = Dual.mk (-1) 1
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W15 13 2 * ((∑ j : Fin 3, W15 14 j) - W15 14 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W16, ite_eq_right hv]

lemma update17 :
    Function.update W16 12 (fun i => W16 12 i * ((∑ j : Fin 3, W16 13 j) - W16 13 i)) = W17 := by
  funext v i
  by_cases hv : v = 12
  · subst hv
    simp only [Function.update_self, W17]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W16 12 0 * ((∑ j : Fin 3, W16 13 j) - W16 13 0) = Dual.mk (-1) (1/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W16 12 1 * ((∑ j : Fin 3, W16 13 j) - W16 13 1) = Dual.mk 1 (1/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W16 12 2 * ((∑ j : Fin 3, W16 13 j) - W16 13 2) = Dual.mk 0 2
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W17, ite_eq_right hv]

lemma update18 :
    Function.update W17 11 (fun i => W17 11 i * ((∑ j : Fin 3, W17 12 j) - W17 12 i)) = W18 := by
  funext v i
  by_cases hv : v = 11
  · subst hv
    simp only [Function.update_self, W18]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W17 11 0 * ((∑ j : Fin 3, W17 12 j) - W17 12 0) = Dual.mk 1 3
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W17 11 1 * ((∑ j : Fin 3, W17 12 j) - W17 12 1) = Dual.mk 1 (-3)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W17 11 2 * ((∑ j : Fin 3, W17 12 j) - W17 12 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W18, ite_eq_right hv]

lemma update19 :
    Function.update W18 10 (fun i => W18 10 i * ((∑ j : Fin 3, W18 11 j) - W18 11 i)) = W19 := by
  funext v i
  by_cases hv : v = 10
  · subst hv
    simp only [Function.update_self, W19]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W18 10 0 * ((∑ j : Fin 3, W18 11 j) - W18 11 0) = Dual.mk 1 (-5/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W18 10 1 * ((∑ j : Fin 3, W18 11 j) - W18 11 1) = Dual.mk (-1) (-5/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W18 10 2 * ((∑ j : Fin 3, W18 11 j) - W18 11 2) = Dual.mk 0 (-2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W19, ite_eq_right hv]

lemma update20 :
    Function.update W19 9 (fun i => W19 9 i * ((∑ j : Fin 3, W19 10 j) - W19 10 i)) = W20 := by
  funext v i
  by_cases hv : v = 9
  · subst hv
    simp only [Function.update_self, W20]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W19 9 0 * ((∑ j : Fin 3, W19 10 j) - W19 10 0) = Dual.mk (-1) (-5)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W19 9 1 * ((∑ j : Fin 3, W19 10 j) - W19 10 1) = Dual.mk (-1) 5
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W19 9 2 * ((∑ j : Fin 3, W19 10 j) - W19 10 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W20, ite_eq_right hv]

lemma update21 :
    Function.update W20 8 (fun i => W20 8 i * ((∑ j : Fin 3, W20 9 j) - W20 9 i)) = W21 := by
  funext v i
  by_cases hv : v = 8
  · subst hv
    simp only [Function.update_self, W21]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W20 8 0 * ((∑ j : Fin 3, W20 9 j) - W20 9 0) = Dual.mk (-1) (9/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W20 8 1 * ((∑ j : Fin 3, W20 9 j) - W20 9 1) = Dual.mk 1 (9/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W20 8 2 * ((∑ j : Fin 3, W20 9 j) - W20 9 2) = Dual.mk 0 2
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W21, ite_eq_right hv]

lemma update22 :
    Function.update W21 8 (fun i => W21 8 i * ((∑ j : Fin 3, W21 15 j) - W21 15 i)) = W22 := by
  funext v i
  by_cases hv : v = 8
  · subst hv
    simp only [Function.update_self, W22]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W21 8 0 * ((∑ j : Fin 3, W21 15 j) - W21 15 0) = Dual.mk 1 (-4)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W21 8 1 * ((∑ j : Fin 3, W21 15 j) - W21 15 1) = Dual.mk 1 4
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W21 8 2 * ((∑ j : Fin 3, W21 15 j) - W21 15 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W22, ite_eq_right hv]

lemma update23 :
    Function.update W22 7 (fun i => W22 7 i * ((∑ j : Fin 3, W22 8 j) - W22 8 i)) = W23 := by
  funext v i
  by_cases hv : v = 7
  · subst hv
    simp only [Function.update_self, W23]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W22 7 0 * ((∑ j : Fin 3, W22 8 j) - W22 8 0) = Dual.mk 1 (9/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W22 7 1 * ((∑ j : Fin 3, W22 8 j) - W22 8 1) = Dual.mk (-1) (9/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W22 7 2 * ((∑ j : Fin 3, W22 8 j) - W22 8 2) = Dual.mk 0 (-2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W23, ite_eq_right hv]

lemma update24 :
    Function.update W23 6 (fun i => W23 6 i * ((∑ j : Fin 3, W23 7 j) - W23 7 i)) = W24 := by
  funext v i
  by_cases hv : v = 6
  · subst hv
    simp only [Function.update_self, W24]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W23 6 0 * ((∑ j : Fin 3, W23 7 j) - W23 7 0) = Dual.mk (-1) 2
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W23 6 1 * ((∑ j : Fin 3, W23 7 j) - W23 7 1) = Dual.mk (-1) (-2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W23 6 2 * ((∑ j : Fin 3, W23 7 j) - W23 7 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W24, ite_eq_right hv]

lemma update25 :
    Function.update W24 5 (fun i => W24 5 i * ((∑ j : Fin 3, W24 6 j) - W24 6 i)) = W25 := by
  funext v i
  by_cases hv : v = 5
  · subst hv
    simp only [Function.update_self, W25]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W24 5 0 * ((∑ j : Fin 3, W24 6 j) - W24 6 0) = Dual.mk (-1) (-5/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W24 5 1 * ((∑ j : Fin 3, W24 6 j) - W24 6 1) = Dual.mk 1 (-5/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W24 5 2 * ((∑ j : Fin 3, W24 6 j) - W24 6 2) = Dual.mk 0 2
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W25, ite_eq_right hv]

lemma update26 :
    Function.update W25 4 (fun i => W25 4 i * ((∑ j : Fin 3, W25 5 j) - W25 5 i)) = W26 := by
  funext v i
  by_cases hv : v = 4
  · subst hv
    simp only [Function.update_self, W26]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W25 4 0 * ((∑ j : Fin 3, W25 5 j) - W25 5 0) = Dual.mk 1 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W25 4 1 * ((∑ j : Fin 3, W25 5 j) - W25 5 1) = Dual.mk 1 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W25 4 2 * ((∑ j : Fin 3, W25 5 j) - W25 5 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W26, ite_eq_right hv]

lemma update27 :
    Function.update W26 0 (fun i => W26 0 i * ((∑ j : Fin 3, W26 4 j) - W26 4 i)) = W27 := by
  funext v i
  by_cases hv : v = 0
  · subst hv
    simp only [Function.update_self, W27]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W26 0 0 * ((∑ j : Fin 3, W26 4 j) - W26 4 0) = Dual.mk 1 15
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W26 0 1 * ((∑ j : Fin 3, W26 4 j) - W26 4 1) = Dual.mk 1 (-15)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W26 0 2 * ((∑ j : Fin 3, W26 4 j) - W26 4 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W27, ite_eq_right hv]

lemma update28 :
    Function.update W27 2 (fun i => W27 2 i * ((∑ j : Fin 3, W27 3 j) - W27 3 i)) = W28 := by
  funext v i
  by_cases hv : v = 2
  · subst hv
    simp only [Function.update_self, W28]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W27 2 0 * ((∑ j : Fin 3, W27 3 j) - W27 3 0) = Dual.mk (-1) (-1)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W27 2 1 * ((∑ j : Fin 3, W27 3 j) - W27 3 1) = Dual.mk (-1) 1
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W27 2 2 * ((∑ j : Fin 3, W27 3 j) - W27 3 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W28, ite_eq_right hv]

lemma update29 :
    Function.update W28 0 (fun i => W28 0 i * ((∑ j : Fin 3, W28 2 j) - W28 2 i)) = W29 := by
  funext v i
  by_cases hv : v = 0
  · subst hv
    simp only [Function.update_self, W29]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W28 0 0 * ((∑ j : Fin 3, W28 2 j) - W28 2 0) = Dual.mk (-1) (-14)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, W28, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W28 0 1 * ((∑ j : Fin 3, W28 2 j) - W28 2 1) = Dual.mk (-1) 14
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, W28, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W28 0 2 * ((∑ j : Fin 3, W28 2 j) - W28 2 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, W28, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W29, ite_eq_right hv]

lemma update30 :
    Function.update W29 0 (fun i => W29 0 i * ((∑ j : Fin 3, W29 1 j) - W29 1 i)) = W30 := by
  funext v i
  by_cases hv : v = 0
  · subst hv
    simp only [Function.update_self, W30]
    rw [ite_eq_left trivial]
    fin_cases i
    · change W29 0 0 * ((∑ j : Fin 3, W29 1 j) - W29 1 0) = Dual.mk 1 (29/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, W28, W29, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, T29, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W29 0 1 * ((∑ j : Fin 3, W29 1 j) - W29 1 1) = Dual.mk (-1) (29/2)
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, W28, W29, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, T29, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
    · change W29 0 2 * ((∑ j : Fin 3, W29 1 j) - W29 1 2) = Dual.mk 0 0
      simp only [W0, W1, W2, W3, W4, W5, W6, W7, W8, W9, W10, W11, W12, W13, W14, W15, W16, W17, W18, W19, W20, W21, W22, W23, W24, W25, W26, W27, W28, W29, wR, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20, T21, T22, T23, T24, T25, T26, T27, T28, T29, Fin.sum_univ_three, Matrix.cons_val_zero]
      apply Dual.ext <;> simp <;> norm_num
  · rw [Function.update_of_ne hv]
    simp [W30, ite_eq_right hv]

lemma partFunOn_zero (w : Fin 31 → Fin 3 → Dual) :
    LiElim.partFunOn Li.T ({0} : Finset (Fin 31)) w = w 0 0 + w 0 1 + w 0 2 := by
  classical
  let e0 : {v // v ∈ ({0} : Finset (Fin 31))} := ⟨0, Finset.mem_singleton_self 0⟩
  have e0_unique : ∀ a : {v // v ∈ ({0} : Finset (Fin 31))}, a = e0 := by
    intro a
    exact Subtype.ext (Finset.mem_singleton.mp a.2)
  have hproper : ∀ κ : {v // v ∈ ({0} : Finset (Fin 31))} → Fin 3,
      (∀ u v : {v // v ∈ ({0} : Finset (Fin 31))}, Li.T.Adj u v → κ u ≠ κ v) := by
    intro κ u v huv
    have hu : (u : Fin 31) = 0 := Finset.mem_singleton.mp u.2
    have hv : (v : Fin 31) = 0 := Finset.mem_singleton.mp v.2
    rw [hu, hv] at huv
    exact (Li.T.loopless.irrefl 0 huv).elim
  let ee : ({v // v ∈ ({0} : Finset (Fin 31))} → Fin 3) ≃ Fin 3 :=
    { toFun := fun κ => κ e0
      invFun := fun i => fun _ => i
      left_inv := fun κ => by
        funext a
        rw [e0_unique a]
      right_inv := fun i => rfl }
  rw [LiElim.partFunOn]
  trans ∑ κ : {v // v ∈ ({0} : Finset (Fin 31))} → Fin 3, w 0 (κ e0)
  · apply Finset.sum_congr rfl
    intro κ _
    rw [ite_eq_left (hproper κ)]
    have hattach : ({0} : Finset (Fin 31)).attach = {e0} := by
      ext a
      simp only [Finset.mem_attach, Finset.mem_singleton, true_iff]
      exact e0_unique a
    rw [hattach, Finset.prod_singleton]
  · rw [Fintype.sum_equiv ee _ _ ?_]
    · rw [Fin.sum_univ_three]
    · intro κ
      rfl

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
theorem coeff_29 : (LiElim.partFunOn Li.T Finset.univ W0).c1 = 29 := by
  have step1 : LiElim.partFunOn Li.T Finset.univ W0 = LiElim.partFunOn Li.T (Finset.univ.erase 30) W1 := by
    rw [LiElim.partFunOn_erase Li.T Finset.univ 30 29 (by decide) (by decide) (by decide) (by decide) W0, update1]
  rw [step1]
  have step2 : LiElim.partFunOn Li.T (Finset.univ.erase 30) W1 = LiElim.partFunOn Li.T ((Finset.univ.erase 30).erase 29) W2 := by
    rw [LiElim.partFunOn_erase Li.T (Finset.univ.erase 30) 29 28 (by decide) (by decide) (by decide) (by decide) W1, update2]
  rw [step2]
  have step3 : LiElim.partFunOn Li.T ((Finset.univ.erase 30).erase 29) W2 = LiElim.partFunOn Li.T (((Finset.univ.erase 30).erase 29).erase 28) W3 := by
    rw [LiElim.partFunOn_erase Li.T ((Finset.univ.erase 30).erase 29) 28 27 (by decide) (by decide) (by decide) (by decide) W2, update3]
  rw [step3]
  have step4 : LiElim.partFunOn Li.T (((Finset.univ.erase 30).erase 29).erase 28) W3 = LiElim.partFunOn Li.T ((((Finset.univ.erase 30).erase 29).erase 28).erase 27) W4 := by
    rw [LiElim.partFunOn_erase Li.T (((Finset.univ.erase 30).erase 29).erase 28) 27 26 (by decide) (by decide) (by decide) (by decide) W3, update4]
  rw [step4]
  have step5 : LiElim.partFunOn Li.T ((((Finset.univ.erase 30).erase 29).erase 28).erase 27) W4 = LiElim.partFunOn Li.T (((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26) W5 := by
    rw [LiElim.partFunOn_erase Li.T ((((Finset.univ.erase 30).erase 29).erase 28).erase 27) 26 25 (by decide) (by decide) (by decide) (by decide) W4, update5]
  rw [step5]
  have step6 : LiElim.partFunOn Li.T (((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26) W5 = LiElim.partFunOn Li.T ((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25) W6 := by
    rw [LiElim.partFunOn_erase Li.T (((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26) 25 24 (by decide) (by decide) (by decide) (by decide) W5, update6]
  rw [step6]
  have step7 : LiElim.partFunOn Li.T ((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25) W6 = LiElim.partFunOn Li.T (((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24) W7 := by
    rw [LiElim.partFunOn_erase Li.T ((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25) 24 23 (by decide) (by decide) (by decide) (by decide) W6, update7]
  rw [step7]
  have step8 : LiElim.partFunOn Li.T (((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24) W7 = LiElim.partFunOn Li.T ((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23) W8 := by
    rw [LiElim.partFunOn_erase Li.T (((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24) 23 22 (by decide) (by decide) (by decide) (by decide) W7, update8]
  rw [step8]
  have step9 : LiElim.partFunOn Li.T ((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23) W8 = LiElim.partFunOn Li.T (((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22) W9 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23) 22 21 (by decide) (by decide) (by decide) (by decide) W8, update9]
  rw [step9]
  have step10 : LiElim.partFunOn Li.T (((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22) W9 = LiElim.partFunOn Li.T ((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21) W10 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22) 21 20 (by decide) (by decide) (by decide) (by decide) W9, update10]
  rw [step10]
  have step11 : LiElim.partFunOn Li.T ((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21) W10 = LiElim.partFunOn Li.T (((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20) W11 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21) 20 19 (by decide) (by decide) (by decide) (by decide) W10, update11]
  rw [step11]
  have step12 : LiElim.partFunOn Li.T (((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20) W11 = LiElim.partFunOn Li.T ((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19) W12 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20) 19 18 (by decide) (by decide) (by decide) (by decide) W11, update12]
  rw [step12]
  have step13 : LiElim.partFunOn Li.T ((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19) W12 = LiElim.partFunOn Li.T (((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18) W13 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19) 18 17 (by decide) (by decide) (by decide) (by decide) W12, update13]
  rw [step13]
  have step14 : LiElim.partFunOn Li.T (((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18) W13 = LiElim.partFunOn Li.T ((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17) W14 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18) 17 16 (by decide) (by decide) (by decide) (by decide) W13, update14]
  rw [step14]
  have step15 : LiElim.partFunOn Li.T ((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17) W14 = LiElim.partFunOn Li.T (((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16) W15 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17) 16 0 (by decide) (by decide) (by decide) (by decide) W14, update15]
  rw [step15]
  have step16 : LiElim.partFunOn Li.T (((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16) W15 = LiElim.partFunOn Li.T ((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14) W16 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16) 14 13 (by decide) (by decide) (by decide) (by decide) W15, update16]
  rw [step16]
  have step17 : LiElim.partFunOn Li.T ((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14) W16 = LiElim.partFunOn Li.T (((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13) W17 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14) 13 12 (by decide) (by decide) (by decide) (by decide) W16, update17]
  rw [step17]
  have step18 : LiElim.partFunOn Li.T (((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13) W17 = LiElim.partFunOn Li.T ((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12) W18 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13) 12 11 (by decide) (by decide) (by decide) (by decide) W17, update18]
  rw [step18]
  have step19 : LiElim.partFunOn Li.T ((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12) W18 = LiElim.partFunOn Li.T (((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11) W19 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12) 11 10 (by decide) (by decide) (by decide) (by decide) W18, update19]
  rw [step19]
  have step20 : LiElim.partFunOn Li.T (((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11) W19 = LiElim.partFunOn Li.T ((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10) W20 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11) 10 9 (by decide) (by decide) (by decide) (by decide) W19, update20]
  rw [step20]
  have step21 : LiElim.partFunOn Li.T ((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10) W20 = LiElim.partFunOn Li.T (((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9) W21 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10) 9 8 (by decide) (by decide) (by decide) (by decide) W20, update21]
  rw [step21]
  have step22 : LiElim.partFunOn Li.T (((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9) W21 = LiElim.partFunOn Li.T ((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15) W22 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9) 15 8 (by decide) (by decide) (by decide) (by decide) W21, update22]
  rw [step22]
  have step23 : LiElim.partFunOn Li.T ((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15) W22 = LiElim.partFunOn Li.T (((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8) W23 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15) 8 7 (by decide) (by decide) (by decide) (by decide) W22, update23]
  rw [step23]
  have step24 : LiElim.partFunOn Li.T (((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8) W23 = LiElim.partFunOn Li.T ((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7) W24 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8) 7 6 (by decide) (by decide) (by decide) (by decide) W23, update24]
  rw [step24]
  have step25 : LiElim.partFunOn Li.T ((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7) W24 = LiElim.partFunOn Li.T (((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6) W25 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7) 6 5 (by decide) (by decide) (by decide) (by decide) W24, update25]
  rw [step25]
  have step26 : LiElim.partFunOn Li.T (((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6) W25 = LiElim.partFunOn Li.T ((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5) W26 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6) 5 4 (by decide) (by decide) (by decide) (by decide) W25, update26]
  rw [step26]
  have step27 : LiElim.partFunOn Li.T ((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5) W26 = LiElim.partFunOn Li.T (((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4) W27 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5) 4 0 (by decide) (by decide) (by decide) (by decide) W26, update27]
  rw [step27]
  have step28 : LiElim.partFunOn Li.T (((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4) W27 = LiElim.partFunOn Li.T ((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3) W28 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4) 3 2 (by decide) (by decide) (by decide) (by decide) W27, update28]
  rw [step28]
  have step29 : LiElim.partFunOn Li.T ((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3) W28 = LiElim.partFunOn Li.T (((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3).erase 2) W29 := by
    rw [LiElim.partFunOn_erase Li.T ((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3) 2 0 (by decide) (by decide) (by decide) (by decide) W28, update29]
  rw [step29]
  have step30 : LiElim.partFunOn Li.T (((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3).erase 2) W29 = LiElim.partFunOn Li.T ((((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3).erase 2).erase 1) W30 := by
    rw [LiElim.partFunOn_erase Li.T (((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3).erase 2) 1 0 (by decide) (by decide) (by decide) (by decide) W29, update30]
  rw [step30]
  have hS : ((((((((((((((((((((((((((((((Finset.univ.erase 30).erase 29).erase 28).erase 27).erase 26).erase 25).erase 24).erase 23).erase 22).erase 21).erase 20).erase 19).erase 18).erase 17).erase 16).erase 14).erase 13).erase 12).erase 11).erase 10).erase 9).erase 15).erase 8).erase 7).erase 6).erase 5).erase 4).erase 3).erase 2).erase 1) = ({0} : Finset (Fin 31)) := by decide
  rw [hS, partFunOn_zero]
  simp only [W30, ite_eq_left rfl, T30, Matrix.cons_val_zero, Dual.snd_add]
  norm_num

end LiCompute
