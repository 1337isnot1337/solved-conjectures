import Mathlib.Basic.Real.Basic
import Mathlib.Data.Nat.Factorial.BigOperators
import Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.RingTheory.PowerSeries.Derivative

namespace BariczPogany

noncomputable def c (a : ℝ) (n : ℕ) : ℝ :=
  ∏ k ∈ Finset.range n, (((k : ℝ)+1-a)*((k : ℝ)+a)) / (2*((k : ℝ)+1))

theorem c_positive (a : ℝ) (ha : 0 < a) (ha1 : a < 1) (n : ℕ) : 0 < c a n := by
  unfold c
  apply Finset.prod_pos
  intro k hk
  have hk0 : (0 : ℝ) ≤ k := Nat.cast_nonneg k
  have hk1 : 0 < (k : ℝ)+1-a := by linarith
  have hk2 : 0 < (k : ℝ)+a := by linarith
  positivity

noncomputable def d (a : ℝ) (n : ℕ) : ℝ :=
  ∏ k ∈ Finset.range n, (((k : ℝ)-a)*((k : ℝ)+a+1)) / (2*((k : ℝ)+1))

theorem c_succ (a : ℝ) (n : ℕ) : c a (n+1) = c a n *
    ((((n : ℝ)+1-a)*((n : ℝ)+a)) / (2*((n : ℝ)+1))) := by
  unfold c
  rw [Finset.prod_range_succ]

theorem d_succ (a : ℝ) (n : ℕ) : d a (n+1) = d a n *
    ((((n : ℝ)-a)*((n : ℝ)+a+1)) / (2*((n : ℝ)+1))) := by
  unfold d
  rw [Finset.prod_range_succ]

theorem telescope (a : ℝ) (n : ℕ) :
    ((n : ℝ)+1-a) * d a (n+1) = -((n : ℝ)+1+a) * c a (n+1) := by
  induction n with
  | zero => simp [c, d]; ring
  | succ n ih =>
    rw [c_succ, d_succ]
    push_cast at *
    have hn : (2 : ℝ) * ((n : ℝ)+1+1) ≠ 0 := by positivity
    field_simp
    have hh := congrArg (fun x : ℝ => x * ((n : ℝ)+1+1+a) * ((n : ℝ)+1+1-a)) ih
    nlinarith

theorem d_negative (a : ℝ) (ha : 0 < a) (ha1 : a < 1) (n : ℕ) : d a (n+1) < 0 := by
  have hp := c_positive a ha ha1 (n+1)
  have ht := telescope a n
  have hnr : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have h1 : (0 : ℝ) < (n : ℝ)+1-a := by linarith
  have h2 : (0 : ℝ) < (n : ℝ)+1+a := by linarith
  nlinarith

open PowerSeries

noncomputable def numerator (a : ℝ) : PowerSeries ℝ := PowerSeries.mk (c a)
noncomputable def denominator (a : ℝ) : PowerSeries ℝ := PowerSeries.mk (d a)

theorem denominator_constant (a : ℝ) : PowerSeries.constantCoeff (denominator a) = 1 := by
  simp [denominator, d, ← PowerSeries.coeff_zero_eq_constantCoeff_apply]

theorem inverse_nonnegative (a : ℝ) (ha : 0 < a) (ha1 : a < 1) (n : ℕ) :
    0 ≤ PowerSeries.coeff n (denominator a)⁻¹ := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    rw [PowerSeries.coeff_inv]
    by_cases hn : n = 0
    · simp [hn, denominator_constant]
    · simp only [hn, ite_false, denominator_constant, inv_one, neg_one_mul]
      apply neg_nonneg.mpr
      apply Finset.sum_nonpos
      intro x hx
      split_ifs with hlt
      · have hxsum : x.1 + x.2 = n := Finset.mem_antidiagonal.mp hx
        have hxpos : 0 < x.1 := by omega
        obtain ⟨k, hk⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : x.1 ≠ 0)
        rw [hk]
        have hd := d_negative a ha ha1 k
        have hi := ih x.2 hlt
        simp only [denominator, PowerSeries.coeff_mk]
        exact mul_nonpos_of_nonpos_of_nonneg (le_of_lt hd) hi
      · exact le_refl 0

theorem coeff_relation (a : ℝ) (ha1 : a < 1) (n : ℕ) :
    d a (n+1) = c a (n+1) - ((n : ℝ)+a)*c a n := by
  have ht := telescope a n
  have hc := c_succ a n
  have hn : (0 : ℝ) < (n : ℝ)+1-a := by
    have h : (0 : ℝ) ≤ n := Nat.cast_nonneg n
    linarith
  have hden : (2 : ℝ)*((n : ℝ)+1) ≠ 0 := by positivity
  field_simp at hc
  nlinarith [mul_nonneg hn.le (sq_nonneg (d a (n+1) - c a (n+1) + ((n : ℝ)+a)*c a n))]

