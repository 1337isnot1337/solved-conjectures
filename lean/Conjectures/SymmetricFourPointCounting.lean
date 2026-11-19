import Conjectures.SymmetricFourPoint
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.Order.BigOperators.Group.Finset

/-! Finite interval estimates, uniform in the location of the interval. -/

namespace SymmetricFourPoint

def windowSum (f : ℤ → ℤ) (s : ℤ) (n : ℕ) : ℤ :=
  ∑ j ∈ Finset.range n, f (s + j)

theorem windowSum_zero (f : ℤ → ℤ) (s : ℤ) : windowSum f s 0 = 0 := by
  simp [windowSum]

theorem windowSum_add (f : ℤ → ℤ) (s : ℤ) (n m : ℕ) :
    windowSum f s (n + m) = windowSum f s n + windowSum f (s + n) m := by
  simp only [windowSum, Finset.sum_range_add]
  congr 1
  apply Finset.sum_congr rfl
  intro j _
  congr 1
  push_cast
  ring

theorem windowSum_nonneg {f : ℤ → ℤ} (hf : ∀ t, 0 ≤ f t) (s : ℤ) (n : ℕ) :
    0 ≤ windowSum f s n := Finset.sum_nonneg (fun _ _ => hf _)

theorem windowSum_le {f : ℤ → ℤ} (hf : ∀ t, f t ≤ 1) (s : ℤ) (n : ℕ) :
    windowSum f s n ≤ n := by
  calc
    windowSum f s n ≤ ∑ _j ∈ Finset.range n, (1 : ℤ) :=
      Finset.sum_le_sum (fun _ _ => hf _)
    _ = n := by simp

theorem le_windowSum {f : ℤ → ℤ} (hf : ∀ t, 1 ≤ f t) (s : ℤ) (n : ℕ) :
    (n : ℤ) ≤ windowSum f s n := by
  calc
    (n : ℤ) = ∑ _j ∈ Finset.range n, (1 : ℤ) := by simp
    _ ≤ windowSum f s n := Finset.sum_le_sum (fun _ _ => hf _)

theorem windowSum_upper_of_zero {f : ℤ → ℤ} (hf : ∀ t, f t ≤ 1)
    (s : ℤ) (n : ℕ) (hzero : ∃ t : ℤ, s ≤ t ∧ t < s + n ∧ f t = 0) :
    windowSum f s n ≤ (n : ℤ) - 1 := by
  obtain ⟨t, ht0, htn, hft⟩ := hzero
  let j := (t - s).toNat
  have hjcast : (j : ℤ) = t - s := by dsimp [j]; omega
  have hj : j ∈ Finset.range n := by simp only [Finset.mem_range]; omega
  have hsum := Finset.single_le_sum (s := Finset.range n)
    (f := fun k : ℕ => 1 - f (s + k)) (fun k _ => by have := hf (s + k); omega) hj
  have hindex : s + (j : ℤ) = t := by omega
  rw [hindex, hft] at hsum
  have hid : (∑ k ∈ Finset.range n, (1 - f (s + k))) =
      (n : ℤ) - windowSum f s n := by simp [windowSum, Finset.sum_sub_distrib]
  rw [hid] at hsum
  omega

theorem windowSum_lower_of_two {f : ℤ → ℤ} (hf : ∀ t, 1 ≤ f t)
    (s : ℤ) (n : ℕ) (htwo : ∃ t : ℤ, s ≤ t ∧ t < s + n ∧ 2 ≤ f t) :
    (n : ℤ) + 1 ≤ windowSum f s n := by
  obtain ⟨t, ht0, htn, hft⟩ := htwo
  let j := (t - s).toNat
  have hjcast : (j : ℤ) = t - s := by dsimp [j]; omega
  have hj : j ∈ Finset.range n := by simp only [Finset.mem_range]; omega
  have hsum := Finset.single_le_sum (s := Finset.range n)
    (f := fun k : ℕ => f (s + k) - 1) (fun k _ => by have := hf (s + k); omega) hj
  have hindex : s + (j : ℤ) = t := by omega
  rw [hindex] at hsum
  have hid : (∑ k ∈ Finset.range n, (f (s + k) - 1)) =
      windowSum f s n - (n : ℤ) := by simp [windowSum, Finset.sum_sub_distrib]
  rw [hid] at hsum
  omega

