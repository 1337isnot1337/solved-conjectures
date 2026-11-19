import Conjectures.LonelinessFiveSpeedLineReductionSoundness
import Conjectures.LonelinessFiveSpeedLineReductionCertificate

/-! Complete reduction of every listed parameter relation to a primitive
integer direction in one of the 164 retained maps. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix
open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

theorem boundedMapL_pos (m : Fin 164) : 0 < boundedMapL m :=
  (lineMapFactsCheck_sound (boundedMaps m) (boundedMapL m) (boundedMapFactsPayloads m)
    (boundedMapFacts_checked m)).1

theorem boundedMapL_le_seventeen (m : Fin 164) : boundedMapL m ≤ 17 :=
  (lineMapFactsCheck_sound (boundedMaps m) (boundedMapL m) (boundedMapFactsPayloads m)
    (boundedMapFacts_checked m)).2.1

theorem boundedMap_row_bound (m : Fin 164) (i : Fin 5) :
    (boundedMaps m i 0).natAbs + (boundedMaps m i 1).natAbs ≤ boundedMapL m :=
  (lineMapFactsCheck_sound (boundedMaps m) (boundedMapL m) (boundedMapFactsPayloads m)
    (boundedMapFacts_checked m)).2.2.1 i

theorem boundedMapL_attained (m : Fin 164) :
    ∃ i : Fin 5, (boundedMaps m i 0).natAbs + (boundedMaps m i 1).natAbs = boundedMapL m :=
  ⟨(boundedMapFactsPayloads m).maxRow,
    (lineMapFactsCheck_sound (boundedMaps m) (boundedMapL m) (boundedMapFactsPayloads m)
      (boundedMapFacts_checked m)).2.2.2.1⟩

theorem boundedMap_axis_rows (m : Fin 164) :
    ∃ i j : Fin 5,
      boundedMaps m i 1 = 0 ∧ boundedMaps m i 0 ≠ 0 ∧
      boundedMaps m j 0 = 0 ∧ boundedMaps m j 1 ≠ 0 := by
  have h := lineMapFactsCheck_sound (boundedMaps m) (boundedMapL m)
    (boundedMapFactsPayloads m) (boundedMapFacts_checked m)
  exact ⟨(boundedMapFactsPayloads m).xRow, (boundedMapFactsPayloads m).yRow, h.2.2.2.2⟩

theorem boundedMap_first_parameter_ne_zero (m : Fin 164) (w : Fin 2 → ℤ)
    (hnonzero : ∀ i, (boundedMaps m *ᵥ w) i ≠ 0) : w 0 ≠ 0 := by
  obtain ⟨i, j, hi1, hi0, hj0, hj1⟩ := boundedMap_axis_rows m
  intro hw
  apply hnonzero i
  change (∑ k : Fin 2, boundedMaps m i k * w k) = 0
  simp [Fin.sum_univ_two, hi1, hw]

theorem line_orientation_cross_scale (B : Matrix (Fin 5) (Fin 2) ℤ)
    (w : Fin 2 → ℤ) (v : FiveIntegerVector) (g : ℕ) (b : ℤ)
    (hscale : (g : ℤ) • (B *ᵥ w) = b • v) :
    (g : ℤ) • (B *ᵥ positiveFirstPair w) = (positiveFirstSign w * b) • v := by
  rw [positiveFirstPair, Matrix.mulVec_smul]
  ext i
  have hi := congrFun hscale i
  change (g : ℤ) * (B *ᵥ w) i = b * v i at hi
  change (g : ℤ) * (positiveFirstSign w * (B *ᵥ w) i) =
    (positiveFirstSign w * b) * v i
  calc
    _ = positiveFirstSign w * ((g : ℤ) * (B *ᵥ w) i) := by ring
    _ = positiveFirstSign w * (b * v i) := congrArg (fun z => positiveFirstSign w * z) hi
    _ = _ := by ring

structure LineRepresentation (v : FiveIntegerVector) (m : Fin 164) (w : Fin 2 → ℤ) : Prop where
  first_pos : 0 < w 0
  primitive : Nat.gcd (w 0).natAbs (w 1).natAbs = 1
  nonzero : ∀ i, (boundedMaps m *ᵥ w) i ≠ 0
  distinct : Function.Injective (fun i => ((boundedMaps m *ᵥ w) i).natAbs)
  direction_eq : Modular.primitiveDirection (boundedMaps m *ᵥ w) = Modular.primitiveDirection v
  value_eq : value (integerSpeeds (boundedMaps m *ᵥ w)) = value (integerSpeeds v)
  critical_iff : ContainsCriticalQuadruple (integerSpeeds (boundedMaps m *ᵥ w)) ↔
    ContainsCriticalQuadruple (integerSpeeds v)
  cross_scale : ∃ g : ℕ, 0 < g ∧ ∃ b : ℤ, b ≠ 0 ∧
    (g : ℤ) • (boundedMaps m *ᵥ w) = b • v

/-- The table covers every one of the 200 listed forms, and the resulting
primitive direction retains the literal sorted normalized tuple. -/
theorem parameter_form_to_bounded_map (k : Fin 9) (h : ThreeIntegerVector)
    (hmem : h ∈ planeParameterForms k) (u : ThreeIntegerVector)
    (hrelation : h ⬝ᵥ u = 0)
    (hnonzero : ∀ i, (canonicalMaps k *ᵥ u) i ≠ 0)
    (hdistinct : Function.Injective (fun i => ((canonicalMaps k *ᵥ u) i).natAbs))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (canonicalMaps k *ᵥ u))) :
    ∃ m : Fin 164, ∃ w : Fin 2 → ℤ, LineRepresentation (canonicalMaps k *ᵥ u) m w := by
  obtain ⟨certificate, _, hcheck⟩ := every_parameter_form_checked k h hmem
  have hpivot := (lineCaseCheck_conditions boundedMaps (canonicalMaps k) h certificate hcheck).1
  obtain ⟨m, g, hg, w, hw, hscale, hwne⟩ :=
    lineCaseCheck_primitive_image boundedMaps (canonicalMaps k) h certificate hcheck
      u hrelation hnonzero hdistinct hnot
  have hw0 := boundedMap_first_parameter_ne_zero m w hwne
  have hsign : positiveFirstSign w ≠ 0 := by
    rcases positiveFirstSign_cases w with hsign | hsign <;> simp [hsign]
  let w' := positiveFirstPair w
  let b := positiveFirstSign w * h certificate.pivot
  have hb : b ≠ 0 := mul_ne_zero hsign hpivot
  have hscale' : (g : ℤ) • (boundedMaps m *ᵥ w') = b • (canonicalMaps k *ᵥ u) :=
    line_orientation_cross_scale (boundedMaps m) w (canonicalMaps k *ᵥ u)
      g (h certificate.pivot) hscale
  refine ⟨m, w', ?_⟩
  exact {
    first_pos := positiveFirstPair_pos w hw0
    primitive := by simpa only [w', positiveFirstPair_gcd] using hw
    nonzero := line_cross_scale_nonzero _ _ g b hb hscale' hnonzero
    distinct := line_cross_scale_distinct _ _ g b hb hscale' hdistinct
    direction_eq := line_cross_scale_primitiveDirection _ _ g hg b hb hscale'
    value_eq := line_cross_scale_value _ _ g hg b hb hscale'
    critical_iff := line_cross_scale_critical_iff _ _ g hg b hb hscale'
    cross_scale := ⟨g, hg, b, hb, hscale'⟩ }

end Loneliness.FiveSpeedCertificate
