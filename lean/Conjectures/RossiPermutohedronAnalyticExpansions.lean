module

public import Conjectures.RossiPermutohedronPoles
public import Conjectures.RossiPermutohedronGeometric

@[expose] public section
namespace RossiPermutohedron
open Polynomial Complex
open scoped Nat

/-- The expression whose sign and magnitude control the negative
root grid for the shifted Eulerian polynomial. -/
noncomputable def gridValue (n : ℕ) (x : ℝ) : ℝ :=
  (1+Real.exp (-x))*(eulerianRec n).eval (-Real.exp (-x))

theorem shiftedEulerianRec_eval_negExp (n : ℕ) (x : ℝ) :
    (shiftedEulerian (eulerianRec n)).eval (-Real.exp (-x))=1-gridValue n x := by
  simp [shiftedEulerian,gridValue]

theorem rationalEulerian_negExp_cast (n : ℕ) (x : ℝ) :
    rationalEulerian n (-(Real.exp (-x):ℂ)) =
      ((-Real.exp (-x)*(eulerianRec n).eval (-Real.exp (-x)) /
        (1+Real.exp (-x))^(n+1):ℝ):ℂ) := by
  unfold rationalEulerian
  rw [← Complex.ofReal_neg,complexEulerian_eval_real]
  push_cast
  rw [sub_neg_eq_add]

theorem gridValue_eq_rationalEulerian (n : ℕ) (x : ℝ) :
    gridValue n x =
      Real.exp x*(1+Real.exp (-x))^(n+2)*(-(rationalEulerian n (-(Real.exp (-x):ℂ)))).re := by
  rw [rationalEulerian_negExp_cast,← Complex.ofReal_neg,Complex.ofReal_re]
  unfold gridValue
  have hpos : 0 < 1+Real.exp (-x) := by positivity
  have he : Real.exp x*Real.exp (-x)=1 := by rw [←Real.exp_add,add_neg_cancel,Real.exp_zero]
  rw [show n+2=n+1+1 by omega, pow_succ (1+Real.exp (-x)) (n+1)]
  calc
    _ = (Real.exp x*Real.exp (-x))*((1+Real.exp (-x))*(eulerianRec n).eval (-Real.exp (-x))) := by rw [he,one_mul]
    _ = _ := by
      field_simp [hpos.ne']

theorem gridValue_bulk_expansion (n : ℕ) {x : ℝ} (hx : 0<x) :
    gridValue (n+1) x = -(Real.exp x*(1+Real.exp (-x))^(n+3) * ((n+1)!:ℝ) *
      (∑' k : ℤ,1/(oddPole x k)^(n+2)).re) := by
  rw [gridValue_eq_rationalEulerian,← cotQ_at_point, rationalEulerian_odd_poles n hx,
    Complex.neg_re,Complex.mul_re]
  simp only [Complex.natCast_re,Complex.natCast_im,zero_mul,sub_zero]
  ring

theorem gridValue_near_expansion (n : ℕ) {x : ℝ} (hx : 0<x) :
    gridValue n x =
      Real.exp x*(1+Real.exp (-x))^(n+2)*
         (-(∑' m : ℕ,eulerianGeometricTerm n m (-(Real.exp (-x):ℂ)))).re := by
  rw [gridValue_eq_rationalEulerian,rationalEulerian_geometric]
  rw [← Complex.ofReal_neg,Complex.norm_real,Real.norm_eq_abs,abs_neg,abs_of_pos (Real.exp_pos _)]
  exact Real.exp_lt_one_iff.mpr (neg_lt_zero.mpr hx)

end RossiPermutohedron
