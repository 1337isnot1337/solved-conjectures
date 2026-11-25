module

public import Conjectures.SobolewskiUlasExceptionErrorBounds
public import Mathlib.Data.Nat.Log

@[expose] public section
namespace SobolewskiUlasException

theorem repeatedNine_lt_power (k : ℕ) : repeatedNine k<16^k := by
  have hp := repeatedNine_closed_form k
  have hz : 0<(16:ℕ)^k := by positivity
  omega

theorem repeatedNine_mod_power {k j : ℕ} (hjk : j≤k) :
    repeatedNine k%16^j=repeatedNine j := by
  have hsplit := repeatedNine_add (k-j) j
  rw [Nat.sub_add_cancel hjk] at hsplit
  rw [hsplit,Nat.mul_add_mod_self_left,Nat.mod_eq_of_lt (repeatedNine_lt_power j)]

theorem div_eq_when_within_digit_room {x y b d : ℕ} (hb : 0<b)
    (h₁ : x≤y+d) (h₂ : y≤x+d) (h₃ : d≤y%b) (h₄ : y%b+d<b) :
    x/b=y/b := by
  have h := Nat.mod_add_div y b
  have hl : b*(y/b)≤x := by omega
  have hh : x<b*(y/b+1) := by rw [Nat.mul_succ]; omega
  apply le_antisymm
  · apply Nat.lt_succ_iff.mp
    exact (Nat.div_lt_iff_lt_mul hb).mpr (by simpa only [Nat.mul_comm] using hh)
  · exact (Nat.le_div_iff_mul_le hb).mpr (by simpa only [Nat.mul_comm] using hl)

/-- The geometric pattern of digit 9 leaves enough room in every
nonempty trailing block that bounded perturbations cannot carry into
the high prefix. -/
theorem same_repeat_prefix_of_room {k j x d : ℕ}
    (hd : 20*(d+1)≤16^j)
    (h₁ : x≤repeatedNine k+d) (h₂ : repeatedNine k≤x+d) :
    x/16^j=repeatedNine k/16^j := by
  have hb : 0<(16:ℕ)^j := by positivity
  by_cases hjk : j≤k
  · apply div_eq_when_within_digit_room hb h₁ h₂
    · rw [repeatedNine_mod_power hjk]
      have he := repeatedNine_closed_form j
      omega
    · rw [repeatedNine_mod_power hjk]
      have he := repeatedNine_closed_form j
      omega
  · have hkj : k+1≤j := by omega
    have hp := Nat.pow_le_pow_right (show 0<(16:ℕ) by decide) hkj
    rw [pow_succ'] at hp
    have hlt := repeatedNine_lt_power k
    have hy : repeatedNine k<16^j := by omega
    have hx : x<16^j := by omega
    rw [Nat.div_eq_of_lt hx,Nat.div_eq_of_lt hy]

theorem nth_repeatedIndex_lt_power {k : ℕ} (hk : 0<k) :
    nthException (repeatedIndex k)<16^k := by
  have hpow : 16≤16^k := by
    simpa only [pow_one] using Nat.pow_le_pow_right (show 0<(16:ℕ) by decide) hk
  have h9 : 9≤repeatedNine k := by
    obtain ⟨j,rfl⟩ : ∃ j,k=j+1 := ⟨k-1,by omega⟩
    rw [repeatedNine]
    omega
  have hn := repeatedIndex_exact hk
  have he := repeatedNine_closed_form k
  have hpos : 0<repeatedIndex k := by omega
  obtain ⟨n,hn'⟩ : ∃ n,repeatedIndex k=n+1 := ⟨repeatedIndex k-1,by omega⟩
  have h := nthException_le_linear n
  rw [← hn'] at h
  omega

theorem nth_repeatedIndex_distance {k : ℕ} (hk : 0<k) :
    nthException (repeatedIndex k)≤repeatedNine k+(12*k+3) ∧
      repeatedNine k≤nthException (repeatedIndex k)+(12*k+3) := by
  let g := nthException (repeatedIndex k)
  have hpow : g<4^(2*k) := by
    rw [pow_mul]
    exact nth_repeatedIndex_lt_power hk
  have hErr := countError_bounded_by_power g (2*k) hpow
  have hc : countExceptions g=repeatedIndex k := countExceptions_nth _
  have hx := repeatedIndex_exact hk
  unfold countError at hErr
  rw [hc] at hErr
  push_cast at hErr
  omega

def repeatedDigitCut (k : ℕ) : ℕ := Nat.log 16 (20*(12*k+4))+1

/-- Explicit logarithmic sandwich for the exact remainder, with no
asymptotic takeovers or unproved estimates. -/
theorem remainder_logarithmic_bound {k : ℕ} (hk : 0<k) :
    6-24*(repeatedDigitCut k : ℤ)≤remainder k ∧
      remainder k≤6+24*(repeatedDigitCut k : ℤ) := by
  have hp : 20*((12*k+3)+1)≤16^repeatedDigitCut k := by
    have h := Nat.lt_pow_succ_log_self (b := 16) (by decide) (20*(12*k+4))
    exact h.le
  obtain ⟨h₁,h₂⟩ := nth_repeatedIndex_distance hk
  exact remainder_bound_of_same_prefix hk (same_repeat_prefix_of_room hp h₁ h₂)

end SobolewskiUlasException
