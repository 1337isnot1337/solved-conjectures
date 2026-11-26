module
public import Conjectures.CyrusianKaplanRationalSimplexCount
public import Mathlib.Data.Rat.Lemmas
public import Mathlib.LinearAlgebra.AffineSpace.Independent
public import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

def rationalVertexDenominator {d m : ℕ} (v : Fin d → Fin m → ℚ) (i : Fin d) : ℕ :=
  ∏ j,(v i j).den

theorem rationalVertexDenominator_positive {d m : ℕ} (v : Fin d → Fin m → ℚ) (i : Fin d) :
    0<rationalVertexDenominator v i :=
  Finset.prod_pos (fun j _ => Nat.pos_of_ne_zero (v i j).den_nz)

/-- Clear the rational vertex denominators, retaining the exact
homogeneous height as coordinate zero. -/
def rationalVertexRayMatrix {d m : ℕ} (v : Fin d → Fin m → ℚ)
    (j : Fin (m+1)) (i : Fin d) : ℤ :=
  Fin.cases (rationalVertexDenominator v i:ℤ)
    (fun j : Fin m => (v i j).num * (rationalVertexDenominator v i/(v i j).den:ℕ)) j

@[simp] theorem rationalVertexRayMatrix_height {d m : ℕ} (v : Fin d → Fin m → ℚ) (i : Fin d) :
    rationalVertexRayMatrix v 0 i=(rationalVertexDenominator v i:ℤ) := rfl

@[simp] theorem rationalVertexRayMatrix_coordinate {d m : ℕ} (v : Fin d → Fin m → ℚ)
    (j : Fin m) (i : Fin d) :
    rationalVertexRayMatrix v j.succ i=
      (v i j).num*(rationalVertexDenominator v i/(v i j).den:ℕ) := rfl

theorem rationalVertexRayMatrix_height_positive {d m : ℕ} (v : Fin d → Fin m → ℚ)
    (i : Fin d) : 0<rationalVertexRayMatrix v 0 i := by
  rw [rationalVertexRayMatrix_height]
  exact_mod_cast rationalVertexDenominator_positive v i

theorem rationalVertexRayMatrix_ratio {d m : ℕ} (v : Fin d → Fin m → ℚ) (i : Fin d) (j : Fin m) :
    (rationalVertexRayMatrix v j.succ i:ℝ)/(rationalVertexRayMatrix v 0 i:ℝ)=(v i j:ℝ) := by
  rw [rationalVertexRayMatrix_height,rationalVertexRayMatrix_coordinate,
    Int.cast_mul,Int.cast_natCast,Int.cast_natCast]
  let w := rationalVertexDenominator v i
  let a := v i j
  have hW : (w:ℝ)≠0 := by exact_mod_cast (rationalVertexDenominator_positive v i).ne'
  have hD : (a.den:ℝ)≠0 := by exact_mod_cast a.den_nz
  have hDiv : a.den∣w := Finset.dvd_prod_of_mem _ (Finset.mem_univ j)
  have hMul : ((w/a.den:ℕ):ℝ)*(a.den:ℝ)=(w:ℝ) := by
    exact_mod_cast Nat.div_mul_cancel hDiv
  have hRat : (a.num:ℝ)/(a.den:ℝ)=(a:ℝ) := by exact_mod_cast Rat.num_div_den a
  change (a.num:ℝ)*((w/a.den:ℕ):ℝ)/(w:ℝ)=(a:ℝ)
  rw [← hRat]
  apply (div_eq_div_iff hW hD).mpr
  rw [mul_assoc,hMul]

/-- Affine independence of the literal rational vertices gives
injectivity of the cleared homogeneous ray chart. The height row
records the sum of the affine coefficients. -/
theorem rationalVertexRayMatrix_injective {d m : ℕ} (v : Fin d → Fin m → ℚ)
    (hv : AffineIndependent ℝ (fun i j => (v i j:ℝ))) :
    Function.Injective (coneRayCoordinateHom (m+1) d (fun j i => (rationalVertexRayMatrix v j i:ℝ))) := by
  let A := rationalVertexRayMatrix v
  intro x y h
  let u (i : Fin d) := (A 0 i:ℝ)*x i
  let z (i : Fin d) := (A 0 i:ℝ)*y i
  have hsum : (∑ i,u i)=(∑ i,z i) :=
    congrFun h (0:Fin (m+1))
  have hRows : (∑ i,u i • (fun j => (v i j:ℝ))) =
      (∑ i,z i • (fun j => (v i j:ℝ))) := by
    funext j
    simp only [Finset.sum_apply,Pi.smul_apply,smul_eq_mul]
    have hTerm (t : ℝ) (i : Fin d) :
        ((A 0 i:ℝ)*t)*(v i j:ℝ)=(A j.succ i:ℝ)*t := by
      rw [← rationalVertexRayMatrix_ratio v i j]
      change (A 0 i:ℝ)*t*((A j.succ i:ℝ)/(A 0 i:ℝ))=_
      have hv₀ : (A 0 i:ℝ)≠0 := by exact_mod_cast (rationalVertexRayMatrix_height_positive v i).ne'
      field_simp [hv₀]
    unfold u z
    simp_rw [hTerm]
    exact congrFun h j.succ
  funext i
  have he := hv.eq_of_sum_eq_sum hsum hRows i (Finset.mem_univ i)
  have hi : (A 0 i:ℝ)≠0 := by exact_mod_cast (rationalVertexRayMatrix_height_positive v i).ne'
  exact mul_left_cancel₀ hi he

end CyrusianKaplan
