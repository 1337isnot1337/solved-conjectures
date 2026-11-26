import Conjectures.SaganWilsonPlacticModeDifferences
import Conjectures.SaganWilsonPlacticModeSmall
import Conjectures.SaganWilsonPlacticModeM7
import Conjectures.SaganWilsonPlacticModeM8
import Conjectures.SaganWilsonPlacticModeM9
import Conjectures.SaganWilsonPlacticModeM10

namespace SaganWilsonPlacticMode

theorem zero_of_initial_and_iterDelta_zero (k : Nat) (f : Nat → Int)
    (hz : ∀ m, 1 ≤ m → iterDelta k f m = 0)
    (hi : ∀ m, 1 ≤ m → m ≤ k → f m = 0) :
    ∀ m, 1 ≤ m → f m = 0 := by
  induction k generalizing f with
  | zero => exact hz
  | succ k ih =>
    have hdiff : ∀ m, 1 ≤ m → iterDelta k (delta f) m = 0 := by
      intro m hm
      rw [iterDelta_delta]
      exact hz m hm
    have hinit : ∀ m, 1 ≤ m → m ≤ k → delta f m = 0 := by
      intro m hm hk
      simp [delta, hi m hm (by omega), hi (m+1) (by omega) (by omega)]
    have h := ih (delta f) hdiff hinit
    have hconst : ∀ t, f (t+1) = 0 := by
      intro t
      induction t with
      | zero => exact hi 1 (by omega) (by omega)
      | succ t iht =>
        have hh := h (t+1) (by omega)
        simp only [delta] at hh
        change f (t+1+1) = 0
        omega
    intro m hm
    have he : m-1+1 = m := by omega
    rw [← he]
    exact hconst (m-1)

/-- The coefficient row of the length-ten centralizer counting polynomial. -/
def coeff10 (k : Nat) : Int :=
  ([0, 1, 250, 4917, 29648, 75095, 88704, 43414, 4861, 1] : List Int)[k]!

theorem coeff10_initial (m : Nat) (hm : 1 ≤ m) (hk : m ≤ 10) :
    basisValue coeff10 10 m = ((centralizerWords m 10).length : Int) := by
  have hc : m = 1 ∨ m = 2 ∨ m = 3 ∨ m = 4 ∨ m = 5 ∨ m = 6 ∨ m = 7 ∨ m = 8 ∨ m = 9 ∨ m = 10 := by omega
  rcases hc with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · rw [centralizer_count10_1]; decide
  · rw [centralizer_count10_2]; decide
  · rw [centralizer_count10_3]; decide
  · rw [centralizer_count10_4]; decide
  · rw [centralizer_count10_5]; decide
  · rw [centralizer_count10_6]; decide
  · rw [centralizer_count10_7]; decide
  · rw [centralizer_count10_8]; decide
  · rw [centralizer_count10_9]; decide
  · rw [centralizer_count10_10]; decide

theorem coefficient_row10_correct :
    ∀ m, 1 ≤ m → basisValue coeff10 10 m = ((centralizerWords m 10).length : Int) := by
  let f : Nat → Int := fun m => basisValue coeff10 10 m - ((centralizerWords m 10).length : Int)
  have hz : ∀ m, 1 ≤ m → iterDelta 10 f m = 0 := by
    intro m hm
    unfold f
    rw [iterDelta_sub, iterDelta_basis_zero, iterDelta_centralizer_zero 10 (by decide) m hm]
    rfl
  have hi : ∀ m, 1 ≤ m → m ≤ 10 → f m = 0 := by
    intro m hm hk
    simp [f, coeff10_initial m hm hk]
  intro m hm
  have hh := zero_of_initial_and_iterDelta_zero 10 f hz hi m hm
  dsimp [f] at hh
  omega

def CoefficientRow (n : Nat) (a : Nat → Int) : Prop :=
  ∀ m, n ≤ m → basisValue a n m = ((centralizerWords m n).length : Int)

/-- The mode assertion on integer-valued binomial coefficient rows. -/
def ModeConjecture : Prop :=
  ∀ n, 2 ≤ n → ∀ a, CoefficientRow n a →
    ∀ j, 1 ≤ j → j < n → a j ≤ a ((n+1)/2)

theorem not_modeConjecture : ¬ ModeConjecture := by
  intro h
  have hc : CoefficientRow 10 coeff10 := fun m hm => coefficient_row10_correct m (by omega)
  have hh := h 10 (by decide) coeff10 hc 6 (by decide) (by decide)
  have hn : ¬ (coeff10 6 ≤ coeff10 ((10+1)/2)) := by decide
  exact hn hh

#print axioms coefficient_row10_correct
#print axioms not_modeConjecture
end SaganWilsonPlacticMode
