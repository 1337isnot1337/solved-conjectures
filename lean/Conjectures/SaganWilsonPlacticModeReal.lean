import Conjectures.SaganWilsonPlacticModeCounterexample
import Mathlib.Basic.Real.Basic
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Tactic.NormNum

/-!
# Real coefficient formulation of Sagan–Wilson, Conjecture 7.3(d)

The preceding core Lean proof constructs the full length-ten counting
polynomial. This module identifies its Pascal recurrence with Mathlib's
standard binomial coefficients, identifies the enumeration with the exact
finite set of centralizing words, and transports the integer coefficients
to the real scalar domain in the published conjecture.
-/

open scoped BigOperators

namespace SaganWilsonPlacticMode

def centralizerFinset (m n : Nat) : Finset (List Nat) :=
  (centralizerWords m n).toFinset

theorem mem_centralizerFinset (m n : Nat) (w : List Nat) :
    w ∈ centralizerFinset m n ↔
      (w.length = n ∧ (∀ x ∈ w, 1 ≤ x ∧ x ≤ m)) ∧ CentralizesOne w := by
  rw [centralizerFinset, List.mem_toFinset, centralizerWords_mem_iff]

theorem card_centralizerFinset (m n : Nat) :
    (centralizerFinset m n).card = (centralizerWords m n).length :=
  List.toFinset_card_of_nodup (centralizerWords_nodup m n)

theorem pascalChoose_eq_choose (m k : Nat) :
    pascalChoose m k = Nat.choose m k := by
  induction m generalizing k with
  | zero => cases k <;> rfl
  | succ m ih =>
    cases k with
    | zero => rfl
    | succ k =>
      rw [pascalChoose, Nat.choose_succ_succ, ih k, ih (k+1)]

theorem cast_basisValue (a : Nat → Int) (d m : Nat) :
    (basisValue a d m : ℝ) =
      ∑ k ∈ Finset.range d, (a k : ℝ) * (Nat.choose m k : ℝ) := by
  induction d with
  | zero => simp [basisValue]
  | succ d ih =>
    rw [basisValue, Int.cast_add, Int.cast_mul, Int.cast_natCast,
      pascalChoose_eq_choose, ih, Finset.sum_range_succ]

/-- A real row with exactly the source's binomial basis and alphabet range. -/
def RealCoefficientRow (n : Nat) (a : Nat → ℝ) : Prop :=
  ∀ m : Nat, n ≤ m →
    ((centralizerFinset m n).card : ℝ) =
      ∑ k ∈ Finset.range n, a k * (Nat.choose m k : ℝ)

/-- The explicit length-ten real row is valid on every positive alphabet,
a stronger statement than the source's polynomial range m ≥ n. -/
theorem real_coefficient_row10_correct (m : Nat) (hm : 1 ≤ m) :
    ((centralizerFinset m 10).card : ℝ) =
      ∑ k ∈ Finset.range 10, (coeff10 k : ℝ) * (Nat.choose m k : ℝ) := by
  rw [card_centralizerFinset, ← cast_basisValue]
  have h := congrArg (fun z : Int => (z : ℝ)) (coefficient_row10_correct m hm)
  simpa only [Int.cast_natCast] using h.symm

theorem real_coeff10_values :
    (coeff10 5 : ℝ) = 75095 ∧ (coeff10 6 : ℝ) = 88704 := by
  have h5 : coeff10 5 = 75095 := by decide
  have h6 : coeff10 6 = 88704 := by decide
  rw [h5, h6]
  norm_num

/-- Conjecture 7.3(d), with the ceiling written as natural division. -/
def RealModeConjecture : Prop :=
  ∀ n : Nat, 2 ≤ n → ∀ a : Nat → ℝ, RealCoefficientRow n a →
    ∀ j : Nat, 1 ≤ j → j < n → a j ≤ a ((n+1)/2)

theorem not_realModeConjecture : ¬ RealModeConjecture := by
  intro h
  have hrow : RealCoefficientRow 10 (fun k => (coeff10 k : ℝ)) :=
    fun m hm => real_coefficient_row10_correct m (by omega)
  have hle := h 10 (by decide) (fun k => (coeff10 k : ℝ)) hrow 6
    (by decide) (by decide)
  change (coeff10 6 : ℝ) ≤ (coeff10 5 : ℝ) at hle
  rw [real_coeff10_values.1, real_coeff10_values.2] at hle
  norm_num at hle

#print axioms real_coefficient_row10_correct
#print axioms not_realModeConjecture

end SaganWilsonPlacticMode
