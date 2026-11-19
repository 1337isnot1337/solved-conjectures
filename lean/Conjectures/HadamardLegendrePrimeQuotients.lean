import Mathlib.GroupTheory.QuotientGroup.Simple
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.GroupTheory.Index
import Mathlib.Algebra.Group.Subgroup.Finite
import Mathlib.Order.Atoms.Finite
import Mathlib.Data.Fintype.Pi
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Push

/-!
# Prime quotients inverted by an actual involution

A nontrivial finite abelian group has a prime cyclic quotient. Applying
this to the image of e - id produces a surjective quotient of the original
group on which a nonidentity involution e acts by negation.
-/

namespace HadamardLegendre

theorem exists_surjective_prime_quotient (H : Type*) [AddCommGroup H]
    [Finite H] [Nontrivial H] :
    ∃ p : ℕ, Nat.Prime p ∧ p ∣ Nat.card H ∧
      ∃ π : H →+ ZMod p, Function.Surjective π := by
  classical
  let : Finite (AddSubgroup H) :=
    Finite.of_injective (fun S : AddSubgroup H => (S : Set H)) SetLike.coe_injective
  obtain ⟨M, hM, _⟩ :=
    (eq_top_or_exists_le_coatom (⊥ : AddSubgroup H)).resolve_left bot_ne_top
  let : IsSimpleAddGroup (H ⧸ M) := AddGroup.isSimpleAddGroup_of_isCoatom hM
  let e : ZMod (Nat.card (H ⧸ M)) ≃+ (H ⧸ M) :=
    zmodAddCyclicAddEquiv inferInstance
  refine ⟨Nat.card (H ⧸ M), IsSimpleAddGroup.prime_card, ?_,
    e.symm.toAddMonoidHom.comp (QuotientAddGroup.mk' M), ?_⟩
  · exact AddSubgroup.card_dvd_of_surjective (QuotientAddGroup.mk'_surjective M)
  · exact e.symm.surjective.comp (QuotientAddGroup.mk'_surjective M)

theorem involution_has_inverting_prime_quotient
    {G : Type*} [AddCommGroup G] [Finite G] (e : G ≃+ G)
    (he : Function.Involutive e) (hne : e ≠ AddEquiv.refl G) :
    ∃ p : ℕ, Nat.Prime p ∧ p ∣ Nat.card G ∧
      ∃ π : G →+ ZMod p, Function.Surjective π ∧
        ∀ x, π (e x) = -π x := by
  classical
  have hex : ∃ x : G, e x ≠ x := by
    by_contra h
    push Not at h
    apply hne
    ext x
    exact h x
  obtain ⟨x, hx⟩ := hex
  let δ : G →+ G := e.toAddMonoidHom - AddMonoidHom.id G
  let D := δ.range
  let z : D := ⟨δ x, ⟨x, rfl⟩⟩
  have hz : z ≠ 0 := by
    intro h
    have hval := congrArg (fun a : D => (a : G)) h
    change e x - x = 0 at hval
    exact hx (sub_eq_zero.mp hval)
  let : Nontrivial D := ⟨⟨z, 0, hz⟩⟩
  obtain ⟨p, hp, hpd, ρ, hρ⟩ := exists_surjective_prime_quotient D
  let π := ρ.comp δ.rangeRestrict
  refine ⟨p, hp, hpd.trans (AddSubgroup.card_range_dvd δ),
    π, hρ.comp δ.rangeRestrict_surjective, ?_⟩
  intro y
  have hδ : δ.rangeRestrict (e y) = -δ.rangeRestrict y := by
    apply Subtype.ext
    change e (e y) - e y = -(e y - y)
    rw [he y]
    abel
  change ρ (δ.rangeRestrict (e y)) = -ρ (δ.rangeRestrict y)
  rw [hδ, map_neg]

theorem prime_divisor_1197_mod_four_three (p : ℕ) (hp : Nat.Prime p)
    (hd : p ∣ 1197) : p % 4 = 3 := by
  have hd' : p ∣ (3 ^ 2 * 7) * 19 := hd
  have hvalues : p = 3 ∨ p = 7 ∨ p = 19 := by
    rcases hp.dvd_mul.mp hd' with h37 | h19
    · rcases hp.dvd_mul.mp h37 with h3 | h7
      · exact Or.inl (((show Nat.Prime 3 by decide).eq_one_or_self_of_dvd p
          (hp.dvd_of_dvd_pow h3)).resolve_left hp.ne_one)
      · exact Or.inr (Or.inl (((show Nat.Prime 7 by decide).eq_one_or_self_of_dvd p h7).resolve_left
          hp.ne_one))
    · exact Or.inr (Or.inr (((show Nat.Prime 19 by decide).eq_one_or_self_of_dvd p h19).resolve_left
        hp.ne_one))
  rcases hvalues with rfl | rfl | rfl <;> decide

end HadamardLegendre
