module

public import Conjectures.RossiPermutohedronEulerianData

@[expose] public section
namespace RossiPermutohedron
open Polynomial

theorem eulerianStep_decompose (n : ℕ) (p : ℝ[X]) :
    eulerianStep n p = (p + C (n:ℝ)*(X*p)) + X*p.derivative - X^2*p.derivative := by
  unfold eulerianStep
  ring

theorem eulerianStep_coeff_succ (n j : ℕ) (p : ℝ[X]) :
    (eulerianStep n p).coeff (j+1) =
      ((j:ℝ)+2)*p.coeff (j+1) + ((n:ℝ)-j)*p.coeff j := by
  cases j with
  | zero => simp [eulerianStep_decompose, coeff_X_pow_mul', coeff_derivative]; ring
  | succ j =>
    rw [eulerianStep_decompose]
    simp only [coeff_sub, coeff_add, coeff_C_mul, coeff_X_mul, coeff_derivative]
    rw [show j+1+1=j+2 by omega, coeff_X_pow_mul, coeff_derivative]
    push_cast
    ring

theorem eulerianStep_degree (k : ℕ) (p : ℝ[X]) (hdeg : p.natDegree = k)
    (hmon : p.coeff k=1) :
    (eulerianStep (k+1) p).natDegree=k+1 ∧ (eulerianStep (k+1) p).coeff (k+1)=1 := by
  have htop : (eulerianStep (k+1) p).coeff (k+1)=1 := by
    rw [eulerianStep_coeff_succ, coeff_eq_zero_of_natDegree_lt (show p.natDegree<k+1 by omega),
      hmon]
    push_cast
    ring
  refine ⟨le_antisymm ?_ (le_natDegree_of_ne_zero (by rw [htop]; norm_num)),htop⟩
  rw [natDegree_le_iff_degree_le, degree_le_iff_coeff_zero]
  intro j hj
  rw [Nat.cast_lt] at hj
  have h0 : j=(j-1)+1 := by omega
  rw [h0,eulerianStep_coeff_succ]
  rw [coeff_eq_zero_of_natDegree_lt (show p.natDegree<j-1+1 by omega),
    coeff_eq_zero_of_natDegree_lt (show p.natDegree<j-1 by omega)]
  ring

theorem eulerianRec_degree (k : ℕ) :
    (eulerianRec (k+1)).natDegree=k ∧ (eulerianRec (k+1)).coeff k=1 := by
  induction k with
  | zero => simp [eulerianRec,eulerianStep]
  | succ k ih =>
    change (eulerianStep (k+1) (eulerianRec (k+1))).natDegree=k+1 ∧
      (eulerianStep (k+1) (eulerianRec (k+1))).coeff (k+1)=1
    exact eulerianStep_degree k _ ih.1 ih.2

theorem eulerianRec_roots_of_grid {m : ℕ} (hm : 1≤m) (g : Fin (m+1) → ℝ)
    (hmono : StrictAnti g) (hneg : ∀ j, g j < 0)
    (halt : let p := shiftedEulerian (eulerianRec (m+2)); ∀ i : Fin m,
       (p.eval (g i.succ) < 0 ∧ 0 < p.eval (g i.castSucc)) ∨
       (p.eval (g i.castSucc) < 0 ∧ 0 < p.eval (g i.succ))) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧ (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots =
        (insert z (insert 1 s)).val := by
  have hd : 1<(eulerianRec (m+2)).derivative.eval 0 := by
    have h := shiftedEulerianRec_deriv_neg (n := m+2) (by omega)
    rw [shiftedEulerian_derivative_eval0,eulerianRec_eval0] at h
    exact sub_neg.mp h
  exact rossi_reduction_of_grid _ (eulerianRec_degree (m+1)).1
    (eulerianRec_eval0 _) hd g hmono hneg halt

end RossiPermutohedron
