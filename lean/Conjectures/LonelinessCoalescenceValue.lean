import Conjectures.LonelinessRationalSubspace
import Conjectures.LonelinessSubspaceDensity

/-! The value consequence of coordinate coalescence. The input lower bound
for lists of at most `m` distinct positive integer speeds stays explicit. -/

namespace Loneliness.CoordinateSubspace

noncomputable section

open SubspaceDensity

variable {ι : Type*} [Fintype ι]

def integerSpeeds (w : ι → ℤ) : List ℕ := by
  classical
  exact (Finset.univ.image (fun i => (w i).natAbs)).toList

theorem mem_integerSpeeds (w : ι → ℤ) (a : ℕ) :
    a ∈ integerSpeeds w ↔ ∃ i, (w i).natAbs = a := by
  classical
  simp [integerSpeeds]

theorem integerSpeeds_nodup (w : ι → ℤ) : (integerSpeeds w).Nodup := by
  classical
  exact Finset.nodup_toList _

theorem integerSpeeds_length (w : ι → ℤ) :
    (integerSpeeds w).length = Nat.card (Set.range (fun i => (w i).natAbs)) := by
  classical
  simp only [integerSpeeds, Finset.length_toList]
  exact (Nat.subtype_card _ (by simp)).symm

theorem integerSpeeds_nonempty [Nonempty ι] (w : ι → ℤ) : integerSpeeds w ≠ [] := by
  obtain ⟨i⟩ := ‹Nonempty ι›
  intro h
  have hi := (mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩
  rw [h] at hi
  exact List.not_mem_nil hi

theorem integerSpeeds_positive (w : ι → ℤ) (hw : ∀ i, w i ≠ 0) :
    ∀ a ∈ integerSpeeds w, 0 < a := by
  intro a ha
  obtain ⟨i, rfl⟩ := (mem_integerSpeeds w a).mp ha
  exact Int.natAbs_pos.mpr (hw i)

theorem distance_natAbs_mul (w : ℤ) (t : ℝ) :
    distance ((w.natAbs : ℝ) * t) = distance ((w : ℝ) * t) := by
  have habs : (w.natAbs : ℝ) = |(w : ℝ)| := by
    simp only [Nat.cast_natAbs, Int.cast_abs]
  rw [habs]
  rcases le_total 0 (w : ℝ) with h | h
  · rw [abs_of_nonneg h]
  · rw [abs_of_nonpos h, neg_mul, CriticalFamilies.distance_neg]

theorem pointClearance_integerSpeeds [Nonempty ι] (w : ι → ℤ) (t : ℝ) :
    pointClearance (t • (fun i => (w i : ℝ))) = clearance (integerSpeeds w) t := by
  apply le_antisymm
  · apply le_clearance (point_le_half _)
    intro a ha
    obtain ⟨i, rfl⟩ := (mem_integerSpeeds w a).mp ha
    rw [distance_natAbs_mul]
    simpa only [Pi.smul_apply, smul_eq_mul, mul_comm] using
      point_le_distance (t • (fun i => (w i : ℝ))) i
  · apply le_point
    intro i
    have hmem := (mem_integerSpeeds w ((w i).natAbs)).mpr ⟨i, rfl⟩
    have h := clearance_le_of_mem hmem t
    rw [distance_natAbs_mul] at h
    simpa only [Pi.smul_apply, smul_eq_mul, mul_comm] using h

theorem spaceValue_integer_line [Nonempty ι] (w : ι → ℤ) :
    spaceValue (Submodule.span ℝ {fun i => (w i : ℝ)}) = value (integerSpeeds w) := by
  apply le_antisymm
  · apply spaceValue_le
    intro x hx
    obtain ⟨t, rfl⟩ := Submodule.mem_span_singleton.mp hx
    rw [pointClearance_integerSpeeds]
    exact CriticalFamilies.le_value_any _ t
  · apply value_le
    intro t ht
    rw [← pointClearance_integerSpeeds]
    apply point_le_spaceValue
    exact Submodule.smul_mem _ t (Submodule.mem_span_singleton_self _)

theorem spaceValue_lower_of_runner_bound [Nonempty ι]
    (E : Submodule ℚ (ι → ℚ)) (hfree : CoordinateFree (realSpan E))
    (m : ℕ) (r : ℝ)
    (hrunners : ∀ ds : List ℕ, ds ≠ [] → ds.Nodup →
      ds.length ≤ m → (∀ a ∈ ds, 0 < a) → r ≤ value ds)
    (hcard : Fintype.card ι - Module.finrank ℝ (realSpan E) + 1 ≤ m) :
    r ≤ spaceValue (realSpan E) := by
  obtain ⟨w, hw, hwzero, hwcard⟩ := exists_integer_direction_real E hfree
  have hbound := hrunners (integerSpeeds w) (integerSpeeds_nonempty w)
    (integerSpeeds_nodup w)
    (by rw [integerSpeeds_length]; exact hwcard.trans hcard)
    (integerSpeeds_positive w hwzero)
  rw [← spaceValue_integer_line] at hbound
  apply hbound.trans
  apply spaceValue_mono
  exact Submodule.span_le.mpr (Set.singleton_subset_iff.mpr hw)

def LonelyRunnerBound (m : ℕ) : Prop :=
  ∀ ds : List ℕ, ds ≠ [] → ds.Nodup →
    ds.length ≤ m → (∀ a ∈ ds, 0 < a) → (1 : ℝ) / (m + 1) ≤ value ds

theorem coalescence_value_lower [Nonempty ι]
    (E : Submodule ℚ (ι → ℚ)) (hfree : CoordinateFree (realSpan E))
    (hLRC : LonelyRunnerBound (Fintype.card ι - Module.finrank ℝ (realSpan E) + 1)) :
    (1 : ℝ) / ((Fintype.card ι - Module.finrank ℝ (realSpan E) + 1 : ℕ) + 1) ≤
      spaceValue (realSpan E) :=
  spaceValue_lower_of_runner_bound E hfree _ _ hLRC le_rfl

end

end Loneliness.CoordinateSubspace
