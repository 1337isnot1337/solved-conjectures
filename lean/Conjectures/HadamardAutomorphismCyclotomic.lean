import Conjectures.HadamardAutomorphismArithmeticBasic
import Mathlib.NumberTheory.NumberField.Cyclotomic.Galois
import Mathlib.NumberTheory.NumberField.Cyclotomic.Ideal
import Mathlib.GroupTheory.GroupAction.FixedPoints
import Mathlib.Algebra.Algebra.Hom.Rat
import Mathlib.Analysis.Complex.Basic

/-! The actual decomposition automorphism and quadratic fixed field in the
479th cyclotomic field. These are arithmetic properties of the field, not
hypotheses about a candidate Hadamard matrix. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension
open scoped Pointwise ComplexConjugate

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

local instance cyclotomicPrime599Fact : Fact (Nat.Prime 599) := ⟨prime_599⟩

instance prime599_span_isMaximal : (Ideal.span {(599 : ℤ)}).IsMaximal := by
  simpa only [Nat.cast_ofNat] using Int.ideal_span_isMaximal_of_prime 599

/-- Complex conjugation, defined intrinsically by inversion of the primitive root. -/
def conjugation479 : K ≃ₐ[ℚ] K :=
  fromZetaAut (zeta_spec 479 ℚ K).inv (Polynomial.cyclotomic.irreducible_rat (by decide))

@[simp] theorem conjugation479_zeta :
    conjugation479 K (zeta 479 ℚ K) = (zeta 479 ℚ K)⁻¹ :=
  fromZetaAut_spec (zeta_spec 479 ℚ K).inv
    (Polynomial.cyclotomic.irreducible_rat (by decide))

theorem embedding_conjugation479 (φ : K →+* ℂ) (x : K) :
    φ (conjugation479 K x) = conj (φ x) := by
  have h : (φ.comp (conjugation479 K).toRingHom).toRatAlgHom =
      ((starRingEnd ℂ).comp φ).toRatAlgHom := by
    apply ((zeta_spec 479 ℚ K).powerBasis ℚ).algHom_ext
    change φ (conjugation479 K (zeta 479 ℚ K)) = conj (φ (zeta 479 ℚ K))
    rw [conjugation479_zeta, map_inv₀]
    exact Complex.inv_eq_conj
      (Complex.norm_eq_one_of_pow_eq_one
        (((zeta_spec 479 ℚ K).map_of_injective φ.injective).pow_eq_one) (by decide))
  exact DFunLike.congr_fun h x

theorem conjugation479_sq : conjugation479 K ^ 2 = 1 := by
  apply AlgEquiv.coe_toAlgHom_injective
  apply ((zeta_spec 479 ℚ K).powerBasis ℚ).algHom_ext
  simp only [AlgEquiv.coe_toAlgHom, IsPrimitiveRoot.powerBasis_gen, pow_two,
    AlgEquiv.mul_apply, AlgEquiv.one_apply]
  rw [conjugation479_zeta, map_inv₀, conjugation479_zeta, inv_inv]

theorem conjugation479_apply_apply (x : K) :
    conjugation479 K (conjugation479 K x) = x := by
  have h := DFunLike.congr_fun (conjugation479_sq K) x
  simpa only [pow_two, AlgEquiv.mul_apply, AlgEquiv.one_apply] using h

theorem conjugation479_ne_one : conjugation479 K ≠ 1 := by
  intro h
  have heq : zeta 479 ℚ K = (zeta 479 ℚ K)⁻¹ := by
    simpa only [h, AlgEquiv.one_apply] using conjugation479_zeta K
  have hsq : (zeta 479 ℚ K) ^ 2 = 1 := by
    calc
      (zeta 479 ℚ K) ^ 2 = zeta 479 ℚ K * zeta 479 ℚ K := pow_two _
      _ = zeta 479 ℚ K * (zeta 479 ℚ K)⁻¹ := congrArg (fun x => zeta 479 ℚ K * x) heq
      _ = 1 := mul_inv_cancel₀ ((zeta_spec 479 ℚ K).ne_zero (by decide))
  exact (zeta_spec 479 ℚ K).pow_ne_one_of_pos_of_lt (by decide : 2 ≠ 0) (by decide) hsq

