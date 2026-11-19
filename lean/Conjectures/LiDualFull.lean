import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Tactic

/-!
# A dedicated dual-number ring

`TrivSqZeroExt ℚ ℚ` is definitionally `ℚ × ℚ`; using it through an `abbrev`
lets Lean pick the componentwise product ring structure.  This file provides a
structure `Dual` with the intended square-zero multiplication
`(a,b)*(c,d) = (ac, ad+bc)`, transported from `TrivSqZeroExt ℚ ℚ`.
-/

@[ext]
structure Dual where
  c0 : ℚ
  c1 : ℚ
  deriving DecidableEq, Repr

namespace Dual

def toTZ (x : Dual) : TrivSqZeroExt ℚ ℚ := ⟨x.c0, x.c1⟩

theorem toTZ_injective : Function.Injective toTZ := by
  intro x y h
  exact Dual.ext (congrArg Prod.fst h) (congrArg Prod.snd h)

instance : Zero Dual := ⟨⟨0, 0⟩⟩
instance : One Dual := ⟨⟨1, 0⟩⟩
instance : Add Dual := ⟨fun x y => ⟨x.c0 + y.c0, x.c1 + y.c1⟩⟩
instance : Mul Dual := ⟨fun x y => ⟨x.c0 * y.c0, x.c0 * y.c1 + x.c1 * y.c0⟩⟩
instance : Neg Dual := ⟨fun x => ⟨-x.c0, -x.c1⟩⟩
instance : Sub Dual := ⟨fun x y => ⟨x.c0 - y.c0, x.c1 - y.c1⟩⟩
instance : SMul ℕ Dual := ⟨fun n x => ⟨n * x.c0, n * x.c1⟩⟩
instance : SMul ℤ Dual := ⟨fun n x => ⟨n * x.c0, n * x.c1⟩⟩
instance : Pow Dual ℕ := ⟨fun x n => Nat.rec (1 : Dual) (fun _ y => x * y) n⟩
instance : NatCast Dual := ⟨fun n => ⟨n, 0⟩⟩
instance : IntCast Dual := ⟨fun z => ⟨z, 0⟩⟩

@[simp] theorem toTZ_zero : toTZ (0 : Dual) = 0 := rfl
@[simp] theorem toTZ_one : toTZ (1 : Dual) = 1 := rfl
@[simp] theorem toTZ_add (x y : Dual) : toTZ (x + y) = toTZ x + toTZ y := rfl
@[simp] theorem toTZ_mul (x y : Dual) : toTZ (x * y) = toTZ x * toTZ y := rfl
@[simp] theorem toTZ_neg (x : Dual) : toTZ (-x) = -toTZ x := rfl
@[simp] theorem toTZ_sub (x y : Dual) : toTZ (x - y) = toTZ x - toTZ y := rfl

@[simp] theorem toTZ_nsmul (n : ℕ) (x : Dual) : toTZ (n • x) = n • toTZ x := rfl
@[simp] theorem toTZ_zsmul (n : ℤ) (x : Dual) : toTZ (n • x) = n • toTZ x := rfl

theorem toTZ_pow (x : Dual) : ∀ n : ℕ, toTZ (x ^ n) = toTZ x ^ n
  | 0 => by rw [pow_zero]; rfl
  | n + 1 => by
      change toTZ (x * (x ^ n)) = toTZ x ^ (n + 1)
      rw [toTZ_mul, toTZ_pow x n, pow_succ]
      ring

@[simp] theorem toTZ_natCast (n : ℕ) : toTZ ((n : Dual)) = n := rfl
@[simp] theorem toTZ_intCast (z : ℤ) : toTZ ((z : Dual)) = z := rfl

instance : CommRing Dual :=
  Function.Injective.commRing toTZ toTZ_injective rfl rfl
    (fun _ _ => rfl) (fun _ _ => rfl) (fun _ => rfl) (fun _ _ => rfl)
    (fun _ _ => rfl) (fun _ _ => rfl) (fun x n => toTZ_pow x n)
    (fun _ => rfl) (fun _ => rfl)

def ofTZ (x : TrivSqZeroExt ℚ ℚ) : Dual := ⟨x.fst, x.snd⟩

@[simp] theorem ofTZ_toTZ (x : Dual) : ofTZ (toTZ x) = x := by cases x; rfl
@[simp] theorem toTZ_ofTZ (x : TrivSqZeroExt ℚ ℚ) : toTZ (ofTZ x) = x := by
  obtain ⟨r, m⟩ := x; rfl

@[simp] theorem fst_zero : (0 : Dual).c0 = 0 := rfl
@[simp] theorem snd_zero : (0 : Dual).c1 = 0 := rfl
@[simp] theorem fst_one : (1 : Dual).c0 = 1 := rfl
@[simp] theorem snd_one : (1 : Dual).c1 = 0 := rfl
@[simp] theorem fst_add (x y : Dual) : (x + y).c0 = x.c0 + y.c0 := rfl
@[simp] theorem snd_add (x y : Dual) : (x + y).c1 = x.c1 + y.c1 := rfl
@[simp] theorem fst_neg (x : Dual) : (-x).c0 = -x.c0 := rfl
@[simp] theorem snd_neg (x : Dual) : (-x).c1 = -x.c1 := rfl
@[simp] theorem fst_sub (x y : Dual) : (x - y).c0 = x.c0 - y.c0 := rfl
@[simp] theorem snd_sub (x y : Dual) : (x - y).c1 = x.c1 - y.c1 := rfl
@[simp] theorem fst_mul (x y : Dual) : (x * y).c0 = x.c0 * y.c0 := rfl
@[simp] theorem snd_mul (x y : Dual) : (x * y).c1 = x.c0 * y.c1 + x.c1 * y.c0 := rfl
@[simp] theorem fst_natCast (n : ℕ) : ((n : Dual)).c0 = n := rfl
@[simp] theorem snd_natCast (n : ℕ) : ((n : Dual)).c1 = 0 := rfl
@[simp] theorem fst_intCast (z : ℤ) : ((z : Dual)).c0 = z := rfl
@[simp] theorem snd_intCast (z : ℤ) : ((z : Dual)).c1 = 0 := rfl

/-- The rational numbers embed in `Dual` by `r ↦ (r, 0)`. -/
def ofRat : ℚ →+* Dual where
  toFun r := ⟨r, 0⟩
  map_zero' := rfl
  map_one' := rfl
  map_add' := by intro x y; ext <;> simp [Dual.fst_add, Dual.snd_add]
  map_mul' := by intro x y; ext <;> simp [Dual.fst_mul, Dual.snd_mul]

instance : Algebra ℚ Dual := ofRat.toAlgebra

@[simp] theorem algebraMap_eq_mk (r : ℚ) : algebraMap ℚ Dual r = Dual.mk r 0 := rfl

end Dual

example : (⟨1, 1/2⟩ : Dual) * ⟨-1, -1/2⟩ = ⟨-1, -1⟩ := by
  ext <;> norm_num

example : (∑ i : Fin 3, (![⟨1, 1/2⟩, ⟨-1, 1/2⟩, ⟨0, -1⟩] : Fin 3 → Dual) i)
    = (⟨0, 0⟩ : Dual) := by
  simp [Fin.sum_univ_three]
  apply Dual.ext <;> norm_num
