import Conjectures.LonelinessSubspaceDensity

/-!
# Short modular vectors and real plane bounds

The modular lifting searches use an integer identity `w = a*v + m*z`.
Rounding the coefficient of the integer vector `z` proves the claimed
real-time plane bound. A plane-gap hypothesis is kept explicit; this file
does not claim to prove the geometric classification supplying that gap.
-/

namespace Loneliness.Modular

open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

def integerLine (v : ι → ℤ) : Submodule ℝ (ι → ℝ) :=
  Submodule.span ℝ {integerVector v}

def integerPlane (v z : ι → ℤ) : Submodule ℝ (ι → ℝ) :=
  integerLine v ⊔ integerLine z

omit [Fintype ι] [Nonempty ι] in
theorem integerVector_mem_line (v : ι → ℤ) : integerVector v ∈ integerLine v :=
  Submodule.mem_span_singleton_self _

/-- A congruence lift with coordinates bounded by `R` moves the circle value
by at most `R/(2*m)`, over the entire real plane. -/
theorem short_vector_plane_bound (v z w : ι → ℤ) (a m : ℤ)
    (hm : 0 < m) (hidentity : ∀ i, w i = a * v i + m * z i)
    (R : ℝ) (hR : ∀ i, |(w i : ℝ)| ≤ R) :
    spaceValue (integerPlane v z) ≤ spaceValue (integerLine v) + R / (2 * m) := by
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm
  let u : Unit → ι → ℝ := fun _ => (-(a : ℝ) / m) • integerVector v
  have hu : ∀ j, u j ∈ integerLine v := by
    intro j
    exact (integerLine v).smul_mem _ (integerVector_mem_line v)
  have hdist : ∀ (j : Unit) i, |(z i : ℝ) - u j i| ≤ R / m := by
    intro j i
    have hcast : (w i : ℝ) = (a : ℝ) * v i + (m : ℝ) * z i := by
      exact_mod_cast hidentity i
    have heq : (z i : ℝ) - u j i = (w i : ℝ) / m := by
      dsimp [u, integerVector]
      apply (eq_div_iff (ne_of_gt hmR)).mpr
      field_simp
      nlinarith
    rw [heq, abs_div, abs_of_pos hmR]
    exact (div_le_div_iff_of_pos_right hmR).mpr (hR i)
  have h := extension_value_bound (integerLine v) (fun _ : Unit => z) u hu
    (fun _ => R / m) hdist
  have hspan : Set.range (fun _ : Unit => integerVector z) = {integerVector z} := by
    ext x
    simp
  rw [hspan] at h
  simpa [integerPlane, integerLine, div_eq_mul_inv, mul_comm, mul_left_comm,
    mul_assoc] using h

/-- If every genuine plane through the speed line has value at least `gap`,
a sufficiently short modular lift lies on the original line. -/
theorem short_vector_lift_mem_line (v z w : ι → ℤ) (a m : ℤ)
    (hm : 0 < m) (hidentity : ∀ i, w i = a * v i + m * z i)
    (R threshold gap : ℝ) (hR : ∀ i, |(w i : ℝ)| ≤ R)
    (hbelow : spaceValue (integerLine v) < threshold)
    (hshort : R / (2 * m) ≤ gap - threshold)
    (hgap : integerVector z ∉ integerLine v → gap ≤ spaceValue (integerPlane v z)) :
    integerVector z ∈ integerLine v := by
  by_contra hnot
  have hupper := short_vector_plane_bound v z w a m hm hidentity R hR
  have hlower := hgap hnot
  linarith

/-- The short modular vector itself is parallel to the original speed
vector. The multiplier `a` need not be invertible modulo `m`. -/
theorem short_vector_mem_line (v z w : ι → ℤ) (a m : ℤ)
    (hm : 0 < m) (hidentity : ∀ i, w i = a * v i + m * z i)
    (R threshold gap : ℝ) (hR : ∀ i, |(w i : ℝ)| ≤ R)
    (hbelow : spaceValue (integerLine v) < threshold)
    (hshort : R / (2 * m) ≤ gap - threshold)
    (hgap : integerVector z ∉ integerLine v → gap ≤ spaceValue (integerPlane v z)) :
    integerVector w ∈ integerLine v := by
  have hz := short_vector_lift_mem_line v z w a m hm hidentity R threshold gap
    hR hbelow hshort hgap
  have heq : integerVector w = (a : ℝ) • integerVector v + (m : ℝ) • integerVector z := by
    ext i
    simp only [integerVector, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    exact_mod_cast hidentity i
  rw [heq]
  exact (integerLine v).add_mem
    ((integerLine v).smul_mem _ (integerVector_mem_line v))
    ((integerLine v).smul_mem _ hz)

omit [Fintype ι] [Nonempty ι] in
/-- Coordinatewise congruence supplies an actual integer lift. -/
theorem exists_integer_lift (v w : ι → ℤ) (a m : ℤ)
    (hcong : ∀ i, m ∣ w i - a * v i) :
    ∃ z : ι → ℤ, ∀ i, w i = a * v i + m * z i := by
  refine ⟨fun i => (w i - a * v i) / m, ?_⟩
  intro i
  have h := Int.mul_ediv_cancel' (hcong i)
  linarith

/-- Direct interface for an arbitrary modular multiplier, including nonunits.
Every independent integer lift must satisfy the asserted geometric gap. -/
theorem short_congruent_vector_mem_line (v w : ι → ℤ) (a m : ℤ)
    (hm : 0 < m) (hcong : ∀ i, m ∣ w i - a * v i)
    (R threshold gap : ℝ) (hR : ∀ i, |(w i : ℝ)| ≤ R)
    (hbelow : spaceValue (integerLine v) < threshold)
    (hshort : R / (2 * m) ≤ gap - threshold)
    (hgap : ∀ z : ι → ℤ, integerVector z ∉ integerLine v →
      gap ≤ spaceValue (integerPlane v z)) :
    integerVector w ∈ integerLine v := by
  obtain ⟨z, hz⟩ := exists_integer_lift v w a m hcong
  exact short_vector_mem_line v z w a m hm hz R threshold gap hR hbelow hshort
    (hgap z)

omit [Nonempty ι] in
/-- A primitive vector, supplied by a Bezout certificate, cannot have a
nontrivial multiplier whose centered modular vector vanishes. -/
theorem congruent_vector_ne_zero (v w c : ι → ℤ) (a m : ℤ)
    (ha : 0 < a) (ham : a < m)
    (hprimitive : ∑ i, c i * v i = 1)
    (hcong : ∀ i, m ∣ w i - a * v i) : w ≠ 0 := by
  intro hw
  have hdiv : ∀ i, m ∣ a * v i := by
    intro i
    have hi := hcong i
    rw [hw, Pi.zero_apply, zero_sub] at hi
    exact dvd_neg.mp hi
  have hsum : m ∣ ∑ i, c i * (a * v i) := by
    exact Finset.dvd_sum (fun i _ => dvd_mul_of_dvd_right (hdiv i) (c i))
  have heq : (∑ i, c i * (a * v i)) = a := by
    calc
      _ = a * ∑ i, c i * v i := by
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro i hi
        ring
      _ = a := by rw [hprimitive, mul_one]
  rw [heq] at hsum
  exact (not_le_of_gt ham) (Int.le_of_dvd ha hsum)

end

end Loneliness.Modular
