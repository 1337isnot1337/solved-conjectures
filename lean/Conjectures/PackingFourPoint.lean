import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-!
Local obstructions for translates of `{0,a,b,a+b}`.  The center indicator is
integer-valued and nonnegative; exact coverage or disjointness forces every
relevant value to be a bit.  Thus these statements also apply to multisets of
centers, and do not hide an assumption about the indicator.
-/
namespace PackingFourPoint

def horizontal (x : ℤ → ℤ) (a t : ℤ) : ℤ := x t + x (t-a)
def vertical (x : ℤ → ℤ) (b t : ℤ) : ℤ := x t + x (t-b)
def multiplicity (x : ℤ → ℤ) (a b t : ℤ) : ℤ :=
  x t + x (t-a) + x (t-b) + x (t-a-b)

theorem multiplicity_horizontal (x : ℤ → ℤ) (a b t : ℤ) :
    multiplicity x a b t = horizontal x a t + horizontal x a (t-b) := by
  simp only [multiplicity, horizontal]
  rw [show t-b-a = t-a-b by ring]
  ring

theorem multiplicity_vertical (x : ℤ → ℤ) (a b t : ℤ) :
    multiplicity x a b t = vertical x b t + vertical x b (t-a) := by
  simp only [multiplicity, vertical]
  ring

