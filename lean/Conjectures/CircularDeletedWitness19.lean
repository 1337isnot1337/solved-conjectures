import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 19 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness27

def deleted : Finset (Sym2 (Fin 19)) := {s(0,1), s(2,3), s(4,5), s(6,7)}

private def rows : Array ℕ := #[
  0x25041c08351215192b0c222e311f0f2800ffff,
  0xa33072e1b211e010d15042b2427361811ffff,
  0x32142d0e0324270a352007171a2a1dffffffff,
  0x421360b2f151207322c011b1e0f24ffffffff,
  0x132d19020c270930160633212affffffffffff,
  0x19303337122d0c1622091c0306ffffffffffff,
  0x2e271634090c2110000313ffffffffffffffff,
  0x280d0a31001e0613253510ffffffffffffffff,
  0x160a0d252c36301f1929ffffffffffffffffff,
  0x1c182312320f00262fffffffffffffffffffff,
  0x1f1013280609031cffffffffffffffffffffff,
  0xd36042229332dffffffffffffffffffffffff,
  0x35242a180f1bffffffffffffffffffffffffff,
  0x12a300518ffffffffffffffffffffffffffff,
  0x221e2615ffffffffffffffffffffffffffffff,
  0x2b1b1fffffffffffffffffffffffffffffffff,
  0x1001ffffffffffffffffffffffffffffffffff,
  0x7ffffffffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff0effffff06ffff07ffff0affff03ffff12ffff08ffff05ffff10ffff0bffffff0cffff0dffff04ffff09ffffff0fffffff11ffffff02,
  0xff04ffff11ffffffff0fffff07ffffff05ffff06ffff0dffff0cffff0effff03ffff09ffffff02ffffff0affff12ffff10ffff08ffff0bff,
  0xffff0affff12ffffffff10ffff05ffff0cffff0dffffff09ffff04ffff06ffff07ffff11ffff01ffff0fffffff0bffff08ffffff0effff00,
  0xff10ffffff0affff0effff09ffffff00ffffff04ffff11ffff06ffff07ffff01ffff0dffff0cffff05ffffff0fffffff0bffff12ffff08ff,
  0xff01ffff08ffff0bffff11ffff06ffff0dffff03ffff07ffffff02ffffff10ffff0affff12ffffff00ffff0effff0cffff09ffffff0fffff,
  0xfffffff10ffff11ffff0dffff02ffff01ffffffff0affff00ffff08ffff12ffff0bffffff0effff03ffff0cffff09ffff06ffff07ffffff,
  0xffffff0fffff00ffff12ffffff04ffff11ffff01ffff0cffff03ffffff02ffffff10ffff08ffff0bffffff0dffff0effff05ffff09ffff0a,
  0xffff09ffffff0fffff00ffff01ffff12ffff0affffff04ffff0dffff03ffffff02ffffff0bffff08ffff11ffff10ffffff0cffff05ffff0e,
  0xff0dffff04ffff0cffffff0effff09ffffff0fffff00ffff0bffff05ffff0affff12ffff06ffff07ffff10ffff11ffff02ffff01ffff03ff,
  0xffff07ffff0effff0affff03ffff08ffff0bffff10ffff02ffffff12ffffff11ffff01ffff0fffff0dffff00ffff05ffff04ffff06ffff0c,
  0xffff02ffff03ffff09ffffff00ffff0fffff07ffff05ffff12ffff0bffff08ffff04ffff10ffff11ffff01ffffff0dffff0effff0cffff06,
  0xff11ffff0dffff04ffff0cffffff0effff09ffffff0fffff08ffff0affff00ffff05ffff07ffff06ffff12ffff02ffff03ffff10ffff01ff,
  0xffff12ffffffff08ffff0bffff10ffff02ffff11ffff06ffff01ffff0dffff0fffff00ffff03ffff0effff05ffff04ffff07ffff0affff09,
  0xff08ffff0bffff10ffff05ffff11ffff04ffff02ffff01ffff07ffff0cffff0effff03ffff00ffff09ffff06ffff0affffff0fffffff12ff,
  0xffff00ffff09ffff03ffff08ffff0bffff10ffffff12ffffff11ffff01ffff0dffff0fffff05ffff0cffff04ffff06ffff0affff02ffff07,
  0x5ffff06ffff07ffff01ffff12ffff0affff08ffff0bffff10ffffff11ffff0cffff0effff09ffffff02ffff03ffff00ffff0dffff04ffff,
  0xff03ffff05ffff0dffff02ffff0cffffff0effff09ffffff0fffff00ffff04ffff06ffff0affff12ffff08ffff07ffff01ffff0bffff11ff,
  0xff0bffff01ffff05ffff04ffff0dffff06ffff0cffff03ffff0effff0fffff09ffffff02ffffff0affff07ffff08ffff12ffff00ffff10ff,
  0xffff0cffff02ffffff06ffff0fffff07ffff00ffff0effff0affff09ffff05ffff08ffff04ffff10ffff0bffff01ffff11ffff03ffff0dff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 56 3 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (167 : ℝ)/9 ≤ circularChromaticIndex (graph 19 deleted) ∧
    circularChromaticIndex (graph 19 deleted) ≤ (56 : ℝ)/3 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 19 2 - deleted.card : ℕ) = 167 := by decide
  rw [hc] at c
  exact c

theorem upper_half :
    (∀ w, (graph 19 deleted).degree w ≤ 18) ∧
    (graph 19 deleted).degree 8 = 18 ∧
    (18 : ℝ)+1/2 < circularChromaticIndex (graph 19 deleted) ∧
    circularChromaticIndex (graph 19 deleted) < 19 := by
  refine ⟨fun w => ?_,degree_at_uncovered deleted 8 ?_,?_,?_⟩
  · have h := (graph 19 deleted).degree_lt_card_verts w
    rw [Fintype.card_fin] at h
    omega
  · simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq, Sym2.mem_iff]
    decide
  · exact lt_of_lt_of_le (by norm_num) bounds.1
  · exact lt_of_le_of_lt bounds.2 (by norm_num)

end Witness27

end CircularIndex.Deleted
