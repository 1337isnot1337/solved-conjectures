import Conjectures.LonelinessFiveSpeedPrimitiveDirection
import Conjectures.LonelinessFiveSpeedRelationDefs
import Mathlib.Data.Fintype.EquivFin

/-! Converting the signed, permuted image delivered by a relation
certificate into the canonical image used by the plane certificates. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix
open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

structure CanonicalRepresentation (v : FiveIntegerVector) (C : ℕ)
    (k : Fin 9) (u : ThreeIntegerVector) : Prop where
  parameters_bound : ∀ j, (u j).natAbs ≤ C
  nonzero : ∀ i, (canonicalMaps k *ᵥ u) i ≠ 0
  distinct : Function.Injective (fun i => ((canonicalMaps k *ᵥ u) i).natAbs)
  direction_eq : Modular.primitiveDirection (canonicalMaps k *ᵥ u) =
    Modular.primitiveDirection v
  value_eq : value (integerSpeeds (canonicalMaps k *ᵥ u)) = value (integerSpeeds v)
  critical_iff : ContainsCriticalQuadruple (integerSpeeds (canonicalMaps k *ᵥ u)) ↔
    ContainsCriticalQuadruple (integerSpeeds v)

theorem canonicalRepresentation_of_abs_reindex (v w : FiveIntegerVector)
    (σ : Equiv.Perm (Fin 5)) (habs : ∀ i, (w i).natAbs = (v (σ i)).natAbs)
    (C : ℕ) (k : Fin 9) (u : ThreeIntegerVector)
    (hrepresentation : CanonicalRepresentation w C k u) :
    CanonicalRepresentation v C k u := {
  parameters_bound := hrepresentation.parameters_bound
  nonzero := hrepresentation.nonzero
  distinct := hrepresentation.distinct
  direction_eq := hrepresentation.direction_eq.trans
    (Modular.primitiveDirection_eq_of_abs_reindex v w σ habs)
  value_eq := hrepresentation.value_eq.trans (integerSpeeds_value_of_abs_reindex v w σ habs)
  critical_iff := hrepresentation.critical_iff.trans
    (integerSpeeds_critical_iff_of_abs_reindex v w σ habs) }

theorem transformedMap_mulVec (signed : SignedCanonicalMap) (u : ThreeIntegerVector)
    (i : Fin 5) :
    (transformedMap signed *ᵥ u) i =
      (if signed.negative i then (-1 : ℤ) else 1) *
        (canonicalMaps signed.index *ᵥ u) (signed.permutation i) := by
  change (∑ j : Fin 3,
    ((if signed.negative i then (-1 : ℤ) else 1) *
      canonicalMaps signed.index (signed.permutation i) j) * u j) = _
  simp only [Matrix.mulVec, dotProduct, Finset.mul_sum, mul_assoc]

theorem relationImage_to_canonical (v : FiveIntegerVector) (C : ℕ)
    (himage : RelationImage v (C : ℤ))
    (hnonzero : ∀ i, v i ≠ 0)
    (hdistinct : Function.Injective (fun i => (v i).natAbs)) :
    ∃ k : Fin 9, ∃ u : ThreeIntegerVector, CanonicalRepresentation v C k u := by
  obtain ⟨signed, u, hinjective, hscale, hbound⟩ := himage
  let σ : Equiv.Perm (Fin 5) :=
    Equiv.ofBijective signed.permutation
      ((Fintype.bijective_iff_injective_and_card _).mpr ⟨hinjective, rfl⟩)
  let ε : Fin 5 → ℤ := fun i => if signed.negative i then -1 else 1
  let z : FiveIntegerVector := canonicalMaps signed.index *ᵥ u
  have hε : ∀ i, (ε i).natAbs = 1 := by
    intro i
    dsimp only [ε]
    cases signed.negative i <;> decide
  have hcoord (i : Fin 5) : v i = ε i * z (σ i) := by
    calc
      _ = (transformedMap signed *ᵥ u) i := congrFun hscale.symm i
      _ = _ := transformedMap_mulVec signed u i
  have habs (i : Fin 5) : (v i).natAbs = (z (σ i)).natAbs := by
    rw [hcoord, Int.natAbs_mul, hε, one_mul]
  have hznonzero : ∀ i, z i ≠ 0 := by
    intro i hi
    apply hnonzero (σ.symm i)
    rw [hcoord, Equiv.apply_symm_apply, hi, mul_zero]
  have hzdistinct : Function.Injective (fun i => (z i).natAbs) := by
    intro i j hij
    apply σ.symm.injective
    apply hdistinct
    simpa only [habs, Equiv.apply_symm_apply] using hij
  have hv : v = fun i => ε i * z (σ i) := funext hcoord
  have hdirection : Modular.primitiveDirection z = Modular.primitiveDirection v := by
    rw [hv]
    exact (Modular.primitiveDirection_sign_perm z ε hε σ).symm
  refine ⟨signed.index, u, ?_⟩
  exact {
    parameters_bound := by
      intro j
      have hj : ((u j).natAbs : ℤ) ≤ (C : ℤ) := by
        simpa only [Int.natCast_natAbs] using hbound j
      exact_mod_cast hj
    nonzero := hznonzero
    distinct := hzdistinct
    direction_eq := hdirection
    value_eq := by
      calc
        _ = value (Modular.primitiveDirection z) :=
          (primitiveDirection_value (by decide) z hznonzero).symm
        _ = value (Modular.primitiveDirection v) := congrArg value hdirection
        _ = _ := primitiveDirection_value (by decide) v hnonzero
    critical_iff := by
      have h₁ := primitiveDirection_critical_iff (by decide : 0 < 5) z hznonzero
      have h₂ := primitiveDirection_critical_iff (by decide : 0 < 5) v hnonzero
      rw [hdirection] at h₁
      exact h₁.symm.trans h₂ }

end Loneliness.FiveSpeedCertificate
