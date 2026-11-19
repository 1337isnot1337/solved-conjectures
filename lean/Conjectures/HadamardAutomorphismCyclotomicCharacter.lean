import Conjectures.HadamardAutomorphismCyclotomic
import Mathlib.NumberTheory.LegendreSymbol.AddCharacter

/-! The primitive character with values in the actual ring of integers,
together with the conjugation structures needed for Fourier matrices. -/

noncomputable section

namespace HadamardAutomorphism

open NumberField IsCyclotomicExtension
open scoped Pointwise

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

def integerZeta479 : 𝓞 K := (zeta_spec 479 ℚ K).toInteger

@[simp] theorem integerZeta479_coe :
    (integerZeta479 K : K) = zeta 479 ℚ K := rfl

theorem integerZeta479_primitive : IsPrimitiveRoot (integerZeta479 K) 479 :=
  (zeta_spec 479 ℚ K).toInteger_isPrimitiveRoot

def integerCyclotomicChar479 : AddChar (ZMod 479) (𝓞 K) :=
  AddChar.zmodChar 479 (integerZeta479_primitive K).pow_eq_one

theorem integerCyclotomicChar479_apply (a : ZMod 479) :
    integerCyclotomicChar479 K a = (zeta_spec 479 ℚ K).toInteger ^ a.val := rfl

theorem integerCyclotomicChar479_coe (a : ZMod 479) :
    (integerCyclotomicChar479 K a : K) = (zeta 479 ℚ K) ^ a.val := rfl

@[simp] theorem integerCyclotomicChar479_one :
    integerCyclotomicChar479 K 1 = integerZeta479 K := by
  change (integerZeta479 K) ^ (1 : ZMod 479).val = integerZeta479 K
  norm_num

theorem integerCyclotomicChar479_primitive :
    (integerCyclotomicChar479 K).IsPrimitive :=
  AddChar.zmodChar_primitive_of_primitive_root 479 (integerZeta479_primitive K)

theorem integerCyclotomicChar479_nontrivial : integerCyclotomicChar479 K ≠ 1 := by
  rw [AddChar.zmod_char_ne_one_iff, integerCyclotomicChar479_one]
  exact (integerZeta479_primitive K).ne_one (by decide)

theorem conjugation479_integerChar (a : ZMod 479) :
    conjugation479 K • integerCyclotomicChar479 K a =
      integerCyclotomicChar479 K (-a) := by
  apply RingOfIntegers.ext
  change conjugation479 K ((zeta 479 ℚ K) ^ a.val) = (zeta 479 ℚ K) ^ (-a).val
  rw [map_pow, conjugation479_zeta, inv_pow]
  exact (AddChar.map_neg_eq_inv
    (AddChar.zmodChar 479 (zeta_spec 479 ℚ K).pow_eq_one) a).symm

theorem integerCyclotomicChar479_norm (a : ZMod 479) :
    (conjugation479 K • integerCyclotomicChar479 K a) *
      integerCyclotomicChar479 K a = 1 := by
  rw [conjugation479_integerChar, ← AddChar.map_add_eq_mul,
    neg_add_cancel, AddChar.map_zero_eq_one]

/-- The intrinsic involution as an explicitly chosen star structure on the field. -/
def cyclotomicStarRing479 : StarRing K where
  star := conjugation479 K
  star_involutive := conjugation479_apply_apply K
  star_mul x y := by rw [map_mul, mul_comm]
  star_add := map_add (conjugation479 K)

/-- The same involution on the ring of integers. Install this structure locally
when applying the generic Fourier theorems. -/
def integerCyclotomicStarRing479 : StarRing (𝓞 K) where
  star x := conjugation479 K • x
  star_involutive x := by
    apply RingOfIntegers.ext
    exact conjugation479_apply_apply K (x : K)
  star_mul x y := by rw [smul_mul', mul_comm]
  star_add := smul_add (conjugation479 K)

section FieldStar

local instance : StarRing K := cyclotomicStarRing479 K

@[simp] theorem star_eq_conjugation479 (x : K) : star x = conjugation479 K x := rfl

end FieldStar

section IntegerStar

local instance : StarRing (𝓞 K) := integerCyclotomicStarRing479 K

@[simp] theorem integer_star_eq_conjugation479 (x : 𝓞 K) :
    star x = conjugation479 K • x := rfl

@[simp] theorem integer_star_coe (x : 𝓞 K) :
    ((star x : 𝓞 K) : K) = conjugation479 K (x : K) := rfl

theorem star_integerCyclotomicChar479 (a : ZMod 479) :
    star (integerCyclotomicChar479 K a) = integerCyclotomicChar479 K (-a) :=
  conjugation479_integerChar K a

theorem integerCyclotomicChar479_star_norm (a : ZMod 479) :
    star (integerCyclotomicChar479 K a) * integerCyclotomicChar479 K a = 1 :=
  integerCyclotomicChar479_norm K a

end IntegerStar

end HadamardAutomorphism
