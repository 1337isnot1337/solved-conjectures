import Mathlib.Tactic.IntervalCases
import Conjectures.CircularDeletedWitnesses
import Conjectures.CircularInsertionDegree25
import Conjectures.CircularInsertionDegree26
import Conjectures.CircularInsertionDegree27
import Conjectures.CircularInsertionDegree31
import Conjectures.CircularInsertionDegree35
import Conjectures.CircularInsertionDegree39
import Conjectures.CircularInsertionDegree43
import Conjectures.CircularInsertionDegree47
import Conjectures.CircularInsertionDegree51
import Conjectures.CircularInsertionDegree55
import Conjectures.CircularInsertionDegree59

/-! Published finite circular-index colourings of deleted graphs and the insertion examples. -/

namespace CircularIndex.Deleted

/-- A labelled simple graph attaining its maximum degree and the exact real circular index. -/
def ExactUpperHalf (degree : ℕ) : Prop :=
  ∃ (n : ℕ) (G : SimpleGraph (Fin n)) (i : DecidableRel G.Adj),
    letI := i
    (∀ v, G.degree v ≤ degree) ∧ (∃ v, G.degree v = degree) ∧
      circularChromaticIndex G = (degree : ℝ) + 2/3

theorem insertion_example {n d p : ℕ} (G : SimpleGraph (Fin n)) [DecidableRel G.Adj]
    (v : Fin n) (hp : p = 3*d+2)
    (h : (∀ w, G.degree w ≤ d) ∧ G.degree v = d ∧ circularChromaticIndex G = (p : ℝ)/3) :
    ExactUpperHalf d := by
  refine ⟨n,G,inferInstance,h.1,⟨v,h.2.1⟩,?_⟩
  rw [h.2.2,hp]
  push_cast
  ring

/-- Both one- and two-block graphs at the exceptional base parameter six. -/
theorem insertion_at_six : ExactUpperHalf 25 ∧ ExactUpperHalf 26 := by
  constructor
  · exact insertion_example _ _ (by decide) Degree25.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree26.exact_index_and_degree

/-- Proposition B, the full finite range of the three-block family. -/
theorem finite_three_block {g : ℕ} (hg : 6 ≤ g) (hg' : g ≤ 14) : ExactUpperHalf (4*g+3) := by
  interval_cases g
  · exact insertion_example _ _ (by decide) Degree27.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree31.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree35.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree39.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree43.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree47.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree51.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree55.exact_index_and_degree
  · exact insertion_example _ _ (by decide) Degree59.exact_index_and_degree

end CircularIndex.Deleted
