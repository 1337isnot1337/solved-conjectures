/-
MIT License

Copyright (c) 2026 Repository contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
-/

import Mathlib.Combinatorics.Matroid.Closure
import Mathlib.Combinatorics.Matroid.Rank.Finite
import Mathlib.Combinatorics.Matroid.Rank.ENat
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Data.Real.Basic

namespace CaioloFerroniHoster

open Finset Polynomial
open scoped Classical BigOperators

noncomputable section

/-- Simplicity expressed via independence of every set of at most two points. -/
def IsSimple {P : Type*} (M : Matroid P) : Prop :=
  ∀ (I : Finset P), I.card ≤ 2 → M.Indep (I : Set P)

section Flags

universe u

variable {F V X : Type u} [Field F] [AddCommGroup V] [Module F V]

/-- A geometric point is a one-dimensional subspace. The right summand is free. -/
abbrev Point (F V X : Type*) [Field F] [AddCommGroup V] [Module F V] := {L : Submodule F V // Module.finrank F L = 1} ⊕ X

abbrev RankedFlat (M : Matroid (Point F V X)) (r : ℕ) :=
  {S : Set (Point F V X) // M.IsFlat S ∧ M.eRk S = (r : ℕ∞)}

/-- Rank flags of actual flats, with a specified inclusive upper bound. -/
def FlatFlag (M : Matroid (Point F V X)) (A : Set (Point F V X)) : List ℕ → Type u
  | [] => PUnit
  | r :: s => Σ B : {B : RankedFlat M r // B.val ⊆ A}, FlatFlag M B.val.val s

end Flags

/-- Every sublist of a rank list, paired with its inclusion–exclusion sign. -/
def signedSublists : List ℕ → List (List ℕ × ℤ)
  | [] => [([], 1)]
  | r :: tail =>
    (signedSublists tail).map (fun (s, sign) => (r :: s, sign)) ++
    (signedSublists tail).map (fun (s, sign) => (s, -sign))

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

variable {F₀ V X : Type} [Field F₀] [AddCommGroup V] [Module F₀ V]

/-- Number of flags with the given internal ranks in the lattice of flats. -/
def matroidFlag (M : Matroid (Point F₀ V X)) (s : List ℕ) : ℝ :=
  Nat.card (FlatFlag M M.E s)

/-- The dual Chow polynomial of the characteristic kernel in rank five.
The defining chain factors are the expanded CFH Propositions 4.6–4.7. -/
def matroidDualChow (M : Matroid (Point F₀ V X)) : ℝ[X] :=
  dualChow (fun s => C (matroidFlag M s)) Polynomial.X

/-- The dual right augmented Chow polynomial of the characteristic kernel in rank five. -/
def matroidDualAugmented (M : Matroid (Point F₀ V X)) : ℝ[X] :=
  dualRightAugmented (fun s => C (matroidFlag M s)) Polynomial.X

end
end CaioloFerroniHoster
