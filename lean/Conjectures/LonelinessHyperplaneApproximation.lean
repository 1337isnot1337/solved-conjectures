import Conjectures.LonelinessHyperplaneFiniteExceptions

/-! The finite frequency cover controls the actual maximum along every
shifted real velocity circle. The loss bound is uniform in the shift;
using half the requested tolerance also controls the strict supremum
event without an unproved attainment claim for the shift supremum. -/

namespace Loneliness.Hyperplane

open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι]

def realPointInTorusRelation (m : ι → ℤ) (x : ι → ℝ)
    (hx : pairing m x = 0) : torusRelationGroup m :=
  ⟨fun i => (x i : UnitAddCircle), by
    rw [mem_torusRelationGroup, normalHom_coe, hx]
    rfl⟩

theorem unitCircle_dist_coe (x y : ℝ) :
    dist (x : UnitAddCircle) (y : UnitAddCircle) = distance (x - y) := by
  rw [dist_eq_norm, ← AddCircle.coe_sub, UnitAddCircle.norm_eq]
  rfl

/-- A circle point has a representative in the interval used in the
definition of the real-time velocity maximum. -/
theorem exists_unitCircle_representative (t : UnitAddCircle) :
    ∃ r ∈ Set.Icc (0 : ℝ) 1, (r : UnitAddCircle) = t := by
  refine ⟨(AddCircle.equivIco (1 : ℝ) 0 t : ℝ), ?_, AddCircle.coe_equivIco⟩
  have h := (AddCircle.equivIco (1 : ℝ) 0 t).2
  exact ⟨h.1, by simpa only [zero_add] using h.2.le⟩

omit [Fintype ι] in
theorem coe_real_velocity (v : ι → ℤ) (r : ℝ) (i : ι) :
    ((r * (v i : ℝ) : ℝ) : UnitAddCircle) = v i • (r : UnitAddCircle) := by
  rw [mul_comm, ← zsmul_eq_mul, AddCircle.coe_zsmul]

variable [Nonempty ι]

def uniformShiftGap (m v : ι → ℤ) : ℝ :=
  sSup (Set.range (fun s : ι → ℝ => predictedValue m s - shiftedVelocityValue v s))

theorem shiftedVelocityValue_nonneg (v : ι → ℤ) (s : ι → ℝ) :
    0 ≤ shiftedVelocityValue v s :=
  (point_nonneg (s + (0 : ℝ) • integerVector v)).trans
    (le_shiftedVelocityValue v s (by norm_num))

omit [Nonempty ι] in
theorem predictedValue_le_half (m : ι → ℤ) (s : ι → ℝ) :
    predictedValue m s ≤ 1 / 2 := by
  have hA : 0 ≤ normalMass m := Finset.sum_nonneg (fun i _ => abs_nonneg (m i : ℝ))
  have hd := div_nonneg (distance_nonneg (pairing m (centerMinus s))) hA
  unfold predictedValue
  linarith

theorem shiftGap_nonneg (m : ι → ℤ) (hm : PrimitiveNormal m)
    (v : ι → ℤ) (hv : integerPairing m v = 0) (s : ι → ℝ) :
    0 ≤ predictedValue m s - shiftedVelocityValue v s := by
  exact sub_nonneg.mpr (orthogonal_velocity_value_le m hm v hv s)

theorem shiftGap_range_bddAbove (m v : ι → ℤ) :
    BddAbove (Set.range (fun s : ι → ℝ =>
      predictedValue m s - shiftedVelocityValue v s)) := by
  refine ⟨1 / 2, ?_⟩
  rintro _ ⟨s, rfl⟩
  linarith [predictedValue_le_half m s, shiftedVelocityValue_nonneg v s]

theorem shiftGap_le_uniformShiftGap (m v : ι → ℤ) (s : ι → ℝ) :
    predictedValue m s - shiftedVelocityValue v s ≤ uniformShiftGap m v :=
  le_csSup (shiftGap_range_bddAbove m v) (Set.mem_range_self s)

theorem uniformShiftGap_nonneg (m : ι → ℤ) (hm : PrimitiveNormal m)
    (v : ι → ℤ) (hv : integerPairing m v = 0) : 0 ≤ uniformShiftGap m v :=
  (shiftGap_nonneg m hm v hv 0).trans (shiftGap_le_uniformShiftGap m v 0)

