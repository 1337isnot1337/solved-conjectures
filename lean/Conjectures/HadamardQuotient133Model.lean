import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum
import Lean.Elab.Tactic.Omega
import Mathlib.Tactic.Ring

namespace HadamardQuotient133

attribute [local instance 2000] Fintype.decidableForallFintype
attribute [local instance 2000] Fintype.decidableExistsFintype

open scoped BigOperators

abbrev Triple := Fin 3 → ℤ
abbrev Row := Fin 3 → Triple

def squareClass7 (x : ZMod 7) : Fin 3 :=
  ![0, 1, 1, 2, 1, 2, 2] x

def squareClass19 (x : ZMod 19) : Fin 3 :=
  ![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] x

theorem squareClass7_eq_zero : ∀ x, squareClass7 x = 0 ↔ x = 0 := by
  decide +kernel

theorem squareClass19_eq_zero : ∀ x, squareClass19 x = 0 ↔ x = 0 := by
  decide +kernel

theorem squareClass7_eq_one :
    ∀ x, squareClass7 x = 1 ↔ ∃ y : ZMod 7, y ≠ 0 ∧ y * y = x := by
  decide +kernel

theorem squareClass19_eq_one :
    ∀ x, squareClass19 x = 1 ↔ ∃ y : ZMod 19, y ≠ 0 ∧ y * y = x := by
  decide +kernel

def expand133 (r : Row) (x : ZMod 7 × ZMod 19) : ℤ :=
  r (squareClass7 x.1) (squareClass19 x.2)

def correlation133 (r : Row) (t : ZMod 7 × ZMod 19) : ℤ :=
  ∑ x, expand133 r x * expand133 r (x + t)

def tripleSum (r : Triple) : ℤ := r 0 + 9 * (r 1 + r 2)

def tripleEnergy (r : Triple) : ℤ := r 0 ^ 2 + 9 * (r 1 ^ 2 + r 2 ^ 2)

def weightedSum (r : Row) : ℤ :=
  tripleSum (r 0) + 3 * (tripleSum (r 1) + tripleSum (r 2))

def energy133 (r : Row) : ℤ :=
  tripleEnergy (r 0) + 3 * (tripleEnergy (r 1) + tripleEnergy (r 2))

def shifts133 : Fin 5 → ZMod 7 × ZMod 19 :=
  ![(0, 0), (1, 0), (0, 1), (1, 1), (1, 2)]

