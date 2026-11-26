import Mathlib.Data.Nat.Choose.Basic

/-! Executable integer arithmetic for the finite mixed-parity theta comparison.
The evaluator advances binomial coefficients along the common-total range. -/

namespace BraunBruegge

def nextBinomial (n k value : ℕ) : ℕ := value * (n - k) / (k + 1)

def binomialProductLoop (a b c : ℕ) : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ
  | 0, _, _, _, x, y, z => x * y * z
  | remaining + 1, i, j, k, x, y, z => x * y * z +
      binomialProductLoop a b c remaining (i + 1) (j + 1) (k + 1)
        (nextBinomial a i x) (nextBinomial b j y) (nextBinomial c k z)

def computedSignProduct (a b c : ℕ) : ℕ :=
  let m := min a (min b c)
  let i := (a - m) / 2
  let j := (b - m) / 2
  let k := (c - m) / 2
  binomialProductLoop a b c m i j k (a.fast_choose i) (b.fast_choose j) (c.fast_choose k)

def computedMixedFacetCount (a b c : ℕ) : ℕ :=
  a * b * computedSignProduct (a - 1) (b - 1) c + c * computedSignProduct a b (c - 1)

private def computedOddCycle (n : ℕ) : ℕ := n * (n - 1).fast_choose ((n - 1) / 2)

def computedWedgeCount (l : ℕ) : ℕ :=
  let s := l - l % 2
  let a := 2 * ((s - 2) / 4) + 1
  2 ^ (l - s) * computedOddCycle a * computedOddCycle (s - a)

def checkMixedAtTotal (l : ℕ) : Bool :=
  let cap := computedWedgeCount l
  (List.range ((l - 1) / 2)).all fun i =>
    let a := i + 1
    (List.range (l - 2 * a)).all fun j =>
      let b := a + j
      let c := l - a - b
      if a % 2 = b % 2 ∧ a % 2 ≠ c % 2 then decide (computedMixedFacetCount a b c ≤ cap) else true

end BraunBruegge
