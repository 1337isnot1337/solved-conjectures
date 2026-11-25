module

public import Conjectures.RossiPermutohedronGridGeometry

@[expose] public section
namespace RossiPermutohedron

theorem gridValue_all_large_signs {n j : ℕ} (hn : 128≤n) (hj : 2≤j) (hjn : j≤n) :
    1<(-1:ℝ)^(j-1)*gridValue n (gridCoordinate n j) := by
  rcases lt_trichotomy (2*j) (n+1) with h|h|h
  · exact gridValue_only_positive_half hn hj h
  · exact gridValue_only_middle hn (by omega) h
  · exact gridValue_only_reflected_half hn hj hjn h

theorem shiftedEulerian_grid_signed {n j : ℕ} (hn : 128≤n) (hj : 2≤j) (hjn : j≤n) :
    0<(-1:ℝ)^j*(shiftedEulerian (eulerianRec n)).eval (gridSample n j) := by
  let a := (-1:ℝ)^(j-1)
  have hs : a≤1 := (le_abs_self a).trans (by simp [a,abs_pow])
  have hg := gridValue_all_large_signs hn hj hjn
  have hθ : (-1:ℝ)^j = -a := by
    have h := phaseSign_of_positive (by omega : 0<j)
    linear_combination -h
  unfold gridSample
  rw [shiftedEulerianRec_eval_negExp,hθ]
  change 0< -a*(1-gridValue n (gridCoordinate n j))
  change 1<a*gridValue n (gridCoordinate n j) at hg
  nlinarith only [hg,hs]

theorem signs_opposite {a y z : ℝ} (hy : 0<a*y) (hz : 0<(-a)*z) :
    (z<0 ∧ 0<y) ∨ (y<0 ∧ 0<z) := by
  rcases mul_pos_iff.mp hy with ⟨ha,hy⟩|⟨ha,hy⟩
  · left
    refine ⟨?_,hy⟩
    exact (mul_pos_iff.mp hz).resolve_left (fun h => (not_lt_of_ge (neg_nonpos.mpr ha.le)) h.1) |>.2
  · right
    refine ⟨hy,?_⟩
    exact (mul_pos_iff.mp hz).resolve_right (fun h => (not_lt_of_ge (neg_nonneg.mpr ha.le)) h.1) |>.2

theorem shiftedEulerian_consecutive_signs {n j : ℕ} (hn : 128≤n) (hj : 2≤j)
    (hjn : j+1≤n) :
    let p := shiftedEulerian (eulerianRec n)
    (p.eval (gridSample n (j+1))<0 ∧ 0<p.eval (gridSample n j)) ∨
      (p.eval (gridSample n j)<0 ∧ 0<p.eval (gridSample n (j+1))) := by
  have h0 := shiftedEulerian_grid_signed hn hj (by omega : j≤n)
  have h1 := shiftedEulerian_grid_signed hn (by omega : 2≤j+1) hjn
  rw [pow_succ, mul_neg_one] at h1
  exact signs_opposite h0 h1

/-- The entire analytic sign grid, and hence the exact simple positive
root split, for the all-large recurrence polynomial model. -/
theorem recurrence_model_roots_large (m : ℕ) (hn : 128≤m+2) :
    ∃ (s : Finset ℝ) (z : ℝ), s.card=m ∧ (∀ x∈s,x∈Set.Ioo (0:ℝ) 1) ∧ 1<z ∧
      (reciprocalShift (shiftedEulerian (eulerianRec (m+2)))).roots =
        (insert z (insert 1 s)).val := by
  let g : Fin (m+1) → ℝ := fun i => gridSample (m+2) (i.val+2)
  apply eulerianRec_roots_of_grid (by omega) g
  · intro i j hij
    have hlt : i.val+2<j.val+2 := by omega
    exact gridSample_decreasing (by omega) hlt (by have h := j.isLt; omega)
  · intro i
    exact neg_lt_zero.mpr (Real.exp_pos _)
  · dsimp only
    intro i
    have hs := shiftedEulerian_consecutive_signs (n := m+2) (j := i.val+2)
      hn (by omega) (by have h := i.isLt; omega)
    have hgs : g i.succ = gridSample (m+2) (i.val+2+1) := by
      unfold g
      congr 1
    have hgc : g i.castSucc = gridSample (m+2) (i.val+2) := rfl
    rw [hgs,hgc]
    exact hs

end RossiPermutohedron
