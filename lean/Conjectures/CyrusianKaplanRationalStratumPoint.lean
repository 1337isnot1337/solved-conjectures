module
public import Conjectures.CyrusianKaplanRationalSignPolytope
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open Set

def RationalTuple {r : ℕ} (z : TupleSpace r) : Prop :=
  ∃ a b : Fin r → ℚ,(fun i => (a i:ℝ),fun i => (b i:ℝ))=z

theorem rationalTuple_midpoint {r : ℕ} {x y : TupleSpace r}
    (hx : RationalTuple x) (hy : RationalTuple y) :
    RationalTuple (AffineMap.lineMap x y (1/2:ℝ)) := by
  obtain ⟨a,b,rfl⟩ := hx
  obtain ⟨c,d,rfl⟩ := hy
  refine ⟨fun i => (a i+c i)/2,fun i => (b i+d i)/2,Prod.ext ?_ ?_⟩
  · funext i
    rw [AffineMap.lineMap_apply_module]
    change (((a i+c i)/2:ℚ):ℝ) =
      (1-1/2:ℝ)*(a i:ℝ)+(1/2:ℝ)*(c i:ℝ)
    push_cast
    ring
  · funext i
    rw [AffineMap.lineMap_apply_module]
    change (((b i+d i)/2:ℚ):ℝ) =
      (1-1/2:ℝ)*(b i:ℝ)+(1/2:ℝ)*(d i:ℝ)
    push_cast
    ring

/-- Finitely many distinct strict rows can share one rational
witness. A midpoint of rational witnesses preserves any strict
row satisfied at either endpoint and weakly satisfied at the other. -/
theorem finite_negative_rows_joint_rational_witness {ι : Type*} [Finite ι] {r : ℕ}
    (W : Set (TupleSpace r)) (hW : Convex ℝ W)
    (f : ι → TupleSpace r →ᵃ[ℝ] ℝ)
    (hBase : ∃ z∈W,RationalTuple z)
    (hNonpos : ∀ z∈W,∀ i,f i z≤0)
    (hNeg : ∀ i,∃ z∈W,RationalTuple z ∧ f i z<0) :
    ∃ z∈W,RationalTuple z ∧ ∀ i,f i z<0 := by
  classical
  let : Fintype ι := Fintype.ofFinite ι
  have hStep (S : Finset ι) :
      ∃ z∈W,RationalTuple z ∧ ∀ i∈S,f i z<0 := by
    induction S using Finset.induction_on with
    | empty =>
      obtain ⟨z,hz,hq⟩ := hBase
      exact ⟨z,hz,hq,by simp⟩
    | insert i S hi hS =>
      obtain ⟨a,ha,hqa,hsa⟩ := hS
      obtain ⟨b,hb,hqb,hsb⟩ := hNeg i
      let z := AffineMap.lineMap a b (1/2:ℝ)
      have hz : z∈W := by
        change AffineMap.lineMap a b (1/2:ℝ)∈W
        rw [AffineMap.lineMap_apply_module]
        exact hW ha hb (by norm_num) (by norm_num) (by ring)
      refine ⟨z,hz,rationalTuple_midpoint hqa hqb,fun j hj => ?_⟩
      have h := Finset.mem_insert.mp hj
      have he : f j z=(f j a+f j b)/2 := by
        change f j (AffineMap.lineMap a b (1/2:ℝ))=_
        rw [(f j).apply_lineMap,AffineMap.lineMap_apply_ring]
        ring
      rw [he]
      rcases h with rfl|hj
      · linarith [hNonpos a ha j,hsb]
      · linarith [hsa j hj,hNonpos b hb j]
  obtain ⟨z,hz,hq,hAll⟩ := hStep Finset.univ
  exact ⟨z,hz,hq,fun i => hAll i (Finset.mem_univ i)⟩

/-- Every actually admissible nonempty sign cell has a rational
point with all its exact strict signs. Such points can be used
as rational centers when subdividing the weak cells. -/
theorem actual_admissible_signFibre_has_rational_point {r : ℕ}
    (s : TupleAffineTest r → Ordering) (x : TupleSpace r)
    (hx : x∈admissibleTupleRegion r 1) (hs : affineSignCode (tupleAffineForm 1) x=s) :
    ∃ z∈affineSignFibre (tupleAffineForm 1) s,RationalTuple z := by
  let W := weakTupleSignPolyhedron 1 s
  let I := {i : TupleAffineTest r // s i≠.eq}
  let f (i : I) := orientedTupleAffineMap 1 s i.val
  have hStratum : affineSignFibre (tupleAffineForm 1) s =
      strictAffineStratum (fun i => orientedTupleAffineMap 1 s i)
        {i | s i=.eq} {i | s i≠.eq} := by
    rw [affineSignFibre_eq_strictStratum]
    congr 1
    funext i z
    exact (orientedTupleAffineMap_apply 1 s i z).symm
  have hxS : x∈strictAffineStratum (fun i => orientedTupleAffineMap 1 s i)
      {i | s i=.eq} {i | s i≠.eq} := by
    rw [← hStratum]
    exact hs
  have hX : x∈W := ⟨hxS.1,fun i hi => (hxS.2 i hi).le⟩
  obtain ⟨T,hT,hR⟩ := actual_weak_sign_is_rational_convexHull s x hx hs
  have hT' : W=convexHull ℝ (T:Set (TupleSpace r)) := hT
  have hMem {z : TupleSpace r} (hz : z∈T) : z∈W := hT'.symm ▸ subset_convexHull ℝ _ hz
  have hWe (z : TupleSpace r) (hz : z∈W) (i : I) : f i z≤0 := hz.2 i.val i.property
  have hBase : ∃ z∈W,RationalTuple z := by
    have hTNe : T.Nonempty := by
      apply Finset.nonempty_iff_ne_empty.mpr
      intro he
      rw [hT',he,Finset.coe_empty,convexHull_empty] at hX
      exact hX
    obtain ⟨t,ht⟩ := hTNe
    exact ⟨t,hMem ht,hR t ht⟩
  have hCv : Convex ℝ W := hT'.symm ▸ convex_convexHull ℝ _
  have hRow (i : I) : ∃ z∈W,RationalTuple z ∧ f i z<0 := by
    have hXNeg : f i x<0 := hxS.2 i.val i.property
    by_contra! hN
    have hZero : (T:Set (TupleSpace r)) ⊆ (f i) ⁻¹' ({0}:Set ℝ) := by
      intro t ht
      have htT : t∈T := ht
      exact le_antisymm (hWe t (hMem htT) i) (hN t (hMem htT) (hR t htT))
    have hC : Convex ℝ ((f i) ⁻¹' ({0}:Set ℝ)) :=
      (convex_singleton (0:ℝ)).affine_preimage _
    have hn := convexHull_min hZero hC (hT' ▸ hX)
    exact hXNeg.ne (show f i x=0 from hn)
  obtain ⟨z,hz,hRat,hAll⟩ := finite_negative_rows_joint_rational_witness
    W hCv f hBase hWe hRow
  refine ⟨z,?_,hRat⟩
  rw [hStratum]
  exact ⟨hz.1,fun i hi => hAll ⟨i,hi⟩⟩

end CyrusianKaplan
