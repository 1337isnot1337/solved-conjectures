import Mathlib.Algebra.Order.Round
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.LinearCombination

/-! An analytic reduction of the three-speed problem `{1,k,k+s}`, for odd
`s=2*l-1`, to the two nearest integers to `l*(k-1)/(2*l+1)`. -/
namespace DistanceGraph

theorem phase_strip (l k s : ℤ) (hl : 2 ≤ l) (hs : s = 2*l-1)
    (δ t : ℝ) (htlo : δ ≤ t) (hthi : t ≤ 1/2)
    (hδ : ((l : ℝ)-1)/s < δ)
    (hklo : δ ≤ Int.fract ((k : ℝ)*t))
    (hkhi : Int.fract ((k : ℝ)*t) ≤ 1-δ)
    (hkslo : δ ≤ Int.fract (((k+s : ℤ) : ℝ)*t))
    (hkshi : Int.fract (((k+s : ℤ) : ℝ)*t) ≤ 1-δ) :
    ∃ j : ℤ, (j : ℝ)+δ ≤ (k : ℝ)*t ∧
      (((k+s : ℤ) : ℝ)*t) ≤ (j : ℝ)+l-δ := by
  have hsZ : 0 < s := by omega
  have hsR : (0 : ℝ) < s := by exact_mod_cast hsZ
  have hlR : (2 : ℝ) ≤ l := by exact_mod_cast hl
  have hsR_eq : (s : ℝ) = 2*(l : ℝ)-1 := by exact_mod_cast hs
  have hδbase : (l : ℝ)-1 < δ*(s : ℝ) := (div_lt_iff₀ hsR).mp hδ
  have hquarter : 1/4 < δ := by
    by_contra! h
    have hh := mul_le_mul_of_nonneg_right h hsR.le
    nlinarith
  have hstlo : (l : ℝ)-1 < (s : ℝ)*t := by
    have hh := mul_le_mul_of_nonneg_left htlo hsR.le
    nlinarith
  have hsthi : (s : ℝ)*t ≤ (l : ℝ)-1/2 := by
    have hh := mul_le_mul_of_nonneg_left hthi hsR.le
    nlinarith
  let j : ℤ := ⌊(k : ℝ)*t⌋
  let n : ℤ := ⌊((k+s : ℤ) : ℝ)*t⌋-j
  have hphase : (s : ℝ)*t = (n : ℝ)+Int.fract (((k+s : ℤ) : ℝ)*t)-
      Int.fract ((k : ℝ)*t) := by
    simp only [n,j,Int.fract]
    push_cast
    ring
  have hnloR : ((l-2 : ℤ) : ℝ) < (n : ℝ) := by push_cast; nlinarith
  have hnhiR : (n : ℝ) < l := by nlinarith
  have hnlo : l-2 < n := by exact_mod_cast hnloR
  have hnhi : n < l := by exact_mod_cast hnhiR
  have hneq : n = l-1 := by omega
  have hneqR : ((⌊((k+s : ℤ) : ℝ)*t⌋ : ℤ) : ℝ)-(j : ℝ) = (l : ℝ)-1 := by
    exact_mod_cast hneq
  refine ⟨j, ?_, ?_⟩
  · simp only [Int.fract] at hklo
    change (⌊(k : ℝ)*t⌋ : ℝ)+δ ≤ (k : ℝ)*t
    linarith
  · simp only [Int.fract] at hkshi
    linarith

theorem phase_fraction_bounds (l k s j : ℤ) (hk : 0 < k) (hs : 0 < s)
    (δ t : ℝ) (ht : δ ≤ t)
    (hlo : (j : ℝ)+δ ≤ (k : ℝ)*t)
    (hhi : (((k+s : ℤ) : ℝ)*t) ≤ (j : ℝ)+l-δ) :
    δ ≤ ((j+l : ℤ) : ℝ)/(k+s+1 : ℤ) ∧
      δ ≤ ((k*l-s*j : ℤ) : ℝ)/(2*k+s : ℤ) := by
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have hsR : (0 : ℝ) < s := by exact_mod_cast hs
  have hP : (0 : ℝ) < (k+s+1 : ℤ) := by push_cast; linarith
  have hQ : (0 : ℝ) < (2*k+s : ℤ) := by push_cast; linarith
  constructor
  · apply (le_div_iff₀ hP).mpr
    have hh := mul_le_mul_of_nonneg_left ht (show (0 : ℝ) ≤ k+s by linarith)
    push_cast at hhi ⊢
    nlinarith
  · apply (le_div_iff₀ hQ).mpr
    have hh := mul_le_mul_of_nonneg_left hlo (show (0 : ℝ) ≤ k+s by linarith)
    have hh' := mul_le_mul_of_nonneg_left hhi hkR.le
    push_cast at hh' ⊢
    nlinarith

