import Conjectures.BraunBrueggeBicyclicFiniteRows005To024
import Conjectures.BraunBrueggeBicyclicFiniteRows025To044
import Conjectures.BraunBrueggeBicyclicFiniteRows045To059
import Conjectures.BraunBrueggeBicyclicFiniteRows060To074
import Conjectures.BraunBrueggeBicyclicFiniteRows075To087
import Conjectures.BraunBrueggeBicyclicFiniteRows088To098
import Conjectures.BraunBrueggeBicyclicFiniteRows099To108
import Conjectures.BraunBrueggeBicyclicFiniteRows109To117
import Conjectures.BraunBrueggeBicyclicFiniteRows118To125
import Conjectures.BraunBrueggeBicyclicFiniteRows126To132
import Conjectures.BraunBrueggeBicyclicFiniteRows133To138
import Conjectures.BraunBrueggeBicyclicFiniteRows139To143

/-! The checked rows cover every total length in the finite base. -/

namespace BraunBruegge

theorem mixedRows_checked (l : ℕ) (lo : 5 ≤ l) (hi : l ≤ 143) : checkMixedAtTotal l = true := by
  by_cases h24 : l ≤ 24
  · exact mixedRows005To024 l (by omega) h24
  by_cases h44 : l ≤ 44
  · exact mixedRows025To044 l (by omega) h44
  by_cases h59 : l ≤ 59
  · exact mixedRows045To059 l (by omega) h59
  by_cases h74 : l ≤ 74
  · exact mixedRows060To074 l (by omega) h74
  by_cases h87 : l ≤ 87
  · exact mixedRows075To087 l (by omega) h87
  by_cases h98 : l ≤ 98
  · exact mixedRows088To098 l (by omega) h98
  by_cases h108 : l ≤ 108
  · exact mixedRows099To108 l (by omega) h108
  by_cases h117 : l ≤ 117
  · exact mixedRows109To117 l (by omega) h117
  by_cases h125 : l ≤ 125
  · exact mixedRows118To125 l (by omega) h125
  by_cases h132 : l ≤ 132
  · exact mixedRows126To132 l (by omega) h132
  by_cases h138 : l ≤ 138
  · exact mixedRows133To138 l (by omega) h138
  exact mixedRows139To143 l (by omega) hi

end BraunBruegge