def signature133 (r : Row) : Fin 5 → ℤ :=
  ![(r 0 0) * (r 0 0) +
      9 * (r 0 1) * (r 0 1) +
      9 * (r 0 2) * (r 0 2) +
      3 * (r 1 0) * (r 1 0) +
      27 * (r 1 1) * (r 1 1) +
      27 * (r 1 2) * (r 1 2) +
      3 * (r 2 0) * (r 2 0) +
      27 * (r 2 1) * (r 2 1) +
      27 * (r 2 2) * (r 2 2),
    (r 0 0) * (r 1 0) +
      (r 0 0) * (r 2 0) +
      9 * (r 0 1) * (r 1 1) +
      9 * (r 0 1) * (r 2 1) +
      9 * (r 0 2) * (r 1 2) +
      9 * (r 0 2) * (r 2 2) +
      (r 1 0) * (r 1 0) +
      3 * (r 1 0) * (r 2 0) +
      9 * (r 1 1) * (r 1 1) +
      27 * (r 1 1) * (r 2 1) +
      9 * (r 1 2) * (r 1 2) +
      27 * (r 1 2) * (r 2 2) +
      (r 2 0) * (r 2 0) +
      9 * (r 2 1) * (r 2 1) +
      9 * (r 2 2) * (r 2 2),
    (r 0 0) * (r 0 1) +
      (r 0 0) * (r 0 2) +
      4 * (r 0 1) * (r 0 1) +
      9 * (r 0 1) * (r 0 2) +
      4 * (r 0 2) * (r 0 2) +
      3 * (r 1 0) * (r 1 1) +
      3 * (r 1 0) * (r 1 2) +
      12 * (r 1 1) * (r 1 1) +
      27 * (r 1 1) * (r 1 2) +
      12 * (r 1 2) * (r 1 2) +
      3 * (r 2 0) * (r 2 1) +
      3 * (r 2 0) * (r 2 2) +
      12 * (r 2 1) * (r 2 1) +
      27 * (r 2 1) * (r 2 2) +
      12 * (r 2 2) * (r 2 2),
    (r 0 0) * (r 1 1) +
      (r 0 0) * (r 2 2) +
      4 * (r 0 1) * (r 1 1) +
      5 * (r 0 1) * (r 1 2) +
      (r 0 1) * (r 2 0) +
      4 * (r 0 1) * (r 2 1) +
      4 * (r 0 1) * (r 2 2) +
      (r 0 2) * (r 1 0) +
      4 * (r 0 2) * (r 1 1) +
      4 * (r 0 2) * (r 1 2) +
      5 * (r 0 2) * (r 2 1) +
      4 * (r 0 2) * (r 2 2) +
      (r 1 0) * (r 1 1) +
      (r 1 0) * (r 1 2) +
      2 * (r 1 0) * (r 2 1) +
      (r 1 0) * (r 2 2) +
      4 * (r 1 1) * (r 1 1) +
      9 * (r 1 1) * (r 1 2) +
      (r 1 1) * (r 2 0) +
      12 * (r 1 1) * (r 2 1) +
      14 * (r 1 1) * (r 2 2) +
      4 * (r 1 2) * (r 1 2) +
      2 * (r 1 2) * (r 2 0) +
      13 * (r 1 2) * (r 2 1) +
      12 * (r 1 2) * (r 2 2) +
      (r 2 0) * (r 2 1) +
      (r 2 0) * (r 2 2) +
      4 * (r 2 1) * (r 2 1) +
      9 * (r 2 1) * (r 2 2) +
      4 * (r 2 2) * (r 2 2),
    (r 0 0) * (r 1 2) +
      (r 0 0) * (r 2 1) +
      (r 0 1) * (r 1 0) +
      4 * (r 0 1) * (r 1 1) +
      4 * (r 0 1) * (r 1 2) +
      4 * (r 0 1) * (r 2 1) +
      5 * (r 0 1) * (r 2 2) +
      5 * (r 0 2) * (r 1 1) +
      4 * (r 0 2) * (r 1 2) +
      (r 0 2) * (r 2 0) +
      4 * (r 0 2) * (r 2 1) +
      4 * (r 0 2) * (r 2 2) +
      (r 1 0) * (r 1 1) +
      (r 1 0) * (r 1 2) +
      (r 1 0) * (r 2 1) +
      2 * (r 1 0) * (r 2 2) +
      4 * (r 1 1) * (r 1 1) +
      9 * (r 1 1) * (r 1 2) +
      2 * (r 1 1) * (r 2 0) +
      12 * (r 1 1) * (r 2 1) +
      13 * (r 1 1) * (r 2 2) +
      4 * (r 1 2) * (r 1 2) +
      (r 1 2) * (r 2 0) +
      14 * (r 1 2) * (r 2 1) +
      12 * (r 1 2) * (r 2 2) +
      (r 2 0) * (r 2 1) +
      (r 2 0) * (r 2 2) +
      4 * (r 2 1) * (r 2 1) +
      9 * (r 2 1) * (r 2 2) +
      4 * (r 2 2) * (r 2 2)]

theorem sum_expand133 (r : Row) :
    (∑ x, expand133 r x) = weightedSum r := by
  change (∑ x : Fin 7 × Fin 19, expand133 r x) = weightedSum r
  norm_num [expand133, weightedSum, tripleSum, Fintype.sum_prod_type,
    Fin.sum_univ_succ, squareClass7, squareClass19]
  ring

