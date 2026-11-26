module
public import Conjectures.CyrusianKaplanConeBoxFinite
public import Conjectures.CyrusianKaplanOpenConeCount
public import Mathlib.Algebra.Order.BigOperators.Ring.Finset

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

def integralRayWeights {m d : ℕ} (A : Fin m → Fin d → ℤ) (ell : Fin m) :
    Fin d → ℕ := fun i => (A ell i).toNat

/-- The literal integer-lattice points of an open cone at a fixed
ambient integer height. Injective ray coordinates are part of the
structure needed to recover every ambient point uniquely. -/
def integerRayHeightSlice {m d : ℕ} (A : Fin m → Fin d → ℤ) (ell : Fin m) (g : ℕ) :=
  {x : openConeLatticePoints (rayCoordinateLattice m d (fun j i => (A j i:ℝ))) //
    coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) x.val ell=(g:ℝ)}

theorem weighted_real_eq_integral_ray_height {m d : ℕ}
    (A : Fin m → Fin d → ℤ) (ell : Fin m) (h : ∀ i,0<A ell i)
    (x : CoefficientSpace d) :
    (∑ i,(integralRayWeights A ell i : ℝ)*x i) =
      coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) x ell := by
  apply Finset.sum_congr rfl
  intro i _
  have hi := Int.toNat_of_nonneg (h i).le
  have hr : (integralRayWeights A ell i:ℝ)=(A ell i:ℝ) := by
    unfold integralRayWeights
    exact_mod_cast hi
  rw [hr]

/-- The height is a nonnegative integer on the fundamental box
because the selected ambient coordinate is a lattice coordinate.
This verifies the integer-numerator condition rather than assuming it. -/
theorem integer_box_height_exists {m d : ℕ}
    (A : Fin m → Fin d → ℤ) (ell : Fin m) (h : ∀ i,0<A ell i)
    (b : openFundamentalBoxPoints (rayCoordinateLattice m d (fun j i => (A j i:ℝ)))) :
    ∃ H : ℕ, (∑ i,(integralRayWeights A ell i:ℝ)*b.val i)=(H:ℝ) := by
  let z := b.property.1.choose
  have hz : (z ell:ℝ)=
      coneRayCoordinateHom m d (fun j i => (A j i:ℝ)) b.val ell :=
    congrFun b.property.1.choose_spec ell
  rw [← weighted_real_eq_integral_ray_height A ell h] at hz
  have hN : (0:ℝ)≤(z ell:ℝ) := by
    rw [hz]
    exact Finset.sum_nonneg (fun i _ => mul_nonneg (Nat.cast_nonneg _) (b.property.2 i).1.le)
  have hZ : 0≤z ell := by exact_mod_cast hN
  have hCast : ((z ell).toNat:ℝ)=(z ell:ℝ) := by exact_mod_cast Int.toNat_of_nonneg hZ
  exact ⟨(z ell).toNat,hz.symm.trans hCast.symm⟩

/-- A natural-coordinate height slice of any injective integral
open simplicial cone with positive ray heights has an exact
quasipolynomial count on all positive heights. This does not
assert a triangulation of any particular sign cell. -/
theorem integerRayHeightSlice_has_quasipolynomial {m k : ℕ}
    (A : Fin m → Fin (k+1) → ℤ) (ell : Fin m)
    (h : ∀ i,0<A ell i)
    (hA : Function.Injective (coneRayCoordinateHom m (k+1) (fun j i => (A j i:ℝ)))) :
    HasPositiveGenusQuasipolynomial (fun g => (Nat.card (integerRayHeightSlice A ell g):ℚ)) k := by
  classical
  let P := rayCoordinateLattice m (k+1) (fun j i => (A j i:ℝ))
  let w := integralRayWeights A ell
  let p := ∏ i,w i
  have hw (i : Fin (k+1)) : 0<w i := by
    change 0<(A ell i).toNat
    have hi := h i
    omega
  have hp : 0<p := Finset.prod_pos (fun i _ => hw i)
  have hdvd (i : Fin (k+1)) : w i∣p := Finset.dvd_prod_of_mem w (Finset.mem_univ i)
  have : Finite (openFundamentalBoxPoints P) :=
    finite_openFundamentalBoxPoints_of_injective _ _ _ hA
  let : Fintype (openFundamentalBoxPoints P) := Fintype.ofFinite _
  let H (b : openFundamentalBoxPoints P) : ℕ := (integer_box_height_exists A ell h b).choose
  have hH (b : openFundamentalBoxPoints P) :
      (∑ i,(w i:ℝ)*b.val i)=(H b:ℝ) := (integer_box_height_exists A ell h b).choose_spec
  have hB (b : openFundamentalBoxPoints P) : H b≤∑ i,w i := by
    have hRe : (H b:ℝ)≤(∑ i,(w i:ℝ)) := by
      rw [← hH]
      exact Finset.sum_le_sum (fun i _ => mul_le_of_le_one_right (Nat.cast_nonneg _) (b.property.2 i).2)
    exact_mod_cast hRe
  have hEq :
      (fun g => (Nat.card (integerRayHeightSlice A ell g):ℚ)) =
        fun g => (Nat.card (openConeHeightSlice w P g):ℚ) := by
    funext g
    apply congrArg (Nat.cast : ℕ → ℚ)
    apply Nat.card_congr
    apply Equiv.subtypeEquivRight
    intro x
    change (coneRayCoordinateHom m (k+1) (fun j i => (A j i:ℝ)) x.val ell=(g:ℝ)) ↔
      (∑ i,(w i:ℝ)*x.val i)=(g:ℝ)
    rw [weighted_real_eq_integral_ray_height A ell h]
  rw [hEq]
  exact openConeHeightSlice_quasipolynomial P (natural_ray_coefficients_in_lattice _ _ A)
    w p hp hw hdvd H hH hB

end CyrusianKaplan
