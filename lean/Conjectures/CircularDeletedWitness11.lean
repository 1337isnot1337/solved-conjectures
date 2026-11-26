import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 11 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness10

def deleted : Finset (Sym2 (Fin 11)) := {s(0,1), s(2,3)}

private def rows : Array ℕ := #[
  0x19070e0a161d120300ffff,
  0x20a140d1f1118061cffff,
  0xb041107190e15ffffffff,
  0x1f0d171009141bffffffff,
  0xf011e040c08ffffffffff,
  0x5170b1a02ffffffffffff,
  0x1c100513ffffffffffffff,
  0x161e01ffffffffffffffff,
  0x81affffffffffffffffff,
  0x13ffffffffffffffffffff,
  0xffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff05ffffff0affff06ffffff04ffffff08ffffff07ffff09ffffff03ffff02,
  0x6ffff02ffffff04ffffff08ffff05ffffff07ffff09ffffff03ffffff0affff,
  0xffffff01ffff06ffffff04ffffff08ffff05ffff0affffff07ffff09ffffff00,
  0xaffffff04ffffff08ffff05ffffff07ffff09ffffff06ffff01ffff00ffffff,
  0xff08ffff03ffff01ffff02ffff00ffff0affff06ffffff05ffffff07ffff09ff,
  0xffff00ffff07ffff09ffff03ffff01ffff02ffff08ffff04ffff0affff06ffff,
  0x1ffff0affff02ffff00ffff07ffff09ffffff04ffff03ffffff08ffff05ffff,
  0xff09ffffff05ffffff0affff06ffff03ffff01ffff00ffff02ffff04ffff08ff,
  0xff04ffffff09ffff03ffff01ffff02ffff00ffff05ffff0affff06ffffff07ff,
  0xff07ffffff08ffff05ffffff0affff06ffff03ffff01ffff00ffff02ffff04ff,
  0x3ffff06ffff00ffff07ffff09ffffff04ffffff02ffff08ffff05ffff01ffff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 32 3 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (53 : ℝ)/5 ≤ circularChromaticIndex (graph 11 deleted) ∧
    circularChromaticIndex (graph 11 deleted) ≤ (32 : ℝ)/3 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 11 2 - deleted.card : ℕ) = 53 := by decide
  rw [hc] at c
  exact c

theorem upper_half :
    (∀ w, (graph 11 deleted).degree w ≤ 10) ∧
    (graph 11 deleted).degree 4 = 10 ∧
    (10 : ℝ)+1/2 < circularChromaticIndex (graph 11 deleted) ∧
    circularChromaticIndex (graph 11 deleted) < 11 := by
  refine ⟨fun w => ?_,degree_at_uncovered deleted 4 ?_,?_,?_⟩
  · have h := (graph 11 deleted).degree_lt_card_verts w
    rw [Fintype.card_fin] at h
    omega
  · simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq, Sym2.mem_iff]
    decide
  · exact lt_of_lt_of_le (by norm_num) bounds.1
  · exact lt_of_le_of_lt bounds.2 (by norm_num)

end Witness10

namespace Witness11

def deleted : Finset (Sym2 (Fin 11)) := {s(0,1), s(2,3), s(4,5)}

private def rows : Array ℕ := #[
  0x5130f07030a0d1100ffff,
  0xb0402101406120d08ffff,
  0x130a1103050c0fffffffff,
  0xf02070509000bffffffff,
  0x906041401ffffffffffff,
  0x308130e10ffffffffffff,
  0x70e0b12ffffffffffffff,
  0x10c09ffffffffffffffff,
  0xd00ffffffffffffffffff,
  0x11ffffffffffffffffffff,
  0xffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff09ff03ff08ff04ffff05ffff07ff0aff06ffff02,
  0x6ff04ff07ffff03ff0affff02ff05ff09ff08ffff,
  0xff0aff08ff04ffff05ff09ff01ffff06ff07ffff00,
  0xffffff00ff0aff01ff04ff06ff08ff07ffff09ff05,
  0x7ff01ffff02ff00ff03ff0affff09ff08ffff06ff,
  0xff08ffff06ff07ff02ff00ff09ff01ffff0affff03,
  0x1ff07ff05ff09ffff08ff03ff0aff02ff00ff04ff,
  0x4ff06ff01ff05ff09ffff08ff00ff03ff02ff0aff,
  0xff05ff02ff00ff0aff06ff07ff03ffff04ff01ff09,
  0xff00ff0affff06ff07ff02ff05ff04ff01ff03ff08,
  0xff02ff09ff03ff08ff01ff04ff06ff00ff05ff07ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 21 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (52 : ℝ)/5 ≤ circularChromaticIndex (graph 11 deleted) ∧
    circularChromaticIndex (graph 11 deleted) ≤ (21 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 11 2 - deleted.card : ℕ) = 52 := by decide
  rw [hc] at c
  exact c

