import Conjectures.PackingFourPoint

/-! Uniform finite-window consequences of the four-point interval
obstructions.  These bounds retain explicit boundary terms. -/
namespace PackingFourPoint

open scoped BigOperators

theorem intervalSum_add (f : ℤ → ℤ) (start : ℤ) (m n : ℕ) :
    intervalSum f start (m+n) =
      intervalSum f start m + intervalSum f (start+m) n := by
  simp only [intervalSum, Finset.sum_range_add, Nat.cast_add, add_assoc]

theorem intervalSum_le_length (f : ℤ → ℤ) (hf : ∀ t, f t ≤ 1)
    (start : ℤ) (n : ℕ) : intervalSum f start n ≤ n := by
  have h := Finset.sum_le_sum (s := Finset.range n)
    (f := fun j : ℕ => f (start+j)) (g := fun _ : ℕ => (1 : ℤ))
    (fun j _ => hf _)
  simpa only [intervalSum, Finset.sum_const, Finset.card_range,
    nsmul_eq_mul, mul_one] using h

theorem length_le_intervalSum (f : ℤ → ℤ) (hf : ∀ t, 1 ≤ f t)
    (start : ℤ) (n : ℕ) : (n : ℤ) ≤ intervalSum f start n := by
  have h := Finset.sum_le_sum (s := Finset.range n)
    (f := fun _ : ℕ => (1 : ℤ)) (g := fun j : ℕ => f (start+j))
    (fun j _ => hf _)
  simpa only [intervalSum, Finset.sum_const, Finset.card_range,
    nsmul_eq_mul, mul_one] using h

theorem block_sum_upper (f : ℤ → ℤ) (P : ℕ) (B : ℤ)
    (hb : ∀ start, intervalSum f start P ≤ B) (start : ℤ) (k : ℕ) :
    intervalSum f start (k*P) ≤ (k : ℤ)*B := by
  induction k with
  | zero => simp [intervalSum]
  | succ k ih =>
    rw [Nat.succ_mul, intervalSum_add]
    have h := hb (start+↑(k*P))
    push_cast at h ⊢
    linarith

theorem block_sum_lower (f : ℤ → ℤ) (P : ℕ) (B : ℤ)
    (hb : ∀ start, B ≤ intervalSum f start P) (start : ℤ) (k : ℕ) :
    (k : ℤ)*B ≤ intervalSum f start (k*P) := by
  induction k with
  | zero => simp [intervalSum]
  | succ k ih =>
    rw [Nat.succ_mul, intervalSum_add]
    have h := hb (start+↑(k*P))
    push_cast at h ⊢
    linarith

/-- A hole in each length-`P` block gives a uniform density bound, with an
error below one whole block. -/
theorem uniform_sum_upper (f : ℤ → ℤ) (P : ℕ) (hP : 0 < P)
    (hf : ∀ t, f t ≤ 1)
    (hb : ∀ start, intervalSum f start P ≤ (P : ℤ)-1)
    (start : ℤ) (n : ℕ) :
    (P : ℤ)*intervalSum f start n ≤ ((P : ℤ)-1)*n + ((P : ℤ)-1) := by
  have hn : n/P*P+n%P = n := by
    simpa only [Nat.mul_comm, Nat.add_comm] using Nat.mod_add_div n P
  have hs := intervalSum_add f start (n/P*P) (n%P)
  rw [hn] at hs
  have hfull := block_sum_upper f P ((P : ℤ)-1) hb start (n/P)
  have hrest := intervalSum_le_length f hf (start+↑(n/P*P)) (n%P)
  have hsum : intervalSum f start n ≤ (n/P : ℕ)*((P : ℤ)-1)+(n%P : ℕ) := by
    rw [hs]
    linarith
  have hcast : (n/P : ℕ)*(P : ℤ)+(n%P : ℕ) = n := by exact_mod_cast hn
  have hrem : ((n%P : ℕ) : ℤ) ≤ (P : ℤ)-1 := by
    have ht := Nat.mod_lt n hP
    omega
  have hP0 : (0 : ℤ) ≤ P := by omega
  calc
    (P : ℤ)*intervalSum f start n
      ≤ (P : ℤ)*((n/P : ℕ)*((P : ℤ)-1)+(n%P : ℕ)) :=
        mul_le_mul_of_nonneg_left hsum hP0
    _ = ((P : ℤ)-1)*n+(n%P : ℕ) := by rw [← hcast]; ring
    _ ≤ ((P : ℤ)-1)*n+((P : ℤ)-1) := by omega

