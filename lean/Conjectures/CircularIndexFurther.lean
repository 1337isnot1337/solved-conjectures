import Conjectures.CircularIndexConstruction
import Conjectures.CircularIndexFinite31
import Conjectures.CircularIndexFinite33

/-!
# The additional regular examples of Section 7.2

This root records the 31-vertex and 33-vertex graph constructions and
their exact real circular chromatic indices.  Vertex connectivity is
proved separately.  The nonregular insertion examples and the search
exclusion claims of Section 7 are not assertions of this module.
-/

namespace CircularIndex

theorem graph31_regular_and_exact_index :
    graph31.IsRegularOfDegree 18 ∧ circularChromaticIndex graph31 = 93 / 5 :=
  ⟨graph31_regular, graph31_circularChromaticIndex⟩

theorem graph33_regular_and_exact_index :
    graph33.IsRegularOfDegree 24 ∧ circularChromaticIndex graph33 = 99 / 4 :=
  ⟨graph33_regular, graph33_circularChromaticIndex⟩

end CircularIndex
