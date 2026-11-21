import Conjectures.OravcovaSotakBaseChange
import Conjectures.OravcovaSotakCertificates

/-! The six-speed two-parameter family. The finite certificate covers the
whole bounded region left by the two determinant inequalities. -/

namespace OravcovaSotak

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def sixForms : List (ℤ × ℤ) := [(1,0),(0,1),(1,1),(2,1),(3,1),(3,2)]

def baseVectors : List (ℤ × ℤ) := [(2,1),(3,-1),(5,-7),(5,-8),(3,-8),(2,-7)]

def GoodPeriod (p : ℕ) : Prop := 38 ≤ p ∨ p ∈ [6, 10, 12, 16, 18, 20, 22, 24, 26, 28, 29, 30, 32, 34, 35, 36]

instance (p : ℕ) : Decidable (GoodPeriod p) :=
  inferInstanceAs (Decidable (38 ≤ p ∨ p ∈ [6, 10, 12, 16, 18, 20, 22, 24, 26, 28, 29, 30, 32, 34, 35, 36]))

theorem goodPeriod_hasPeriod (p : ℕ) (hp : GoodPeriod p) :
    HasPeriod base_distances 6 p := by
  rcases hp with hp | hp
  · exact base_all_large_periods p hp
  · simp at hp
    rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · exact loopExists_hasPeriod base_width base_loop_6
    · exact loopExists_hasPeriod base_width base_loop_10
    · exact loopExists_hasPeriod base_width (loopExists_add base_width base_loop_6 base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width base_loop_10 base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width base_loop_6 base_loop_6) base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width base_loop_10 base_loop_10)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width base_loop_10 base_loop_6) base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width base_loop_6 base_loop_6) base_loop_6) base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width base_loop_10 base_loop_10) base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width base_loop_10 base_loop_6) base_loop_6) base_loop_6)
    · exact loopExists_hasPeriod base_width base_loop_29
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width base_loop_6 base_loop_6) base_loop_6) base_loop_6) base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width base_loop_10 base_loop_10) base_loop_6) base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width base_loop_10 base_loop_6) base_loop_6) base_loop_6) base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width base_loop_29 base_loop_6)
    · exact loopExists_hasPeriod base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width (loopExists_add base_width base_loop_6 base_loop_6) base_loop_6) base_loop_6) base_loop_6) base_loop_6)

theorem baseVectors_distances : ∀ v ∈ baseVectors,
    (formDistances sixForms v.1 v.2).Perm base_distances := by
  decide +kernel

theorem baseVectors_nonzero : ∀ v ∈ baseVectors,
    ∀ f ∈ sixForms, linearValue v.1 v.2 f ≠ 0 := by
  decide +kernel