theorem windowSum_blocks_upper {f : ℤ → ℤ} (hf : ∀ t, f t ≤ 1)
    (p : ℕ) (hp : 0 < p)
    (hblock : ∀ s, windowSum f s p ≤ (p : ℤ) - 1) (s : ℤ) (n : ℕ) :
    (p : ℤ) * windowSum f s n ≤ ((p : ℤ) - 1) * n + (p - 1 : ℤ) := by
  have hfull : ∀ q : ℕ, windowSum f s (q * p) ≤ (q : ℤ) * ((p : ℤ) - 1) := by
    intro q
    induction q with
    | zero => simp [windowSum]
    | succ q ih =>
      rw [Nat.succ_mul, windowSum_add]
      have hb := hblock (s + (q * p : ℕ))
      push_cast at hb ⊢
      nlinarith
  have hd : n / p * p + n % p = n := by simpa only [Nat.mul_comm] using Nat.div_add_mod n p
  have hr : n % p < p := Nat.mod_lt n hp
  have hsplit := windowSum_add f s (n / p * p) (n % p)
  rw [hd] at hsplit
  have hq := hfull (n / p)
  have hrest := windowSum_le hf (s + (n / p * p : ℕ)) (n % p)
  have hd' : ((n / p : ℕ) : ℤ) * p + (n % p : ℕ) = (n : ℤ) := by exact_mod_cast hd
  have hr' : ((n % p : ℕ) : ℤ) < (p : ℤ) := by omega
  have hp' : (0 : ℤ) < p := by omega
  nlinarith

theorem windowSum_blocks_lower {f : ℤ → ℤ} (hf : ∀ t, 1 ≤ f t)
    (p : ℕ) (hp : 0 < p)
    (hblock : ∀ s, (p : ℤ) + 1 ≤ windowSum f s p) (s : ℤ) (n : ℕ) :
    ((p : ℤ) + 1) * n - (p - 1 : ℤ) ≤ (p : ℤ) * windowSum f s n := by
  have hfull : ∀ q : ℕ, (q : ℤ) * ((p : ℤ) + 1) ≤ windowSum f s (q * p) := by
    intro q
    induction q with
    | zero => simp [windowSum]
    | succ q ih =>
      rw [Nat.succ_mul, windowSum_add]
      have hb := hblock (s + (q * p : ℕ))
      push_cast at hb ⊢
      nlinarith
  have hd : n / p * p + n % p = n := by simpa only [Nat.mul_comm] using Nat.div_add_mod n p
  have hr : n % p < p := Nat.mod_lt n hp
  have hsplit := windowSum_add f s (n / p * p) (n % p)
  rw [hd] at hsplit
  have hq := hfull (n / p)
  have hrest := le_windowSum hf (s + (n / p * p : ℕ)) (n % p)
  have hd' : ((n / p : ℕ) : ℤ) * p + (n % p : ℕ) = (n : ℤ) := by exact_mod_cast hd
  have hr' : ((n % p : ℕ) : ℤ) < (p : ℤ) := by omega
  have hp' : (0 : ℤ) < p := by omega
  nlinarith

theorem windowSum_shift_bounds {f : ℤ → ℤ} (hlo : ∀ t, 0 ≤ f t)
    (hhi : ∀ t, f t ≤ 1) (s : ℤ) (n d : ℕ) :
    windowSum f s n - d ≤ windowSum f (s + d) n ∧
      windowSum f (s + d) n ≤ windowSum f s n + d := by
  have h1 := windowSum_add f s n d
  have h2 := windowSum_add f s d n
  rw [Nat.add_comm d n] at h2
  have h3 := windowSum_nonneg hlo s d
  have h4 := windowSum_le hhi s d
  have h5 := windowSum_nonneg hlo (s + n) d
  have h6 := windowSum_le hhi (s + n) d
  omega

theorem windowSum_sub_shift_bounds {f : ℤ → ℤ} (hlo : ∀ t, 0 ≤ f t)
    (hhi : ∀ t, f t ≤ 1) (s : ℤ) (n d : ℕ) :
    windowSum f s n - d ≤ windowSum f (s - d) n ∧
      windowSum f (s - d) n ≤ windowSum f s n + d := by
  have hs := windowSum_shift_bounds hlo hhi (s - d) n d
  simp only [sub_add_cancel] at hs
  omega

