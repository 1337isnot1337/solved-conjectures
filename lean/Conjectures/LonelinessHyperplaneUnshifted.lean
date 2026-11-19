import Conjectures.LonelinessHyperplaneFixedShift
import Conjectures.LonelinessHyperplaneEndpointArithmetic
import Mathlib.Algebra.Ring.Int.Parity

/-! The unshifted profile depends on the parity of the normal sum.
The canonical finite-order endpoint residue is the coordinatewise sign
of the normal, for both parity cases. This module does not yet identify
the full endpoint event for arbitrary nonprimitive velocities. -/

namespace Loneliness.Hyperplane

open Filter
open scoped BigOperators Topology

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def integerSignChoice (m : ι → ℤ) : ι → ℤ :=
  fun i => if 0 ≤ m i then 1 else -1

theorem integerSignChoice_coe (m : ι → ℤ) (i : ι) :
    (integerSignChoice m i : ℝ) = signChoice m i := by
  by_cases hi : 0 ≤ m i
  · have hiR : (0 : ℝ) ≤ (m i : ℝ) := by exact_mod_cast hi
    simp only [integerSignChoice, signChoice, if_pos hi, if_pos hiR, Int.cast_one]
  · have hiR : ¬ (0 : ℝ) ≤ (m i : ℝ) := by exact_mod_cast hi
    simp only [integerSignChoice, signChoice, if_neg hi, if_neg hiR,
      Int.cast_neg, Int.cast_one]

theorem integerSignChoice_abs (m : ι → ℤ) (i : ι) : |integerSignChoice m i| = 1 := by
  unfold integerSignChoice
  split_ifs <;> norm_num

theorem integerPairing_integerSignChoice (m : ι → ℤ) :
    integerPairing m (integerSignChoice m) = (normalSize m : ℤ) := by
  rw [cast_normalSize]
  unfold integerPairing
  apply Finset.sum_congr rfl
  intro i _
  by_cases hi : 0 ≤ m i
  · simp only [integerSignChoice, if_pos hi, mul_one, abs_of_nonneg hi]
  · simp only [integerSignChoice, if_neg hi, mul_neg_one, abs_of_neg (lt_of_not_ge hi)]

theorem normalMass_eq_normalSize (m : ι → ℤ) : normalMass m = (normalSize m : ℝ) := by
  simp only [normalMass, normalSize, Nat.cast_sum, Nat.cast_natAbs, Int.cast_abs]

theorem normalSize_pos (m : ι → ℤ) (hm : PrimitiveNormal m) : 0 < normalSize m := by
  have h : (0 : ℝ) < (normalSize m : ℝ) := by
    rw [← normalMass_eq_normalSize]
    exact normalMass_pos m hm
  exact_mod_cast h

theorem normalSize_even_iff (m : ι → ℤ) :
    Even (normalSize m) ↔ Even (∑ i, m i) := by
  have hcast : (normalSize m : ZMod 2) = ((∑ i, m i : ℤ) : ZMod 2) := by
    simp only [normalSize, Nat.cast_sum, ZMod.natAbs_mod_two, Int.cast_sum]
  calc
    Even (normalSize m) ↔ (normalSize m : ZMod 2) = 0 :=
      ZMod.natCast_eq_zero_iff_even.symm
    _ ↔ ((∑ i, m i : ℤ) : ZMod 2) = 0 := by rw [hcast]
    _ ↔ Even (∑ i, m i) := ZMod.intCast_eq_zero_iff_even

theorem normalSize_odd_iff (m : ι → ℤ) :
    Odd (normalSize m) ↔ Odd (∑ i, m i) := by
  rw [← Nat.not_even_iff_odd, ← Int.not_even_iff_odd, normalSize_even_iff]

def endpointModulus (m : ι → ℤ) : ℕ :=
  if Even (normalSize m) then 2 else normalSize m

theorem endpointModulus_pos (m : ι → ℤ) (hm : PrimitiveNormal m) :
    0 < endpointModulus m := by
  unfold endpointModulus
  split_ifs
  · norm_num
  · exact normalSize_pos m hm

theorem endpointModulus_dvd_normalSize (m : ι → ℤ) :
    endpointModulus m ∣ normalSize m := by
  unfold endpointModulus
  split_ifs with h
  · exact h.two_dvd
  · exact dvd_rfl

def canonicalResidue (m : ι → ℤ) (Q : ℕ) : ι → ZMod Q :=
  fun i => (integerSignChoice m i : ZMod Q)

