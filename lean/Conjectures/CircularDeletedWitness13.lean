import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 13 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness16

def deleted : Finset (Sym2 (Fin 13)) := {s(0,1), s(1,2), s(0,2)}

private def rows : Array ℕ := #[
  0x121407040d16020f0900ffffff,
  0xe0c140a050317001108ffffff,
  0x160a05020f181113070cffffff,
  0xa0e12061710040215ffffffff,
  0x11803130b050f0dffffffffff,
  0x6040b17110915ffffffffffff,
  0x8060d00130bffffffffffffff,
  0x1412010e07ffffffffffffffff,
  0x3010915ffffffffffffffffff,
  0xc0810ffffffffffffffffffff,
  0x1816ffffffffffffffffffffff,
  0x10ffffffffffffffffffffffff,
  0xffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff07ff0bff0cffff05ff08ffffff04ff0affff09ff06ff03,
  0xff06ffff0affff04ffff0cff0bff09ff03ffff08ff07ffff05,
  0x7ff0cffff05ff06ff08ffff03ff0bffff04ff0affff09ffff,
  0xff08ff04ffff0aff07ff0bff02ff0cff01ff09ff06ff05ff00,
  0xbffff03ff09ff01ff06ff05ff08ff00ff02ff07ff0aff0cff,
  0xff09ff06ff02ff08ff00ff04ff0aff07ffff0cff0bff03ff01,
  0xff01ff05ff08ff02ff04ff0aff07ffff0cff0bff03ff00ff09,
  0x2ff00ff0cff0bff03ff09ffff06ff05ff08ff04ff01ff0aff,
  0xff03ff09ff06ff05ff02ff00ff04ff0aff07ff01ff0cff0bff,
  0xff05ff08ff04ffff0aff07ff0cff01ff0bff03ff00ff02ff06,
  0xcff0bff01ff03ff09ffff06ff05ff08ff00ff02ff04ff07ff,
  0x4ff0aff00ff07ff0cff03ff01ff02ff09ff06ff05ffff08ff,
  0xaff02ff07ff00ff0bff01ff09ff03ff06ff05ffff08ff04ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 25 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (75 : ℝ)/6 ≤ circularChromaticIndex (graph 13 deleted) ∧
    circularChromaticIndex (graph 13 deleted) ≤ (25 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 13 2 - deleted.card : ℕ) = 75 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 13 deleted) = (25 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (75 : ℝ)/6 := by norm_num
    _ ≤ _ := bounds.1

end Witness16

namespace Witness17

def deleted : Finset (Sym2 (Fin 13)) := {s(0,1), s(2,3), s(4,5)}

private def rows : Array ℕ := #[
  0xf170703050c0a11151300ffff,
  0x11000f0b080604130d1502ffff,
  0xb060d091404120f17ffffffff,
  0x70209050e100c1700ffffffff,
  0x9040b07120210ffffffffffff,
  0xd1503010a0806ffffffffffff,
  0x1081814160effffffffffffff,
  0x160a141218ffffffffffffffff,
  0x30c0110ffffffffffffffffff,
  0x180e16ffffffffffffffffffff,
  0x511ffffffffffffffffffffff,
  0x13ffffffffffffffffffffffff,
  0xffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff0bff04ff03ff05ff0cffff07ff06ffff0aff08ff09ffff02,
  0xffffff03ff05ff0cff0aff04ff09ffff08ff07ff06ff02ff0b,
  0xff04ffff08ff06ffff05ff0aff0cff09ffff0bff07ff01ff00,
  0xff05ff01ff00ffff07ff08ff06ffff0aff0cff09ffff0bff04,
  0xff02ff00ffff08ff06ffff01ff0aff0cff09ffff0bff07ff03,
  0xff03ff0bff01ff00ff02ff0cffff08ff07ff06ffff0aff09ff,
  0xaff08ff09ff02ff04ff07ff03ff00ff0bff05ff01ffff0cff,
  0x8ff0cff0aff09ff03ff06ff00ff0bff05ff01ff02ff04ffff,
  0x7ff06ff02ff04ff09ff03ff0bff05ff01ffff00ff0cff0aff,
  0xcff0aff06ff07ff08ff0bffff01ff02ff04ff03ff00ff05ff,
  0x6ff09ff07ffff0bff01ff02ff04ff03ff00ff0cff05ff08ff,
  0xff00ff05ff0cff0affff09ff08ff07ff06ff02ff04ff03ff01,
  0x9ff07ffff0bff01ff00ff05ff02ff04ff03ff0aff08ff06ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 25 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (75 : ℝ)/6 ≤ circularChromaticIndex (graph 13 deleted) ∧
    circularChromaticIndex (graph 13 deleted) ≤ (25 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 13 2 - deleted.card : ℕ) = 75 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 13 deleted) = (25 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (75 : ℝ)/6 := by norm_num
    _ ≤ _ := bounds.1

end Witness17

namespace Witness18

def deleted : Finset (Sym2 (Fin 13)) := {s(0,1), s(1,2), s(2,3)}

private def rows : Array ℕ := #[
  0xc07030a15050e10121700ffff,
  0x60d0904020b10161814ffffff,
  0x40f07020d09141216ffffffff,
  0x20905000b07120e10ffffffff,
  0xe05010c08030a14ffffffffff,
  0xa03180806010cffffffffffff,
  0x80116060418ffffffffffffff,
  0x15110d130fffffffffffffffff,
  0x171311ffffffffffffffffff,
  0x17150fffffffffffffffffffff,
  0x110bffffffffffffffffffffff,
  0x13ffffffffffffffffffffffff,
  0xffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff03ff08ffff04ff05ff06ff0cff09ffff0bff07ff0affff02,
  0x4ff05ff03ffffff06ffff0bff07ff0affff0cff09ff08ffff,
  0xffff04ff06ff05ffff0bff08ffffff07ff0affff0cff09ff00,
  0xff00ffff01ff06ff04ff05ffff08ff0bff07ff0affff0cff09,
  0x1ff02ff05ff00ff03ff0cff09ff06ff08ffff0bff07ff0aff,
  0xaff01ff04ff02ff00ff03ff06ff0cff09ff08ffff0bff07ff,
  0x7ff0aff02ff03ff01ff00ff05ff04ff0cff09ff08ffff0bff,
  0x6ffff0cff09ff0bff08ff0aff01ff02ff03ff00ff04ff05ff,
  0xff0bff00ff0aff09ff07ff02ff03ffff04ff05ff06ff01ff0c,
  0xff0cff0bff07ff08ff0affff04ff00ff05ff06ff01ff02ff03,
  0x5ff06ffff08ff0cff09ff07ff0bff01ff02ff03ff00ff04ff,
  0xff08ff09ff0cff07ff02ff01ff0aff03ff00ff04ff05ff06ff,
  0xff09ff07ff0bff0affff04ff00ff05ff06ff01ff02ff03ff08]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 25 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (75 : ℝ)/6 ≤ circularChromaticIndex (graph 13 deleted) ∧
    circularChromaticIndex (graph 13 deleted) ≤ (25 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 13 2 - deleted.card : ℕ) = 75 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 13 deleted) = (25 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (75 : ℝ)/6 := by norm_num
    _ ≤ _ := bounds.1

end Witness18

namespace Witness19

def deleted : Finset (Sym2 (Fin 13)) := {s(0,1), s(0,2), s(0,3)}

private def rows : Array ℕ := #[
  0x50f13070911170c00ffffffff,
  0x160d1118140f06080a0301ffff,
  0x181108030513150e0c0affffff,
  0x113170507150c100effffffff,
  0x1002041216060814ffffffffff,
  0x1204061618020affffffffffff,
  0xe0002101204ffffffffffffff,
  0x917000b0dffffffffffffffff,
  0x30b0f01ffffffffffffffffff,
  0x14090dffffffffffffffffffff,
  0xb15ffffffffffffffffffffff,
  0x7ffffffffffffffffffffffff,
  0xffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff06ffffff0aff07ff0bffff05ffff08ff09ff0cffffffff04,
  0x9ff0cff08ffff0aff07ff0bffff04ff05ff06ffff03ff02ff,
  0xcffff06ff07ff0bffff05ff04ff03ff0affff08ff09ff01ff,
  0xff0aff07ff0bffff05ff04ff06ff02ffff08ff09ff01ff0cff,
  0xffff08ff05ff09ff0cff03ff02ff01ff06ff07ff0aff0bff00,
  0x8ff09ff04ff0cff03ff02ff00ff06ff01ff0aff0bff07ffff,
  0xff00ff02ffff08ff09ff0cff03ff05ff04ff01ff07ff0aff0b,
  0xff0bff03ff02ff00ff01ff08ff09ff0cffff04ff06ff05ff0a,
  0x5ff04ff01ff06ffff0aff07ff0bff00ff03ff02ff0cff09ff,
  0x1ff05ff0cff04ff06ffff0aff07ff0bff00ff03ff02ff08ff,
  0xff03ff0bff00ff01ff08ff09ff0cffff02ff05ff04ff06ff07,
  0xff07ff0aff03ff02ff00ff01ff08ff09ff0cffff05ff04ff06,
  0x2ff01ff09ff05ff04ff06ffff0aff07ff0bff00ff08ff03ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 25 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (75 : ℝ)/6 ≤ circularChromaticIndex (graph 13 deleted) ∧
    circularChromaticIndex (graph 13 deleted) ≤ (25 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 13 2 - deleted.card : ℕ) = 75 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 13 deleted) = (25 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (75 : ℝ)/6 := by norm_num
    _ ≤ _ := bounds.1

end Witness19

namespace Witness20

def deleted : Finset (Sym2 (Fin 13)) := {s(0,1), s(1,2), s(3,4)}

private def rows : Array ℕ := #[
  0x9120402161014070d0b00ffff,
  0x71811130c150305090fffffff,
  0xb0e1704100612090214ffffff,
  0x11160d0608040118ffffffffff,
  0xf0515171200070bffffffffff,
  0xd010f11031316ffffffffffff,
  0x5100a0c180effffffffffffff,
  0x170c02080affffffffffffffff,
  0x114060effffffffffffffffff,
  0x150a00ffffffffffffffffffff,
  0x1308ffffffffffffffffffffff,
  0x3ffffffffffffffffffffffff,
  0xffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff08ff06ff0bff07ffff04ff03ff0cff05ffff0aff09ff02,
  0xbffff07ff09ff0aff03ffff08ffff04ff0cff05ff06ffffff,
  0xff0affff03ff06ff08ff0bffff0cff05ffff07ff09ff04ff00,
  0x5ff0bff02ffff0cff01ff0aff00ffff08ff09ff07ffff06ff,
  0xff09ff0affff08ffff0cff00ff05ff01ff06ff0bffff02ff07,
  0x3ff06ffff07ff09ff0aff0cff04ff02ff00ff01ff08ff0bff,
  0x8ff05ff00ff02ff0bff07ff09ff0affff04ff0cff01ff03ff,
  0xff0cff01ff05ffff00ff06ff0bff08ff09ff02ff03ff0aff04,
  0x6ff00ff0bff04ff02ff09ff01ff07ff03ff0affff05ff0cff,
  0xff04ff0cff01ff05ffff08ff06ff0bff07ff03ff02ff00ff0a,
  0xff02ff04ff0cff01ff05ff03ffff06ff0bff08ff00ff07ff09,
  0x1ff03ff08ff00ff06ff02ff07ff09ff0affff04ff0cff05ff,
  0xff07ff09ff0aff03ff04ff05ff02ff00ff01ff06ff0bff08ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 25 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (75 : ℝ)/6 ≤ circularChromaticIndex (graph 13 deleted) ∧
    circularChromaticIndex (graph 13 deleted) ≤ (25 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 13 2 - deleted.card : ℕ) = 75 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 13 deleted) = (25 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (75 : ℝ)/6 := by norm_num
    _ ≤ _ := bounds.1

end Witness20

end CircularIndex.Deleted
