import Conjectures.LonelinessFiveSpeedCanonicalImage
import Conjectures.LonelinessFiveSpeedClassificationCore
import Conjectures.LonelinessFiveSpeedLineReductionCutoff
import Conjectures.LonelinessFiveSpeedFamilyCutoff

/-! Exact interfaces for the three finite coverage stages and their
composition into the literal twelve-tuple exhaustion theorem. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix
open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

def BoundedRootReduction : Prop :=
  ∀ v : Fin 5 → ℕ, (∀ i, 0 < v i) → Function.Injective v →
    (∀ i, v i ≤ 279841) → value (List.ofFn v) < (1 / 5 : ℝ) →
    ∃ k : Fin 9, ∃ u : ThreeIntegerVector,
      CanonicalRepresentation (fun i => (v i : ℤ)) 279841 k u

def CanonicalPlaneCoverage : Prop :=
  ∀ k : Fin 9, ∀ u : ThreeIntegerVector, (∀ j, (u j).natAbs ≤ 279841) →
    value (integerSpeeds (canonicalMaps k *ᵥ u)) < (1 / 5 : ℝ) →
    (∀ i, (canonicalMaps k *ᵥ u) i ≠ 0) →
    ∃ h ∈ planeParameterForms k, h ⬝ᵥ u = 0

def BoundedMapCoverage : Prop :=
  ∀ m : Fin 164, ∀ w : Fin 2 → ℤ,
    0 < w 0 → Nat.gcd (w 0).natAbs (w 1).natAbs = 1 →
    (∀ j, (w j).natAbs ≤ 23 * boundedMapL m) →
    (∀ i, (boundedMaps m *ᵥ w) i ≠ 0) →
    Function.Injective (fun i => ((boundedMaps m *ᵥ w) i).natAbs) →
    ¬ContainsCriticalQuadruple (integerSpeeds (boundedMaps m *ᵥ w)) →
    value (integerSpeeds (boundedMaps m *ᵥ w)) < (1 / 5 : ℝ) →
    Modular.primitiveDirection (boundedMaps m *ᵥ w) ∈ candidateTuples

theorem sporadicExhaustion_of_coverage (hgap : CoordinateSubspace.FourSpeedGap)
    (hroot : BoundedRootReduction) (hplane : CanonicalPlaneCoverage)
    (hbounded : BoundedMapCoverage) : SporadicExhaustion := by
  intro ds hlen hdistinct hpositive hprimitive hordered hnot hbelow
  obtain ⟨v, hv⟩ := vector_of_list_length ds hlen
  have hvpositive : ∀ i, 0 < v i := by
    intro i
    apply hpositive
    rw [← hv]
    exact List.mem_ofFn.mpr ⟨i, rfl⟩
  have hvinjective : Function.Injective v :=
    List.nodup_ofFn.mp (by simpa only [hv] using hdistinct)
  have hvprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1 := by
    simpa only [hv] using hprimitive
  have hvbelow : value (List.ofFn v) < (1 / 5 : ℝ) := by
    simpa only [hv] using hbelow
  have hvnot : ¬ContainsCriticalQuadruple (List.ofFn v) := by
    simpa only [hv] using hnot
  have hvbound := Pigeonhole.five_speed_family_cutoff hgap v hvpositive
    hvprimitive hvbelow hvnot
  obtain ⟨k, u, hcanonical⟩ := hroot v hvpositive hvinjective hvbound hvbelow
  have hcastvalue : value (integerSpeeds (fun i => (v i : ℤ))) = value ds := by
    rw [integerSpeeds_value_eq_absoluteSpeeds]
    simp only [Modular.absoluteSpeeds, Int.natAbs_natCast, hv]
  have hcastcritical : ContainsCriticalQuadruple (integerSpeeds (fun i => (v i : ℤ))) ↔
      ContainsCriticalQuadruple ds := by
    simpa only [Modular.absoluteSpeeds, Int.natAbs_natCast, hv] using
      integerSpeeds_critical_iff_absoluteSpeeds (fun i => (v i : ℤ))
  have hcanonicalBelow : value (integerSpeeds (canonicalMaps k *ᵥ u)) < (1 / 5 : ℝ) := by
    rw [hcanonical.value_eq, hcastvalue]
    exact hbelow
  have hcanonicalNot : ¬ContainsCriticalQuadruple (integerSpeeds (canonicalMaps k *ᵥ u)) := by
    intro hcrit
    exact hnot (hcastcritical.mp (hcanonical.critical_iff.mp hcrit))
  obtain ⟨h, hh, hrelation⟩ := hplane k u hcanonical.parameters_bound
    hcanonicalBelow hcanonical.nonzero
  obtain ⟨m, w, hline, hwbound⟩ := parameter_form_to_bounded_parameters hgap k h hh u
    hrelation hcanonical.nonzero hcanonical.distinct hcanonicalBelow hcanonicalNot
  have hlineBelow : value (integerSpeeds (boundedMaps m *ᵥ w)) < (1 / 5 : ℝ) := by
    rw [hline.value_eq]
    exact hcanonicalBelow
  have hlineNot : ¬ContainsCriticalQuadruple (integerSpeeds (boundedMaps m *ᵥ w)) :=
    fun hcrit => hcanonicalNot (hline.critical_iff.mp hcrit)
  have hmember := hbounded m w hline.first_pos hline.primitive hwbound
    hline.nonzero hline.distinct hlineNot hlineBelow
  have hdirection : Modular.primitiveDirection (boundedMaps m *ᵥ w) =
      Modular.primitiveDirection (fun i => (v i : ℤ)) :=
    hline.direction_eq.trans hcanonical.direction_eq
  have hrecovered := primitiveDirection_recovery_of_eq v (boundedMaps m *ᵥ w)
    hvprimitive (by simpa only [hv] using hordered) hdirection
  rw [hrecovered, hv] at hmember
  exact candidateTuples_low ds hmember hbelow

end Loneliness.FiveSpeedCertificate
