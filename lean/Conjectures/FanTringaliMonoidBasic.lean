import Conjectures.FanTringaliBasic
import Mathlib.Algebra.Group.Irreducible.Lemmas
import Mathlib.Data.Set.Finite.Basic

/-!
# Fan–Tringali's length-set conjecture

The ordinary and restricted finitary power monoids of an arbitrary monoid.
The definitions follow Fan and Tringali, *Power monoids: A bridge between
factorization theory and arithmetic combinatorics* (2018), §§2.1.1 and 3.
In particular, “infinite order” means infinitely many distinct positive
powers, not merely the absence of a positive power equal to the identity.
The latter is weaker in a monoid without cancellation.

The length predicates also retain the authors' exact convention: only the
identity has an empty-word factorization; nonidentity units have no lengths
(Lemma 2.2(iii) and Remark 2.3). They do not silently substitute the different
convention that assigns length zero to every unit.

This file proves the finite-set unit and divisor facts used in Proposition
3.2(iii). The normalization and transfer in Theorem 3.8 are proved in the
subsequent modules; no published transfer theorem is assumed.
-/

open scoped Pointwise

namespace FanTringali

section Monoid

variable {H : Type*} [Monoid H] [DecidableEq H]

/-- The source's positive-power definition of infinite order. -/
def HasInfinitePowers (u : H) : Prop :=
  Set.Infinite (Set.range fun n : ℕ => u ^ (n + 1))

/-- An atom of the ordinary finitary power monoid. -/
def PowerAtom (A : Finset H) : Prop := A.Nonempty ∧ Irreducible A

/-- The restricted power monoid consists of finite sets meeting the unit group. -/
def MeetsUnits (A : Finset H) : Prop := ∃ a ∈ A, IsUnit a

/-- The source's atom predicate when factors must meet the unit group. -/
def RestrictedAtom (A : Finset H) : Prop :=
  MeetsUnits A ∧ ¬IsUnit A ∧
    ∀ B C : Finset H, MeetsUnits B → MeetsUnits C →
      A = B * C → IsUnit B ∨ IsUnit C

/-- Literal word lengths of atomic factorizations in the ordinary power monoid. -/
def PowerLengths (A : Finset H) : Set ℕ :=
  {n | ∃ L : List (Finset H), (∀ B ∈ L, PowerAtom B) ∧ L.prod = A ∧ L.length = n}

/-- Literal word lengths of atomic factorizations in the restricted power monoid. -/
def RestrictedLengths (A : Finset H) : Set ℕ :=
  {n | ∃ L : List (Finset H), (∀ B ∈ L, RestrictedAtom B) ∧ L.prod = A ∧ L.length = n}

theorem powerAtom_iff {A : Finset H} : PowerAtom A ↔
    A.Nonempty ∧ ¬IsUnit A ∧
      ∀ B C : Finset H, B.Nonempty → C.Nonempty →
        A = B * C → IsUnit B ∨ IsUnit C := by
  constructor
  · rintro ⟨hA, h⟩
    exact ⟨hA, h.not_isUnit, fun _ _ _ _ he => h.isUnit_or_isUnit he⟩
  · rintro ⟨hA, hu, hf⟩
    refine ⟨hA, hu, ?_⟩
    intro B C he
    have hBC : (B * C).Nonempty := he ▸ hA
    exact hf B C (Finset.mul_nonempty.mp hBC).1 (Finset.mul_nonempty.mp hBC).2 he

theorem one_mem_mul {A B : Finset H} (hA : 1 ∈ A) (hB : 1 ∈ B) :
    1 ∈ A * B := by
  simpa using Finset.mul_mem_mul hA hB

theorem one_mem_list_prod {L : List (Finset H)} (hL : ∀ A ∈ L, 1 ∈ A) :
    1 ∈ L.prod := by
  induction L with
  | nil => simp
  | cons A L ih =>
    exact one_mem_mul (hL A (by simp)) (ih fun B hB => hL B (by simp [hB]))

theorem subset_mul_left_of_one {A B : Finset H} (hB : 1 ∈ B) : A ⊆ A * B := by
  intro x hx
  exact Finset.mem_mul.mpr ⟨x, hx, 1, hB, mul_one x⟩

theorem subset_mul_right_of_one {A B : Finset H} (hA : 1 ∈ A) : B ⊆ A * B := by
  intro x hx
  exact Finset.mem_mul.mpr ⟨1, hA, x, hx, one_mul x⟩

/-- Among sets containing the identity, only the identity singleton is a unit. -/
theorem finset_unit_eq_one {A : Finset H} (hA : 1 ∈ A) (hu : IsUnit A) : A = 1 := by
  obtain ⟨B, hAB, _⟩ := isUnit_iff_exists.mp hu
  have hmem : (1 : H) ∈ A * B := by rw [hAB]; simp
  obtain ⟨a, ha, b, hb, _⟩ := Finset.mem_mul.mp hmem
  have hb1 : b = 1 := by
    apply Finset.mem_one.mp
    rw [← hAB]
    simpa using Finset.mul_mem_mul hA hb
  apply Finset.Subset.antisymm
  · intro x hx
    apply Finset.mem_one.mpr
    have hxb : x * b ∈ A * B := Finset.mul_mem_mul hx hb
    rw [hAB, hb1, mul_one] at hxb
    exact Finset.mem_one.mp hxb
  · exact Finset.one_subset.mpr hA

