import Conjectures.LonelinessPrimeFilteringFourProfiles
import Mathlib.Data.List.FinRange

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def row (w : ℕ) (j : ℕ) : ℕ := (w >>> (7 * j)) % 128

def safeRows (w : ℕ) : Bool :=
  (List.range 5).any fun j => rowSafe (row w j)

def lastCheck (w : ℕ) : Bool :=
  (List.finRange 210).all fun l => decide (w &&& goodMask l ≠ 0)

def tripleCheck (w : ℕ) : Bool := safeRows w || lastCheck w

def firstCheck (i : Fin 210) : Bool :=
  (List.finRange 210).all fun j =>
    if i ≤ j then
      (List.finRange 210).all fun k =>
        if j ≤ k then tripleCheck (goodMask i &&& goodMask j &&& goodMask k) else true
    else true

theorem firstCheck_zero : firstCheck 0 = true := by decide

end Loneliness.PrimeFilteringFourProfiles