/-- Only the integers on either side of the intersection of the two affine
bounds can give the largest possible minimum. -/
theorem integer_grid_bound (l k s n j : ℤ) (hk : 0 < k) (hs : 0 < s)
    (δ : ℝ)
    (hleft : δ ≤ ((j+l : ℤ) : ℝ)/(k+s+1 : ℤ))
    (hright : δ ≤ ((k*l-s*j : ℤ) : ℝ)/(2*k+s : ℤ)) :
    δ ≤ max (((n+l : ℤ) : ℝ)/(k+s+1 : ℤ))
      (((k*l-s*(n+1) : ℤ) : ℝ)/(2*k+s : ℤ)) := by
  have hP : (0 : ℝ) < (k+s+1 : ℤ) := by exact_mod_cast (by omega : 0 < k+s+1)
  have hQ : (0 : ℝ) < (2*k+s : ℤ) := by exact_mod_cast (by omega : 0 < 2*k+s)
  by_cases hj : j ≤ n
  · apply le_trans hleft
    apply le_trans ?_ (le_max_left _ _)
    apply (div_le_div_iff_of_pos_right hP).mpr
    exact_mod_cast (by omega : j+l ≤ n+l)
  · apply le_trans hright
    apply le_trans ?_ (le_max_right _ _)
    apply (div_le_div_iff_of_pos_right hQ).mpr
    have hh := mul_nonneg hs.le (show 0 ≤ j-(n+1) by omega)
    exact_mod_cast (by nlinarith : k*l-s*j ≤ k*l-s*(n+1))

theorem grid_cross_identity (l k s n u : ℤ) (hs : s = 2*l-1)
    (hdiv : l*(k-1) = (s+2)*n+u) :
    (n+l)*(2*k+s)-(k*l-s*(n+1))*(k+s+1) = (s-u)*k+s*(s+1-u) := by
  subst s
  linear_combination -(k+(2*l-1))*hdiv

theorem grid_small_remainder (l k s n u : ℤ) (hk : 0 < k) (hs0 : 0 < s)
    (hs : s = 2*l-1) (hdiv : l*(k-1) = (s+2)*n+u) (hu : u ≤ s) :
    max (((n+l : ℤ) : ℝ)/(k+s+1 : ℤ))
      (((k*l-s*(n+1) : ℤ) : ℝ)/(2*k+s : ℤ)) =
        ((n+l : ℤ) : ℝ)/(k+s+1 : ℤ) := by
  apply max_eq_left
  have hP : (0 : ℝ) < (k+s+1 : ℤ) := by exact_mod_cast (by omega : 0 < k+s+1)
  have hQ : (0 : ℝ) < (2*k+s : ℤ) := by exact_mod_cast (by omega : 0 < 2*k+s)
  apply (div_le_div_iff₀ hQ hP).mpr
  have hid := grid_cross_identity l k s n u hs hdiv
  have h1 := mul_nonneg (show 0 ≤ s-u by omega) hk.le
  have h2 := mul_nonneg hs0.le (show 0 ≤ s+1-u by omega)
  have hh : (k*l-s*(n+1))*(k+s+1) ≤ (n+l)*(2*k+s) := by omega
  exact_mod_cast hh

theorem grid_large_remainder (l k s n : ℤ) (hk : 0 < k) (hs0 : 0 < s)
    (hs : s = 2*l-1) (hdiv : l*(k-1) = (s+2)*n+(s+1)) :
    max (((n+l : ℤ) : ℝ)/(k+s+1 : ℤ))
      (((k*l-s*(n+1) : ℤ) : ℝ)/(2*k+s : ℤ)) =
        ((k*l-s*(n+1) : ℤ) : ℝ)/(2*k+s : ℤ) := by
  apply max_eq_right
  have hP : (0 : ℝ) < (k+s+1 : ℤ) := by exact_mod_cast (by omega : 0 < k+s+1)
  have hQ : (0 : ℝ) < (2*k+s : ℤ) := by exact_mod_cast (by omega : 0 < 2*k+s)
  apply (div_le_div_iff₀ hP hQ).mpr
  have hid := grid_cross_identity l k s n (s+1) hs hdiv
  have hh : (n+l)*(2*k+s) ≤ (k*l-s*(n+1))*(k+s+1) := by nlinarith
  exact_mod_cast hh

end DistanceGraph
