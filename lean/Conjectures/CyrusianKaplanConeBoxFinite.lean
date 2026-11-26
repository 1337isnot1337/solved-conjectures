module
public import Conjectures.CyrusianKaplanOpenCone
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Data.Fintype.Pi

@[expose] public section
namespace CyrusianKaplan

open Finset
open scoped BigOperators

def integerCoordinatesHom (m : ℕ) : (Fin m → ℤ) →+ (Fin m → ℝ) where
  toFun z := fun j => z j
  map_zero' := by funext j; exact Int.cast_zero
  map_add' z y := by funext j; exact Int.cast_add (z j) (y j)

def coneRayCoordinateHom (m d : ℕ) (A : Fin m → Fin d → ℝ) :
    CoefficientSpace d →+ (Fin m → ℝ) where
  toFun x := fun j => ∑ i,A j i*x i
  map_zero' := by funext j; simp
  map_add' x y := by
    funext j
    change (∑ i,A j i*(x i+y i))=(∑ i,A j i*x i)+(∑ i,A j i*y i)
    simp only [mul_add,Finset.sum_add_distrib]

def rayCoordinateLattice (m d : ℕ) (A : Fin m → Fin d → ℝ) :
    AddSubgroup (CoefficientSpace d) :=
  (integerCoordinatesHom m).range.comap (coneRayCoordinateHom m d A)

theorem natural_ray_coefficients_in_lattice (m d : ℕ) (A : Fin m → Fin d → ℤ)
    (q : Fin d → ℕ) :
    naturalCoordinates q ∈ rayCoordinateLattice m d (fun j i => (A j i:ℝ)) := by
  change (coneRayCoordinateHom m d (fun j i => (A j i:ℝ))) (naturalCoordinates q) ∈
    (integerCoordinatesHom m).range
  refine ⟨fun j => ∑ i,A j i*(q i:ℤ),?_⟩
  funext j
  change ((∑ i,A j i*(q i:ℤ) : ℤ):ℝ) = ∑ i,(A j i:ℝ)*(q i:ℝ)
  simp only [Int.cast_sum,Int.cast_mul,Int.cast_natCast]

/-- An injective ray-coordinate map identifies each point in the
fundamental box with an actual bounded integer ambient point.
There are therefore finitely many numerator shifts, without
assuming a finite enumeration of sample genera. -/
theorem finite_openFundamentalBoxPoints_of_injective (m d : ℕ)
    (A : Fin m → Fin d → ℝ)
    (hA : Function.Injective (coneRayCoordinateHom m d A)) :
    Finite (openFundamentalBoxPoints (rayCoordinateLattice m d A)) := by
  classical
  let B (j : Fin m) : ℤ := ⌈∑ i,|A j i|⌉
  let z (x : openFundamentalBoxPoints (rayCoordinateLattice m d A)) : Fin m → ℤ :=
    x.property.1.choose
  have hz (x : openFundamentalBoxPoints (rayCoordinateLattice m d A)) (j : Fin m) :
      (z x j:ℝ)=∑ i,A j i*x.val i :=
    congrFun x.property.1.choose_spec j
  have hBound (x : openFundamentalBoxPoints (rayCoordinateLattice m d A)) (j : Fin m) :
      |z x j|≤B j := by
    have hAbs : |(z x j:ℝ)|≤∑ i,|A j i| := by
      rw [hz]
      refine (Finset.abs_sum_le_sum_abs _ _).trans (Finset.sum_le_sum fun i _ => ?_)
      rw [abs_mul,abs_of_pos (x.property.2 i).1]
      exact mul_le_of_le_one_right (abs_nonneg _) (x.property.2 i).2
    have hB : (∑ i,|A j i|)≤(B j:ℝ) := Int.le_ceil _
    exact_mod_cast hAbs.trans hB
  have hNonneg (x : openFundamentalBoxPoints (rayCoordinateLattice m d A)) (j : Fin m) :
      0≤z x j+B j := by have hh := (abs_le.mp (hBound x j)).1; omega
  let E (x : openFundamentalBoxPoints (rayCoordinateLattice m d A)) :
      ∀ j, Fin ((2*B j).toNat+1) :=
    fun j => ⟨(z x j+B j).toNat,by
      have hu := (abs_le.mp (hBound x j)).2
      exact Nat.lt_succ_of_le (Int.toNat_le_toNat (by omega))⟩
  apply Finite.of_injective E
  intro x y h
  apply Subtype.ext
  apply hA
  funext j
  have hh := congrArg Fin.val (congrFun h j)
  change (z x j+B j).toNat=(z y j+B j).toNat at hh
  have hEq : z x j=z y j := by
    have hi := congrArg (fun n : ℕ => (n:ℤ)) hh
    rw [Int.toNat_of_nonneg (hNonneg x j),Int.toNat_of_nonneg (hNonneg y j)] at hi
    omega
  exact (hz x j).symm.trans ((congrArg (fun t : ℤ => (t:ℝ)) hEq).trans (hz y j))

end CyrusianKaplan
