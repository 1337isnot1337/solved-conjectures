import Mathlib.Algebra.Ring.Int.Units
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.Algebra.Ring.Parity

/-!
# Removing signs from odd-order signed permutations

The action is on an index together with a sign. Its order assumption is an
equality of actual permutations, rather than an assumption about a desired
normal form. The resulting diagonal conjugator is an explicit product.
-/

namespace HadamardAutomorphism

open scoped BigOperators

variable {ι : Type*}

/-- A signed permutation acting on indices with an attached integer unit. -/
def signedLift (σ : Equiv.Perm ι) (s : ι → ℤˣ) : Equiv.Perm (ι × ℤˣ) where
  toFun x := (σ x.1, s x.1 * x.2)
  invFun x := (σ.symm x.1, (s (σ.symm x.1))⁻¹ * x.2)
  left_inv x := by simp
  right_inv x := by simp

@[simp] theorem signedLift_apply (σ : Equiv.Perm ι) (s : ι → ℤˣ) (i : ι) (u : ℤˣ) :
    signedLift σ s (i, u) = (σ i, s i * u) := rfl

/-- The product of signs encountered during `k` steps. -/
def signTransport (σ : Equiv.Perm ι) (s : ι → ℤˣ) : ℕ → ι → ℤˣ
  | 0, _ => 1
  | k + 1, i => s i * signTransport σ s k (σ i)

@[simp] theorem signTransport_zero (σ : Equiv.Perm ι) (s : ι → ℤˣ) (i : ι) :
    signTransport σ s 0 i = 1 := rfl

@[simp] theorem signTransport_succ (σ : Equiv.Perm ι) (s : ι → ℤˣ) (k : ℕ) (i : ι) :
    signTransport σ s (k + 1) i = s i * signTransport σ s k (σ i) := rfl

theorem signedLift_pow_apply (σ : Equiv.Perm ι) (s : ι → ℤˣ)
    (k : ℕ) (i : ι) (u : ℤˣ) :
    (signedLift σ s ^ k) (i, u) = ((σ ^ k) i, signTransport σ s k i * u) := by
  induction k generalizing i u with
  | zero => simp
  | succ k ih =>
    rw [pow_succ, Equiv.Perm.mul_apply, signedLift_apply, ih]
    simp only [pow_succ, Equiv.Perm.mul_apply, signTransport_succ]
    congr 1
    ac_rfl

theorem signedLift_pow_eq_one_imp (σ : Equiv.Perm ι) (s : ι → ℤˣ) (q : ℕ)
    (h : signedLift σ s ^ q = 1) :
    σ ^ q = 1 ∧ ∀ i, signTransport σ s q i = 1 := by
  have hi (i : ι) := congrArg (fun e : Equiv.Perm (ι × ℤˣ) => e (i, 1)) h
  simp only [signedLift_pow_apply, mul_one, Equiv.Perm.one_apply] at hi
  constructor
  · ext i
    exact congrArg Prod.fst (hi i)
  · intro i
    exact congrArg Prod.snd (hi i)

theorem int_unit_mul_self (u : ℤˣ) : u * u = 1 := by
  rcases Int.units_eq_one_or u with rfl | rfl <;> simp

theorem int_unit_pow_odd (u : ℤˣ) {q : ℕ} (hq : Odd q) : u ^ q = u := by
  rcases Int.units_eq_one_or u with rfl | rfl
  · simp
  · exact hq.neg_one_pow

/-- An explicit diagonal sign used to conjugate the action. -/
def diagonalNormalizer (σ : Equiv.Perm ι) (s : ι → ℤˣ) (q : ℕ) (i : ι) : ℤˣ :=
  ∏ k ∈ Finset.range q, signTransport σ s k i