/-- An excess cover in each length-`Q` block gives the corresponding uniform
lower bound. -/
theorem uniform_sum_lower (f : ℤ → ℤ) (Q : ℕ) (hQ : 0 < Q)
    (hf : ∀ t, 1 ≤ f t)
    (hb : ∀ start, (Q : ℤ)+1 ≤ intervalSum f start Q)
    (start : ℤ) (n : ℕ) :
    ((Q : ℤ)+1)*n-((Q : ℤ)-1) ≤ (Q : ℤ)*intervalSum f start n := by
  have hn : n/Q*Q+n%Q = n := by
    simpa only [Nat.mul_comm, Nat.add_comm] using Nat.mod_add_div n Q
  have hs := intervalSum_add f start (n/Q*Q) (n%Q)
  rw [hn] at hs
  have hfull := block_sum_lower f Q ((Q : ℤ)+1) hb start (n/Q)
  have hrest := length_le_intervalSum f hf (start+↑(n/Q*Q)) (n%Q)
  have hsum : (n/Q : ℕ)*((Q : ℤ)+1)+(n%Q : ℕ) ≤ intervalSum f start n := by
    rw [hs]
    linarith
  have hcast : (n/Q : ℕ)*(Q : ℤ)+(n%Q : ℕ) = n := by exact_mod_cast hn
  have hrem : ((n%Q : ℕ) : ℤ) ≤ (Q : ℤ)-1 := by
    have ht := Nat.mod_lt n hQ
    omega
  have hQ0 : (0 : ℤ) ≤ Q := by omega
  calc
    ((Q : ℤ)+1)*n-((Q : ℤ)-1)
      ≤ ((Q : ℤ)+1)*n-(n%Q : ℕ) := by omega
    _ = (Q : ℤ)*((n/Q : ℕ)*((Q : ℤ)+1)+(n%Q : ℕ)) := by rw [← hcast]; ring
    _ ≤ (Q : ℤ)*intervalSum f start n := mul_le_mul_of_nonneg_left hsum hQ0

theorem packing_multiplicity_bound
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hpack : ∀ t, multiplicity x a b t ≤ 1) (n : ℕ) :
    ((a*b+b-a : ℕ) : ℤ)*intervalSum (multiplicity x a b) start n ≤
      (((a*b+b-a : ℕ) : ℤ)-1)*n+(((a*b+b-a : ℕ) : ℤ)-1) := by
  apply uniform_sum_upper (multiplicity x a b) (a*b+b-a) (by omega) hpack
  intro s
  exact packing_interval_sum x hx s a b p q ha hb hab hpack

theorem covering_multiplicity_bound
    (x : ℤ → ℤ) (hx : ∀ t, 0 ≤ x t) (start : ℤ)
    (a b p q : ℕ) (ha : a = 2*p+1) (hb : b = 2*q+1) (hab : a < b)
    (hcover : ∀ t, 1 ≤ multiplicity x a b t) (n : ℕ) :
    (((a*b+a+b : ℕ) : ℤ)+1)*n-(((a*b+a+b : ℕ) : ℤ)-1) ≤
      ((a*b+a+b : ℕ) : ℤ)*intervalSum (multiplicity x a b) start n := by
  apply uniform_sum_lower (multiplicity x a b) (a*b+a+b) (by omega) hcover
  intro s
  exact covering_interval_sum x hx s a b p q ha hb hab hcover

end PackingFourPoint
