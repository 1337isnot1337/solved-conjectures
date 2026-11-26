import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 25 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness29

def deleted : Finset (Sym2 (Fin 25)) := {s(0,1), s(0,2), s(0,3), s(1,2), s(1,3), s(2,3)}

private def rows : Array ℕ := #[
  0xd063029221b14032d261f18110a160f08012b241dffffffff,
  0x1b140d063029220b042e272019121e171009022c25ffffffff,
  0x1d160f08012b243029221b140d062019120b042e27ffffffff,
  0x19120b042e2720150e07002a231c2c251e17100902ffffffff,
  0x2908192f132d0c1b06152b0e210410230a1f0017ffffffffff,
  0xf20051a0313300d1c0115280b222a1126071effffffffffff,
  0x270c210a1a061623081c2f122914182d0e25ffffffffffffff,
  0x132811210d1d2e0f230519301b2a03152cffffffffffffffff,
  0x2f18281424041a2a0c20062200161c02ffffffffffffffffff,
  0x1f2f1b2b0b210513270d29071d0009ffffffffffffffffffff,
  0x5220112280c262e14300e24071affffffffffffffffffffff,
  0x2d0e260c200218281024081e2fffffffffffffffffffffffff,
  0x152d1327091f03172b0f2505ffffffffffffffffffffffffff,
  0x31a2e10260a1c01162c0cffffffffffffffffffffffffffff,
  0x2104172d11230a1d0213ffffffffffffffffffffffffffffff,
  0xb1e03182a1128091affffffffffffffffffffffffffffffff,
  0x250a1f00182f1221ffffffffffffffffffffffffffffffffff,
  0x1126071f05192cffffffffffffffffffffffffffffffffffff,
  0x1102a0e1e08ffffffffffffffffffffffffffffffffffffff,
  0x170015250fffffffffffffffffffffffffffffffffffffffff,
  0x71c2c16ffffffffffffffffffffffffffffffffffffffffff,
  0x23021dffffffffffffffffffffffffffffffffffffffffffff,
  0x924ffffffffffffffffffffffffffffffffffffffffffffff,
  0x2bffffffffffffffffffffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0x16ffff10ff06ff15ffff0fff05ff14ffff0eff04ff13ffff0dff0aff12ffff0cff09ff18ffff0bff08ff17ffff11ff07ff,
  0x14ff0fff05ffff13ff0eff04ffff12ff0dff0affff18ff0cff09ffff17ff0bff08ffff16ff11ff07ffff15ff10ff06ffff,
  0x11ff05ffff13ff10ff04ffff12ff0fff0affff18ff0eff09ffff17ff0dff08ffff16ff0cff07ffff15ff0bff06ffff14ff,
  0xffff14ff0aff0dffff13ff09ff0cffff12ff08ff0bffff18ff07ff11ffff17ff06ff10ffff16ff05ff0fffff15ff04ff0e,
  0xff15ff13ff0eff18ff02ff01ff09ff0cff07ff00ff11ff16ff05ff0fff14ffff0aff0dff12ff08ff17ff10ff0bff03ff06,
  0x12ff02ff01ff0aff0dff08ff00ff0bff17ff06ff10ff15ffff04ff0eff13ff09ff18ff11ff0cff03ff07ff16ff14ff0fff,
  0xff0eff09ff00ff0cff18ff07ff11ff16ffff05ff0fff14ff0aff12ff0bff0dff03ff08ff17ff15ff10ff13ff02ff01ff04,
  0xdff12ff08ff0bff17ffff06ff10ff15ff04ff13ff0cff0eff03ff09ff18ff16ff11ff14ff02ff01ff05ff0fff0aff00ff,
  0xff18ffff07ff11ff16ff05ff14ff0dff0fff03ff0aff12ff17ff0bff15ff02ff01ff06ff10ff04ff00ff0eff13ff09ff0c,
  0xff17ff06ff15ff0eff10ff03ff04ff13ff18ff0cff16ff02ff01ff07ff11ff05ff00ff0fff14ff0aff0dff12ffff08ff0b,
  0xfff11ff03ff05ff14ff12ff0dff17ff02ff01ff08ff0bff06ff00ff10ff15ff04ff0eff13ffff09ff0cff18ff07ff16ff,
  0xff0cff18ffff07ff11ff16ff0fff05ff14ff0dff03ff0aff12ff08ff06ff01ff10ff17ff15ff00ff0eff02ff04ff13ff09,
  0xff0bff17ff10ff06ff15ff0eff03ff04ff13ff09ff07ff01ff11ff18ff16ff00ff0fff02ff05ff14ff0aff0dff12ffff08,
  0x7ff16ff0fff03ff05ff14ff0aff08ff01ff0bff12ff17ff00ff10ff02ff06ff15ff04ff0eff13ffff09ff0cff18ff11ff,
  0xff06ff15ff04ff09ff01ff0cff13ff18ff00ff11ff02ff07ff16ff05ff0fff14ffff0aff0dff12ff0bff08ff17ff10ff03,
  0xaff01ff0dff14ff12ff00ff0bff02ff08ff17ff06ff10ff15ffff04ff0eff13ff0cff09ff18ff11ff03ff07ff16ff05ff,
  0xff13ff00ff0cff02ff09ff18ff07ff11ff16ffff05ff0fff14ff0dff0aff12ff0bff03ff08ff17ff06ff04ff01ff0eff15,
  0x2ff0aff12ff08ff0bff17ffff06ff10ff15ff0eff04ff13ff0cff03ff09ff18ff07ff05ff01ff0fff16ff14ff00ff0dff,
  0x5ff07ff11ff16ff0fff0aff02ff01ff03ff14ff0dff08ff0bff06ff00ff10ff17ff15ff04ff0eff13ffff09ff0cff18ff,
  0xff10ff04ff02ff01ff03ff15ff0eff09ff0cff07ff00ff11ff18ff16ff05ff0fff14ffff0aff0dff12ff06ff08ff0bff17,
  0x1ff03ff16ff0fff0aff0dff08ff00ff0bff12ff17ff06ff10ff15ffff04ff0eff13ff07ff09ff0cff18ff11ff05ff02ff,
  0xff04ff0eff09ff00ff0cff13ff18ff07ff11ff16ffff05ff0fff14ff08ff0aff0dff12ff0bff06ff02ff01ff03ff17ff10,
  0xff0dff14ff12ff08ff0bff17ffff06ff10ff15ff09ff04ff0eff13ff0cff07ff02ff01ff03ff18ff11ff05ff0fff0aff,
  0xff09ff0cff18ffff07ff11ff16ff0aff05ff0fff14ff0dff08ff02ff01ff03ff12ff0bff06ff10ff04ff00ff0eff15ff13,
  0xff08ff0bff17ff04ff06ff10ff15ff0eff09ff02ff01ff03ff13ff0cff07ff11ff05ff00ff0fff16ff14ff0aff0dff12ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 49 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (294 : ℝ)/12 ≤ circularChromaticIndex (graph 25 deleted) ∧
    circularChromaticIndex (graph 25 deleted) ≤ (49 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 25 2 - deleted.card : ℕ) = 294 := by decide
  rw [hc] at c
  exact c

theorem exact_index : circularChromaticIndex (graph 25 deleted) = (49 : ℝ)/2 := by
  apply le_antisymm bounds.2
  calc
    _ = (294 : ℝ)/12 := by norm_num
    _ ≤ _ := bounds.1

end Witness29

end CircularIndex.Deleted
