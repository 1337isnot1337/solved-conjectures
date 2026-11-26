import Conjectures.CircularIndexBase

/-! The two base matchings for the one- and two-block insertion families, for every g ≥ 7. -/

namespace CircularIndex.Insertion

/-- The endpoints are listed in increasing order. The third index numbers the
g edges in each of the matchings from Section 3 of the construction. -/
inductive BasePair (g : Nat) : Nat → Nat → Nat → Nat → Prop where
  | firstZero : BasePair g 0 0 0 (3*g+2)
  | firstOne : BasePair g 0 1 1 (3*g+1)
  | firstNest (i : Nat) (hi : 1 ≤ i) (hi' : i+2 ≤ g) :
      BasePair g 0 (i+1) (3*g+1-i) (3*g+2+i)
  | secondZero : BasePair g 1 0 2 (3*g)
  | oddOne (hg : g%2 = 1) : BasePair g 1 1 1 (4*g-1)
  | oddEvenNest (hg : g%2 = 1) (i : Nat) (hi : i ≤ (g-3)/2) :
      BasePair g 1 (2+i) (2*g+4+2*i) (4*g-2*i)
  | oddOddNest (hg : g%2 = 1) (i : Nat) (hi : 1 ≤ i) (hi' : i ≤ (g-3)/2) :
      BasePair g 1 ((g-3)/2+2+i) (3*g-2*i) (3*g+2*i)
  | evenOne (hg : g%2 = 0) : BasePair g 1 1 1 (2*g+5)
  | evenTwo (hg : g%2 = 0) : BasePair g 1 2 (2*g+3) (4*g-1)
  | evenOddNest (hg : g%2 = 0) (i : Nat) (hi : 2 ≤ i) (hi' : i+1 ≤ g/2) :
      BasePair g 1 (i+1) (2*g+3+2*i) (4*g+1-2*i)
  | evenSpecialTwo (hg : g%4 = 2) : BasePair g 1 (g/2+1) (2*g+4) (4*g-2)
  | evenSpecialZero (hg : g%4 = 0) : BasePair g 1 (g/2+1) (2*g+6) (4*g)
  | evenFirstNest (hg : g%2 = 0) (i : Nat) (hi : 1 ≤ i) (hi' : i+1 ≤ g/4) :
      BasePair g 1 (g/2+1+i) (3*g-4*i) (3*g+4*i)
  | evenSecondNest (hg : g%2 = 0) (i : Nat) (hi : 1 ≤ i) (hi' : i ≤ (g-2)/4) :
      BasePair g 1 (g/2+g/4+i) (3*g+6-4*i) (3*g+2+4*i)

theorem basePair_exists {g ε j : Nat} (hg : 7 ≤ g) (hε : ε < 2) (hj : j < g) :
    ∃ a b, BasePair g ε j a b := by
  rcases (show ε=0 ∨ ε=1 by omega) with rfl | rfl
  · match j with
    | 0 => exact ⟨_,_,.firstZero⟩
    | 1 => exact ⟨_,_,.firstOne⟩
    | k+2 => exact ⟨_,_,.firstNest (k+1) (by omega) (by omega)⟩
  · by_cases hz : j=0
    · subst j; exact ⟨_,_,.secondZero⟩
    by_cases hp : g%2=1
    · by_cases h1 : j=1
      · subst j; exact ⟨_,_,.oddOne hp⟩
      by_cases h : j≤(g-3)/2+2
      · have e : j=2+(j-2) := by omega
        rw [e]
        exact ⟨_,_,.oddEvenNest hp _ (by omega)⟩
      · have e : j=(g-3)/2+2+(j-((g-3)/2+2)) := by omega
        rw [e]
        exact ⟨_,_,.oddOddNest hp _ (by omega) (by omega)⟩
    · have he : g%2=0 := by omega
      by_cases h1 : j=1
      · subst j; exact ⟨_,_,.evenOne he⟩
      by_cases h2 : j=2
      · subst j; exact ⟨_,_,.evenTwo he⟩
      by_cases h : j ≤ g/2
      · have e : j=j-1+1 := by omega
        rw [e]
        exact ⟨_,_,.evenOddNest he _ (by omega) (by omega)⟩
      by_cases h' : j = g/2+1
      · subst j
        rcases (show g%4=0 ∨ g%4=2 by omega) with h4|h4
        · exact ⟨_,_,.evenSpecialZero h4⟩
        · exact ⟨_,_,.evenSpecialTwo h4⟩
      by_cases h'' : j ≤ g/2+g/4
      · have e : j=g/2+1+(j-(g/2+1)) := by omega
        rw [e]
        exact ⟨_,_,.evenFirstNest he _ (by omega) (by omega)⟩
      · have e : j=g/2+g/4+(j-(g/2+g/4)) := by omega
        rw [e]
        exact ⟨_,_,.evenSecondNest he _ (by omega) (by omega)⟩

/-- The supports of the base classes are contained in the stated two exceptions
and the common interval. The disjointness proofs use only this inclusion. -/
def Support (g ε v : Nat) : Prop := v = ε ∨ v = ε+1 ∨ (2*g+3 ≤ v ∧ v ≤ 4*g)

theorem basePair_bounds {g ε j a b : Nat} (hg : 7 ≤ g) (h : BasePair g ε j a b) :
    a < b ∧ b < 6*g+1 ∧ Support g ε a ∧ Support g ε b := by
  unfold Support
  cases h <;> omega

def cyclicLength (n a b : Nat) : Nat := min (b-a) (n-(b-a))

theorem basePair_length_range {g ε j a b : Nat} (hg : 7 ≤ g) (h : BasePair g ε j a b) :
    2 ≤ cyclicLength (6*g+1) a b ∧ cyclicLength (6*g+1) a b ≤ 3*g := by
  unfold cyclicLength
  cases h <;> omega

end CircularIndex.Insertion
