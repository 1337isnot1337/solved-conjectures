import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 15 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness21

def deleted : Finset (Sym2 (Fin 15)) := {s(0,1), s(2,3), s(4,5)}

private def rows : Array ℕ := #[
  0x1418102506031f0d0a221c2800ffff,
  0x111b072803180a000d2515211effff,
  0xe150a22291b0726041812ffffffff,
  0x171e132b0c061003241b09ffffffff,
  0x10c2005260f19232affffffffffff,
  0xb0f041f1215012907ffffffffffff,
  0x27210116191e1310ffffffffffffff,
  0x1a061d13200916ffffffffffffffff,
  0x42a0d1c2327ffffffffffffffffff,
  0x2112240c00ffffffffffffffffffff,
  0x1d09160fffffffffffffffffffffff,
  0x80219ffffffffffffffffffffffff,
  0x2a27ffffffffffffffffffffffffff,
  0x24ffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffffff03ffff0bffff05ffff08ffff04ffffff0dffffff0effffff0cffff07ffff06ffffff0affff09ffff02,
  0xffffff0bffff05ffffff03ffff02ffff0dffff09ffff04ffffff0effffff06ffff08ffff0cffffff0affff07,
  0xffff0affff07ffffff0bffffff01ffff09ffff05ffff0dffff04ffffff0effffff0cffff08ffff06ffffff00,
  0xbffff00ffffff06ffff01ffff0dffff05ffffff0effffff0cffff08ffffff0affff04ffff09ffff07ffffff,
  0xff06ffffff0affff07ffff0cffffff00ffff08ffffff01ffff02ffff09ffff0dffff03ffffff0bffffff0eff,
  0xffff07ffffff01ffff00ffff0bffffff03ffff02ffff09ffff0affff0dffffff0effffff06ffff0cffff08ff,
  0xff04ffff0effff03ffff0dffff09ffffffff0affff0bffff08ffff07ffff01ffff00ffff05ffff02ffff0cff,
  0xffff05ffff02ffff04ffff0affff0cffff0effffff08ffff0bffff06ffff00ffffff09ffff0dffff03ffff01,
  0xff0dffff09ffffff0affffff00ffff0bffff04ffff07ffff06ffff03ffff0cffff01ffff02ffff0effff05ff,
  0xffffffff08ffff0cffff0effff06ffff02ffff01ffff05ffff0dffff04ffff0bffff07ffff03ffff00ffff0a,
  0xffff02ffff04ffff08ffff07ffff0effffff06ffff0cffffff05ffff0bffff03ffff0dffff00ffff01ffff09,
  0x3ffff01ffff00ffff02ffff05ffff08ffff0cffff06ffff07ffffff0affff09ffffff0effff04ffff0dffff,
  0xff0effff0dffff09ffffff04ffff07ffffff0bffff0affff03ffff00ffff08ffff02ffff01ffff05ffff06ff,
  0xff08ffff0cffff0effff06ffff03ffff01ffff00ffff02ffff09ffff05ffff04ffff0affff07ffffff0bffff,
  0xff0cffff06ffff0dffff09ffffff0affff07ffff03ffff00ffff01ffff02ffff05ffff0bffffff08ffff04ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 44 3 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (102 : ℝ)/7 ≤ circularChromaticIndex (graph 15 deleted) ∧
    circularChromaticIndex (graph 15 deleted) ≤ (44 : ℝ)/3 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 15 2 - deleted.card : ℕ) = 102 := by decide
  rw [hc] at c
  exact c

theorem upper_half :
    (∀ w, (graph 15 deleted).degree w ≤ 14) ∧
    (graph 15 deleted).degree 6 = 14 ∧
    (14 : ℝ)+1/2 < circularChromaticIndex (graph 15 deleted) ∧
    circularChromaticIndex (graph 15 deleted) < 15 := by
  refine ⟨fun w => ?_,degree_at_uncovered deleted 6 ?_,?_,?_⟩
  · have h := (graph 15 deleted).degree_lt_card_verts w
    rw [Fintype.card_fin] at h
    omega
  · simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq, Sym2.mem_iff]
    decide
  · exact lt_of_lt_of_le (by norm_num) bounds.1
  · exact lt_of_le_of_lt bounds.2 (by norm_num)

end Witness21

end CircularIndex.Deleted
