import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 7 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness01

def deleted : Finset (Sym2 (Fin 7)) := {s(0,1), s(1,2)}

private def rows : Array ℕ := #[
  0x8020b0500ffff,
  0xc080603ffffff,
  0xa040207ffffff,
  0x10b09ffffffff,
  0x400ffffffffff,
  0x6ffffffffffff,
  0xffffffffffffff]

private def inverse : Array ℕ := #[
  0xff04ffff06ffff03ffff05ff02,
  0x6ffffff05ff04ffff03ffffff,
  0xffff06ffff03ffff05ff04ff00,
  0xff05ff04ff02ff00ff01ff06ff,
  0xff00ff03ffff01ff06ff02ff05,
  0xff03ffff01ff06ff02ff00ff04,
  0x1ff02ff00ff05ff04ffff03ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 13 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (19 : ℝ)/3 ≤ circularChromaticIndex (graph 7 deleted) ∧
    circularChromaticIndex (graph 7 deleted) ≤ (13 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 7 2 - deleted.card : ℕ) = 19 := by decide
  rw [hc] at c
  exact c

end Witness01

namespace Witness02

def deleted : Finset (Sym2 (Fin 7)) := {s(0,1), s(2,3)}

private def rows : Array ℕ := #[
  0x702040b00ffff,
  0x1040b0608ffff,
  0x50a02ffffffff,
  0x30800ffffffff,
  0x906ffffffffff,
  0xcffffffffffff,
  0xffffffffffffff]

private def inverse : Array ℕ := #[
  0xff03ffffff06ffff04ff05ff02,
  0xff04ffff02ff03ff05ffff06ff,
  0xffff05ff01ffff06ffff04ff00,
  0xff00ffff05ff01ffff06ffff04,
  0xff01ff06ffff05ff00ff02ff03,
  0x6ff02ff03ff04ff01ff00ffff,
  0x5ffff04ff00ff02ff03ff01ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 13 2 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (19 : ℝ)/3 ≤ circularChromaticIndex (graph 7 deleted) ∧
    circularChromaticIndex (graph 7 deleted) ≤ (13 : ℝ)/2 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 7 2 - deleted.card : ℕ) = 19 := by decide
  rw [hc] at c
  exact c

end Witness02

end CircularIndex.Deleted
