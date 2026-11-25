module

public import Mathlib.Algebra.Polynomial.Expand
public import Mathlib.Data.ZMod.Basic
public import Mathlib.NumberTheory.Padics.PadicVal.Basic
public import Mathlib.Tactic

/-!
# The Thue–Morse valuation conjecture

The finite products below stabilize coefficientwise to the product in
Gawron–Miska–Ulas, arXiv:1703.01955v1, §3. The endpoint addresses the general
block-constancy clause of Conjecture 5.2.
-/

@[expose] public section

namespace ThueMorseValuation

open Polynomial Finset

/-- The first `d` factors of `∏ j, (1 - X^(2^j))`, from the least exponent. -/
noncomputable def truncProduct (R : Type*) [CommRing R] : ℕ → R[X]
  | 0 => 1
  | d + 1 => (1 - X) * expand R 2 (truncProduct R d)

theorem prefix_add (R : Type*) [CommRing R] (s d : ℕ) :
    truncProduct R (s + d) = truncProduct R s * expand R (2 ^ s) (truncProduct R d) := by
  induction s with
  | zero => simp [truncProduct]
  | succ s ih =>
    rw [Nat.succ_add, truncProduct, ih, map_mul, expand_expand, truncProduct, mul_assoc, pow_succ']

theorem prefix_succ (R : Type*) [CommRing R] (d : ℕ) :
    truncProduct R (d + 1) = truncProduct R d * (1 - X ^ (2 ^ d)) := by
  rw [prefix_add, show truncProduct R 1 = 1 - X by simp [truncProduct], map_sub, map_one, expand_X]

theorem prefix_eq_prod (R : Type*) [CommRing R] (d : ℕ) :
    truncProduct R d = ∏ j ∈ range d, (1 - X ^ (2 ^ j)) := by
  induction d with
  | zero => simp [truncProduct]
  | succ d ih => rw [prefix_succ, prod_range_succ, ih]

theorem coeff_prefix_pow_succ (R : Type*) [CommRing R] (d m n : ℕ) (hn : n < 2 ^ d) :
    ((truncProduct R (d + 1)) ^ m).coeff n = ((truncProduct R d) ^ m).coeff n := by
  rw [prefix_succ, mul_pow]
  have he : (1 - X ^ (2 ^ d) : R[X]) ^ m = expand R (2 ^ d) ((1 - X) ^ m) := by
    simp
  rw [he, coeff_mul, sum_eq_single (n, 0)]
  · have hconst : (expand R (2 ^ d) ((1 - X) ^ m)).coeff 0 = 1 := by
      rw [← he, ← constantCoeff_apply, map_pow, map_sub, map_one, map_pow]
      change (1 - (X : R[X]).coeff 0 ^ (2 ^ d)) ^ m = 1
      have hpow : (2 : ℕ) ^ d ≠ 0 := by positivity
      simp [zero_pow hpow]
    change _ * (expand R (2 ^ d) ((1 - X) ^ m)).coeff 0 = _
    rw [hconst, mul_one]
  · intro b hb hne
    obtain ⟨i, j⟩ := b
    have hij : i + j = n := Finset.mem_antidiagonal.mp hb
    have hj : 0 < j := by
      by_contra! hj
      apply hne
      simp only [Nat.le_zero.mp hj, add_zero] at hij ⊢
      simp [hij]
    rw [coeff_expand (pow_pos (by decide : 0 < (2 : ℕ)) _), ite_eq_right, mul_zero]
    exact fun h => (not_le_of_gt (show j < 2 ^ d by omega)) (Nat.le_of_dvd hj h)
  · simp

theorem coeff_prefix_pow_stable (R : Type*) [CommRing R] (m n d e : ℕ)
    (hn : n < 2 ^ d) (hde : d ≤ e) :
    ((truncProduct R e) ^ m).coeff n = ((truncProduct R d) ^ m).coeff n := by
  induction e, hde using Nat.le_induction with
  | base => rfl
  | succ e hde ih =>
    rw [coeff_prefix_pow_succ R e m n (hn.trans_le (Nat.pow_le_pow_right (by decide) hde)), ih]

/-- The integer coefficient `[X^n] T(X)^m` in the source. -/
noncomputable def t (m n : ℕ) : ℤ :=
  ((truncProduct ℤ n) ^ m).coeff n

theorem t_eq_coeff (m n d : ℕ) (hn : n < 2 ^ d) :
    t m n = ((truncProduct ℤ d) ^ m).coeff n := by
  unfold t
  rcases le_total d n with h | h
  · exact coeff_prefix_pow_stable ℤ m n d n hn h
  · exact (coeff_prefix_pow_stable ℤ m n n d (Nat.lt_two_pow_self) h).symm

theorem coeff_factor (R : Type*) [CommRing R] (m i : ℕ) :
    ((1 - X : R[X]) ^ m).coeff i = (-1) ^ i * (m.choose i : R) := by
  rw [show (1 - X : R[X]) = C (-1) * X + 1 by simp [sub_eq_add_neg, add_comm],
    add_pow, finsetSum_coeff]
  simp only [mul_pow, one_pow, mul_one, coeff_mul_natCast, ← C_pow, coeff_C_mul_X_pow]
  by_cases h : i ∈ range (m + 1)
  · rw [sum_eq_single_of_mem i h]
    · simp [mul_comm]
    · intro j _ hj
      simp [Ne.symm hj]
  · rw [sum_eq_zero]
    · simp [Nat.choose_eq_zero_of_lt (by simpa [Nat.lt_succ_iff] using h : m < i)]
    · intro j hj
      simp [show i ≠ j from fun hij => h (hij ▸ hj)]

theorem coeff_prefix_pow_step (R : Type*) [CommRing R] (d m n : ℕ) :
    ((truncProduct R (d + 1)) ^ m).coeff n =
      ∑ i ∈ range (n + 1),
        if 2 ∣ (n - i) then
          ((-1) ^ i * (m.choose i : R)) * ((truncProduct R d) ^ m).coeff ((n - i) / 2)
        else 0 := by
  rw [truncProduct, mul_pow, ← map_pow, coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  apply sum_congr rfl
  intro i _
  rw [coeff_factor, coeff_expand (by decide : 0 < (2 : ℕ))]
  split_ifs <;> simp_all


theorem map_truncProduct {R S : Type*} [CommRing R] [CommRing S]
    (f : R →+* S) (d : ℕ) :
    (truncProduct R d).map f = truncProduct S d := by
  induction d with
  | zero => simp [truncProduct]
  | succ d ih => simp [truncProduct, Polynomial.map_mul, Polynomial.map_sub, map_expand, ih]

theorem map_truncProduct_pow_mod {N : ℕ} (d m : ℕ) :
    ((truncProduct ℤ d ^ m).map (Int.castRingHom (ZMod N))) = truncProduct (ZMod N) d ^ m := by
  rw [Polynomial.map_pow, map_truncProduct]

theorem cast_t_eq_coeff (N m n d : ℕ) (hn : n < 2 ^ d) :
    (t m n : ZMod N) = ((truncProduct (ZMod N) d) ^ m).coeff n := by
  rw [t_eq_coeff m n d hn]
  change (Int.castRingHom (ZMod N)) _ = _
  rw [← coeff_map, map_truncProduct_pow_mod]

end ThueMorseValuation