theorem conjugation479_order : orderOf (conjugation479 K) = 2 := by
  let : Fact (Nat.Prime 2) := ⟨by decide⟩
  exact orderOf_eq_prime (conjugation479_sq K) (conjugation479_ne_one K)

/-- The automorphism corresponding to multiplication by 599 modulo 479. -/
def frobenius479 : K ≃ₐ[ℚ] K :=
  (IsCyclotomicExtension.Rat.galEquivZMod 479 K).symm residueUnit

@[simp] theorem galEquivZMod_frobenius479 :
    IsCyclotomicExtension.Rat.galEquivZMod 479 K (frobenius479 K) = residueUnit :=
  (IsCyclotomicExtension.Rat.galEquivZMod 479 K).apply_symm_apply _

theorem frobenius479_order : orderOf (frobenius479 K) = 239 := by
  calc
    orderOf (frobenius479 K) =
        orderOf (IsCyclotomicExtension.Rat.galEquivZMod 479 K (frobenius479 K)) :=
      ((IsCyclotomicExtension.Rat.galEquivZMod 479 K).orderOf_eq _).symm
    _ = 239 := by rw [galEquivZMod_frobenius479, unit_order]

theorem frobenius479_pow : frobenius479 K ^ 239 = 1 := by
  rw [← frobenius479_order K]
  exact pow_orderOf_eq_one _

theorem frobenius479_zeta :
    frobenius479 K (zeta 479 ℚ K) = (zeta 479 ℚ K) ^ 120 := by
  rw [IsCyclotomicExtension.Rat.galEquivZMod_apply_of_pow_eq 479 K _
    (zeta_spec 479 ℚ K).pow_eq_one, galEquivZMod_frobenius479]
  rfl

/-- The field fixed by the order-239 decomposition subgroup. -/
def quadraticFixedField479 : IntermediateField ℚ K :=
  IntermediateField.fixedField (Subgroup.zpowers (frobenius479 K))

theorem mem_quadraticFixedField479 (x : K) :
    x ∈ quadraticFixedField479 K ↔ frobenius479 K x = x := by
  rw [quadraticFixedField479, IntermediateField.mem_fixedField_iff]
  constructor
  · intro h
    exact h (frobenius479 K) (Subgroup.mem_zpowers _)
  · intro hx f hf
    obtain ⟨m, rfl⟩ := Subgroup.mem_zpowers_iff.mp hf
    exact MulAction.mem_fixedBy_zpow
      (show x ∈ MulAction.fixedBy K (frobenius479 K) from hx) m

theorem quadraticFixedField479_relative_degree :
    Module.finrank (quadraticFixedField479 K) K = 239 := by
  let := Fintype.ofFinite (K ≃ₐ[ℚ] K)
  change Module.finrank
    (IntermediateField.fixedField (Subgroup.zpowers (frobenius479 K))) K = 239
  rw [IntermediateField.finrank_fixedField_eq_card, Nat.card_eq_fintype_card,
    Fintype.card_zpowers, frobenius479_order K]

theorem cyclotomic479_degree : Module.finrank ℚ K = 478 := by
  rw [IsCyclotomicExtension.Rat.finrank 479 K, Nat.totient_prime prime_479]

theorem quadraticFixedField479_degree :
    Module.finrank ℚ (quadraticFixedField479 K) = 2 := by
  have h := Module.finrank_mul_finrank ℚ (quadraticFixedField479 K) K
  rw [quadraticFixedField479_relative_degree K, cyclotomic479_degree K] at h
  omega

theorem prime599_inertia_degree :
    (Ideal.span {(599 : ℤ)}).inertiaDegIn (𝓞 K) = 239 := by
  simpa only [Nat.cast_ofNat, residue_order] using
    IsCyclotomicExtension.Rat.inertiaDegIn_eq_of_not_dvd
      (m := 479) 599 K (by decide)