end Witness11

namespace Witness12

def deleted : Finset (Sym2 (Fin 11)) := {s(0,1), s(1,2), s(0,2)}

private def rows : Array ℕ := #[
  0x120f0803050d0a00ffffff,
  0x100b0e1401090604ffffff,
  0x80d0601030b1311ffffff,
  0x613020a0c0f08ffffffff,
  0xc0204100e00ffffffffff,
  0x211130507ffffffffffff,
  0x14091012ffffffffffffff,
  0xe070cffffffffffffffff,
  0xa00ffffffffffffffffff,
  0x4ffffffffffffffffffff,
  0xffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff0affff09ff05ffff04ff08ffff06ff07ffff03,
  0x7ffffff0aff08ffff09ff05ffff04ff03ffff06ff,
  0xff04ff03ffffff09ff05ffff0aff08ffff06ff07ff,
  0xff09ff02ff05ffff06ff07ff04ff0aff01ff08ff00,
  0xff02ffff07ff06ff0aff00ff03ff01ff08ff09ff05,
  0xff08ff09ff03ff00ff02ff01ff06ff07ffff0aff04,
  0xaff07ff08ff04ff03ffff09ff05ff00ff02ff01ff,
  0x1ff06ff04ff0aff08ff03ffff09ff05ff00ff02ff,
  0xff05ffff06ff01ff07ff0aff00ff02ff04ff03ff09,
  0xff03ff05ff00ff02ff01ff06ff07ffff0aff04ff08,
  0x6ff00ff01ff07ff04ff08ff02ff03ff09ff05ffff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 21 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (52 : ℝ)/5 ≤ circularChromaticIndex (graph 11 deleted) ∧
    circularChromaticIndex (graph 11 deleted) ≤ (21 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 11 2 - deleted.card : ℕ) = 52 := by decide
  rw [hc] at c
  exact c

end Witness12

namespace Witness13

def deleted : Finset (Sym2 (Fin 11)) := {s(0,1), s(0,2), s(0,3)}

private def rows : Array ℕ := #[
  0x13110e07030c00ffffffff,
  0x204100b120e080600ffff,
  0xd1305090710020bffffff,
  0xf02140d090411ffffffff,
  0x4060c130f0affffffffff,
  0x608120114ffffffffffff,
  0xb0d0105ffffffffffffff,
  0x110f03ffffffffffffffff,
  0x80affffffffffffffffff,
  0xffffffffffffffffffff,
  0xffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff0aff09ffff08ff05ffffffff07ffffff06ffff04,
  0xffff06ff08ff05ffff07ffff04ff03ff09ff0aff02,
  0xff09ffff05ffff0aff03ff07ff06ff08ffff04ff01,
  0x8ffff04ff0aff07ff02ff06ffff01ff05ff09ffff,
  0xff07ff03ff06ffff08ff05ff01ff09ff0aff02ff00,
  0x6ff08ff02ff01ff00ff04ff09ff0aff03ffff07ff,
  0x5ff01ffff04ff09ff0aff03ff02ff07ff00ff08ff,
  0xff04ff0aff09ff03ff01ff02ff00ff06ff08ff05ff,
  0x3ff05ff01ff00ff04ff09ff0affff02ff07ff06ff,
  0xff02ff00ff07ff06ffff08ff05ff04ff01ff03ff0a,
  0xff00ff07ff03ff02ff06ffff08ff05ff04ff01ff09]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 21 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (52 : ℝ)/5 ≤ circularChromaticIndex (graph 11 deleted) ∧
    circularChromaticIndex (graph 11 deleted) ≤ (21 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 11 2 - deleted.card : ℕ) = 52 := by decide
  rw [hc] at c
  exact c

