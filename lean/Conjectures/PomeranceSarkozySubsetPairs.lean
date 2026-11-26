module
public import Conjectures.PomeranceSarkozyAtomLaw
public import Mathlib.Data.Fintype.Sigma

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical
variable {A : Type*} [DecidableEq A]

abbrev DisjointExtensionPair (I : Finset A) :=
  Σ S : ↥I.powerset,↥(I\S.val).powerset

abbrev NestedSubsetPair (I : Finset A) :=
  Σ T : ↥I.powerset,↥T.val.powerset

/-- An extension pair (S,U) with disjoint U is exactly an outer
subset T=S∪U together with an inner subset S. -/
def disjointExtensionEquiv (I : Finset A) : DisjointExtensionPair I ≃ NestedSubsetPair I where
  toFun q := by
    rcases q with ⟨S,U⟩
    have hS := Finset.mem_powerset.mp S.property
    have hU := (Finset.subset_sdiff.mp (Finset.mem_powerset.mp U.property)).1
    exact ⟨⟨S.val∪U.val,Finset.mem_powerset.mpr (Finset.union_subset hS hU)⟩,
      ⟨S.val,Finset.mem_powerset.mpr Finset.subset_union_left⟩⟩
  invFun q := by
    rcases q with ⟨T,S⟩
    have hT := Finset.mem_powerset.mp T.property
    have hS := Finset.mem_powerset.mp S.property
    exact ⟨⟨S.val,Finset.mem_powerset.mpr (hS.trans hT)⟩,
      ⟨T.val\S.val,Finset.mem_powerset.mpr (by
        intro x hx
        have hh := Finset.mem_sdiff.mp hx
        exact Finset.mem_sdiff.mpr ⟨hT hh.1,hh.2⟩)⟩⟩
  left_inv q := by
    rcases q with ⟨S,U⟩
    have hd := (Finset.subset_sdiff.mp (Finset.mem_powerset.mp U.property)).2
    have h : (S.val∪U.val)\S.val=U.val := by
      ext x
      simp only [Finset.mem_sdiff,Finset.mem_union]
      constructor
      · intro hx
        exact hx.1.resolve_left hx.2
      · intro hx
        exact ⟨Or.inr hx,fun hy => (Finset.disjoint_left.mp hd) hx hy⟩
    let V : ↥(I\S.val).powerset := ⟨(S.val∪U.val)\S.val,by rw [h]; exact U.property⟩
    change (⟨S,V⟩ : DisjointExtensionPair I) = ⟨S,U⟩
    exact congrArg (Sigma.mk S) (Subtype.ext h)
  right_inv q := by
    rcases q with ⟨T,S⟩
    have hS := Finset.mem_powerset.mp S.property
    have h : S.val∪(T.val\S.val)=T.val := by rw [Finset.union_comm,Finset.sdiff_union_of_subset hS]
    let V : ↥I.powerset := ⟨S.val∪(T.val\S.val),by rw [h]; exact T.property⟩
    let W : ↥V.val.powerset := ⟨S.val,Finset.mem_powerset.mpr Finset.subset_union_left⟩
    change (⟨V,W⟩ : NestedSubsetPair I) = ⟨T,S⟩
    refine Sigma.ext (Subtype.ext h) ?_
    apply (Subtype.heq_iff_coe_eq (by
      intro x
      change x ∈ (S.val ∪ (T.val \ S.val)).powerset ↔ x ∈ T.val.powerset
      rw [h])).mpr
    rfl


/-- Sum reindexing behind the (2^{|T|}) count of extensions in the
finite total-variation proof. -/
theorem sum_disjointExtensions (I : Finset A) (w : Finset A→Finset A→ℚ) :
    (∑ S ∈ I.powerset,∑ U ∈ (I\S).powerset,w (S∪U) S) =
      ∑ T ∈ I.powerset,∑ S ∈ T.powerset,w T S := by
  have h := Fintype.sum_equiv (disjointExtensionEquiv I)
    (fun q : DisjointExtensionPair I => w (q.1.val∪q.2.val) q.1.val)
    (fun q : NestedSubsetPair I => w q.1.val q.2.val) (by intro q; rcases q; rfl)
  rw [Fintype.sum_sigma,Fintype.sum_sigma] at h
  calc
    _ = ∑ S : ↥I.powerset,∑ U : ↥(I\S.val).powerset,w (S.val∪U.val) S.val := by
      rw [← Finset.sum_coe_sort I.powerset]
      apply Fintype.sum_congr
      intro S
      exact (Finset.sum_coe_sort (I\S.val).powerset (fun U => w (S.val∪U) S.val)).symm
    _ = ∑ T : ↥I.powerset,∑ S : ↥T.val.powerset,w T.val S.val := h
    _ = _ := by
      rw [← Finset.sum_coe_sort I.powerset]
      apply Fintype.sum_congr
      intro T
      exact Finset.sum_coe_sort T.val.powerset (w T.val)

end PomeranceSarkozy
