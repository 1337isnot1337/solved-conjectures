import Conjectures.LonelinessTwoInsertionsShift
import Conjectures.LonelinessTwoInsertionsSmall

/-! The full two-speed interval theorem. Both added positive integer speeds
are unrestricted, and the time is a real number in the prescribed interval. -/

namespace Loneliness.TwoInsertions

theorem two_speed_window_sorted (p b c : ℕ) (hp : 3 ≤ p) (hb : 0 < b)
    (hbc : b ≤ c) : TwoSpeedWindow p b c := by
  by_cases hsmallp : p ≤ 10
  · by_cases hsmallb : b ≤ smallBound p
    · exact small_bounded_window p b c hp hsmallp hb hsmallb hbc
    · exact window_above_small_bound p b c hp hb hbc (by omega)
  · exact large_parameter_window p b c (by omega) hb hbc

theorem two_speed_window (p b c : ℕ) (hp : 3 ≤ p) (hb : 0 < b) (hc : 0 < c) :
    ∃ t ∈ Set.Icc (1/(p+2 : ℝ)) (1/(p : ℝ)),
      1/(p+2 : ℝ) ≤ distance ((b : ℝ)*t) ∧
      1/(p+2 : ℝ) ≤ distance ((c : ℝ)*t) := by
  rcases le_total b c with hbc | hcb
  · exact two_speed_window_sorted p b c hp hb hbc
  · exact twoSpeedWindow_symm (two_speed_window_sorted p c b hp hc hcb)

theorem insertion_for_interval_base (p b c : ℕ) (ds : List ℕ)
    (hp : 3 ≤ p) (hb : 0 < b) (hc : 0 < c)
    (hbase : ∀ d ∈ ds, ∀ t ∈ window p, 1/(p+2 : ℝ) ≤ distance ((d : ℝ)*t)) :
    ∃ t ∈ window p, 1/(p+2 : ℝ) ≤ clearance (b::c::ds) t := by
  obtain ⟨t, ht, hbt, hct⟩ := two_speed_window p b c hp hb hc
  refine ⟨t, ht, le_clearance ?_ ?_⟩
  · apply one_div_le_one_div_of_le (by norm_num)
    have hpR : (3 : ℝ) ≤ p := by exact_mod_cast hp
    linarith
  · intro d hd
    rcases List.mem_cons.mp hd with rfl | hd
    · exact hbt
    rcases List.mem_cons.mp hd with rfl | hd
    · exact hct
    · exact hbase d hd t ht

theorem insertion_value_lower (p b c : ℕ) (ds : List ℕ)
    (hp : 3 ≤ p) (hb : 0 < b) (hc : 0 < c)
    (hbase : ∀ d ∈ ds, ∀ t ∈ window p, 1/(p+2 : ℝ) ≤ distance ((d : ℝ)*t)) :
    1/(p+2 : ℝ) ≤ value (b::c::ds) := by
  obtain ⟨t, _, ht⟩ := insertion_for_interval_base p b c ds hp hb hc hbase
  exact ht.trans (CriticalFamilies.le_value_any _ t)

end Loneliness.TwoInsertions
