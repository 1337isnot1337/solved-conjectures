module

public import Conjectures.SobolewskiUlasExceptionRecurrenceWindow
public import Mathlib.Analysis.SpecificLimits.Normed

@[expose] public section
namespace SobolewskiUlasException

open Filter
open scoped Topology

private theorem exists_large_window_index (d : ℕ) :
    ∃ j : ℕ,d+1≤j ∧ (253*j)^d<16^j := by
  have ht := tendsto_pow_const_div_const_pow_of_one_lt d (show (1:ℝ)<16 by norm_num)
  have hs : Tendsto (fun n : ℕ => (253:ℝ)^d*((n:ℝ)^d/(16:ℝ)^n)) atTop (𝓝 0) := by
    have hh := (tendsto_const_nhds (x := (253:ℝ)^d)).mul ht
    simpa only [mul_zero] using hh
  have he : ∀ᶠ n : ℕ in atTop, (253:ℝ)^d*((n:ℝ)^d/(16:ℝ)^n)<1 :=
    hs.eventually (gt_mem_nhds (show (0:ℝ)<1 by norm_num))
  obtain ⟨m,hm⟩ := eventually_atTop.mp he
  let j := max m (d+1)
  have hlt := hm j (le_max_left _ _)
  rw [← mul_div_assoc,← mul_pow] at hlt
  have ht := (div_lt_iff₀ (pow_pos (show (0:ℝ)<16 by norm_num) j)).mp hlt
  rw [one_mul] at ht
  exact ⟨j,le_max_right _ _,by exact_mod_cast ht⟩

private theorem remainder_small_window (d j : ℕ) (hJ : d+1≤j) :
    ∀ k<16^j+d, -((24*j+102 : ℕ) : ℤ)≤remainder (k+2) ∧
      remainder (k+2)≤((24*j+102 : ℕ) : ℤ) := by
  intro k hk
  have hN : d+2≤16^j := by
    have h₁ : j<(2:ℕ)^j := Nat.lt_two_pow_self
    have h₂ : (2:ℕ)^j≤16^j := Nat.pow_le_pow_left (by decide) _
    omega
  have hP : 1≤16^j := by omega
  have he : 20*(12*(k+2)+4)≤16^(j+3) := by
    rw [pow_add]
    norm_num
    omega
  have hlog := Nat.log_mono_right (b := 16) he
  rw [Nat.log_pow (by decide)] at hlog
  have hCut : repeatedDigitCut (k+2)≤j+4 := by unfold repeatedDigitCut; omega
  have hb := remainder_logarithmic_bound (k := k+2) (by omega)
  push_cast
  omega

/-- The exact normalized enumeration is not regular in any positive
power of two. The proof uses integer states in a logarithmic-size
window, so no separate theorem on roots of recurrences is needed. -/
theorem normalized_exceptions_not_regular_power_two (a : ℕ) (ha : 0<a) :
    ¬IsRegular (2^a) (fun k => (nthException k : ℤ)) := by
  intro h
  have hr := actual_regular16_implies_remainder_recurrent
    (regular_power_two_implies_regular16 ha h)
  obtain ⟨A,hA⟩ := monicRecurrence_has_linearRecurrence hr
  let d := A.order
  obtain ⟨j,hj,hexp⟩ := exists_large_window_index d
  let L := 24*j+102
  let N := 16^j
  have hN : (2*L+1)^A.order<N := by
    have hL : 2*L+1≤253*j := by dsimp [L]; omega
    exact lt_of_le_of_lt (Nat.pow_le_pow_left hL d) hexp
  have hb := linearRecurrence_bounded_of_large_window A hA N L hN
    (remainder_small_window d j hj)
  let k := repeatedIndex (L+2)
  have hk : L+2<k := repeatedIndex_gt (by omega)
  have hl := remainder_at_repeatedIndex_lower (J := L+2) (by omega)
  change ((L+2 : ℕ) : ℤ)+3≤remainder k at hl
  have ht := (hb (k-2)).2
  rw [Nat.sub_add_cancel (by omega : 2≤k)] at ht
  push_cast at hl
  omega

end SobolewskiUlasException
