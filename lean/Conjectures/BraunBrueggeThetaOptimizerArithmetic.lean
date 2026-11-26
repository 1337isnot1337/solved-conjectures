import Conjectures.BraunBrueggeBicyclicFiniteArithmetic

/-! Integer counts and the proposed maximizing triple in journal Conjecture 33. -/

namespace BraunBruegge

/-- For a triple of arbitrary parity, put the exceptional path last in the mixed formula. -/
def computedThetaFacetCount (a b c : ℕ) : ℕ :=
  if a % 2 = b % 2 then
    if a % 2 = c % 2 then computedSignProduct a b c else computedMixedFacetCount a b c
  else if a % 2 = c % 2 then computedMixedFacetCount a c b else computedMixedFacetCount b c a

def thetaOptimizerShort (l : ℕ) : ℕ := 2 - l % 2

def thetaOptimizerLeft (l : ℕ) : ℕ :=
  if l % 2 = 0 then 2 * ((l - 4) / 4) + 1 else 2 * ((l - 1) / 4)

def thetaOptimizerRight (l : ℕ) : ℕ := l - thetaOptimizerShort l - thetaOptimizerLeft l

theorem thetaOptimizer_lengths (l : ℕ) (hl : 11 ≤ l) :
    let c := thetaOptimizerShort l
    let a := thetaOptimizerLeft l
    let b := thetaOptimizerRight l
    0 < c ∧ c ≤ a ∧ a ≤ b ∧ b ≤ a + 2 ∧ c + a + b = l ∧ c % 2 ≠ a % 2 ∧ a % 2 = b % 2 := by
  by_cases h : l % 2 = 0 <;> simp only [thetaOptimizerRight, thetaOptimizerLeft, thetaOptimizerShort, h, ite_true, ite_false] <;> omega

/-- Check every ordered representative x ≤ y ≤ z at this total.
The named triple is admitted directly. Every other representative must be strictly smaller. -/
def checkThetaOptimizerAtTotal (l : ℕ) : Bool :=
  let s := thetaOptimizerShort l
  let a := thetaOptimizerLeft l
  let cap := computedThetaFacetCount s a (thetaOptimizerRight l)
  (List.range (l / 3)).all fun i =>
    let x := i + 1
    (List.range ((l - x) / 2 + 1 - x)).all fun j =>
      let y := x + j
      decide (x = s ∧ y = a) || decide (computedThetaFacetCount x y (l - x - y) < cap)

theorem checkThetaOptimizerAtTotal_sound (l x y z : ℕ) (h : checkThetaOptimizerAtTotal l = true)
    (hx : 0 < x) (hxy : x ≤ y) (hyz : y ≤ z) (hs : x + y + z = l) :
    (x = thetaOptimizerShort l ∧ y = thetaOptimizerLeft l ∧ z = thetaOptimizerRight l) ∨
      computedThetaFacetCount x y z <
        computedThetaFacetCount (thetaOptimizerShort l) (thetaOptimizerLeft l) (thetaOptimizerRight l) := by
  have hi : x - 1 ∈ List.range (l / 3) := List.mem_range.mpr (by omega)
  have hj : y - x ∈ List.range ((l - x) / 2 + 1 - x) := List.mem_range.mpr (by omega)
  unfold checkThetaOptimizerAtTotal at h
  have hrow := List.all_eq_true.mp h (x - 1) hi
  rw [Nat.sub_add_cancel (show 1 ≤ x by omega)] at hrow
  have entry := List.all_eq_true.mp hrow (y - x) hj
  dsimp only at entry
  rw [Nat.add_sub_of_le hxy, show l - x - y = z by omega] at entry
  simp only [Bool.or_eq_true, decide_eq_true_eq] at entry
  rcases entry with ⟨rfl, rfl⟩ | strict
  · exact Or.inl ⟨rfl, rfl, by unfold thetaOptimizerRight; omega⟩
  · exact Or.inr strict

end BraunBruegge