theorem finite_region_row_0 : ∀ b : Fin 29,
    let s : ℤ := -37
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_1 : ∀ b : Fin 29,
    let s : ℤ := -36
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_2 : ∀ b : Fin 29,
    let s : ℤ := -35
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_3 : ∀ b : Fin 29,
    let s : ℤ := -34
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_4 : ∀ b : Fin 29,
    let s : ℤ := -33
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_5 : ∀ b : Fin 29,
    let s : ℤ := -32
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_6 : ∀ b : Fin 29,
    let s : ℤ := -31
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_7 : ∀ b : Fin 29,
    let s : ℤ := -30
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_8 : ∀ b : Fin 29,
    let s : ℤ := -29
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_9 : ∀ b : Fin 29,
    let s : ℤ := -28
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_10 : ∀ b : Fin 29,
    let s : ℤ := -27
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_11 : ∀ b : Fin 29,
    let s : ℤ := -26
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_12 : ∀ b : Fin 29,
    let s : ℤ := -25
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_13 : ∀ b : Fin 29,
    let s : ℤ := -24
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_14 : ∀ b : Fin 29,
    let s : ℤ := -23
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_15 : ∀ b : Fin 29,
    let s : ℤ := -22
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_16 : ∀ b : Fin 29,
    let s : ℤ := -21
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_17 : ∀ b : Fin 29,
    let s : ℤ := -20
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_18 : ∀ b : Fin 29,
    let s : ℤ := -19
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_19 : ∀ b : Fin 29,
    let s : ℤ := -18
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_20 : ∀ b : Fin 29,
    let s : ℤ := -17
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_21 : ∀ b : Fin 29,
    let s : ℤ := -16
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_22 : ∀ b : Fin 29,
    let s : ℤ := -15
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_23 : ∀ b : Fin 29,
    let s : ℤ := -14
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_24 : ∀ b : Fin 29,
    let s : ℤ := -13
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_25 : ∀ b : Fin 29,
    let s : ℤ := -12
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_26 : ∀ b : Fin 29,
    let s : ℤ := -11
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_27 : ∀ b : Fin 29,
    let s : ℤ := -10
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_28 : ∀ b : Fin 29,
    let s : ℤ := -9
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_29 : ∀ b : Fin 29,
    let s : ℤ := -8
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_30 : ∀ b : Fin 29,
    let s : ℤ := -7
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_31 : ∀ b : Fin 29,
    let s : ℤ := -6
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_32 : ∀ b : Fin 29,
    let s : ℤ := -5
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_33 : ∀ b : Fin 29,
    let s : ℤ := -4
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_34 : ∀ b : Fin 29,
    let s : ℤ := -3
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_35 : ∀ b : Fin 29,
    let s : ℤ := -2
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_36 : ∀ b : Fin 29,
    let s : ℤ := -1
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_37 : ∀ b : Fin 29,
    let s : ℤ := 0
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_38 : ∀ b : Fin 29,
    let s : ℤ := 1
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_39 : ∀ b : Fin 29,
    let s : ℤ := 2
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_40 : ∀ b : Fin 29,
    let s : ℤ := 3
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_41 : ∀ b : Fin 29,
    let s : ℤ := 4
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_42 : ∀ b : Fin 29,
    let s : ℤ := 5
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_43 : ∀ b : Fin 29,
    let s : ℤ := 6
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_44 : ∀ b : Fin 29,
    let s : ℤ := 7
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_45 : ∀ b : Fin 29,
    let s : ℤ := 8
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_46 : ∀ b : Fin 29,
    let s : ℤ := 9
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_47 : ∀ b : Fin 29,
    let s : ℤ := 10
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_48 : ∀ b : Fin 29,
    let s : ℤ := 11
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_49 : ∀ b : Fin 29,
    let s : ℤ := 12
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_50 : ∀ b : Fin 29,
    let s : ℤ := 13
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_51 : ∀ b : Fin 29,
    let s : ℤ := 14
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_52 : ∀ b : Fin 29,
    let s : ℤ := 15
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_53 : ∀ b : Fin 29,
    let s : ℤ := 16
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_54 : ∀ b : Fin 29,
    let s : ℤ := 17
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_55 : ∀ b : Fin 29,
    let s : ℤ := 18
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_56 : ∀ b : Fin 29,
    let s : ℤ := 19
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_57 : ∀ b : Fin 29,
    let s : ℤ := 20
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_58 : ∀ b : Fin 29,
    let s : ℤ := 21
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_59 : ∀ b : Fin 29,
    let s : ℤ := 22
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_60 : ∀ b : Fin 29,
    let s : ℤ := 23
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_61 : ∀ b : Fin 29,
    let s : ℤ := 24
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_62 : ∀ b : Fin 29,
    let s : ℤ := 25
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_63 : ∀ b : Fin 29,
    let s : ℤ := 26
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_64 : ∀ b : Fin 29,
    let s : ℤ := 27
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_65 : ∀ b : Fin 29,
    let s : ℤ := 28
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_66 : ∀ b : Fin 29,
    let s : ℤ := 29
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_67 : ∀ b : Fin 29,
    let s : ℤ := 30
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_68 : ∀ b : Fin 29,
    let s : ℤ := 31
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_69 : ∀ b : Fin 29,
    let s : ℤ := 32
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_70 : ∀ b : Fin 29,
    let s : ℤ := 33
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_71 : ∀ b : Fin 29,
    let s : ℤ := 34
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_72 : ∀ b : Fin 29,
    let s : ℤ := 35
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_73 : ∀ b : Fin 29,
    let s : ℤ := 36
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_row_74 : ∀ b : Fin 29,
    let s : ℤ := 37
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  decide +kernel

