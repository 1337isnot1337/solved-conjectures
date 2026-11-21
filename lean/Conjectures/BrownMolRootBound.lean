import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.Algebra.Order.BigOperators.Group.Multiset
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

/-! A polynomial log-derivative bound gives a root within a prescribed disk. -/
open Polynomial
noncomputable section
namespace BrownMol

theorem root_near_of_log_derivative (p : ℂ[X]) (c : ℂ) (R : ℝ) (hR : 0 < R)
    (hval : ‖p.eval c‖ < 1) (hdegree : p.natDegree ≤ 1000)
    (hderiv : 50000 < ‖p.derivative.eval c‖) (hR' : 1/50 ≤ R) :
    ∃ z, p.IsRoot z ∧ ‖c-z‖ < R := by
  classical
  by_cases hz : p.eval c = 0
  · exact ⟨c, hz, by simpa using hR⟩
  by_contra hnone
  have hfar : ∀ z ∈ p.roots, R ≤ ‖c-z‖ := by
    intro z hzroot
    by_contra hnot
    have hroot : p.IsRoot z := isRoot_of_mem_roots hzroot
    exact hnone ⟨z,hroot,lt_of_not_ge hnot⟩
  let m : Multiset ℝ := (p.roots.map (fun z => ‖(1 : ℂ)/(c-z)‖))
  have hm : ∀ x ∈ m, x ≤ 50 := by
    intro x hx
    obtain ⟨z,hzroot,rfl⟩ := Multiset.mem_map.mp hx
    have hlow : (1/50 : ℝ) ≤ ‖c-z‖ := hR'.trans (hfar z hzroot)
    rw [norm_div, norm_one]
    have hpos : (0 : ℝ) < 1/50 := by norm_num
    have ht := one_div_le_one_div_of_le hpos hlow
    norm_num at ht ⊢
    exact ht
  have hsum : ‖(p.roots.map (fun z => (1 : ℂ)/(c-z))).sum‖ ≤ 50000 := by
    have hn := norm_multiset_sum_le (p.roots.map (fun z => (1 : ℂ)/(c-z)))
    have hc := Multiset.sum_le_card_nsmul m 50 hm
    have hcard : m.card ≤ 1000 := by
      simp only [m, Multiset.card_map, ← (IsAlgClosed.splits p).natDegree_eq_card_roots]
      exact hdegree
    simp only [Multiset.map_map] at hn
    have hn' : ‖(p.roots.map (fun z => (1 : ℂ)/(c-z))).sum‖ ≤ m.sum := by
      simpa [m, Function.comp_def] using hn
    calc
      _ ≤ m.sum := hn'
      _ ≤ (m.card : ℝ) * 50 := by simpa [nsmul_eq_mul] using hc
      _ ≤ 50000 := by exact_mod_cast Nat.mul_le_mul_right 50 hcard
  have hid := (IsAlgClosed.splits p).eval_derivative_eq_eval_mul_sum hz
  have hbound : ‖p.derivative.eval c‖ ≤ ‖p.eval c‖ * 50000 := by
    rw [hid, norm_mul]
    exact mul_le_mul_of_nonneg_left hsum (norm_nonneg _)
  have hp : 0 ≤ ‖p.eval c‖ := norm_nonneg _
  nlinarith

end BrownMol
end
