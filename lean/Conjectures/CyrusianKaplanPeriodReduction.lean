module
public import Mathlib.Algebra.Order.Archimedean.Real.Basic
public import Mathlib.Algebra.Order.Floor.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

noncomputable def openPeriodOffset (m x : ℝ) : ℤ := ⌈x/m⌉ - 1

noncomputable def reduceOpenPeriod (m x : ℝ) : ℝ :=
  x-m*(openPeriodOffset m x:ℝ)

/-- The representative of an arbitrary real coordinate lies in
(0,m]. The upper endpoint, not zero, represents integral multiples. -/
theorem reduceOpenPeriod_bounds {m : ℝ} (hm : 0<m) (x : ℝ) :
    0<reduceOpenPeriod m x ∧ reduceOpenPeriod m x≤m := by
  have h := (Int.ceil_eq_iff (a:=x/m) (z:=⌈x/m⌉)).mp rfl
  have hLower := (lt_div_iff₀ hm).mp h.1
  have hUpper := (div_le_iff₀ hm).mp h.2
  unfold reduceOpenPeriod openPeriodOffset
  rw [Int.cast_sub,Int.cast_one]
  constructor <;> nlinarith

theorem reduceOpenPeriod_eq_self {m x : ℝ} (hm : 0<m) (hx : 0<x ∧ x≤m) :
    reduceOpenPeriod m x=x := by
  have h : ⌈x/m⌉ = (1:ℤ) := by
    apply Int.ceil_eq_iff.mpr
    constructor
    · simpa only [Int.cast_one,sub_self] using div_pos hx.1 hm
    · rw [Int.cast_one,div_le_iff₀ hm,one_mul]
      exact hx.2
  unfold reduceOpenPeriod openPeriodOffset
  rw [h,sub_self,Int.cast_zero,mul_zero,sub_zero]

/-- Adding any period multiple leaves the representative unchanged,
including negative multiples and translates across zero. -/
theorem reduceOpenPeriod_add_int_period {m : ℝ} (hm : 0<m) (x : ℝ) (z : ℤ) :
    reduceOpenPeriod m (x+m*(z:ℝ))=reduceOpenPeriod m x := by
  have he : (x+m*(z:ℝ))/m=x/m+(z:ℝ) := by
    rw [add_div,mul_comm m (z:ℝ),mul_div_cancel_right₀ (z:ℝ) hm.ne']
  unfold reduceOpenPeriod openPeriodOffset
  rw [he,Int.ceil_add_intCast]
  push_cast
  ring

/-- Reduction commutes with any subsequent translate followed by
reduction. This allows a height-one translate to be inverted by
a height-minus-one translate on the finite numerator box. -/
theorem reduceOpenPeriod_translate_restore {m : ℝ} (hm : 0<m) (x y : ℝ) :
    reduceOpenPeriod m (reduceOpenPeriod m x+y)=reduceOpenPeriod m (x+y) := by
  let z := openPeriodOffset m x
  have he : reduceOpenPeriod m x+y=(x+y)+m*((-z:ℤ):ℝ) := by
    change x-m*(z:ℝ)+y=(x+y)+m*((-z:ℤ):ℝ)
    rw [Int.cast_neg]
    ring
  rw [he,reduceOpenPeriod_add_int_period hm]

end CyrusianKaplan
