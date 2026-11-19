import Conjectures.PackingDensityBounds

/-! Center-count bounds for the symmetric four-point packing and covering
problems.  The constants are explicit and uniform over all interval starts. -/
namespace PackingFourPoint

open scoped BigOperators

theorem intervalSum_nonneg (f : ℤ → ℤ) (hf : ∀ t, 0 ≤ f t)
    (start : ℤ) (n : ℕ) : 0 ≤ intervalSum f start n :=
  Finset.sum_nonneg (fun _ _ => hf _)

theorem intervalSum_shift_bounds (f : ℤ → ℤ)
    (hf0 : ∀ t, 0 ≤ f t) (hf1 : ∀ t, f t ≤ 1)
    (start : ℤ) (s n : ℕ) :
    intervalSum f start n - s ≤ intervalSum f (start+s) n ∧
      intervalSum f (start+s) n ≤ intervalSum f start n + s := by
  have h1 := intervalSum_add f start s n
  have h2 := intervalSum_add f start n s
  rw [Nat.add_comm s n] at h1
  have hl0 := intervalSum_nonneg f hf0 start s
  have hl1 := intervalSum_le_length f hf1 start s
  have hr0 := intervalSum_nonneg f hf0 (start+n) s
  have hr1 := intervalSum_le_length f hf1 (start+n) s
  constructor <;> linarith

theorem intervalSum_sub_shift_bounds (f : ℤ → ℤ)
    (hf0 : ∀ t, 0 ≤ f t) (hf1 : ∀ t, f t ≤ 1)
    (start : ℤ) (s n : ℕ) :
    intervalSum f start n - s ≤ intervalSum f (start-s) n ∧
      intervalSum f (start-s) n ≤ intervalSum f start n + s := by
  have h := intervalSum_shift_bounds f hf0 hf1 (start-s) s n
  rw [sub_add_cancel] at h
  constructor <;> linarith [h.1, h.2]

theorem multiplicity_sum_eq (x : ℤ → ℤ) (a b start : ℤ) (n : ℕ) :
    intervalSum (multiplicity x a b) start n = intervalSum x start n +
      intervalSum x (start-a) n + intervalSum x (start-b) n +
      intervalSum x (start-a-b) n := by
  simp only [intervalSum, multiplicity, Finset.sum_add_distrib,
    sub_eq_add_neg, add_assoc, add_left_comm, add_comm]

theorem multiplicity_center_bounds (x : ℤ → ℤ)
    (hx0 : ∀ t, 0 ≤ x t) (hx1 : ∀ t, x t ≤ 1)
    (a b : ℕ) (start : ℤ) (n : ℕ) :
    4*intervalSum x start n-2*(a+b : ℕ) ≤
      intervalSum (multiplicity x a b) start n ∧
    intervalSum (multiplicity x a b) start n ≤
      4*intervalSum x start n+2*(a+b : ℕ) := by
  have h1 := intervalSum_sub_shift_bounds x hx0 hx1 start a n
  have h2 := intervalSum_sub_shift_bounds x hx0 hx1 start b n
  have h3 := intervalSum_sub_shift_bounds x hx0 hx1 start (a+b) n
  simp only [Nat.cast_add, sub_add_eq_sub_sub] at h3
  rw [multiplicity_sum_eq]
  push_cast
  constructor <;> linarith [h1.1, h1.2, h2.1, h2.2, h3.1, h3.2]

theorem center_le_one_of_packing (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t)
    (a b : ℤ) (hp : ∀ t, multiplicity x a b t ≤ 1) : ∀ t, x t ≤ 1 := by
  intro t
  have ht := hp t
  simp only [multiplicity] at ht
  have h1 := hx (t-a)
  have h2 := hx (t-b)
  have h3 := hx (t-a-b)
  omega

/-- This finite bound proves the packing density upper bound `(P-1)/(4P)`
without imposing periodicity on the centers. -/
theorem packing_center_bound
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hpack : ∀ t, multiplicity x a b t ≤ 1) (n : ℕ) :
    4*((a*b+b-a : ℕ) : ℤ)*intervalSum x start n ≤
      (((a*b+b-a : ℕ) : ℤ)-1)*n+(((a*b+b-a : ℕ) : ℤ)-1) +
        2*((a*b+b-a : ℕ) : ℤ)*(a+b : ℕ) := by
  have hm := packing_multiplicity_bound x hx start a b p q ha hb hab hpack n
  have hc := (multiplicity_center_bounds x hx
    (center_le_one_of_packing x hx a b hpack) a b start n).1
  have hP : (0 : ℤ) ≤ (a*b+b-a : ℕ) := by omega
  have ht := mul_le_mul_of_nonneg_left hc hP
  nlinarith

/-- This finite bound proves the covering density lower bound `(Q+1)/(4Q)`
for arbitrary center indicators. -/
theorem covering_center_bound
    (x : ℤ → ℤ) (hx0 : ∀ t, 0 ≤ x t) (hx1 : ∀ t, x t ≤ 1) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hcover : ∀ t, 1 ≤ multiplicity x a b t) (n : ℕ) :
    (((a*b+a+b : ℕ) : ℤ)+1)*n-(((a*b+a+b : ℕ) : ℤ)-1) -
        2*((a*b+a+b : ℕ) : ℤ)*(a+b : ℕ) ≤
      4*((a*b+a+b : ℕ) : ℤ)*intervalSum x start n := by
  have hm := covering_multiplicity_bound x hx0 start a b p q ha hb hab hcover n
  have hc := (multiplicity_center_bounds x hx0 hx1 a b start n).2
  have hQ : (0 : ℤ) ≤ (a*b+a+b : ℕ) := by omega
  have ht := mul_le_mul_of_nonneg_left hc hQ
  nlinarith

end PackingFourPoint