theorem prime599_ramification_index :
    (Ideal.span {(599 : ℤ)}).ramificationIdxIn (𝓞 K) = 1 := by
  simpa only [Nat.cast_ofNat] using
    IsCyclotomicExtension.Rat.ramificationIdxIn_eq_of_not_dvd
      (m := 479) 599 K (by decide)

theorem prime599_number_of_primes :
    ((Ideal.span {(599 : ℤ)}).primesOver (𝓞 K)).ncard = 2 := by
  let : IsGalois ℚ K := IsCyclotomicExtension.isGalois {479} ℚ K
  have h := Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn
    (Ideal.span {(599 : ℤ)}) (𝓞 K) (K ≃ₐ[ℚ] K)
  rw [prime599_ramification_index K, prime599_inertia_degree K,
    IsGaloisGroup.card_eq_finrank (K ≃ₐ[ℚ] K) ℚ K, cyclotomic479_degree K] at h
  omega

theorem frobenius479_mem_stabilizer (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    frobenius479 K ∈ MulAction.stabilizer (K ≃ₐ[ℚ] K) P := by
  have h := IsCyclotomicExtension.Rat.galEquivZMod_stabilizer 479 K 599 P
    (by decide : Nat.Coprime 599 479)
  have hm : residueUnit ∈ (IsCyclotomicExtension.Rat.galEquivZMod 479 K).mapSubgroup
      (MulAction.stabilizer (K ≃ₐ[ℚ] K) P) := by
    rw [h]
    exact Subgroup.mem_zpowers _
  exact (Subgroup.mem_map_equiv
    (f := IsCyclotomicExtension.Rat.galEquivZMod 479 K)).mp hm

theorem frobenius479_fixes_prime (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] : frobenius479 K • P = P :=
  frobenius479_mem_stabilizer K P

theorem conjugation479_moves_prime (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] : conjugation479 K • P ≠ P := by
  intro hfix
  have hm := IsCyclotomicExtension.Rat.mem_zpowers_galEquivZMod_of_mem_stabilizer
    479 K 599 P (by decide : Nat.Coprime 599 479)
    (show conjugation479 K ∈ MulAction.stabilizer (K ≃ₐ[ℚ] K) P from hfix)
  change IsCyclotomicExtension.Rat.galEquivZMod 479 K (conjugation479 K) ∈
    Subgroup.zpowers residueUnit at hm
  have hd := orderOf_dvd_natCard
    (⟨IsCyclotomicExtension.Rat.galEquivZMod 479 K (conjugation479 K), hm⟩ :
      Subgroup.zpowers residueUnit)
  rw [Subgroup.orderOf_mk, Nat.card_zpowers, unit_order,
    (IsCyclotomicExtension.Rat.galEquivZMod 479 K).orderOf_eq,
    conjugation479_order K] at hd
  norm_num at hd

theorem prime599_primes_eq_pair (P : Ideal (𝓞 K)) [P.IsMaximal]
    [P.LiesOver (Ideal.span {(599 : ℤ)})] :
    (Ideal.span {(599 : ℤ)}).primesOver (𝓞 K) = {P, conjugation479 K • P} := by
  have hP : P ∈ (Ideal.span {(599 : ℤ)}).primesOver (𝓞 K) :=
    ⟨inferInstance, inferInstance⟩
  have hQ : conjugation479 K • P ∈ (Ideal.span {(599 : ℤ)}).primesOver (𝓞 K) :=
    ⟨inferInstance, inferInstance⟩
  have hne := (conjugation479_moves_prime K P).symm
  exact (Set.eq_of_subset_of_ncard_le (Set.pair_subset hP hQ)
    (by rw [prime599_number_of_primes K, Set.ncard_pair hne])
    (Set.finite_of_ncard_ne_zero (by rw [prime599_number_of_primes K]; decide))).symm

end HadamardAutomorphism
