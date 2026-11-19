import Conjectures.DistanceGraphArithmetic

/-! Global upper bounds for the fractional-part constraints of odd-gap
three-speed sets. The two branches are controlled by explicit size bounds. -/
namespace DistanceGraph

theorem small_fractional_upper (l k s n u : ℤ) (hl : 2 ≤ l) (hk : 0 < k)
    (hs : s = 2*l-1) (hdiv : l*(k-1) = (s+2)*n+u)
    (hus : u ≤ s) (hsize : s*u ≤ k+s+1)
    (δ t : ℝ) (htlo : δ ≤ t) (hthi : t ≤ 1/2)
    (hklo : δ ≤ Int.fract ((k : ℝ)*t))
    (hkhi : Int.fract ((k : ℝ)*t) ≤ 1-δ)
    (hkslo : δ ≤ Int.fract (((k+s : ℤ) : ℝ)*t))
    (hkshi : Int.fract (((k+s : ℤ) : ℝ)*t) ≤ 1-δ) :
    δ ≤ ((n+l : ℤ) : ℝ)/(k+s+1 : ℤ) := by
  have hs0 : 0 < s := by omega
  by_cases hδ : δ ≤ ((l : ℝ)-1)/s
  · exact hδ.trans (small_value_above_phase_threshold l k s n u hl hk hs hdiv hsize)
  · have hδ' : ((l : ℝ)-1)/s < δ := lt_of_not_ge hδ
    obtain ⟨j,hlo,hhi⟩ := phase_strip l k s hl hs δ t htlo hthi hδ' hklo hkhi hkslo hkshi
    obtain ⟨hleft,hright⟩ := phase_fraction_bounds l k s j hk hs0 δ t htlo hlo hhi
    have hh := integer_grid_bound l k s n j hk hs0 δ hleft hright
    rwa [grid_small_remainder l k s n u hk hs0 hs hdiv hus] at hh

theorem large_fractional_upper (l k s n : ℤ) (hl : 2 ≤ l) (hk : 0 < k)
    (hs : s = 2*l-1) (hdiv : l*(k-1) = (s+2)*n+(s+1))
    (hsize : s*s ≤ 2*k+s)
    (δ t : ℝ) (htlo : δ ≤ t) (hthi : t ≤ 1/2)
    (hklo : δ ≤ Int.fract ((k : ℝ)*t))
    (hkhi : Int.fract ((k : ℝ)*t) ≤ 1-δ)
    (hkslo : δ ≤ Int.fract (((k+s : ℤ) : ℝ)*t))
    (hkshi : Int.fract (((k+s : ℤ) : ℝ)*t) ≤ 1-δ) :
    δ ≤ ((k*l-s*(n+1) : ℤ) : ℝ)/(2*k+s : ℤ) := by
  have hs0 : 0 < s := by omega
  by_cases hδ : δ ≤ ((l : ℝ)-1)/s
  · exact hδ.trans (large_value_above_phase_threshold l k s n hl hk hs hdiv hsize)
  · have hδ' : ((l : ℝ)-1)/s < δ := lt_of_not_ge hδ
    obtain ⟨j,hlo,hhi⟩ := phase_strip l k s hl hs δ t htlo hthi hδ' hklo hkhi hkslo hkshi
    obtain ⟨hleft,hright⟩ := phase_fraction_bounds l k s j hk hs0 δ t htlo hlo hhi
    have hh := integer_grid_bound l k s n j hk hs0 δ hleft hright
    rwa [grid_large_remainder l k s n hk hs0 hs hdiv] at hh

end DistanceGraph
