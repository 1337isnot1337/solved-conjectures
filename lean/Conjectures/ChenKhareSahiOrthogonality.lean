import Conjectures.ChenKhareSahiOrthogonalityCore
import Conjectures.ChenKhareSahiOrthogonalityPolynomial
import Conjectures.ChenKhareSahiMixed
import Conjectures.ChenKhareSahiHallConvention

/-!
The counterexample uses standard Macdonald polynomials: the complete stable
Hall family in degree six, followed by literal specialization to three variables.
All eleven partitions occur before specialization. The finite-variable Hall
wording in source section 2.3 is a separate convention issue; the standard
interpretation agrees with the source's section 5 and the repository proof.
-/

namespace ChenKhareSahi.Orthogonality

set_option maxRecDepth 32768
set_option maxHeartbeats 12000000
set_option linter.unusedSimpArgs false

/-- The finite prefix test is equivalent to the source dominance condition over
all natural-number prefixes; every representative has total weight six. -/
theorem dominates_iff_all_prefixes (i j : Index) :
    dominates i j ↔ ∀ r : ℕ, ((parts j).take r).sum ≤ ((parts i).take r).sum := by
  constructor
  · intro h r
    by_cases hr : r < 7
    · exact h ⟨r, hr⟩
    · have hdata : ∀ k : Index, (parts k).length ≤ 6 ∧ (parts k).sum = 6 := by
        intro k
        fin_cases k <;> decide
      have hri : (parts i).length ≤ r := by
        have := (hdata i).1
        omega
      have hrj : (parts j).length ≤ r := by
        have := (hdata j).1
        omega
      simpa only [List.take_of_length_le hrj, List.take_of_length_le hri,
        (hdata j).2, (hdata i).2] using (le_refl (6 : ℕ))
  · intro h r
    exact h r.val

/-- Specialization of a degree-six symmetric function to three variables. -/
noncomputable def specializeThree (v : RealVector) (x y z : ℝ) : ℝ :=
  ∑ i : Index, v i * monomialSix i ![x,y,z,0,0,0]

theorem monomial_specialize (i : Index) (x y z : ℝ) :
    monomialSix i ![x,y,z,0,0,0] =
      if (parts i).length ≤ 3 then
        realMonomial (parts i)[0]! (parts i)[1]! (parts i)[2]! x y z
      else 0 := by
  fin_cases i <;>
    norm_num [monomialSix_eq_list, orbitListCertificate, parts, termSix,
      realMonomial, realM, orbit, Finset.sum_insert, Finset.sum_singleton] <;> ring

theorem specialize_macdonald420 : specializeThree (realMacdonald 8) = realP420 := by
  funext x y z
  simp only [specializeThree, monomial_specialize]
  norm_num [realMacdonald, realMatrix, macdonald, parts, Fin.sum_univ_succ, realP420]
  ring

theorem specialize_macdonald411 : specializeThree (realMacdonald 7) = realP411 := by
  funext x y z
  simp only [specializeThree, monomial_specialize]
  norm_num [realMacdonald, realMatrix, macdonald, parts, Fin.sum_univ_succ, realP411]
  ring

/-- The stable Hall-orthogonal, monic triangular degree-six family specializes
to the two three-variable polynomials in the separation certificate. -/
theorem stable_hall_specialization (F : Index → RealVector) (hF : IsSourceFamily F) :
    specializeThree (F 8) = realP420 ∧ specializeThree (F 7) = realP411 := by
  rw [source_family_unique F hF]
  exact ⟨specialize_macdonald420, specialize_macdonald411⟩

theorem stable_hall_normalization_positive (F : Index → RealVector) (hF : IsSourceFamily F) :
    0 < specializeThree (F 8) 1 1 1 ∧ 0 < specializeThree (F 7) 1 1 1 := by
  obtain ⟨h420, h411⟩ := stable_hall_specialization F hF
  rw [h420, h411]
  constructor
  · norm_num [realP420, realMonomial, realM, orbit,
      Finset.sum_insert, Finset.sum_singleton]
  · norm_num [realP411, realMonomial, realM, orbit,
      Finset.sum_insert, Finset.sum_singleton]

