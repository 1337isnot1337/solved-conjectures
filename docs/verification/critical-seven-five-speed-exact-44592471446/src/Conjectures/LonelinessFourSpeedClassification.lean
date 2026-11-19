import Conjectures.LonelinessPlaneGap
import Conjectures.LonelinessNormalization

/-! Gcd normalization and rescaling transfer the primitive four-speed
classification to the original unrestricted list statement. -/

namespace Loneliness.CoordinateSubspace

open Normalization

/-- A primitive tuple classification gives the exact original list theorem,
including its positive dilation factor and its permutation conclusion. -/
theorem four_speed_gap_of_primitive_classification
    (hclass : ∀ v : Fin 4 → ℕ, (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      value (List.ofFn v) < (2/9 : ℝ) →
      (List.ofFn v).Perm [1,2,3,4] ∨ (List.ofFn v).Perm [1,3,4,7]) :
    FourSpeedGap := by
  intro ds hlen _hdistinct hpositive hlow
  have hne : ds ≠ [] := by intro h; simp [h] at hlen
  have hnormalized_length : (normalize ds).length = 4 := by
    rw [normalize_length, hlen]
  let v : Fin 4 → ℕ := fun i => (normalize ds).get (Fin.cast hnormalized_length.symm i)
  have hv : List.ofFn v = normalize ds := by
    exact (List.ofFn_congr hnormalized_length (normalize ds).get).symm.trans
      (List.ofFn_get (normalize ds))
  have hmem (i : Fin 4) : v i ∈ normalize ds := by
    rw [← hv]
    exact List.mem_ofFn.mpr ⟨i,rfl⟩
  have hvpositive : ∀ i, 0 < v i := fun i =>
    normalize_positive ds hpositive (v i) (hmem i)
  have hvprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1 := by
    change gcd (List.ofFn v) = 1
    rw [hv]
    exact normalize_primitive ds hne hpositive
  have hvlow : value (List.ofFn v) < (2/9 : ℝ) := by
    rw [hv, value_normalize ds hne hpositive]
    exact hlow
  have hcases := hclass v hvpositive hvprimitive hvlow
  rw [hv] at hcases
  refine ⟨gcd ds, Nat.succ_le_of_lt (gcd_pos hne hpositive), ?_⟩
  rcases hcases with h | h
  · left
    have hscaled := h.map (fun a => gcd ds * a)
    rwa [rescale_normalize] at hscaled
  · right
    have hscaled := h.map (fun a => gcd ds * a)
    rwa [rescale_normalize] at hscaled

/-- Separate interfaces for the numerical cutoff and the finite certificate.
Both premises are mathematical propositions; this lemma makes no claim that
either has been established. -/
theorem four_speed_gap_of_bounded_classification
    (hcutoff : ∀ v : Fin 4 → ℕ, (∀ i, 0 < v i) →
      (List.ofFn v).foldr Nat.gcd 0 = 1 →
      value (List.ofFn v) < (2/9 : ℝ) → ∀ i, v i ≤ 5832)
    (hfinite : ∀ v : Fin 4 → ℕ, (∀ i, 0 < v i) → (∀ i, v i ≤ 5832) →
      gcd (List.ofFn v) = 1 → value (List.ofFn v) < (2/9 : ℝ) →
      (List.ofFn v).Perm [1,2,3,4] ∨ (List.ofFn v).Perm [1,3,4,7]) :
    FourSpeedGap := by
  apply four_speed_gap_of_primitive_classification
  intro v hpositive hprimitive hlow
  exact hfinite v hpositive (hcutoff v hpositive hprimitive hlow) hprimitive hlow

end Loneliness.CoordinateSubspace
