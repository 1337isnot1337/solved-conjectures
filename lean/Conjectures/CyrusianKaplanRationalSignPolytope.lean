module
public import Conjectures.CyrusianKaplanCompactStrata
public import Conjectures.CyrusianKaplanPolyhedronVertices
public import Mathlib.Analysis.Convex.KreinMilman
public import Mathlib.Analysis.Convex.Topology
import Mathlib.LinearAlgebra.Basis.VectorSpace
import Mathlib.Tactic.NormNum

@[expose] public section
namespace CyrusianKaplan

open Set

def signWeakConstraint {r : ℕ} (g : ℝ) (s : TupleAffineTest r → Ordering)
    (i : TupleAffineTest r × Bool) : TupleSpace r →ᵃ[ℝ] ℝ :=
  if s i.1 = .gt ∨ (s i.1 = .eq ∧ i.2 = true)
    then -tupleAffineMap g i.1 else tupleAffineMap g i.1

theorem signWeakConstraint_apply {r : ℕ} (g : ℝ) (s : TupleAffineTest r → Ordering)
    (i : TupleAffineTest r × Bool) (z : TupleSpace r) :
    signWeakConstraint g s i z =
      if s i.1 = .gt ∨ (s i.1 = .eq ∧ i.2 = true)
        then -tupleAffineForm g i.1 z else tupleAffineForm g i.1 z := by
  unfold signWeakConstraint
  split_ifs
  · change -tupleAffineMap g i.1 z = -tupleAffineForm g i.1 z
    rw [tupleAffineMap_apply]
  · exact tupleAffineMap_apply g i.1 z

theorem weak_sign_eq_finiteAffinePolyhedron {r : ℕ} (g : ℝ)
    (s : TupleAffineTest r → Ordering) :
    weakTupleSignPolyhedron g s =
      finiteAffinePolyhedron (signWeakConstraint g s) (fun _ => 0) := by
  ext z
  change
    ((∀ i, s i=.eq → orientedTupleAffineMap g s i z=0) ∧
      (∀ i, s i≠.eq → orientedTupleAffineMap g s i z≤0)) ↔
      ∀ i,signWeakConstraint g s i z≤0
  constructor
  · intro ⟨hE,hS⟩ ⟨i,b⟩
    rw [signWeakConstraint_apply]
    by_cases he : s i=.eq
    · have h := hE i he
      rw [orientedTupleAffineMap_apply] at h
      simp [he] at h
      simp [h]
    · have h := hS i he
      rw [orientedTupleAffineMap_apply] at h
      simpa [he] using h
  · intro h
    constructor
    · intro i hi
      have h₁ := h (i,false)
      have h₂ := h (i,true)
      rw [signWeakConstraint_apply] at h₁ h₂
      rw [orientedTupleAffineMap_apply]
      simp [hi] at h₁ h₂ ⊢
      exact le_antisymm h₁ h₂
    · intro i hi
      have h₁ := h (i,false)
      rw [signWeakConstraint_apply] at h₁
      rw [orientedTupleAffineMap_apply]
      simpa [hi] using h₁

theorem continuous_signWeakConstraint {r : ℕ} (g : ℝ)
    (s : TupleAffineTest r → Ordering) (i : TupleAffineTest r × Bool) :
    Continuous (signWeakConstraint g s i) := by
  by_cases h : s i.1 = .gt ∨ (s i.1 = .eq ∧ i.2 = true)
  · have he : (fun z => signWeakConstraint g s i z) = fun z => -tupleAffineForm g i.1 z :=
      funext fun z => by simp [signWeakConstraint_apply,h]
    change Continuous (fun z => signWeakConstraint g s i z)
    rw [he]
    exact (continuous_tupleAffineForm g i.1).neg
  · have he : (fun z => signWeakConstraint g s i z) = tupleAffineForm g i.1 :=
      funext fun z => by simp [signWeakConstraint_apply,h]
    change Continuous (fun z => signWeakConstraint g s i z)
    rw [he]
    exact continuous_tupleAffineForm g i.1