/-- The standard Macdonald interpretation of source Conjecture 5 fails at this
admissible point. Identification uses the complete stable Hall family before
literal three-variable specialization. -/
theorem standard_macdonald_counterexample (F : Index → RealVector) (hF : IsSourceFamily F) :
    (0 : ℝ) < 1/10 ∧ (1/10 : ℝ) < 1 ∧
    (0 : ℝ) < 9/10 ∧ (9/10 : ℝ) < 1 ∧
    ChenKhareSahi.dominates (4,2,0) (4,1,1) ∧
    ¬ FullSemiring (fun x y z =>
      specializeThree (F 8) x y z / specializeThree (F 8) 1 1 1 -
      specializeThree (F 7) x y z / specializeThree (F 7) 1 1 1) := by
  obtain ⟨h420, h411⟩ := stable_hall_specialization F hF
  rw [h420, h411]
  exact ⟨by norm_num, by norm_num, by norm_num, by norm_num,
    by decide, FullSemiring.excludes_counterexample⟩

/-- An unconditional standard Macdonald witness, including existence and
uniqueness of the complete stable Hall-orthogonal degree-six family. The statement also records
exhaustiveness of the partition list, injectivity of literal polynomial coordinates,
the actual power-sum expansion, the source diagonal Hall pairing, and positive
normalization denominators. These facts connect the numeric certificates to the
source definitions in this endpoint's dependencies. -/
theorem stable_hall_counterexample_witness :
    Function.Bijective partition ∧
    (∀ i : Index, (parts i).Pairwise (fun a b => b ≤ a)) ∧
    (∀ i j : Index, dominates i j ↔
      ∀ r : ℕ, ((parts j).take r).sum ≤ ((parts i).take r).sum) ∧
    Function.Injective (fun v : RealVector => fun x : Fin 6 → ℝ =>
      ∑ i : Index, v i * monomialSix i x) ∧
    (∀ i : Index, ∀ x : Fin 6 → ℝ,
      powerSix i x = ∑ j : Index, (powerTransition i j : ℝ) * monomialSix j x) ∧
    (∀ v : RealVector, ∀ x : Fin 6 → ℝ,
      (∑ i : Index, v i * monomialSix i x) =
        ∑ i : Index, powerCoordinates v i * powerSix i x) ∧
    (∀ v w : RealVector,
      hall v w = ∑ k : Index,
        powerCoordinates v k * (hallWeight k : ℝ) * powerCoordinates w k) ∧
    (∀ i j : Index,
      hall (realMatrix powerTransition i) (realMatrix powerTransition j) =
        if i = j then (hallWeight i : ℝ) else 0) ∧
    (∃! F : Index → RealVector, IsSourceFamily F) ∧
    IsSourceFamily realMacdonald ∧
    (0 < specializeThree (realMacdonald 8) 1 1 1 ∧
      0 < specializeThree (realMacdonald 7) 1 1 1) ∧
    ¬ FullSemiring (fun x y z =>
      specializeThree (realMacdonald 8) x y z / specializeThree (realMacdonald 8) 1 1 1 -
      specializeThree (realMacdonald 7) x y z / specializeThree (realMacdonald 7) 1 1 1) := by
  refine ⟨partition_complete, parts_sorted, dominates_iff_all_prefixes,
    literal_polynomial_injective, power_expansion,
    power_coordinates_polynomial, hall_power_coordinates, hall_power_basis,
    source_family_exists_unique, macdonald_source_family,
    stable_hall_normalization_positive realMacdonald macdonald_source_family, ?_⟩
  exact (standard_macdonald_counterexample realMacdonald macdonald_source_family).2.2.2.2.2

/- Materialize the defining equations in their owning module.
Sibling modules must import these checked equations, rather than create them independently. -/
open Lean Elab Command in
run_cmd do
  liftTermElabM do
    for name in #[
      ``ChenKhareSahi.Orthogonality.specializeThree] do
      discard <| Lean.Meta.getEqnsFor? name

end ChenKhareSahi.Orthogonality
