import Conjectures.HadamardLegendreOrderNine
import Mathlib.GroupTheory.PGroup
import Mathlib.Algebra.Group.Action.End
import Mathlib.Algebra.Group.Action.TypeTags

/-!
# Odd automorphism subgroups of an abelian group of order nine

Every prime divisor of the actual subgroup order is three. The fixed
points of its action form an additive subgroup of cardinality three
or nine. In the first case evaluation at a nonfixed point embeds the
automorphism subgroup into the six nonfixed points; in the second
case every automorphism is the identity. No classification of the
nine-element group or its full automorphism group is assumed.
-/

namespace HadamardLegendre

local instance legendreOrderNineGroupPrimeThree : Fact (Nat.Prime 3) := ⟨by decide⟩

variable {R : Type*} [AddCommGroup R]

def automorphismSubgroupFixed
    (U : Subgroup (Multiplicative (AddAut R))) : AddSubgroup R where
  carrier := {x | ∀ u : U, u.val.toAdd x = x}
  zero_mem' := fun u => map_zero u.val.toAdd
  add_mem' := by
    intro x y hx hy u
    rw [map_add, hx u, hy u]
  neg_mem' := by
    intro x hx u
    rw [map_neg, hx u]

@[instance_reducible]
def automorphismSubgroupAction
    (U : Subgroup (Multiplicative (AddAut R))) : MulAction U R where
  smul u x := u.val.toAdd x
  one_smul _ := rfl
  mul_smul _ _ _ := rfl

theorem automorphismSubgroupFixed_eq_top_iff
    (U : Subgroup (Multiplicative (AddAut R))) :
    automorphismSubgroupFixed U = ⊤ ↔ U = ⊥ := by
  constructor
  · intro htop
    apply le_antisymm ?_ bot_le
    intro u hu
    change u = 1
    change u.toAdd = 0
    ext x
    have hx : x ∈ automorphismSubgroupFixed U := by
      rw [htop]
      exact AddSubgroup.mem_top x
    exact hx ⟨u, hu⟩
  · rintro rfl
    apply le_antisymm le_top
    intro x _ u
    have hu : u.val = 1 := u.property
    rw [hu]
    rfl

private theorem divisor_nine_multiple_three {n : ℕ}
    (hd : n ∣ 9) (hthree : 3 ∣ n) : n = 3 ∨ n = 9 := by
  have hn : n ≤ 9 := Nat.le_of_dvd (by decide) hd
  interval_cases n <;> norm_num at *

private theorem divisor_nine_eq_nine_of_three_lt {n : ℕ}
    (hd : n ∣ 9) (hthree : 3 < n) : n = 9 := by
  have hn : n ≤ 9 := Nat.le_of_dvd (by decide) hd
  interval_cases n <;> norm_num at *

theorem odd_automorphism_subgroup_isThreeGroup [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) : IsPGroup 3 U := by
  classical
  let : Fintype R := Fintype.ofFinite R
  apply (isPGroup_iff_primeFactors_card_subset (p := 3) (G := U) (by decide)).mpr
  intro p hp
  obtain ⟨hpp, hpd, _⟩ := Nat.mem_primeFactors.mp hp
  have hp2 : p ≠ 2 := by
    intro h
    subst p
    obtain ⟨a, ha⟩ := hpd
    obtain ⟨b, hb⟩ := hodd
    omega
  let : Fact p.Prime := ⟨hpp⟩
  obtain ⟨u, hu⟩ := exists_prime_orderOf_dvd_card' (G := U) p hpd
  have horder : orderOf u.val = p := (Subgroup.orderOf_coe u).trans hu
  have hpow : u.val ^ p = 1 := by
    rw [← horder]
    exact pow_orderOf_eq_one u.val
  have hne : u.val ≠ 1 := by
    intro h
    rw [h, orderOf_one] at horder
    exact hpp.ne_one horder.symm
  have hp3 := (prime_automorphism_fixed_card_nine hR u.val hpp hp2 hpow hne).1
  rw [hp3]
  exact Nat.mem_primeFactors.mpr ⟨by decide, dvd_refl 3, by decide⟩

theorem odd_automorphism_subgroup_fixed_card [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) :
    Nat.card (automorphismSubgroupFixed U) = 3 ∨
      Nat.card (automorphismSubgroupFixed U) = 9 := by
  classical
  let : MulAction U R := automorphismSubgroupAction U
  have hP := odd_automorphism_subgroup_isThreeGroup hR U hodd
  have hmod := hP.card_modEq_card_fixedPoints R
  change Nat.ModEq 3 (Nat.card R) (Nat.card (automorphismSubgroupFixed U)) at hmod
  have hzero : Nat.ModEq 3 (Nat.card R) 0 := by rw [hR]; decide
  have hthree : 3 ∣ Nat.card (automorphismSubgroupFixed U) :=
    Nat.modEq_zero_iff_dvd.mp (hmod.symm.trans hzero)
  have hd : Nat.card (automorphismSubgroupFixed U) ∣ 9 := by
    rw [← hR]
    exact (automorphismSubgroupFixed U).card_addSubgroup_dvd_card
  exact divisor_nine_multiple_three hd hthree

