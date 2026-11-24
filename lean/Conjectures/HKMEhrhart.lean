module

public import Conjectures.AlexanderssonParkingExcedanceRoots

/-! An exact off-line root certificate for the published rotated polynomial.
The Ehrhart identification is a separate obligation. -/

@[expose] public section
namespace HKMEhrhart
open Polynomial
open AlexanderssonParkingExcedance

def row : List ℤ :=
  [0, -3575490705, 0, 4596049711, 0, -1819237530, 0, 219501678,
    0, -8333765, 0, 87411]

noncomputable def candidate : ℝ[X] := polynomialOfList row

def jet (x : ℚ) : List ℤ → ℚ × ℚ × ℚ
  | [] => (0, 0, 0)
  | a :: as =>
    let (y, dy, ddy) := jet x as
    (a + x*y, y + x*dy, 2*dy + x*ddy)

theorem jet_eq (x : ℚ) (as : List ℤ) :
    let j := jet x as
    let f := polynomialOfList as
    f.eval (x : ℝ) = (j.1 : ℝ) ∧ f.derivative.eval (x : ℝ) = (j.2.1 : ℝ) ∧
      f.derivative.derivative.eval (x : ℝ) = (j.2.2 : ℝ) := by
  induction as with
  | nil => simp [jet, polynomialOfList]
  | cons a as ih =>
    simp only [jet, polynomialOfList, derivative_add, derivative_C, derivative_mul,
      derivative_X, zero_add, one_mul, eval_add, eval_mul, eval_C, eval_X] at *
    rcases ih with ⟨hp, hd, hdd⟩
    simp only [hp, hd, hdd, Rat.cast_add, Rat.cast_mul, Rat.cast_intCast, Rat.cast_ofNat]
    simp only [true_and]; ring

theorem scaled_defect :
    (3 : ℚ)^20 * ((jet (4/3) row).2.1^2 - (jet (4/3) row).1 * (jet (4/3) row).2.2)
      = -168180657231060341757399375 := by decide +kernel

theorem candidate_negative : laguerre candidate (4/3) < 0 := by
  have h := jet_eq (4/3) row
  unfold candidate laguerre
  rw [show (4/3 : ℝ) = ((4/3 : ℚ) : ℝ) by norm_num, h.1, h.2.1, h.2.2]
  have hn : (jet (4/3) row).2.1^2 - (jet (4/3) row).1 * (jet (4/3) row).2.2 < 0 := by
    decide +kernel
  exact_mod_cast hn

theorem candidate_nonreal :
    ∃ x : ℂ, (candidate.map Complex.ofRealHom).IsRoot x ∧ x.im ≠ 0 :=
  nonreal_root_of_laguerre_neg _ _ candidate_negative

/-- The affine source change sends a nonreal root to a root off the canonical line.
The evaluation identity must still be proved for the literal Ehrhart polynomial. -/
theorem off_line_of_rotation (E : ℂ[X]) (c : ℂ) (hc : c ≠ 0)
    (h : ∀ x : ℂ, (candidate.map Complex.ofRealHom).eval x =
      c * E.eval ((Complex.I*x - 1)/2)) :
    ∃ z : ℂ, E.IsRoot z ∧ z.re ≠ -(1/2 : ℝ) := by
  obtain ⟨x, hx, hxim⟩ := candidate_nonreal
  let z : ℂ := (Complex.I*x - 1)/2
  refine ⟨z, ?_, ?_⟩
  · change E.eval z = 0
    exact (mul_eq_zero.mp ((h x).symm.trans hx)).resolve_left hc
  · intro hz
    have hre : z.re = (-x.im-1)/2 := by
      simp [z, Complex.mul_re]
    apply hxim
    linarith

/-- The positive numerator of the unrotated interpolation polynomial,
in the variable `2*t+1`. -/
noncomputable def numerator (y : ℂ) : ℂ :=
  87411*y^11 + 8333765*y^9 + 219501678*y^7 + 1819237530*y^5 +
    4596049711*y^3 + 3575490705*y

noncomputable def polynomialNumerator (Y : ℂ[X]) : ℂ[X] :=
  87411*Y^11 + 8333765*Y^9 + 219501678*Y^7 + 1819237530*Y^5 +
    4596049711*Y^3 + 3575490705*Y

