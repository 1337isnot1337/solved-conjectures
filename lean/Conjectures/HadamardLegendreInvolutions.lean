import Conjectures.HadamardLegendreCentering
import Conjectures.HadamardLegendreInversion
import Conjectures.HadamardLegendrePrimeQuotients
import Mathlib.GroupTheory.Perm.Cycle.Type

/-!
# The actual length-1197 multiplier group has odd order

The row sums and centering are derived from the original Legendre-pair
conditions. Any nonidentity involution yields an inverted prime quotient,
which the actual cyclotomic Fourier argument excludes. Cauchy's theorem
then gives odd cardinality of the full multiplier group.
-/

namespace HadamardLegendre

theorem odd_card_of_no_involutions {A : Type*} [Group A] [Finite A]
    (hA : ∀ a : A, a ^ 2 = 1 → a = 1) : Odd (Nat.card A) := by
  let : Fact (Nat.Prime 2) := ⟨by decide⟩
  apply Nat.not_even_iff_odd.mp
  intro he
  obtain ⟨a, ha⟩ := exists_prime_orderOf_dvd_card' (G := A) 2
    (even_iff_two_dvd.mp he)
  have ha2 : a ^ 2 = 1 := by
    rw [← ha]
    exact pow_orderOf_eq_one a
  have ha1 := hA a ha2
  rw [ha1, orderOf_one] at ha
  norm_num at ha

variable {G : Type*} [AddCommGroup G] [Fintype G]

theorem fixedMultiplier_no_involution (f : Rows2 G) (hf : IsLegendrePair f)
    (hcard : Fintype.card G = 1197) (u : Multiplicative (AddAut G))
    (hu : u ∈ fixedMultiplierGroup f) (hu2 : u ^ 2 = 1) (hne : u ≠ 1) :
    False := by
  have he : Function.Involutive u.toAdd := by
    intro x
    have h := congrArg (fun v : Multiplicative (AddAut G) => v.toAdd x) hu2
    change u.toAdd (u.toAdd x) = x at h
    exact h
  have hnot : u.toAdd ≠ AddEquiv.refl G := by
    intro h
    apply hne
    exact congrArg Multiplicative.ofAdd h
  obtain ⟨p, hp, hpd, π, hπ, hπu⟩ :=
    involution_has_inverting_prime_quotient u.toAdd he hnot
  have hpmod : p % 4 = 3 := by
    apply prime_divisor_1197_mod_four_three p hp
    simpa only [Nat.card_eq_fintype_card, hcard] using hpd
  let : Fact (Nat.Prime p) := ⟨hp⟩
  exact no_legendre_inverting_prime_quotient p hpmod π hπ u.toAdd hπu
    f hf hu hcard

theorem commonMultiplier_no_involution (f : Rows2 G) (hf : IsLegendrePair f)
    (hcard : Fintype.card G = 1197) (u : Multiplicative (AddAut G))
    (hu : u ∈ commonMultiplierGroup f) (hu2 : u ^ 2 = 1) (hne : u ≠ 1) :
    False := by
  have hfix : u ∈ fixedMultiplierGroup (centeredRows f) := by
    rw [← commonMultiplierGroup_eq_fixed_centeredRows f hf]
    exact hu
  exact fixedMultiplier_no_involution (centeredRows f)
    (centeredRows_isLegendrePair f hf) hcard u hfix hu2 hne

theorem commonMultiplierGroup_odd_card (f : Rows2 G) (hf : IsLegendrePair f)
    (hcard : Fintype.card G = 1197) :
    Odd (Nat.card (commonMultiplierGroup f)) := by
  let : Finite (AddAut G) :=
    Finite.of_injective (fun e : AddAut G => (e : G → G)) DFunLike.coe_injective
  apply odd_card_of_no_involutions
  intro u hu
  apply Subtype.ext
  by_contra hne
  exact commonMultiplier_no_involution f hf hcard u.val u.property
    (congrArg (fun v : commonMultiplierGroup f => v.val) hu) hne

theorem multiplier_subgroup_odd_card (f : Rows2 G) (hf : IsLegendrePair f)
    (hcard : Fintype.card G = 1197)
    (U : Subgroup (Multiplicative (AddAut G))) (hU : U ≤ commonMultiplierGroup f) :
    Odd (Nat.card U) := by
  let : Finite (AddAut G) :=
    Finite.of_injective (fun e : AddAut G => (e : G → G)) DFunLike.coe_injective
  apply odd_card_of_no_involutions
  intro u hu
  apply Subtype.ext
  by_contra hne
  exact commonMultiplier_no_involution f hf hcard u.val (hU u.property)
    (congrArg (fun v : U => v.val) hu) hne

end HadamardLegendre
