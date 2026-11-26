module
public import Conjectures.CyrusianKaplanPolyhedronVertices
public import Mathlib.LinearAlgebra.Basis.VectorSpace
public import Mathlib.Basic.Real.Basic
public import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open Set
open scoped BigOperators

/-- A real solution to a system with rational coefficients gives
a rational solution by applying a rational-linear retraction of
the coefficient field coordinate by coordinate. This is used
only for existence, not as a numerical solver. -/
theorem exists_rational_solution_from_real {ι η : Type*} [Fintype η]
    (A : ι → η → ℚ) (b : ι → ℚ) (x : η → ℝ)
    (hx : ∀ i,(∑ j,(A i j:ℝ)*x j)=(b i:ℝ)) :
    ∃ q : η → ℚ, ∀ i,(∑ j,A i j*q j)=b i := by
  let cast : ℚ →ₗ[ℚ] ℝ := Algebra.linearMap ℚ ℝ
  have hinj : Function.Injective cast := (algebraMap ℚ ℝ).injective
  obtain ⟨L,hL⟩ := cast.exists_leftInverse_of_injective (LinearMap.ker_eq_bot.mpr hinj)
  have hLfix (a : ℚ) : L (a:ℝ)=a := by
    have h := congrArg (fun f : ℚ →ₗ[ℚ] ℚ => f a) hL
    exact h
  have hTerm (a : ℚ) (z : ℝ) : L ((a:ℝ)*z)=a*L z := by
    change L ((algebraMap ℚ ℝ a)*z)=a*L z
    rw [← Algebra.smul_def,L.map_smul]
    rfl
  refine ⟨fun j => L (x j),fun i => ?_⟩
  have h := congrArg (fun y : ℝ => L y) (hx i)
  change L (∑ j,(A i j:ℝ)*x j)=L (b i:ℝ) at h
  rw [map_sum,hLfix] at h
  simp_rw [hTerm] at h
  exact h

/-- Every extreme point of a polyhedron defined by rational
affine rows has rational coordinates. Combined with finite
active sets, this removes the arbitrary-real-vertex issue
from the compact sign regions. -/
theorem finiteAffinePolyhedron_extreme_point_is_rational {d : ℕ} {ι : Type*}
    [Finite ι] (A : ι → Fin d → ℚ) (b c : ι → ℚ)
    (f : ι → (Fin d → ℝ) →ᵃ[ℝ] ℝ) (hf : ∀ i,Continuous (f i))
    (rep : ∀ i z,f i z=(∑ j,(A i j:ℝ)*z j)+(b i:ℝ))
    (x : Fin d → ℝ)
    (hx : x ∈ (finiteAffinePolyhedron f (fun i => (c i:ℝ))).extremePoints ℝ) :
    ∃ q : Fin d → ℚ,(fun j => (q j:ℝ))=x := by
  let I := {i : ι // f i x=(c i:ℝ)}
  let a (i : I) := A i.val
  let t (i : I) := c i.val-b i.val
  have hSys (i : I) : (∑ j,(a i j:ℝ)*x j)=(t i:ℝ) := by
    have h := i.property
    rw [rep] at h
    change (∑ j,(A i.val j:ℝ)*x j)=((c i.val-b i.val:ℚ):ℝ)
    rw [Rat.cast_sub]
    linarith
  obtain ⟨q,hq⟩ := exists_rational_solution_from_real a t x hSys
  refine ⟨q,extremePoint_eq_of_agreeing_active_rows f (fun i => (c i:ℝ)) hf hx ?_⟩
  intro i hi
  have he := hq (⟨i,hi⟩ : I)
  have he' : (∑ j,(A i j:ℝ)*(q j:ℝ))=((c i-b i:ℚ):ℝ) := by
    exact_mod_cast he
  rw [rep,he',Rat.cast_sub,sub_add_cancel]

end CyrusianKaplan
