module

public import Conjectures.SobolewskiUlasExceptionUnbounded

@[expose] public section
namespace SobolewskiUlasException

theorem countError_zero : countError 0=0 := by
  simp [countError,countExceptions_zero]

/-- Removing two low binary digits changes the count error by at most six. -/
theorem countError_step (y : ℕ) :
    -6≤countError y-countError (y/4) ∧ countError y-countError (y/4)≤6 := by
  have he : countError y-countError (y/4) =
      6*((baseUpTo y).card : ℤ)-(y : ℤ)+((y/4 : ℕ) : ℤ) := by
    unfold countError
    rw [countExceptions_recurrence y]
    push_cast
    ring
  rw [he,baseUpTo_card]
  push_cast
  split_ifs <;> omega

/-- A precise finite-logarithmic bound with a power-of-four witness. -/
theorem countError_bounded_by_power (y l : ℕ) (h : y<4^l) :
    -6*(l : ℤ)≤countError y ∧ countError y≤6*(l : ℤ) := by
  induction l generalizing y with
  | zero =>
    have hy : y=0 := by simpa using h
    simp [hy,countError_zero]
  | succ l ih =>
    have ht : y/4<4^l := (Nat.div_lt_iff_lt_mul (by decide : 0<4)).mpr
      (by simpa only [pow_succ] using h)
    have hw := ih (y/4) ht
    have hs := countError_step y
    constructor <;> push_cast <;> omega

/-- Equal high base-four prefixes leave only a bounded number of low
digit contributions to the difference of the exact counting errors. -/
theorem countError_same_high_prefix (x y l : ℕ) (h : x/4^l=y/4^l) :
    -12*(l : ℤ)≤countError x-countError y ∧ countError x-countError y≤12*(l : ℤ) := by
  induction l generalizing x y with
  | zero =>
    have he : x=y := by simpa using h
    simp [he]
  | succ l ih =>
    have h' : x/4/4^l=y/4/4^l := by
      simpa only [Nat.div_div_eq_div_mul,← pow_succ'] using h
    have hi := ih (x/4) (y/4) h'
    have hx := countError_step x
    have hy := countError_step y
    constructor <;> push_cast <;> omega

theorem remainder_eq_countError_diff {k : ℕ} (hk : 0<k) :
    remainder k=6+countError (repeatedNine k)-countError (nthException (repeatedIndex k)) := by
  obtain ⟨j,rfl⟩ : ∃ j,k=j+1 := ⟨k-1,by omega⟩
  have hN := repeatedIndex_exact (Nat.succ_pos j)
  have hCount := countExceptions_nth (repeatedIndex (j+1))
  have hc := repeatedNine_countError j
  rw [hc]
  unfold countError remainder
  rw [hCount]
  have hc' : (repeatedNine (j+1) : ℤ)+3=6*(repeatedIndex (j+1) : ℤ) := by
    exact_mod_cast hN
  push_cast
  omega

theorem remainder_bound_of_same_prefix {k j : ℕ} (hk : 0<k)
    (hq : nthException (repeatedIndex k)/16^j=repeatedNine k/16^j) :
    6-24*(j : ℤ)≤remainder k ∧ remainder k≤6+24*(j : ℤ) := by
  have hp : (4:ℕ)^(2*j)=16^j := by rw [pow_mul]; rfl
  have h := countError_same_high_prefix _ _ (2*j) (by simpa only [hp] using hq)
  rw [remainder_eq_countError_diff hk]
  push_cast at h
  omega

end SobolewskiUlasException