noncomputable def interpolant : ℂ[X] := C (1/10218700800 : ℂ) * polynomialNumerator (2*X+1)

theorem eval_interpolant (z : ℂ) :
    interpolant.eval z = (1/10218700800 : ℂ) * numerator (2*z+1) := by
  simp [interpolant, polynomialNumerator, numerator]

theorem rotation_identity (x : ℂ) :
    (candidate.map Complex.ofRealHom).eval x =
      (10218700800 * Complex.I) * interpolant.eval ((Complex.I*x-1)/2) := by
  have hi3 : Complex.I^3 = -Complex.I := by
    rw [show (3:ℕ) = 2+1 by decide, pow_add, Complex.I_sq, pow_one]; ring
  have hi5 : Complex.I^5 = Complex.I := by
    rw [show (5:ℕ) = 3+2 by decide, pow_add, hi3, Complex.I_sq]; ring
  have hi7 : Complex.I^7 = -Complex.I := by
    rw [show (7:ℕ) = 5+2 by decide, pow_add, hi5, Complex.I_sq]; ring
  have hi9 : Complex.I^9 = Complex.I := by
    rw [show (9:ℕ) = 7+2 by decide, pow_add, hi7, Complex.I_sq]; ring
  have hi11 : Complex.I^11 = -Complex.I := by
    rw [show (11:ℕ) = 9+2 by decide, pow_add, hi9, Complex.I_sq]; ring
  have cancel (z : ℂ) :
      (10218700800*Complex.I)*((1/10218700800)*z) = Complex.I*z := by
    field_simp
  rw [eval_interpolant, show 2*((Complex.I*x-1)/2)+1 = Complex.I*x by ring, cancel]
  simp only [numerator, mul_pow, hi3, hi5, hi7, hi9, hi11]
  simp [candidate, row, polynomialOfList]
  calc
    _ = Complex.I * (Complex.I * (-(87411*x^11 - 8333765*x^9 +
        219501678*x^7 - 1819237530*x^5 + 4596049711*x^3 - 3575490705*x))) := by
      have ii (y : ℂ) : Complex.I*(Complex.I*y) = -y := by
        rw [← mul_assoc, ← pow_two, Complex.I_sq, neg_one_mul]
      rw [ii]
      ring
    _ = _ := by ring

theorem interpolant_has_off_line_root :
    ∃ z : ℂ, interpolant.IsRoot z ∧ z.re ≠ -(1/2 : ℝ) :=
  off_line_of_rotation interpolant (10218700800 * Complex.I)
    (mul_ne_zero (by norm_num) Complex.I_ne_zero) rotation_identity

def evaluationCounts : Fin 12 → ℕ :=
  ![1,121,4303,70663,697975,4811431,25393537,109149169,398945035,
    1279269867,3683468685,9693557805]

theorem interpolant_values (m : Fin 12) :
    interpolant.eval (m.val : ℂ) = (evaluationCounts m : ℂ) := by
  rw [eval_interpolant]
  fin_cases m <;> norm_num [evaluationCounts, numerator]

theorem interpolant_natDegree_le : interpolant.natDegree ≤ 11 := by
  unfold interpolant polynomialNumerator
  compute_degree!

/-- The twelve literal lattice counts and the degree bound imply the off-line root. -/
theorem off_line_of_counts (E : ℂ[X]) (hd : E.natDegree ≤ 11)
    (he : ∀ m : Fin 12, E.eval (m.val : ℂ) = (evaluationCounts m : ℂ)) :
    ∃ z : ℂ, E.IsRoot z ∧ z.re ≠ -(1/2 : ℝ) := by
  have heq : E = interpolant := by
    apply Polynomial.eq_of_natDegree_lt_card_of_eval_eq E interpolant
      (f := fun m : Fin 12 => (m.val : ℂ))
    · intro a b hab
      exact Fin.ext (Nat.cast_injective hab)
    · intro m
      exact (he m).trans (interpolant_values m).symm
    · simpa only [Fintype.card_fin] using (show max E.natDegree interpolant.natDegree < 12 by
        have hp := interpolant_natDegree_le
        omega)
  rw [heq]
  exact interpolant_has_off_line_root

end HKMEhrhart