theorem horizontal_nonneg (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (a t : ℤ) :
    0 ≤ horizontal x a t := add_nonneg (hx _) (hx _)

theorem vertical_nonneg (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (b t : ℤ) :
    0 ≤ vertical x b t := add_nonneg (hx _) (hx _)

theorem horizontal_pos_forces_vertical_eq
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (a b t : ℤ)
    (hy : 0 < horizontal x a t)
    (hm : multiplicity x a b t ≤ 1)
    (hmb : multiplicity x a b (t+b) ≤ 1) :
    vertical x b t = vertical x b (t+b) := by
  simp only [horizontal, vertical, multiplicity] at *
  simp only [add_sub_cancel_right] at *
  rw [show t+b-a-b = t-a by ring] at hmb
  have h0 := hx t
  have h1 := hx (t-a)
  have h2 := hx (t-b)
  have h3 := hx (t-a-b)
  have h4 := hx (t+b)
  have h5 := hx (t+b-a)
  omega

theorem vertical_pos_forces_horizontal_eq
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (a b t : ℤ)
    (hz : 0 < vertical x b t)
    (hm : multiplicity x a b t ≤ 1)
    (hma : multiplicity x a b (t+a) ≤ 1) :
    horizontal x a t = horizontal x a (t+a) := by
  simp only [horizontal, vertical, multiplicity] at *
  simp only [add_sub_cancel_right] at *
  have h0 := hx t
  have h1 := hx (t-a)
  have h2 := hx (t-b)
  have h3 := hx (t-a-b)
  have h4 := hx (t+a)
  have h5 := hx (t+a-b)
  omega

theorem two_flags_force_center
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (a b t : ℤ)
    (hm : multiplicity x a b t = 1)
    (hy : horizontal x a t = 1) (hz : vertical x b t = 1) : x t = 1 := by
  simp only [horizontal, vertical, multiplicity] at *
  have h0 := hx t
  have h1 := hx (t-a)
  have h2 := hx (t-b)
  have h3 := hx (t-a-b)
  omega

theorem even_alternating (f : ℕ → ℤ) (n : ℕ)
    (h : ∀ j < 2*n, f (j+1) + f j = 1) : f (2*n) = f 0 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have hi := ih (fun j hj => h j (by omega))
    have h1 := h (2*n) (by omega)
    have h2 := h (2*n+1) (by omega)
    rw [show 2*(n+1) = 2*n+1+1 by omega]
    omega

theorem odd_alternating (f : ℕ → ℤ) (n : ℕ)
    (h : ∀ j < 2*n+1, f (j+1) + f j = 1) : f (2*n+1) + f 0 = 1 := by
  have he := even_alternating f n (fun j hj => h j (by omega))
  have ho := h (2*n) (by omega)
  omega

/-- Odd antiperiodicity in one direction cannot be periodic in the other
direction on a full residue block.  Only the indicated finite interval is
used. -/
theorem residue_change (f : ℕ → ℤ) (a b q : ℕ)
    (ha : 0 < a) (hb : b = 2*q+1)
    (hrec : ∀ n, n+a < a*b+b → f (n+a) + f n = 1) :
    ∃ r < a, f r ≠ f (r+b) := by
  by_contra! hn
  have hperiod : ∀ n < a*b, f n = f (n+b) := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro hnb
      by_cases hna : n < a
      · exact hn n hna
      · have hna' : a ≤ n := by omega
        have hi := ih (n-a) (by omega) (by omega)
        have h1 := hrec (n-a) (by omega)
        have h2 := hrec (n-a+b) (by omega)
        rw [Nat.sub_add_cancel hna'] at h1
        rw [show n-a+b+a = n+b by omega] at h2
        omega
  have hmul : ∀ j ≤ a, f (j*b) = f 0 := by
    intro j
    induction j with
    | zero => simp
    | succ j ih =>
      intro hj
      have hi := ih (by omega)
      have hjb : j*b < a*b := Nat.mul_lt_mul_of_pos_right (by omega) (by omega)
      have hp := hperiod (j*b) hjb
      rw [Nat.succ_mul]
      omega
  have hodd := odd_alternating (fun j => f (j*a)) q (by
    intro j hj
    have hjb : j+1 ≤ b := by omega
    have hja : (j+1)*a ≤ b*a := Nat.mul_le_mul_right a hjb
    have hr := hrec (j*a) (by nlinarith)
    simpa only [Nat.add_mul, Nat.one_mul] using hr)
  have heq := hmul a (by omega)
  simp only [Nat.zero_mul] at hodd
  rw [← hb, Nat.mul_comm b a] at hodd
  omega

/-- A common finite obstruction behind the packing and covering bounds.
The middle interval is covered exactly once; disjointness is required only
on the slightly larger displayed interval. -/
theorem local_obstruction
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (c : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hcover : ∀ n : ℕ, a ≤ n → n < a*b+b →
      multiplicity x a b (c+n) = 1)
    (hsafe : ∀ n : ℕ, n < a*b+a+b →
      multiplicity x a b (c+n) ≤ 1) : False := by
  let Y : ℕ → ℤ := fun n => horizontal x a (c+n)
  let Z : ℕ → ℤ := fun n => vertical x b (c+n)
  have ha0 : 0 < a := by omega
  have hb3 : 3 ≤ b := by omega
  have hzrec : ∀ n, n+a < a*b+b → Z (n+a) + Z n = 1 := by
    intro n hn
    have hm := hcover (n+a) (by omega) hn
    rw [multiplicity_vertical] at hm
    simpa only [Z, Nat.cast_add, add_sub_assoc, add_sub_cancel_right, sub_self,
      add_zero] using hm
  obtain ⟨r, hra, hr⟩ := residue_change Z a b q ha0 hb hzrec
  have hyr : Y r = 0 := by
    have hn := horizontal_nonneg x hx a (c+r)
    by_contra h
    have hp : 0 < horizontal x a (c+r) := by
      change 0 < Y r
      change 0 ≤ Y r at hn
      omega
    have he := horizontal_pos_forces_vertical_eq x hx a b (c+r) hp
      (hsafe r (by nlinarith)) (by
        have hh := hsafe (r+b) (by nlinarith)
        simpa only [Nat.cast_add, add_assoc] using hh)
    apply hr
    simpa only [Z, Nat.cast_add, add_assoc] using he
  let i := r + 2*q*a
  have hia : i+a = r+a*b := by dsimp [i]; nlinarith [hb]
  have hZ0 : Z i = Z r := by
    have he := even_alternating (fun j => Z (r+j*a)) q (by
      intro j hj
      have ht := hzrec (r+j*a) (by nlinarith [hb])
      simpa only [Nat.add_mul, Nat.one_mul, Nat.add_assoc] using ht)
    simpa only [Nat.zero_mul, Nat.add_zero] using he
  have hZb : Z (i+b) = Z (r+b) := by
    have he := even_alternating (fun j => Z (r+b+j*a)) q (by
      intro j hj
      have ht := hzrec (r+b+j*a) (by nlinarith [hb])
      simpa only [Nat.add_mul, Nat.one_mul, Nat.add_assoc] using ht)
    simpa only [Nat.zero_mul, Nat.add_zero,
      show r+b+2*q*a = i+b by dsimp [i]; omega] using he
  have hi_diff : Z i ≠ Z (i+b) := by rwa [hZ0, hZb]
  have hYi : Y i = 0 := by
    have hn := horizontal_nonneg x hx a (c+i)
    by_contra h
    have hp : 0 < horizontal x a (c+i) := by
      change 0 < Y i
      change 0 ≤ Y i at hn
      omega
    have he := horizontal_pos_forces_vertical_eq x hx a b (c+i) hp
      (hsafe i (by nlinarith)) (by
        have hh := hsafe (i+b) (by nlinarith)
        simpa only [Nat.cast_add, add_assoc] using hh)
    apply hi_diff
    simpa only [Z, Nat.cast_add, add_assoc] using he
  have hyrec : ∀ n, a ≤ n+b → n+b < a*b+b → Y (n+b) + Y n = 1 := by
    intro n hn hl
    have hm := hcover (n+b) hn hl
    rw [multiplicity_horizontal] at hm
    simpa only [Y, Nat.cast_add, add_sub_assoc, add_sub_cancel_right, sub_self,
      add_zero] using hm
  have hYia : Y (i+a) = 1 := by
    have he := odd_alternating (fun j => Y (r+j*b)) p (by
      intro j hj
      have hj' : j+1 ≤ a := by omega
      have hmul := Nat.mul_le_mul_right b hj'
      have ht := hyrec (r+j*b) (by nlinarith) (by nlinarith)
      simpa only [Nat.add_mul, Nat.one_mul, Nat.add_assoc] using ht)
    simp only [Nat.zero_mul, hyr, add_zero, ← ha] at he
    rwa [hia]
  have hYib : Y (i+b) = 1 := by
    have ht := hyrec i (by nlinarith) (by nlinarith)
    omega
  have hZi : Z i = 0 := by
    have hn := vertical_nonneg x hx b (c+i)
    by_contra h
    have hp : 0 < vertical x b (c+i) := by
      change 0 < Z i
      change 0 ≤ Z i at hn
      omega
    have he := vertical_pos_forces_horizontal_eq x hx a b (c+i) hp
      (hsafe i (by nlinarith)) (by
        have hh := hsafe (i+a) (by nlinarith)
        simpa only [Nat.cast_add, add_assoc] using hh)
    have hh : Y i = Y (i+a) := by
      simpa only [Y, Nat.cast_add, add_assoc] using he
    omega
  have hZia : Z (i+a) = 1 := by
    have ht := hzrec i (by nlinarith)
    omega
  have hZib : Z (i+b) = 1 := by
    have hn := vertical_nonneg x hx b (c+↑(i+b))
    have hm := hsafe (i+b) (by nlinarith)
    rw [multiplicity_vertical] at hm
    have hn' := vertical_nonneg x hx b (c+↑(i+b)-↑a)
    change 0 ≤ Z (i+b) at hn
    change Z (i+b) + _ ≤ 1 at hm
    omega
  have hc1 : x (c+↑(i+a)) = 1 := two_flags_force_center x hx a b (c+↑(i+a))
    (hcover (i+a) (by omega) (by nlinarith)) hYia hZia
  have hc2 : x (c+↑(i+b)) = 1 := two_flags_force_center x hx a b (c+↑(i+b))
    (hcover (i+b) (by nlinarith) (by nlinarith)) hYib hZib
  have hm := hsafe (i+a+b) (by nlinarith)
  simp only [multiplicity] at hm
  have he1 : c+↑(i+a+b)-↑a = c+↑(i+b) := by push_cast; ring
  have he2 : c+↑(i+a+b)-↑b = c+↑(i+a) := by push_cast; ring
  rw [he1, he2, hc1, hc2] at hm
  have hn1 := hx (c+↑(i+a+b))
  have hn2 := hx (c+↑(i+b)-↑b)
  omega

/-- No interval of `ab+b+a` sites can be covered exactly once by translates
of the four-point set, when both steps are odd. -/
theorem covering_interval_obstruction
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b) :
    ¬ (∀ n : ℕ, n < a*b+a+b → multiplicity x a b (start+n) = 1) := by
  intro h
  exact local_obstruction x hx start a b p q ha hb hab
    (fun n _ hn => h n (by omega))
    (fun n hn => le_of_eq (h n hn))

/-- Every interval of `ab+b-a` sites in a packing has an uncovered site. -/
theorem packing_interval_obstruction
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hpack : ∀ t, multiplicity x a b t ≤ 1) :
    ∃ n : ℕ, n < a*b+b-a ∧ multiplicity x a b (start+n) = 0 := by
  by_contra! hn
  have hzero : ∀ t, 0 ≤ multiplicity x a b t := by
    intro t
    exact add_nonneg (add_nonneg (add_nonneg (hx _) (hx _)) (hx _)) (hx _)
  have hfull : ∀ n : ℕ, n < a*b+b-a → multiplicity x a b (start+n) = 1 := by
    intro n hlt
    have hp := hpack (start+n)
    have hz := hzero (start+n)
    have hne := hn n hlt
    omega
  apply local_obstruction x hx (start-a) a b p q ha hb hab
  · intro n hna hnlt
    have hm := hfull (n-a) (by omega)
    have he : start-↑a+↑n = start+↑(n-a) := by
      rw [Nat.cast_sub hna]
      ring
    rwa [he]
  · intro n _
    exact hpack _

open scoped BigOperators

def intervalSum (f : ℤ → ℤ) (start : ℤ) (n : ℕ) : ℤ :=
  ∑ j ∈ Finset.range n, f (start+j)

theorem packing_interval_sum
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hpack : ∀ t, multiplicity x a b t ≤ 1) :
    intervalSum (multiplicity x a b) start (a*b+b-a) ≤ (a*b+b-a : ℕ)-1 := by
  obtain ⟨j, hj, hz⟩ := packing_interval_obstruction x hx start a b p q ha hb hab hpack
  have ht := Finset.sum_lt_sum
    (s := Finset.range (a*b+b-a))
    (f := fun j : ℕ => multiplicity x a b (start+j))
    (g := fun _ : ℕ => (1 : ℤ))
    (fun j _ => hpack _) ⟨j, Finset.mem_range.mpr hj, by omega⟩
  simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul, mul_one] at ht
  change intervalSum (multiplicity x a b) start (a*b+b-a) < _ at ht
  omega

theorem covering_interval_sum
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hcover : ∀ t, 1 ≤ multiplicity x a b t) :
    (a*b+a+b : ℕ)+1 ≤ intervalSum (multiplicity x a b) start (a*b+a+b) := by
  have hnot := covering_interval_obstruction x hx start a b p q ha hb hab
  push Not at hnot
  obtain ⟨j, hj, hne⟩ := hnot
  have hjm := hcover (start+j)
  have ht := Finset.sum_lt_sum
    (s := Finset.range (a*b+a+b))
    (f := fun _ : ℕ => (1 : ℤ))
    (g := fun j : ℕ => multiplicity x a b (start+j))
    (fun j _ => hcover _) ⟨j, Finset.mem_range.mpr hj, by omega⟩
  simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul, mul_one] at ht
  change _ < intervalSum (multiplicity x a b) start (a*b+a+b) at ht
  omega

end PackingFourPoint
