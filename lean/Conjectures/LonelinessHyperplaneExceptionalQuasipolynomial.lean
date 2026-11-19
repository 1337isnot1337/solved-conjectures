import Conjectures.LonelinessHyperplaneSystemUnions
import Conjectures.LonelinessHyperplaneSubspaceClassification
import Conjectures.LonelinessHyperplaneProbability

/-!
# Exact quasipolynomials for the actual subthreshold numerator

The finite rational-subspace classification identifies the original event
with a finite union of actual integer equation systems. Exact positive-box
counting supplies the quasipolynomial. The proved subthreshold count bound
lowers its degree to k−2 without changing any positive-N value.
-/

namespace Loneliness.Hyperplane

open scoped BigOperators
open Polynomial QuasipolynomialArithmetic RationalCone

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι] [Nonempty ι]

theorem positiveBoxBelow_eq_finite_system_union
    (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ) (u : ℝ)
    (hu : u < predictedValue m s) :
    ∃ C : Finset (Finset (ι → ℤ)), ∀ N : ℕ,
      positiveBoxBelow m s u N = positiveSystemUnion ({m} : Set (ι → ℤ)) C N := by
  classical
  obtain ⟨C, _, hC⟩ := RealSubspace.hyperplane_closed_sublevel_finite_union m hm s u hu
  refine ⟨C, ?_⟩
  intro N
  ext v
  constructor
  · intro hv
    obtain ⟨hvA, hbelow⟩ := Finset.mem_filter.mp hv
    obtain ⟨_, hkernel, hinj⟩ := Finset.mem_filter.mp hvA
    obtain ⟨S, hS, hrelations⟩ := (hC (positiveBoxCoordinates v) hkernel).mp hbelow
    apply Finset.mem_biUnion.mpr
    refine ⟨S, hS, (mem_positiveSystemBox_iff _ _ _).mpr ⟨?_, hinj⟩⟩
    intro n hn
    rcases hn with hn | hn
    · have hnm : n = m := Set.mem_singleton_iff.mp hn
      simpa only [hnm] using hkernel
    · exact hrelations n hn
  · intro hv
    obtain ⟨S, hS, hvS⟩ := Finset.mem_biUnion.mp hv
    obtain ⟨hrows, hinj⟩ := (mem_positiveSystemBox_iff _ _ _).mp hvS
    have hkernel : integerPairing m (positiveBoxCoordinates v) = 0 :=
      hrows m (Or.inl (Set.mem_singleton m))
    have hbelow : shiftedVelocityValue (positiveBoxCoordinates v) s ≤ u :=
      (hC (positiveBoxCoordinates v) hkernel).mpr
        ⟨S, hS, fun n hn => hrows n (Or.inr hn)⟩
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_filter.mpr ⟨Finset.mem_univ _, hkernel, hinj⟩, hbelow⟩

/-- The literal numerator has exact quasipolynomial formulas at every N≥1,
with degree at most k−2 and no added counting or geometric premise. -/
theorem positiveBoxBelow_quasipolynomial_on_positive
    (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ) (u : ℝ)
    (hu : u < predictedValue m s) :
    ∃ q : ℕ → ℚ, IsQuasipolynomial q (Fintype.card ι - 2) ∧
      ∀ N : ℕ, 0 < N → q N = ((positiveBoxBelow m s u N).card : ℚ) := by
  obtain ⟨C, hC⟩ := positiveBoxBelow_eq_finite_system_union m hm s u hu
  obtain ⟨q, hq, heq⟩ :=
    positiveSystemUnion_quasipolynomial_on_positive ({m} : Set (ι → ℤ)) C
  have hcount : ∀ N : ℕ, 0 < N → q N = ((positiveBoxBelow m s u N).card : ℚ) := by
    intro N hN
    rw [hC N]
    exact heq N hN
  obtain ⟨R, hR⟩ := exists_subthreshold_count_bound m hm s u hu
  exact ⟨q, hq.degree_of_nat_count_bound (fun N => (positiveBoxBelow m s u N).card)
    hcount R (Fintype.card ι - 2) hR, hcount⟩

/-- Explicit residue-class polynomials for the original finite event. -/
theorem positiveBoxBelow_progression_polynomials
    (m : ι → ℤ) (hm : PrimitiveNormal m) (s : ι → ℝ) (u : ℝ)
    (hu : u < predictedValue m s) :
    ∃ M : ℕ, 0 < M ∧ ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 2) ∧
      ∀ (r : Fin M) (n : ℕ), 0 < M * n + r →
        ((positiveBoxBelow m s u (M * n + r)).card : ℚ) = (P r).eval (n : ℚ) := by
  obtain ⟨q, ⟨M, hM, P, hdegree, heval⟩, hq⟩ :=
    positiveBoxBelow_quasipolynomial_on_positive m hm s u hu
  refine ⟨M, hM, P, hdegree, ?_⟩
  intro r n hN
  exact (hq (M * n + r) hN).symm.trans (heval r n)

end

end Loneliness.Hyperplane
