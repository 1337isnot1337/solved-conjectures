import Conjectures.LonelinessSevenCoordinateCoverage
import Conjectures.LonelinessSevenCoordinateCase000
import Conjectures.LonelinessSevenCoordinateCase001
import Conjectures.LonelinessSevenCoordinateCase010
import Conjectures.LonelinessSevenCoordinateCase011
import Conjectures.LonelinessSevenCoordinateCase100
import Conjectures.LonelinessSevenCoordinateCase101
import Conjectures.LonelinessSevenCoordinateCase110
import Conjectures.LonelinessSevenCoordinateCase111
import Conjectures.LonelinessSevenCoordinateCase200
import Conjectures.LonelinessSevenCoordinateCase201
import Conjectures.LonelinessSevenCoordinateCase210
import Conjectures.LonelinessSevenCoordinateCase211
import Conjectures.LonelinessSevenCoordinateCase300
import Conjectures.LonelinessSevenCoordinateCase301
import Conjectures.LonelinessSevenCoordinateCase310
import Conjectures.LonelinessSevenCoordinateCase311
import Conjectures.LonelinessSevenCoordinateCase400
import Conjectures.LonelinessSevenCoordinateCase401
import Conjectures.LonelinessSevenCoordinateCase410
import Conjectures.LonelinessSevenCoordinateCase411
import Conjectures.LonelinessSevenCoordinateCase500
import Conjectures.LonelinessSevenCoordinateCase501
import Conjectures.LonelinessSevenCoordinateCase510
import Conjectures.LonelinessSevenCoordinateCase511

namespace Loneliness.SevenCoordinateCritical.Finite

/-- All finite sign and bounded-coordinate cases. -/
theorem all_reduced_cases (k : Fin 6) (left right : Bool) (a b c : Fin 12) :
    CaseValid k left right a b c := by
  fin_cases k <;> cases left <;> cases right
  · exact cases_000 a b c
  · exact cases_001 a b c
  · exact cases_010 a b c
  · exact cases_011 a b c
  · exact cases_100 a b c
  · exact cases_101 a b c
  · exact cases_110 a b c
  · exact cases_111 a b c
  · exact cases_200 a b c
  · exact cases_201 a b c
  · exact cases_210 a b c
  · exact cases_211 a b c
  · exact cases_300 a b c
  · exact cases_301 a b c
  · exact cases_310 a b c
  · exact cases_311 a b c
  · exact cases_400 a b c
  · exact cases_401 a b c
  · exact cases_410 a b c
  · exact cases_411 a b c
  · exact cases_500 a b c
  · exact cases_501 a b c
  · exact cases_510 a b c
  · exact cases_511 a b c

/-- Finite classification from the literal repeat-line and tangent conditions.
The geometric bridge separately proves these conditions from a plane-value bound. -/
theorem productForm_of_necessary_conditions (k : Fin 6) (z : Vector)
    (hcandidate : Candidate z) (hne : ∀ i, z i ≠ 0)
    (hbound : ∀ i, |z i| ≤ 6)
    (hpairs : ∀ a : Fin 6, k ≠ a → k ≠ a.rev →
      (6-(a.val : ℤ)) * z a.castSucc = ((a.val : ℤ)+1) * z a.rev.castSucc)
    (htests : RepeatTests (canonical k) z) : ProductForm (canonical k) z := by
  obtain ⟨left, right, a, b, c, rfl⟩ := exists_reduced k z hne hbound hpairs
  exact all_reduced_cases k left right a b c hcandidate htests

end Loneliness.SevenCoordinateCritical.Finite