private theorem squareClass7_shift_1 :
    ∀ x : ZMod 7, squareClass7 (x + 1) = (![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x) := by
  decide +kernel

private theorem squareClass7_shift_3 :
    ∀ x : ZMod 7, squareClass7 (x + 3) = (![2, 1, 2, 2, 0, 1, 1] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x) := by
  decide +kernel

private theorem squareClass19_shift_1 :
    ∀ x : ZMod 19, squareClass19 (x + 1) = (![1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0] : Fin 19 → Fin 3) ((ZMod.finEquiv 19).symm x) := by
  decide +kernel

private theorem squareClass19_shift_2 :
    ∀ x : ZMod 19, squareClass19 (x + 2) = (![2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0, 1] : Fin 19 → Fin 3) ((ZMod.finEquiv 19).symm x) := by
  decide +kernel

private theorem zmod3_shift_one :
    ∀ x : ZMod 3, (ZMod.finEquiv 3).symm (x + 1) =
      (![1, 2, 0] : Fin 3 → Fin 3) ((ZMod.finEquiv 3).symm x) := by
  decide +kernel

private theorem correlation133_eq_signature_0 (r : Row) :
    correlation133 r (shifts133 0) = signature133 r 0 := by
  let g : ZMod 7 × ZMod 19 → ℤ := fun x =>
    r (squareClass7 x.1) (squareClass19 x.2) * r (squareClass7 x.1) (squareClass19 x.2)
  have hg (x : ZMod 7 × ZMod 19) :
      expand133 r x * expand133 r (x + shifts133 0) = g x := by
    change r (squareClass7 x.1) (squareClass19 x.2) * r (squareClass7 (x.1 + 0)) (squareClass19 (x.2 + 0)) = g x
    simp only [g, add_zero]
  calc
    correlation133 r (shifts133 0) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature133 r 0 := by
      let e : Fin 7 × Fin 19 ≃ ZMod 7 × ZMod 19 :=
        (ZMod.finEquiv 7).toEquiv.prodCongr (ZMod.finEquiv 19).toEquiv
      let f : Fin 7 × Fin 19 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.1) ((![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] : Fin 19 → Fin 3) x.2) *
          r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.1) ((![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] : Fin 19 → Fin 3) x.2)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature133, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation133_eq_signature_1 (r : Row) :
    correlation133 r (shifts133 1) = signature133 r 1 := by
  let g : ZMod 7 × ZMod 19 → ℤ := fun x =>
    r (squareClass7 x.1) (squareClass19 x.2) * r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x.1)) (squareClass19 x.2)
  have hg (x : ZMod 7 × ZMod 19) :
      expand133 r x * expand133 r (x + shifts133 1) = g x := by
    change r (squareClass7 x.1) (squareClass19 x.2) * r (squareClass7 (x.1 + 1)) (squareClass19 (x.2 + 0)) = g x
    simp only [g, squareClass7_shift_1, add_zero]
  calc
    correlation133 r (shifts133 1) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature133 r 1 := by
      let e : Fin 7 × Fin 19 ≃ ZMod 7 × ZMod 19 :=
        (ZMod.finEquiv 7).toEquiv.prodCongr (ZMod.finEquiv 19).toEquiv
      let f : Fin 7 × Fin 19 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.1) ((![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] : Fin 19 → Fin 3) x.2) *
          r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) x.1) ((![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] : Fin 19 → Fin 3) x.2)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature133, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation133_eq_signature_2 (r : Row) :
    correlation133 r (shifts133 2) = signature133 r 2 := by
  let g : ZMod 7 × ZMod 19 → ℤ := fun x =>
    r (squareClass7 x.1) (squareClass19 x.2) * r (squareClass7 x.1) ((![1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0] : Fin 19 → Fin 3) ((ZMod.finEquiv 19).symm x.2))
  have hg (x : ZMod 7 × ZMod 19) :
      expand133 r x * expand133 r (x + shifts133 2) = g x := by
    change r (squareClass7 x.1) (squareClass19 x.2) * r (squareClass7 (x.1 + 0)) (squareClass19 (x.2 + 1)) = g x
    simp only [g, squareClass19_shift_1, add_zero]
  calc
    correlation133 r (shifts133 2) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature133 r 2 := by
      let e : Fin 7 × Fin 19 ≃ ZMod 7 × ZMod 19 :=
        (ZMod.finEquiv 7).toEquiv.prodCongr (ZMod.finEquiv 19).toEquiv
      let f : Fin 7 × Fin 19 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.1) ((![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] : Fin 19 → Fin 3) x.2) *
          r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.1) ((![1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0] : Fin 19 → Fin 3) x.2)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature133, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation133_eq_signature_3 (r : Row) :
    correlation133 r (shifts133 3) = signature133 r 3 := by
  let g : ZMod 7 × ZMod 19 → ℤ := fun x =>
    r (squareClass7 x.1) (squareClass19 x.2) * r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x.1)) ((![1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0] : Fin 19 → Fin 3) ((ZMod.finEquiv 19).symm x.2))
  have hg (x : ZMod 7 × ZMod 19) :
      expand133 r x * expand133 r (x + shifts133 3) = g x := by
    change r (squareClass7 x.1) (squareClass19 x.2) * r (squareClass7 (x.1 + 1)) (squareClass19 (x.2 + 1)) = g x
    simp only [g, squareClass7_shift_1, squareClass19_shift_1]
  calc
    correlation133 r (shifts133 3) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature133 r 3 := by
      let e : Fin 7 × Fin 19 ≃ ZMod 7 × ZMod 19 :=
        (ZMod.finEquiv 7).toEquiv.prodCongr (ZMod.finEquiv 19).toEquiv
      let f : Fin 7 × Fin 19 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.1) ((![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] : Fin 19 → Fin 3) x.2) *
          r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) x.1) ((![1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0] : Fin 19 → Fin 3) x.2)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature133, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation133_eq_signature_4 (r : Row) :
    correlation133 r (shifts133 4) = signature133 r 4 := by
  let g : ZMod 7 × ZMod 19 → ℤ := fun x =>
    r (squareClass7 x.1) (squareClass19 x.2) * r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x.1)) ((![2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0, 1] : Fin 19 → Fin 3) ((ZMod.finEquiv 19).symm x.2))
  have hg (x : ZMod 7 × ZMod 19) :
      expand133 r x * expand133 r (x + shifts133 4) = g x := by
    change r (squareClass7 x.1) (squareClass19 x.2) * r (squareClass7 (x.1 + 1)) (squareClass19 (x.2 + 2)) = g x
    simp only [g, squareClass7_shift_1, squareClass19_shift_2]
  calc
    correlation133 r (shifts133 4) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature133 r 4 := by
      let e : Fin 7 × Fin 19 ≃ ZMod 7 × ZMod 19 :=
        (ZMod.finEquiv 7).toEquiv.prodCongr (ZMod.finEquiv 19).toEquiv
      let f : Fin 7 × Fin 19 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.1) ((![0, 1, 2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2] : Fin 19 → Fin 3) x.2) *
          r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) x.1) ((![2, 2, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 1, 1, 2, 0, 1] : Fin 19 → Fin 3) x.2)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature133, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

