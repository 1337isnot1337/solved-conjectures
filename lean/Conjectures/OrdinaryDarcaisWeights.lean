import Conjectures.OrdinaryDarcaisWeights000To031
import Conjectures.OrdinaryDarcaisWeights032To063
import Conjectures.OrdinaryDarcaisWeights064To095
import Conjectures.OrdinaryDarcaisWeights096To127
import Conjectures.OrdinaryDarcaisWeights128To159
import Conjectures.OrdinaryDarcaisWeights160To191
import Conjectures.OrdinaryDarcaisWeights192To223
import Conjectures.OrdinaryDarcaisWeights224To255
import Conjectures.OrdinaryDarcaisWeights256To287
import Conjectures.OrdinaryDarcaisWeights288To319
import Conjectures.OrdinaryDarcaisWeights320To351
import Conjectures.OrdinaryDarcaisWeights352To383
import Conjectures.OrdinaryDarcaisWeights384To415
import Conjectures.OrdinaryDarcaisWeights416To447
import Conjectures.OrdinaryDarcaisWeights448To479
import Conjectures.OrdinaryDarcaisWeights480To501

/-! The bounded lookup agrees with the ordinary divisor sum and the original recurrence. -/

namespace OrdinaryDarcais

theorem weightAt_eq (j : ℕ) (hj : j ≤ 501) : weightAt j = divisorSum j := by
  by_cases h31 : j ≤ 31
  · exact weights000To031 j (by omega) h31
  by_cases h63 : j ≤ 63
  · exact weights032To063 j (by omega) h63
  by_cases h95 : j ≤ 95
  · exact weights064To095 j (by omega) h95
  by_cases h127 : j ≤ 127
  · exact weights096To127 j (by omega) h127
  by_cases h159 : j ≤ 159
  · exact weights128To159 j (by omega) h159
  by_cases h191 : j ≤ 191
  · exact weights160To191 j (by omega) h191
  by_cases h223 : j ≤ 223
  · exact weights192To223 j (by omega) h223
  by_cases h255 : j ≤ 255
  · exact weights224To255 j (by omega) h255
  by_cases h287 : j ≤ 287
  · exact weights256To287 j (by omega) h287
  by_cases h319 : j ≤ 319
  · exact weights288To319 j (by omega) h319
  by_cases h351 : j ≤ 351
  · exact weights320To351 j (by omega) h351
  by_cases h383 : j ≤ 383
  · exact weights352To383 j (by omega) h383
  by_cases h415 : j ≤ 415
  · exact weights384To415 j (by omega) h415
  by_cases h447 : j ≤ 447
  · exact weights416To447 j (by omega) h447
  by_cases h479 : j ≤ 479
  · exact weights448To479 j (by omega) h479
  exact weights480To501 j (by omega) hj

theorem cachedNested_eq (n : ℕ) (h : n ≤ 500) (row : ℕ → ℕ) (m : ℕ) :
    cachedNested n row m = nestedSum n row m := by
  induction m with
  | zero => simp only [cachedNested,nestedSum,weightAt_eq (n+1) (by omega)]
  | succ m ih => simp only [cachedNested,nestedSum,weightAt_eq (n-m) (by omega),ih]

end OrdinaryDarcais
