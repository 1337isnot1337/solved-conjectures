import Conjectures.HadamardQuotient133Model
import Mathlib.Algebra.Field.ZMod
import Mathlib.Tactic.SplitIfs
import Init.Data.List.FinRange

/-!
# The five correlation orbits of the quotient of order 133

Every shift is a simultaneous negation of independent nonzero-square scalings
of one of the five literal representatives. The finite witness checks concern
only those transformations; all correlation identities hold for arbitrary rows.
-/

namespace HadamardQuotient133

open scoped BigOperators

local instance quotient133OrbitsPrime7 : Fact (Nat.Prime 7) := ⟨by decide⟩
local instance quotient133OrbitsPrime19 : Fact (Nat.Prime 19) := ⟨by decide⟩

private theorem all_fin_true {n : ℕ} (f : Fin n → Bool)
    (h : (List.finRange n).all f = true) (i : Fin n) : f i = true :=
  (List.all_eq_true.mp h) i (List.mem_finRange i)

private theorem squareClass7_square_mul_checked :
    (List.finRange 7).all (fun u =>
      (List.finRange 7).all (fun x =>
        decide ((u : ZMod 7) = 0 ∨
          squareClass7 ((u : ZMod 7) ^ 2 * x) = squareClass7 x))) = true := by
  decide +kernel

private theorem squareClass19_square_mul_checked :
    (List.finRange 19).all (fun u =>
      (List.finRange 19).all (fun x =>
        decide ((u : ZMod 19) = 0 ∨
          squareClass19 ((u : ZMod 19) ^ 2 * x) = squareClass19 x))) = true := by
  decide +kernel

theorem squareClass7_square_mul (u x : ZMod 7) (hu : u ≠ 0) :
    squareClass7 (u ^ 2 * x) = squareClass7 x := by
  have h := all_fin_true _ (all_fin_true _ squareClass7_square_mul_checked u) x
  exact (of_decide_eq_true h).resolve_left hu

theorem squareClass19_square_mul (u x : ZMod 19) (hu : u ≠ 0) :
    squareClass19 (u ^ 2 * x) = squareClass19 x := by
  have h := all_fin_true _ (all_fin_true _ squareClass19_square_mul_checked u) x
  exact (of_decide_eq_true h).resolve_left hu

def rep7 : Fin 3 → ZMod 7 := ![0, 1, 3]
def rep19 : Fin 3 → ZMod 19 := ![0, 1, 2]

theorem squareClass7_rep7 (i : Fin 3) : squareClass7 (rep7 i) = i := by
  fin_cases i <;> decide

theorem squareClass19_rep19 (i : Fin 3) : squareClass19 (rep19 i) = i := by
  fin_cases i <;> decide

private def canonicalRoot7 : ZMod 7 → ZMod 7 :=
  ![1, 1, 3, 1, 2, 2, 3]

private def canonicalRoot19 : ZMod 19 → ZMod 19 :=
  ![1, 1, 1, 7, 2, 9, 5, 8, 2, 3, 9, 7, 5, 4, 8, 6, 4, 6, 3]

private theorem canonicalRoot7_spec (x : ZMod 7) :
    canonicalRoot7 x ≠ 0 ∧
      canonicalRoot7 x ^ 2 * rep7 (squareClass7 x) = x := by
  fin_cases x <;> decide

private theorem canonicalRoot19_spec (x : ZMod 19) :
    canonicalRoot19 x ≠ 0 ∧
      canonicalRoot19 x ^ 2 * rep19 (squareClass19 x) = x := by
  fin_cases x <;> decide

theorem squareClass7_eq_iff_square_unit (x y : ZMod 7) :
    squareClass7 x = squareClass7 y ↔
      ∃ u : (ZMod 7)ˣ, (∃ v : (ZMod 7)ˣ, v ^ 2 = u) ∧ (u : ZMod 7) * x = y := by
  constructor
  · intro hxy
    obtain ⟨hx, hxr⟩ := canonicalRoot7_spec x
    obtain ⟨hy, hyr⟩ := canonicalRoot7_spec y
    let v : (ZMod 7)ˣ := Units.mk0 (canonicalRoot7 y / canonicalRoot7 x)
      (div_ne_zero hy hx)
    refine ⟨v ^ 2, ⟨v, rfl⟩, ?_⟩
    change (canonicalRoot7 y / canonicalRoot7 x) ^ 2 * x = y
    calc
      _ = (canonicalRoot7 y / canonicalRoot7 x) ^ 2 *
          (canonicalRoot7 x ^ 2 * rep7 (squareClass7 x)) := by rw [hxr]
      _ = canonicalRoot7 y ^ 2 * rep7 (squareClass7 y) := by
        rw [hxy]
        rw [div_pow, ← mul_assoc, div_mul_cancel₀ _ (pow_ne_zero 2 hx)]
      _ = y := hyr
  · rintro ⟨u, ⟨v, rfl⟩, hxy⟩
    rw [← hxy]
    change squareClass7 x = squareClass7 ((v : ZMod 7) ^ 2 * x)
    exact (squareClass7_square_mul (v : ZMod 7) x v.ne_zero).symm

