import Conjectures.BraunBrueggeThetaOptimizerRows011To042
import Conjectures.BraunBrueggeThetaOptimizerRows043To067
import Conjectures.BraunBrueggeThetaOptimizerRows068To085
import Conjectures.BraunBrueggeThetaOptimizerRows086To098
import Conjectures.BraunBrueggeThetaOptimizerRows099To109
import Conjectures.BraunBrueggeThetaOptimizerRows110To118
import Conjectures.BraunBrueggeThetaOptimizerRows119To125
import Conjectures.BraunBrueggeThetaOptimizerRows126To132
import Conjectures.BraunBrueggeThetaOptimizerRows133To138
import Conjectures.BraunBrueggeThetaOptimizerRows139To143

/-! All finite rows of the theta optimizer comparison. -/

namespace BraunBruegge

theorem thetaOptimizerRows_checked (l : ℕ) (lo : 11 ≤ l) (hi : l ≤ 143) : checkThetaOptimizerAtTotal l = true := by
  by_cases h42 : l ≤ 42
  · exact thetaOptimizerRows011To042 l (by omega) h42
  by_cases h67 : l ≤ 67
  · exact thetaOptimizerRows043To067 l (by omega) h67
  by_cases h85 : l ≤ 85
  · exact thetaOptimizerRows068To085 l (by omega) h85
  by_cases h98 : l ≤ 98
  · exact thetaOptimizerRows086To098 l (by omega) h98
  by_cases h109 : l ≤ 109
  · exact thetaOptimizerRows099To109 l (by omega) h109
  by_cases h118 : l ≤ 118
  · exact thetaOptimizerRows110To118 l (by omega) h118
  by_cases h125 : l ≤ 125
  · exact thetaOptimizerRows119To125 l (by omega) h125
  by_cases h132 : l ≤ 132
  · exact thetaOptimizerRows126To132 l (by omega) h132
  by_cases h138 : l ≤ 138
  · exact thetaOptimizerRows133To138 l (by omega) h138
  exact thetaOptimizerRows139To143 l (by omega) hi

end BraunBruegge
