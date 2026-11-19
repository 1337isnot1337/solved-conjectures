import Mathlib.Data.Nat.Totient
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.Coset.Card
import Mathlib.GroupTheory.OrderOfElement
import Lean.Elab.Tactic.Omega

/-!
# Square multipliers in a subgroup of order 27

The actual unit product has order 108 and exponent dividing 18.
A subgroup of order 27 therefore has a quotient of order four.
Every quotient element has both fourth and eighteenth power one,
so its square is one. Thus every independent square multiplier
belongs to the subgroup, without a classification of its subgroups.
-/

namespace HadamardLegendre

theorem square_eq_one_of_pow_four_and_eighteen
    {A : Type*} [Monoid A] (a : A) (h4 : a ^ 4 = 1) (h18 : a ^ 18 = 1) :
    a ^ 2 = 1 := by
  calc
    a ^ 2 = (a ^ 4) ^ 4 * a ^ 2 := by rw [h4, one_pow, one_mul]
    _ = a ^ (4 * 4 + 2) := by rw [pow_add, pow_mul]
    _ = 1 := h18

theorem square_mem_of_quotient_card_four
    {A : Type*} [CommGroup A] (H : Subgroup A)
    (hQ : Nat.card (A ⧸ H) = 4) (h18 : ∀ a : A, a ^ 18 = 1) (a : A) :
    a ^ 2 ∈ H := by
  let π := QuotientGroup.mk' H
  have h4 : (π a) ^ 4 = 1 := by
    simpa only [hQ] using (pow_card_eq_one' (x := π a))
  have h18' : (π a) ^ 18 = 1 := by
    rw [← map_pow, h18 a, map_one]
  have h2 := square_eq_one_of_pow_four_and_eighteen (π a) h4 h18'
  apply (QuotientGroup.eq_one_iff (N := H) (a ^ 2)).mp
  change π (a ^ 2) = 1
  rw [map_pow]
  exact h2

private theorem fullImage_units7_card : Nat.card (ZMod 7)ˣ = 6 := by
  rw [Nat.card_eq_fintype_card, ZMod.card_units_eq_totient,
    Nat.totient_prime (by decide : Nat.Prime 7)]

private theorem fullImage_units19_card : Nat.card (ZMod 19)ˣ = 18 := by
  rw [Nat.card_eq_fintype_card, ZMod.card_units_eq_totient,
    Nat.totient_prime (by decide : Nat.Prime 19)]

theorem units_seven_nineteen_card :
    Nat.card ((ZMod 7)ˣ × (ZMod 19)ˣ) = 108 := by
  rw [Nat.card_prod, fullImage_units7_card, fullImage_units19_card]

theorem units_seven_nineteen_pow_eighteen (v : (ZMod 7)ˣ × (ZMod 19)ˣ) :
    v ^ 18 = 1 := by
  have h7 : v.1 ^ 6 = 1 := by
    simpa only [fullImage_units7_card] using (pow_card_eq_one' (x := v.1))
  have h19 : v.2 ^ 18 = 1 := by
    simpa only [fullImage_units19_card] using (pow_card_eq_one' (x := v.2))
  apply Prod.ext
  · change v.1 ^ 18 = 1
    calc
      v.1 ^ 18 = (v.1 ^ 6) ^ 3 := pow_mul v.1 6 3
      _ = 1 := by rw [h7, one_pow]
  · exact h19

theorem square_mem_of_card_twenty_seven
    (H : Subgroup ((ZMod 7)ˣ × (ZMod 19)ˣ)) (hH : Nat.card H = 27)
    (v : (ZMod 7)ˣ × (ZMod 19)ˣ) : v ^ 2 ∈ H := by
  have hcard := H.card_eq_card_quotient_mul_card_subgroup
  rw [units_seven_nineteen_card, hH] at hcard
  have hQ : Nat.card (((ZMod 7)ˣ × (ZMod 19)ˣ) ⧸ H) = 4 := by omega
  exact square_mem_of_quotient_card_four H hQ units_seven_nineteen_pow_eighteen v

theorem exists_preimage_square_of_card_twenty_seven
    {U : Type*} [Group U]
    (φ : U →* ((ZMod 7)ˣ × (ZMod 19)ˣ))
    (hφ : Function.Injective φ) (hU : Nat.card U = 27)
    (v7 : (ZMod 7)ˣ) (v19 : (ZMod 19)ˣ) :
    ∃ u, φ u = (v7 ^ 2, v19 ^ 2) := by
  have hbij : Function.Bijective φ.rangeRestrict := by
    constructor
    · intro x y h
      apply hφ
      exact congrArg (fun z : φ.range => (z : (ZMod 7)ˣ × (ZMod 19)ˣ)) h
    · exact φ.rangeRestrict_surjective
  have hcard : Nat.card φ.range = 27 :=
    (Nat.card_congr (Equiv.ofBijective φ.rangeRestrict hbij)).symm.trans hU
  have hmem := square_mem_of_card_twenty_seven φ.range hcard (v7, v19)
  change ∃ u : U, φ u = (v7 ^ 2, v19 ^ 2) at hmem
  exact hmem

end HadamardLegendre