theorem squareClass19_eq_iff_square_unit (x y : ZMod 19) :
    squareClass19 x = squareClass19 y ↔
      ∃ u : (ZMod 19)ˣ, (∃ v : (ZMod 19)ˣ, v ^ 2 = u) ∧
        (u : ZMod 19) * x = y := by
  constructor
  · intro hxy
    obtain ⟨hx, hxr⟩ := canonicalRoot19_spec x
    obtain ⟨hy, hyr⟩ := canonicalRoot19_spec y
    let v : (ZMod 19)ˣ := Units.mk0 (canonicalRoot19 y / canonicalRoot19 x)
      (div_ne_zero hy hx)
    refine ⟨v ^ 2, ⟨v, rfl⟩, ?_⟩
    change (canonicalRoot19 y / canonicalRoot19 x) ^ 2 * x = y
    calc
      _ = (canonicalRoot19 y / canonicalRoot19 x) ^ 2 *
          (canonicalRoot19 x ^ 2 * rep19 (squareClass19 x)) := by rw [hxr]
      _ = canonicalRoot19 y ^ 2 * rep19 (squareClass19 y) := by
        rw [hxy]
        rw [div_pow, ← mul_assoc, div_mul_cancel₀ _ (pow_ne_zero 2 hx)]
      _ = y := hyr
  · rintro ⟨u, ⟨v, rfl⟩, hxy⟩
    rw [← hxy]
    change squareClass19 x = squareClass19 ((v : ZMod 19) ^ 2 * x)
    exact (squareClass19_square_mul (v : ZMod 19) x v.ne_zero).symm

def squareScale133 (u : ZMod 7) (v : ZMod 19)
    (x : ZMod 7 × ZMod 19) : ZMod 7 × ZMod 19 :=
  (u ^ 2 * x.1, v ^ 2 * x.2)

theorem squareScale133_add (u : ZMod 7) (v : ZMod 19)
    (x y : ZMod 7 × ZMod 19) :
    squareScale133 u v (x + y) = squareScale133 u v x + squareScale133 u v y := by
  change (u ^ 2 * (x.1 + y.1), v ^ 2 * (x.2 + y.2)) =
    (u ^ 2 * x.1 + u ^ 2 * y.1, v ^ 2 * x.2 + v ^ 2 * y.2)
  simp only [mul_add]

def squareScaleEquiv133 (u : ZMod 7) (v : ZMod 19) (hu : u ≠ 0) (hv : v ≠ 0) :
    (ZMod 7 × ZMod 19) ≃ (ZMod 7 × ZMod 19) where
  toFun := squareScale133 u v
  invFun := squareScale133 u⁻¹ v⁻¹
  left_inv x := by
    apply Prod.ext
    · change (u⁻¹) ^ 2 * (u ^ 2 * x.1) = x.1
      rw [inv_pow, ← mul_assoc, inv_mul_cancel₀ (pow_ne_zero 2 hu), one_mul]
    · change (v⁻¹) ^ 2 * (v ^ 2 * x.2) = x.2
      rw [inv_pow, ← mul_assoc, inv_mul_cancel₀ (pow_ne_zero 2 hv), one_mul]
  right_inv x := by
    apply Prod.ext
    · change u ^ 2 * ((u⁻¹) ^ 2 * x.1) = x.1
      rw [inv_pow, ← mul_assoc, mul_inv_cancel₀ (pow_ne_zero 2 hu), one_mul]
    · change v ^ 2 * ((v⁻¹) ^ 2 * x.2) = x.2
      rw [inv_pow, ← mul_assoc, mul_inv_cancel₀ (pow_ne_zero 2 hv), one_mul]

theorem expand133_squareScale (r : Row) (u : ZMod 7) (v : ZMod 19)
    (hu : u ≠ 0) (hv : v ≠ 0) (x : ZMod 7 × ZMod 19) :
    expand133 r (squareScale133 u v x) = expand133 r x := by
  exact congrArg₂ r (squareClass7_square_mul u x.1 hu)
    (squareClass19_square_mul v x.2 hv)

