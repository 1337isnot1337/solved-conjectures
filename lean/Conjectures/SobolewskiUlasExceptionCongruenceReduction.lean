module

public import Conjectures.SobolewskiUlasExceptionThreeSquares

@[expose] public section
namespace SobolewskiUlasException

/-- The even binary-partition values have 2-adic valuation one or two,
as in Sobolewski–Ulas, Proposition 3.1. The zero input is treated apart. -/
def BinaryPartitionValuationBound : Prop :=
  ∀ n, 0<n → binaryPartitionCount (2*n)%4=2 ∨ binaryPartitionCount (2*n)%8=4

/-- The modulus-32 exception residues from Sobolewski–Ulas, Proposition 3.2. -/
def BinaryPartitionExceptionResidue : Prop :=
  ∀ n, binaryPartitionCount (2*n)%32=28 ↔ inSourceLayer n

theorem forbidden_of_mod32 (v : ℕ) (h : v%32=28) : ForbiddenThreeSquare v := by
  refine ⟨1,v/32,?_⟩
  have hv := Nat.mod_add_div v 32
  rw [h] at hv
  norm_num
  omega

theorem forbidden_iff_mod32_of_low_valuation (v : ℕ)
    (hv : v%4=2 ∨ v%8=4) :
    ForbiddenThreeSquare v ↔ v%32=28 := by
  refine ⟨?_,forbidden_of_mod32 v⟩
  rintro ⟨a,b,rfl⟩
  cases a with
  | zero =>
    simp only [pow_zero,one_mul] at hv ⊢
    omega
  | succ a =>
    cases a with
    | zero =>
      norm_num
      omega
    | succ a =>
      rw [pow_succ,pow_succ] at hv
      have hx : 4^a*4*4*(8*b+7)=16*(4^a*(8*b+7)) := by ring
      rw [hx] at hv
      omega

/-- The nontrivial direction of Legendre's three-square theorem. -/
def ThreeSquaresOfNotForbidden : Prop :=
  ∀ v : ℕ, ¬ForbiddenThreeSquare v → ∃ x y z : ℤ, (v : ℤ)=x^2+y^2+z^2

theorem positive_exception_classification_of_congruences
    (hv : BinaryPartitionValuationBound) (hr : BinaryPartitionExceptionResidue)
    (hL : ThreeSquaresOfNotForbidden) (n : ℕ) (hn : 0<n) :
    IsBinaryPartitionException n ↔ inSourceLayer n := by
  let v := binaryPartitionCount (2*n)
  have hmod : ForbiddenThreeSquare v ↔ inSourceLayer n :=
    (forbidden_iff_mod32_of_low_valuation v (hv n hn)).trans (hr n)
  constructor
  · intro hx
    exact hmod.mp (by_contra fun hb => hx (hL v hb))
  · intro hs
    exact forbidden_not_three_squares v (hmod.mpr hs)

/-- Membership in the source layers suffices for nonrepresentation, once
the binary-partition congruences identify those layers. This implication
uses only the elementary direction of the three-square criterion. -/
theorem source_layer_is_exception_of_congruences (hr : BinaryPartitionExceptionResidue)
    (n : ℕ) (hn : inSourceLayer n) : IsBinaryPartitionException n :=
  forbidden_not_three_squares _ (forbidden_of_mod32 _ ((hr n).mpr hn))

end SobolewskiUlasException