theorem correlation133_eq_signature (r : Row) (k : Fin 5) :
    correlation133 r (shifts133 k) = signature133 r k := by
  fin_cases k
  · exact correlation133_eq_signature_0 r
  · exact correlation133_eq_signature_1 r
  · exact correlation133_eq_signature_2 r
  · exact correlation133_eq_signature_3 r
  · exact correlation133_eq_signature_4 r

theorem signature133_zero (r : Row) : signature133 r 0 = energy133 r := by
  simp only [signature133, Matrix.cons_val_zero, energy133, tripleEnergy]
  ring

def norm7 (r : Row) : ℤ :=
  (2 - 7 * (tripleSum (r 1) + tripleSum (r 2))) ^ 2 +
    7 * (tripleSum (r 1) - tripleSum (r 2)) ^ 2

def norm19 (r : Row) : ℤ :=
  let a := r 0 1 + 3 * (r 1 1 + r 2 1)
  let b := r 0 2 + 3 * (r 1 2 + r 2 2)
  (2 - 19 * (a + b)) ^ 2 + 19 * (a - b) ^ 2

theorem norm7_formula (r : Row) (hs : weightedSum r = 1) :
    norm7 r = 4 * (signature133 r 0 + 18 * signature133 r 2 -
      signature133 r 1 - 9 * signature133 r 3 - 9 * signature133 r 4) := by
  have h : (2 * weightedSum r - 7 * (tripleSum (r 1) + tripleSum (r 2))) ^ 2 +
      7 * (tripleSum (r 1) - tripleSum (r 2)) ^ 2 =
      4 * (signature133 r 0 + 18 * signature133 r 2 -
        signature133 r 1 - 9 * signature133 r 3 - 9 * signature133 r 4) := by
    norm_num [weightedSum, tripleSum, signature133]
    ring
  simpa only [hs, mul_one, norm7] using h

