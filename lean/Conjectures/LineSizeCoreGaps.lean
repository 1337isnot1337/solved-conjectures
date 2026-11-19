import Conjectures.LineSizeCore
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Ring

/-! Exact gap coordinates for the positive core. These are finite
bijections and weight identities; no analytic generating-function
assumption is used. -/
namespace LineSize.CoreGaps

open Finset

def IsPositiveCore (r : ℕ) (y : ℕ → ℕ) : Prop :=
  (∀ i < r, 0 < y i) ∧ (∀ i, i+1 < r → y (i+1)+2 ≤ y i)

theorem positive_core_of_sequence (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) :
    IsPositiveCore r (fun i => d i-i) := by
  constructor
  · intro i hi
    change 0 < d i-i
    have hpos := hr.2.1 i hi
    omega
  · intro i hi
    change d (i+1)-(i+1)+2 ≤ d i-i
    have hnext := hr.2.1 (i+1) hi
    have hprev := hr.2.1 i (by omega)
    have hdrop := hd i (i+1) (by omega) (by have := hr.1; omega)
    omega

def fromGaps (r : ℕ) (z : ℕ → ℕ) (i : ℕ) : ℕ :=
  if i < r then 2*(r-i)-1+∑ j ∈ Ico i r, z j else 0

def gaps (r : ℕ) (y : ℕ → ℕ) (i : ℕ) : ℕ :=
  if i+1 < r then y i-y (i+1)-2 else if i < r then y i-1 else 0

@[simp] theorem fromGaps_of_lt (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i < r) :
    fromGaps r z i=2*(r-i)-1+∑ j ∈ Ico i r, z j := ite_eq_left hi

@[simp] theorem fromGaps_of_ge (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : r ≤ i) :
    fromGaps r z i=0 := ite_eq_right (by omega)

@[simp] theorem gaps_of_ge (r : ℕ) (y : ℕ → ℕ) (i : ℕ) (hi : r ≤ i) :
    gaps r y i=0 := by
  simp only [gaps,ite_eq_right (show ¬i+1 < r by omega),ite_eq_right (show ¬i < r by omega)]

@[simp] theorem fromGaps_last (r : ℕ) (z : ℕ → ℕ) :
    fromGaps (r+1) z r=1+z r := by
  simp [fromGaps,Nat.Ico_succ_singleton]

@[simp] theorem gaps_last (r : ℕ) (y : ℕ → ℕ) :
    gaps (r+1) y r=y r-1 := by
  simp [gaps]

theorem fromGaps_step (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i+1 < r) :
    fromGaps r z i=fromGaps r z (i+1)+2+z i := by
  rw [fromGaps_of_lt r z i (by omega),fromGaps_of_lt r z (i+1) hi,
    sum_eq_sum_Ico_succ_bot (show i < r by omega) z]
  omega

theorem fromGaps_positive (r : ℕ) (z : ℕ → ℕ) : IsPositiveCore r (fromGaps r z) := by
  constructor
  · intro i hi
    rw [fromGaps_of_lt r z i hi]
    omega
  · intro i hi
    rw [fromGaps_step r z i hi]
    omega

theorem gaps_fromGaps (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i < r) :
    gaps r (fromGaps r z) i=z i := by
  by_cases hn : i+1 < r
  · rw [gaps,ite_eq_left hn,fromGaps_step r z i hn]
    omega
  · have hr : r=i+1 := by omega
    subst r
    rw [gaps_last,fromGaps_last]
    omega

theorem fromGaps_gaps (r : ℕ) (y : ℕ → ℕ) (hy : IsPositiveCore r y)
    (i : ℕ) (hi : i < r) : fromGaps r (gaps r y) i=y i := by
  have aux (n : ℕ) : ∀ i, i+n+1=r → fromGaps r (gaps r y) i=y i := by
    induction n with
    | zero =>
      intro i heq
      have hr : r=i+1 := by omega
      subst r
      rw [fromGaps_last,gaps_last]
      have hpos := hy.1 i (by omega)
      omega
    | succ n ih =>
      intro i heq
      have hn : i+1 < r := by omega
      rw [fromGaps_step r (gaps r y) i hn,ih (i+1) (by omega)]
      simp only [gaps,ite_eq_left hn]
      have hstep := hy.2 i hn
      omega
  exact aux (r-i-1) i (by omega)

theorem fromGaps_extend (r : ℕ) (z : ℕ → ℕ) (i : ℕ) (hi : i < r) :
    fromGaps (r+1) z i=fromGaps r z i+(2+z r) := by
  rw [fromGaps_of_lt (r+1) z i (by omega),fromGaps_of_lt r z i hi,
    sum_Ico_succ_top hi.le z]
  omega