/-- Infinitely many positive powers force injectivity even without cancellation. -/
theorem pow_injective_of_infinitePowers {u : H} (hu : HasInfinitePowers u) :
    Function.Injective (fun n : ℕ => u ^ n) := by
  have impossible (a b : ℕ) (hab : a < b) (he : u ^ a = u ^ b) : False := by
    have reduce : ∀ n : ℕ, ∃ k < b, u ^ n = u ^ k := by
      intro n
      induction n using Nat.strong_induction_on with
      | h n ih =>
        by_cases hn : n < b
        · exact ⟨n, hn, rfl⟩
        · have hm : a + (n - b) < n := by omega
          obtain ⟨k, hk, hpow⟩ := ih (a + (n - b)) hm
          refine ⟨k, hk, ?_⟩
          calc
            u ^ n = u ^ (b + (n - b)) := by congr 1; omega
            _ = u ^ b * u ^ (n - b) := pow_add _ _ _
            _ = u ^ a * u ^ (n - b) := by rw [← he]
            _ = u ^ (a + (n - b)) := (pow_add _ _ _).symm
            _ = u ^ k := hpow
    apply hu
    apply ((Finset.range b).image fun k => u ^ k).finite_toSet.subset
    rintro x ⟨n, rfl⟩
    obtain ⟨k, hk, heq⟩ := reduce (n + 1)
    exact Finset.mem_image.mpr ⟨k, Finset.mem_range.mpr hk, heq.symm⟩
  intro a b he
  by_contra hne
  rcases lt_or_gt_of_ne hne with h | h
  · exact impossible a b h he
  · exact impossible b a h he.symm

section DedekindFinite

variable [IsDedekindFiniteMonoid H]

/-- The units are precisely the singleton sets whose point is a unit. -/
theorem finset_isUnit_iff {A : Finset H} :
    IsUnit A ↔ ∃ a : H, A = {a} ∧ IsUnit a := by
  constructor
  · intro hA
    obtain ⟨B, hAB, _⟩ := isUnit_iff_exists.mp hA
    have hmem : (1 : H) ∈ A * B := by rw [hAB]; simp
    obtain ⟨a, ha, b, hb, hab⟩ := Finset.mem_mul.mp hmem
    have hbu : IsUnit b := IsUnit.of_mul_eq_one_right a hab
    refine ⟨a, ?_, IsUnit.of_mul_eq_one b hab⟩
    apply Finset.eq_singleton_iff_unique_mem.mpr
    refine ⟨ha, fun x hx => ?_⟩
    apply hbu.mul_right_cancel
    have hxb : x * b ∈ A * B := Finset.mul_mem_mul hx hb
    have hx1 : x * b = 1 := Finset.mem_one.mp (hAB ▸ hxb)
    exact hx1.trans hab.symm
  · rintro ⟨a, rfl, ha⟩
    exact ha.finset

theorem meetsUnits_mul_iff {A B : Finset H} :
    MeetsUnits (A * B) ↔ MeetsUnits A ∧ MeetsUnits B := by
  constructor
  · rintro ⟨x, hx, hu⟩
    obtain ⟨a, ha, b, hb, rfl⟩ := Finset.mem_mul.mp hx
    exact ⟨⟨a, ha, isUnit_of_mul_isUnit_left hu⟩,
      ⟨b, hb, isUnit_of_mul_isUnit_right hu⟩⟩
  · rintro ⟨⟨a, ha, hua⟩, ⟨b, hb, hub⟩⟩
    exact ⟨a * b, Finset.mul_mem_mul ha hb, hua.mul hub⟩

theorem restrictedAtom_iff {A : Finset H} (hA : MeetsUnits A) :
    RestrictedAtom A ↔ PowerAtom A := by
  constructor
  · rintro ⟨_, hu, hf⟩
    refine ⟨⟨hA.choose, hA.choose_spec.1⟩, hu, ?_⟩
    intro B C he
    have hBC := meetsUnits_mul_iff.mp (he ▸ hA)
    exact hf B C hBC.1 hBC.2 he
  · rintro ⟨_, h⟩
    exact ⟨hA, h.not_isUnit, fun _ _ _ _ he => h.isUnit_or_isUnit he⟩

theorem meetsUnits_of_mem_list {L : List (Finset H)} (hL : MeetsUnits L.prod) :
    ∀ A ∈ L, MeetsUnits A := by
  induction L with
  | nil => simp
  | cons B L ih =>
    have hBL : MeetsUnits B ∧ MeetsUnits L.prod := meetsUnits_mul_iff.mp hL
    intro A hA
    rcases List.mem_cons.mp hA with rfl | hA
    · exact hBL.1
    · exact ih hBL.2 A hA

/-- Proposition 3.2(iii), at the level of the actual length set of each element. -/
theorem restrictedLengths_eq_powerLengths {A : Finset H} (hA : MeetsUnits A) :
    RestrictedLengths A = PowerLengths A := by
  ext n
  constructor
  · rintro ⟨L, hL, hprod, hlen⟩
    refine ⟨L, ?_, hprod, hlen⟩
    intro B hB
    exact (restrictedAtom_iff (hL B hB).1).mp (hL B hB)
  · rintro ⟨L, hL, hprod, hlen⟩
    have hunit : MeetsUnits L.prod := hprod.symm ▸ hA
    refine ⟨L, ?_, hprod, hlen⟩
    intro B hB
    exact (restrictedAtom_iff (meetsUnits_of_mem_list hunit B hB)).mpr (hL B hB)

end DedekindFinite
end Monoid
end FanTringali
