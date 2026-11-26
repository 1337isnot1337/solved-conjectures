module
public import Mathlib.Algebra.Module.Submodule.Ker
public import Mathlib.Algebra.Module.NatInt
import Mathlib.Tactic.Abel

@[expose] public section
namespace CyrusianKaplan

/-- An integral normal is primitive here when its integer values
contain 1. This formulation works uniformly in the actual coordinate
lattice and gives an integral origin for every integral intercept. -/
def PrimitiveIntegralNormal {V : Type*} [AddCommGroup V]
    (f : V →ₗ[ℤ] ℤ) : Prop := ∃ v, f v = 1

theorem integral_intercept_has_lattice_origin {V : Type*} [AddCommGroup V]
    (f : V →ₗ[ℤ] ℤ) (h : PrimitiveIntegralNormal f) (c : ℤ) :
    ∃ v, f v = c := by
  obtain ⟨u,hu⟩ := h
  refine ⟨c • u,?_⟩
  rw [map_zsmul,hu]
  simp

/-- The degree-dependent hyperplane has exactly the fixed kernel
lattice after translation by g times an integral origin. This is
the lattice identification used for codimension-one corrections. -/
def integral_hyperplane_translate {V : Type*} [AddCommGroup V]
    (f : V →ₗ[ℤ] ℤ) (c g : ℤ) (v : V) (hv : f v = c) :
    {x : V // f x = g*c} ≃ ↥(LinearMap.ker f) where
  toFun x := ⟨x.val - g • v,by
    rw [LinearMap.mem_ker,map_sub,map_zsmul,hv,x.property]
    simp⟩
  invFun x := ⟨x.val + g • v,by
    rw [map_add,map_zsmul,hv,LinearMap.mem_ker.mp x.property]
    simp⟩
  left_inv x := Subtype.ext (by change x.val - g • v + g • v = x.val; abel)
  right_inv x := Subtype.ext (by change x.val + g • v - g • v = x.val; abel)

end CyrusianKaplan
