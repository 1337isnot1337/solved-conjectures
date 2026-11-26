import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Algebra.Polynomial.FieldDivision
import Mathlib.Tactic

/-! The shared-edge limiting polynomial has exactly its degree in distinct
nonreal zeros at every positive even order. -/

namespace GraphicalDist

open Polynomial

noncomputable def mixture (K : Type*) [CommSemiring K] (r : ℕ) : K[X] :=
  (C 2 * X + 1)^r + (X + C 2)^r

theorem mixture_eval {K : Type*} [CommSemiring K] (r : ℕ) (z : K) :
    (mixture K r).eval z = (2*z+1)^r + (z+2)^r := by
  simp [mixture]

theorem mixture_degree (r : ℕ) : (mixture ℝ r).natDegree = r := by
  let a : ℝ[X] := C 2 * X + 1
  let b : ℝ[X] := X + C 2
  have da : a.natDegree ≤ 1 := by dsimp [a]; compute_degree
  have db : b.natDegree ≤ 1 := by dsimp [b]; compute_degree
  have acoeff : (a^r).coeff r = (2:ℝ)^r := by
    simpa [a, coeff_add, coeff_C_mul, coeff_one] using (coeff_pow_of_natDegree_le (m := r) da)
  have bcoeff : (b^r).coeff r = 1 := by
    simpa [b, coeff_add] using (coeff_pow_of_natDegree_le (m := r) db)
  change (a^r+b^r).natDegree=r
  apply natDegree_eq_of_le_of_coeff_ne_zero
  · apply (natDegree_add_le _ _).trans
    rw [natDegree_pow, natDegree_pow]
    exact max_le (by nlinarith) (by nlinarith)
  · rw [coeff_add,acoeff,bcoeff]
    positivity

theorem mixture_positive (k : ℕ) (x : ℝ) : 0 < (mixture ℝ (2*k)).eval x := by
  rw [mixture_eval, Nat.mul_comm 2 k, pow_mul, pow_mul]
  by_cases zero : 2*x+1=0
  · have pos : 0 < x+2 := by linarith
    exact add_pos_of_nonneg_of_pos (sq_nonneg _) (by positivity)
  · exact add_pos_of_pos_of_nonneg (sq_pos_of_ne_zero (pow_ne_zero _ zero)) (sq_nonneg _)

theorem mixture_map (r : ℕ) : (mixture ℝ r).map Complex.ofRealHom = mixture ℂ r := by
  simp [mixture]

theorem mixture_complex_degree (r : ℕ) : (mixture ℂ r).natDegree = r := by
  rw [← mixture_map, natDegree_map_eq_of_injective Complex.ofReal_injective, mixture_degree]

theorem mixture_derivative_eval (m : ℕ) (z : ℂ) :
    (mixture ℂ (m+1)).derivative.eval z =
      (m+1:ℂ)*(2*(2*z+1)^m+(z+2)^m) := by
  simp [mixture, derivative_pow, derivative_mul, eval_add, eval_mul, eval_pow]
  ring

theorem mixture_derivative_nonzero (m : ℕ) (z : ℂ)
    (root : (mixture ℂ (m+1)).IsRoot z) : (mixture ℂ (m+1)).derivative.eval z ≠ 0 := by
  change (mixture ℂ (m+1)).eval z=0 at root
  rw [mixture_eval] at root
  intro critical
  rw [mixture_derivative_eval] at critical
  have linear := (mul_eq_zero.mp critical).resolve_left (by exact_mod_cast Nat.succ_ne_zero m)
  have h : (-3:ℂ)*(2*z+1)^m=0 := by
    calc
      _ = ((2*z+1)^(m+1)+(z+2)^(m+1)) - (z+2)*(2*(2*z+1)^m+(z+2)^m) := by ring
      _ = 0 := by rw [root,linear]; ring
  have ha := (mul_eq_zero.mp h).resolve_left (by norm_num)
  have hb : (z+2)^m=0 := by rw [ha, mul_zero, zero_add] at linear; exact linear
  have a := eq_zero_of_pow_eq_zero ha
  have b := eq_zero_of_pow_eq_zero hb
  have impossible : (-3:ℂ)=0 := by linear_combination a-2*b
  norm_num at impossible

theorem mixture_roots_nodup (m : ℕ) : (mixture ℂ (m+1)).roots.Nodup := by
  classical
  apply Multiset.nodup_iff_count_le_one.mpr
  intro z
  rw [count_roots]
  by_contra! high
  have hr := isRoot_iterate_derivative_of_lt_rootMultiplicity (t := z) (n := 0) (by omega : 0 < (mixture ℂ (m+1)).rootMultiplicity z)
  have hd := isRoot_iterate_derivative_of_lt_rootMultiplicity (t := z) (n := 1) high
  simp only [Function.iterate_zero, id_eq] at hr
  exact mixture_derivative_nonzero m z hr (by simpa [IsRoot] using hd)

theorem even_mixture_roots (k : ℕ) (hk : 0 < k) :
    (mixture ℂ (2*k)).roots.toFinset.card = 2*k ∧
      ∀ z ∈ (mixture ℂ (2*k)).roots, z.im ≠ 0 := by
  classical
  have order : 2*k = (2*k-1)+1 := by omega
  have simple : (mixture ℂ (2*k)).roots.Nodup := by nth_rw 1 [order]; exact mixture_roots_nodup _
  constructor
  · rw [Multiset.toFinset_card_of_nodup simple, ← (IsAlgClosed.splits _).natDegree_eq_card_roots,
      mixture_complex_degree]
  · intro z hz im
    have cast : (z.re:ℂ)=z := Complex.ext rfl (by simpa using im.symm)
    have val := (isRoot_of_mem_roots hz).eq_zero
    rw [← cast, ← mixture_map, eval_map] at val
    change eval₂ Complex.ofRealHom (Complex.ofRealHom z.re) _ = 0 at val
    rw [eval₂_at_apply] at val
    exact (mixture_positive k z.re).ne' (Complex.ofReal_injective (by simpa using val))

end GraphicalDist
