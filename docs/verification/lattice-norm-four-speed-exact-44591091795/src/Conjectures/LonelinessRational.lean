import Conjectures.LonelinessContinuity

namespace Loneliness

theorem clearance_eq_member {ds : List ℕ} (hne : ds ≠ []) (t : ℝ) :
    ∃ d ∈ ds, clearance ds t = distance (d * t) := by
  induction ds with
  | nil => exact False.elim (hne rfl)
  | cons d ds ih =>
    by_cases he : ds = []
    · subst ds
      exact ⟨d, by simp, min_eq_left (distance_le_half _)⟩
    · obtain ⟨e, he, heq⟩ := ih he
      by_cases hd : distance (d * t) ≤ clearance ds t
      · exact ⟨d, by simp, min_eq_left hd⟩
      · exact ⟨e, by simp [he], (min_eq_right (le_of_not_ge hd)).trans heq⟩

theorem distance_int_div (p n : ℤ) (hn : 0 < n) :
    distance ((p : ℝ) / n) =
      ((min (p % n) (n - p % n) : ℤ) : ℝ) / n := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hfract : Int.fract ((p : ℝ) / n) = ((p % n : ℤ) : ℝ) / n := by
    have hnN : (n.toNat : ℤ) = n := Int.toNat_of_nonneg hn.le
    have hnC : (n.toNat : ℝ) = (n : ℝ) := by exact_mod_cast hnN
    have h := (Int.fract_div_intCast_eq_div_intCast_mod (m := p) (n := n.toNat) :
      Int.fract ((p : ℝ) / n.toNat) = ((p % (n.toNat : ℤ) : ℤ) : ℝ) / n.toNat)
    simpa only [hnN, hnC] using h
  rw [distance, abs_sub_round_eq_min, hfract]
  have hsub : (1 : ℝ) - ((p % n : ℤ) : ℝ) / n =
      ((n - p % n : ℤ) : ℝ) / n := by
    push_cast
    rw [sub_div, div_self hnR.ne']
  rw [hsub, Int.cast_min]
  exact min_div_div_right hnR.le _ _

end Loneliness
