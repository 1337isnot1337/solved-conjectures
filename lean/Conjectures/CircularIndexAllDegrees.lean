import Conjectures.CircularInsertionFamilies
import Conjectures.CircularThreeBlockTheorems
import Conjectures.TomdifCircularIndexBounds

/-! The combined answer to the Mazák–Zrubák upper-half question, using the
circulant construction, the insertion families, and tomdif's seven graphs. -/

namespace CircularIndex.Insertion

/-- Every integer maximum degree at least eight occurs for a finite simple
graph with real circular chromatic index strictly in the upper half. -/
theorem every_degree {d : ℕ} (hd : 8≤d) : UpperHalf d := by
  by_cases he : d%2=0
  · exact every_even hd he
  by_cases h₁ : d%4=1 ∧ 21≤d
  · exact every_one_mod_four h₁.2 h₁.1
  by_cases h₃ : d%4=3 ∧ 27≤d
  · obtain ⟨n,G,i,hu,ha,hx⟩ := ThreeBlock.every_three_mod_four h₃.2 h₃.1
    exact upperHalf_of_exact (n := n) ⟨G,i,hu,ha,hx⟩
  apply Tomdif.tomdif_upper_half_degrees
  simp only [Finset.mem_insert,Finset.mem_singleton]
  omega

end CircularIndex.Insertion
