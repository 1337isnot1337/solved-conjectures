import Conjectures.LonelinessHyperplaneAdmissibility
import Conjectures.LonelinessHyperplaneTorusValue
import Mathlib.Analysis.SpecificLimits.Basic

/-! Uniform sampling of ordered positive, pairwise distinct integer
velocities in the relation hyperplane. Probabilities are literal ratios
of finite event counts to sample counts. The denominator is eventually
positive, and the uniform-in-shift failure probability is at most a
fixed constant divided by the box size. -/

namespace Loneliness.Hyperplane

open Filter
open scoped Topology

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

def positiveBoxUniformBad (m : ι → ℤ) (ε : ℝ) (N : ℕ) : Finset (ι → Fin N) :=
  (positiveBoxAdmissible m N).filter
    (fun v => ε ≤ uniformShiftGap m (positiveBoxCoordinates v))

def positiveBoxUniformGood (m : ι → ℤ) (ε : ℝ) (N : ℕ) : Finset (ι → Fin N) :=
  (positiveBoxAdmissible m N).filter
    (fun v => uniformShiftGap m (positiveBoxCoordinates v) < ε)

def uniformFailureProbability (m : ι → ℤ) (ε : ℝ) (N : ℕ) : ℝ :=
  ((positiveBoxUniformBad m ε N).card : ℝ) / (positiveBoxAdmissible m N).card

def uniformSuccessProbability (m : ι → ℤ) (ε : ℝ) (N : ℕ) : ℝ :=
  ((positiveBoxUniformGood m ε N).card : ℝ) / (positiveBoxAdmissible m N).card

theorem positiveBoxUniform_partition (m : ι → ℤ) (ε : ℝ) (N : ℕ) :
    (positiveBoxUniformBad m ε N).card + (positiveBoxUniformGood m ε N).card =
      (positiveBoxAdmissible m N).card := by
  classical
  simpa only [positiveBoxUniformBad, positiveBoxUniformGood, not_le] using
    Finset.card_filter_add_card_filter_not (s := positiveBoxAdmissible m N)
      (fun v => ε ≤ uniformShiftGap m (positiveBoxCoordinates v))

theorem uniformSuccessProbability_eq_one_sub
    (m : ι → ℤ) (ε : ℝ) (N : ℕ) (hN : 0 < (positiveBoxAdmissible m N).card) :
    uniformSuccessProbability m ε N = 1 - uniformFailureProbability m ε N := by
  have hc : ((positiveBoxUniformBad m ε N).card : ℝ) +
      ((positiveBoxUniformGood m ε N).card : ℝ) =
        ((positiveBoxAdmissible m N).card : ℝ) := by
    exact_mod_cast positiveBoxUniform_partition m ε N
  have hden : ((positiveBoxAdmissible m N).card : ℝ) ≠ 0 := by exact_mod_cast hN.ne'
  unfold uniformSuccessProbability uniformFailureProbability
  calc
    _ = (((positiveBoxAdmissible m N).card : ℝ) -
        ((positiveBoxUniformBad m ε N).card : ℝ)) / (positiveBoxAdmissible m N).card := by
      congr 1
      linarith
    _ = _ := by rw [sub_div, div_self hden]

theorem uniformFailureProbability_nonneg (m : ι → ℤ) (ε : ℝ) (N : ℕ) :
    0 ≤ uniformFailureProbability m ε N := by
  unfold uniformFailureProbability
  positivity

/-- The exceptional count is uniform in the box size, including boxes
whose admissible sample is empty. -/
theorem exists_uniform_bad_count_bound
    (m : ι → ℤ) (hm : PrimitiveNormal m) (ε : ℝ) (hε : 0 < ε) :
    ∃ R : ℕ, ∀ N : ℕ,
      (positiveBoxUniformBad m ε N).card ≤ R * N ^ (Fintype.card ι - 2) := by
  classical
  obtain ⟨B, hB, hcover⟩ := exists_finite_frequency_uniform_gap_cover m hm ε hε
  refine ⟨B.card, ?_⟩
  intro N
  have hsub : positiveBoxUniformBad m ε N ⊆ positiveBoxExceptional m B N := by
    intro v hv
    obtain ⟨hvA, hbad⟩ := Finset.mem_filter.mp hv
    have hkernel := (Finset.mem_filter.mp hvA).2.1
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, hkernel,
      hcover (positiveBoxCoordinates v) hkernel hbad⟩
  exact (Finset.card_le_card hsub).trans (positiveBoxExceptional_card_le m hm B hB N)

