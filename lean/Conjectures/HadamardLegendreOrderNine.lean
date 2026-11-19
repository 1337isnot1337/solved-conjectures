import Conjectures.HadamardBorderSymmetryPrime
import Mathlib.Algebra.Group.Subgroup.Finite
import Mathlib.GroupTheory.Index
import Mathlib.Tactic.IntervalCases
import Mathlib.Tactic.Push

/-!
# Actual prime-order automorphisms of an abelian group of order nine

Fixed points form an additive subgroup. Its cardinality divides nine,
and prime permutation cycles give its congruence modulo the prime.
Every nonidentity automorphism of odd prime exponent therefore has
exponent three and exactly three fixed points. Its difference from the
identity has the same three-element image and kernel.
-/

namespace HadamardLegendre

variable {R : Type*} [AddCommGroup R]

def automorphismDifference (u : Multiplicative (AddAut R)) : R →+ R :=
  u.toAdd.toAddMonoidHom - AddMonoidHom.id R

def automorphismFixedSubgroup (u : Multiplicative (AddAut R)) : AddSubgroup R where
  carrier := {x | u.toAdd x = x}
  zero_mem' := map_zero u.toAdd
  add_mem' := by
    intro x y hx hy
    simpa only [map_add, hx, hy]
  neg_mem' := by
    intro x hx
    simpa only [map_neg, hx]

@[simp]
theorem mem_automorphismFixedSubgroup (u : Multiplicative (AddAut R)) (x : R) :
    x ∈ automorphismFixedSubgroup u ↔ u.toAdd x = x := Iff.rfl

theorem automorphismDifference_ker (u : Multiplicative (AddAut R)) :
    (automorphismDifference u).ker = automorphismFixedSubgroup u := by
  ext x
  change u.toAdd x - x = 0 ↔ u.toAdd x = x
  exact sub_eq_zero

theorem automorphismDifference_commutes (u : Multiplicative (AddAut R)) (x : R) :
    automorphismDifference u (u.toAdd x) = u.toAdd (automorphismDifference u x) := by
  change u.toAdd (u.toAdd x) - u.toAdd x = u.toAdd (u.toAdd x - x)
  rw [map_sub]

theorem automorphismDifference_range_invariant (u : Multiplicative (AddAut R)) (x : R) :
    u.toAdd x ∈ (automorphismDifference u).range ↔
      x ∈ (automorphismDifference u).range := by
  constructor
  · rintro ⟨y, hy⟩
    refine ⟨u.toAdd.symm y, ?_⟩
    apply u.toAdd.injective
    rw [← automorphismDifference_commutes, u.toAdd.apply_symm_apply]
    exact hy
  · rintro ⟨y, rfl⟩
    exact ⟨u.toAdd y, automorphismDifference_commutes u y⟩

private theorem prime_fixed_count_nine (p k : ℕ) (hp : p.Prime) (hp2 : p ≠ 2)
    (hk : k ∣ 9) (hlt : k < 9) (hmod : Nat.ModEq p 9 k) :
    p = 3 ∧ k = 3 := by
  have hple : p ≤ 9 := by
    by_contra h
    have hpgt : 9 < p := by omega
    have hm := hmod
    change 9 % p = k % p at hm
    rw [Nat.mod_eq_of_lt hpgt, Nat.mod_eq_of_lt (hlt.trans hpgt)] at hm
    omega
  have hmem : k ∈ Nat.divisors 9 := Nat.mem_divisors.mpr ⟨hk, by decide⟩
  have hdivisors : Nat.divisors 9 = ({1, 3, 9} : Finset ℕ) := by decide
  rw [hdivisors] at hmem
  simp only [Finset.mem_insert, Finset.mem_singleton] at hmem
  rcases hmem with rfl | rfl | rfl
  · interval_cases p <;> norm_num [Nat.ModEq] at hp hp2 hmod
  · have hp3 : p = 3 := by
      interval_cases p <;> norm_num [Nat.ModEq] at hp hp2 hmod ⊢
    exact ⟨hp3, rfl⟩
  · omega

theorem prime_automorphism_fixed_card_nine [Finite R] (hR : Nat.card R = 9)
    (u : Multiplicative (AddAut R)) {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2)
    (hu : u ^ p = 1) (hne : u ≠ 1) :
    p = 3 ∧ Nat.card (automorphismFixedSubgroup u) = 3 := by
  classical
  let : Fintype R := Fintype.ofFinite R
  let ρ : Multiplicative (AddAut R) →* Equiv.Perm R :=
    AddMonoidHom.toMultiplicativeLeft (AddAut.toPerm R)
  have hpow : (ρ u) ^ p = 1 := by rw [← map_pow, hu, map_one]
  have hmod := HadamardBorderSymmetry.prime_permutation_card_modEq (ρ u) hp hpow
  change Nat.ModEq p (Fintype.card R) (Fintype.card (automorphismFixedSubgroup u))
    at hmod
  rw [← Nat.card_eq_fintype_card, ← Nat.card_eq_fintype_card, hR] at hmod
  have hdiv : Nat.card (automorphismFixedSubgroup u) ∣ 9 := by
    rw [← hR]
    exact (automorphismFixedSubgroup u).card_addSubgroup_dvd_card
  obtain ⟨x, hx⟩ : ∃ x : R, u.toAdd x ≠ x := by
    by_contra h
    push_neg at h
    apply hne
    change u.toAdd = 0
    ext x
    exact h x
  have hlt : Nat.card (automorphismFixedSubgroup u) < 9 := by
    have h := Fintype.card_subtype_lt (p := fun y : R => u.toAdd y = y) (x := x) hx
    change Fintype.card (automorphismFixedSubgroup u) < Fintype.card R at h
    simpa only [← Nat.card_eq_fintype_card, hR] using h
  exact prime_fixed_count_nine p _ hp hp2 hdiv hlt hmod

