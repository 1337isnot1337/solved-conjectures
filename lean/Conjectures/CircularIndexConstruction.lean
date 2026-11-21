import Conjectures.CircularIndexDegree
import Conjectures.CircularIndexFinite25

/-!
# The regular graphs and their exact real circular chromatic indices

This root records the graph and coloring conclusions of Theorems 1 and 2.
The vertex-connectivity conclusions are separate assertions: this module
does not assert them or replace them with ordinary connectedness.
-/

namespace CircularIndex

theorem circulant_regular_and_exact_index (g : ℕ) (hg : 2 ≤ g) :
    (graph g).IsRegularOfDegree (4 * g) ∧
      circularChromaticIndex (graph g) = 4 * (g : ℝ) + 2 / 3 :=
  ⟨circulant_regular g hg, circulant_circularChromaticIndex_closed_form g hg⟩

theorem graph25_regular_and_exact_index :
    graph25.IsRegularOfDegree 18 ∧ circularChromaticIndex graph25 = 75 / 4 :=
  ⟨graph25_regular, graph25_circularChromaticIndex⟩

end CircularIndex