theorem diagonalNormalizer_shift (σ : Equiv.Perm ι) (s : ι → ℤˣ) {q : ℕ}
    (hq : Odd q) (ht : ∀ i, signTransport σ s q i = 1) (i : ι) :
    s i * diagonalNormalizer σ s q (σ i) = diagonalNormalizer σ s q i := by
  have hp : (∏ k ∈ Finset.range q, signTransport σ s (k + 1) i) =
      ∏ k ∈ Finset.range q, signTransport σ s k i := by
    have h := Finset.prod_range_succ' (fun k => signTransport σ s k i) q
    rw [Finset.prod_range_succ, ht, signTransport_zero, mul_one, mul_one] at h
    exact h.symm
  simpa only [signTransport_succ, Finset.prod_mul_distrib, Finset.prod_const,
    Finset.card_range, int_unit_pow_odd _ hq, diagonalNormalizer] using hp

/-- Every odd-order signed permutation is conjugate by signs to its index permutation. -/
theorem exists_diagonal_normalizer (σ : Equiv.Perm ι) (s : ι → ℤˣ) {q : ℕ}
    (hq : Odd q) (h : signedLift σ s ^ q = 1) :
    ∃ d : ι → ℤˣ, ∀ i, s i = d i * d (σ i) := by
  refine ⟨diagonalNormalizer σ s q, fun i => ?_⟩
  have ht := (signedLift_pow_eq_one_imp σ s q h).2
  have hs := diagonalNormalizer_shift σ s hq ht i
  calc
    s i = (s i * diagonalNormalizer σ s q (σ i)) *
        diagonalNormalizer σ s q (σ i) := by rw [mul_assoc, int_unit_mul_self, mul_one]
    _ = diagonalNormalizer σ s q i * diagonalNormalizer σ s q (σ i) := by rw [hs]

/-- The normalizer gives a literal conjugacy of permutations of signed indices. -/
theorem exists_diagonal_conjugacy (σ : Equiv.Perm ι) (s : ι → ℤˣ) {q : ℕ}
    (hq : Odd q) (h : signedLift σ s ^ q = 1) :
    ∃ d : ι → ℤˣ,
      signedLift 1 d * signedLift σ s * signedLift 1 d = signedLift σ (fun _ => 1) := by
  obtain ⟨d, hd⟩ := exists_diagonal_normalizer σ s hq h
  refine ⟨d, ?_⟩
  apply Equiv.ext
  rintro ⟨i, u⟩
  change (σ i, d (σ i) * (s i * (d i * u))) = (σ i, 1 * u)
  rw [hd i]
  congr 1
  calc
    d (σ i) * ((d i * d (σ i)) * (d i * u)) =
        (d i * d i) * (d (σ i) * d (σ i)) * u := by ac_rfl
    _ = 1 * u := by rw [int_unit_mul_self, int_unit_mul_self, one_mul]

/-- At odd order, a nontrivial signed permutation has a nontrivial index permutation. -/
theorem signedLift_ne_one_imp_ne_one (σ : Equiv.Perm ι) (s : ι → ℤˣ) {q : ℕ}
    (hq : Odd q) (h : signedLift σ s ^ q = 1) (hnt : signedLift σ s ≠ 1) : σ ≠ 1 := by
  intro hσ
  obtain ⟨d, hd⟩ := exists_diagonal_normalizer σ s hq h
  apply hnt
  apply Equiv.ext
  rintro ⟨i, u⟩
  simp only [signedLift_apply, hσ, Equiv.Perm.one_apply] at hd ⊢
  rw [hd i, int_unit_mul_self, one_mul]

/-- A fixed index has positive sign in every odd-order signed permutation. -/
theorem fixed_index_sign_eq_one (σ : Equiv.Perm ι) (s : ι → ℤˣ) {q : ℕ}
    (hq : Odd q) (h : signedLift σ s ^ q = 1) (i : ι) (hi : σ i = i) : s i = 1 := by
  obtain ⟨d, hd⟩ := exists_diagonal_normalizer σ s hq h
  rw [hd, hi, int_unit_mul_self]

end HadamardAutomorphism
