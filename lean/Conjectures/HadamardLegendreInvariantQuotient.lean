import Conjectures.HadamardLegendrePrimeQuotients
import Mathlib.GroupTheory.PGroup
import Mathlib.Algebra.Group.Action.End
import Mathlib.Algebra.Group.Action.TypeTags
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum.Prime

/-!
# An invariant actual quotient of order three

A group of order dividing 27 acts on the finite additive characters
R →+ ZMod 3 by precomposition. For an abelian group R of order nine,
this character group is a nontrivial elementary three-group.
The fixed-point congruence supplies a nonzero invariant character;
that character is a surjective quotient map with kernel of order three.
No classification of R or its automorphism group is used.
-/

namespace HadamardLegendre

local instance legendreInvariantQuotientPrime3 : Fact (Nat.Prime 3) := ⟨by decide⟩

variable {R : Type*} [AddCommGroup R]

theorem exists_surjective_quotient_three [Finite R] (hR : Nat.card R = 9) :
    ∃ π : R →+ ZMod 3, Function.Surjective π := by
  let : Nontrivial R := Finite.one_lt_card_iff_nontrivial.mp (by rw [hR]; decide)
  obtain ⟨p, hp, hpd, π, hπ⟩ := exists_surjective_prime_quotient R
  have hp3 : p ∣ 3 := hp.dvd_of_dvd_pow
    (show p ∣ 3 ^ 2 by simpa only [hR, show (3 : ℕ) ^ 2 = 9 by decide] using hpd)
  have hpeq : p = 3 :=
    ((show Nat.Prime 3 by decide).eq_one_or_self_of_dvd p hp3).resolve_left hp.ne_one
  subst p
  exact ⟨π, hπ⟩

theorem nonzero_hom_zmod_three_surjective (π : R →+ ZMod 3) (hπ : π ≠ 0) :
    Function.Surjective π := by
  classical
  obtain ⟨x, hx⟩ : ∃ x : R, π x ≠ 0 := by
    by_contra h
    push Not at h
    exact hπ (AddMonoidHom.ext h)
  have hvalues (z : ZMod 3) : z = 0 ∨ z = 1 ∨ z = 2 := by
    fin_cases z
    · exact Or.inl rfl
    · exact Or.inr (Or.inl rfl)
    · exact Or.inr (Or.inr rfl)
  have hx' : π x = 1 ∨ π x = 2 := (hvalues (π x)).resolve_left hx
  intro z
  rcases hvalues z with rfl | rfl | rfl
  · exact ⟨0, map_zero π⟩
  · rcases hx' with h | h
    · exact ⟨x, h⟩
    · refine ⟨-x, ?_⟩
      rw [map_neg, h]
      decide
  · rcases hx' with h | h
    · refine ⟨-x, ?_⟩
      rw [map_neg, h]
      decide
    · exact ⟨x, h⟩

@[instance_reducible]
def quotientCharacterAction {U : Type*} [Group U]
    (φ : U →* Multiplicative (AddAut R)) : MulAction U (R →+ ZMod 3) where
  smul u χ := χ.comp (φ u).toAdd.symm.toAddMonoidHom
  one_smul χ := by
    ext x
    change χ ((φ 1).toAdd.symm x) = χ x
    rw [map_one]
    rfl
  mul_smul u v χ := by
    ext x
    change χ ((φ (u * v)).toAdd.symm x) =
      χ ((φ v).toAdd.symm ((φ u).toAdd.symm x))
    rw [map_mul]
    rfl

theorem exists_invariant_quotient_three [Finite R] (hR : Nat.card R = 9)
    {U : Type*} [Group U] (hU : Nat.card U ∣ 27)
    (φ : U →* Multiplicative (AddAut R)) :
    ∃ π : R →+ ZMod 3, Function.Surjective π ∧ Nat.card π.ker = 3 ∧
      ∀ u x, π ((φ u).toAdd x) = π x := by
  classical
  let X := R →+ ZMod 3
  let : Finite X := Finite.of_injective
    (fun χ : X => (χ : R → ZMod 3)) DFunLike.coe_injective
  obtain ⟨ρ, hρ⟩ := exists_surjective_quotient_three hR
  have hρne : ρ ≠ 0 := by
    intro h
    obtain ⟨x, hx⟩ := hρ 1
    have hz := congrArg (fun χ : R →+ ZMod 3 => χ x) h
    change ρ x = 0 at hz
    rw [hx] at hz
    exact one_ne_zero hz
  let : Nontrivial X := ⟨⟨ρ, 0, hρne⟩⟩
  have hX : IsPGroup 3 (Multiplicative X) := by
    intro χ
    refine ⟨1, ?_⟩
    change (3 : ℕ) • χ.toAdd = 0
    ext x
    change (3 : ℕ) • χ.toAdd x = 0
    rw [nsmul_eq_mul]
    change (3 : ZMod 3) * χ.toAdd x = 0
    rw [show (3 : ZMod 3) = 0 by decide, zero_mul]
  have hdiv : 3 ∣ Nat.card X :=
    hX.card_eq_or_dvd.resolve_left Finite.one_lt_card.ne'
  let : MulAction U X := quotientCharacterAction φ
  have hzero : (0 : X) ∈ MulAction.fixedPoints U X := by
    intro u
    ext x
    rfl
  have hP : IsPGroup 3 U := IsPGroup.of_card_dvd_pow (n := 3) hU
  obtain ⟨π, hfix, hne⟩ :=
    hP.exists_fixed_point_of_prime_dvd_card_of_fixed_point X hdiv hzero
  have hπ : Function.Surjective π :=
    nonzero_hom_zmod_three_surjective π (fun h => hne h.symm)
  have hcard := AddSubgroup.card_ker_mul_card_of_surjective hπ
  have hthree : Nat.card (ZMod 3) = 3 := by
    rw [Nat.card_eq_fintype_card, ZMod.card]
  rw [hR, hthree] at hcard
  refine ⟨π, hπ, by omega, ?_⟩
  intro u x
  have h := congrArg (fun χ : X => χ ((φ u).toAdd x)) (hfix u)
  change π ((φ u).toAdd.symm ((φ u).toAdd x)) = π ((φ u).toAdd x) at h
  rw [(φ u).toAdd.symm_apply_apply] at h
  exact h.symm

end HadamardLegendre
