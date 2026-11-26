import Conjectures.CircularThreeBlockDegree
import Conjectures.CircularThreeBlockUnique
import Conjectures.CircularFiniteIndexTheorems

/-! Theorem A for every permitted packing, Proposition B's finite witnesses,
and the complete degree range in Corollary C. -/

namespace CircularIndex.Insertion.ThreeBlock

/-- The vertices are labelled 0 through 6g. Exactly the labels 6, 7 and 8
have degree one below the maximum, independently of the permitted packing. -/
theorem theorem_A {g : ℕ} (hg : 15≤g) (K : Packing g) :
    let G := (schedule hg K).graph
    (∀ v, G.degree v = if v.val=6 ∨ v.val=7 ∨ v.val=8 then 4*g+2 else 4*g+3) ∧
    (∀ v, G.degree v≤4*g+3) ∧ (∃ v, G.degree v=4*g+3) ∧
    circularChromaticIndex G=((4*g+3 : ℕ) : ℝ)+2/3 :=
  ⟨degree_formula hg K,graph_degree_and_index hg K⟩

/-- Corollary C, combining the nine stored graphs with the unbounded family. -/
theorem every_three_mod_four {d : ℕ} (hd : 27≤d) (hm : d%4=3) :
    Deleted.ExactUpperHalf d := by
  let g := d/4
  have he : d=4*g+3 := by dsimp [g]; omega
  have h₆ : 6≤g := by omega
  rw [he]
  by_cases h : g≤14
  · exact Deleted.finite_three_block h₆ h
  · have hg : 15≤g := by omega
    let K := canonicalPacking hg
    exact ⟨vertexCount g,(schedule hg K).graph,Classical.decRel _,graph_degree_and_index hg K⟩

end CircularIndex.Insertion.ThreeBlock
