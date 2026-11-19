import Mathlib.Algebra.Field.ZMod
import Mathlib.Algebra.Group.Action.End
import Mathlib.Algebra.Group.Action.TypeTags
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.Coset.Card
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.Tactic.NormNum.Prime

/-!
# Orbits of small multiplier groups on the border domain

The action is the actual evaluation action of additive automorphisms on
`Q × ZMod 149`. For every finite group `Q` of order four, a subgroup of
automorphisms whose order divides four has at least 151 orbits.

The four-torsion subgroup is exactly the zero fiber. Besides the fixed
origin, a point in this fiber has an orbit of size at most two: its orbit
lies among three nonzero points and its cardinality divides four. These
two small orbits improve the usual bound obtained from orbit sizes at
most four. No classification of groups of order four is required.
-/

namespace HadamardBorderSymmetry

open scoped BigOperators

local instance symmetryOrbits149Fact : Fact (Nat.Prime 149) := ⟨by norm_num⟩

/-- A permutation of prime exponent is trivial when the underlying set
has fewer points than that prime. -/
theorem permutation_eq_one_of_prime_pow_eq_one_of_card_lt {α : Type*} [Fintype α]
    (σ : Equiv.Perm α) {p : ℕ} (hp : p.Prime) (hσ : σ ^ p = 1)
    (hcard : Fintype.card α < p) : σ = 1 := by
  classical
  let : Fact p.Prime := ⟨hp⟩
  by_contra hne
  obtain ⟨n, hn⟩ := Multiset.exists_mem_of_ne_zero
    (fun h => hne (Equiv.Perm.cycleType_eq_zero.mp h))
  have hnp : n = p := Equiv.Perm.pow_prime_eq_one_iff.mp hσ n hn
  have hle := (Equiv.Perm.le_card_support_of_mem_cycleType hn).trans
    (Finset.card_le_univ σ.support)
  omega

/-- The cardinality of an actual orbit divides the cardinality of its group. -/
theorem orbit_card_dvd_group_card {G X : Type*} [Group G] [MulAction G X] (x : X) :
    Nat.card (MulAction.orbit G x) ∣ Nat.card G := by
  rw [Nat.card_congr (MulAction.orbitEquivQuotientStabilizer G x)]
  exact (MulAction.stabilizer G x).card_quotient_dvd_card

