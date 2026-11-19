import Conjectures.LonelinessHyperplaneSubspaceTorus

/-! Below a fixed subspace maximum, every bad integer velocity lies
on one of finitely many proper integer-frequency slices. The argument
uses the compact torus closure of the actual real subspace, so it does
not assume a lattice basis or any unproved equidistribution theorem. -/

namespace Loneliness.Hyperplane.RealSubspace

open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι] [Nonempty ι]

private theorem continuous_torus_point : Continuous (torusPointClearance (ι := ι)) := by
  unfold torusPointClearance
  exact Continuous.finset_inf'_apply Finset.univ_nonempty
    (fun i _ => (continuous_apply i).norm)

theorem exists_finite_frequency_bad_cover
    (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) (u : ℝ)
    (hu : u < shiftedSpaceValue E s) :
    ∃ B : Finset (ι → ℤ),
      (∀ n ∈ B, E ⊓ relationSpace n < E) ∧
      ∀ (v : ι → ℤ), integerVector v ∈ E → shiftedVelocityValue v s ≤ u →
        ∃ n ∈ B, integerPairing n v = 0 := by
  classical
  obtain ⟨x, hx, hxvalue⟩ := exists_point_above E s u hu
  let z : torusGroup E := ⟨torusQuotient x, torusQuotient_mem E hx⟩
  let f : torusGroup E → ℝ := fun y =>
    torusPointClearance (torusQuotient s + (y : UnitAddTorus ι))
  have htranslate : Continuous (fun y : torusGroup E =>
      torusQuotient s + (y : UnitAddTorus ι)) :=
    (continuous_const : Continuous (fun _ : torusGroup E => torusQuotient s)).add
      (continuous_subtype_val : Continuous (fun y : torusGroup E =>
        (y : UnitAddTorus ι)))
  have hf : Continuous f := (continuous_torus_point (ι := ι)).comp htranslate
  have hz : f z = pointClearance (s + x) := by
    change torusPointClearance (torusQuotient s + torusQuotient x) = _
    rw [← map_add]
    exact torusPointClearance_coe (s + x)
  have hpos : 0 < f z - u := by rw [hz]; linarith
  obtain ⟨ε, hε, hnear⟩ := Metric.continuousAt_iff.mp
    (show ContinuousAt f z from hf.continuousAt) (f z - u) hpos
  obtain ⟨B, hB, hdense⟩ :=
    CompactSubgroup.exists_finite_frequency_dense_velocity (torusGroup E) ε hε
  refine ⟨B, ?_, ?_⟩
  · intro n hn
    exact (nontrivialFrequency_iff_slice_lt E n).mp (hB n hn)
  · intro v hv hlow
    by_contra hbad
    have havoid : ∀ n ∈ B, integerPairing n v ≠ 0 := by
      intro n hn hnzero
      exact hbad ⟨n, hn, hnzero⟩
    let hvH := velocity_mem_torusGroup E v hv
    obtain ⟨t, ht⟩ := hdense v hvH havoid z
    have hclose := hnear ht
    rw [Real.dist_eq] at hclose
    have hgt : u < f (CompactSubgroup.velocity (torusGroup E) v hvH t) := by
      have hlo := (abs_lt.mp hclose).1
      linarith
    have hle : f (CompactSubgroup.velocity (torusGroup E) v hvH t) ≤
        shiftedVelocityValue v s := by
      obtain ⟨r, hr, rfl⟩ := exists_unitCircle_representative t
      change torusPointClearance ((fun i => (s i : UnitAddCircle)) +
        (fun i => v i • (r : UnitAddCircle))) ≤ _
      rw [torus_velocity_clearance_coe]
      exact le_shiftedVelocityValue v s hr
    exact (not_lt_of_ge (hle.trans hlow)) hgt

end

end Loneliness.Hyperplane.RealSubspace
