import Conjectures.LonelinessSmallRunner
import Conjectures.LonelinessModularDirections
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

/-! Every genuine rational plane through a positive four-speed vector has
loneliness at least one fourth. Coordinate coalescence reduces this to the
checked three-speed lower bound. This discharges the plane-gap input to the
short-vector argument at threshold two ninths.
-/

namespace Loneliness.FourSpeedGeometry

open CoordinateSubspace SubspaceDensity Modular

noncomputable section

def rationalIntegerLine (v : Fin 4 → ℤ) : Submodule ℚ (Fin 4 → ℚ) :=
  Submodule.span ℚ {fun i => (v i : ℚ)}

def rationalIntegerPlane (v z : Fin 4 → ℤ) : Submodule ℚ (Fin 4 → ℚ) :=
  rationalIntegerLine v ⊔ rationalIntegerLine z

theorem realSpan_integer_line (v : Fin 4 → ℤ) :
    realSpan (rationalIntegerLine v) = integerLine v := by
  rw [rationalIntegerLine, realSpan_span, Set.image_singleton]
  have h : rationalVector (fun i => (v i : ℚ)) = integerVector v := by
    ext i
    simp [rationalVector, integerVector]
  rw [h]
  rfl

theorem realSpan_integer_plane (v z : Fin 4 → ℤ) :
    realSpan (rationalIntegerPlane v z) = integerPlane v z := by
  rw [rationalIntegerPlane, realSpan_sup, realSpan_integer_line, realSpan_integer_line]
  rfl

theorem integer_plane_finrank (v z : Fin 4 → ℤ)
    (hv : integerVector v ≠ 0) (hz : integerVector z ∉ integerLine v) :
    Module.finrank ℝ (integerPlane v z) = 2 := by
  change Module.finrank ℝ
    (integerLine v ⊔ Submodule.span ℝ {integerVector z} : Submodule ℝ (Fin 4 → ℝ)) = 2
  rw [Submodule.finrank_sup_span_singleton hz]
  change Module.finrank ℝ (Submodule.span ℝ {integerVector v}) + 1 = 2
  rw [finrank_span_singleton hv]

theorem positive_vector_ne_zero (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i) :
    integerVector (fun i => (v i : ℤ)) ≠ 0 := by
  intro h
  have h0 : (v 0 : ℝ) = 0 := by simpa [integerVector] using congrFun h 0
  have hpos : (0 : ℝ) < v 0 := by exact_mod_cast hv 0
  linarith