theorem norm19_formula (r : Row) (hs : weightedSum r = 1) :
    norm19 r = 4 * (signature133 r 0 + 6 * signature133 r 1 -
      signature133 r 2 - 3 * signature133 r 3 - 3 * signature133 r 4) := by
  have h :
      (2 * weightedSum r - 19 * ((r 0 1 + 3 * (r 1 1 + r 2 1)) +
        (r 0 2 + 3 * (r 1 2 + r 2 2)))) ^ 2 +
        19 * ((r 0 1 + 3 * (r 1 1 + r 2 1)) -
          (r 0 2 + 3 * (r 1 2 + r 2 2))) ^ 2 =
      4 * (signature133 r 0 + 6 * signature133 r 1 -
        signature133 r 2 - 3 * signature133 r 3 - 3 * signature133 r 4) := by
    norm_num [weightedSum, tripleSum, signature133]
    ring
  simpa only [hs, mul_one, norm19] using h

def project21 (L : Fin 3 → Row) : Row :=
  fun i k => L k i 0 + 9 * (L k i 1 + L k i 2)

def expand21 (r : Row) (x : ZMod 3 × ZMod 7) : ℤ :=
  r (squareClass7 x.2) x.1

def correlation21 (r : Row) (t : ZMod 3 × ZMod 7) : ℤ :=
  ∑ x, expand21 r x * expand21 r (x + t)

def energy21 (r : Row) : ℤ :=
  (r 0 0 ^ 2 + r 0 1 ^ 2 + r 0 2 ^ 2) +
    3 * (r 1 0 ^ 2 + r 1 1 ^ 2 + r 1 2 ^ 2) +
    3 * (r 2 0 ^ 2 + r 2 1 ^ 2 + r 2 2 ^ 2)

def shifts21 : Fin 5 → ZMod 3 × ZMod 7 :=
  ![(0, 0), (1, 0), (0, 1), (1, 1), (1, 3)]

def signature21 (r : Row) : Fin 5 → ℤ :=
  ![(r 0 0) * (r 0 0) +
      (r 0 1) * (r 0 1) +
      (r 0 2) * (r 0 2) +
      3 * (r 1 0) * (r 1 0) +
      3 * (r 1 1) * (r 1 1) +
      3 * (r 1 2) * (r 1 2) +
      3 * (r 2 0) * (r 2 0) +
      3 * (r 2 1) * (r 2 1) +
      3 * (r 2 2) * (r 2 2),
    (r 0 0) * (r 0 1) +
      (r 0 0) * (r 0 2) +
      (r 0 1) * (r 0 2) +
      3 * (r 1 0) * (r 1 1) +
      3 * (r 1 0) * (r 1 2) +
      3 * (r 1 1) * (r 1 2) +
      3 * (r 2 0) * (r 2 1) +
      3 * (r 2 0) * (r 2 2) +
      3 * (r 2 1) * (r 2 2),
    (r 0 0) * (r 1 0) +
      (r 0 0) * (r 2 0) +
      (r 0 1) * (r 1 1) +
      (r 0 1) * (r 2 1) +
      (r 0 2) * (r 1 2) +
      (r 0 2) * (r 2 2) +
      (r 1 0) * (r 1 0) +
      3 * (r 1 0) * (r 2 0) +
      (r 1 1) * (r 1 1) +
      3 * (r 1 1) * (r 2 1) +
      (r 1 2) * (r 1 2) +
      3 * (r 1 2) * (r 2 2) +
      (r 2 0) * (r 2 0) +
      (r 2 1) * (r 2 1) +
      (r 2 2) * (r 2 2),
    (r 0 0) * (r 1 1) +
      (r 0 0) * (r 2 2) +
      (r 0 1) * (r 1 2) +
      (r 0 1) * (r 2 0) +
      (r 0 2) * (r 1 0) +
      (r 0 2) * (r 2 1) +
      (r 1 0) * (r 1 1) +
      (r 1 0) * (r 1 2) +
      2 * (r 1 0) * (r 2 1) +
      (r 1 0) * (r 2 2) +
      (r 1 1) * (r 1 2) +
      (r 1 1) * (r 2 0) +
      2 * (r 1 1) * (r 2 2) +
      2 * (r 1 2) * (r 2 0) +
      (r 1 2) * (r 2 1) +
      (r 2 0) * (r 2 1) +
      (r 2 0) * (r 2 2) +
      (r 2 1) * (r 2 2),
    (r 0 0) * (r 1 2) +
      (r 0 0) * (r 2 1) +
      (r 0 1) * (r 1 0) +
      (r 0 1) * (r 2 2) +
      (r 0 2) * (r 1 1) +
      (r 0 2) * (r 2 0) +
      (r 1 0) * (r 1 1) +
      (r 1 0) * (r 1 2) +
      (r 1 0) * (r 2 1) +
      2 * (r 1 0) * (r 2 2) +
      (r 1 1) * (r 1 2) +
      2 * (r 1 1) * (r 2 0) +
      (r 1 1) * (r 2 2) +
      (r 1 2) * (r 2 0) +
      2 * (r 1 2) * (r 2 1) +
      (r 2 0) * (r 2 1) +
      (r 2 0) * (r 2 2) +
      (r 2 1) * (r 2 2)]