/-- The staircase has weight `r²`; the `j`th gap has multiplicity `j+1`. -/
theorem sum_fromGaps (r : ℕ) (z : ℕ → ℕ) :
    (∑ i ∈ range r, fromGaps r z i)=r^2+∑ j ∈ range r, (j+1)*z j := by
  induction r with
  | zero => simp
  | succ r ih =>
    calc
      (∑ i ∈ range (r+1), fromGaps (r+1) z i) =
          (∑ i ∈ range r, (fromGaps r z i+(2+z r)))+(1+z r) := by
        rw [sum_range_succ,fromGaps_last]
        congr 1
        apply sum_congr rfl
        intro i hi
        exact fromGaps_extend r z i (mem_range.mp hi)
      _ = (r+1)^2+∑ j ∈ range (r+1), (j+1)*z j := by
        rw [sum_add_distrib,ih,sum_const,card_range,nsmul_eq_mul,sum_range_succ]
        simp only [Nat.cast_id]
        ring

theorem sum_core (r : ℕ) (y : ℕ → ℕ) (hy : IsPositiveCore r y) :
    (∑ i ∈ range r, y i)=r^2+∑ j ∈ range r, (j+1)*gaps r y j := by
  rw [← sum_fromGaps]
  apply sum_congr rfl
  intro i hi
  exact (fromGaps_gaps r y hy i (mem_range.mp hi)).symm

theorem pointCost_eq_gapWeight (d : ℕ → ℕ) (k r : ℕ)
    (hd : Decreasing d k) (hr : IsCoreLength d k r) :
    pointCost d k=r^2+∑ j ∈ range r, (j+1)*gaps r (fun i => d i-i) j := by
  rw [pointCost_eq_core d k r hr]
  exact sum_core r (fun i => d i-i) (positive_core_of_sequence d k r hd hr)

theorem last_gap_positive_iff (r : ℕ) (y : ℕ → ℕ) (hr : 0 < r) :
    1 ≤ gaps r y (r-1) ↔ 2 ≤ y (r-1) := by
  simp only [gaps,ite_eq_right (show ¬r-1+1 < r by omega),
    ite_eq_left (show r-1 < r by omega)]
  omega

theorem last_gap_zero_iff (r : ℕ) (y : ℕ → ℕ) (hr : 0 < r)
    (hy : IsPositiveCore r y) : gaps r y (r-1)=0 ↔ y (r-1)=1 := by
  have hpos := hy.1 (r-1) (by omega)
  simp only [gaps,ite_eq_right (show ¬r-1+1 < r by omega),
    ite_eq_left (show r-1 < r by omega)]
  omega

/-- Extend a finite vector by zero, so inverse claims include no hidden
coordinates outside the core. -/
def extend (r : ℕ) (f : Fin r → ℕ) (i : ℕ) : ℕ :=
  if hi : i < r then f ⟨i,hi⟩ else 0

def restrict (r : ℕ) (f : ℕ → ℕ) : Fin r → ℕ := fun i => f i

@[simp] theorem extend_lt (r : ℕ) (f : Fin r → ℕ) (i : ℕ) (hi : i < r) :
    extend r f i=f ⟨i,hi⟩ := dite_eq_left hi

@[simp] theorem extend_ge (r : ℕ) (f : Fin r → ℕ) (i : ℕ) (hi : r ≤ i) :
    extend r f i=0 := dite_eq_right (by omega)

theorem extend_restrict (r : ℕ) (f : ℕ → ℕ) (hf : ∀ i, r ≤ i → f i=0) :
    extend r (restrict r f)=f := by
  funext i
  by_cases hi : i < r
  · simp [extend,restrict,hi]
  · rw [extend_ge r _ i (by omega),hf i (by omega)]

@[simp] theorem restrict_extend (r : ℕ) (f : Fin r → ℕ) :
    restrict r (extend r f)=f := by
  funext i
  exact extend_lt r f i i.isLt

