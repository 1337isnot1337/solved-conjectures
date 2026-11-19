import Conjectures.HadamardAutomorphismCyclotomicQuadratic
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.RingTheory.IntegralDomain

/-! Uniqueness and generator identification of the quadratic subfield. -/

noncomputable section

namespace HadamardAutomorphism

variable (K : Type*) [Field K] [NumberField K]
  [IsCyclotomicExtension {479} ℚ K]

local instance quadraticUnique479_prime : Fact (Nat.Prime 479) := ⟨prime_479⟩

theorem quadraticFixedField479_unique (L : IntermediateField ℚ K)
    (hL : Module.finrank ℚ L = 2) : L = quadraticFixedField479 K := by
  let : IsGalois ℚ K := IsCyclotomicExtension.isGalois {479} ℚ K
  let : IsCyclic (K ≃ₐ[ℚ] K) :=
    (IsCyclotomicExtension.Rat.galEquivZMod 479 K).isCyclic.mpr inferInstance
  have hsub : L.fixingSubgroup = (quadraticFixedField479 K).fixingSubgroup := by
    apply IsCyclic.subgroup_eq_iff_index_eq.mpr
    rw [← IntermediateField.finrank_eq_fixingSubgroup_index L,
      ← IntermediateField.finrank_eq_fixingSubgroup_index (quadraticFixedField479 K),
      hL, quadraticFixedField479_degree K]
  have h := congrArg
    (fun H : Subgroup (K ≃ₐ[ℚ] K) => IntermediateField.fixedField H) hsub
  simpa only [IsGalois.fixedField_fixingSubgroup] using h

theorem quadraticFixedField479_eq_adjoin_generator :
    quadraticFixedField479 K =
      IntermediateField.adjoin ℚ {quadraticGenerator479 K} := by
  let S := IntermediateField.adjoin ℚ {quadraticGenerator479 K}
  have hrat (q : ℚ) : (q : K) ∈ S := by
    simpa only [eq_ratCast] using S.algebraMap_mem q
  apply le_antisymm
  · intro x hx
    obtain ⟨a, b, rfl⟩ := quadraticFixedField479_coordinates K x hx
    exact S.add_mem (hrat a) (S.mul_mem (hrat b)
      (IntermediateField.mem_adjoin_simple_self ℚ (quadraticGenerator479 K)))
  · rw [IntermediateField.adjoin_le_iff, Set.singleton_subset_iff, SetLike.mem_coe]
    exact (mem_quadraticFixedField479 K _).mpr (quadraticGenerator479_fixed K)

end HadamardAutomorphism
