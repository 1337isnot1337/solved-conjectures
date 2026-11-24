import Conjectures.HartkeMatchingExcessCounts
import Conjectures.HartkeMatchingExcessBits

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Closed forms for the actual path/cycle-cover counts, including every deleted
arc `1 → u` with `u ≥ 2`. These are derived from the permutation bijection,
not assumed as a combinatorial counting formula.
-/

namespace HartkeMatchingExcess

open Finset

variable {R : ℕ}

theorem fin_Iio_succ (i : Fin R) :
    Iio i.succ = insert i.castSucc (Iio i.castSucc) := by
  ext x
  simp only [mem_Iio, mem_insert, Fin.lt_def, Fin.ext_iff,
    Fin.val_succ, Fin.val_castSucc]
  omega

theorem pathCount_all_column (A : Fin (R + 1) → Fin (R + 1) → Prop) [DecidableRel A]
    (j : Fin (R + 1)) (hj : j ≠ 0) (hA : ∀ i, A i j) :
    pathCount A j = ∑ i ∈ Iio j, pathCount A i := by
  rw [pathCount_rec A j hj]
  simp only [hA, filter_true]

theorem pathCount_succ_column (A : Fin (R + 1) → Fin (R + 1) → Prop) [DecidableRel A]
    (j : Fin R) (hA : ∀ i, A i j.succ) :
    pathCount A j.succ = pathCount A j.castSucc + ∑ i ∈ Iio j.castSucc, pathCount A i := by
  rw [pathCount_all_column A j.succ j.succ_ne_zero hA, fin_Iio_succ,
    sum_insert (by simp)]

