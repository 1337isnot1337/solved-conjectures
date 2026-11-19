import Conjectures.LonelinessPrimeFilteringFourSearch

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def canonicalIndex (f : Fin 10) : Fin 210 := ⟨3 * f.val, by omega⟩

def canonicalCheck (f : Fin 10) : Bool :=
  (List.finRange 210).all fun j =>
    (List.finRange 210).all fun k =>
      if j ≤ k then tripleCheck (goodMask (canonicalIndex f) &&& goodMask j &&& goodMask k)
      else true

theorem canonicalCheck_zero : canonicalCheck 0 = true := by
  simpa [canonicalCheck, canonicalIndex, firstCheck] using firstCheck_zero

theorem canonicalCheck_triple (f : Fin 10) (h : canonicalCheck f = true)
    (j k : Fin 210) (hjk : j ≤ k) :
    tripleCheck (goodMask (canonicalIndex f) &&& goodMask j &&& goodMask k) = true := by
  have hj := List.all_eq_true.mp h j (List.mem_finRange j)
  have hk := List.all_eq_true.mp hj k (List.mem_finRange k)
  simpa [hjk] using hk

end Loneliness.PrimeFilteringFourProfiles