/-- A singleton orbit and a distinct orbit of size at most two give five
units of slack in an orbit bound with maximum orbit size four. -/
theorem card_add_five_le_four_mul_orbit_count {G X : Type*}
    [Group G] [MulAction G X] [Finite X]
    (hbound : ∀ x : X, Nat.card (MulAction.orbit G x) ≤ 4)
    (a b : X) (ha : Nat.card (MulAction.orbit G a) = 1)
    (hb : Nat.card (MulAction.orbit G b) ≤ 2)
    (hnot : b ∉ MulAction.orbit G a) :
    Nat.card X + 5 ≤ 4 * Nat.card (MulAction.orbitRel.Quotient G X) := by
  classical
  let Ω := MulAction.orbitRel.Quotient G X
  let : Fintype X := Fintype.ofFinite X
  let : Fintype Ω := Fintype.ofFinite Ω
  let : ∀ ω : Ω, Fintype ω.orbit := fun _ => Fintype.ofFinite _
  let oa : Ω := Quotient.mk'' a
  let ob : Ω := Quotient.mk'' b
  have hab : oa ≠ ob := by
    intro h
    exact hnot (Quotient.exact' h.symm)
  have hca : Nat.card oa.orbit = 1 := ha
  have hcb : Nat.card ob.orbit ≤ 2 := hb
  have hcard (ω : Ω) : Nat.card ω.orbit ≤ 4 := by
    refine Quotient.inductionOn' ω ?_
    intro x
    exact hbound x
  have hpoint (ω : Ω) :
      Nat.card ω.orbit + (if ω = oa then 3 else 0) +
        (if ω = ob then 2 else 0) ≤ 4 := by
    by_cases hwa : ω = oa
    · subst ω
      rw [hca]
      simp [hab]
    · by_cases hwb : ω = ob
      · subst ω
        simp only [hwa, ite_false, add_zero, ite_true]
        omega
      · simpa only [hwa, hwb, ite_false, add_zero] using hcard ω
  have htotal : (∑ ω : Ω, Nat.card ω.orbit) = Nat.card X := by
    simp only [Nat.card_eq_fintype_card]
    rw [← Fintype.card_sigma]
    exact (Fintype.card_congr (MulAction.selfEquivSigmaOrbits' G X)).symm
  have hsum := Finset.sum_le_sum (fun ω (_ : ω ∈ (Finset.univ : Finset Ω)) => hpoint ω)
  have hsuma : (∑ ω : Ω, if ω = oa then 3 else 0) = 3 := by
    simpa only [Finset.mem_univ, ite_true] using
      (Finset.sum_ite_eq' (Finset.univ : Finset Ω) oa (fun _ => (3 : ℕ)))
  have hsumb : (∑ ω : Ω, if ω = ob then 2 else 0) = 2 := by
    simpa only [Finset.mem_univ, ite_true] using
      (Finset.sum_ite_eq' (Finset.univ : Finset Ω) ob (fun _ => (2 : ℕ)))
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib, hsuma, hsumb, htotal] at hsum
  simpa only [Finset.sum_const, Finset.card_univ, smul_eq_mul, Nat.card_eq_fintype_card,
    Nat.add_assoc, Nat.reduceAdd, Nat.mul_comm] using hsum

section BorderDomain

variable {Q : Type*} [AddGroup Q]

/-- The zero fiber is the characteristic four-torsion subgroup. -/
theorem four_nsmul_eq_zero_iff_snd_eq_zero (hQ : Nat.card Q = 4)
    (x : Q × ZMod 149) : (4 : ℕ) • x = 0 ↔ x.2 = 0 := by
  have hfirst : (4 : ℕ) • x.1 = 0 := by
    simpa only [hQ] using (card_nsmul_eq_zero' (x := x.1))
  constructor
  · intro h
    have hsecond := congrArg Prod.snd h
    change (4 : ℕ) • x.2 = 0 at hsecond
    rw [nsmul_eq_mul] at hsecond
    exact (mul_eq_zero.mp hsecond).resolve_left (by norm_num)
  · intro h
    apply Prod.ext
    · exact hfirst
    · change (4 : ℕ) • x.2 = 0
      rw [h, nsmul_zero]

/-- Every additive automorphism preserves the zero fiber. -/
theorem automorphism_preserves_zero_fiber (hQ : Nat.card Q = 4)
    (e : AddAut (Q × ZMod 149)) (x : Q × ZMod 149) :
    (e x).2 = 0 ↔ x.2 = 0 := by
  rw [← four_nsmul_eq_zero_iff_snd_eq_zero hQ (e x),
    ← four_nsmul_eq_zero_iff_snd_eq_zero hQ x, ← map_nsmul]
  constructor
  · intro h
    exact e.injective (h.trans (map_zero e).symm)
  · intro h
    rw [h, map_zero]

/-- The origin is a singleton orbit for the actual automorphism action. -/
theorem automorphism_orbit_zero
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149)))) :
    MulAction.orbit U (0 : Q × ZMod 149) = {0} := by
  ext x
  constructor
  · rintro ⟨u, rfl⟩
    change u.val.toAdd (0 : Q × ZMod 149) = 0
    exact map_zero _
  · intro h
    rcases Set.mem_singleton_iff.mp h with rfl
    exact MulAction.mem_orbit_self _

/-- A nonzero zero-fiber point has at most two points in its orbit when
the automorphism subgroup has order dividing four. -/
theorem nonzero_zero_fiber_orbit_card_le_two [Finite Q]
    (hQ : Nat.card Q = 4)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hU : Nat.card U ∣ 4) (q : Q) (hq : q ≠ 0) :
    Nat.card (MulAction.orbit U (q, (0 : ZMod 149))) ≤ 2 := by
  classical
  let : Fintype Q := Fintype.ofFinite Q
  have hmem (y : MulAction.orbit U (q, (0 : ZMod 149))) :
      y.val.2 = 0 ∧ y.val.1 ≠ 0 := by
    rcases y with ⟨y, ⟨u, rfl⟩⟩
    change (u.val.toAdd (q, (0 : ZMod 149))).2 = 0 ∧
      (u.val.toAdd (q, (0 : ZMod 149))).1 ≠ 0
    have hsecond := (automorphism_preserves_zero_fiber hQ u.val.toAdd (q, 0)).mpr rfl
    refine ⟨hsecond, ?_⟩
    intro hfirst
    have hzero : u.val.toAdd (q, (0 : ZMod 149)) = 0 := Prod.ext hfirst hsecond
    have hbase : (q, (0 : ZMod 149)) = 0 :=
      u.val.toAdd.injective (hzero.trans (map_zero u.val.toAdd).symm)
    exact hq (congrArg Prod.fst hbase)
  let f : MulAction.orbit U (q, (0 : ZMod 149)) → {q : Q // q ≠ 0} :=
    fun y => ⟨y.val.1, (hmem y).2⟩
  have hf : Function.Injective f := by
    intro y z h
    apply Subtype.ext
    apply Prod.ext
    · exact congrArg Subtype.val h
    · exact (hmem y).1.trans (hmem z).1.symm
  have hlt : Nat.card {q : Q // q ≠ 0} < 4 := by
    have h := Fintype.card_subtype_lt (p := fun q : Q => q ≠ 0) (x := 0) (by simp)
    simpa only [← Nat.card_eq_fintype_card, hQ] using h
  have horbitlt := (Nat.card_le_card_of_injective f hf).trans_lt hlt
  have hdiv := (orbit_card_dvd_group_card (G := U) (q, (0 : ZMod 149))).trans hU
  have hthree : Nat.card (MulAction.orbit U (q, (0 : ZMod 149))) ≠ 3 := by
    intro h
    rw [h] at hdiv
    norm_num at hdiv
  omega

/-- Every subgroup of actual additive automorphisms of the border domain
whose order divides four leaves at least 151 sign orbits per generator. -/
theorem automorphism_orbit_count_ge_151 [Finite Q]
    (hQ : Nat.card Q = 4)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hU : Nat.card U ∣ 4) :
    151 ≤ Nat.card (MulAction.orbitRel.Quotient U (Q × ZMod 149)) := by
  classical
  let : Fintype Q := Fintype.ofFinite Q
  obtain ⟨q, hq⟩ := Fintype.exists_ne_of_one_lt_card
    (α := Q) (by simpa only [← Nat.card_eq_fintype_card, hQ] using (by decide : 1 < 4)) 0
  have hbound (x : Q × ZMod 149) : Nat.card (MulAction.orbit U x) ≤ 4 :=
    Nat.le_of_dvd (by decide) ((orbit_card_dvd_group_card (G := U) x).trans hU)
  have horigin : Nat.card (MulAction.orbit U (0 : Q × ZMod 149)) = 1 := by
    rw [automorphism_orbit_zero]
    exact Nat.card_unique
  have hnot : (q, (0 : ZMod 149)) ∉ MulAction.orbit U (0 : Q × ZMod 149) := by
    rw [automorphism_orbit_zero]
    intro h
    exact hq (congrArg Prod.fst (Set.mem_singleton_iff.mp h))
  have hcount := card_add_five_le_four_mul_orbit_count hbound 0 (q, (0 : ZMod 149))
    horigin (nonzero_zero_fiber_orbit_card_le_two hQ U hU q hq) hnot
  have htotal : Nat.card (Q × ZMod 149) = 596 := by
    rw [Nat.card_prod, hQ]
    norm_num [Nat.card_eq_fintype_card]
  rw [htotal] at hcount
  omega

end BorderDomain

end HadamardBorderSymmetry
