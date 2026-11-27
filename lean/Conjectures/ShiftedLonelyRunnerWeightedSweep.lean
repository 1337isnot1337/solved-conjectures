import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Data.List.Sort
import Mathlib.Tactic.Linarith

/-!
# Exact upper bounds for piecewise-linear functions

An integer event (p,d) contributes d * max(0,x-p). A sorted event sweep
checks the two endpoints of every affine piece.
-/

namespace ShiftedLonelyRunner.WeightedResidual

abbrev Event := ℤ × ℤ

noncomputable def ramp (x : ℝ) (e : Event) : ℝ :=
  max 0 (x - e.1) * e.2

noncomputable def evaluate (x : ℝ) (events : List Event) : ℝ :=
  (events.map (ramp x)).sum

private theorem evaluate_zero {x : ℝ} {events : List Event}
    (before : ∀ e ∈ events, x ≤ (e.1 : ℝ)) : evaluate x events = 0 := by
  induction events with
  | nil => simp [evaluate]
  | cons e rest ih =>
    simp only [evaluate, List.map_cons, List.sum_cons]
    rw [show ramp x e = 0 by simp [ramp, max_eq_left (sub_nonpos.mpr (before e (by simp)))],
      ← evaluate, ih (fun a ha => before a (by simp [ha])), add_zero]

/-- Current value is at the left endpoint before applying the pending ramps. -/
def scan (right bound left value slope : ℤ) : List Event → Bool
  | [] => decide (value ≤ bound ∧ value + (right - left) * slope ≤ bound)
  | (key, change) :: rest =>
    if key ≤ left then
      scan right bound left (value + (left - key) * change) (slope + change) rest
    else if right ≤ key then
      decide (value ≤ bound ∧ value + (right - left) * slope ≤ bound)
    else
      decide (value ≤ bound) &&
        scan right bound key (value + (key - left) * slope) (slope + change) rest

private theorem affine_le {left right value slope bound x : ℝ}
    (hx₁ : left ≤ x) (hx₂ : x ≤ right)
    (h₁ : value ≤ bound) (h₂ : value + (right - left) * slope ≤ bound) :
    value + (x - left) * slope ≤ bound := by
  by_cases h : 0 ≤ slope
  · have hh := mul_le_mul_of_nonneg_right (sub_le_sub_right hx₂ left) h
    linarith only [hh, h₂]
  · have hh := mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hx₁) (le_of_not_ge h)
    linarith only [hh, h₁]

