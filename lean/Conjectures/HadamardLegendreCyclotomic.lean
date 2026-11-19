import Conjectures.HadamardLegendreOddDegree
import Mathlib.NumberTheory.Cyclotomic.Gal
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter
import Mathlib.GroupTheory.GroupAction.FixedPoints
import Mathlib.Algebra.Algebra.Hom.Rat

/-!
# The odd-degree real fixed field of a prime cyclotomic field

Conjugation is the actual cyclotomic automorphism taking the distinguished
primitive root to its inverse. Its fixed field has odd rational degree
when the prime conductor is 3 modulo 4.
-/

noncomputable section

namespace HadamardLegendre

open NumberField IsCyclotomicExtension

variable (p : ℕ) [Fact (Nat.Prime p)]
variable (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p} ℚ K]

local instance legendreCyclotomicPrimeNeZero : NeZero p :=
  ⟨(Fact.out : Nat.Prime p).ne_zero⟩

def cyclotomicConjugation : K ≃ₐ[ℚ] K :=
  fromZetaAut (zeta_spec p ℚ K).inv
    (Polynomial.cyclotomic.irreducible_rat (Fact.out : Nat.Prime p).pos)

@[simp] theorem cyclotomicConjugation_zeta :
    cyclotomicConjugation p K (zeta p ℚ K) = (zeta p ℚ K)⁻¹ :=
  fromZetaAut_spec (zeta_spec p ℚ K).inv
    (Polynomial.cyclotomic.irreducible_rat (Fact.out : Nat.Prime p).pos)

theorem cyclotomicConjugation_sq : cyclotomicConjugation p K ^ 2 = 1 := by
  apply AlgEquiv.coe_toAlgHom_injective
  apply ((zeta_spec p ℚ K).powerBasis ℚ).algHom_ext
  simp only [AlgEquiv.coe_toAlgHom, IsPrimitiveRoot.powerBasis_gen, pow_two,
    AlgEquiv.mul_apply, AlgEquiv.one_apply]
  rw [cyclotomicConjugation_zeta, map_inv₀, cyclotomicConjugation_zeta, inv_inv]

theorem cyclotomicConjugation_ne_one (hp : p % 4 = 3) :
    cyclotomicConjugation p K ≠ 1 := by
  intro h
  have heq : zeta p ℚ K = (zeta p ℚ K)⁻¹ := by
    simpa only [h, AlgEquiv.one_apply] using cyclotomicConjugation_zeta p K
  have hsq : (zeta p ℚ K) ^ 2 = 1 := by
    calc
      (zeta p ℚ K) ^ 2 = zeta p ℚ K * zeta p ℚ K := pow_two _
      _ = zeta p ℚ K * (zeta p ℚ K)⁻¹ :=
        congrArg (fun x => zeta p ℚ K * x) heq
      _ = 1 := mul_inv_cancel₀ ((zeta_spec p ℚ K).ne_zero
        (Fact.out : Nat.Prime p).ne_zero)
  have hp2 : 2 < p := by omega
  exact (zeta_spec p ℚ K).pow_ne_one_of_pos_of_lt (by decide : 2 ≠ 0) hp2 hsq

theorem cyclotomicConjugation_order (hp : p % 4 = 3) :
    orderOf (cyclotomicConjugation p K) = 2 := by
  let : Fact (Nat.Prime 2) := ⟨by decide⟩
  exact orderOf_eq_prime (cyclotomicConjugation_sq p K)
    (cyclotomicConjugation_ne_one p K hp)

def realFixedField : IntermediateField ℚ K :=
  IntermediateField.fixedField (Subgroup.zpowers (cyclotomicConjugation p K))

theorem mem_realFixedField (x : K) :
    x ∈ realFixedField p K ↔ cyclotomicConjugation p K x = x := by
  rw [realFixedField, IntermediateField.mem_fixedField_iff]
  constructor
  · intro h
    exact h (cyclotomicConjugation p K) (Subgroup.mem_zpowers _)
  · intro hx e he
    obtain ⟨m, rfl⟩ := Subgroup.mem_zpowers_iff.mp he
    exact MulAction.mem_fixedBy_zpow
      (show x ∈ MulAction.fixedBy K (cyclotomicConjugation p K) from hx) m

theorem realFixedField_relative_degree (hp : p % 4 = 3) :
    Module.finrank (realFixedField p K) K = 2 := by
  let := Fintype.ofFinite (K ≃ₐ[ℚ] K)
  change Module.finrank
    (IntermediateField.fixedField (Subgroup.zpowers (cyclotomicConjugation p K))) K = 2
  rw [IntermediateField.finrank_fixedField_eq_card, Nat.card_eq_fintype_card,
    Fintype.card_zpowers, cyclotomicConjugation_order p K hp]

theorem prime_cyclotomic_degree : Module.finrank ℚ K = p - 1 := by
  rw [IsCyclotomicExtension.finrank K
    (Polynomial.cyclotomic.irreducible_rat (Fact.out : Nat.Prime p).pos),
    Nat.totient_prime (Fact.out : Nat.Prime p)]

theorem realFixedField_odd_finrank (hp : p % 4 = 3) :
    Odd (Module.finrank ℚ (realFixedField p K)) := by
  have h := Module.finrank_mul_finrank ℚ (realFixedField p K) K
  rw [realFixedField_relative_degree p K hp, prime_cyclotomic_degree p K] at h
  rw [Nat.odd_iff]
  omega

theorem realFixedField_no_two_squares_599 (hp : p % 4 = 3)
    (x y : realFixedField p K) : x ^ 2 + y ^ 2 ≠ 599 :=
  not_sum_two_squares_599_of_odd_finrank (realFixedField p K)
    (realFixedField_odd_finrank p K hp) x y

def cyclotomicCharacter : AddChar (ZMod p) K :=
  AddChar.zmodChar p (zeta_spec p ℚ K).pow_eq_one

@[simp] theorem cyclotomicCharacter_one :
    cyclotomicCharacter p K 1 = zeta p ℚ K := by
  change (zeta p ℚ K) ^ (1 : ZMod p).val = zeta p ℚ K
  rw [ZMod.val_one'' (Fact.out : Nat.Prime p).ne_one, pow_one]

theorem cyclotomicCharacter_nontrivial : cyclotomicCharacter p K ≠ 1 := by
  rw [AddChar.zmod_char_ne_one_iff, cyclotomicCharacter_one]
  exact (zeta_spec p ℚ K).ne_one (Fact.out : Nat.Prime p).ne_one

theorem cyclotomicConjugation_character (a : ZMod p) :
    cyclotomicConjugation p K (cyclotomicCharacter p K a) =
      cyclotomicCharacter p K (-a) := by
  change cyclotomicConjugation p K ((zeta p ℚ K) ^ a.val) =
    (zeta p ℚ K) ^ (-a).val
  rw [map_pow, cyclotomicConjugation_zeta, inv_pow]
  exact (AddChar.map_neg_eq_inv (cyclotomicCharacter p K) a).symm

end HadamardLegendre
