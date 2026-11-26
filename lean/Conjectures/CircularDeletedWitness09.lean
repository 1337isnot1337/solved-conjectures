import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 9 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness03

def deleted : Finset (Sym2 (Fin 9)) := {s(0,1), s(1,2)}

private def rows : Array ℕ := #[
  0x9040e070c0200ffff,
  0x7020c050a0fffffff,
  0x50f0a03080dffffff,
  0xb00060904ffffffff,
  0x106100effffffffff,
  0x100b01ffffffffffff,
  0x308ffffffffffffff,
  0xdffffffffffffffff,
  0xffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff06ff04ffff08ff05ffff07ff03ff02,
  0xff03ffff06ff04ffff08ff05ffff07ffff,
  0xff07ff03ffff06ff04ffff08ff05ffff00,
  0xff01ff02ff08ff05ffff06ff04ff00ff07,
  0x6ff05ff00ff01ff02ff07ff03ffff08ff,
  0x8ff04ffff07ff03ff00ff01ff02ff06ff,
  0x4ff00ff01ff02ff07ff03ffff08ff05ff,
  0xff02ff08ff05ffff06ff04ff00ff01ff03,
  0x5ffff07ff03ff00ff01ff02ff06ff04ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 17 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (34 : ℝ)/4 ≤ circularChromaticIndex (graph 9 deleted) ∧
    circularChromaticIndex (graph 9 deleted) ≤ (17 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 9 2 - deleted.card : ℕ) = 34 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 9 deleted) = (17 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (34 : ℝ)/4 := by norm_num
    _ ≤ _ := bounds.1

end Witness03

namespace Witness04

def deleted : Finset (Sym2 (Fin 9)) := {s(0,1), s(2,3)}

private def rows : Array ℕ := #[
  0xd060f0a080200ffff,
  0xb080d01100604ffff,
  0x702090e0cffffffff,
  0x9040b100effffffff,
  0x10a0503ffffffffff,
  0x50c07ffffffffffff,
  0x300ffffffffffffff,
  0xfffffffffffffffff,
  0xffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff06ff08ffff05ff04ff07ffffff03ff02,
  0x4ffff06ff08ffff07ff03ff02ffff05ff,
  0xffff05ff04ffff06ff08ffff01ff07ff00,
  0x5ff04ffff06ff08ffff01ff07ff00ffff,
  0x1ff03ff02ff07ff00ffff06ff05ff08ff,
  0x3ff02ff07ff00ffff06ff08ff04ff01ff,
  0xff00ff01ff03ff02ff05ff04ff08ffff07,
  0xff08ffff05ff04ff01ff00ff03ff02ff06,
  0xff07ff00ff01ff03ff02ff05ff06ff04ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 17 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (34 : ℝ)/4 ≤ circularChromaticIndex (graph 9 deleted) ∧
    circularChromaticIndex (graph 9 deleted) ≤ (17 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 9 2 - deleted.card : ℕ) = 34 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 9 deleted) = (17 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (34 : ℝ)/4 := by norm_num
    _ ≤ _ := bounds.1

end Witness04

namespace Witness05

def deleted : Finset (Sym2 (Fin 9)) := {s(0,1), s(1,2), s(0,2)}

private def rows : Array ℕ := #[
  0xf0c03080600ffffff,
  0xa0e07000204ffffff,
  0x81005020b0dffffff,
  0x2080b060fffffffff,
  0x4090dffffffffff,
  0x40a0fffffffffffff,
  0xd01ffffffffffffff,
  0x6ffffffffffffffff,
  0xffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff08ffff07ffffff05ff04ffff06ffff03,
  0xffff07ffffff08ffff06ffff03ff04ff05,
  0x7ffff03ff04ffff08ffff06ffff05ffff,
  0xff04ff02ff06ffff07ff05ff01ff08ff00,
  0xff03ff05ff02ff06ffff00ff07ff01ff08,
  0xff06ff04ffff07ff00ff03ff08ff02ff01,
  0xff05ff08ff03ff04ff01ff02ff00ff07ff,
  0x2ff01ff00ff05ff03ff08ff04ffff06ff,
  0xff00ff06ffff01ff02ff07ff05ff03ff04]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 17 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (33 : ℝ)/4 ≤ circularChromaticIndex (graph 9 deleted) ∧
    circularChromaticIndex (graph 9 deleted) ≤ (17 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 9 2 - deleted.card : ℕ) = 33 := by decide
  rw [hc] at c
  exact c

end Witness05

namespace Witness06

def deleted : Finset (Sym2 (Fin 9)) := {s(0,1), s(1,2), s(2,3)}