theorem correlation133_squareScale (r : Row) (u : ZMod 7) (v : ZMod 19)
    (hu : u ≠ 0) (hv : v ≠ 0) (t : ZMod 7 × ZMod 19) :
    correlation133 r (squareScale133 u v t) = correlation133 r t := by
  calc
    _ = ∑ x, expand133 r (squareScale133 u v x) *
        expand133 r (squareScale133 u v x + squareScale133 u v t) :=
      (Equiv.sum_comp (squareScaleEquiv133 u v hu hv)
        (fun x => expand133 r x * expand133 r (x + squareScale133 u v t))).symm
    _ = ∑ x, expand133 r x * expand133 r (x + t) := by
      apply Finset.sum_congr rfl
      intro x _
      rw [← squareScale133_add, expand133_squareScale r u v hu hv x,
        expand133_squareScale r u v hu hv (x + t)]
    _ = correlation133 r t := rfl

theorem correlation133_neg (r : Row) (t : ZMod 7 × ZMod 19) :
    correlation133 r (-t) = correlation133 r t := by
  calc
    _ = ∑ x, expand133 r (x + t) * expand133 r ((x + t) + -t) :=
      (Equiv.sum_comp (Equiv.addRight t)
        (fun x => expand133 r x * expand133 r (x + -t))).symm
    _ = ∑ x, expand133 r x * expand133 r (x + t) := by
      apply Finset.sum_congr rfl
      intro x _
      simp only [add_neg_cancel_right, mul_comm]
    _ = correlation133 r t := rfl

private def orbitWitnessTable133 :
    Fin 7 → Fin 19 → (Fin 5 × ZMod 7 × ZMod 19 × Bool) :=
  ![
  ![(0, 1, 1, false), (2, 1, 1, false), (2, 1, 6, true), (2, 1, 4, true), (2, 1, 2, false), (2, 1, 9, false), (2, 1, 5, false), (2, 1, 8, false), (2, 1, 7, true), (2, 1, 3, false), (2, 1, 3, true), (2, 1, 7, false), (2, 1, 8, true), (2, 1, 5, true), (2, 1, 9, true), (2, 1, 2, true), (2, 1, 4, false), (2, 1, 6, false), (2, 1, 1, true)],
  ![(1, 1, 1, false), (3, 1, 1, false), (4, 1, 1, false), (4, 1, 7, false), (3, 1, 2, false), (3, 1, 9, false), (3, 1, 5, false), (3, 1, 8, false), (4, 1, 2, false), (3, 1, 3, false), (4, 1, 9, false), (3, 1, 7, false), (4, 1, 5, false), (4, 1, 4, false), (4, 1, 8, false), (4, 1, 6, false), (3, 1, 4, false), (3, 1, 6, false), (4, 1, 3, false)],
  ![(1, 3, 1, false), (3, 3, 1, false), (4, 3, 1, false), (4, 3, 7, false), (3, 3, 2, false), (3, 3, 9, false), (3, 3, 5, false), (3, 3, 8, false), (4, 3, 2, false), (3, 3, 3, false), (4, 3, 9, false), (3, 3, 7, false), (4, 3, 5, false), (4, 3, 4, false), (4, 3, 8, false), (4, 3, 6, false), (3, 3, 4, false), (3, 3, 6, false), (4, 3, 3, false)],
  ![(1, 2, 1, true), (4, 2, 3, true), (3, 2, 6, true), (3, 2, 4, true), (4, 2, 6, true), (4, 2, 8, true), (4, 2, 4, true), (4, 2, 5, true), (3, 2, 7, true), (4, 2, 9, true), (3, 2, 3, true), (4, 2, 2, true), (3, 2, 8, true), (3, 2, 5, true), (3, 2, 9, true), (3, 2, 2, true), (4, 2, 7, true), (4, 2, 1, true), (3, 2, 1, true)],
  ![(1, 2, 1, false), (3, 2, 1, false), (4, 2, 1, false), (4, 2, 7, false), (3, 2, 2, false), (3, 2, 9, false), (3, 2, 5, false), (3, 2, 8, false), (4, 2, 2, false), (3, 2, 3, false), (4, 2, 9, false), (3, 2, 7, false), (4, 2, 5, false), (4, 2, 4, false), (4, 2, 8, false), (4, 2, 6, false), (3, 2, 4, false), (3, 2, 6, false), (4, 2, 3, false)],
  ![(1, 3, 1, true), (4, 3, 3, true), (3, 3, 6, true), (3, 3, 4, true), (4, 3, 6, true), (4, 3, 8, true), (4, 3, 4, true), (4, 3, 5, true), (3, 3, 7, true), (4, 3, 9, true), (3, 3, 3, true), (4, 3, 2, true), (3, 3, 8, true), (3, 3, 5, true), (3, 3, 9, true), (3, 3, 2, true), (4, 3, 7, true), (4, 3, 1, true), (3, 3, 1, true)],
  ![(1, 1, 1, true), (4, 1, 3, true), (3, 1, 6, true), (3, 1, 4, true), (4, 1, 6, true), (4, 1, 8, true), (4, 1, 4, true), (4, 1, 5, true), (3, 1, 7, true), (4, 1, 9, true), (3, 1, 3, true), (4, 1, 2, true), (3, 1, 8, true), (3, 1, 5, true), (3, 1, 9, true), (3, 1, 2, true), (4, 1, 7, true), (4, 1, 1, true), (3, 1, 1, true)]
]