end Witness13

namespace Witness14

def deleted : Finset (Sym2 (Fin 11)) := {s(0,1), s(1,2), s(2,3)}

private def rows : Array ℕ := #[
  0xe04110813060c0200ffff,
  0x1080d120f0a1404ffffff,
  0x5020f0c11080affffffff,
  0x9060b100d1412ffffffff,
  0x30e05010710ffffffffff,
  0x120c010e03ffffffffffff,
  0xb000905ffffffffffffff,
  0x140a03ffffffffffffffff,
  0x713ffffffffffffffffff,
  0x10ffffffffffffffffffff,
  0xffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff06ff08ffff0aff04ffffff07ff05ff09ff03ff02,
  0x4ff07ffff06ff08ffff05ff09ffffff03ffff0aff,
  0xffffff06ff08ffff07ff04ff05ffff0affff09ff00,
  0x5ff04ff07ffff06ff08ff0affff09ff01ff00ffff,
  0x1ff03ff05ff09ff00ff02ffff06ff08ff0aff07ff,
  0x3ff0aff04ff07ff09ff01ff02ff00ffff06ff08ff,
  0xff00ff02ff01ff03ff0aff08ff04ff07ff05ffff09,
  0xaff01ff03ff05ff02ff09ff00ffff06ff08ff04ff,
  0xff09ff00ff02ff01ff03ff06ff0aff04ff07ff05ff,
  0xff08ffff0aff04ff05ff07ff01ff03ff00ff02ff06,
  0x7ff05ff09ff00ffff06ff03ff08ff02ff04ff01ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 21 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (52 : ℝ)/5 ≤ circularChromaticIndex (graph 11 deleted) ∧
    circularChromaticIndex (graph 11 deleted) ≤ (21 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 11 2 - deleted.card : ℕ) = 52 := by decide
  rw [hc] at c
  exact c

end Witness14

namespace Witness15

def deleted : Finset (Sym2 (Fin 11)) := {s(0,1), s(1,2), s(3,4)}

private def rows : Array ℕ := #[
  0xe0710130c02050900ffff,
  0xa030c0f08061401ffffff,
  0xc050e070a130311ffffff,
  0x60b040d130fffffffffff,
  0x1001120b0e08ffffffffff,
  0xd0a1104ffffffffffff,
  0x2100600ffffffffffffff,
  0x40902ffffffffffffffff,
  0x814ffffffffffffffffff,
  0x12ffffffffffffffffffff,
  0xffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff07ffff08ff0aff06ffff03ff09ff04ffff05ff02,
  0x4ffffffff07ffff08ff0aff06ff05ffff09ff03ff,
  0xff05ff03ffff08ff0aff06ffff07ff09ff04ffff00,
  0xff06ff02ff05ff07ff09ff00ffff0aff08ffff01ff,
  0x1ff08ff0aff06ffff07ffff05ffff00ff02ff09ff,
  0xff02ff07ff03ff09ffff08ff04ff01ff06ff00ff0a,
  0xff03ffff09ff04ff00ff02ff01ff08ff05ff0aff07,
  0xff00ff05ff01ff03ff04ff09ff02ffff0aff08ff06,
  0x9ff04ff00ff02ff01ff05ff0aff06ff03ff07ffff,
  0x8ff0aff06ffff05ff03ff07ff00ff02ff01ff04ff,
  0xffff09ff04ff00ff02ff01ff08ff03ff07ff06ff05]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 21 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (52 : ℝ)/5 ≤ circularChromaticIndex (graph 11 deleted) ∧
    circularChromaticIndex (graph 11 deleted) ≤ (21 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 11 2 - deleted.card : ℕ) = 52 := by decide
  rw [hc] at c
  exact c

end Witness15

end CircularIndex.Deleted
