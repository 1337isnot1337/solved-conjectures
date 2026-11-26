module
public import Conjectures.CyrusianKaplanIntegerRayQuasipolynomial
public import Mathlib.Algebra.Order.BigOperators.Group.Finset

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

theorem integer_ray_coefficients_in_lattice {m d : ℕ} (A : Fin m → Fin d → ℤ)
    (z : Fin d → ℤ) :
    integerCoordinatesHom d z∈rayCoordinateLattice m d (fun j i => (A j i:ℝ)) := by
  change coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) (integerCoordinatesHom d z) ∈
    (integerCoordinatesHom m).range
  refine ⟨fun j => ∑ i,A j i*z i,?_⟩
  funext j
  change ((∑ i,A j i*z i:ℤ):ℝ) = ∑ i,(A j i:ℝ)*(z i:ℝ)
  simp only [Int.cast_sum,Int.cast_mul]

noncomputable def actualRayHeightOfPoint {m d : ℕ} (A : Fin m → Fin d → ℤ) (ell : Fin m)
    (x : rayCoordinateLattice m d (fun j i => (A j i:ℝ))) : ℤ :=
  x.property.choose ell

theorem actualRayHeightOfPoint_cast {m d : ℕ} (A : Fin m → Fin d → ℤ) (ell : Fin m)
    (x : rayCoordinateLattice m d (fun j i => (A j i:ℝ))) :
    (actualRayHeightOfPoint A ell x:ℝ)=
      coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) x.val ell :=
  congrFun x.property.choose_spec ell

/-- The selected ambient coordinate restricts to an integer
additive map on the literal ray lattice. It is not a separate
weight function imposed from outside the proof. -/
noncomputable def actualRayHeightHom {m d : ℕ} (A : Fin m → Fin d → ℤ) (ell : Fin m) :
    rayCoordinateLattice m d (fun j i => (A j i:ℝ)) →+ ℤ where
  toFun := actualRayHeightOfPoint A ell
  map_zero' := by
    have h := actualRayHeightOfPoint_cast A ell (0:rayCoordinateLattice m d (fun j i => (A j i:ℝ)))
    change (actualRayHeightOfPoint A ell 0:ℝ)=
      coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) 0 ell at h
    rw [map_zero,Pi.zero_apply] at h
    exact_mod_cast h
  map_add' x y := by
    have h := actualRayHeightOfPoint_cast A ell (x+y)
    change (actualRayHeightOfPoint A ell (x+y):ℝ)=
      coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) (x.val+y.val) ell at h
    rw [map_add,Pi.add_apply,← actualRayHeightOfPoint_cast A ell x,
      ← actualRayHeightOfPoint_cast A ell y] at h
    exact_mod_cast h

theorem actualRayHeightHom_eq_weighted_sum {m d : ℕ} (A : Fin m → Fin d → ℤ)
    (ell : Fin m) (h : ∀ i,0<A ell i)
    (x : rayCoordinateLattice m d (fun j i => (A j i:ℝ))) :
    (actualRayHeightHom A ell x:ℝ)=∑ i,(integralRayWeights A ell i:ℝ)*x.val i :=
  (actualRayHeightOfPoint_cast A ell x).trans (weighted_real_eq_integral_ray_height A ell h x.val).symm

end CyrusianKaplan