theorem series_identity (a : ℝ) (ha1 : a < 1) :
    denominator a = (1 - PowerSeries.C a * PowerSeries.X) * numerator a -
      PowerSeries.X^2 * PowerSeries.derivative (numerator a) := by
  have he : (1 - PowerSeries.C a * PowerSeries.X) * numerator a -
      PowerSeries.X^2 * PowerSeries.derivative (numerator a) =
      numerator a - PowerSeries.C a * (PowerSeries.X * numerator a) -
      PowerSeries.X^2 * PowerSeries.derivative (numerator a) := by ring
  rw [he]
  ext n
  cases n with
  | zero => simp [denominator, numerator, c, d]
  | succ n =>
    cases n with
    | zero =>
      simp [denominator, numerator, c, d, PowerSeries.coeff_X_pow_mul']
      ring
    | succ n =>
      simp only [map_sub, PowerSeries.coeff_C_mul, denominator, numerator,
        PowerSeries.coeff_mk]
      rw [show (PowerSeries.X : PowerSeries ℝ) = PowerSeries.X^1 by simp,
        show n+1+1 = (n+1)+1 by omega, PowerSeries.coeff_X_pow_mul]
      simp only [pow_one]
      rw [show n+1+1 = n+2 by omega, PowerSeries.coeff_X_pow_mul]
      simp only [PowerSeries.coeff_derivative, PowerSeries.coeff_mk]
      have h := coeff_relation a ha1 (n+1)
      push_cast at *
      linarith

noncomputable def geometric (a : ℝ) : PowerSeries ℝ := PowerSeries.mk (fun n => a^n)

theorem geometric_inverse (a : ℝ) :
    (1 - PowerSeries.C a * PowerSeries.X) * geometric a = 1 := by
  have he : (1 - PowerSeries.C a * PowerSeries.X) * geometric a =
      geometric a - PowerSeries.C a * (PowerSeries.X * geometric a) := by ring
  rw [he]
  ext n
  cases n with
  | zero => simp [geometric]
  | succ n =>
    simp only [map_sub, PowerSeries.coeff_C_mul, geometric, PowerSeries.coeff_mk]
    rw [show (PowerSeries.X : PowerSeries ℝ) = PowerSeries.X^1 by simp,
      PowerSeries.coeff_X_pow_mul]
    simp [pow_succ, mul_comm]

theorem mul_coeff_nonnegative (f g : PowerSeries ℝ)
    (hf : ∀ n, 0 ≤ PowerSeries.coeff n f) (hg : ∀ n, 0 ≤ PowerSeries.coeff n g)
    (n : ℕ) : 0 ≤ PowerSeries.coeff n (f*g) := by
  rw [PowerSeries.coeff_mul]
  exact Finset.sum_nonneg (fun x _ => mul_nonneg (hf x.1) (hg x.2))

theorem mul_coeff_lower (f g : PowerSeries ℝ)
    (hf : ∀ n, 0 ≤ PowerSeries.coeff n f) (hg : ∀ n, 0 ≤ PowerSeries.coeff n g)
    (hzero : PowerSeries.coeff 0 g = 1) (n : ℕ) :
    PowerSeries.coeff n f ≤ PowerSeries.coeff n (f*g) := by
  rw [PowerSeries.coeff_mul]
  have h := Finset.single_le_sum (s := Finset.antidiagonal n)
    (f := fun x : ℕ × ℕ => PowerSeries.coeff x.1 f * PowerSeries.coeff x.2 g)
    (fun x _ => mul_nonneg (hf x.1) (hg x.2))
    (show (n,0) ∈ Finset.antidiagonal n by simp)
  simpa [hzero] using h

noncomputable def alpha (a : ℝ) : PowerSeries ℝ := numerator a * (denominator a)⁻¹
noncomputable def positiveCore (a : ℝ) : PowerSeries ℝ :=
  PowerSeries.X^2 * PowerSeries.derivative (numerator a)

theorem difference_identity (a : ℝ) (ha1 : a < 1) :
    alpha a - geometric a = positiveCore a * geometric a * (denominator a)⁻¹ := by
  have hD : denominator a * (denominator a)⁻¹ = 1 :=
    PowerSeries.mul_inv_cancel _ (by rw [denominator_constant]; norm_num)
  have hG := geometric_inverse a
  have hS := series_identity a ha1
  have hx : numerator a - denominator a * geometric a = positiveCore a * geometric a := by
    rw [hS]
    unfold positiveCore
    calc
      numerator a - ((1 - PowerSeries.C a * PowerSeries.X) * numerator a -
          PowerSeries.X^2 * PowerSeries.derivative (numerator a)) * geometric a =
        numerator a - ((1 - PowerSeries.C a * PowerSeries.X) * geometric a) * numerator a +
          PowerSeries.X^2 * PowerSeries.derivative (numerator a) * geometric a := by ring
      _ = _ := by rw [hG]; ring
  unfold alpha
  calc
    numerator a * (denominator a)⁻¹ - geometric a =
        (numerator a - denominator a * geometric a) * (denominator a)⁻¹ := by
          rw [sub_mul]
          calc
            numerator a * (denominator a)⁻¹ - geometric a =
              numerator a * (denominator a)⁻¹ - (denominator a * (denominator a)⁻¹) * geometric a := by rw [hD]; ring
            _ = _ := by ring
    _ = _ := by rw [hx]

theorem core_nonnegative (a : ℝ) (ha : 0 < a) (ha1 : a < 1) (n : ℕ) :
    0 ≤ PowerSeries.coeff n (positiveCore a) := by
  unfold positiveCore
  rw [PowerSeries.coeff_X_pow_mul']
  split_ifs with h
  · rw [PowerSeries.coeff_derivative]
    simp only [numerator, PowerSeries.coeff_mk]
    have hc := c_positive a ha ha1 (n-2+1)
    positivity
  · exact le_refl 0

theorem core_coeff (a : ℝ) (n : ℕ) :
    PowerSeries.coeff (n+2) (positiveCore a) = c a (n+1) * (n+1) := by
  unfold positiveCore
  rw [PowerSeries.coeff_X_pow_mul, PowerSeries.coeff_derivative]
  simp [numerator]

theorem core_lower (a : ℝ) (ha : 0 < a) (ha1 : a < 1) (n : ℕ) :
    PowerSeries.coeff n (positiveCore a) ≤ PowerSeries.coeff n (alpha a - geometric a) := by
  rw [difference_identity a ha1]
  have hg : ∀ k, 0 ≤ PowerSeries.coeff k (geometric a) := by
    intro k
    simp [geometric, ha.le]
  have hi : ∀ k, 0 ≤ PowerSeries.coeff k (denominator a)⁻¹ := inverse_nonnegative a ha ha1
  have hg0 : PowerSeries.coeff 0 (geometric a) = 1 := by simp [geometric]
  have hi0 : PowerSeries.coeff 0 (denominator a)⁻¹ = 1 := by
    rw [PowerSeries.coeff_zero_eq_constantCoeff_apply, PowerSeries.constantCoeff_inv, denominator_constant]
    simp
  exact (mul_coeff_lower _ _ (core_nonnegative a ha ha1) hg hg0 n).trans
    (mul_coeff_lower _ _ (mul_coeff_nonnegative _ _ (core_nonnegative a ha ha1) hg) hi hi0 n)

theorem coefficient_positive (a : ℝ) (ha : 0 < a) (ha1 : a < 1) (n : ℕ) (hn : 2 ≤ n) :
    a^n < PowerSeries.coeff n (alpha a) := by
  obtain ⟨k, rfl⟩ : ∃ k, n = k+2 := ⟨n-2, by omega⟩
  have hpos : 0 < PowerSeries.coeff (k+2) (positiveCore a) := by
    rw [core_coeff]
    have hc := c_positive a ha ha1 (k+1)
    positivity
  have hl := core_lower a ha ha1 (k+2)
  simp only [map_sub, geometric, PowerSeries.coeff_mk] at hl
  linarith

noncomputable def sourceCoeff (nu : ℝ) (n : ℕ) : ℝ :=
  ∏ k ∈ Finset.range n,
    -((4*nu^2 - (2*(k : ℝ)+1)^2) / (8*((k : ℝ)+1)))

theorem numerator_source (a : ℝ) (n : ℕ) : c a n = sourceCoeff (a-1/2) n := by
  unfold c sourceCoeff
  apply Finset.prod_congr rfl
  intro k hk
  have hk0 : (0 : ℝ) < (k : ℝ)+1 := by positivity
  field_simp
  ring

theorem denominator_source (a : ℝ) (n : ℕ) : d a n = sourceCoeff (a+1/2) n := by
  unfold d sourceCoeff
  apply Finset.prod_congr rfl
  intro k hk
  have hk0 : (0 : ℝ) < (k : ℝ)+1 := by positivity
  field_simp
  ring

noncomputable def sourceRaw (nu : ℝ) (n : ℕ) : ℝ :=
  (-1:ℝ)^n * (∏ k ∈ Finset.range n, (4*nu^2 - (2*(k : ℝ)+1)^2)) /
    (8^n * (Nat.factorial n : ℝ))

theorem source_factorization (nu : ℝ) (n : ℕ) : sourceCoeff nu n = sourceRaw nu n := by
  unfold sourceCoeff sourceRaw
  simp_rw [← neg_div]
  rw [Finset.prod_div_distrib]
  have hneg : (∏ k ∈ Finset.range n, -(4*nu^2 - (2*(k : ℝ)+1)^2)) =
      ∏ k ∈ Finset.range n, (-1:ℝ) * (4*nu^2 - (2*(k : ℝ)+1)^2) := by
    apply Finset.prod_congr rfl
    intro k hk
    ring
  rw [hneg, Finset.prod_mul_distrib, Finset.prod_mul_distrib]
  simp only [Finset.prod_const, Finset.card_range]
  rw [Nat.factorial_eq_prod_range_add_one]
  push_cast
  ring

noncomputable def sourceAlpha (nu : ℝ) : PowerSeries ℝ :=
  PowerSeries.mk (sourceRaw nu) * (PowerSeries.mk (sourceRaw (nu+1)))⁻¹

theorem source_alpha_eq (nu : ℝ) : sourceAlpha nu = alpha (nu+1/2) := by
  unfold sourceAlpha alpha numerator denominator
  congr 1
  · apply congrArg PowerSeries.mk
    funext n
    rw [← source_factorization]
    convert (numerator_source (nu+1/2) n).symm using 1; congr 1; ring
  · apply congrArg Inv.inv
    apply congrArg PowerSeries.mk
    funext n
    rw [← source_factorization]
    convert (denominator_source (nu+1/2) n).symm using 1; congr 1; ring

theorem conjecture (nu : ℝ) (hnu : |nu| < 1/2) (n : ℕ) (hn : 2 ≤ n) :
    (nu+1/2)^n < PowerSeries.coeff n (sourceAlpha nu) := by
  have hh := abs_lt.mp hnu
  rw [source_alpha_eq]
  apply coefficient_positive
  · linarith
  · linarith
  · exact hn

theorem source_division (nu : ℝ) : sourceAlpha nu * PowerSeries.mk (sourceRaw (nu+1)) =
    PowerSeries.mk (sourceRaw nu) := by
  have hD : PowerSeries.constantCoeff (PowerSeries.mk (sourceRaw (nu+1))) = 1 := by
    simp [← PowerSeries.coeff_zero_eq_constantCoeff_apply, sourceRaw]
  unfold sourceAlpha
  calc
    PowerSeries.mk (sourceRaw nu) * (PowerSeries.mk (sourceRaw (nu+1)))⁻¹ *
        PowerSeries.mk (sourceRaw (nu+1)) =
      PowerSeries.mk (sourceRaw nu) * ((PowerSeries.mk (sourceRaw (nu+1)))⁻¹ *
        PowerSeries.mk (sourceRaw (nu+1))) := by ring
    _ = _ := by rw [PowerSeries.inv_mul_cancel _ (by rw [hD]; norm_num)]; ring

theorem source_unique (nu : ℝ) (f : PowerSeries ℝ)
    (hf : f * PowerSeries.mk (sourceRaw (nu+1)) = PowerSeries.mk (sourceRaw nu)) :
    f = sourceAlpha nu := by
  have hD : PowerSeries.constantCoeff (PowerSeries.mk (sourceRaw (nu+1))) = 1 := by
    simp [← PowerSeries.coeff_zero_eq_constantCoeff_apply, sourceRaw]
  have hi := PowerSeries.mul_inv_cancel (PowerSeries.mk (sourceRaw (nu+1)))
    (by rw [hD]; norm_num)
  unfold sourceAlpha
  calc
    f = f * (PowerSeries.mk (sourceRaw (nu+1)) *
        (PowerSeries.mk (sourceRaw (nu+1)))⁻¹) := by rw [hi]; ring
    _ = _ := by rw [← mul_assoc, hf]

theorem explicit_lower_bound (nu : ℝ) (hnu : |nu| < 1/2) (n : ℕ) (hn : 2 ≤ n) :
    ((n-1 : ℕ) : ℝ) * c (nu+1/2) (n-1) ≤
      PowerSeries.coeff n (sourceAlpha nu) - (nu+1/2)^n := by
  obtain ⟨k, rfl⟩ : ∃ k, n = k+2 := ⟨n-2, by omega⟩
  have hh := abs_lt.mp hnu
  have ha : 0 < nu+1/2 := by linarith
  have ha1 : nu+1/2 < 1 := by linarith
  have hl := core_lower (nu+1/2) ha ha1 (k+2)
  rw [core_coeff] at hl
  simp only [map_sub, geometric, PowerSeries.coeff_mk] at hl
  rw [source_alpha_eq]
  have hk : k+2-1 = k+1 := by omega
  rw [hk]
  push_cast
  nlinarith

end BariczPogany
