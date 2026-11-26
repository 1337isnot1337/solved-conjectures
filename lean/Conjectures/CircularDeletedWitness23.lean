import Conjectures.CircularDeletedColoring

/-! Labelled colourings on 23 vertices in the repository certificate. -/

namespace CircularIndex.Deleted

namespace Witness28

def deleted : Finset (Sym2 (Fin 23)) := {s(0,1), s(2,3), s(4,5), s(6,7), s(8,9)}

private def rows : Array ℕ := #[
  0x3e37270a16333a060d1d202a130324192d41103000ffff,
  0x23402a1d2e08370c133d1a05313a27430f20160234ffff,
  0x1d212407311a2e412b3a04270d100a3d371713ffffffff,
  0x2943182c1f360515330b0e39251c3c08401122ffffffff,
  0x2f050142253f28321f2b3c361909391c0cffffffffffff,
  0x3b1404230a26313e07371d1a010d2d2934ffffffffffff,
  0x203a122619303d09164323021c062affffffffffffffff,
  0x2602152f220b401239052c0e1f3633ffffffffffffffff,
  0x1a17303f0d1d43031014362107ffffffffffffffffffff,
  0x2c3d332913231f001940263016ffffffffffffffffffff,
  0x42b3f35104222280a2e393cffffffffffffffffffffff,
  0x11242d1442170b1e3f0833ffffffffffffffffffffffff,
  0x140b42173f29082f0111ffffffffffffffffffffffffff,
  0x1731211a340e022528ffffffffffffffffffffffffffff,
  0x422e36041c3c2522ffffffffffffffffffffffffffffff,
  0x351b0f383b2c18ffffffffffffffffffffffffffffffff,
  0xe341b112b14ffffffffffffffffffffffffffffffffff,
  0x111392004ffffffffffffffffffffffffffffffffffff,
  0x38280701ffffffffffffffffffffffffffffffffffffff,
  0x320e3cffffffffffffffffffffffffffffffffffffffff,
  0xb1effffffffffffffffffffffffffffffffffffffffff,
  0x8ffffffffffffffffffffffffffffffffffffffffffff,
  0xffffffffffffffffffffffffffffffffffffffffffffff]

