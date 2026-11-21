import Conjectures.BernardiMoralesColors
import Mathlib.Tactic.LinearCombination

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open Finset Matrix

/-- The usual cyclic order on `0, …, n+1`, with predecessor `i-1`. -/
noncomputable def standardCyclicOrder (n : ℕ) : CyclicOrder (Fin (n+2)) where
  pred := (finRotate (n+2)).symm
  isCycle := (isCycle_finRotate (n := n)).inv
  noFixed := by
    intro i hi
    have hm : i ∈ (finRotate (n+2)).support := by
      rw [support_finRotate]
      exact Finset.mem_univ i
    apply Equiv.Perm.mem_support.mp hm
    have he := congrArg (finRotate (n+2)) hi
    simpa using he.symm

@[simp] theorem standardCyclicOrder_pred (n : ℕ) (i : Fin (n+2)) :
    (standardCyclicOrder n).pred i = i - 1 := finRotate_symm_apply i

variable {V R : Type*} [Fintype V] [DecidableEq V] [CommRing R]

theorem cycleMatrix_mul_intervalKernel (C : CyclicOrder V) (q : V → R) :
    cycleMatrix C.pred q * intervalKernel C.pred q =
      (1 - ∏ i, q i) • (1 : Matrix V V R) := by
  unfold intervalKernel cycleMatrix
  rw [mul_neg_geom_sum, weightedShift_pow_card]
  ext i j
  by_cases h : i = j <;> simp [h, Matrix.one_apply]

theorem intervalKernel_diag (C : CyclicOrder V) (q : V → R) (i : V) :
    intervalKernel C.pred q i i = 1 := by
  rw [intervalKernel_entry]
  have hc : 0 < Fintype.card V := Fintype.card_pos_iff.mpr ⟨i⟩
  have hd : (C.distance i i).val = 0 :=
    C.on_univ.injOn_pow_apply (Finset.mem_univ i) (C.distance i i).isLt hc
      ((C.distance_spec i i).trans (by simp))
  rw [hd]
  simp [pathWeight]

theorem intervalKernel_predecessor (C : CyclicOrder V) (q : V → R) (i j : V) :
    intervalKernel C.pred q (C.pred i) j - q i * intervalKernel C.pred q i j =
      (1 - ∏ v, q v) * (1 : Matrix V V R) (C.pred i) j := by
  have he := congrArg (fun M : Matrix V V R => M (C.pred i) j)
    (cycleMatrix_mul_intervalKernel C q)
  have hp : (weightedShift C.pred q * intervalKernel C.pred q) (C.pred i) j =
      q i * intervalKernel C.pred q i j := by
    rw [Matrix.mul_apply, Finset.sum_eq_single i]
    · simp [weightedShift]
    · intro b _ hb
      have hne : C.pred i ≠ C.pred b := fun h => hb (C.pred.injective h).symm
      simp [weightedShift, hne]
    · simp
  simpa only [cycleMatrix, Matrix.sub_mul, Matrix.one_mul, Matrix.sub_apply,
    hp, Matrix.smul_apply, smul_eq_mul] using he

/-- The source's interval event `]i,j] ⊆ S`, with the empty interval when
`i = j`, read by walking backwards from `j` in the cyclic order. -/
def intervalEvent (C : CyclicOrder V) (s : V → Bool) (i j : V) : Prop :=
  ∀ t < (C.distance i j).val, s ((C.pred ^ t) j) = true

noncomputable def indicatorI (C : CyclicOrder V) (s : V → Bool) : Matrix V V R := by
  classical
  exact fun i j => if intervalEvent C s i j then 1 else 0

noncomputable def indicatorJ (C : CyclicOrder V) (s : V → Bool) : Matrix V V R := by
  classical
  exact fun i j => if i = j then (if ∀ v, s v = true then 1 else 0)
    else indicatorI C s i j

theorem indicatorI_eq_kernel (C : CyclicOrder V) (s : V → Bool) :
    (indicatorI C s : Matrix V V R) = intervalKernel C.pred (fun v => bitValue (s v)) := by
  ext i j
  rw [intervalKernel_binary]
  unfold indicatorI intervalEvent
  split_ifs <;> rfl

/-- The marked event in the source is precisely membership of `i` times its
ordinary interval event. The full-subset diagonal of `J` is essential. -/
theorem indicatorJ_predecessor (C : CyclicOrder V) (s : V → Bool) (i j : V) :
    (indicatorJ C s : Matrix V V R) (C.pred i) j =
      bitValue (s i) * indicatorI C s i j := by
  classical
  have he := intervalKernel_predecessor C (fun v => (bitValue (s v) : R)) i j
  by_cases hij : C.pred i = j
  · subst j
    rw [intervalKernel_diag, Matrix.one_apply_eq, mul_one, binary_product] at he
    simp only [indicatorJ, ite_true, indicatorI_eq_kernel]
    linear_combination he
  · rw [Matrix.one_apply_ne hij, mul_zero] at he
    simp only [indicatorJ, hij, ite_false, indicatorI_eq_kernel]
    exact sub_eq_zero.mp he

/-- This is the literal event matrix from Conjecture 28: marked rows use
row `i-1` of `J`, unmarked rows use row `i` of `I`, and the root row is one. -/
noncomputable def sourceEventMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V)
    (s : Fin r → V → Bool) : Matrix V V R :=
  fun i j => if hi : i = root then 1
    else if i ∈ D then indicatorJ C (s (f ⟨i, hi⟩)) (C.pred i) j
    else indicatorI C (s (f ⟨i, hi⟩)) i j

theorem sourceEventMatrix_eq_eventMatrix (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V) (s : Fin r → V → Bool) :
    (sourceEventMatrix C root f D s : Matrix V V R) = eventMatrix C root f D s := by
  ext i j
  by_cases hi : i = root
  · simp [sourceEventMatrix, eventMatrix, colorMatrix, hi]
  · by_cases hd : i ∈ D
    · simp [sourceEventMatrix, eventMatrix, colorMatrix, hi, hd,
        indicatorJ_predecessor, indicatorI_eq_kernel, markFactor]
    · simp [sourceEventMatrix, eventMatrix, colorMatrix, hi, hd,
        indicatorI_eq_kernel, markFactor]

end BernardiMorales
