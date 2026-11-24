import Mathlib.Basic.Real.Basic
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic

/-!
# Arithmetic for the Caiolo–Ferroni–Hoster counterexample

Ranks in a flag are listed from largest to smallest. The polynomial formulas
use the right-hand recurrences of CFH Propositions 4.6 and 4.7.
-/

namespace CaioloFerroniHoster

open Finset
open scoped BigOperators

/-- Gaussian binomial recurrence, with values in the coefficient ring. -/
def gaussian {A : Type*} [Semiring A] (q : A) : ℕ → ℕ → A
  | 0, i => if i = 0 then 1 else 0
  | _ + 1, 0 => 1
  | d + 1, i + 1 => gaussian q d i + q ^ (i + 1) * gaussian q d (i + 1)

/-- Flag count in a product of a subspace lattice and a Boolean lattice. -/
def productFlag {A : Type*} [Semiring A] (q : A) (d t : ℕ) : List ℕ → A
  | [] => 1
  | r :: tail =>
    ∑ i ∈ range (r + 1),
      gaussian q d i * (Nat.choose t (r - i) : A) * productFlag q i (r - i) tail

/-- The falling-factorial polynomial `choose (q^4) i`. -/
def auxChoose {A : Type*} [Field A] (q : A) (i : ℕ) : A :=
  (∏ j ∈ range i, (q ^ 4 - (j : A))) / (i.factorial : A)

/-- Rank-flag counts predicted by the coalescence construction. -/
def coalescedFlag {A : Type*} [Field A] (q : A) : List ℕ → A
  | [] => 1
  | r :: tail =>
    if r = 4 then
      (gaussian q 8 4 - q ^ 16) * productFlag q 4 0 tail +
      q ^ 16 * productFlag q 4 1 tail +
      (gaussian q 8 3 * q ^ 4 - q ^ 16 * gaussian q 4 3) * productFlag q 3 1 tail +
      ∑ j ∈ range 3, gaussian q 8 (2 - j) * auxChoose q (j + 2) *
        productFlag q (2 - j) (j + 2) tail
    else
      ∑ i ∈ range (r + 1),
        gaussian q 8 i * auxChoose q (r - i) * productFlag q i (r - i) tail

/-- Every sublist of a rank list, paired with its inclusion–exclusion sign. -/
def signedSublists : List ℕ → List (List ℕ × ℤ)
  | [] => [([], 1)]
  | r :: tail =>
    (signedSublists tail).map (fun (s, sign) => (r :: s, sign)) ++
    (signedSublists tail).map (fun (s, sign) => (s, -sign))

def beta {A : Type*} [Ring A] (flag : List ℕ → A) (s : List ℕ) : A :=
  ((signedSublists s).map (fun (t, sign) => (sign : A) * flag t)).sum

def gammaZero {A : Type*} [Ring A] (flag : List ℕ → A) : A :=
  beta flag [4, 3, 2, 1]

def gammaOne {A : Type*} [Ring A] (flag : List ℕ → A) : A :=
  beta flag [4, 3, 2] + beta flag [4, 3, 1] + beta flag [4, 2, 1]

def gammaTwo {A : Type*} [Ring A] (flag : List ℕ → A) : A :=
  beta flag [4, 2]

def gammaOneAug {A : Type*} [Ring A] (flag : List ℕ → A) : A :=
  gammaOne flag + beta flag [3, 2, 1]

def gammaTwoAug {A : Type*} [Ring A] (flag : List ℕ → A) : A :=
  gammaTwo flag + beta flag [3, 2] + beta flag [3, 1]

/-- All possible internal rank lists between the endpoints of a rank-five lattice. -/
def ranks : List (List ℕ) :=
  (signedSublists [4, 3, 2, 1]).map Prod.fst

/-- Factor in the dual right augmented recursion across a positive rank gap. -/
def augmentedFactor {A : Type*} [CommRing A] (x : A) (gap : ℕ) : A :=
  -(-1 : A) ^ gap * ∑ j ∈ range (gap + 1), x ^ j

/-- Product of augmented recursion factors down a strict chain. -/
def augmentedWeight {A : Type*} [CommRing A] (x : A) (top : ℕ) : List ℕ → A
  | [] => augmentedFactor x top
  | r :: tail => augmentedFactor x (top - r) * augmentedWeight x r tail

/-- Prop. 4.7, after expansion of Prop. 4.6 on the intervals below the last step.
Combining the two possible contributions to the last step replaces its length
`gap + 1` geometric sum by the length `gap` sum. -/
def chowWeight {A : Type*} [CommRing A] (x : A) (top : ℕ) : List ℕ → A
  | [] => -(-1 : A) ^ top * ∑ j ∈ range top, x ^ j
  | r :: tail => (-(-1 : A) ^ (top - r) * ∑ j ∈ range (top - r), x ^ j) *
      augmentedWeight x r tail

def dualChow {A : Type*} [CommRing A] (flag : List ℕ → A) (x : A) : A :=
  (ranks.map (fun s => flag s * chowWeight x 5 s)).sum

def dualRightAugmented {A : Type*} [CommRing A] (flag : List ℕ → A) (x : A) : A :=
  (ranks.map (fun s => flag s * augmentedWeight x 5 s)).sum

theorem dualChow_gamma {A : Type*} [CommRing A] (flag : List ℕ → A) (x : A) :
    dualChow flag x =
      gammaZero flag * (1 + x) ^ 4 + gammaOne flag * x * (1 + x) ^ 2 +
        gammaTwo flag * x ^ 2 := by
  simp [dualChow, ranks, chowWeight, augmentedWeight, augmentedFactor, gammaZero, gammaOne,
    gammaTwo, beta, signedSublists, Finset.sum_range_succ]
  ring

theorem dualRightAugmented_gamma {A : Type*} [CommRing A] (flag : List ℕ → A) (x : A) :
    dualRightAugmented flag x = (1 + x) *
      (gammaZero flag * (1 + x) ^ 4 + gammaOneAug flag * x * (1 + x) ^ 2 +
        gammaTwoAug flag * x ^ 2) := by
  simp [dualRightAugmented, ranks, augmentedWeight, augmentedFactor, gammaZero, gammaOne,
    gammaTwo, gammaOneAug, gammaTwoAug, beta, signedSublists, Finset.sum_range_succ]
  ring


end CaioloFerroniHoster
