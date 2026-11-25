module

public import Conjectures.RossiPermutohedronEulerianDegree
public import Mathlib.Algebra.Polynomial.CoeffList

@[expose] public section
namespace RossiPermutohedron
open Polynomial

def rowStepCoeff (old : List ℕ) (n : ℕ) : ℕ → ℕ
  | 0 => old.getD 0 0
  | j+1 => (j+2)*old.getD (j+1) 0+(n-j)*old.getD j 0

def eulerRow : ℕ → List ℕ
  | 0 => [1]
  | n+1 => (List.range (n+1)).map (rowStepCoeff (eulerRow n) n)

theorem eulerRow_length {n : ℕ} (hn : 0<n) : (eulerRow n).length=n := by
  cases n with
  | zero => omega
  | succ n => simp [eulerRow]

theorem eulerRow_getD (n k : ℕ) :
    ((eulerRow n).getD k 0:ℝ) = (eulerianRec n).coeff k := by
  induction n generalizing k with
  | zero =>
    cases k <;> simp [eulerRow,eulerianRec,coeff_one]
  | succ n ih =>
    by_cases hk : k<n+1
    · have he : (eulerRow (n+1)).getD k 0 = rowStepCoeff (eulerRow n) n k := by
        simp [eulerRow,List.getD_eq_getElem?_getD,List.getElem?_range hk]
      rw [he]
      cases k with
      | zero =>
        simp only [rowStepCoeff,ih,coeff_zero_eq_eval_zero,eulerianRec_eval0]
      | succ j =>
        rw [eulerianRec,eulerianStep_coeff_succ,rowStepCoeff,Nat.cast_add,Nat.cast_mul,Nat.cast_mul,
          Nat.cast_sub (show j≤n by omega),ih,ih]
        push_cast
        ring
    · have hlen := eulerRow_length (show 0<n+1 by omega)
      have hz : (eulerRow (n+1)).getD k 0=0 := by
        rw [List.getD_eq_getElem?_getD,List.getElem?_eq_none (by omega)]
        rfl
      rw [hz,Nat.cast_zero]
      exact (coeff_eq_zero_of_natDegree_lt (by rw [(eulerianRec_degree n).1]; omega)).symm

theorem eulerianRec_eq_ofCoeffList (n : ℕ) :
    eulerianRec n = ofCoeffList ((eulerRow n).map fun c : ℕ => (c:ℝ)) := by
  ext k
  rw [coeff_ofCoeffList,← eulerRow_getD n k]
  simp only [List.getD_eq_getElem?_getD,List.getElem?_map]
  cases (eulerRow n)[k]? <;> simp

/-- Homogeneous evaluation with a positive integer denominator. The
power is the length, not the degree, so the empty row is harmless. -/
def homogeneousEval (a b : ℤ) : List ℕ → ℤ
  | [] => 0
  | c::cs => (c:ℤ)*b^(cs.length+1)+a*homogeneousEval a b cs

theorem homogeneousEval_cast (a b : ℤ) (hb : b≠0) (coeffs : List ℕ) :
    (homogeneousEval a b coeffs:ℝ)=
      ((b:ℝ)^coeffs.length)*
      (ofCoeffList (coeffs.map fun c : ℕ => (c:ℝ))).eval ((a:ℝ)/(b:ℝ)) := by
  have hb' : (b:ℝ)≠0 := by exact_mod_cast hb
  induction coeffs with
  | nil => simp [homogeneousEval]
  | cons c cs ih =>
    simp only [homogeneousEval,List.length_cons,List.map_cons,ofCoeffList_cons,
      eval_add,eval_C,eval_mul,eval_X,Int.cast_add,Int.cast_mul,Int.cast_pow,Int.cast_natCast]
    rw [ih,pow_succ (b:ℝ)]
    field_simp

def gridNumerator (n : ℕ) (a b : ℤ) : ℤ :=
  b^(n+1)-(b-a)*homogeneousEval a b (eulerRow n)

theorem gridNumerator_cast {n : ℕ} (hn : 0<n) {a b : ℤ} (hb : b≠0) :
    (gridNumerator n a b:ℝ) =
      (b:ℝ)^(n+1)*(shiftedEulerian (eulerianRec n)).eval ((a:ℝ)/(b:ℝ)) := by
  have hb' : (b:ℝ)≠0 := by exact_mod_cast hb
  unfold gridNumerator
  push_cast
  rw [homogeneousEval_cast a b hb,← eulerianRec_eq_ofCoeffList,eulerRow_length hn]
  unfold shiftedEulerian
  simp only [eval_sub,eval_one,eval_mul,eval_X]
  rw [pow_succ (b:ℝ)]
  field_simp

end RossiPermutohedron
