import Conjectures.LonelinessKZProductCertificate
import Mathlib.Algebra.BigOperators.Intervals

/-! A compressed checker for the same integer dual certificates. A recurrence
checks the extra tail sums, avoiding a full matrix sum for every coefficient.
The endpoint remains the original `DualValid` predicate. -/

open scoped BigOperators

namespace Loneliness.KZProduct

private def coefficientNat (d r i : ℕ) : ℤ :=
  if r < d then if i ≤ r then 1 else 0
  else if r-d+1 < d then
    (if i = r-d+1 then 4 else 0) - (if i = r-d then 3 else 0)
  else 0

theorem coefficient_sum (d : ℕ) (w : ℕ → ℕ) (i : Fin d) :
    (∑ r : Fin (2*d), (w r.val : ℤ)*coefficient d r i) =
      (∑ r ∈ Finset.Ico i.val d, (w r : ℤ)) +
      (if 0 < i.val then 4*(w (d+(i.val-1)) : ℤ) else 0) -
      (if i.val+1 < d then 3*(w (d+i.val) : ℤ) else 0) := by
  change (∑ r : Fin (2*d), (w r.val : ℤ)*coefficientNat d r.val i.val) = _
  rw [Fin.sum_univ_eq_sum_range (fun r => (w r : ℤ)*coefficientNat d r i.val) (2*d),
    show 2*d = d+d by omega, Finset.sum_range_add]
  have hfirst : (∑ r ∈ Finset.range d, (w r : ℤ)*coefficientNat d r i.val) =
      ∑ r ∈ Finset.Ico i.val d, (w r : ℤ) := by
    calc
      _ = ∑ r ∈ Finset.range d, if i.val ≤ r then (w r : ℤ) else 0 := by
        apply Finset.sum_congr rfl
        intro r hr
        have hr' := Finset.mem_range.mp hr
        simp only [coefficientNat,ite_eq_left hr']
        split_ifs <;> simp
      _ = _ := by
        rw [← Finset.sum_filter]
        congr 1
        ext r
        simp only [Finset.mem_filter,Finset.mem_range,Finset.mem_Ico]
        exact and_comm
  have hterm (r : ℕ) :
      (w (d+r) : ℤ)*coefficientNat d (d+r) i.val =
        (if r+1 < d ∧ i.val = r+1 then 4*(w (d+r) : ℤ) else 0) -
        (if r+1 < d ∧ i.val = r then 3*(w (d+r) : ℤ) else 0) := by
    have hnd : ¬d+r < d := by omega
    by_cases hs : r+1 < d
    · simp only [coefficientNat,ite_eq_right hnd,Nat.add_sub_cancel_left,ite_eq_left hs,
        hs,true_and]
      split_ifs <;> ring
    · simp [coefficientNat,hnd,hs]
  have hplus : (∑ r ∈ Finset.range d,
      if r+1 < d ∧ i.val = r+1 then 4*(w (d+r) : ℤ) else 0) =
      if 0 < i.val then 4*(w (d+(i.val-1)) : ℤ) else 0 := by
    by_cases hi : 0 < i.val
    · rw [ite_eq_left hi,Finset.sum_eq_single (i.val-1)]
      · have hs : i.val-1+1 = i.val := by omega
        simp [hs,i.isLt]
      · intro r hr hne
        have he : i.val ≠ r+1 := by omega
        simp [he]
      · have hm : i.val-1 ∈ Finset.range d := by simp only [Finset.mem_range]; omega
        simp [hm]
    · rw [ite_eq_right hi]
      apply Finset.sum_eq_zero
      intro r hr
      have he : i.val ≠ r+1 := by omega
      simp [he]
  have hminus : (∑ r ∈ Finset.range d,
      if r+1 < d ∧ i.val = r then 3*(w (d+r) : ℤ) else 0) =
      if i.val+1 < d then 3*(w (d+i.val) : ℤ) else 0 := by
    rw [Finset.sum_eq_single i.val]
    · simp
    · intro r hr hne
      have he : i.val ≠ r := Ne.symm hne
      simp [he]
    · simp [Finset.mem_range,i.isLt]
  have hsecond : (∑ r ∈ Finset.range d, (w (d+r) : ℤ)*coefficientNat d (d+r) i.val) =
      (if 0 < i.val then 4*(w (d+(i.val-1)) : ℤ) else 0) -
      (if i.val+1 < d then 3*(w (d+i.val) : ℤ) else 0) := by
    calc
      _ = ∑ r ∈ Finset.range d,
          ((if r+1 < d ∧ i.val = r+1 then 4*(w (d+r) : ℤ) else 0) -
           (if r+1 < d ∧ i.val = r then 3*(w (d+r) : ℤ) else 0)) := by
        apply Finset.sum_congr rfl
        intro r hr
        exact hterm r
      _ = _ := by rw [Finset.sum_sub_distrib,hplus,hminus]
  rw [hfirst,hsecond]
  ring

theorem constraint_weight_sum (d : ℕ) (w bounds : ℕ → ℕ) :
    (∑ r : Fin (2*d), w r.val * constraintBound d bounds r) =
      ∑ r ∈ Finset.range d, w r * bounds (r+1) := by
  change (∑ r : Fin (2*d), w r.val * (if r.val < d then bounds (r.val+1) else 0)) = _
  rw [Fin.sum_univ_eq_sum_range (fun r => w r * (if r < d then bounds (r+1) else 0)) (2*d),
    show 2*d = d+d by omega, Finset.sum_range_add]
  have hfirst : (∑ r ∈ Finset.range d, w r * (if r < d then bounds (r+1) else 0)) =
      ∑ r ∈ Finset.range d, w r * bounds (r+1) := by
    apply Finset.sum_congr rfl
    intro r hr
    simp [Finset.mem_range.mp hr]
  have hsecond : (∑ r ∈ Finset.range d,
      w (d+r) * (if d+r < d then bounds (d+r+1) else 0)) = 0 := by
    apply Finset.sum_eq_zero
    intro r hr
    simp [show ¬d+r < d by omega]
  rw [hfirst,hsecond,add_zero]

theorem tail_sum (d : ℕ) (w tail : ℕ → ℕ) (hzero : tail d = 0)
    (hstep : ∀ i < d, tail i = w i + tail (i+1)) (i : ℕ) (hi : i ≤ d) :
    (∑ r ∈ Finset.Ico i d, (w r : ℤ)) = (tail i : ℤ) := by
  calc
    _ = ∑ r ∈ Finset.Ico i d, ((tail r : ℤ) - tail (r+1)) := by
      apply Finset.sum_congr rfl
      intro r hr
      have h : (tail r : ℤ) = (w r : ℤ) + tail (r+1) := by
        exact_mod_cast hstep r (Finset.mem_Ico.mp hr).2
      linarith
    _ = -(∑ r ∈ Finset.Ico i d, ((tail (r+1) : ℤ) - tail r)) := by
      rw [← Finset.sum_neg_distrib]
      apply Finset.sum_congr rfl
      intro r hr
      ring
    _ = _ := by
      rw [Finset.sum_Ico_sub (fun r => (tail r : ℤ)) hi,hzero]
      simp

structure FastRow where
  dual : DualRow
  tails : Array ℕ
  deriving Inhabited

def FastRow.tail (row : FastRow) (i : ℕ) : ℕ := row.tails[i]?.getD 0

def FastValid (d : ℕ) (bounds : ℕ → ℕ) (s : Fin d → Bool) (row : FastRow) : Prop :=
  0 < row.dual.denominator ∧
  row.tail d = 0 ∧
  (∀ i : Fin d, row.tail i.val = row.dual.weight i.val + row.tail (i.val+1)) ∧
  (∀ i : Fin d,
    row.tail i.val + (if 0 < i.val then 4*row.dual.weight (d+(i.val-1)) else 0) =
      (if s i then row.dual.denominator else 0) +
      (if i.val+1 < d then 3*row.dual.weight (d+i.val) else 0)) ∧
  row.dual.denominator * bounds (selectedCount s) ≤
    ∑ r ∈ Finset.range d, row.dual.weight r * bounds (r+1)

instance (d : ℕ) (bounds : ℕ → ℕ) (s : Fin d → Bool) (row : FastRow) :
    Decidable (FastValid d bounds s row) := by
  unfold FastValid
  infer_instance

theorem fast_valid_correct {d : ℕ} (bounds : ℕ → ℕ) (s : Fin d → Bool) (row : FastRow)
    (h : FastValid d bounds s row) : DualValid d bounds s row.dual := by
  refine ⟨h.1,?_,?_⟩
  · intro i
    rw [coefficient_sum]
    rw [tail_sum d row.dual.weight row.tail h.2.1
      (fun j hj => h.2.2.1 ⟨j,hj⟩) i.val i.isLt.le]
    have hc : (row.tail i.val : ℤ) +
        (if 0 < i.val then 4*(row.dual.weight (d+(i.val-1)) : ℤ) else 0) =
        (if s i then (row.dual.denominator : ℤ) else 0) +
        (if i.val+1 < d then 3*(row.dual.weight (d+i.val) : ℤ) else 0) := by
      exact_mod_cast h.2.2.2.1 i
    linarith
  · rw [constraint_weight_sum]
    exact h.2.2.2.2

end Loneliness.KZProduct
