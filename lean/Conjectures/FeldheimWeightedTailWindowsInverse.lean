import Mathlib.Analysis.Convex.Slope
import Mathlib.Analysis.Convex.Continuous
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Tactic

/-!
# Feldheim–Feldheim's weighted tail conjecture

Actual inverse unit levels of an arbitrary convex function tending to
infinity. Continuity, eventual strict increase, unboundedness of the
inverse levels, and decreasing positive increments are proved here.
-/

namespace Conjectures.FeldheimWeightedTail

open Set Filter

theorem window_inverse_levels {h : ℝ → ℝ} {T : ℝ}
    (hc : ConvexOn ℝ (Ici T) h) (htop : Tendsto h atTop atTop) (M : ℝ) :
    ∃ (a : ℝ) (q : ℕ → ℝ), max T M < a ∧
      StrictMonoOn h (Ici a) ∧
      (∀ n, a ≤ q n) ∧ (∀ n, h (q n) = h a + n) ∧
      StrictMono q ∧ Tendsto q atTop atTop ∧
      Antitone (fun n => q (n + 1) - q n) := by
  obtain ⟨a, ha, hha⟩ :=
    ((eventually_gt_atTop (max T M)).and
      (htop.eventually (eventually_gt_atTop (h T)))).exists
  have hTa : T < a := (le_max_left T M).trans_lt ha
  have hstrict : StrictMonoOn h (Ici a) :=
    (hc.strictMonoOn (show T ∈ Ici T from self_mem_Ici) hTa hha).mono
      (fun _ hx => ⟨hTa.le.trans hx, hx⟩)
  have hcont : ContinuousOn h (Ici a) := by
    have h := hc.continuousOn_interior
    rw [interior_Ici] at h
    exact h.mono (fun _ hx => hTa.trans_le hx)
  have hex : ∀ n : ℕ, ∃ x : ℝ, a ≤ x ∧ h x = h a + n := by
    intro n
    exact intermediate_value_Ici hcont htop
      (show h a ≤ h a + (n : ℝ) from le_add_of_nonneg_right (Nat.cast_nonneg n))
  choose q hqa hqv using hex
  have hq : StrictMono q := by
    intro i j hij
    by_contra hnot
    have hh := hstrict.monotoneOn (hqa j) (hqa i) (le_of_not_gt hnot)
    rw [hqv i, hqv j] at hh
    have hcij : (i : ℝ) < j := by exact_mod_cast hij
    linarith
  have hqtop : Tendsto q atTop atTop := by
    apply tendsto_atTop.2
    intro B
    obtain ⟨N, hN⟩ := exists_nat_gt (h (max a B) - h a)
    refine eventually_atTop.2 ⟨N, ?_⟩
    intro n hn
    by_contra hnot
    have hqn : q n ≤ max a B := (le_of_lt (lt_of_not_ge hnot)).trans (le_max_right a B)
    have hh := hstrict.monotoneOn (hqa n) (le_max_left a B) hqn
    rw [hqv n] at hh
    have hcast : (N : ℝ) ≤ n := by exact_mod_cast hn
    linarith
  have hinc : Antitone (fun n => q (n + 1) - q n) := by
    apply antitone_nat_of_succ_le
    intro n
    have hn₀ : q n < q (n + 1) := hq (by omega)
    have hn₁ : q (n + 1) < q (n + 1 + 1) := hq (by omega)
    have hs := hc.slope_mono_adjacent
      (hTa.le.trans (hqa n)) (hTa.le.trans (hqa (n + 1 + 1))) hn₀ hn₁
    have he₀ : h (q (n + 1)) - h (q n) = 1 := by
      rw [hqv (n + 1), hqv n]
      push_cast
      ring
    have he₁ : h (q (n + 1 + 1)) - h (q (n + 1)) = 1 := by
      rw [hqv (n + 1 + 1), hqv (n + 1)]
      push_cast
      ring
    rw [he₀, he₁] at hs
    exact (one_div_le_one_div (sub_pos.mpr hn₀) (sub_pos.mpr hn₁)).mp hs
  exact ⟨a, q, ha, hstrict, hqa, hqv, hq, hqtop, hinc⟩

end Conjectures.FeldheimWeightedTail
