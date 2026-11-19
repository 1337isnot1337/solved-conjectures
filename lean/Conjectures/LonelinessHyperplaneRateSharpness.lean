import Conjectures.LonelinessHyperplaneUnshifted
import Conjectures.LonelinessHyperplaneOneRelation
import Conjectures.LonelinessConsecutive
import Mathlib.Data.Fin.VecNotation

/-! Sharpness of the reciprocal-box-size error rate. For the primitive
normal `(1,1,-1)`, every positive multiple of `(1,2,3)` has loneliness
`1/4`, while the unshifted hyperplane profile is `1/3`. These give a
literal lower bound `1/(6N)` for the uniform failure probability. -/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

def sharpNormal : Fin 3 → ℤ := ![1, 1, -1]

def sharpVelocity (g : ℕ) : Fin 3 → ℤ :=
  fun i => (g : ℤ) * ((i : ℕ) + 1)

theorem sharpNormal_primitive : PrimitiveNormal sharpNormal := by
  change Finset.univ.gcd (fun i => (sharpNormal i).natAbs) = 1
  apply Nat.dvd_one.mp
  simpa only [sharpNormal, Matrix.cons_val_zero, Int.natAbs_one] using
    (Finset.gcd_dvd (s := Finset.univ) (f := fun i => (sharpNormal i).natAbs)
      (Finset.mem_univ (0 : Fin 3)))

theorem sharpNormal_realAdmissible : RealAdmissible sharpNormal := by
  refine ⟨fun i => ((i : ℕ) : ℝ) + 1, ?_, ?_, ?_⟩
  · norm_num [pairing, sharpNormal, Fin.sum_univ_succ]
  · intro i
    positivity
  · intro i j hij
    apply Fin.ext
    exact_mod_cast add_right_cancel hij

theorem sharpVelocity_orthogonal (g : ℕ) : integerPairing sharpNormal (sharpVelocity g) = 0 := by
  norm_num [integerPairing, sharpNormal, sharpVelocity, Fin.sum_univ_succ] <;> ring

theorem sharpVelocity_injective (g : ℕ) (hg : 0 < g) :
    Function.Injective (sharpVelocity g) := by
  intro i j hij
  apply Fin.ext
  have hgZ : (g : ℤ) ≠ 0 := by exact_mod_cast hg.ne'
  simp only [sharpVelocity, Nat.cast_add, Nat.cast_one] at hij
  have hi := mul_left_cancel₀ hgZ hij
  exact_mod_cast add_right_cancel hi

theorem sharpNormal_profile : predictedValue sharpNormal 0 = 1 / 3 := by
  have hodd : Odd (∑ i, sharpNormal i) := by
    norm_num [sharpNormal, Fin.sum_univ_succ]
  have h := predictedValue_zero_odd sharpNormal sharpNormal_primitive hodd
  norm_num [normalMass, sharpNormal, Fin.sum_univ_succ] at h
  exact h

theorem sharpVelocity_value_upper (g : ℕ) :
    shiftedVelocityValue (sharpVelocity g) 0 ≤ 1 / 4 := by
  apply shiftedVelocityValue_le
  intro t _
  have hp : pointClearance (0 + t • integerVector (sharpVelocity g)) ≤
      clearance [1, 2, 3] ((g : ℝ) * t) := by
    apply le_clearance (point_le_half _)
    intro d hd
    have hindex : ∃ i : Fin 3, (i : ℕ) + 1 = d := by
      simp only [List.mem_cons, List.mem_singleton] at hd
      rcases hd with rfl | rfl | rfl
      · exact ⟨0, rfl⟩
      · exact ⟨1, rfl⟩
      · exact ⟨2, rfl⟩
    obtain ⟨i, hi⟩ := hindex
    calc
      _ ≤ distance ((0 + t • integerVector (sharpVelocity g)) i) := point_le_distance _ i
      _ = distance ((d : ℝ) * ((g : ℝ) * t)) := by
        congr 1
        simp only [Pi.add_apply, Pi.zero_apply, Pi.smul_apply, smul_eq_mul,
          integerVector, sharpVelocity, Int.cast_mul, Int.cast_add, Int.cast_natCast,
          Int.cast_one, Nat.cast_add, Nat.cast_one, zero_add]
        have hiR : ((i : ℕ) : ℝ) + 1 = (d : ℝ) := by exact_mod_cast hi
        rw [hiR]
        ring
  have hc := consecutive_upper 3 (by decide) ((g : ℝ) * t)
  change clearance [1, 2, 3] ((g : ℝ) * t) ≤ 1 / ((3 : ℝ) + 1) at hc
  norm_num only at hc
  exact hp.trans hc