private def inverse : Array ℕ := #[
  0xffff05ffff16ffffff10ffff15ffffff11ffff03ffff06ffff0bffff14ffff08ffffff0cffff0dffffff07ffff12ffff0affff04ffff0effff13ffffff0fffff09ffff02,
  0x7ffff15ffff0dffff09ffff10ffff02ffff0affff12ffffff14ffff08ffffff16ffff05ffff13ffff0cffffff04ffff0effffff06ffff0fffffff11ffff0bffff03ffff,
  0xffff0fffffff07ffff0dffff06ffff01ffff12ffff10ffff0effffff0bffff14ffff15ffffff16ffff11ffff05ffffff04ffff09ffff0affff08ffff13ffff0cffffff00,
  0x15ffff06ffffff08ffff0bffff11ffff0effff00ffffff13ffff16ffffff0affff04ffff12ffff09ffffff14ffff0fffffff05ffff0cffff0dffff07ffff10ffff01ffff,
  0xff13ffff11ffff0cffff08ffff0bffffff0fffff16ffffff0dffff10ffff12ffff03ffff0effff07ffff0affff01ffff02ffff00ffffff06ffff09ffffff15ffffff14ff,
  0xffff00ffff0fffff16ffffff0dffff06ffff10ffffff08ffffff07ffff11ffff13ffff01ffff0cffff0bffff02ffff15ffff03ffffff09ffff12ffff0effff14ffff0aff,
  0xdffff03ffff10ffff15ffff02ffff05ffffff11ffff00ffff08ffffff13ffff0cffff16ffffff0affff12ffff0effffff14ffff01ffff04ffff0fffff09ffffff0bffff,
  0x1ffff10ffff02ffffff0effff09ffff08ffffff13ffff0cffff05ffff16ffffff12ffff0affff04ffff00ffffff14ffff0fffffff0bffff11ffff03ffff0dffff15ffff,
  0x10ffffff13ffff03ffff04ffff0cffff07ffff14ffff05ffff06ffff01ffff00ffff0bffffff11ffff16ffff15ffff0dffffff0effff12ffff02ffff0affffff0fffffff,
  0xffffff0dffff15ffff01ffffff07ffff14ffff0bffffff16ffff13ffff0cffff11ffffff10ffff03ffff0effff0affff12ffff02ffff05ffffff04ffff06ffff00ffff0f,
  0xff11ffff14ffff0bffff0cffffff13ffffff01ffff0dffff15ffff0fffff03ffff10ffff07ffff06ffff04ffff09ffff00ffff12ffff02ffff0effff08ffff16ffff05ff,
  0xff12ffff0effff0affff03ffff04ffff0cffff09ffff14ffff00ffff02ffff15ffff08ffff0fffffff05ffff11ffff13ffff16ffff07ffff10ffff0dffff01ffff06ffff,
  0xff14ffff12ffff04ffff0affff08ffff0bffffff0fffff07ffff11ffff09ffff06ffff00ffff05ffff01ffff13ffff16ffff0dffff03ffff15ffff10ffffff02ffff0eff,
  0x6ffff09ffff01ffff02ffff05ffff12ffff15ffff0affff04ffff0effff0fffffff14ffffff00ffff13ffff16ffff08ffff0cffff11ffff03ffff0bffff07ffff10ffff,
  0xff16ffff0bffff11ffff07ffff14ffff03ffffffff15ffff02ffff0dffff10ffff0fffff04ffff12ffff09ffff06ffff01ffff08ffff00ffff0affff05ffff13ffff0cff,
  0xffff02ffff05ffff12ffff13ffff16ffff04ffff0cffff11ffffff0affff0dffff0effffff0bffff15ffff10ffff03ffff07ffff14ffff01ffff06ffff00ffff08ffff09,
  0x8ffff07ffff06ffff00ffff01ffff15ffff05ffff02ffff12ffff04ffff0effff0affff09ffffff14ffff0fffffff11ffff13ffff16ffff0bffff0cffff03ffff0dffff,
  0xff0affff04ffff0effff14ffff03ffff00ffff06ffffff0fffff0cffff05ffff09ffff13ffff08ffff02ffff0bffff10ffff15ffff0dffff07ffff01ffffff12ffff16ff,
  0xff0bffff0cffffff0fffff16ffffff0dffff02ffff01ffff10ffff15ffff04ffff07ffff03ffff0effff06ffff00ffff09ffff0affff08ffff05ffff14ffff11ffff13ff,
  0xff04ffff08ffff14ffffff0fffff0affff16ffff07ffff03ffff09ffff06ffff05ffff11ffff01ffff0dffff0cffff0bffff10ffff15ffffff00ffff02ffff0effff12ff,
  0xff0cffff0affff13ffff11ffff0effff09ffff08ffff0bffff01ffff00ffff02ffff0dffff15ffff10ffff03ffff07ffff06ffff0fffffff16ffffff12ffff05ffff04ff,
  0x3ffff01ffff09ffff06ffff00ffff10ffff0dffff0effff0affff12ffffff0bffff02ffff14ffff0fffffff08ffff05ffff11ffff13ffff0cffff16ffff04ffff07ffff,
  0xff0effffff00ffff05ffff12ffff0fffff13ffff04ffff09ffff03ffff07ffff01ffff06ffff02ffff08ffff0dffff0cffff0bffff10ffff14ffff15ffffff0affff11ff]

set_option maxRecDepth 12000 in
set_option maxHeartbeats 6000000 in
private theorem checked : ∀ v, RowValid deleted 68 3 rows inverse v := by decide

/-- The density lower bound and the circular colouring of the labelled graph. -/
theorem bounds :
    (248 : ℝ)/11 ≤ circularChromaticIndex (graph 23 deleted) ∧
    circularChromaticIndex (graph 23 deleted) ≤ (68 : ℝ)/3 := by
  have hF : ∀ a ∈ deleted, ¬a.IsDiag := by
    simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq,
      Sym2.mk_isDiag_iff]
    decide
  have c := index_bounds checked (by decide) (by decide) (by decide) hF
  have hc : (Nat.choose 23 2 - deleted.card : ℕ) = 248 := by decide
  rw [hc] at c
  exact c

theorem upper_half :
    (∀ w, (graph 23 deleted).degree w ≤ 22) ∧
    (graph 23 deleted).degree 10 = 22 ∧
    (22 : ℝ)+1/2 < circularChromaticIndex (graph 23 deleted) ∧
    circularChromaticIndex (graph 23 deleted) < 23 := by
  refine ⟨fun w => ?_,degree_at_uncovered deleted 10 ?_,?_,?_⟩
  · have h := (graph 23 deleted).degree_lt_card_verts w
    rw [Fintype.card_fin] at h
    omega
  · simp only [deleted, Finset.forall_mem_insert, Finset.mem_singleton, forall_eq, Sym2.mem_iff]
    decide
  · exact lt_of_lt_of_le (by norm_num) bounds.1
  · exact lt_of_le_of_lt bounds.2 (by norm_num)

end Witness28

end CircularIndex.Deleted
