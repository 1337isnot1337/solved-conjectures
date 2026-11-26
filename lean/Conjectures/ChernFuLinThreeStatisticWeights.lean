import Conjectures.ChernFuLinThreeStatisticDefs
import Mathlib.Algebra.Polynomial.Coeff
import Mathlib.RingTheory.Localization.FractionRing

/-! # Coefficient extraction for the marked distribution

Independent indeterminates for `rma` and `ides` keep equality of the weighted
counts equivalent to equality on every literal fibre, including weight zero.
-/

namespace Conjectures.ChernFuLinThreeStatistic

open BursteinA218225 Polynomial

abbrev WeightRing := Polynomial (Polynomial ℚ)
abbrev WeightField := FractionRing WeightRing

noncomputable def markedPolynomial {n : ℕ} (P : Equiv.Perm (Fin n) → Prop) (L : Finset (Fin n)) :
    WeightRing := by
  classical
  exact ∑ π : Equiv.Perm (Fin n), if P π ∧ lmi π = L then
    Polynomial.monomial (ides π) (Polynomial.monomial (rma π) (1 : ℚ)) else 0

theorem markedPolynomial_coeff {n : ℕ} (P : Equiv.Perm (Fin n) → Prop) (L : Finset (Fin n))
    (r d : ℕ) : ((markedPolynomial P L).coeff d).coeff r = (fibreCount P L r d : ℚ) := by
  classical
  unfold markedPolynomial fibreCount
  rw [Nat.card_eq_fintype_card,Fintype.card_subtype,← Finset.sum_boole]
  simp only [finsetSum_coeff]
  apply Finset.sum_congr rfl
  intro π _
  by_cases hP : P π <;> by_cases hL : lmi π = L <;> by_cases hr : rma π = r <;>
    by_cases hd : ides π = d <;> simp [hP,hL,hr,hd,Polynomial.coeff_monomial]

noncomputable def markedWeight {n : ℕ} (P : Equiv.Perm (Fin n) → Prop) (L : Finset (Fin n)) :
    WeightField := algebraMap WeightRing WeightField (markedPolynomial P L)

theorem equidistributed_iff_markedWeight : Equidistributed ↔
    ∀ (n : ℕ) (L : Finset (Fin n)), markedWeight (@InX n) L = markedWeight (@InZ n) L := by
  constructor
  · intro h n L
    apply congrArg (algebraMap WeightRing WeightField)
    apply Polynomial.ext; intro d; apply Polynomial.ext; intro r
    rw [markedPolynomial_coeff,markedPolynomial_coeff,h n L r d]
  · intro h n L r d
    have hp := (IsFractionRing.injective WeightRing WeightField) (h n L)
    have hc := congrArg (fun p : WeightRing => (p.coeff d).coeff r) hp
    simp only [markedPolynomial_coeff,Nat.cast_inj] at hc
    exact hc

end Conjectures.ChernFuLinThreeStatistic