def orbitWitness133 (t : ZMod 7 × ZMod 19) :
    Fin 5 × ZMod 7 × ZMod 19 × Bool :=
  orbitWitnessTable133 t.1 t.2

private def orbitWitnessCheck133 (t : ZMod 7 × ZMod 19) : Bool :=
  let w := orbitWitness133 t
  decide (w.2.1 ≠ 0 ∧ w.2.2.1 ≠ 0 ∧
    t = (if w.2.2.2 then -squareScale133 w.2.1 w.2.2.1 (shifts133 w.1)
      else squareScale133 w.2.1 w.2.2.1 (shifts133 w.1)) ∧
    (w.1 = 0 ↔ t = 0))

private theorem orbitWitness133_checked :
    (List.finRange 7).all (fun x =>
      (List.finRange 19).all (fun y => orbitWitnessCheck133 (x, y))) = true := by
  decide +kernel

theorem orbitWitness133_valid (t : ZMod 7 × ZMod 19) :
    (orbitWitness133 t).2.1 ≠ 0 ∧ (orbitWitness133 t).2.2.1 ≠ 0 ∧
      t = (if (orbitWitness133 t).2.2.2 then
        -squareScale133 (orbitWitness133 t).2.1 (orbitWitness133 t).2.2.1
          (shifts133 (orbitWitness133 t).1)
      else squareScale133 (orbitWitness133 t).2.1 (orbitWitness133 t).2.2.1
        (shifts133 (orbitWitness133 t).1)) ∧
      ((orbitWitness133 t).1 = 0 ↔ t = 0) := by
  have h := all_fin_true _ (all_fin_true _ orbitWitness133_checked t.1) t.2
  simpa only [orbitWitnessCheck133, decide_eq_true_eq] using h

theorem correlation133_orbit (t : ZMod 7 × ZMod 19) :
    ∃ k : Fin 5, (k = 0 ↔ t = 0) ∧
      ∀ r : Row, correlation133 r t = signature133 r k := by
  let w := orbitWitness133 t
  obtain ⟨hu, hv, ht, hz⟩ := orbitWitness133_valid t
  refine ⟨w.1, hz, ?_⟩
  intro r
  calc
    correlation133 r t = correlation133 r
        (if w.2.2.2 then -squareScale133 w.2.1 w.2.2.1 (shifts133 w.1)
          else squareScale133 w.2.1 w.2.2.1 (shifts133 w.1)) :=
      congrArg (correlation133 r) ht
    _ = correlation133 r (shifts133 w.1) := by
      split_ifs
      · rw [correlation133_neg, correlation133_squareScale r w.2.1 w.2.2.1 hu hv]
      · exact correlation133_squareScale r w.2.1 w.2.2.1 hu hv (shifts133 w.1)
    _ = signature133 r w.1 := correlation133_eq_signature r w.1

private theorem target133_apply (k : Fin 5) :
    target133 k = if k = 0 then 2378 else -18 := by
  fin_cases k <;> decide

theorem signatures133_suffice (a b : Row)
    (h : ∀ k, signature133 a k + signature133 b k = target133 k)
    (t : ZMod 7 × ZMod 19) :
    correlation133 a t + correlation133 b t = if t = 0 then 2378 else -18 := by
  obtain ⟨k, hk, hr⟩ := correlation133_orbit t
  calc
    _ = target133 k := by rw [hr a, hr b, h k]
    _ = if t = 0 then 2378 else -18 := by rw [target133_apply, hk]

end HadamardQuotient133