theorem finite_region_covered : ∀ a : Fin 75, ∀ b : Fin 29,
    let s : ℤ := (a.val : ℤ)-37
    let t : ℤ := (b.val : ℤ)-14
    Int.gcd s t = 1 → (formDistances sixForms s t).Nodup →
    0 ∉ formDistances sixForms s t →
    ∃ v ∈ baseVectors, GoodPeriod (s*v.2-t*v.1).natAbs := by
  intro a
  fin_cases a
  · exact finite_region_row_0
  · exact finite_region_row_1
  · exact finite_region_row_2
  · exact finite_region_row_3
  · exact finite_region_row_4
  · exact finite_region_row_5
  · exact finite_region_row_6
  · exact finite_region_row_7
  · exact finite_region_row_8
  · exact finite_region_row_9
  · exact finite_region_row_10
  · exact finite_region_row_11
  · exact finite_region_row_12
  · exact finite_region_row_13
  · exact finite_region_row_14
  · exact finite_region_row_15
  · exact finite_region_row_16
  · exact finite_region_row_17
  · exact finite_region_row_18
  · exact finite_region_row_19
  · exact finite_region_row_20
  · exact finite_region_row_21
  · exact finite_region_row_22
  · exact finite_region_row_23
  · exact finite_region_row_24
  · exact finite_region_row_25
  · exact finite_region_row_26
  · exact finite_region_row_27
  · exact finite_region_row_28
  · exact finite_region_row_29
  · exact finite_region_row_30
  · exact finite_region_row_31
  · exact finite_region_row_32
  · exact finite_region_row_33
  · exact finite_region_row_34
  · exact finite_region_row_35
  · exact finite_region_row_36
  · exact finite_region_row_37
  · exact finite_region_row_38
  · exact finite_region_row_39
  · exact finite_region_row_40
  · exact finite_region_row_41
  · exact finite_region_row_42
  · exact finite_region_row_43
  · exact finite_region_row_44
  · exact finite_region_row_45
  · exact finite_region_row_46
  · exact finite_region_row_47
  · exact finite_region_row_48
  · exact finite_region_row_49
  · exact finite_region_row_50
  · exact finite_region_row_51
  · exact finite_region_row_52
  · exact finite_region_row_53
  · exact finite_region_row_54
  · exact finite_region_row_55
  · exact finite_region_row_56
  · exact finite_region_row_57
  · exact finite_region_row_58
  · exact finite_region_row_59
  · exact finite_region_row_60
  · exact finite_region_row_61
  · exact finite_region_row_62
  · exact finite_region_row_63
  · exact finite_region_row_64
  · exact finite_region_row_65
  · exact finite_region_row_66
  · exact finite_region_row_67
  · exact finite_region_row_68
  · exact finite_region_row_69
  · exact finite_region_row_70
  · exact finite_region_row_71
  · exact finite_region_row_72
  · exact finite_region_row_73
  · exact finite_region_row_74

theorem colorable_of_good_determinant (s t : ℤ) (hcop : Int.gcd s t = 1)
    (v : ℤ × ℤ) (hv : v ∈ baseVectors)
    (hperiod : GoodPeriod (s*v.2-t*v.1).natAbs) :
    (graph (formDistances sixForms s t)).Colorable 6 := by
  apply hasPeriod_colorable (base_change sixForms s t v.1 v.2 6 hcop
    (baseVectors_nonzero v hv) ?_)
  exact hasPeriod_perm (baseVectors_distances v hv).symm
    (goodPeriod_hasPeriod _ hperiod)

/-- Every primitive vector in the third six-speed family with six
nonzero distinct distances admits an actual six-coloring. -/
theorem two_parameter_colorable (s t : ℤ) (hcop : Int.gcd s t = 1)
    (hnodup : (formDistances sixForms s t).Nodup)
    (hzero : 0 ∉ formDistances sixForms s t) :
    (graph (formDistances sixForms s t)).Colorable 6 := by
  by_cases hfirst : 38 ≤ (s-2*t).natAbs
  · apply colorable_of_good_determinant s t hcop (2,1) (by decide)
    left
    simpa only [mul_one, mul_comm t 2] using hfirst
  by_cases hsecond : 38 ≤ (s+3*t).natAbs
  · apply colorable_of_good_determinant s t hcop (3,-1) (by decide)
    left
    simpa only [show s*(-1)-t*3 = -(s+3*t) by ring, Int.natAbs_neg] using hsecond
  have hfirst' : -(37 : ℤ) ≤ s-2*t ∧ s-2*t ≤ 37 := by
    have hn : (s-2*t).natAbs ≤ 37 := by omega
    have ha : ((s-2*t).natAbs : ℤ) ≤ (37 : ℤ) := by exact_mod_cast hn
    rw [Int.natCast_natAbs] at ha
    exact abs_le.mp ha
  have hsecond' : -(37 : ℤ) ≤ s+3*t ∧ s+3*t ≤ 37 := by
    have hn : (s+3*t).natAbs ≤ 37 := by omega
    have ha : ((s+3*t).natAbs : ℤ) ≤ (37 : ℤ) := by exact_mod_cast hn
    rw [Int.natCast_natAbs] at ha
    exact abs_le.mp ha
  have hs : -37 ≤ s ∧ s ≤ 37 := by omega
  have ht : -14 ≤ t ∧ t ≤ 14 := by omega
  let a : Fin 75 := ⟨(s+37).toNat, by omega⟩
  let b : Fin 29 := ⟨(t+14).toNat, by omega⟩
  have ha : (a.val : ℤ)-37 = s := by
    dsimp [a]
    rw [Int.toNat_of_nonneg (by omega)]
    omega
  have hb : (b.val : ℤ)-14 = t := by
    dsimp [b]
    rw [Int.toNat_of_nonneg (by omega)]
    omega
  have hcover := finite_region_covered a b
  dsimp only at hcover
  rw [ha,hb] at hcover
  obtain ⟨v,hv,hvperiod⟩ := hcover hcop hnodup hzero
  exact colorable_of_good_determinant s t hcop v hv hvperiod

end OravcovaSotak
