import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 17 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness22

def deleted : Finset (Sym2 (Fin 17)) := {s(0,1), s(2,3), s(4,5), s(6,7)}

private def rows : Array ℕ := #[
  0x16181412051f021a0e1d100c0a0800ffff,
  0xd0b1814110f1f1602041b00061d08ffff,
  0x1a1c0c101e15171206020e0a04ffffffff,
  0xf130a0c15191120041b170602ffffffff,
  0x1c0f1a080d1100181f1513ffffffffffff,
  0x1203100e171d1b14081f19ffffffffffff,
  0x320011e090715050cffffffffffffffff,
  0xb110e061317190900ffffffffffffffff,
  0x1416120a191b1d10ffffffffffffffffff,
  0x1071e1c030d0bffffffffffffffffffff,
  0x90d07040f13ffffffffffffffffffffff,
  0x50903010bffffffffffffffffffffffff,
  0x7011c20ffffffffffffffffffffffffff,
  0x181a16ffffffffffffffffffffffffffff,
  0x2005ffffffffffffffffffffffffffffff,
  0x1effffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff0bff07ffff09ff0fff10ff0eff0dff06ff08ff05ff04ff03ffff0cffff0aff02,
  0xff0aff03ff06ffff0eff09ff0dffff0cff0bff10ff0fffff02ff04ff07ff08ff05,
  0xffff0cff0fff10ffff0aff0bffff09ff0dff06ff0eff05ff01ff08ff04ff07ff00,
  0x9ffff01ff07ff0bff06ff0cff0fff0aff10ffff0dff0eff00ff05ff08ff04ffff,
  0xff08ffff10ff0eff09ffff07ff06ff0bff0fff0cffff00ff0dff01ff02ff03ff0a,
  0xff07ff0bff0aff06ff0cffff09ff10ff0eff0dff00ff02ff08ff03ffff0fffff01,
  0xfff0dffff01ff05ff03ff0aff04ffff00ff02ff08ffff0cff0bff09ff10ff0eff,
  0xff05ff00ff03ff0aff0bff04ff0cff0fffff0effff10ff09ffff0dff01ff02ff08,
  0xff04ff0aff0bff0cffff0fff10ff0eff09ff00ff06ff0dff05ff02ff03ff01ff07,
  0x3ff0eff0dff00ff04ff01ff05ff02ff08ffff0bff0aff07ff0fff06ff0cff10ff,
  0xff01ff08ff05ff07ff02ff06ff0bff03ff0cff0fff09ff10ff0effff0dff00ff04,
  0xff00ff05ff08ff03ff07ff02ff0aff04ff01ff09ff0cff0fff06ff10ff0eff0dff,
  0xdff02ff0effff08ff05ff03ff07ff01ff0aff04ff0bff06ff10ff00ff09ff0fff,
  0xcff06ff09ff0fff10ff0eff01ff00ff02ff05ff03ff08ff04ff07ff0affff0bff,
  0x10ff09ff0cff04ff01ff0dff00ff08ff05ff07ff02ff03ffff0aff0fff0bff06ff,
  0x6ff10ff02ff0dff00ff08ffff03ff07ff04ff0aff01ff0bff09ff0eff05ff0cff,
  0xeff0fff04ff02ff0dff00ff08ff05ffff03ff01ff07ff0aff0cff0bff06ff09ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 33 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (132 : ℝ)/8 ≤ circularChromaticIndex (graph 17 deleted) ∧
    circularChromaticIndex (graph 17 deleted) ≤ (33 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 17 2 - deleted.card : ℕ) = 132 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 17 deleted) = (33 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (132 : ℝ)/8 := by norm_num
    _ ≤ _ := bounds.1

end Witness22

namespace Witness23

def deleted : Finset (Sym2 (Fin 17)) := {s(0,1), s(0,2), s(0,3), s(0,4)}

private def rows : Array ℕ := #[
  0x111b0b0902040e071e161800ffffffffff,
  0x130f200d0611181e1a041c02090b15ffff,
  0x171901111d1b0c0320080a06130fffffff,
  0xd111e15081304011c061a1720ffffffff,
  0x151703070c191c0501101e0effffffffff,
  0x1b1d1019041f08120c0a14ffffffffffff,
  0x30512010e081020160cffffffffffffff,
  0x1f00181d1202141a0effffffffffffffff,
  0x5071403100a1218ffffffffffffffffff,
  0x90d1c0b140f16ffffffffffffffffffff,
  0x21a1f0a06ffffffffffffffffffffff,
  0x1d150d1700ffffffffffffffffffffffff,
  0x191f161bffffffffffffffffffffffffff,
  0xf1305ffffffffffffffffffffffffffff,
  0x709ffffffffffffffffffffffffffffff,
  0xbffffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff08ffff0fffff06ff07ffffffff10ffff0affff0eff0dff09ffff0bff0cff05,
  0xeff09ff06ff08ff0affff02ff10ff0bff0fff0dff03ff04ffff0cff07ff05ffff,
  0x8ffff0cff0bff0fff10ff01ff04ff0dff03ffff0aff06ff07ff05ffff09ff0eff,
  0x4ff0eff08ff06ffff05ff0dff0bff0fff02ff10ff01ffff0cff07ff0affff09ff,
  0x3ff06ff0affff0bff0fff10ff02ffff07ff05ff0cffff01ff0dff09ff0eff08ff,
  0xff0bff0fff10ff0dff03ffff06ff09ff0eff04ff08ff07ff0aff02ff0cff01ff00,
  0x9ff04ff01ff03ff00ff08ff05ff0eff0aff0cff07ff02ff0bffff0fff10ff0dff,
  0xff10ff0dffff09ff0eff00ff0aff0cff04ff08ff06ff05ff02ff03ff01ff0bff0f,
  0x2ff00ff03ff01ff09ff06ff0eff0aff0cff07ff05ff0bffff0fff10ff0dff04ff,
  0x6ff01ff0eff07ff08ff0aff0cff05ffff0bff0fff0dff10ff00ff04ff02ff03ff,
  0xff0dffff04ff0eff01ff09ff07ff08ff06ff00ff02ff0cff05ff0bff03ff0fff10,
  0xff05ff10ff02ff04ff0dff0fff03ff01ff09ff0effff08ff06ff0aff00ff07ff0c,
  0xff0fff02ff0dff10ffff0eff09ff07ff08ff06ff04ff0aff03ff01ff05ff00ff0b,
  0xff0aff07ff0cff05ff0bff03ff0fff02ff10ff01ff09ff00ff04ff0eff08ff06ff,
  0x1ff03ff09ff0aff07ff0cff08ff06ff05ffff0bff00ff0fff10ff0dff04ff02ff,
  0xff0cff05ff00ff02ff04ff0bff0dff03ff01ff09ff10ff0eff08ff06ffff0aff07,
  0xff07ff0bff05ff0cff02ff04ff01ff00ff0dff03ff0fff09ff0eff08ff06ffff0a]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 33 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (132 : ℝ)/8 ≤ circularChromaticIndex (graph 17 deleted) ∧
    circularChromaticIndex (graph 17 deleted) ≤ (33 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 17 2 - deleted.card : ℕ) = 132 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 17 deleted) = (33 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (132 : ℝ)/8 := by norm_num
    _ ≤ _ := bounds.1

end Witness23

namespace Witness24

def deleted : Finset (Sym2 (Fin 17)) := {s(0,1), s(1,2), s(2,3), s(3,4)}

private def rows : Array ℕ := #[
  0x1b0d1d040b141f1202160f09180600ffff,
  0xf111b1d0516190a14200301080cffffff,
  0x191b170d1e10020804140b1206ffffffff,
  0x1715081920120a0e101c011effffffffff,
  0xd0f0211132004160a1a1e1cffffffffff,
  0x7050e0b031a1014161820ffffffffffff,
  0x110913150d05171c1a07ffffffffffffff,
  0x5030c09011e0e1012ffffffffffffffff,
  0x1f1d0600180e080cffffffffffffffffff,
  0x1f04021a1806ffffffffffffffffffff,
  0x1d13001b150cffffffffffffffffffffff,
  0x3010a071cffffffffffffffffffffffff,
  0x907110fffffffffffffffffffffffffff,
  0x13171fffffffffffffffffffffffffffff,
  0x1519ffffffffffffffffffffffffffffff,
  0xbffffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff0aff0eff10ffff04ff07ff0bff09ffff06ff0fff0cff05ffff03ff0dff08ff02,
  0x7ffff0dff0eff0affff0bff08ffff0fff10ffff03ff09ff04ffff0cff06ff05ff,
  0xffff0cffff0fff10ff0effff07ff05ff0bffff0dff06ffff09ff04ff08ff0aff00,
  0xcff05ff07ffff0dff10ff0fffff0bff08ff09ff01ff0aff0eff00ffffffff06ff,
  0xbff06ff05ff07ff00ff09ffff0cff0dff0fff10ffff08ff01ff02ff0aff0effff,
  0x6ff03ff04ff0bff07ff08ff09ff02ff0aff0effff0dff00ff10ff0fff0cff01ff,
  0x5ff04ff09ff08ffff0aff0dff0eff10ff00ff0cff02ff0fff07ff0bff01ff03ff,
  0x1ff0bff03ff04ff05ff00ff02ff08ff09ff0aff0effff0dff06ff10ff0fff0cff,
  0xff10ff0fffff06ff0cff05ff01ff07ff03ff0bff09ff04ff0aff0eff02ff00ff0d,
  0xff0fffff06ff0cff0bff04ff05ff00ff07ff03ff08ff01ff02ff0aff0eff0dff10,
  0xff00ff10ff0dff01ff06ff0cff0fffff05ff07ff0bff03ff08ff09ff04ff02ff0e,
  0x4ff07ff0cff05ff09ff01ff00ff03ff02ff08ff0aff0effff0dff06ff10ff0fff,
  0x3ff02ff0bff09ff08ffff0aff04ff0eff0dff06ff00ff10ff0fff01ff05ff07ff,
  0xff0eff01ff0aff03ff0fff06ff10ff04ff0cff02ff05ff07ff0bffff00ff09ff08,
  0xff0dff00ff01ff0fff02ff10ff06ff0cffff05ff07ff0bff03ff08ff09ff04ff0a,
  0xff09ff08ff02ff0eff0dff03ff0aff01ff04ff00ff10ff06ff0cff05ff07ff0bff,
  0xff08ff0aff00ff02ff03ff0eff0dff06ff01ff04ff0fff0cff05ff07ff0bffff09]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 33 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (132 : ℝ)/8 ≤ circularChromaticIndex (graph 17 deleted) ∧
    circularChromaticIndex (graph 17 deleted) ≤ (33 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 17 2 - deleted.card : ℕ) = 132 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 17 deleted) = (33 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (132 : ℝ)/8 := by norm_num
    _ ≤ _ := bounds.1

end Witness24

namespace Witness25

def deleted : Finset (Sym2 (Fin 17)) := {s(0,1), s(1,2), s(2,3), s(3,0)}

private def rows : Array ℕ := #[
  0x2050e1207151709101e1c0b19ff00ffff,
  0xe010c1e131b1920040a10151706ffffff,
  0x40718091102151c0c0e1a131fffffffff,
  0x81c02200f04111a0a0c1e1713ffffffff,
  0xf040d151d1b0b02060811ffffffffff,
  0x1b0d1f0709190f051d0103ffffffffffff,
  0xc201218010a05160e14ffffffffffffff,
  0x121a101c2008031816ffffffffffffffff,
  0x61808141b001f12ffffffffffffffffff,
  0x101e1401030d07ffffffffffffffffffff,
  0x1d09000b0d13ffffffffffffffffffffff,
  0x1f11060f17ffffffffffffffffffffffff,
  0x190b1d05ffffffffffffffffffffffffff,
  0x16031affffffffffffffffffffffffffff,
  0xa16ffffffffffffffffffffffffffffff,
  0x14ffffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff07ff06ffff04ff0aff0bffff0dff08ff0effff05ff09ff0cff0fffff10ff02,
  0x9ff0dffff0bff0aff04ff05ff0cffff06ff10ff0eff07ffffff03ff08ffff0fff,
  0xff04ffff09ff06ff0effff0aff05ff0cffff07ff08ffff0dff0fffff10ff0bff00,
  0xdff06ff0fff09ffff05ffffff04ff0aff0cffff07ff08ff10ff01ff0bff0effff,
  0xff02ff0bff0aff00ff01ff0cff03ff05ff0fff0dff09ffff06ff07ff0eff08ff10,
  0xff0eff08ff10ff0bff03ff01ff02ff04ff0aff0fff00ff0cff0dff09ff06ff07ff,
  0xfff03ff00ff02ff0dff09ff07ff0eff01ff08ff10ff0bff04ffff0aff05ff0cff,
  0xcff00ff0dff0fff09ff08ff06ff10ff0eff02ff03ff01ff0bff04ffff0aff05ff,
  0xff0aff05ff0cffff0fff07ff0dff09ff00ff06ff02ff03ff0eff10ff01ff04ff0b,
  0x1ff0fff02ff03ff07ff06ff0eff08ff10ffff0bff04ff00ff0aff05ff0cff0dff,
  0xff08ff10ff04ff01ff00ff02ff0bff03ff05ff0cff0dff0fff09ff06ff07ffff0e,
  0xff10ff04ff01ff05ff0cff00ff0aff0fff0dff09ffff06ff07ff0eff03ff02ff08,
  0x7ffff0eff08ff10ff0bff04ff01ff02ff03ff0aff0fff05ff00ff0dff09ff06ff,
  0x3ff01ff07ff0eff06ff10ff08ff00ffff0bff04ff0aff02ff05ff0cff0fff09ff,
  0xff05ff0cffff0dff02ff0fff09ff06ff07ff00ff01ff10ff08ff0bff04ff03ff0a,
  0x6ff09ff03ff07ff08ff0eff10ffff0bff04ff05ff0cff0aff02ff00ff0dff01ff,
  0xff0bff0aff05ff0cffff0dff0fff07ff09ff01ff06ff0eff03ff08ff02ff00ff04]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 33 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (132 : ℝ)/8 ≤ circularChromaticIndex (graph 17 deleted) ∧
    circularChromaticIndex (graph 17 deleted) ≤ (33 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 17 2 - deleted.card : ℕ) = 132 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 17 deleted) = (33 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (132 : ℝ)/8 := by norm_num
    _ ≤ _ := bounds.1

end Witness25

namespace Witness26

def deleted : Finset (Sym2 (Fin 17)) := {s(0,1), s(1,2), s(2,0), s(3,4)}

private def rows : Array ℕ := #[
  0x91a16040b181c061f0d02121400ffffff,
  0x20140419071c1e170e090b100112ffffff,
  0x10e0c08131a20150603170a101dffffff,
  0x3100e1f1905071b0a17150cffffffffff,
  0x716121d1b0309190c051f0effffffffff,
  0x1c18140600161a02081e04ffffffffffff,
  0x1108061b0f0d131d0019ffffffffffffff,
  0xf01201511070b131bffffffffffffffff,
  0x181210021d141604ffffffffffffffffff,
  0xd0a08001f110fffffffffffffffffffff,
  0x50318110d01ffffffffffffffffffffff,
  0xb201e0f09ffffffffffffffffffffffff,
  0x15050217ffffffffffffffffffffffffff,
  0x130c0affffffffffffffffffffffffffff,
  0x1a1cffffffffffffffffffffffffffffff,
  0x1effffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xff08ffff0aff0fff0bff0eff04ff05ffffffff07ff0cff10ffff09ff0dff06ff03,
  0x10ff0aff0bffff0dff09ffff0fff03ff05ff08ffff06ff07ff0cffff0effff04ff,
  0xaffff03ffff0bffff06ff09ff0cffff04ff0fff0eff05ff0dff08ffff07ff10ff,
  0xff0dff02ff09ff0cff07ff06ffff01ff0fff0eff05ff08ffff0aff0bff10ffff00,
  0xff06ff0dff0cff09ffff0fff00ff0eff02ff05ff08ffff0aff10ff07ff0bff01ff,
  0xffff07ff10ff0aff0fff0bff0eff00ff01ff04ff03ff02ff08ff0dff06ff09ff0c,
  0xff04ff09ff0dff07ff02ff03ff0aff10ff0cff0bff01ffff0fff0eff05ff00ff08,
  0xeff05ffff08ff06ff03ff0dff09ff0cff10ff00ff0aff01ff0bff04ff02ff0fff,
  0xff00ff0cff07ffff10ff0aff0bff0fff0eff01ff04ff03ff05ff02ff09ff0dff06,
  0xff0cff06ff03ff04ff01ff02ff07ff0bff0aff10ffff0fff0eff00ff08ff05ff0d,
  0x2ff01ff00ff05ff0eff08ffff06ff0dff09ff0cff07ff04ff03ff10ff0fff0bff,
  0xfff0eff01ff02ff00ff05ff08ffff09ff0dff06ff10ff0cff07ff03ff04ff0aff,
  0xff09ff08ff04ff03ff0dff10ff02ff07ff06ff0aff00ff0bff01ff0fffff0eff05,
  0xff03ff04ff06ff01ff0cff07ff10ff0aff0bffff0fff0eff02ff05ff00ff08ff09,
  0x7ff0bff0fff10ff0aff00ff05ff04ff08ff03ff02ff0dff09ff06ff01ff0cffff,
  0xbff10ff0eff00ff05ff04ff01ff08ff03ff02ff0dff09ff06ffff0cff0aff07ff,
  0x1ff0fff05ff0eff08ffff0cff0dff06ff07ff09ff0bff00ff04ff0aff03ff02ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 33 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (132 : ℝ)/8 ≤ circularChromaticIndex (graph 17 deleted) ∧
    circularChromaticIndex (graph 17 deleted) ≤ (33 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 17 2 - deleted.card : ℕ) = 132 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 17 deleted) = (33 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (132 : ℝ)/8 := by norm_num
    _ ≤ _ := bounds.1

end Witness26

end CircularIndex.Deleted