private theorem boxSize_le_twice_mul_floor {N C : ℕ} (hC : 0 < C) (hN : C ≤ N) :
    N ≤ (2 * C) * (N / C) := by
  have hq : 1 ≤ N / C := Nat.div_pos hN hC
  have hCq : C ≤ C * (N / C) := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left C hq
  have hmod : N % C ≤ C := (Nat.mod_lt N hC).le
  have hdiv := Nat.mod_add_div N C
  nlinarith

/-- An exact natural-number inequality turns the two counting exponents
into a reciprocal-box-size probability bound. -/
theorem exceptional_count_mul_box_le
    (k C R N E D : ℕ) (hk : 2 ≤ k) (hC : 0 < C) (hN : C ≤ N)
    (hE : E ≤ R * N ^ (k - 2)) (hD : (N / C) ^ (k - 1) ≤ D) :
    E * N ≤ (R * (2 * C) ^ (k - 1)) * D := by
  have hexp : k - 2 + 1 = k - 1 := by omega
  have hpower : N ^ (k - 1) ≤ (2 * C) ^ (k - 1) * D := by
    calc
      _ ≤ ((2 * C) * (N / C)) ^ (k - 1) :=
        Nat.pow_le_pow_left (boxSize_le_twice_mul_floor hC hN) _
      _ = (2 * C) ^ (k - 1) * (N / C) ^ (k - 1) := mul_pow _ _ _
      _ ≤ _ := Nat.mul_le_mul_left _ hD
  calc
    E * N ≤ (R * N ^ (k - 2)) * N := Nat.mul_le_mul_right N hE
    _ = R * N ^ (k - 1) := by rw [Nat.mul_assoc, ← pow_succ, hexp]
    _ ≤ R * ((2 * C) ^ (k - 1) * D) := Nat.mul_le_mul_left R hpower
    _ = _ := by ring

/-- Every sufficiently large sample is nonempty, and the probability of
a failure at any shift is at most `K/N`. Constants may depend on the
normal and tolerance; they do not depend on the box size. -/
theorem exists_uniform_probability_rate
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (ε : ℝ) (hε : 0 < ε) :
    ∃ C K : ℕ, 0 < C ∧ ∀ N : ℕ, C ≤ N →
      0 < (positiveBoxAdmissible m N).card ∧
        uniformFailureProbability m ε N ≤ (K : ℝ) / (N : ℝ) := by
  obtain ⟨C, hC, hD⟩ := exists_admissible_box_denominator m hm hreal
  obtain ⟨R, hE⟩ := exists_uniform_bad_count_bound m hm ε hε
  refine ⟨C, R * (2 * C) ^ (Fintype.card ι - 1), hC, ?_⟩
  intro N hN
  have hq : 0 < N / C := Nat.div_pos hN hC
  have hsample : 0 < (positiveBoxAdmissible m N).card :=
    (pow_pos hq _).trans_le (hD N hN)
  refine ⟨hsample, ?_⟩
  have hcross := exceptional_count_mul_box_le
    (Fintype.card ι) C R N (positiveBoxUniformBad m ε N).card
    (positiveBoxAdmissible m N).card hdim hC hN (hE N) (hD N hN)
  have hsampleR : (0 : ℝ) < (positiveBoxAdmissible m N).card := by exact_mod_cast hsample
  have hNR : (0 : ℝ) < (N : ℝ) := by exact_mod_cast (lt_of_lt_of_le hC hN)
  apply (div_le_div_iff₀ hsampleR hNR).mpr
  exact_mod_cast hcross