private def rows : Array ℕ := #[
  0x402090e060c00ffff,
  0xe080b030006ffffff,
  0x80a0d0502ffffffff,
  0xa0f040108ffffffff,
  0xc040f0affffffffff,
  0x100c07ffffffffffff,
  0x200ffffffffffffff,
  0x6ffffffffffffffff,
  0xffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff05ff03ffff06ffff04ff08ff07ff02,
  0xffff08ffff06ffff07ff03ffff05ffff04,
  0xffffff06ffff07ff08ffff05ffff04ff00,
  0xff07ffff00ff08ff04ff01ff06ffff05ff,
  0xff06ffff08ff05ff03ff00ff07ff02ff01,
  0x8ff00ff07ff04ffff06ff02ff01ff03ff,
  0xff04ff02ff01ff00ff05ffff03ff08ff07,
  0xff03ffff05ff02ff01ff08ff04ff00ff06,
  0x5ff01ff04ff03ff02ff07ff00ff06ffff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 17 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (33 : ℝ)/4 ≤ circularChromaticIndex (graph 9 deleted) ∧
    circularChromaticIndex (graph 9 deleted) ≤ (17 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 9 2 - deleted.card : ℕ) = 33 := by decide
  rw [hc] at c
  exact c

end Witness06

namespace Witness07

def deleted : Finset (Sym2 (Fin 9)) := {s(0,1), s(0,2), s(0,3)}

private def rows : Array ℕ := #[
  0x4070e0200ffffffff,
  0xd0b01060f0408ffff,
  0xf050c000a02ffffff,
  0xb09100d06ffffffff,
  0x20d0804ffffffffff,
  0x80f0affffffffffff,
  0x603ffffffffffffff,
  0xffffffffffffffff,
  0xffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff06ffffffffffff07ffff08ff05ff04,
  0xff04ff08ff07ffff02ff05ff03ffff06ff,
  0xff08ffff06ff04ff01ffff07ffff03ff05,
  0x6ffff05ff08ff07ffff04ff01ff02ffff,
  0xff01ff07ffff02ff06ff03ff05ff08ff00,
  0xff07ff03ffff06ff08ff01ff04ff00ff02,
  0x3ff00ff02ff05ff04ff08ffff07ff01ff,
  0xff05ff04ff01ff03ff00ff02ff06ffff08,
  0xff02ff01ff03ffff05ff06ff00ff04ff07]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 17 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (33 : ℝ)/4 ≤ circularChromaticIndex (graph 9 deleted) ∧
    circularChromaticIndex (graph 9 deleted) ≤ (17 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 9 2 - deleted.card : ℕ) = 33 := by decide
  rw [hc] at c
  exact c

end Witness07

namespace Witness08

def deleted : Finset (Sym2 (Fin 9)) := {s(0,1), s(1,2), s(3,4)}

private def rows : Array ℕ := #[
  0xc0705090e0200ffff,
  0x6010a0d1004ffffff,
  0x8030c0f0a06ffffff,
  0x100e080bffffffffff,
  0x10c0307ffffffffff,
  0x30501ffffffffffff,
  0xe10ffffffffffffff,
  0xaffffffffffffffff,
  0xffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff04ff08ffff05ff07ff06ffff03ff02,
  0x4ffff05ffff06ffffff08ff03ffff07ff,
  0xff05ffff06ff04ff08ff03ffff07ffff00,
  0x8ff07ffff05ffff06ff02ff01ff00ffff,
  0x1ff00ff07ff02ffff05ffffff06ff08ff,
  0xff02ff01ff03ff00ff04ff07ff08ff06ff,
  0x7ff08ff02ff01ff03ffff00ff04ff05ff,
  0x6ff03ff04ff08ffff00ff05ff02ff01ff,
  0x3ff06ff00ff07ff02ff01ffff05ff04ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 17 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (33 : ℝ)/4 ≤ circularChromaticIndex (graph 9 deleted) ∧
    circularChromaticIndex (graph 9 deleted) ≤ (17 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 9 2 - deleted.card : ℕ) = 33 := by decide
  rw [hc] at c
  exact c

end Witness08

namespace Witness09

def deleted : Finset (Sym2 (Fin 9)) := {s(0,1), s(2,3), s(4,5)}

private def rows : Array ℕ := #[
  0xc020a070f0400ffff,
  0x100d020904060bffff,
  0x3080f050dffffffff,
  0x80f00020bffffffff,
  0x10608ffffffffffff,
  0xe000cffffffffffff,
  0x604ffffffffffffff,
  0xaffffffffffffffff,
  0xffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff04ffff08ff06ffff05ffff03ff07ff02,
  0x8ffff07ff02ff05ffff03ff04ff06ffff,
  0xff06ff04ff01ffff07ffff05ff08ffff00,
  0xff07ffffff04ffff08ff01ff00ff05ff06,
  0xff00ff02ff03ffff06ff07ff01ffff08ff,
  0xffff08ff06ffff01ff00ff02ffff03ff07,
  0xff02ffff05ff00ff04ff08ff07ff01ff03,
  0xff03ff01ffff08ff02ff04ff06ff00ff05,
  0x1ff05ff00ff07ff03ff06ffff02ff04ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 17 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (33 : ℝ)/4 ≤ circularChromaticIndex (graph 9 deleted) ∧
    circularChromaticIndex (graph 9 deleted) ≤ (17 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 9 2 - deleted.card : ℕ) = 33 := by decide
  rw [hc] at c
  exact c

end Witness09

end CircularIndex.Deleted
