import Conjectures.FerroniHigashitaniBasis
import Conjectures.FerroniHigashitaniIDP
import Conjectures.FerroniHigashitaniPolytope

/-! The first-three interior Ehrhart counterexample in the usual integral
coordinate lattice. Every count is the cardinality of actual lattice points
in the topological interior of a dilation of one real lattice polytope. -/

open Finset
open scoped Pointwise

namespace FerroniHigashitani

noncomputable def witness (m : ℕ) : Set (Space m) := toBasis m '' closedSlice 2

def InteriorLatticePoints {m : ℕ} (P : Set (Space m)) (k : ℕ) :=
  {v : Space m // v ∈ interior ((k : ℝ) • P) ∧ v ∈ standardLattice m}

theorem witness_latticePolytope (m : ℕ) :
    ∃ S : Set (Space m), S.Finite ∧ S ⊆ standardLattice m ∧ witness m = convexHull ℝ S := by
  obtain ⟨S, hS, hl, he⟩ := twoSlice_latticePolytope m
  refine ⟨toBasis m '' S, hS.image _, ?_, ?_⟩
  · rintro _ ⟨v, hv, rfl⟩
    exact (mem_standardLattice_toBasis_iff v).mpr (hl hv)
  · change toBasis m '' closedSlice 2 = convexHull ℝ (toBasis m '' S)
    rw [he]
    exact (toBasis m).toLinearMap.image_convexHull S

theorem witness_dilate (m k : ℕ) (hk : 0 < k) :
    (k : ℝ) • witness m = toBasis m '' closedSlice (((k * 2 : ℕ) : ℝ)) := by
  rw [← twoSlice_dilate m k hk]
  ext v
  constructor
  · rintro ⟨_, ⟨z, hz, rfl⟩, rfl⟩
    exact ⟨(k : ℝ) • z, ⟨z, hz, rfl⟩, (toBasis m).map_smul _ _⟩
  · rintro ⟨_, ⟨z, hz, rfl⟩, rfl⟩
    exact ⟨toBasis m z, ⟨z, hz, rfl⟩, ((toBasis m).map_smul _ _).symm⟩

theorem witness_idp (m k : ℕ) (hk : 0 < k) {v : Space m}
    (hv : v ∈ (k : ℝ) • witness m) (hl : v ∈ standardLattice m) :
    ∃ f : Fin k → Space m, (∀ i, f i ∈ witness m ∧ f i ∈ standardLattice m) ∧ ∑ i, f i = v := by
  rw [witness_dilate m k hk] at hv
  obtain ⟨w, hw, rfl⟩ := hv
  rw [← twoSlice_dilate m k hk] at hw
  obtain ⟨f, hf, hsum⟩ := refined_idp_twoSlice k hk hw ((mem_standardLattice_toBasis_iff w).mp hl)
  refine ⟨fun i => toBasis m (f i), fun i => ⟨⟨f i, (hf i).1, rfl⟩,
    (mem_standardLattice_toBasis_iff _).mpr (hf i).2⟩, ?_⟩
  simpa only [map_sum] using congrArg (toBasis m) hsum

private noncomputable def interiorBasisEquiv (m k : ℕ) (hk : 0 < k) :
    {v : Space m // v ∈ interior (closedSlice (((k * 2 : ℕ) : ℝ))) ∧ v ∈ refinedLattice m} ≃
      InteriorLatticePoints (witness m) k := by
  let e := toBasis m
  let h := e.toContinuousLinearEquiv.toHomeomorph
  apply e.toEquiv.subtypeEquiv
  intro v
  have hp : h ⁻¹' ((k : ℝ) • witness m) = closedSlice (((k * 2 : ℕ) : ℝ)) := by
    rw [witness_dilate m k hk]
    exact Set.preimage_image_eq _ e.injective
  have hi : e v ∈ interior ((k : ℝ) • witness m) ↔
      v ∈ interior (closedSlice (((k * 2 : ℕ) : ℝ))) := by
    change v ∈ h ⁻¹' interior ((k : ℝ) • witness m) ↔ _
    rw [h.preimage_interior, hp]
  exact and_congr hi.symm (mem_standardLattice_toBasis_iff v).symm

theorem finite_witnessInterior (m k : ℕ) (hk : 0 < k) (hk3 : k ≤ 3) :
    Finite (InteriorLatticePoints (witness m) k) := by
  have := finite_refinedInterior m (k * 2) (by omega) (by omega)
  exact Finite.of_equiv _ (interiorBasisEquiv m k hk)

theorem card_witnessInterior (m k : ℕ) (hk : 0 < k) (hk3 : k ≤ 3) :
    Nat.card (InteriorLatticePoints (witness m) k) = prefixCount m (k * 2 - 1) :=
  (Nat.card_congr (interiorBasisEquiv m k hk).symm).trans
    (card_refinedInterior m (k * 2) (by omega) (by omega))

/-- The first three interior lattice-point counts fail log-concavity for
the written proof's dimension-170 IDP lattice polytope. -/
theorem first_three_interior_ehrhart_counterexample :
    ∃ P : Set (Space 11),
      (∃ S : Set (Space 11), S.Finite ∧ S ⊆ standardLattice 11 ∧ P = convexHull ℝ S) ∧
      (∀ k : ℕ, 0 < k → ∀ v ∈ (k : ℝ) • P, v ∈ standardLattice 11 →
        ∃ f : Fin k → Space 11, (∀ i, f i ∈ P ∧ f i ∈ standardLattice 11) ∧ ∑ i, f i = v) ∧
      (∀ k : ℕ, 0 < k → k ≤ 3 → Finite (InteriorLatticePoints P k)) ∧
      Nat.card (InteriorLatticePoints P 2) ^ 2 <
        Nat.card (InteriorLatticePoints P 1) * Nat.card (InteriorLatticePoints P 3) := by
  refine ⟨witness 11, witness_latticePolytope 11, ?_, finite_witnessInterior 11, ?_⟩
  · intro k hk _ hv hl
    exact witness_idp 11 k hk hv hl
  · rw [card_witnessInterior 11 1 (by decide) (by decide),
      card_witnessInterior 11 2 (by decide) (by decide),
      card_witnessInterior 11 3 (by decide) (by decide)]
    norm_num only [Nat.reduceMul, Nat.reduceSub]
    exact exact_prefix_violation

end FerroniHigashitani