def CoreVector (r : ℕ) := {y : Fin r → ℕ // IsPositiveCore r (extend r y)}

/-- Positive cores with gaps at least two are exactly nonnegative finite
gap vectors, including the unique empty vector when `r=0`. -/
def coreEquiv (r : ℕ) : CoreVector r ≃ (Fin r → ℕ) where
  toFun y := restrict r (gaps r (extend r y.1))
  invFun z := ⟨restrict r (fromGaps r (extend r z)),by
    rw [extend_restrict r _ (fun i hi => fromGaps_of_ge r _ i hi)]
    exact fromGaps_positive r _⟩
  left_inv y := by
    apply Subtype.ext
    change restrict r (fromGaps r (extend r (restrict r (gaps r (extend r y.1)))))=y.1
    rw [extend_restrict r _ (fun i hi => gaps_of_ge r _ i hi)]
    funext i
    change fromGaps r (gaps r (extend r y.1)) i=y.1 i
    rw [fromGaps_gaps r _ y.2 i i.isLt]
    exact extend_lt r y.1 i i.isLt
  right_inv z := by
    change restrict r (gaps r (extend r (restrict r (fromGaps r (extend r z)))))=z
    rw [extend_restrict r _ (fun i hi => fromGaps_of_ge r _ i hi)]
    funext i
    change gaps r (fromGaps r (extend r z)) i=z i
    rw [gaps_fromGaps r _ i i.isLt]
    exact extend_lt r z i i.isLt

theorem coreEquiv_weight (r : ℕ) (y : CoreVector r) :
    (∑ i : Fin r, y.1 i)=r^2+∑ j : Fin r, (j.val+1)*(coreEquiv r y) j := by
  calc
    (∑ i : Fin r, y.1 i) = ∑ i : Fin r, extend r y.1 i := by
      apply sum_congr rfl
      intro i _
      exact (extend_lt r y.1 i i.isLt).symm
    _ = ∑ i ∈ range r, extend r y.1 i := Fin.sum_univ_eq_sum_range _ _
    _ = r^2+∑ j ∈ range r, (j+1)*gaps r (extend r y.1) j :=
      sum_core r _ y.2
    _ = r^2+∑ j : Fin r, (j.val+1)*(coreEquiv r y) j := by
      rw [← Fin.sum_univ_eq_sum_range]
      rfl

def bumpLast (r b : ℕ) (z : ℕ → ℕ) (i : ℕ) : ℕ :=
  if i+1=r then z i+b else z i

def lowerLast (r b : ℕ) (z : ℕ → ℕ) (i : ℕ) : ℕ :=
  if i+1=r then z i-b else z i

@[simp] theorem lower_bump (r b : ℕ) (z : ℕ → ℕ) :
    lowerLast r b (bumpLast r b z)=z := by
  funext i
  by_cases hi : i+1=r <;> simp [lowerLast,bumpLast,hi]

theorem bump_lower (r b : ℕ) (z : ℕ → ℕ) (hz : b ≤ z (r-1)) :
    bumpLast r b (lowerLast r b z)=z := by
  funext i
  by_cases hi : i+1=r
  · have hir : i=r-1 := by omega
    simp only [bumpLast,lowerLast,ite_eq_left hi]
    exact Nat.sub_add_cancel (by simpa only [hir] using hz)
  · simp [bumpLast,lowerLast,hi]

theorem weighted_bump (r b : ℕ) (z : ℕ → ℕ) :
    (∑ j ∈ range r, (j+1)*bumpLast r b z j)=
      (∑ j ∈ range r, (j+1)*z j)+r*b := by
  cases r with
  | zero => simp
  | succ r =>
    rw [sum_range_succ,sum_range_succ]
    have hprefix : (∑ j ∈ range r, (j+1)*bumpLast (r+1) b z j)=
        ∑ j ∈ range r, (j+1)*z j := by
      apply sum_congr rfl
      intro j hj
      have hne : ¬j+1=r+1 := by have := mem_range.mp hj; omega
      simp only [bumpLast,ite_eq_right hne]
    rw [hprefix]
    rw [bumpLast,ite_eq_left rfl]
    ring

theorem sum_fromGaps_bump (r b : ℕ) (z : ℕ → ℕ) :
    (∑ i ∈ range r, fromGaps r (bumpLast r b z) i)=
      r^2+r*b+∑ j ∈ range r, (j+1)*z j := by
  rw [sum_fromGaps,weighted_bump]
  omega

theorem sum_shifted_staircase (r : ℕ) (z : ℕ → ℕ) :
    (∑ i ∈ range r, fromGaps r (bumpLast r 1 z) i)=
      r^2+r+∑ j ∈ range r, (j+1)*z j := by
  simpa only [Nat.mul_one] using sum_fromGaps_bump r 1 z

theorem size_at_least_three_one (y : ℕ → ℕ) :
    (∀ i < 1, 3 ≤ y i+i) ↔ 2 ≤ gaps 1 y 0 := by
  rw [show gaps 1 y 0=y 0-1 by exact gaps_last 0 y]
  constructor
  · intro h
    have := h 0 (by omega)
    omega
  · intro h i hi
    have : i=0 := by omega
    subst i
    omega

theorem size_at_least_three_two (y : ℕ → ℕ) (hy : IsPositiveCore 2 y) :
    (∀ i < 2, 3 ≤ y i+i) ↔ 1 ≤ gaps 2 y 1 := by
  rw [show gaps 2 y 1=y 1-1 by exact gaps_last 1 y]
  constructor
  · intro h
    have := h 1 (by omega)
    omega
  · intro h i hi
    have hstep : y 1+2 ≤ y 0 := hy.2 0 (by omega)
    have : i=0 ∨ i=1 := by omega
    rcases this with rfl | rfl <;> omega

theorem exceptional_weight_one (z : ℕ → ℕ) :
    (∑ i ∈ range 1, fromGaps 1 (bumpLast 1 2 z) i)=
      3+∑ j ∈ range 1, (j+1)*z j := by
  simpa using sum_fromGaps_bump 1 2 z

theorem exceptional_weight_two (z : ℕ → ℕ) :
    (∑ i ∈ range 2, fromGaps 2 (bumpLast 2 1 z) i)=
      6+∑ j ∈ range 2, (j+1)*z j := by
  simpa using sum_fromGaps_bump 2 1 z

end LineSize.CoreGaps