theorem windowSum_multiplicity (x : ℤ → ℤ) (a b : ℕ) (s : ℤ) (n : ℕ) :
    windowSum (multiplicity x a b) s n =
      windowSum x s n + windowSum x (s - a) n +
        windowSum x (s - b) n + windowSum x (s - (a + b : ℕ)) n := by
  simp only [windowSum, multiplicity, pair, Finset.sum_add_distrib]
  have h1 : (∑ j ∈ Finset.range n, x (s + j - a)) =
      ∑ j ∈ Finset.range n, x (s - a + j) := by
    apply Finset.sum_congr rfl
    intro j _
    congr 1
    ring
  have h2 : (∑ j ∈ Finset.range n, x (s + j - b)) =
      ∑ j ∈ Finset.range n, x (s - b + j) := by
    apply Finset.sum_congr rfl
    intro j _
    congr 1
    ring
  have h3 : (∑ j ∈ Finset.range n, x (s + j - b - a)) =
      ∑ j ∈ Finset.range n, x (s - (a + b : ℕ) + j) := by
    apply Finset.sum_congr rfl
    intro j _
    congr 1
    push_cast
    ring
  rw [h1, h2, h3]
  ring

theorem windowSum_multiplicity_bounds {x : ℤ → ℤ} (hlo : ∀ t, 0 ≤ x t)
    (hhi : ∀ t, x t ≤ 1) (a b : ℕ) (s : ℤ) (n : ℕ) :
    4 * windowSum x s n - 2 * (a + b : ℤ) ≤ windowSum (multiplicity x a b) s n ∧
      windowSum (multiplicity x a b) s n ≤ 4 * windowSum x s n + 2 * (a + b : ℤ) := by
  have ha := windowSum_sub_shift_bounds hlo hhi s n a
  have hb := windowSum_sub_shift_bounds hlo hhi s n b
  have hab := windowSum_sub_shift_bounds hlo hhi s n (a + b)
  rw [windowSum_multiplicity]
  push_cast at hab ⊢
  constructor <;> omega

/-- A uniform finite upper bound on every packing's center count. -/
theorem packing_count_bound (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1)
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t)
    (hpacking : ∀ t, multiplicity x a b t ≤ 1) (s : ℤ) (n : ℕ) :
    4 * (packingLength a b : ℤ) * windowSum x s n ≤
      ((packingLength a b : ℤ) - 1) * n +
        2 * (packingLength a b : ℤ) * (a + b : ℤ) + packingLength a b - 1 := by
  have hp : 0 < packingLength a b := by dsimp [packingLength]; omega
  have hbits : ∀ t, x t ≤ 1 := by
    intro t
    have h0 := hx (t - a)
    have h1 := hx (t - b)
    have h2 := hx (t - b - a)
    have hp := hpacking t
    simp only [multiplicity, pair] at hp
    omega
  have hblock : ∀ s, windowSum (multiplicity x a b) s (packingLength a b) ≤
      (packingLength a b : ℤ) - 1 := by
    intro s
    apply windowSum_upper_of_zero hpacking
    exact packing_uncovered a b ha hab haodd hbodd x hx hpacking s
  have hs := windowSum_blocks_upper hpacking (packingLength a b) hp hblock s n
  have hm := (windowSum_multiplicity_bounds hx hbits a b s n).1
  have hp' : (0 : ℤ) < packingLength a b := by omega
  nlinarith

/-- A uniform finite lower bound on every covering's center count. Indicator
centers are bounded by one; overlapping translates are fully allowed. -/
theorem covering_count_bound (a b : ℕ) (ha : 0 < a) (hab : a < b)
    (haodd : a % 2 = 1) (hbodd : b % 2 = 1)
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (hbits : ∀ t, x t ≤ 1)
    (hcover : ∀ t, 1 ≤ multiplicity x a b t) (s : ℤ) (n : ℕ) :
    ((coveringLength a b : ℤ) + 1) * n -
        2 * (coveringLength a b : ℤ) * (a + b : ℤ) - (coveringLength a b - 1 : ℤ) ≤
      4 * (coveringLength a b : ℤ) * windowSum x s n := by
  have hp : 0 < coveringLength a b := by dsimp [coveringLength]; omega
  have hblock : ∀ s, (coveringLength a b : ℤ) + 1 ≤
      windowSum (multiplicity x a b) s (coveringLength a b) := by
    intro s
    apply windowSum_lower_of_two hcover
    exact covering_overlap a b ha hab haodd hbodd x hx hcover s
  have hs := windowSum_blocks_lower hcover (coveringLength a b) hp hblock s n
  have hm := (windowSum_multiplicity_bounds hx hbits a b s n).2
  have hp' : (0 : ℤ) < coveringLength a b := by omega
  nlinarith

end SymmetricFourPoint