/-- A prime-exponent permutation of a prime-size set which fixes a point
is the identity. -/
theorem permutation_eq_one_of_prime_card_of_fixed
    {α : Type*} [Fintype α] (σ : Equiv.Perm α)
    {p : ℕ} (hp : p.Prime) (hcard : Fintype.card α = p)
    (hpow : σ ^ p = 1) (a : α) (ha : σ a = a) : σ = 1 := by
  classical
  have hmod := HadamardBorderSymmetry.prime_permutation_card_modEq σ hp hpow
  rw [hcard] at hmod
  have hd : p ∣ Fintype.card (Function.fixedPoints σ) := by
    exact Nat.modEq_zero_iff_dvd.mp (hmod.symm.trans (by simp [Nat.ModEq]))
  have hpos : 0 < Fintype.card (Function.fixedPoints σ) :=
    Fintype.card_pos_iff.mpr ⟨⟨a, ha⟩⟩
  have hle : Fintype.card (Function.fixedPoints σ) ≤ p := by
    rw [← hcard]
    exact Fintype.card_subtype_le _
  have heq := le_antisymm hle (Nat.le_of_dvd hpos hd)
  ext x
  by_contra hx
  have hlt := Fintype.card_subtype_lt (p := fun y : α => σ y = y) (x := x) hx
  change Fintype.card (Function.fixedPoints σ) < Fintype.card α at hlt
  omega

theorem order_three_difference_range_fixed [Finite R] (hR : Nat.card R = 9)
    (u : Multiplicative (AddAut R)) (hu : u ^ 3 = 1) (hne : u ≠ 1) :
    Nat.card (automorphismDifference u).range = 3 ∧
      (∀ x : R, u.toAdd (automorphismDifference u x) = automorphismDifference u x) ∧
      (automorphismDifference u).range = automorphismFixedSubgroup u := by
  classical
  let : Fintype R := Fintype.ofFinite R
  have hfixed := (prime_automorphism_fixed_card_nine hR u
    (by decide : Nat.Prime 3) (by decide) hu hne).2
  have hproduct := AddSubgroup.card_ker_mul_card_range (automorphismDifference u)
  rw [automorphismDifference_ker, hfixed, hR] at hproduct
  have hD : Nat.card (automorphismDifference u).range = 3 := by omega
  let D := (automorphismDifference u).range
  let ρ : Multiplicative (AddAut R) →* Equiv.Perm R :=
    AddMonoidHom.toMultiplicativeLeft (AddAut.toPerm R)
  let σ : Equiv.Perm D :=
    (ρ u).subtypePerm (automorphismDifference_range_invariant u)
  have hpow : (ρ u) ^ 3 = 1 := by rw [← map_pow, hu, map_one]
  have hσpow : σ ^ 3 = 1 := by
    dsimp only [σ]
    rw [Equiv.Perm.subtypePerm_pow]
    simp only [hpow]
    apply Equiv.ext
    intro x
    apply Subtype.ext
    rfl
  have hσzero : σ (0 : D) = 0 := by
    apply Subtype.ext
    exact map_zero u.toAdd
  have hσ : σ = 1 := permutation_eq_one_of_prime_card_of_fixed σ
    (by decide : Nat.Prime 3) (by simpa only [← Nat.card_eq_fintype_card] using hD)
    hσpow 0 hσzero
  have hpoint (x : R) :
      u.toAdd (automorphismDifference u x) = automorphismDifference u x := by
    exact congrArg (fun v : D => (v : R))
      (congrArg (fun τ : Equiv.Perm D => τ ⟨automorphismDifference u x, ⟨x, rfl⟩⟩) hσ)
  refine ⟨hD, hpoint, ?_⟩
  apply AddSubgroup.eq_of_le_of_card_ge
  · rintro _ ⟨x, rfl⟩
    exact hpoint x
  · rw [hD, hfixed]

theorem order_three_difference_square_zero [Finite R] (hR : Nat.card R = 9)
    (u : Multiplicative (AddAut R)) (hu : u ^ 3 = 1) (hne : u ≠ 1) (x : R) :
    automorphismDifference u (automorphismDifference u x) = 0 := by
  change u.toAdd (automorphismDifference u x) - automorphismDifference u x = 0
  rw [(order_three_difference_range_fixed hR u hu hne).2.1 x, sub_self]

end HadamardLegendre