theorem pathCount_succ_double (A : Fin (R + 1) → Fin (R + 1) → Prop) [DecidableRel A]
    (j : Fin R) (hj : j.castSucc ≠ 0)
    (hA : ∀ i, A i j.castSucc) (hA' : ∀ i, A i j.succ) :
    pathCount A j.succ = 2 * pathCount A j.castSucc := by
  rw [pathCount_succ_column A j hA', ← pathCount_all_column A j.castSucc hj hA]
  omega

theorem pathCount_initial_binary (A : Fin (R + 1) → Fin (R + 1) → Prop) [DecidableRel A]
    (K : ℕ) (hA : ∀ i j, j.val < K → A i j) (j : Fin (R + 1)) (hj : j.val < K) :
    pathCount A j = if j = 0 then 1 else 2 ^ (j.val - 1) := by
  induction j using Fin.induction with
  | zero => simp
  | succ j ih =>
    have hprev : j.castSucc.val < K := by
      change j.val < K
      have hjv : j.val + 1 < K := hj
      omega
    have hi := ih hprev
    rw [pathCount_succ_column A j (fun i => hA i j.succ hj)]
    by_cases hj0 : j.castSucc = 0
    · have hv : j.val = 0 := by simpa using congrArg Fin.val hj0
      simp [hj0, hv]
    · rw [← pathCount_all_column A j.castSucc hj0 (fun i => hA i j.castSucc hprev),
        hi, ite_eq_right hj0, ite_eq_right j.succ_ne_zero]
      have hv : 0 < j.val := by
        have := Fin.pos_iff_ne_zero.mpr hj0
        exact this
      have he : j.succ.val - 1 = (j.castSucc.val - 1) + 1 := by
        simp only [Fin.val_succ, Fin.val_castSucc]
        omega
      rw [he, pow_succ]
      omega

theorem pathCount_binary (j : Fin (R + 1)) :
    pathCount (fun _ _ : Fin (R + 1) => True) j =
      if j = 0 then 1 else 2 ^ (j.val - 1) :=
  pathCount_initial_binary _ (R + 1) (fun _ _ _ => True.intro) j j.isLt

def withoutOneArc (u : Fin (R + 1)) (i j : Fin (R + 1)) : Prop :=
  ¬(i.val = 1 ∧ j.val = u.val)

instance (u : Fin (R + 1)) : DecidableRel (withoutOneArc u) :=
  fun i j => inferInstanceAs (Decidable (¬(i.val = 1 ∧ j.val = u.val)))

theorem pathCount_deleted_before (u j : Fin (R + 1)) (hj : j < u) :
    pathCount (withoutOneArc u) j = if j = 0 then 1 else 2 ^ (j.val - 1) := by
  apply pathCount_initial_binary (withoutOneArc u) u.val _ j hj
  intro i j hj
  unfold withoutOneArc
  omega

theorem pathCount_deleted_sum_before (u : Fin (R + 1)) (hu : u ≠ 0) :
    (∑ j ∈ Iio u, pathCount (withoutOneArc u) j) = 2 ^ (u.val - 1) := by
  calc
    (∑ j ∈ Iio u, pathCount (withoutOneArc u) j) =
        ∑ j ∈ Iio u, pathCount (fun _ _ : Fin (R + 1) => True) j := by
      apply sum_congr rfl
      intro j hj
      rw [pathCount_deleted_before u j (mem_Iio.mp hj), pathCount_binary]
    _ = pathCount (fun _ _ : Fin (R + 1) => True) u :=
      (pathCount_all_column _ u hu (fun _ => True.intro)).symm
    _ = 2 ^ (u.val - 1) := by rw [pathCount_binary, ite_eq_right hu]

theorem pathCount_deleted_at_add_one (u : Fin (R + 1)) (hu : 2 ≤ u.val) :
    pathCount (withoutOneArc u) u + 1 = 2 ^ (u.val - 1) := by
  let one : Fin (R + 1) := ⟨1, by have := u.isLt; omega⟩
  have hone : one < u := by change 1 < u.val; omega
  have hu0 : u ≠ 0 := by
    intro h
    have hv : u.val = 0 := congrArg Fin.val h
    omega
  have hpc : pathCount (withoutOneArc u) one = 1 := by
    rw [pathCount_deleted_before u one hone]
    simp [one]
  have hfilter : (Iio u).filter (fun i => withoutOneArc u i u) = (Iio u).erase one := by
    ext i
    have hne : i ≠ one ↔ i.val ≠ 1 := by
      constructor
      · intro h hv
        exact h (Fin.ext hv)
      · intro h he
        exact h (congrArg Fin.val he)
    simp only [mem_filter, mem_Iio, withoutOneArc, and_true, mem_erase, hne]
    exact and_comm
  calc
    pathCount (withoutOneArc u) u + 1 =
        (∑ i ∈ (Iio u).erase one, pathCount (withoutOneArc u) i) +
          pathCount (withoutOneArc u) one := by
      rw [pathCount_rec _ u hu0, hfilter, hpc]
    _ = ∑ i ∈ Iio u, pathCount (withoutOneArc u) i :=
      sum_erase_add _ _ (mem_Iio.mpr hone)
    _ = 2 ^ (u.val - 1) := pathCount_deleted_sum_before u hu0

theorem pathCount_deleted_at (u : Fin (R + 1)) (hu : 2 ≤ u.val) :
    pathCount (withoutOneArc u) u = 2 ^ (u.val - 1) - 1 := by
  have := pathCount_deleted_at_add_one u hu
  omega

theorem pathCount_deleted_after (u j : Fin (R + 1)) (hu : 2 ≤ u.val) (hj : u < j) :
    pathCount (withoutOneArc u) j = (2 ^ u.val - 1) * 2 ^ (j.val - u.val - 1) := by
  induction j using Fin.induction with
  | zero => exact False.elim ((not_lt_of_ge (Fin.zero_le _)) hj)
  | succ j ih =>
    have hcol : ∀ i, withoutOneArc u i j.succ := by
      intro i
      unfold withoutOneArc
      have := Fin.lt_def.mp hj
      omega
    have hprev : u ≤ j.castSucc := by
      change u.val ≤ j.val
      have := Fin.lt_def.mp hj
      simp only [Fin.val_succ] at this
      omega
    by_cases heq : j.castSucc = u
    · have hv : j.val = u.val := congrArg Fin.val heq
      have hu0 : u ≠ 0 := by
        intro h
        have hv : u.val = 0 := congrArg Fin.val h
        omega
      rw [pathCount_succ_column _ j hcol, heq,
        pathCount_deleted_sum_before u hu0]
      have hp := pathCount_deleted_at_add_one u hu
      have hexp : j.succ.val - u.val - 1 = 0 := by simp [hv]
      rw [hexp, pow_zero, mul_one]
      have he : u.val = (u.val - 1) + 1 := by omega
      have hpow : (2 : ℕ) ^ u.val = 2 ^ (u.val - 1) * 2 := by
        nth_rw 1 [he]
        rw [pow_succ]
      omega
    · have hlt : u < j.castSucc := lt_of_le_of_ne hprev (Ne.symm heq)
      have hp0 : j.castSucc ≠ 0 := by
        intro h
        rw [h] at hlt
        exact (not_lt_of_ge (Fin.zero_le _)) hlt
      have hcolPrev : ∀ i, withoutOneArc u i j.castSucc := by
        intro i
        unfold withoutOneArc
        have := Fin.lt_def.mp hlt
        omega
      rw [pathCount_succ_double _ j hp0 hcolPrev hcol, ih hlt]
      have hexp : j.succ.val - u.val - 1 = (j.castSucc.val - u.val - 1) + 1 := by
        have := Fin.lt_def.mp hlt
        simp only [Fin.val_succ, Fin.val_castSucc] at *
        omega
      rw [hexp, pow_succ]
      ac_rfl

end HartkeMatchingExcess