private theorem correlation21_eq_signature_0 (r : Row) :
    correlation21 r (shifts21 0) = signature21 r 0 := by
  let g : ZMod 3 × ZMod 7 → ℤ := fun x =>
    r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1)
  have hg (x : ZMod 3 × ZMod 7) :
      expand21 r x * expand21 r (x + shifts21 0) = g x := by
    change r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r (squareClass7 (x.2 + 0)) ((ZMod.finEquiv 3).symm (x.1 + 0)) = g x
    simp only [g, add_zero]
  calc
    correlation21 r (shifts21 0) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature21 r 0 := by
      let e : Fin 3 × Fin 7 ≃ ZMod 3 × ZMod 7 :=
        (ZMod.finEquiv 3).toEquiv.prodCongr (ZMod.finEquiv 7).toEquiv
      let f : Fin 3 × Fin 7 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.2) x.1 *
          r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.2) (x.1)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature21, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation21_eq_signature_1 (r : Row) :
    correlation21 r (shifts21 1) = signature21 r 1 := by
  let g : ZMod 3 × ZMod 7 → ℤ := fun x =>
    r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r (squareClass7 x.2) ((![1, 2, 0] : Fin 3 → Fin 3) ((ZMod.finEquiv 3).symm x.1))
  have hg (x : ZMod 3 × ZMod 7) :
      expand21 r x * expand21 r (x + shifts21 1) = g x := by
    change r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r (squareClass7 (x.2 + 0)) ((ZMod.finEquiv 3).symm (x.1 + 1)) = g x
    simp only [g, zmod3_shift_one, add_zero]
  calc
    correlation21 r (shifts21 1) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature21 r 1 := by
      let e : Fin 3 × Fin 7 ≃ ZMod 3 × ZMod 7 :=
        (ZMod.finEquiv 3).toEquiv.prodCongr (ZMod.finEquiv 7).toEquiv
      let f : Fin 3 × Fin 7 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.2) x.1 *
          r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.2) ((![1, 2, 0] : Fin 3 → Fin 3) x.1)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature21, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation21_eq_signature_2 (r : Row) :
    correlation21 r (shifts21 2) = signature21 r 2 := by
  let g : ZMod 3 × ZMod 7 → ℤ := fun x =>
    r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x.2)) ((ZMod.finEquiv 3).symm x.1)
  have hg (x : ZMod 3 × ZMod 7) :
      expand21 r x * expand21 r (x + shifts21 2) = g x := by
    change r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r (squareClass7 (x.2 + 1)) ((ZMod.finEquiv 3).symm (x.1 + 0)) = g x
    simp only [g, squareClass7_shift_1, add_zero]
  calc
    correlation21 r (shifts21 2) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature21 r 2 := by
      let e : Fin 3 × Fin 7 ≃ ZMod 3 × ZMod 7 :=
        (ZMod.finEquiv 3).toEquiv.prodCongr (ZMod.finEquiv 7).toEquiv
      let f : Fin 3 × Fin 7 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.2) x.1 *
          r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) x.2) (x.1)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature21, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation21_eq_signature_3 (r : Row) :
    correlation21 r (shifts21 3) = signature21 r 3 := by
  let g : ZMod 3 × ZMod 7 → ℤ := fun x =>
    r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x.2)) ((![1, 2, 0] : Fin 3 → Fin 3) ((ZMod.finEquiv 3).symm x.1))
  have hg (x : ZMod 3 × ZMod 7) :
      expand21 r x * expand21 r (x + shifts21 3) = g x := by
    change r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r (squareClass7 (x.2 + 1)) ((ZMod.finEquiv 3).symm (x.1 + 1)) = g x
    simp only [g, zmod3_shift_one, squareClass7_shift_1]
  calc
    correlation21 r (shifts21 3) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature21 r 3 := by
      let e : Fin 3 × Fin 7 ≃ ZMod 3 × ZMod 7 :=
        (ZMod.finEquiv 3).toEquiv.prodCongr (ZMod.finEquiv 7).toEquiv
      let f : Fin 3 × Fin 7 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.2) x.1 *
          r ((![1, 1, 2, 1, 2, 2, 0] : Fin 7 → Fin 3) x.2) ((![1, 2, 0] : Fin 3 → Fin 3) x.1)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature21, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

