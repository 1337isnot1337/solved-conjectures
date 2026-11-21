import Conjectures.CircularIndexConnected

/-!
# Complete main circulant construction theorems

These endpoints combine the degree, vertex connectivity, and real circular
chromatic index assertions of Theorems 1 and 2 in the written proof at
`results/circular-index-upper-half-circulants/PROOF.md`.
-/

namespace CircularIndex

theorem theorem_one (g : ℕ) (hg : 2 ≤ g) :
    (graph g).IsRegularOfDegree (4 * g) ∧
    (∀ T : Finset (ZMod (order g)), T.card < 4 * g →
      ((graph g).induce (↑T : Set (ZMod (order g)))ᶜ).Connected) ∧
    circularChromaticIndex (graph g) = 4 * (g : ℝ) + 2 / 3 :=
  ⟨circulant_regular g hg, circulant_vertex_connected g hg,
    circulant_circularChromaticIndex_closed_form g hg⟩

theorem theorem_two :
    graph25.IsRegularOfDegree 18 ∧
    (∀ T : Finset (ZMod 25), T.card < 18 →
      (graph25.induce (↑T : Set (ZMod 25))ᶜ).Connected) ∧
    circularChromaticIndex graph25 = 75 / 4 :=
  ⟨graph25_regular, graph25_vertex_connected, graph25_circularChromaticIndex⟩

end CircularIndex