private theorem scan_sound {right bound : ℤ} {events : List Event}
    (ordered : events.Pairwise (fun a b => a.1 ≤ b.1))
    {left value slope : ℤ} (checked : scan right bound left value slope events = true)
    {x : ℝ} (hx₁ : (left : ℝ) ≤ x) (hx₂ : x ≤ (right : ℝ)) :
    (value : ℝ) + (x - left) * slope + evaluate x events ≤ (bound : ℝ) := by
  induction events generalizing left value slope x with
  | nil =>
    obtain ⟨h₁, h₂⟩ :
        value ≤ bound ∧ value + (right - left) * slope ≤ bound := by simpa [scan] using checked
    have h₁r : (value : ℝ) ≤ bound := by exact_mod_cast h₁
    have h₂r : (value : ℝ) + ((right : ℝ) - left) * slope ≤ bound := by exact_mod_cast h₂
    simpa [evaluate] using affine_le hx₁ hx₂ h₁r h₂r
  | cons e rest ih =>
    obtain ⟨ahead, rest_ordered⟩ := List.pairwise_cons.mp ordered
    obtain ⟨key, change⟩ := e
    have hbefore (y : ℝ) (hy : y ≤ (key : ℝ)) : evaluate y ((key, change) :: rest) = 0 := by
      apply evaluate_zero
      intro e he
      rcases List.mem_cons.mp he with rfl | hr
      · exact hy
      · exact hy.trans (by exact_mod_cast ahead e hr)
    by_cases hkl : key ≤ left
    · have hkey : (key : ℝ) ≤ x := (by exact_mod_cast hkl : (key : ℝ) ≤ left).trans hx₁
      have h := ih rest_ordered (by simpa only [scan, ite_eq_left hkl] using checked) hx₁ hx₂
      push_cast at h
      simp only [evaluate, List.map_cons, List.sum_cons, ramp, max_eq_right (sub_nonneg.mpr hkey)]
      change _ + ((x - key) * change + evaluate x rest) ≤ _
      nlinarith only [h]
    by_cases hkr : right ≤ key
    · have hzero := hbefore x (hx₂.trans (by exact_mod_cast hkr))
      obtain ⟨h₁, h₂⟩ :
          value ≤ bound ∧ value + (right - left) * slope ≤ bound := by
        simpa [scan, hkl, hkr] using checked
      have h₁r : (value : ℝ) ≤ bound := by exact_mod_cast h₁
      have h₂r : (value : ℝ) + ((right : ℝ) - left) * slope ≤ bound := by exact_mod_cast h₂
      simpa only [hzero, add_zero] using affine_le hx₁ hx₂ h₁r h₂r
    have hchecks : value ≤ bound ∧
        scan right bound key (value + (key - left) * slope) (slope + change) rest = true := by
      simpa [scan, hkl, hkr] using checked
    by_cases hxe : x ≤ (key : ℝ)
    · have rest_zero : evaluate (key : ℝ) rest = 0 :=
        evaluate_zero (fun e he => by exact_mod_cast ahead e he)
      have hnext := ih rest_ordered hchecks.2 le_rfl
        (by exact_mod_cast (le_of_lt (lt_of_not_ge hkr)) : (key : ℝ) ≤ right)
      push_cast at hnext
      rw [rest_zero, sub_self, zero_mul, add_zero, add_zero] at hnext
      have first_le : (value : ℝ) ≤ bound := by exact_mod_cast hchecks.1
      simpa only [hbefore x hxe, add_zero] using affine_le hx₁ hxe first_le hnext
    · have hkey : (key : ℝ) ≤ x := le_of_not_ge hxe
      have h := ih rest_ordered hchecks.2 hkey hx₂
      push_cast at h
      simp only [evaluate, List.map_cons, List.sum_cons, ramp, max_eq_right (sub_nonneg.mpr hkey)]
      change _ + ((x - key) * change + evaluate x rest) ≤ _
      nlinarith only [h]

private def eventOrder (a b : Event) : Bool := decide (a.1 ≤ b.1)

def checkEvents (right base bound : ℤ) (events : List Event) : Bool :=
  scan right bound 0 base 0 (events.mergeSort eventOrder)

theorem checkEvents_sound {right base bound : ℤ} {events : List Event}
    (checked : checkEvents right base bound events = true) {x : ℝ}
    (hx₁ : 0 ≤ x) (hx₂ : x ≤ (right : ℝ)) :
    (base : ℝ) + evaluate x events ≤ (bound : ℝ) := by
  let sorted := events.mergeSort eventOrder
  have hs : sorted.Pairwise (fun a b => a.1 ≤ b.1) := by
    have h : (events.mergeSort eventOrder).Pairwise (fun a b => eventOrder a b = true) :=
      List.pairwise_mergeSort (le := eventOrder)
        (fun a b c hab hbc => by
          have h₁ : a.1 ≤ b.1 := of_decide_eq_true hab
          have h₂ : b.1 ≤ c.1 := of_decide_eq_true hbc
          exact decide_eq_true (le_trans h₁ h₂))
        (fun a b => by
          rcases le_total a.1 b.1 with h | h <;> simp [eventOrder, h]) events
    simpa [sorted, eventOrder] using h
  have hp : sorted.Perm events := List.mergeSort_perm _ _
  have heval : evaluate x sorted = evaluate x events := (hp.map (ramp x)).sum_eq
  have h := scan_sound hs checked (by exact_mod_cast hx₁ : (0 : ℤ) ≤ x) hx₂
  simpa [heval] using h

end ShiftedLonelyRunner.WeightedResidual