private theorem tuple_row_commutes_with_rat_retraction {r : ℕ} (L : ℝ →ₗ[ℚ] ℚ)
    (hL : ∀ a : ℚ,L (a:ℝ)=a) (i : TupleAffineTest r) (z : TupleSpace r) :
    (L (tupleAffineForm 1 i z):ℝ) =
      tupleAffineForm 1 i (fun j => (L (z.1 j):ℝ),fun j => (L (z.2 j):ℝ)) := by
  have hOne : L (1:ℝ)=(1:ℚ) := by simpa using hL 1
  have hTwo : L (2:ℝ)=(2:ℚ) := by simpa using hL 2
  cases i <;> simp [tupleAffineForm,map_add,map_sub,map_neg,hOne,hTwo]

/-- Every vertex of the actual compact weak-sign cell at genus one
has rational coordinates. The active rows determine the point;
a scalar rational-linear retraction preserves those exact equalities. -/
theorem actual_weak_sign_extreme_point_rational {r : ℕ}
    (s : TupleAffineTest r → Ordering) {z : TupleSpace r}
    (hz : z∈(weakTupleSignPolyhedron 1 s).extremePoints ℝ) :
    ∃ a b : Fin r → ℚ,(fun i => (a i:ℝ),fun i => (b i:ℝ))=z := by
  let c : ℚ →ₗ[ℚ] ℝ := Algebra.linearMap ℚ ℝ
  have hc : Function.Injective c := (algebraMap ℚ ℝ).injective
  obtain ⟨L,h⟩ := c.exists_leftInverse_of_injective (LinearMap.ker_eq_bot.mpr hc)
  have hL (a : ℚ) : L (a:ℝ)=a := congrArg (fun f : ℚ →ₗ[ℚ] ℚ => f a) h
  rw [weak_sign_eq_finiteAffinePolyhedron] at hz
  refine ⟨fun i => L (z.1 i),fun i => L (z.2 i),?_⟩
  apply extremePoint_eq_of_agreeing_active_rows _ _ (continuous_signWeakConstraint 1 s) hz
  intro i hi
  have hI := tuple_row_commutes_with_rat_retraction L hL i.1 z
  rw [signWeakConstraint_apply] at hi ⊢
  split_ifs with hs
  · rw [ite_eq_left hs,neg_eq_zero] at hi
    rw [← hI,hi,map_zero,Rat.cast_zero,neg_zero]
  · rw [ite_eq_right hs] at hi
    rw [← hI,hi,map_zero,Rat.cast_zero]

/-- The compact weak sign cell is the convex hull of a finite
set of rational vertices. This is the precise rational-polytope
input for an eventual triangulation theorem. -/
theorem actual_weak_sign_is_rational_convexHull {r : ℕ}
    (s : TupleAffineTest r → Ordering) (z : TupleSpace r)
    (hz : z ∈ admissibleTupleRegion r 1)
    (hs : affineSignCode (tupleAffineForm 1) z=s) :
    ∃ T : Finset (TupleSpace r), weakTupleSignPolyhedron 1 s=convexHull ℝ (T:Set (TupleSpace r)) ∧
      ∀ x∈T, ∃ a b : Fin r → ℚ,(fun i => (a i:ℝ),fun i => (b i:ℝ))=x := by
  classical
  let W := weakTupleSignPolyhedron 1 s
  have hC : IsCompact W := isCompact_admissibleWeakSignRegion 1 s z hz hs
  have hV : (W.extremePoints ℝ).Finite := by
    unfold W
    rw [weak_sign_eq_finiteAffinePolyhedron]
    exact finite_extremePoints_finiteAffinePolyhedron _ _ (continuous_signWeakConstraint 1 s)
  have hConv : Convex ℝ W := by
    have he : W=⋂ i, (signWeakConstraint 1 s i) ⁻¹' (Iic (0:ℝ)) := by
      unfold W
      rw [weak_sign_eq_finiteAffinePolyhedron]
      ext x
      simp [finiteAffinePolyhedron]
    rw [he]
    exact convex_iInter (fun i => (convex_Iic (0:ℝ)).affine_preimage _)
  have hHull : convexHull ℝ (W.extremePoints ℝ)=W := by
    have hK := closure_convexHull_extremePoints hC hConv
    rwa [(hV.isClosed_convexHull ℝ).closure_eq] at hK
  refine ⟨hV.toFinset,?_,?_⟩
  · rw [Set.Finite.coe_toFinset]
    exact hHull.symm
  · intro x hx
    exact actual_weak_sign_extreme_point_rational s (hV.mem_toFinset.mp hx)

end CyrusianKaplan
