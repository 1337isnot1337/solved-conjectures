import Conjectures.LonelinessModularShortVector
import Conjectures.LonelinessCoalescenceValue
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Int.GCD
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.FieldSimp

/-!
# A radius bound for primitive directions in an integer two-parameter map

The plane is the actual real span of the two integer columns. A primitive
integer parameter vector extends by Bezout to a unimodular pair. Rounding
the second generator modulo the speed line gives a coordinatewise error
controlled by the largest squared row norm. The gap from one sixth to two
elevenths therefore gives the strict squared parameter bound with factor 1089.
-/

namespace Loneliness.TwoParameterRadius

open SubspaceDensity CoordinateSubspace Modular

noncomputable section

variable {ι : Type*}

def column (A : Matrix ι (Fin 2) ℤ) (j : Fin 2) : ι → ℤ := fun i => A i j

def parameterVector (A : Matrix ι (Fin 2) ℤ) (x y : ℤ) : ι → ℤ :=
  fun i => x * A i 0 + y * A i 1

def parameterPlane (A : Matrix ι (Fin 2) ℤ) : Submodule ℝ (ι → ℝ) :=
  integerPlane (column A 0) (column A 1)

def parameterNormSq (x y : ℤ) : ℝ := (x : ℝ) ^ 2 + (y : ℝ) ^ 2

private theorem parameterVector_real (A : Matrix ι (Fin 2) ℤ) (x y : ℤ) :
    integerVector (parameterVector A x y) =
      (x : ℝ) • integerVector (column A 0) +
        (y : ℝ) • integerVector (column A 1) := by
  ext i
  simp [parameterVector, integerVector, column, smul_eq_mul]

private theorem parameterVector_mem_plane (A : Matrix ι (Fin 2) ℤ) (x y : ℤ) :
    integerVector (parameterVector A x y) ∈ parameterPlane A := by
  rw [parameterVector_real]
  exact (parameterPlane A).add_mem
    ((parameterPlane A).smul_mem _ (Submodule.mem_sup_left (integerVector_mem_line _)))
    ((parameterPlane A).smul_mem _ (Submodule.mem_sup_right (integerVector_mem_line _)))

private theorem parameter_plane_eq_of_det_one
    (A : Matrix ι (Fin 2) ℤ) (x y r s : ℤ) (hdet : x * s - y * r = 1) :
    parameterPlane A = integerPlane (parameterVector A x y) (parameterVector A r s) := by
  let u := parameterVector A x y
  let w := parameterVector A r s
  let P := integerPlane u w
  have hdetR : (x : ℝ) * s - (y : ℝ) * r = 1 := by exact_mod_cast hdet
  have hu : integerVector u ∈ P := Submodule.mem_sup_left (integerVector_mem_line u)
  have hw : integerVector w ∈ P := Submodule.mem_sup_right (integerVector_mem_line w)
  have hfirst : integerVector (column A 0) =
      (s : ℝ) • integerVector u - (y : ℝ) • integerVector w := by
    ext i
    simp only [integerVector, column, Pi.sub_apply, Pi.smul_apply, smul_eq_mul,
      u, w, parameterVector, Int.cast_add, Int.cast_mul]
    linear_combination -(A i 0 : ℝ) * hdetR
  have hsecond : integerVector (column A 1) =
      -(r : ℝ) • integerVector u + (x : ℝ) • integerVector w := by
    ext i
    simp only [integerVector, column, Pi.add_apply, Pi.smul_apply, smul_eq_mul,
      u, w, parameterVector, Int.cast_add, Int.cast_mul]
    linear_combination -(A i 1 : ℝ) * hdetR
  apply le_antisymm
  · change integerLine (column A 0) ⊔ integerLine (column A 1) ≤ P
    apply sup_le
    · apply (Submodule.span_singleton_le_iff_mem _ _).mpr
      rw [hfirst]
      exact P.sub_mem (P.smul_mem _ hu) (P.smul_mem _ hw)
    · apply (Submodule.span_singleton_le_iff_mem _ _).mpr
      rw [hsecond]
      exact P.add_mem (P.smul_mem _ hu) (P.smul_mem _ hw)
  · apply sup_le
    · exact (Submodule.span_singleton_le_iff_mem _ _).mpr (parameterVector_mem_plane A x y)
    · exact (Submodule.span_singleton_le_iff_mem _ _).mpr (parameterVector_mem_plane A r s)

theorem parameterNormSq_pos (x y : ℤ) (hprimitive : Int.gcd x y = 1) :
    0 < parameterNormSq x y := by
  by_contra h
  have hx : (x : ℝ) = 0 := by
    dsimp [parameterNormSq] at h
    nlinarith [sq_nonneg (x : ℝ), sq_nonneg (y : ℝ)]
  have hy : (y : ℝ) = 0 := by
    dsimp [parameterNormSq] at h
    nlinarith [sq_nonneg (x : ℝ), sq_nonneg (y : ℝ)]
  have hxZ : x = 0 := by exact_mod_cast hx
  have hyZ : y = 0 := by exact_mod_cast hy
  simp [hxZ, hyZ] at hprimitive