theorem sharpVelocity_attaining_time (g : ℕ) (hg : 0 < g) :
    pointClearance (0 + (1 / (4 * (g : ℝ))) • integerVector (sharpVelocity g)) = 1 / 4 := by
  have hgR : (0 : ℝ) < (g : ℝ) := by exact_mod_cast hg
  have hg1 : (1 : ℝ) ≤ (g : ℝ) := by exact_mod_cast hg
  have ht : 1 / (4 * (g : ℝ)) ∈ Set.Icc (0 : ℝ) 1 := by
    refine ⟨by positivity, ?_⟩
    apply (div_le_iff₀ (by positivity : (0 : ℝ) < 4 * (g : ℝ))).mpr
    nlinarith
  apply le_antisymm
  · exact (le_shiftedVelocityValue (sharpVelocity g) 0 ht).trans (sharpVelocity_value_upper g)
  · apply le_point
    intro i
    have hphase : (0 + (1 / (4 * (g : ℝ))) • integerVector (sharpVelocity g)) i =
        (((i : ℕ) : ℝ) + 1) / 4 := by
      simp only [Pi.add_apply, Pi.zero_apply, Pi.smul_apply, smul_eq_mul,
        integerVector, sharpVelocity, Int.cast_mul, Int.cast_add, Int.cast_natCast,
        Int.cast_one, Nat.cast_add, Nat.cast_one, zero_add]
      field_simp [hgR.ne'] <;> ring
    rw [hphase]
    apply distance_lower_of_cell (k := 0)
    · norm_num only [Int.cast_zero, sub_zero]
      have hi : (0 : ℝ) ≤ ((i : ℕ) : ℝ) := Nat.cast_nonneg _
      linarith
    · norm_num only [Int.cast_zero, sub_zero]
      have hi : ((i : ℕ) : ℝ) ≤ 2 := by
        exact_mod_cast (show (i : ℕ) ≤ 2 from by omega)
      linarith

theorem sharpVelocity_value (g : ℕ) (hg : 0 < g) :
    shiftedVelocityValue (sharpVelocity g) 0 = 1 / 4 := by
  have hgR : (0 : ℝ) < (g : ℝ) := by exact_mod_cast hg
  have hg1 : (1 : ℝ) ≤ (g : ℝ) := by exact_mod_cast hg
  have ht : 1 / (4 * (g : ℝ)) ∈ Set.Icc (0 : ℝ) 1 := by
    refine ⟨by positivity, ?_⟩
    apply (div_le_iff₀ (by positivity : (0 : ℝ) < 4 * (g : ℝ))).mpr
    nlinarith
  apply le_antisymm (sharpVelocity_value_upper g)
  rw [← sharpVelocity_attaining_time g hg]
  exact le_shiftedVelocityValue (sharpVelocity g) 0 ht

theorem sharpVelocity_uniform_gap (g : ℕ) :
    (1 / 12 : ℝ) ≤ uniformShiftGap sharpNormal (sharpVelocity g) := by
  have h := shiftGap_le_uniformShiftGap sharpNormal (sharpVelocity g) 0
  rw [sharpNormal_profile] at h
  linarith [sharpVelocity_value_upper g]

def sharpBoxVelocity {N : ℕ} (j : Fin (N / 3)) : Fin 3 → Fin N := fun i =>
  ⟨((j : ℕ) + 1) * ((i : ℕ) + 1) - 1, by
    have hj : (j : ℕ) + 1 ≤ N / 3 := by omega
    have hi : (i : ℕ) + 1 ≤ 3 := by omega
    have hmul := Nat.mul_le_mul hj hi
    have hdiv := Nat.div_mul_le_self N 3
    have hpos : 0 < ((j : ℕ) + 1) * ((i : ℕ) + 1) := by positivity
    omega⟩

theorem sharpBoxVelocity_coordinates {N : ℕ} (j : Fin (N / 3)) (i : Fin 3) :
    positiveBoxCoordinates (sharpBoxVelocity j) i = sharpVelocity ((j : ℕ) + 1) i := by
  have hpos : 1 ≤ ((j : ℕ) + 1) * ((i : ℕ) + 1) := by positivity
  have he : (((j : ℕ) + 1) * ((i : ℕ) + 1) - 1) + 1 =
      ((j : ℕ) + 1) * ((i : ℕ) + 1) := Nat.sub_add_cancel hpos
  change ((((j : ℕ) + 1) * ((i : ℕ) + 1) - 1 : ℕ) : ℤ) + 1 =
    (((j : ℕ) + 1 : ℕ) : ℤ) * (((i : ℕ) + 1 : ℕ) : ℤ)
  exact_mod_cast he

theorem sharpBoxVelocity_injective (N : ℕ) :
    Function.Injective (sharpBoxVelocity (N := N)) := by
  intro j k hjk
  apply Fin.ext
  have h := congrArg (fun v : Fin 3 → Fin N => ((v 0 : Fin N) : ℕ)) hjk
  simpa [sharpBoxVelocity] using h

theorem sharpBoxVelocity_mem_bad {N : ℕ} (j : Fin (N / 3)) :
    sharpBoxVelocity j ∈ positiveBoxUniformBad sharpNormal (1 / 12) N := by
  classical
  have hcoords : positiveBoxCoordinates (sharpBoxVelocity j) = sharpVelocity ((j : ℕ) + 1) :=
    funext (sharpBoxVelocity_coordinates j)
  apply Finset.mem_filter.mpr
  constructor
  · apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_univ _, ?_, ?_⟩
    · rw [hcoords]
      exact sharpVelocity_orthogonal _
    · intro i k hik
      apply sharpVelocity_injective ((j : ℕ) + 1) (Nat.succ_pos _)
      have h := congrArg (positiveBoxEntry (N := N)) hik
      change positiveBoxCoordinates (sharpBoxVelocity j) i =
        positiveBoxCoordinates (sharpBoxVelocity j) k at h
      simpa only [hcoords] using h
  · rw [hcoords]
    exact sharpVelocity_uniform_gap _

theorem sharp_uniform_bad_count_lower (N : ℕ) :
    N / 3 ≤ (positiveBoxUniformBad sharpNormal (1 / 12) N).card := by
  classical
  have hsub : Finset.univ.image (sharpBoxVelocity (N := N)) ⊆
      positiveBoxUniformBad sharpNormal (1 / 12) N := by
    intro v hv
    obtain ⟨j, _, rfl⟩ := Finset.mem_image.mp hv
    exact sharpBoxVelocity_mem_bad j
  have h := Finset.card_le_card hsub
  simpa only [Finset.card_image_of_injective _ (sharpBoxVelocity_injective N),
    Finset.card_univ, Fintype.card_fin] using h

theorem sharp_uniform_failure_probability_lower (N : ℕ) (hN : 3 ≤ N) :
    (1 : ℝ) / (6 * (N : ℝ)) ≤ uniformFailureProbability sharpNormal (1 / 12) N := by
  let E := (positiveBoxUniformBad sharpNormal (1 / 12) N).card
  let D := (positiveBoxAdmissible sharpNormal N).card
  have hE : N / 3 ≤ E := sharp_uniform_bad_count_lower N
  have hED : E ≤ D := Finset.card_le_card (Finset.filter_subset _ _)
  have hD : 0 < D := (Nat.div_pos hN (by decide)).trans_le (hE.trans hED)
  have hDN : D ≤ N ^ 2 := by
    simpa only [Fintype.card_fin, show (3 - 1 : ℕ) = 2 from by decide] using
      positiveBoxAdmissible_card_upper sharpNormal sharpNormal_primitive N
  have hfloor : N ≤ 6 * (N / 3) := by
    have hq := Nat.div_pos hN (by decide : 0 < 3)
    have hmod := Nat.mod_lt N (by decide : 0 < 3)
    have hdiv := Nat.mod_add_div N 3
    omega
  have hcross : D ≤ 6 * N * E := by
    calc
      D ≤ N ^ 2 := hDN
      _ = N * N := by ring
      _ ≤ N * (6 * E) := Nat.mul_le_mul_left N
        (hfloor.trans (Nat.mul_le_mul_left 6 hE))
      _ = 6 * N * E := by ring
  have hDR : (0 : ℝ) < (D : ℝ) := by exact_mod_cast hD
  have hNR : (0 : ℝ) < (N : ℝ) := by exact_mod_cast (show 0 < N from by omega)
  change (1 : ℝ) / (6 * (N : ℝ)) ≤ (E : ℝ) / (D : ℝ)
  apply (div_le_div_iff₀ (by positivity : (0 : ℝ) < 6 * (N : ℝ)) hDR).mpr
  have hcrossR : (D : ℝ) ≤ 6 * (N : ℝ) * (E : ℝ) := by exact_mod_cast hcross
  nlinarith

theorem sharp_uniform_failure_probability_two_sided :
    ∃ C K : ℕ, 0 < C ∧ ∀ N : ℕ, C ≤ N →
      (1 : ℝ) / (6 * (N : ℝ)) ≤ uniformFailureProbability sharpNormal (1 / 12) N ∧
        uniformFailureProbability sharpNormal (1 / 12) N ≤ (K : ℝ) / N := by
  obtain ⟨C, K, hC, hrate⟩ := exists_uniform_probability_rate sharpNormal
    sharpNormal_primitive sharpNormal_realAdmissible (by decide) (1 / 12) (by norm_num)
  refine ⟨max C 3, K, lt_of_lt_of_le hC (le_max_left _ _), ?_⟩
  intro N hN
  exact ⟨sharp_uniform_failure_probability_lower N ((le_max_right _ _).trans hN),
    (hrate N ((le_max_left _ _).trans hN)).2⟩

end

end Loneliness.Hyperplane
