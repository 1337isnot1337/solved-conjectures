module

public import Mathlib.Basic.Real.ENatENNReal
public import Mathlib.Basic.ENNReal.Inv
public import Mathlib.Data.Set.Card
public import Mathlib.Order.Interval.Set.Basic
public import Mathlib.Order.LiminfLimsup
public import Mathlib.Topology.Algebra.InfiniteSum.Basic
public import Mathlib.Topology.Algebra.Ring.Real

/-!
# The source definitions for Gröchenig's zero-density problem

Problem 4.12 of *Infinite totally positive matrices: some open problems*,
DOI 10.1007/s44146-026-00264-3, compares upper and lower Beurling densities.
The counterexample concerns the upper density. Coefficient sign changes skip
every intervening zero and are recorded at the left nonzero index, exactly as
in the source's equation (8) and the formula preceding it.

The real-set density uses arbitrary real starting points and real lengths;
the coefficient density uses integer starting points and natural lengths.
Counts and suprema take values in the extended nonnegative reals. In
particular, local finiteness does not impose an unproved uniform bound on
the counts over all translated windows.
-/

@[expose] public section

namespace Grochenig

open Filter Set
open scoped ENNReal

noncomputable section

def coefficientSignChanges (c : ℤ → ℝ) : Set ℤ :=
  {j | ∃ r : ℕ, 0 < r ∧ c j * c (j + (r : ℤ)) < 0 ∧
    ∀ l : ℕ, 0 < l → l < r → c (j + (l : ℤ)) = 0}

theorem mem_coefficientSignChanges (c : ℤ → ℝ) (j : ℤ) :
    j ∈ coefficientSignChanges c ↔
      ∃ r : ℕ, 0 < r ∧ c j * c (j + (r : ℤ)) < 0 ∧
        ∀ l : ℕ, 0 < l → l < r → c (j + (l : ℤ)) = 0 := by
  simp only [coefficientSignChanges, Set.mem_ofPred_eq]

def intervalCount (E : Set ℝ) (a R : ℝ) : ℝ≥0∞ :=
  (E ∩ Icc a (a + R)).encard.toENNReal

theorem intervalCount_eq (E : Set ℝ) (a R : ℝ) :
    intervalCount E a R = (E ∩ Icc a (a + R)).encard.toENNReal := by
  simp only [intervalCount]

def intIntervalCount (S : Set ℤ) (a : ℤ) (n : ℕ) : ℝ≥0∞ :=
  (S ∩ Icc a (a + (n : ℤ))).encard.toENNReal

theorem intIntervalCount_eq (S : Set ℤ) (a : ℤ) (n : ℕ) :
    intIntervalCount S a n = (S ∩ Icc a (a + (n : ℤ))).encard.toENNReal := by
  simp only [intIntervalCount]

def upperBeurlingDensity (E : Set ℝ) : ℝ≥0∞ :=
  Filter.limsup (fun R : ℝ => ⨆ a : ℝ, intervalCount E a R / ENNReal.ofReal R) atTop

theorem upperBeurlingDensity_eq (E : Set ℝ) :
    upperBeurlingDensity E =
      Filter.limsup (fun R : ℝ => ⨆ a : ℝ, intervalCount E a R / ENNReal.ofReal R)
        atTop := by
  simp only [upperBeurlingDensity]

def upperIntegerDensity (S : Set ℤ) : ℝ≥0∞ :=
  Filter.limsup (fun n : ℕ => ⨆ a : ℤ, intIntervalCount S a n / (n : ℝ≥0∞)) atTop

theorem upperIntegerDensity_eq (S : Set ℤ) :
    upperIntegerDensity S =
      Filter.limsup (fun n : ℕ => ⨆ a : ℤ, intIntervalCount S a n / (n : ℝ≥0∞))
        atTop := by
  simp only [upperIntegerDensity]

def upperCoefficientDensity (c : ℤ → ℝ) : ℝ≥0∞ :=
  upperIntegerDensity (coefficientSignChanges c)

theorem upperCoefficientDensity_eq (c : ℤ → ℝ) :
    upperCoefficientDensity c = upperIntegerDensity (coefficientSignChanges c) := by
  simp only [upperCoefficientDensity]

def zeroSet (f : ℝ → ℝ) : Set ℝ := {x | f x = 0}

theorem mem_zeroSet (f : ℝ → ℝ) (x : ℝ) : x ∈ zeroSet f ↔ f x = 0 := by
  simp only [zeroSet, Set.mem_ofPred_eq]

def LocallyFiniteSet (E : Set ℝ) : Prop := ∀ a b : ℝ, (E ∩ Icc a b).Finite

theorem locallyFiniteSet_iff (E : Set ℝ) :
    LocallyFiniteSet E ↔ ∀ a b : ℝ, (E ∩ Icc a b).Finite := by
  simp only [LocallyFiniteSet]

/-- The literal bounded-coefficient representation in the source shift space.
`HasSum` records convergence as well as the value of the shift sum. -/
def IsBoundedShiftSum (g : ℝ → ℝ) (c : ℤ → ℝ) (f : ℝ → ℝ) : Prop :=
  (∃ C : ℝ, ∀ k : ℤ, |c k| ≤ C) ∧
    ∀ x : ℝ, HasSum (fun k : ℤ => c k * g (x - (k : ℝ))) (f x)

theorem isBoundedShiftSum_iff (g : ℝ → ℝ) (c : ℤ → ℝ) (f : ℝ → ℝ) :
    IsBoundedShiftSum g c f ↔
      (∃ C : ℝ, ∀ k : ℤ, |c k| ≤ C) ∧
        ∀ x : ℝ, HasSum (fun k : ℤ => c k * g (x - (k : ℝ))) (f x) := by
  simp only [IsBoundedShiftSum]

def InVInfinity (g f : ℝ → ℝ) : Prop := ∃ c : ℤ → ℝ, IsBoundedShiftSum g c f

theorem inVInfinity_iff (g f : ℝ → ℝ) :
    InVInfinity g f ↔ ∃ c : ℤ → ℝ, IsBoundedShiftSum g c f := by
  simp only [InVInfinity]

end

end Grochenig