/-- The whole column plane is close modulo integer vectors to the actual
speed line. The displayed row bound may be any common upper bound. -/
theorem plane_value_le [Fintype ι] [Nonempty ι]
    (A : Matrix ι (Fin 2) ℤ) (x y : ℤ) (hprimitive : Int.gcd x y = 1)
    (C : ℝ) (hrows : ∀ i, (A i 0 : ℝ) ^ 2 + (A i 1 : ℝ) ^ 2 ≤ C) :
    spaceValue (parameterPlane A) ≤
      spaceValue (integerLine (parameterVector A x y)) +
        (1 / 2 : ℝ) * Real.sqrt (C / parameterNormSq x y) := by
  let r : ℤ := -Int.gcdB x y
  let s : ℤ := Int.gcdA x y
  have hdet : x * s - y * r = 1 := by
    have h := Int.gcd_eq_gcd_ab x y
    rw [hprimitive] at h
    simpa only [r, s, mul_neg, sub_neg_eq_add, Nat.cast_one] using h.symm
  have hdetR : (x : ℝ) * s - (y : ℝ) * r = 1 := by exact_mod_cast hdet
  let u := parameterVector A x y
  let w := parameterVector A r s
  let R := parameterNormSq x y
  have hR : 0 < R := parameterNormSq_pos x y hprimitive
  let τ : ℝ := ((x : ℝ) * r + (y : ℝ) * s) / R
  have hτ : τ * R = (x : ℝ) * r + (y : ℝ) * s := by
    dsimp [τ]
    exact div_mul_cancel₀ _ hR.ne'
  have herror (i : ι) : |(w i : ℝ) - τ * (u i : ℝ)| ≤ Real.sqrt (C / R) := by
    let n : ℝ := -(y : ℝ) * (A i 0 : ℝ) + (x : ℝ) * (A i 1 : ℝ)
    have hid : (w i : ℝ) * R -
        ((x : ℝ) * r + (y : ℝ) * s) * (u i : ℝ) =
        ((x : ℝ) * s - (y : ℝ) * r) * n := by
      dsimp [u, w, parameterVector, R, parameterNormSq, n]
      push_cast
      ring
    have heq : (w i : ℝ) - τ * (u i : ℝ) = n / R := by
      apply (eq_div_iff hR.ne').mpr
      calc
        ((w i : ℝ) - τ * (u i : ℝ)) * R =
            (w i : ℝ) * R - (τ * R) * (u i : ℝ) := by ring
        _ = n := by rw [hτ, hid, hdetR, one_mul]
    have hlagrange : n ^ 2 + (u i : ℝ) ^ 2 =
        ((A i 0 : ℝ) ^ 2 + (A i 1 : ℝ) ^ 2) * R := by
      dsimp [n, u, parameterVector, R, parameterNormSq]
      push_cast
      ring
    have hnum : n ^ 2 ≤ C * R := by
      have hm := mul_le_mul_of_nonneg_right (hrows i) hR.le
      nlinarith [sq_nonneg (u i : ℝ)]
    apply Real.abs_le_sqrt
    rw [heq, div_pow]
    calc
      n ^ 2 / R ^ 2 ≤ (C * R) / R ^ 2 :=
        div_le_div_of_nonneg_right hnum (sq_nonneg R)
      _ = C / R := by field_simp
  have hline : τ • integerVector u ∈ integerLine u :=
    (integerLine u).smul_mem _ (integerVector_mem_line u)
  have hbound := extension_value_bound (integerLine u) (fun _ : Unit => w)
    (fun _ => τ • integerVector u) (fun _ => hline)
    (fun _ => Real.sqrt (C / R))
    (fun _ i => by simpa only [Pi.smul_apply, smul_eq_mul, integerVector] using herror i)
  rw [parameter_plane_eq_of_det_one A x y r s hdet]
  simpa only [Set.range_const, Finset.sum_const, Finset.card_univ, Fintype.card_unit,
    one_smul, integerPlane, integerLine, u, w, R] using hbound

/-- The strict gap between the plane and line thresholds gives the strict
factor 1089 in the squared parameter bound. -/
theorem parameter_sq_lt [Fintype ι] [Nonempty ι]
    (A : Matrix ι (Fin 2) ℤ) (x y : ℤ) (hprimitive : Int.gcd x y = 1)
    (C : ℝ) (hrows : ∀ i, (A i 0 : ℝ) ^ 2 + (A i 1 : ℝ) ^ 2 ≤ C)
    (hplane : (2 / 11 : ℝ) ≤ spaceValue (parameterPlane A))
    (hline : spaceValue (integerLine (parameterVector A x y)) < (1 / 6 : ℝ)) :
    parameterNormSq x y < 1089 * C := by
  have hupper := plane_value_le A x y hprimitive C hrows
  have hR := parameterNormSq_pos x y hprimitive
  obtain ⟨i⟩ := ‹Nonempty ι›
  have hC : 0 ≤ C := (add_nonneg (sq_nonneg (A i 0 : ℝ))
    (sq_nonneg (A i 1 : ℝ))).trans (hrows i)
  have hs : (1 / 33 : ℝ) < Real.sqrt (C / parameterNormSq x y) := by linarith
  have hratio : (1 / 1089 : ℝ) < C / parameterNormSq x y := by
    calc
      (1 / 1089 : ℝ) = (1 / 33 : ℝ) ^ 2 := by norm_num
      _ < (Real.sqrt (C / parameterNormSq x y)) ^ 2 :=
        (sq_lt_sq₀ (by norm_num) (Real.sqrt_nonneg _)).mpr hs
      _ = C / parameterNormSq x y := Real.sq_sqrt (div_nonneg hC hR.le)
  have hm := (lt_div_iff₀ hR).mp hratio
  nlinarith

def maxRowSq [Fintype ι] (A : Matrix ι (Fin 2) ℤ) : ℕ := by
  classical
  exact Finset.univ.sup (fun i => (A i 0).natAbs ^ 2 + (A i 1).natAbs ^ 2)

theorem row_sq_le_max [Fintype ι] (A : Matrix ι (Fin 2) ℤ) (i : ι) :
    (A i 0 : ℝ) ^ 2 + (A i 1 : ℝ) ^ 2 ≤ (maxRowSq A : ℝ) := by
  classical
  have h : (A i 0).natAbs ^ 2 + (A i 1).natAbs ^ 2 ≤ maxRowSq A := by
    change (A i 0).natAbs ^ 2 + (A i 1).natAbs ^ 2 ≤
      Finset.univ.sup (fun j => (A j 0).natAbs ^ 2 + (A j 1).natAbs ^ 2)
    exact Finset.le_sup (s := Finset.univ)
      (f := fun j : ι => (A j 0).natAbs ^ 2 + (A j 1).natAbs ^ 2)
      (Finset.mem_univ i)
  have hR : ((A i 0).natAbs : ℝ) ^ 2 + ((A i 1).natAbs : ℝ) ^ 2 ≤
      (maxRowSq A : ℝ) := by exact_mod_cast h
  simpa only [Nat.cast_natAbs, Int.cast_abs, sq_abs] using hR

/-- The finite maximum is exactly the largest squared Euclidean row norm. -/
theorem parameter_sq_lt_max [Fintype ι] [Nonempty ι]
    (A : Matrix ι (Fin 2) ℤ) (x y : ℤ) (hprimitive : Int.gcd x y = 1)
    (hplane : (2 / 11 : ℝ) ≤ spaceValue (parameterPlane A))
    (hline : spaceValue (integerLine (parameterVector A x y)) < (1 / 6 : ℝ)) :
    x.natAbs ^ 2 + y.natAbs ^ 2 < 1089 * maxRowSq A := by
  have h := parameter_sq_lt A x y hprimitive (maxRowSq A) (row_sq_le_max A) hplane hline
  have hR : (x.natAbs : ℝ) ^ 2 + (y.natAbs : ℝ) ^ 2 < 1089 * (maxRowSq A : ℝ) := by
    simpa only [parameterNormSq, Nat.cast_natAbs, Int.cast_abs, sq_abs] using h
  exact_mod_cast hR

/-- The radius bound for an actual natural six-speed vector represented by
the integer map. The plane gap remains explicit. -/
theorem six_speed_parameter_sq_lt_max
    (A : Matrix (Fin 6) (Fin 2) ℤ) (x y : ℤ) (hprimitive : Int.gcd x y = 1)
    (v : Fin 6 → ℕ) (hcoordinates : ∀ i, parameterVector A x y i = (v i : ℤ))
    (hplane : (2 / 11 : ℝ) ≤ spaceValue (parameterPlane A))
    (hvalue : value (List.ofFn v) < (1 / 6 : ℝ)) :
    x.natAbs ^ 2 + y.natAbs ^ 2 < 1089 * maxRowSq A := by
  apply parameter_sq_lt_max A x y hprimitive hplane
  have hcast : integerVector (parameterVector A x y) = fun i => (v i : ℝ) := by
    ext i
    change (parameterVector A x y i : ℝ) = (v i : ℝ)
    exact_mod_cast hcoordinates i
  change spaceValue (Submodule.span ℝ {integerVector (parameterVector A x y)}) < _
  rw [hcast, spaceValue_speed_line]
  exact hvalue

end

end Loneliness.TwoParameterRadius
