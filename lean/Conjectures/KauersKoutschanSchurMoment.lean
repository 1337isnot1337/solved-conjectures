import Conjectures.KauersKoutschanAffineTraceMoment
import Conjectures.KauersKoutschanBivariateMoment
import Conjectures.KauersKoutschanRadialSchurMoment
import Mathlib.Order.Interval.Set.Infinite

/-! The two-factorial expectation of the exact trace–determinant character. -/

namespace KauersKoutschan

open Polynomial MeasureTheory

private noncomputable abbrev realWeightedRadial (j m : ℕ) : ℝ[X] :=
  (weightedRadialCharacter j m).map (Rat.castHom ℝ)

private theorem realWeightedRadial_eval (j m : ℕ) (r : ℝ) :
    (realWeightedRadial j m).eval r =
      r * (1 - r) ^ j * (traceComplete (1 - r) m).eval (r - 2) := by
  let f : ℚ[X] →+* ℝ := (evalRingHom r).comp (mapRingHom (Rat.castHom ℝ))
  change f (weightedRadialCharacter j m) = _
  rw [weightedRadialCharacter, map_mul, map_mul, map_pow, map_eval_traceComplete]
  simp [f]

/-- The form of the character in the two squared Gaussian coordinates. -/
noncomputable def bivariateSchurCharacter (a b : ℝ) (j m : ℕ) : TwoVariablePolynomial :=
  let x : TwoVariablePolynomial := MvPolynomial.X (0 : Fin 2)
  let y : TwoVariablePolynomial := MvPolynomial.X (1 : Fin 2)
  let d := MvPolynomial.C (a * b) * (1 - x - y)
  let t := MvPolynomial.C a * (x - 1) + MvPolynomial.C b * (y - 1)
  d ^ j * (traceComplete d m).eval t

private theorem bivariateSchurCharacter_eval (a b r t : ℝ) (j m : ℕ) :
    MvPolynomial.eval (radialCoordinates r t) (bivariateSchurCharacter a b j m) =
      ((1 - r) * a * b) ^ j *
        (traceComplete ((1 - r) * a * b) m).eval
          ((-a + (r - 1) * b) + (((r - 1) * a - b) - (-a + (r - 1) * b)) * t) := by
  unfold bivariateSchurCharacter
  simp only [map_mul, map_pow, map_eval_traceComplete, MvPolynomial.eval_C, MvPolynomial.eval_X,
    map_add, map_sub, map_one]
  have hd : a * b * (1 - radialCoordinates r t 0 - radialCoordinates r t 1) = (1 - r) * a * b := by
    simp [radialCoordinates]
    ring
  have ht : a * (radialCoordinates r t 0 - 1) + b * (radialCoordinates r t 1 - 1) =
      (-a + (r - 1) * b) + (((r - 1) * a - b) - (-a + (r - 1) * b)) * t := by
    simp [radialCoordinates]
    ring
  rw [hd, ht]

private noncomputable abbrev diagonalCharacter (a b : ℝ) (j m : ℕ) : ℝ :=
  (a * b) ^ j * (traceComplete (a * b) m).eval (a + b)

private theorem radialAverage_bivariateSchurCharacter (a b : ℝ) (j m : ℕ) :
    (↑(m + 1 : ℕ) : ℝ) • radialAverage (bivariateSchurCharacter a b j m) =
      diagonalCharacter a b j m • realWeightedRadial j m := by
  apply Polynomial.eq_of_infinite_eval_eq
  refine (Set.Ioi_infinite (0 : ℝ)).mono ?_
  intro r hr
  change (0 : ℝ) < r at hr
  change ((↑(m + 1 : ℕ) : ℝ) • radialAverage (bivariateSchurCharacter a b j m)).eval r =
    (diagonalCharacter a b j m • realWeightedRadial j m).eval r
  rw [eval_smul, eval_smul, smul_eq_mul, smul_eq_mul, radialAverage_eval, realWeightedRadial_eval]
  simp_rw [bivariateSchurCharacter_eval a b r]
  rw [intervalIntegral.integral_const_mul]
  let u := -a + (r - 1) * b
  let v := (r - 1) * a - b
  let d := (1 - r) * a * b
  let I := ∫ t in (0 : ℝ)..1, (traceComplete d m).eval (u + (v - u) * t)
  have h : (↑(m + 1 : ℕ) : ℝ) * I =
      (traceComplete (a * b) m).eval (a + b) * (traceComplete (1 - r) m).eval (r - 2) :=
    normalized_trace_moment_all a b r m hr
  change (↑(m + 1 : ℕ) : ℝ) * (r * (d ^ j * I)) =
    diagonalCharacter a b j m * (r * (1 - r) ^ j * (traceComplete (1 - r) m).eval (r - 2))
  unfold diagonalCharacter
  rw [show d = (1 - r) * (a * b) by dsimp [d]; ring, mul_pow]
  linear_combination (r * (1 - r) ^ j * (a * b) ^ j) * h

/-- The independent factorial average gives exactly the Schur scalar in the
written proof, expressed as a rational derangement divided difference. -/
theorem independent_factorial_schur_moment (a b : ℝ) (j m : ℕ) :
    independentFactorialMoment (bivariateSchurCharacter a b j m) =
      diagonalCharacter a b j m * (dividedDifference (j + (m + 1)) j : ℝ) := by
  have h := congrArg (factorialMoment (R := ℝ)) (radialAverage_bivariateSchurCharacter a b j m)
  simp only [map_smul, smul_eq_mul, factorialMoment_radialAverage] at h
  have hm := map_factorialMoment (Rat.castHom ℝ) (weightedRadialCharacter j m)
  change ((factorialMoment (R := ℚ) (weightedRadialCharacter j m) : ℚ) : ℝ) =
    factorialMoment (realWeightedRadial j m) at hm
  rw [← hm] at h
  have hc := radial_factorial_schur_moment j m
  have hn : (m + 1 : ℚ) ≠ 0 := by positivity
  have hc' := (div_eq_iff hn).mp hc
  have hs : ((factorialMoment (R := ℚ) (weightedRadialCharacter j m) : ℚ) : ℝ) =
      (dividedDifference (j + (m + 1)) j : ℝ) * (↑(m + 1 : ℕ) : ℝ) := by
    exact_mod_cast hc'
  rw [hs] at h
  apply mul_left_cancel₀ (by positivity : (↑(m + 1 : ℕ) : ℝ) ≠ 0)
  linear_combination h

end KauersKoutschan
