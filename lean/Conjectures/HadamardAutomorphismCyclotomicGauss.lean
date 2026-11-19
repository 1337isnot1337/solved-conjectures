import Conjectures.HadamardAutomorphismCyclotomic
import Mathlib.NumberTheory.LegendreSymbol.QuadraticChar.GaussSum
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter

/-! A literal generator of the quadratic fixed field. The quadratic Gauss
sum has square -479, is fixed by 599-Frobenius, and is negated by conjugation. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

local instance gaussPrime479Fact : Fact (Nat.Prime 479) := ⟨prime_479⟩

def quadraticChar479 : MulChar (ZMod 479) K :=
  (quadraticChar (ZMod 479)).ringHomComp (Int.castRingHom K)

def cyclotomicAddChar479 : AddChar (ZMod 479) K :=
  AddChar.zmodChar 479 (zeta_spec 479 ℚ K).pow_eq_one

def quadraticGenerator479 : K := gaussSum (quadraticChar479 K) (cyclotomicAddChar479 K)

omit [NumberField K] [IsCyclotomicExtension {479} ℚ K] in
theorem quadraticChar479_neg_one : quadraticChar479 K (-1) = -1 := by
  have h : quadraticChar (ZMod 479) (-1) = -1 := by
    rw [quadraticChar_eq_pow_of_char_ne_two
      (by rw [ZMod.ringChar_zmod_n]; decide : ringChar (ZMod 479) ≠ 2)
      (neg_ne_zero.mpr one_ne_zero)]
    norm_num [ZMod.card]
    decide
  simp only [quadraticChar479, MulChar.ringHomComp_apply, h,
    Int.coe_castRingHom, Int.cast_neg, Int.cast_one]

omit [NumberField K] [IsCyclotomicExtension {479} ℚ K] in
theorem quadraticChar479_residueUnit : quadraticChar479 K (residueUnit : ZMod 479) = 1 := by
  have h : quadraticChar (ZMod 479) (599 : ZMod 479) = 1 := by
    rw [quadraticChar_eq_pow_of_char_ne_two
      (by rw [ZMod.ringChar_zmod_n]; decide : ringChar (ZMod 479) ≠ 2)
      (by decide : (599 : ZMod 479) ≠ 0)]
    norm_num only [ZMod.card, Nat.reduceDiv, residue_power, ite_true]
  simp only [quadraticChar479, MulChar.ringHomComp_apply, coe_residueUnit,
    h, Int.coe_castRingHom, Int.cast_one]

omit [IsCyclotomicExtension {479} ℚ K] in
theorem quadraticChar479_nontrivial : quadraticChar479 K ≠ 1 := by
  intro h
  have hh := quadraticChar479_neg_one K
  rw [h, MulChar.one_apply isUnit_neg_one] at hh
  exact (by norm_num : (1 : K) ≠ -1) hh

theorem quadraticGenerator479_sq : quadraticGenerator479 K ^ 2 = (-479 : K) := by
  have h := gaussSum_sq (quadraticChar479_nontrivial K)
    ((quadraticChar_isQuadratic (ZMod 479)).comp (Int.castRingHom K))
    (AddChar.zmodChar_primitive_of_primitive_root 479 (zeta_spec 479 ℚ K))
  simpa only [quadraticGenerator479, cyclotomicAddChar479,
    quadraticChar479_neg_one, ZMod.card, Nat.cast_ofNat, neg_one_mul] using h

theorem frobenius479_zeta599 :
    frobenius479 K (zeta 479 ℚ K) = (zeta 479 ℚ K) ^ 599 := by
  rw [frobenius479_zeta, pow_eq_pow_mod 599 (zeta_spec 479 ℚ K).pow_eq_one]

theorem frobenius479_addChar (a : ZMod 479) :
    frobenius479 K (cyclotomicAddChar479 K a) =
      (cyclotomicAddChar479 K).mulShift residueUnit a := by
  change frobenius479 K ((zeta 479 ℚ K) ^ a.val) =
    cyclotomicAddChar479 K ((residueUnit : ZMod 479) * a)
  have hmul : (599 : ZMod 479) * a = 599 • a := by
    simpa only [Nat.cast_ofNat] using (nsmul_eq_mul 599 a).symm
  rw [coe_residueUnit, hmul, AddChar.map_nsmul_eq_pow]
  change frobenius479 K ((zeta 479 ℚ K) ^ a.val) =
    ((zeta 479 ℚ K) ^ a.val) ^ 599
  rw [map_pow, frobenius479_zeta599, pow_right_comm]

theorem quadraticGenerator479_fixed :
    frobenius479 K (quadraticGenerator479 K) = quadraticGenerator479 K := by
  have hmap : frobenius479 K (quadraticGenerator479 K) =
      gaussSum (quadraticChar479 K) ((cyclotomicAddChar479 K).mulShift residueUnit) := by
    simp only [quadraticGenerator479, gaussSum, map_sum, map_mul,
      frobenius479_addChar, quadraticChar479, MulChar.ringHomComp_apply,
      Int.coe_castRingHom, map_intCast]
  rw [hmap]
  simpa only [quadraticChar479_residueUnit, one_mul, quadraticGenerator479] using
    gaussSum_mulShift (quadraticChar479 K) (cyclotomicAddChar479 K) residueUnit

theorem conjugation479_addChar (a : ZMod 479) :
    conjugation479 K (cyclotomicAddChar479 K a) =
      (cyclotomicAddChar479 K).mulShift (-1) a := by
  change conjugation479 K ((zeta 479 ℚ K) ^ a.val) =
    cyclotomicAddChar479 K ((-1 : ZMod 479) * a)
  rw [neg_one_mul, AddChar.map_neg_eq_inv]
  change conjugation479 K ((zeta 479 ℚ K) ^ a.val) =
    ((zeta 479 ℚ K) ^ a.val)⁻¹
  rw [map_pow, conjugation479_zeta, inv_pow]

theorem quadraticGenerator479_conjugate :
    conjugation479 K (quadraticGenerator479 K) = -quadraticGenerator479 K := by
  have hmap : conjugation479 K (quadraticGenerator479 K) =
      gaussSum (quadraticChar479 K) ((cyclotomicAddChar479 K).mulShift (-1)) := by
    simp only [quadraticGenerator479, gaussSum, map_sum, map_mul,
      conjugation479_addChar, quadraticChar479, MulChar.ringHomComp_apply,
      Int.coe_castRingHom, map_intCast]
  have h := gaussSum_mulShift (quadraticChar479 K) (cyclotomicAddChar479 K)
    (-1 : (ZMod 479)ˣ)
  rw [Units.val_neg, Units.val_one, quadraticChar479_neg_one, neg_one_mul, ← hmap] at h
  exact neg_eq_iff_eq_neg.mp h

end HadamardAutomorphism
