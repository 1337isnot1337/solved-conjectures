import Conjectures.FanTringaliProducts
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Data.Finset.Lattice.Fold

/-!
# Fan–Tringali's power-monoid length-set conjecture: radix transfer

A sufficiently large radix embeds a finite nonnegative integer lattice set
into the nonnegative integers. Every reduced divisor lies inside the original
set; the no-carry bound therefore recovers all divisors, atoms, and atomic
factorizations, including those not selected in advance.
-/

open scoped Pointwise

namespace FanTringali

/-- Little-endian radix evaluation of a vector of fixed finite length. -/
def radix (b : ℕ) : {d : ℕ} → (Fin d → ℕ) → ℕ
  | 0, _ => 0
  | d+1, x => x 0 + b * radix b (fun i : Fin d => x i.succ)

@[simp] theorem radix_zero (b d : ℕ) : radix b (0 : Fin d → ℕ) = 0 := by
  induction d with
  | zero => rfl
  | succ d ih =>
    change 0 + b * radix b (0 : Fin d → ℕ) = 0
    rw [ih]
    simp

theorem radix_add (b d : ℕ) (x y : Fin d → ℕ) :
    radix b (x+y) = radix b x + radix b y := by
  induction d with
  | zero => rfl
  | succ d ih =>
    change x 0 + y 0 + b * radix b (fun i => x i.succ + y i.succ) =
      (x 0 + b * radix b (fun i => x i.succ)) +
        (y 0 + b * radix b (fun i => y i.succ))
    have hTail := ih (fun i => x i.succ) (fun i => y i.succ)
    change radix b (fun i => x i.succ + y i.succ) =
      radix b (fun i => x i.succ) + radix b (fun i => y i.succ) at hTail
    rw [hTail, Nat.mul_add]
    ac_rfl

def radixHom (b d : ℕ) : (Fin d → ℕ) →+ ℕ where
  toFun := radix b
  map_zero' := radix_zero b d
  map_add' := radix_add b d

theorem radix_injective_bounded (b d : ℕ) (hb : 0 < b) (x y : Fin d → ℕ)
    (hx : ∀ i, x i < b) (hy : ∀ i, y i < b) (hxy : radix b x = radix b y) : x=y := by
  induction d with
  | zero => funext i; exact Fin.elim0 i
  | succ d ih =>
    have hHead : x 0 = y 0 := by
      have hm := congrArg (fun n => n % b) hxy
      simpa only [radix, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt (hx 0),
        Nat.mod_eq_of_lt (hy 0)] using hm
    have hMul : b * radix b (fun i : Fin d => x i.succ) =
        b * radix b (fun i : Fin d => y i.succ) := by
      simpa only [radix, hHead, Nat.add_left_cancel_iff] using hxy
    have hTail := ih (fun i => x i.succ) (fun i => y i.succ)
      (fun i => hx i.succ) (fun i => hy i.succ) (Nat.mul_left_cancel hb hMul)
    funext i
    exact Fin.cases hHead (fun j => congrFun hTail j) i

theorem radix_eq_zero_iff (b d : ℕ) (hb : 0 < b) (x : Fin d → ℕ) :
    radix b x = 0 ↔ x=0 := by
  constructor
  · intro hx
    induction d with
    | zero => funext i; exact Fin.elim0 i
    | succ d ih =>
      have hHead : x 0 = 0 := (Nat.add_eq_zero_iff.mp hx).1
      have hMul : b * radix b (fun i : Fin d => x i.succ) = 0 := (Nat.add_eq_zero_iff.mp hx).2
      have hTail : (fun i : Fin d => x i.succ) = 0 :=
        ih _ ((Nat.mul_eq_zero.mp hMul).resolve_left (Nat.ne_of_gt hb))
      funext i
      exact Fin.cases hHead (fun j => congrFun hTail j) i
  · rintro rfl
    exact radix_zero b d

section Enumeration

variable {ι : Type*} [Fintype ι]

/-- Relabel the coordinates by a finite ordinal. -/
noncomputable def enumerateCoordinates : (ι → ℕ) ≃+ (Fin (Fintype.card ι) → ℕ) where
  toFun x j := x ((Fintype.equivFin ι).symm j)
  invFun y i := y ((Fintype.equivFin ι) i)
  left_inv x := by funext i; simp
  right_inv y := by funext j; simp
  map_add' _ _ := rfl

/-- Additive radix encoding for an arbitrary finite coordinate type. -/
noncomputable def encodeHom (b : ℕ) : (ι → ℕ) →+ ℕ :=
  (radixHom b (Fintype.card ι)).comp enumerateCoordinates.toAddMonoidHom

theorem encode_injective_bounded (b : ℕ) (hb : 0 < b) (x y : ι → ℕ)
    (hx : ∀ i, x i < b) (hy : ∀ i, y i < b) (hxy : encodeHom b x = encodeHom b y) : x=y := by
  apply enumerateCoordinates.injective
  apply radix_injective_bounded b _ hb _ _
    (fun j => hx ((Fintype.equivFin ι).symm j))
    (fun j => hy ((Fintype.equivFin ι).symm j)) hxy

theorem encode_eq_zero_iff (b : ℕ) (hb : 0 < b) (x : ι → ℕ) :
    encodeHom b x = 0 ↔ x=0 := by
  change radix b (enumerateCoordinates x) = 0 ↔ x=0
  rw [radix_eq_zero_iff b _ hb]
  exact enumerateCoordinates.map_eq_zero_iff

end Enumeration

end FanTringali