private theorem correlation21_eq_signature_4 (r : Row) :
    correlation21 r (shifts21 4) = signature21 r 4 := by
  let g : ZMod 3 × ZMod 7 → ℤ := fun x =>
    r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r ((![2, 1, 2, 2, 0, 1, 1] : Fin 7 → Fin 3) ((ZMod.finEquiv 7).symm x.2)) ((![1, 2, 0] : Fin 3 → Fin 3) ((ZMod.finEquiv 3).symm x.1))
  have hg (x : ZMod 3 × ZMod 7) :
      expand21 r x * expand21 r (x + shifts21 4) = g x := by
    change r (squareClass7 x.2) ((ZMod.finEquiv 3).symm x.1) * r (squareClass7 (x.2 + 3)) ((ZMod.finEquiv 3).symm (x.1 + 1)) = g x
    simp only [g, zmod3_shift_one, squareClass7_shift_3]
  calc
    correlation21 r (shifts21 4) = ∑ x, g x :=
      Finset.sum_congr rfl (fun x _ => hg x)
    _ = signature21 r 4 := by
      let e : Fin 3 × Fin 7 ≃ ZMod 3 × ZMod 7 :=
        (ZMod.finEquiv 3).toEquiv.prodCongr (ZMod.finEquiv 7).toEquiv
      let f : Fin 3 × Fin 7 → ℤ := fun x =>
        r ((![0, 1, 1, 2, 1, 2, 2] : Fin 7 → Fin 3) x.2) x.1 *
          r ((![2, 1, 2, 2, 0, 1, 1] : Fin 7 → Fin 3) x.2) ((![1, 2, 0] : Fin 3 → Fin 3) x.1)
      rw [← Fintype.sum_equiv e f g (fun _ => rfl)]
      norm_num [f, signature21, Fintype.sum_prod_type, Fin.sum_univ_succ]
      ring

theorem correlation21_eq_signature (r : Row) (k : Fin 5) :
    correlation21 r (shifts21 k) = signature21 r k := by
  fin_cases k
  · exact correlation21_eq_signature_0 r
  · exact correlation21_eq_signature_1 r
  · exact correlation21_eq_signature_2 r
  · exact correlation21_eq_signature_3 r
  · exact correlation21_eq_signature_4 r

theorem signature21_zero (r : Row) : signature21 r 0 = energy21 r := by
  simp only [signature21, Matrix.cons_val_zero, energy21]
  ring

def fingerprint (s : Fin 5 → ℤ) : ℤ :=
  s 0 + 31 * (s 1 + 31 * (s 2 + 31 * (s 3 + 31 * s 4)))

def key133 (r : Row) : ℤ := fingerprint (signature133 r)

def key21 (r : Row) : ℤ := fingerprint (signature21 r)

def jointKey (source margin : Row) : ℤ :=
  key133 source + 10000000000 * key21 margin

def target133 : Fin 5 → ℤ := ![2378, -18, -18, -18, -18]
def target21 : Fin 5 → ℤ := ![2282, -114, -114, -114, -114]
def targetKey133 : ℤ := -17175094
def targetJointKey : ℤ := -1087883740017175094

theorem fingerprint_target133 : fingerprint target133 = targetKey133 := by
  decide +kernel

theorem fingerprint_target21 :
    fingerprint target133 + 10000000000 * fingerprint target21 = targetJointKey := by
  decide +kernel

theorem fingerprint_pair (a b target : Fin 5 → ℤ)
    (h : ∀ k, a k + b k = target k) :
    fingerprint a + fingerprint b = fingerprint target := by
  have h0 := h 0
  have h1 := h 1
  have h2 := h 2
  have h3 := h 3
  have h4 := h 4
  simp only [fingerprint]
  omega

end HadamardQuotient133