theorem positive_plane_coordinateFree (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (z : Fin 4 → ℤ) : CoordinateFree (integerPlane (fun i => (v i : ℤ)) z) := by
  intro i
  refine ⟨integerVector (fun j => (v j : ℤ)), ?_, ?_⟩
  · exact (le_sup_left : integerLine (fun j => (v j : ℤ)) ≤
      integerPlane (fun j => (v j : ℤ)) z) (integerVector_mem_line _)
  · change ((v i : ℤ) : ℝ) ≠ 0
    exact_mod_cast (Nat.ne_of_gt (hv i))

/-- The required gap for every independent integer direction, with no
unproved geometric premise. -/
theorem four_speed_plane_gap (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (z : Fin 4 → ℤ) (hz : integerVector z ∉ integerLine (fun i => (v i : ℤ))) :
    (1 / 4 : ℝ) ≤ spaceValue (integerPlane (fun i => (v i : ℤ)) z) := by
  let E := rationalIntegerPlane (fun i => (v i : ℤ)) z
  have hspan : realSpan E = integerPlane (fun i => (v i : ℤ)) z :=
    realSpan_integer_plane _ _
  have hdim : Module.finrank ℝ (realSpan E) = 2 := by
    rw [hspan]
    exact integer_plane_finrank _ _ (positive_vector_ne_zero v hv) hz
  have hfree : CoordinateFree (realSpan E) := by
    rw [hspan]
    exact positive_plane_coordinateFree v hv z
  have h := SmallRunner.subspace_value_lower E hfree (by simp [hdim])
  norm_num [hdim] at h
  rwa [hspan] at h

theorem natural_line_value (v : Fin 4 → ℕ) :
    spaceValue (integerLine (fun i => (v i : ℤ))) = value (List.ofFn v) := by
  change spaceValue (Submodule.span ℝ {fun i => ((v i : ℤ) : ℝ)}) = _
  rw [spaceValue_integer_line]
  apply CriticalFamilies.value_eq_of_mem
  intro a
  simp only [mem_integerSpeeds, List.mem_ofFn, Int.natAbs_natCast]

/-- A centered congruent vector with coordinate bound `m/18` is parallel to
every four-speed direction whose loneliness is strictly below `2/9`.
The congruence multiplier is arbitrary, including nonunits. -/
theorem short_congruent_vector_rigidity (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (w : Fin 4 → ℤ) (a m : ℤ) (hm : 0 < m)
    (hcong : ∀ i, m ∣ w i - a * (v i : ℤ))
    (hR : ∀ i, |(w i : ℝ)| ≤ (m : ℝ) / 18)
    (hbelow : value (List.ofFn v) < (2 / 9 : ℝ)) :
    integerVector w ∈ integerLine (fun i => (v i : ℤ)) := by
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm
  have hshort : ((m : ℝ) / 18) / (2 * m) ≤ (1 / 4 : ℝ) - 2 / 9 := by
    have hq : ((m : ℝ) / 18) / (2 * m) = (1 / 36 : ℝ) := by field_simp; norm_num
    rw [hq]
    norm_num
  apply short_congruent_vector_mem_line (fun i => (v i : ℤ)) w a m hm hcong
    ((m : ℝ) / 18) (2 / 9) (1 / 4) hR
  · rwa [natural_line_value]
  · exact hshort
  · exact four_speed_plane_gap v hv

theorem short_congruent_vector_rigidity_int (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (w : Fin 4 → ℤ) (a m : ℤ) (hm : 0 < m)
    (hcong : ∀ i, m ∣ w i - a * (v i : ℤ))
    (hR : ∀ i, 18 * |w i| ≤ m)
    (hbelow : value (List.ofFn v) < (2 / 9 : ℝ)) :
    integerVector w ∈ integerLine (fun i => (v i : ℤ)) := by
  apply short_congruent_vector_rigidity v hv w a m hm hcong _ hbelow
  intro i
  have h : (18 : ℝ) * |(w i : ℝ)| ≤ m := by exact_mod_cast hR i
  apply (le_div_iff₀ (by norm_num : (0 : ℝ) < 18)).mpr
  nlinarith

/-- Literal primitive normalization of the short vector recovers the original
ordered coordinates. No classification table is a premise. -/
theorem recover_short_primitive_vector (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (w : Fin 4 → ℤ) (hw : w ≠ 0) (a m : ℤ) (hm : 0 < m)
    (hcong : ∀ i, m ∣ w i - a * (v i : ℤ))
    (hR : ∀ i, 18 * |w i| ≤ m)
    (hbelow : value (List.ofFn v) < (2 / 9 : ℝ)) :
    Normalization.normalize (absoluteSpeeds w) = List.ofFn v :=
  recover_primitive_direction v w hprimitive hw
    (short_congruent_vector_rigidity_int v hv w a m hm hcong hR hbelow)

/-- For a multiplier strictly between zero and the modulus, primitivity also
proves that the congruent vector is nonzero. -/
theorem recover_short_vector_of_primitive_congruence
    (v : Fin 4 → ℕ) (hv : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (w : Fin 4 → ℤ) (a m : ℤ) (ha : 0 < a) (ham : a < m)
    (hcong : ∀ i, m ∣ w i - a * (v i : ℤ))
    (hR : ∀ i, 18 * |w i| ≤ m)
    (hbelow : value (List.ofFn v) < (2 / 9 : ℝ)) :
    w ≠ 0 ∧ Normalization.normalize (absoluteSpeeds w) = List.ofFn v := by
  have hp : Normalization.gcd (absoluteSpeeds (fun i => (v i : ℤ))) = 1 := by
    simpa [absoluteSpeeds] using hprimitive
  have hw := congruent_primitive_vector_ne_zero (fun i => (v i : ℤ)) w a m ha ham hp hcong
  exact ⟨hw, recover_short_primitive_vector v hv hprimitive w hw a m (lt_trans ha ham)
    hcong hR hbelow⟩

end

end Loneliness.FourSpeedGeometry