theorem canonicalResidue_isUnit (m : ι → ℤ) (Q : ℕ) (i : ι) :
    IsUnit (canonicalResidue m Q i) := by
  unfold canonicalResidue integerSignChoice
  split_ifs <;> simp

theorem canonicalResidue_mem_kernel (m : ι → ℤ) (Q : ℕ)
    (hQ : Q ∣ normalSize m) : residueNormalHom m Q (canonicalResidue m Q) = 0 := by
  change residueNormalHom m Q (fun i => (integerSignChoice m i : ZMod Q)) = 0
  rw [residueNormalHom_intCast, integerPairing_integerSignChoice, Int.cast_natCast]
  exact (ZMod.natCast_eq_zero_iff (normalSize m) Q).mpr hQ

theorem canonicalEndpointResidue_mem_kernel (m : ι → ℤ) :
    residueNormalHom m (endpointModulus m) (canonicalResidue m (endpointModulus m)) = 0 :=
  canonicalResidue_mem_kernel m _ (endpointModulus_dvd_normalSize m)

theorem pairing_center_zero (m : ι → ℤ) :
    pairing m (centerMinus (0 : ι → ℝ)) = ((∑ i, m i : ℤ) : ℝ) / 2 := by
  simp only [pairing, centerMinus, Pi.zero_apply, sub_zero, Int.cast_sum]
  rw [← Finset.sum_mul]
  ring

theorem distance_integer_eq_zero (z : ℤ) : distance (z : ℝ) = 0 := by
  apply le_antisymm ?_ (distance_nonneg _)
  simpa only [sub_self, abs_zero] using distance_le_int (z : ℝ) z

theorem distance_half_eq_half : distance (1 / 2 : ℝ) = 1 / 2 := by
  simpa only [sub_zero, abs_zero] using
    distance_half_sub_of_abs_le_half (0 : ℝ) (by norm_num)

theorem predictedValue_zero_even (m : ι → ℤ) (heven : Even (∑ i, m i)) :
    predictedValue m 0 = 1 / 2 := by
  obtain ⟨z, hz⟩ := even_iff_exists_two_mul.mp heven
  have hcenter : pairing m (centerMinus (0 : ι → ℝ)) = (z : ℝ) := by
    rw [pairing_center_zero, hz]
    push_cast
    ring
  rw [predictedValue, hcenter, distance_integer_eq_zero, zero_div, sub_zero]

theorem predictedValue_zero_odd
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hodd : Odd (∑ i, m i)) :
    predictedValue m 0 = 1 / 2 - 1 / (2 * normalMass m) := by
  obtain ⟨z, hz⟩ := hodd.exists_bit1
  have hcenter : pairing m (centerMinus (0 : ι → ℝ)) = 1 / 2 + (z : ℝ) := by
    rw [pairing_center_zero, hz]
    push_cast
    ring
  rw [predictedValue, hcenter, CriticalFamilies.distance_add_int, distance_half_eq_half]
  field_simp [(normalMass_pos m hm).ne'] <;> ring

theorem predictedValue_zero (m : ι → ℤ) (hm : PrimitiveNormal m) :
    predictedValue m 0 = if Even (normalSize m) then 1 / 2 else
      1 / 2 - 1 / (2 * normalMass m) := by
  by_cases h : Even (normalSize m)
  · rw [if_pos h]
    exact predictedValue_zero_even m ((normalSize_even_iff m).mp h)
  · rw [if_neg h]
    have hodd : Odd (∑ i, m i) :=
      (normalSize_odd_iff m).mp (Nat.not_even_iff_odd.mp h)
    exact predictedValue_zero_odd m hm hodd

variable [Nonempty ι]

theorem canonicalResidue_primitive (m : ι → ℤ) (Q : ℕ) [NeZero Q] :
    PrimitiveResidue (canonicalResidue m Q) := by
  obtain ⟨i⟩ := ‹Nonempty ι›
  exact primitiveResidue_of_unit_coordinate (canonicalResidue m Q) i
    (canonicalResidue_isUnit m Q i)

/-- The zero-shift limiting atom is the explicit even/odd value in the
original hyperplane statement. -/
theorem unshifted_cdf_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (u : ℝ) :
    Tendsto (fixedShiftCDF m 0 u) atTop
      (𝓝 (if u < (if Even (normalSize m) then 1 / 2 else
        1 / 2 - 1 / (2 * normalMass m)) then 0 else 1)) := by
  simpa only [predictedValue_zero m hm] using
    fixedShiftCDF_tendsto m hm hreal hdim 0 u

end

end Loneliness.Hyperplane
