module

public import Conjectures.RossiPermutohedronAnalyticExpansions
public import Mathlib.Topology.Algebra.InfiniteSum.Real

@[expose] public section
namespace RossiPermutohedron
open Complex

noncomputable def nearTerm (n : ℕ) (x : ℝ) (m : ℕ) : ℝ :=
  (m:ℝ)^n*Real.exp (-(m:ℝ)*x)

theorem nearTerm_pos (n : ℕ) (x : ℝ) {m : ℕ} (hm : 0<m) :
    0<nearTerm n x m := by unfold nearTerm; positivity

theorem nearTerm_geometric (n m : ℕ) (x : ℝ) :
    nearTerm n x m = (m:ℝ)^n*(Real.exp (-x))^m := by
  unfold nearTerm
  rw [← Real.exp_nat_mul]
  congr 2
  ring

theorem nearTerm_summable (n : ℕ) {x : ℝ} (hx : 0<x) :
    Summable (fun m : ℕ => nearTerm n x m) := by
  simp_rw [nearTerm_geometric]
  exact summable_pow_mul_geometric_of_norm_lt_one n (by
    rw [Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)]
    exact Real.exp_lt_one_iff.mpr (neg_lt_zero.mpr hx))

theorem signed_geometric_term (n m : ℕ) (x : ℝ) :
    -(eulerianGeometricTerm n m (-(Real.exp (-x):ℂ))).re =
      (-1:ℝ)^m*nearTerm n x (m+1) := by
  unfold eulerianGeometricTerm
  rw [← Complex.ofReal_neg,← Complex.ofReal_pow]
  have hC : (((m+1:ℕ):ℂ)^n) = (( ((m+1:ℕ):ℝ)^n:ℝ):ℂ) := by push_cast; rfl
  rw [hC,← Complex.ofReal_mul,Complex.ofReal_re,neg_pow,nearTerm_geometric]
  rw [pow_succ (-1:ℝ) m]
  ring

set_option maxHeartbeats 1000000 in
theorem gridValue_near_real_series (n : ℕ) {x : ℝ} (hx : 0<x) :
    gridValue n x =
      Real.exp x*(1+Real.exp (-x))^(n+2)*
        (∑' m : ℕ,(-1:ℝ)^m*nearTerm n x (m+1)) := by
  let q : ℂ := -(Real.exp (-x):ℂ)
  let f : ℕ → ℂ := fun m => eulerianGeometricTerm n m q
  have hq : ‖q‖<1 := by
    dsimp [q]
    rw [norm_neg,Complex.norm_real,Real.norm_eq_abs,abs_of_pos (Real.exp_pos _)]
    exact Real.exp_lt_one_iff.mpr (neg_lt_zero.mpr hx)
  let g : ℕ → ℂ := fun m => (m:ℂ)^n*q^m
  have hg : Summable g := summable_pow_mul_geometric_of_norm_lt_one n hq
  have hG : Summable f := (summable_nat_add_iff (f := g) 1).mpr hg
  have hr : (-(∑' m : ℕ,f m)).re = ∑' m : ℕ,(-1:ℝ)^m*nearTerm n x (m+1) := by
    calc
      _ = -(∑' m : ℕ,(f m).re) := by rw [Complex.neg_re, Complex.re_tsum hG]
      _ = ∑' m : ℕ,-(f m).re := tsum_neg.symm
      _ = _ := tsum_congr (fun m : ℕ => signed_geometric_term n m x)
  exact (gridValue_near_expansion n hx).trans
    (congrArg (fun v : ℝ => Real.exp x*(1+Real.exp (-x))^(n+2)*v) hr)

theorem nearTerm_ratio_right (n : ℕ) (x : ℝ) {m : ℕ} (hm : 0<m) :
    nearTerm n x (m+1) =
      (((m:ℝ)+1)/(m:ℝ))^n*Real.exp (-x)*nearTerm n x m := by
  have hM : (m:ℝ)≠0 := by exact_mod_cast hm.ne'
  rw [nearTerm_geometric,nearTerm_geometric,Nat.cast_succ,pow_succ (Real.exp (-x)),div_pow]
  field_simp

theorem nearTerm_ratio_left (n : ℕ) (x : ℝ) (m : ℕ) :
    nearTerm n x m =
      ((m:ℝ)/((m:ℝ)+1))^n*Real.exp x*nearTerm n x (m+1) := by
  have hM : (m:ℝ)+1≠0 := by positivity
  have hE : Real.exp x*Real.exp (-x)=1 := by rw [←Real.exp_add,add_neg_cancel,Real.exp_zero]
  rw [nearTerm_geometric,nearTerm_geometric,Nat.cast_succ,pow_succ (Real.exp (-x)),div_pow]
  calc
    _ = (Real.exp x*Real.exp (-x))*((m:ℝ)^n*Real.exp (-x)^m) := by rw [hE,one_mul]
    _ = _ := by field_simp

end RossiPermutohedron
