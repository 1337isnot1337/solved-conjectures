import Conjectures.HadamardLegendreOrderNineGroup
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.QuotientGroup.Basic

/-!
# The actual orbits of an odd automorphism subgroup on nine points

A nontrivial odd subgroup has three fixed points. Its other orbits are
exactly the two nonzero cosets of that fixed subgroup, each of size three.
The action is evaluation of the actual additive automorphisms.
-/

namespace HadamardLegendre

open scoped BigOperators

variable {R : Type*} [AddCommGroup R]

private theorem subgroup_pow_three [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) (u : U) : u.val ^ 3 = 1 := by
  have hU := nontrivial_odd_automorphism_subgroup_card_eq_three hR U hodd hne
  have h : u ^ 3 = 1 := by
    simpa only [hU] using (pow_card_eq_one' (x := u))
  exact congrArg (fun v : U => v.val) h

theorem odd_automorphism_subgroup_fixed_eq_element_fixed [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) (u : U) (hu : u.val ≠ 1) :
    automorphismSubgroupFixed U = automorphismFixedSubgroup u.val := by
  have hF := nontrivial_odd_automorphism_subgroup_fixed_card_three hR U hodd hne
  have hFu := (prime_automorphism_fixed_card_nine hR u.val
    (by decide : Nat.Prime 3) (by decide) (subgroup_pow_three hR U hodd hne u) hu).2
  apply AddSubgroup.eq_of_le_of_card_ge
  · intro x hx
    exact hx u
  · rw [hF, hFu]

theorem odd_automorphism_subgroup_difference_mem_fixed [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) (u : U) (x : R) :
    u.val.toAdd x - x ∈ automorphismSubgroupFixed U := by
  by_cases hu : u.val = 1
  · rw [hu]
    change x - x ∈ automorphismSubgroupFixed U
    rw [sub_self]
    exact (automorphismSubgroupFixed U).zero_mem
  · rw [odd_automorphism_subgroup_fixed_eq_element_fixed hR U hodd hne u hu]
    exact (order_three_difference_range_fixed hR u.val
      (subgroup_pow_three hR U hodd hne u) hu).2.1 x

/-- Outside the common fixed subgroup, actual evaluation reaches every
point of the same additive coset and no other point. -/
theorem odd_automorphism_subgroup_orbit_iff_sub_mem_fixed [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥)
    (x : R) (hx : x ∉ automorphismSubgroupFixed U) (y : R) :
    (∃ u : U, u.val.toAdd x = y) ↔ y - x ∈ automorphismSubgroupFixed U := by
  have hU := nontrivial_odd_automorphism_subgroup_card_eq_three hR U hodd hne
  have hF := nontrivial_odd_automorphism_subgroup_fixed_card_three hR U hodd hne
  let d : U → automorphismSubgroupFixed U :=
    fun u => ⟨u.val.toAdd x - x,
      odd_automorphism_subgroup_difference_mem_fixed hR U hodd hne u x⟩
  have hinj : Function.Injective d := by
    intro u v huv
    apply automorphismSubgroup_evaluation_injective hR U hF x hx
    have h := congrArg (fun z : automorphismSubgroupFixed U => (z : R)) huv
    change u.val.toAdd x - x = v.val.toAdd x - x at h
    simpa only [sub_add_cancel] using congrArg (fun z : R => z + x) h
  have hsurj : Function.Surjective d :=
    ((Nat.bijective_iff_injective_and_card d).mpr ⟨hinj, hU.trans hF.symm⟩).2
  constructor
  · rintro ⟨u, rfl⟩
    exact odd_automorphism_subgroup_difference_mem_fixed hR U hodd hne u x
  · intro hy
    obtain ⟨u, hu⟩ := hsurj ⟨y - x, hy⟩
    refine ⟨u, ?_⟩
    have h := congrArg (fun z : automorphismSubgroupFixed U => (z : R)) hu
    change u.val.toAdd x - x = y - x at h
    simpa only [sub_add_cancel] using congrArg (fun z : R => z + x) h

theorem automorphism_subgroup_orbit_eq_singleton
    (U : Subgroup (Multiplicative (AddAut R)))
    (x : R) (hx : x ∈ automorphismSubgroupFixed U) :
    let _ : MulAction U R := automorphismSubgroupAction U
    MulAction.orbit U x = {x} := by
  let _ : MulAction U R := automorphismSubgroupAction U
  ext y
  change (∃ u : U, u.val.toAdd x = y) ↔ y = x
  constructor
  · rintro ⟨u, hu⟩
    exact hu.symm.trans (hx u)
  · rintro rfl
    exact ⟨1, rfl⟩

theorem odd_automorphism_subgroup_orbit_eq_coset [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥)
    (x : R) (hx : x ∉ automorphismSubgroupFixed U) :
    let _ : MulAction U R := automorphismSubgroupAction U
    MulAction.orbit U x = {y | y - x ∈ automorphismSubgroupFixed U} := by
  let _ : MulAction U R := automorphismSubgroupAction U
  ext y
  exact odd_automorphism_subgroup_orbit_iff_sub_mem_fixed hR U hodd hne x hx y

open scoped Classical in
theorem odd_automorphism_subgroup_orbit_card [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) (x : R) :
    let _ : MulAction U R := automorphismSubgroupAction U
    Nat.card (MulAction.orbit U x) =
      if x ∈ automorphismSubgroupFixed U then 1 else 3 := by
  classical
  let _ : MulAction U R := automorphismSubgroupAction U
  change Nat.card (MulAction.orbit U x) =
    if x ∈ automorphismSubgroupFixed U then 1 else 3
  by_cases hx : x ∈ automorphismSubgroupFixed U
  · rw [ite_eq_left hx, automorphism_subgroup_orbit_eq_singleton U x hx]
    exact Nat.card_of_subsingleton (⟨x, rfl⟩ : ({x} : Set R))
  · rw [ite_eq_right hx]
    change Nat.card (Set.range (fun u : U => u.val.toAdd x)) = 3
    rw [Nat.card_range_of_injective
      (automorphismSubgroup_evaluation_injective hR U
        (nontrivial_odd_automorphism_subgroup_fixed_card_three hR U hodd hne) x hx)]
    exact nontrivial_odd_automorphism_subgroup_card_eq_three hR U hodd hne

theorem odd_automorphism_subgroup_fixed_quotient_card [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) :
    Nat.card (R ⧸ automorphismSubgroupFixed U) = 3 := by
  have hF := nontrivial_odd_automorphism_subgroup_fixed_card_three hR U hodd hne
  have h := (automorphismSubgroupFixed U).card_eq_card_quotient_mul_card_addSubgroup
  rw [hR, hF] at h
  omega

theorem odd_automorphism_subgroup_two_nonzero_cosets [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) :
    Nat.card {q : R ⧸ automorphismSubgroupFixed U // q ≠ 0} = 2 := by
  classical
  let _ : Fintype (R ⧸ automorphismSubgroupFixed U) := Fintype.ofFinite _
  have hQ : Fintype.card (R ⧸ automorphismSubgroupFixed U) = 3 := by
    simpa only [Nat.card_eq_fintype_card] using
      odd_automorphism_subgroup_fixed_quotient_card hR U hodd hne
  rw [Nat.card_eq_fintype_card, Fintype.card_subtype_compl,
    Fintype.card_subtype_eq, hQ]

/-- The three singleton orbits and two nonzero cosets give exactly five
orbits of the actual automorphism subgroup. -/
theorem odd_automorphism_subgroup_orbit_count_five [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) :
    let _ : MulAction U R := automorphismSubgroupAction U
    Nat.card (MulAction.orbitRel.Quotient U R) = 5 := by
  classical
  let _ : Fintype R := Fintype.ofFinite R
  let _ : Fintype U := Fintype.ofFinite U
  let _ : MulAction U R := automorphismSubgroupAction U
  let _ : Fintype (MulAction.orbitRel.Quotient U R) := Fintype.ofFinite _
  change Nat.card (MulAction.orbitRel.Quotient U R) = 5
  have hU : Fintype.card U = 3 := by
    simpa only [Nat.card_eq_fintype_card] using
      nontrivial_odd_automorphism_subgroup_card_eq_three hR U hodd hne
  have hfixed (u : U) :
      Fintype.card (MulAction.fixedBy R u) = 3 + (if u = 1 then 6 else 0) := by
    by_cases hu : u = 1
    · subst u
      have heq : MulAction.fixedBy R (1 : U) = Set.univ := by
        ext x
        change ((1 : U).val.toAdd x = x) ↔ True
        simp only [iff_true]
        rfl
      rw [← Nat.card_eq_fintype_card, heq, Nat.card_univ, hR]
      norm_num
    · have hval : u.val ≠ 1 := by
        intro h
        exact hu (Subtype.ext h)
      have hc := (prime_automorphism_fixed_card_nine hR u.val
        (by decide : Nat.Prime 3) (by decide)
        (subgroup_pow_three hR U hodd hne u) hval).2
      change Nat.card (MulAction.fixedBy R u) = 3 at hc
      rw [Nat.card_eq_fintype_card] at hc
      simpa only [ite_eq_right hu, add_zero] using hc
  have hsum : (∑ u : U, Fintype.card (MulAction.fixedBy R u)) = 15 := by
    simp_rw [hfixed]
    rw [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ, hU,
      Fintype.sum_ite_eq', nsmul_eq_mul]
    norm_num
  have hburnside := MulAction.sum_card_fixedBy_eq_card_orbits_mul_card_group U R
  rw [hsum, hU] at hburnside
  change 15 = Fintype.card (MulAction.orbitRel.Quotient U R) * 3 at hburnside
  rw [Nat.card_eq_fintype_card]
  omega

end HadamardLegendre
