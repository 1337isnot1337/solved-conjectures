import Conjectures.DenominatorPrefixPolynomials

namespace DenominatorForest
open Polynomial

def phaseHead (word : List ℕ) (q : ℕ) : List ℕ :=
  if q=0 then [] else word.drop q

def phaseOffset (word : List ℕ) (q : ℕ) : ℤ :=
  (word.getD (if q=0 then word.length-1 else q-1) 0 : ℤ)-1

noncomputable def sumFirst (word : List ℕ) : ℚ[X] :=
  ∑ q ∈ Finset.range word.length, deadPoly (phaseHead word q) (phaseOffset word q)

noncomputable def sumSecond (word : List ℕ) : ℚ[X] :=
  ∑ q ∈ Finset.range word.length, prefixSecond (phaseHead word q) (phaseOffset word q)

def primaryWord : List ℕ := [0,0,0,1,0,0,1,0,1,1]
def dualWord : List ℕ := [0,0,1,0,1,1,0,1,1,1]

end DenominatorForest