omit [Nonempty ι] in
/-- Approximate a real kernel point by a real time in `[0,1]`, modulo
integer translations in every coordinate. -/
theorem exists_real_time_close_of_torus_dense
    (m v : ι → ℤ) (hv : integerPairing m v = 0)
    (δ : ℝ) (hδ : 0 < δ)
    (hdense : ∀ x : torusRelationGroup m,
      ∃ t : UnitAddCircle, dist (integerVelocityInRelation m v hv t) x < δ)
    (x : ι → ℝ) (hx : pairing m x = 0) :
    ∃ r ∈ Set.Icc (0 : ℝ) 1, ∃ z : ι → ℤ,
      ∀ i, |x i - (z i : ℝ) - r * (v i : ℝ)| ≤ δ := by
  obtain ⟨t, ht⟩ := hdense (realPointInTorusRelation m x hx)
  obtain ⟨r, hr, hrt⟩ := exists_unitCircle_representative t
  change dist (fun i => v i • t) (fun i => (x i : UnitAddCircle)) < δ at ht
  have hcoord := (dist_pi_lt_iff hδ).mp ht
  refine ⟨r, hr, fun i => round (x i - r * (v i : ℝ)), ?_⟩
  intro i
  have hd : distance (x i - r * (v i : ℝ)) < δ := by
    rw [← unitCircle_dist_coe, coe_real_velocity, hrt, dist_comm]
    exact hcoord i
  have he : x i - (round (x i - r * (v i : ℝ)) : ℝ) - r * (v i : ℝ) =
      (x i - r * (v i : ℝ)) - (round (x i - r * (v i : ℝ)) : ℝ) := by ring
  rw [he]
  exact hd.le

theorem shiftGap_le_of_torus_dense
    (m : ι → ℤ) (hm : PrimitiveNormal m) (v : ι → ℤ)
    (hv : integerPairing m v = 0) (δ : ℝ) (hδ : 0 < δ)
    (hdense : ∀ x : torusRelationGroup m,
      ∃ t : UnitAddCircle, dist (integerVelocityInRelation m v hv t) x < δ)
    (s : ι → ℝ) : predictedValue m s - shiftedVelocityValue v s ≤ δ := by
  obtain ⟨x, hx, hmax⟩ := shifted_hyperplane_attainment m hm s
  obtain ⟨r, hr, z, hz⟩ := exists_real_time_close_of_torus_dense m v hv δ hδ hdense x hx
  have htransfer : pointClearance (s + x) ≤
      pointClearance (s + r • integerVector v) + δ := by
    apply point_transfer z
    intro i
    have he : (s + x) i - (z i : ℝ) - (s + r • integerVector v) i =
        x i - (z i : ℝ) - r * (v i : ℝ) := by
      simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul, integerVector]
      ring
    rw [he]
    exact hz i
  rw [hmax] at htransfer
  have htime := le_shiftedVelocityValue v s hr
  linarith

theorem uniformShiftGap_le_of_torus_dense
    (m : ι → ℤ) (hm : PrimitiveNormal m) (v : ι → ℤ)
    (hv : integerPairing m v = 0) (δ : ℝ) (hδ : 0 < δ)
    (hdense : ∀ x : torusRelationGroup m,
      ∃ t : UnitAddCircle, dist (integerVelocityInRelation m v hv t) x < δ) :
    uniformShiftGap m v ≤ δ := by
  apply csSup_le (Set.range_nonempty _)
  rintro _ ⟨s, rfl⟩
  exact shiftGap_le_of_torus_dense m hm v hv δ hδ hdense s

/-- One finite set of proper integer relations controls the supremum
over all real shifts, with a strict bound at the requested tolerance. -/
theorem exists_finite_frequency_uniform_gap
    (m : ι → ℤ) (hm : PrimitiveNormal m) (ε : ℝ) (hε : 0 < ε) :
    ∃ B : Finset (ι → ℤ),
      (∀ n ∈ B, ¬ ∃ c : ℤ, n = c • m) ∧
      ∀ (v : ι → ℤ) (_hv : integerPairing m v = 0),
        (∀ n ∈ B, integerPairing n v ≠ 0) → uniformShiftGap m v < ε := by
  obtain ⟨B, hB, hdense⟩ :=
    exists_finite_frequency_dense_velocity m hm (ε / 2) (by linarith)
  refine ⟨B, hB, ?_⟩
  intro v hv havoid
  have hgap := uniformShiftGap_le_of_torus_dense m hm v hv (ε / 2)
    (by linarith) (hdense v hv havoid)
  linarith

theorem exists_finite_frequency_uniform_gap_cover
    (m : ι → ℤ) (hm : PrimitiveNormal m) (ε : ℝ) (hε : 0 < ε) :
    ∃ B : Finset (ι → ℤ),
      (∀ n ∈ B, ¬ ∃ c : ℤ, n = c • m) ∧
      ∀ (v : ι → ℤ), integerPairing m v = 0 → ε ≤ uniformShiftGap m v →
        ∃ n ∈ B, integerPairing n v = 0 := by
  classical
  obtain ⟨B, hB, hgap⟩ := exists_finite_frequency_uniform_gap m hm ε hε
  refine ⟨B, hB, ?_⟩
  intro v hv hbad
  by_contra h
  have havoid : ∀ n ∈ B, integerPairing n v ≠ 0 := by
    intro n hn hz
    exact h ⟨n, hn, hz⟩
  exact (not_lt_of_ge hbad) (hgap v hv havoid)

end

end Loneliness.Hyperplane
