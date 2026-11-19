import Conjectures.LonelinessModularShortVector

/-! Short-vector rigidity at a closed value threshold. The strict inequality
is imposed on the modular-vector radius, and the plane gap is explicit. -/

namespace Loneliness.Modular

open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

theorem short_vector_lift_mem_line_of_le (v z w : ι → ℤ) (a m : ℤ)
    (hm : 0 < m) (hidentity : ∀ i, w i = a*v i + m*z i)
    (R threshold gap : ℝ) (hR : ∀ i, |(w i : ℝ)| ≤ R)
    (hbelow : spaceValue (integerLine v) ≤ threshold)
    (hshort : R/(2*m) < gap-threshold)
    (hgap : integerVector z ∉ integerLine v → gap ≤ spaceValue (integerPlane v z)) :
    integerVector z ∈ integerLine v := by
  by_contra hnot
  have hupper := short_vector_plane_bound v z w a m hm hidentity R hR
  have hlower := hgap hnot
  linarith

theorem short_vector_mem_line_of_le (v z w : ι → ℤ) (a m : ℤ)
    (hm : 0 < m) (hidentity : ∀ i, w i = a*v i + m*z i)
    (R threshold gap : ℝ) (hR : ∀ i, |(w i : ℝ)| ≤ R)
    (hbelow : spaceValue (integerLine v) ≤ threshold)
    (hshort : R/(2*m) < gap-threshold)
    (hgap : integerVector z ∉ integerLine v → gap ≤ spaceValue (integerPlane v z)) :
    integerVector w ∈ integerLine v := by
  have hz := short_vector_lift_mem_line_of_le v z w a m hm hidentity
    R threshold gap hR hbelow hshort hgap
  have heq : integerVector w = (a : ℝ) • integerVector v + (m : ℝ) • integerVector z := by
    ext i
    simp only [integerVector, Pi.add_apply, Pi.smul_apply, smul_eq_mul]
    exact_mod_cast hidentity i
  rw [heq]
  exact (integerLine v).add_mem
    ((integerLine v).smul_mem _ (integerVector_mem_line v))
    ((integerLine v).smul_mem _ hz)

/-- A closed bound for the speed line is sufficient when the modular vector
is strictly shorter than the geometric gap. -/
theorem short_congruent_vector_mem_line_of_le (v w : ι → ℤ) (a m : ℤ)
    (hm : 0 < m) (hcong : ∀ i, m ∣ w i-a*v i)
    (R threshold gap : ℝ) (hR : ∀ i, |(w i : ℝ)| ≤ R)
    (hbelow : spaceValue (integerLine v) ≤ threshold)
    (hshort : R/(2*m) < gap-threshold)
    (hgap : ∀ z : ι → ℤ, integerVector z ∉ integerLine v →
      gap ≤ spaceValue (integerPlane v z)) :
    integerVector w ∈ integerLine v := by
  obtain ⟨z, hz⟩ := exists_integer_lift v w a m hcong
  exact short_vector_mem_line_of_le v z w a m hm hz R threshold gap
    hR hbelow hshort (hgap z)

/-- The constants for the ten-speed binary protocol: a plane gap `1/10`,
a closed line threshold `1/11`, and the exact integer shortness test. -/
theorem ten_speed_short_congruent_vector_mem_line (v w : Fin 10 → ℤ) (a m : ℤ)
    (hm : 0 < m) (hcong : ∀ i, m ∣ w i-a*v i)
    (R : ℕ) (hR : ∀ i, (w i).natAbs ≤ R)
    (hbelow : spaceValue (integerLine v) ≤ (1/11 : ℝ))
    (hshort : 110*(R : ℤ) < 2*m)
    (hgap : ∀ z : Fin 10 → ℤ, integerVector z ∉ integerLine v →
      (1/10 : ℝ) ≤ spaceValue (integerPlane v z)) :
    integerVector w ∈ integerLine v := by
  have hmR : (0 : ℝ) < m := by exact_mod_cast hm
  have hshortR : (110 : ℝ)*R < 2*m := by exact_mod_cast hshort
  have hsmall : (R : ℝ)/(2*m) < (1/10 : ℝ)-1/11 := by
    apply (div_lt_iff₀ (by positivity : (0 : ℝ) < 2*m)).mpr
    norm_num
    nlinarith
  have hbound (i : Fin 10) : |(w i : ℝ)| ≤ (R : ℝ) := by
    have h : ((w i).natAbs : ℝ) ≤ (R : ℝ) := by exact_mod_cast hR i
    simpa only [Nat.cast_natAbs, Int.cast_abs] using h
  exact short_congruent_vector_mem_line_of_le v w a m hm hcong
    R (1/11) (1/10) hbound hbelow hsmall hgap

end

end Loneliness.Modular
