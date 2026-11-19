import Conjectures.LonelinessHyperplaneSubgroupFourier
import Conjectures.LonelinessHyperplaneTorusValue
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas

/-! The compact torus closure associated with any real subspace. A
character is trivial on this closure exactly when its integer linear
form vanishes on the real subspace. Thus every nontrivial exceptional
character cuts out a proper subspace, with no lattice-basis hypothesis. -/

namespace Loneliness.Hyperplane.RealSubspace

open scoped BigOperators
open Loneliness.SubspaceDensity

noncomputable section

variable {ι : Type*} [Fintype ι]

def torusQuotient : (ι → ℝ) →+ UnitAddTorus ι where
  toFun x := fun i => (x i : UnitAddCircle)
  map_zero' := by ext i; simp
  map_add' := by intro x y; ext i; rfl

def torusGroup (E : Submodule ℝ (ι → ℝ)) : AddSubgroup (UnitAddTorus ι) :=
  (E.toAddSubgroup.map torusQuotient).topologicalClosure

theorem torusGroup_isClosed (E : Submodule ℝ (ι → ℝ)) :
    IsClosed (torusGroup E : Set (UnitAddTorus ι)) :=
  (E.toAddSubgroup.map torusQuotient).isClosed_topologicalClosure

instance torusGroup_compactSpace (E : Submodule ℝ (ι → ℝ)) : CompactSpace (torusGroup E) :=
  isCompact_iff_compactSpace.mp (torusGroup_isClosed E).isCompact

theorem torusQuotient_mem (E : Submodule ℝ (ι → ℝ)) {x : ι → ℝ} (hx : x ∈ E) :
    torusQuotient x ∈ torusGroup E := by
  apply (E.toAddSubgroup.map torusQuotient).le_topologicalClosure
  exact AddSubgroup.mem_map.mpr ⟨x, hx, rfl⟩

theorem trivialFrequency_iff
    (E : Submodule ℝ (ι → ℝ)) (n : ι → ℤ) :
    CompactSubgroup.TrivialFrequency (torusGroup E) n ↔
      ∀ x ∈ E, pairing n x = 0 := by
  constructor
  · intro h x hx
    by_contra hnx
    let w := (1 / (2 * pairing n x)) • x
    have hw : w ∈ E := E.smul_mem _ hx
    have hchar := h ⟨torusQuotient w, torusQuotient_mem E hw⟩
    rw [mFourier_eq_normalHom] at hchar
    change (AddCircle.toCircle (normalHom n (fun i => (w i : UnitAddCircle))) : ℂ) = 1 at hchar
    rw [normalHom_coe] at hchar
    have hpair : pairing n w = 1 / 2 := by
      dsimp only [w]
      rw [pairing_smul]
      field_simp [hnx] <;> ring
    rw [hpair] at hchar
    have hphase : ((1 / 2 : ℝ) : UnitAddCircle) = 0 := by
      apply AddCircle.injective_toCircle one_ne_zero
      apply Subtype.ext
      simpa only [AddCircle.toCircle_zero, Circle.coe_one] using hchar
    have hnorm := congrArg norm hphase
    rw [UnitAddCircle.norm_eq, norm_zero] at hnorm
    change distance (1 / 2 : ℝ) = 0 at hnorm
    have hhalf := distance_half_sub_of_abs_le_half (0 : ℝ) (by norm_num)
    norm_num only [sub_zero, abs_zero] at hhalf
    linarith
  · intro h
    have hmap : E.toAddSubgroup.map torusQuotient ≤ torusRelationGroup n := by
      intro y hy
      obtain ⟨x, hx, rfl⟩ := AddSubgroup.mem_map.mp hy
      rw [mem_torusRelationGroup]
      change normalHom n (fun i => (x i : UnitAddCircle)) = 0
      rw [normalHom_coe, h x hx, AddCircle.coe_zero]
    have hclosure : torusGroup E ≤ torusRelationGroup n :=
      (E.toAddSubgroup.map torusQuotient).topologicalClosure_minimal hmap
        (torusRelationGroup_isClosed n)
    intro x
    have hx : normalHom n (x : UnitAddTorus ι) = 0 := hclosure x.2
    rw [mFourier_eq_normalHom, hx, AddCircle.toCircle_zero, Circle.coe_one]

theorem nontrivialFrequency_iff_slice_lt
    (E : Submodule ℝ (ι → ℝ)) (n : ι → ℤ) :
    ¬ CompactSubgroup.TrivialFrequency (torusGroup E) n ↔ E ⊓ relationSpace n < E := by
  calc
    _ ↔ ¬ E ≤ relationSpace n := not_congr (trivialFrequency_iff E n)
    _ ↔ E ⊓ relationSpace n < E := inf_lt_left.symm

theorem nontrivialFrequency_finrank_lt
    (E : Submodule ℝ (ι → ℝ)) (n : ι → ℤ)
    (hn : ¬ CompactSubgroup.TrivialFrequency (torusGroup E) n) :
    Module.finrank ℝ ↥(E ⊓ relationSpace n) < Module.finrank ℝ E :=
  Submodule.finrank_lt_finrank_of_lt ((nontrivialFrequency_iff_slice_lt E n).mp hn)

theorem velocity_mem_torusGroup
    (E : Submodule ℝ (ι → ℝ)) (v : ι → ℤ) (hv : integerVector v ∈ E)
    (t : UnitAddCircle) : (fun i => v i • t) ∈ torusGroup E := by
  obtain ⟨r, _, rfl⟩ := exists_unitCircle_representative t
  have hx := torusQuotient_mem E (E.smul_mem r hv)
  change (fun i => ((r * (v i : ℝ) : ℝ) : UnitAddCircle)) ∈ torusGroup E at hx
  simpa only [coe_real_velocity] using hx

variable [Nonempty ι]

theorem velocity_value_le_spaceValue
    (E : Submodule ℝ (ι → ℝ)) (v : ι → ℤ) (hv : integerVector v ∈ E)
    (s : ι → ℝ) : shiftedVelocityValue v s ≤ shiftedSpaceValue E s := by
  apply shiftedVelocityValue_le
  intro t _
  exact point_le_shiftedSpaceValue s (E.smul_mem t hv)

theorem exists_point_above
    (E : Submodule ℝ (ι → ℝ)) (s : ι → ℝ) (u : ℝ)
    (hu : u < shiftedSpaceValue E s) :
    ∃ x ∈ E, u < pointClearance (s + x) := by
  by_contra h
  have hle : shiftedSpaceValue E s ≤ u := by
    apply shiftedSpaceValue_le
    intro x hx
    exact le_of_not_gt (fun hgt => h ⟨x, hx, hgt⟩)
  exact (not_le_of_gt hu) hle

end

end Loneliness.Hyperplane.RealSubspace