theorem uniformFailureProbability_tendsto_zero
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (ε : ℝ) (hε : 0 < ε) :
    Tendsto (uniformFailureProbability m ε) atTop (𝓝 0) := by
  obtain ⟨C, K, _, hrate⟩ := exists_uniform_probability_rate m hm hreal hdim ε hε
  apply squeeze_zero' (Eventually.of_forall (uniformFailureProbability_nonneg m ε))
    (g := fun N : ℕ => (K : ℝ) / (N : ℝ))
  · filter_upwards [eventually_ge_atTop C] with N hN
    exact (hrate N hN).2
  · exact tendsto_const_div_atTop_nhds_zero_nat (K : ℝ)

/-- The same rate, written with the literal supremum over torus shifts
and maximum over torus time from the original statement. -/
theorem exists_torus_uniform_probability_rate
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (ε : ℝ) (hε : 0 < ε) :
    ∃ C K : ℕ, 0 < C ∧ ∀ N : ℕ, C ≤ N →
      0 < (positiveBoxAdmissible m N).card ∧
        (((positiveBoxAdmissible m N).filter (fun v =>
          ε ≤ torusUniformShiftGap m (positiveBoxCoordinates v))).card : ℝ) /
            (positiveBoxAdmissible m N).card ≤ (K : ℝ) / (N : ℝ) := by
  simpa only [torusUniformShiftGap_eq_real, uniformFailureProbability,
    positiveBoxUniformBad] using exists_uniform_probability_rate m hm hreal hdim ε hε

/-- The strict uniform approximation event has limiting probability one
under sampling of all ordered positive distinct integer velocities. -/
theorem uniformSuccessProbability_tendsto_one
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι) (ε : ℝ) (hε : 0 < ε) :
    Tendsto (uniformSuccessProbability m ε) atTop (𝓝 1) := by
  obtain ⟨C, _, _, hrate⟩ := exists_uniform_probability_rate m hm hreal hdim ε hε
  have hlim : Tendsto (fun N => 1 - uniformFailureProbability m ε N) atTop (𝓝 1) := by
    simpa only [sub_zero] using
      tendsto_const_nhds.sub (uniformFailureProbability_tendsto_zero m hm hreal hdim ε hε)
  apply hlim.congr'
  filter_upwards [eventually_ge_atTop C] with N hN
  exact (uniformSuccessProbability_eq_one_sub m ε N (hrate N hN).1).symm

def positiveBoxBelow (m : ι → ℤ) (s : ι → ℝ) (u : ℝ) (N : ℕ) :
    Finset (ι → Fin N) :=
  (positiveBoxAdmissible m N).filter
    (fun v => shiftedVelocityValue (positiveBoxCoordinates v) s ≤ u)

/-- A fixed closed subthreshold event has the lower-dimensional count
bound. This does not assert that its exact count is a quasipolynomial. -/
theorem exists_subthreshold_count_bound
    (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ)
    (u : ℝ) (hu : u < predictedValue m s) :
    ∃ R : ℕ, ∀ N : ℕ,
      (positiveBoxBelow m s u N).card ≤ R * N ^ (Fintype.card ι - 2) := by
  classical
  obtain ⟨R, hR⟩ := exists_uniform_bad_count_bound m hm
    (predictedValue m s - u) (sub_pos.mpr hu)
  refine ⟨R, ?_⟩
  intro N
  have hsub : positiveBoxBelow m s u N ⊆
      positiveBoxUniformBad m (predictedValue m s - u) N := by
    intro v hv
    obtain ⟨hvA, hbelow⟩ := Finset.mem_filter.mp hv
    refine Finset.mem_filter.mpr ⟨hvA, ?_⟩
    calc
      predictedValue m s - u ≤
          predictedValue m s - shiftedVelocityValue (positiveBoxCoordinates v) s :=
        sub_le_sub_left hbelow _
      _ ≤ _ := shiftGap_le_uniformShiftGap m (positiveBoxCoordinates v) s
  exact (Finset.card_le_card hsub).trans (hR N)

end

end Loneliness.Hyperplane