/-- Two automorphisms which fix the same three-element subgroup are
determined by their value at any point outside it. -/
theorem automorphismSubgroup_evaluation_injective [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hfixed : Nat.card (automorphismSubgroupFixed U) = 3)
    (b : R) (hb : b ∉ automorphismSubgroupFixed U) :
    Function.Injective (fun u : U => u.val.toAdd b) := by
  classical
  intro u v huv
  let E : AddSubgroup R := u.val.toAdd.toAddMonoidHom.eqLocus v.val.toAdd.toAddMonoidHom
  have hle : automorphismSubgroupFixed U ≤ E := by
    intro x hx
    exact (hx u).trans (hx v).symm
  have hbE : b ∈ E := huv
  have hlt : automorphismSubgroupFixed U < E :=
    lt_of_le_not_ge hle (fun h => hb (h hbE))
  have hcardlt := AddSubgroup.card_lt_of_lt hlt
  rw [hfixed] at hcardlt
  have hdiv : Nat.card E ∣ 9 := by
    rw [← hR]
    exact E.card_addSubgroup_dvd_card
  have hE : E = ⊤ :=
    E.eq_top_of_card_eq ((divisor_nine_eq_nine_of_three_lt hdiv hcardlt).trans hR.symm)
  apply Subtype.ext
  change u.val.toAdd = v.val.toAdd
  ext x
  have hx : x ∈ E := by rw [hE]; exact AddSubgroup.mem_top x
  exact hx

theorem odd_automorphism_subgroup_card_dvd_three [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) : Nat.card U ∣ 3 := by
  classical
  let : Fintype R := Fintype.ofFinite R
  rcases odd_automorphism_subgroup_fixed_card hR U hodd with hfixed | hfixed
  · obtain ⟨b, hb⟩ : ∃ b : R, b ∉ automorphismSubgroupFixed U := by
      by_contra h
      push Not at h
      have htop : automorphismSubgroupFixed U = ⊤ := le_antisymm le_top (fun x _ => h x)
      have hc := congrArg (fun S : AddSubgroup R => Nat.card S) htop
      rw [hfixed, AddSubgroup.card_top, hR] at hc
      norm_num at hc
    have hout (u : U) : u.val.toAdd b ∉ automorphismSubgroupFixed U := by
      intro h
      have heq : u.val.toAdd b = b := u.val.toAdd.injective (h u)
      exact hb (heq ▸ h)
    let e : U → {x : R // x ∉ automorphismSubgroupFixed U} :=
      fun u => ⟨u.val.toAdd b, hout u⟩
    have hinj : Function.Injective e := by
      intro u v huv
      exact automorphismSubgroup_evaluation_injective hR U hfixed b hb
        (congrArg Subtype.val huv)
    have hcompl : Nat.card {x : R // x ∉ automorphismSubgroupFixed U} = 6 := by
      have h : Nat.card {x : R // x ∉ automorphismSubgroupFixed U} =
          Nat.card R - Nat.card (automorphismSubgroupFixed U) := by
        simpa only [← Nat.card_eq_fintype_card] using
          Fintype.card_subtype_compl (fun x : R => x ∈ automorphismSubgroupFixed U)
      rw [hR, hfixed] at h
      exact h
    have hle := Nat.card_le_card_of_injective e hinj
    rw [hcompl] at hle
    have hP := odd_automorphism_subgroup_isThreeGroup hR U hodd
    rcases hP.card_eq_or_dvd with hone | ⟨k, hk⟩
    · rw [hone]
      exact one_dvd 3
    · obtain ⟨j, hj⟩ := hodd
      have hcard : Nat.card U = 3 := by omega
      rw [hcard]
  · have htop : automorphismSubgroupFixed U = ⊤ :=
      (automorphismSubgroupFixed U).eq_top_of_card_eq (hfixed.trans hR.symm)
    rw [(automorphismSubgroupFixed_eq_top_iff U).mp htop, Subgroup.card_bot]
    exact one_dvd 3

/-- Literal auxiliary assertion from the length-1197 argument. -/
theorem odd_automorphism_subgroup_card_le_three [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) : Nat.card U ≤ 3 :=
  Nat.le_of_dvd (by decide) (odd_automorphism_subgroup_card_dvd_three hR U hodd)

theorem nontrivial_odd_automorphism_subgroup_card_eq_three [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) : Nat.card U = 3 := by
  have hd := odd_automorphism_subgroup_card_dvd_three hR U hodd
  rcases (show Nat.Prime 3 by decide).eq_one_or_self_of_dvd (Nat.card U) hd with h | h
  · exact False.elim (hne (U.eq_bot_of_card_eq h))
  · exact h

theorem nontrivial_odd_automorphism_subgroup_fixed_card_three [Finite R]
    (hR : Nat.card R = 9) (U : Subgroup (Multiplicative (AddAut R)))
    (hodd : Odd (Nat.card U)) (hne : U ≠ ⊥) :
    Nat.card (automorphismSubgroupFixed U) = 3 := by
  rcases odd_automorphism_subgroup_fixed_card hR U hodd with h | h
  · exact h
  · have htop := (automorphismSubgroupFixed U).eq_top_of_card_eq (h.trans hR.symm)
    exact False.elim (hne ((automorphismSubgroupFixed_eq_top_iff U).mp htop))

end HadamardLegendre
