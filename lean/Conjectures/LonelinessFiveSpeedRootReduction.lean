import Conjectures.LonelinessFiveSpeedFiniteAssembly
import Conjectures.LonelinessFiveSpeedRelationReduction
import Conjectures.LonelinessFiveSpeedRootIntegerLift

/-! Converting the integer root outcome into the canonical nine-map
representation. The concrete modular root covers remain explicit inputs. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix

theorem integerRootOutcome_to_canonical (v : Fin 5 → ℕ) (C : ℕ)
    (hpositive : ∀ i, 0 < v i) (hinjective : Function.Injective v)
    (hbound : ∀ i, v i ≤ C) (houtcome : FiveSpeedRoot.IntegerRootOutcome v) :
    ∃ k : Fin 9, ∃ u : ThreeIntegerVector,
      CanonicalRepresentation (fun i => (v i : ℤ)) C k u := by
  have hnonzero : ∀ i, (v i : ℤ) ≠ 0 := by
    intro i
    exact_mod_cast (ne_of_gt (hpositive i))
  have habs : ∀ i, |(v i : ℤ)| = (v i : ℤ) := by
    intro i
    exact abs_of_nonneg (by omega)
  have hdistinct : ∀ i j, i ≠ j → |(v i : ℤ)| ≠ |(v j : ℤ)| := by
    intro i j hij heq
    apply hij
    apply hinjective
    rw [habs, habs] at heq
    exact_mod_cast heq
  have hnatabs : Function.Injective (fun i => (v i : ℤ).natAbs) := by
    simpa only [Int.natAbs_natCast] using hinjective
  have habound : ∀ i, |(v i : ℤ)| ≤ (C : ℤ) := by
    intro i
    rw [habs]
    exact_mod_cast hbound i
  rcases houtcome with ⟨a, b, hab, ha, hb⟩ | ⟨π, h134⟩
  · exact relationImage_to_canonical (fun i => (v i : ℤ)) C
      (two_relations_to_nine_maps a b hab (fun i => (v i : ℤ))
        ha hb hnonzero hdistinct C habound) hnonzero hnatabs
  · have hpermdistinct : ∀ i j, i ≠ j → |(v (π i) : ℤ)| ≠ |(v (π j) : ℤ)| := by
      intro i j hij
      exact hdistinct (π i) (π j) (fun heq => hij (π.injective heq))
    have hperminjective : Function.Injective (fun i => (v (π i) : ℤ).natAbs) :=
      hnatabs.comp π.injective
    obtain ⟨k, u, hrepresentation⟩ := relationImage_to_canonical
      (fun i => (v (π i) : ℤ)) C
      (special134_to_nine_maps (fun i => (v (π i) : ℤ)) h134
        (fun i => hnonzero (π i)) hpermdistinct C (fun i => habound (π i)))
      (fun i => hnonzero (π i)) hperminjective
    exact ⟨k, u, canonicalRepresentation_of_abs_reindex
      (fun i => (v i : ℤ)) (fun i => (v (π i) : ℤ)) π (fun _ => rfl)
      C k u hrepresentation⟩

theorem bounded_root_reduction_of_covers (ps : Finset ℕ)
    (hprime : ∀ p ∈ ps, p.Prime) (hlarge : ∀ p ∈ ps, 7 < p)
    (hcovers : ∀ p ∈ ps, FiveSpeedRoot.GlobalRootCover p)
    (hproduct : (4 * 279841) ^ 111 < ∏ p ∈ ps, p) : BoundedRootReduction := by
  intro v hpositive hinjective hbound hbelow
  exact integerRootOutcome_to_canonical v 279841 hpositive hinjective hbound
    (FiveSpeedRoot.root_integer_relation_lift v 279841 hpositive hinjective hbound
      hbelow ps hprime hlarge hcovers hproduct)

end Loneliness.FiveSpeedCertificate
