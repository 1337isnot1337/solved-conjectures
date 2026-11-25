module

public import Conjectures.SobolewskiUlasExceptionCount

@[expose] public section
namespace SobolewskiUlasException

noncomputable def countError (y : ℕ) : ℤ := 6*(countExceptions y : ℤ)-(y : ℤ)

theorem countExceptions_zero : countExceptions 0=0 := by
  apply Finset.card_eq_zero.mpr
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro n hn
  obtain ⟨h,j,s,he⟩ := mem_scaledUpTo.mp hn
  have h1 := (offset_bounds s).1
  have hp : 0<baseValue s := by unfold baseValue; omega
  have hpos : 0<4^j*baseValue s := Nat.mul_pos (by positivity) hp
  omega

theorem countExceptions_nine : countExceptions 9=2 := by
  rw [countExceptions_recurrence 9]
  change (baseUpTo 9).card+countExceptions 2=2
  rw [countExceptions_recurrence 2]
  change (baseUpTo 9).card+((baseUpTo 2).card+countExceptions 0)=2
  rw [countExceptions_zero,baseUpTo_card,baseUpTo_card]
  decide

theorem baseUpTo_sixteen_add_nine (s : ℕ) (hs : (digitSum s)%2=0) :
    (baseUpTo (16*s+9)).card=2*s+2 := by
  rw [baseUpTo_card]
  rw [show (16*s+9)/8=2*s+1 by omega,show (16*s+9)%8=1 by omega]
  unfold layerOffset
  have hp : (digitSum s+1)%2≠0 := by omega
  rw [digitSum_double_add_one,ite_eq_right hp,ite_eq_left (le_rfl : (1:ℕ)≤1)]

theorem baseUpTo_four_add_two (s : ℕ) (hs : s%2=1) :
    (baseUpTo (4*s+2)).card=(s+1)/2 := by
  rw [baseUpTo_card]
  rw [show (4*s+2)%8=6 by omega]
  have h := (offset_bounds ((4*s+2)/8)).2
  rw [ite_eq_left (h.trans (by decide))]
  omega

/-- Exact logarithmic error along the repeated-base-sixteen inputs. -/
theorem repeatedNine_countError (k : ℕ) :
    countError (repeatedNine (k+1))=6*(k+1 : ℤ)-3 := by
  induction k with
  | zero =>
    change 6*(countExceptions 9 : ℤ)-9=6*(0+1)-3
    rw [countExceptions_nine]
    decide
  | succ k ih =>
    let s := repeatedNine (k+1)
    have hp : s%2=1 := repeatedNine_odd k
    have hpar : digitSum s%2=0 := by rw [repeatedNine_digitSum]; omega
    have hstep : countExceptions (16*s+9)=2*s+2+(s+1)/2+countExceptions s := by
      rw [countExceptions_recurrence (16*s+9)]
      rw [show (16*s+9)/4=4*s+2 by omega,countExceptions_recurrence (4*s+2)]
      rw [baseUpTo_sixteen_add_nine s hpar,baseUpTo_four_add_two s hp,show (4*s+2)/4=s by omega]
      omega
    have hDiv : 2*((s+1)/2)=s+1 := by omega
    have hZ : 2*(((s+1)/2 : ℕ) : ℤ)=(s : ℤ)+1 := by exact_mod_cast hDiv
    change countError (16*s+9)=6*((k+1 : ℕ)+1 : ℤ)-3
    change countError s=6*(k+1 : ℤ)-3 at ih
    unfold countError at ih ⊢
    rw [hstep]
    push_cast
    omega

theorem baseUpTo_mul_sixteen (s : ℕ) : (baseUpTo (16*s)).card=2*s := by
  rw [baseUpTo_card,show (16*s)/8=2*s by omega,show (16*s)%8=0 by omega]
  have h := (offset_bounds (2*s)).1
  rw [ite_eq_right (by omega),Nat.add_zero]

theorem baseUpTo_four_odd_even_digit_sum (s : ℕ) (hs : s%2=1) (hd : digitSum s%2=0) :
    (baseUpTo (4*s)).card=(s+1)/2 := by
  rw [baseUpTo_card,show (4*s)%8=4 by omega,show (4*s)/8=s/2 by omega]
  have hds : digitSum s=digitSum (s/2)+1 := by
    conv_lhs => rw [show s=2*(s/2)+1 by omega]
    exact digitSum_double_add_one _
  have hp : digitSum (s/2)%2≠0 := by omega
  unfold layerOffset
  rw [ite_eq_right hp,ite_eq_left (by decide : (1:ℕ)≤4)]
  omega

theorem baseUpTo_four_even (s : ℕ) (hs : s%2=0) :
    (baseUpTo (4*s)).card=s/2 := by
  rw [baseUpTo_card,show (4*s)%8=0 by omega,show (4*s)/8=s/2 by omega]
  have h := (offset_bounds (s/2)).1
  rw [ite_eq_right (by omega),Nat.add_zero]

theorem countError_mul_sixteen_odd {s : ℕ} (hs : s%2=1) (hd : digitSum s%2=0) :
    countError (16*s)=countError s+3 := by
  have hstep : countExceptions (16*s)=2*s+(s+1)/2+countExceptions s := by
    rw [countExceptions_recurrence (16*s),show (16*s)/4=4*s by omega,
      countExceptions_recurrence (4*s),baseUpTo_mul_sixteen,
      baseUpTo_four_odd_even_digit_sum s hs hd,show (4*s)/4=s by omega]
    omega
  have hDiv : 2*((s+1)/2)=s+1 := by omega
  have hZ : 2*(((s+1)/2 : ℕ) : ℤ)=(s : ℤ)+1 := by exact_mod_cast hDiv
  unfold countError
  rw [hstep]
  push_cast
  omega

theorem countError_mul_sixteen_even {s : ℕ} (hs : s%2=0) :
    countError (16*s)=countError s := by
  have hstep : countExceptions (16*s)=2*s+s/2+countExceptions s := by
    rw [countExceptions_recurrence (16*s),show (16*s)/4=4*s by omega,
      countExceptions_recurrence (4*s),baseUpTo_mul_sixteen,
      baseUpTo_four_even s hs,show (4*s)/4=s by omega]
    omega
  have hDiv : 2*(s/2)=s := by omega
  have hZ : 2*((s/2 : ℕ) : ℤ)=(s : ℤ) := by exact_mod_cast hDiv
  unfold countError
  rw [hstep]
  push_cast
  omega

/-- Appending any positive number of zero base-16 digits changes the
counting error by exactly three. -/
theorem repeatedNine_scaled_countError (k j : ℕ) :
    countError (16^(j+1)*repeatedNine (k+1))=countError (repeatedNine (k+1))+3 := by
  induction j with
  | zero =>
    rw [pow_one]
    apply countError_mul_sixteen_odd (repeatedNine_odd k)
    rw [repeatedNine_digitSum]
    omega
  | succ j ih =>
    rw [pow_succ',mul_assoc,countError_mul_sixteen_even,ih]
    rw [pow_succ',mul_assoc]
    omega

end SobolewskiUlasException
