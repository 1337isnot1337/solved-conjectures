module
public import Mathlib.Analysis.Convex.Extreme
public import Mathlib.Analysis.Normed.Module.Basic
public import Mathlib.Topology.Algebra.Affine
import Mathlib.Order.Filter.Finite
import Mathlib.Tactic.Module
import Mathlib.Tactic.NormNum

@[expose] public section
namespace CyrusianKaplan

open Filter Set
open scoped Topology

def finiteAffinePolyhedron {E ι : Type*} [AddCommGroup E] [Module ℝ E]
    (f : ι → E →ᵃ[ℝ] ℝ) (c : ι → ℝ) : Set E :=
  {x | ∀ i, f i x≤c i}

/-- A vertex is determined by the equalities of its active rows.
Otherwise the line through any second solution moves in both
directions inside the polyhedron for sufficiently small steps. -/
theorem extremePoint_eq_of_agreeing_active_rows {E ι : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [Finite ι]
    (f : ι → E →ᵃ[ℝ] ℝ) (c : ι → ℝ) (hf : ∀ i,Continuous (f i))
    {x y : E} (hx : x ∈ (finiteAffinePolyhedron f c).extremePoints ℝ)
    (hy : ∀ i,f i x=c i → f i y=c i) : y=x := by
  let z : ℝ →ᵃ[ℝ] E := AffineMap.lineMap x y
  have hCont : Continuous z := AffineMap.lineMap_continuous
  have hIn : ∀ᶠ t : ℝ in 𝓝 0, z t ∈ finiteAffinePolyhedron f c := by
    refine eventually_all.mpr (fun i => ?_)
    by_cases ha : f i x=c i
    · apply Filter.Eventually.of_forall
      intro t
      have ht : f i (z t)=c i := by
        change f i (AffineMap.lineMap x y t)=c i
        rw [(f i).apply_lineMap,ha,hy i ha,AffineMap.lineMap_same_apply]
      exact ht.le
    · have hlt : f i x<c i := lt_of_le_of_ne (hx.1 i) ha
      have hC : Continuous (fun t => f i (z t)) := (hf i).comp hCont
      have hz : f i (z 0)=f i x := by simp [z]
      exact (hC.continuousAt.eventually_lt continuousAt_const (by simpa only [hz] using hlt)).mono
        (fun _ h => h.le)
  have hNeg : ∀ᶠ t : ℝ in 𝓝 0, z (-t) ∈ finiteAffinePolyhedron f c := by
    have hn : Tendsto (fun t : ℝ => -t) (𝓝 0) (𝓝 0) := by
      simpa only [neg_zero] using (continuous_neg (G:=ℝ)).tendsto (0:ℝ)
    exact hn.eventually hIn
  have hNear : ∀ᶠ t : ℝ in 𝓝[Ioi 0] (0:ℝ),
      (z t ∈ finiteAffinePolyhedron f c ∧ z (-t) ∈ finiteAffinePolyhedron f c) ∧ t ∈ Ioi 0 :=
    (Filter.Eventually.filter_mono nhdsWithin_le_nhds (hIn.and hNeg)).and
      self_mem_nhdsWithin
  obtain ⟨t,⟨h₁,h₂⟩,ht⟩ := hNear.exists
  have htP : 0<t := ht
  have hSegment : x ∈ openSegment ℝ (z t) (z (-t)) := by
    refine ⟨1/2,1/2,by norm_num,by norm_num,by norm_num,?_⟩
    unfold z
    rw [AffineMap.lineMap_apply_module,AffineMap.lineMap_apply_module]
    module
  have he := hx.2 h₁ h₂ hSegment
  change AffineMap.lineMap x y t=x at he
  rw [AffineMap.lineMap_apply_module'] at he
  have he' : t • (y-x)+x=0+x := by simpa only [zero_add] using he
  have hZero : t • (y-x)=0 := add_right_cancel he'
  exact sub_eq_zero.mp ((smul_eq_zero.mp hZero).resolve_left htP.ne')

/-- A finite list of inequalities has only finitely many extreme
points, since different vertices must have different active sets. -/
theorem finite_extremePoints_finiteAffinePolyhedron {E ι : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [Finite ι]
    (f : ι → E →ᵃ[ℝ] ℝ) (c : ι → ℝ) (hf : ∀ i,Continuous (f i)) :
    (finiteAffinePolyhedron f c).extremePoints ℝ |>.Finite := by
  classical
  let active (x : ↥((finiteAffinePolyhedron f c).extremePoints ℝ)) (i : ι) : Bool :=
    decide (f i x.val=c i)
  have hInj : Function.Injective active := by
    intro x y h
    apply Subtype.ext
    symm
    apply extremePoint_eq_of_agreeing_active_rows f c hf x.property
    intro i hi
    have hEq := congrFun h i
    change decide (f i x.val=c i)=decide (f i y.val=c i) at hEq
    exact of_decide_eq_true (hEq.symm.trans (decide_eq_true hi))
  have : Finite ↥((finiteAffinePolyhedron f c).extremePoints ℝ) :=
    Finite.of_injective active hInj
  exact Set.toFinite _

end CyrusianKaplan
