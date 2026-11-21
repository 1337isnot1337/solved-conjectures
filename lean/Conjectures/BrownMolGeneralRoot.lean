import Conjectures.BrownMolRootBound

open Polynomial
noncomputable section
namespace BrownMol

theorem root_near_of_derivative_bound (p : ℂ[X]) (c : ℂ) (R : ℝ) (hR : 0 < R)
    (n : ℕ) (hdegree : p.natDegree ≤ n)
    (hbound : (n : ℝ)*‖p.eval c‖ < R*‖p.derivative.eval c‖) :
    ∃ z, p.IsRoot z ∧ ‖c-z‖ < R := by
  classical
  by_cases hz : p.eval c = 0
  · exact ⟨c, hz, by simpa using hR⟩
  by_contra hnone
  have hfar : ∀ z ∈ p.roots, R ≤ ‖c-z‖ := by
    intro z hzroot
    by_contra hnot
    exact hnone ⟨z,isRoot_of_mem_roots hzroot,lt_of_not_ge hnot⟩
  let m : Multiset ℝ := (p.roots.map (fun z => ‖(1 : ℂ)/(c-z)‖))
  have hm : ∀ x ∈ m, x ≤ 1/R := by
    intro x hx
    obtain ⟨z,hzroot,rfl⟩ := Multiset.mem_map.mp hx
    rw [norm_div, norm_one]
    exact one_div_le_one_div_of_le hR (hfar z hzroot)
  have hcard : m.card ≤ n := by
    simp only [m, Multiset.card_map, ← (IsAlgClosed.splits p).natDegree_eq_card_roots]
    exact hdegree
  have hsum : ‖(p.roots.map (fun z => (1 : ℂ)/(c-z))).sum‖ ≤ (n : ℝ)/R := by
    have hn := norm_multiset_sum_le (p.roots.map (fun z => (1 : ℂ)/(c-z)))
    simp only [Multiset.map_map] at hn
    have hn' : ‖(p.roots.map (fun z => (1 : ℂ)/(c-z))).sum‖ ≤ m.sum := by
      simpa [m, Function.comp_def] using hn
    have hc := Multiset.sum_le_card_nsmul m (1/R) hm
    calc
      _ ≤ m.sum := hn'
      _ ≤ (m.card : ℝ)*(1/R) := by simpa [nsmul_eq_mul] using hc
      _ ≤ (n : ℝ)*(1/R) := mul_le_mul_of_nonneg_right (by exact_mod_cast hcard) (by positivity)
      _ = (n : ℝ)/R := by ring
  have hid := (IsAlgClosed.splits p).eval_derivative_eq_eval_mul_sum hz
  have hder : ‖p.derivative.eval c‖ ≤ ‖p.eval c‖*((n : ℝ)/R) := by
    rw [hid,norm_mul]
    exact mul_le_mul_of_nonneg_left hsum (norm_nonneg _)
  have hmul := mul_le_mul_of_nonneg_left hder hR.le
  have hid' : R*(‖p.eval c‖*((n : ℝ)/R)) = (n : ℝ)*‖p.eval c‖ := by field_simp
  rw [hid'] at hmul
  linarith


end BrownMol
end
