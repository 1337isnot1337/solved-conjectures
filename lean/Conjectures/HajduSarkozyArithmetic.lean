import Mathlib.Tactic

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

The exact crossed-product gap argument from
`results/hajdu-sarkozy-shifted-power-perturbations/PROOF.md`, section 1.
It applies to every integer exponent at least two and every nonzero integer
shift.  No Diophantine finiteness theorem is assumed.

L. Hajdu and A. Sárközy posed the full perturbation conjecture in
*On multiplicative decompositions of polynomial sequences, III*,
Conjecture 1.2 (Acta Arith. 193 (2020)).  The geometric-bin architecture
and preceding Diophantine graph methods are credited in the existing entry,
including C. H. Yip, arXiv:2501.16620.  This module is a local arithmetic
ingredient and does not by itself prove the asymptotic conjecture.
-/

namespace Conjectures.HajduSarkozy

/-- Positive shifted powers, with a fixed integral shift. -/
def ShiftedPower (k : ℕ) (c : ℤ) (n : ℕ) : Prop :=
  0 < n ∧ ∃ m : ℕ, 0 < m ∧ (n : ℤ) = (m : ℤ)^k + c

theorem pow_gap_aux (p q m : ℕ) (hpq : p < q) :
    p^(m+2) + 2*p^(m+1) ≤ q^(m+2) := by
  induction m with
  | zero =>
    have h : p+1 ≤ q := hpq
    have hsq := Nat.pow_le_pow_left h 2
    norm_num at *
    nlinarith
  | succ m ih =>
    calc
      p^(m+1+2) + 2*p^(m+1+1) = (p^(m+2)+2*p^(m+1))*p := by ring
      _ ≤ q^(m+2)*p := Nat.mul_le_mul_right p ih
      _ ≤ q^(m+2)*q := Nat.mul_le_mul_left _ hpq.le
      _ = q^(m+1+2) := by rw [← pow_succ]

theorem pow_gap (k p q : ℕ) (hk : 2 ≤ k) (hpq : p < q) :
    p^k + 2*p^(k-1) ≤ q^k := by
  obtain ⟨m, hm⟩ := Nat.exists_eq_add_of_le hk
  rw [show k = m+2 by omega, show m+2-1 = m+1 by omega]
  exact pow_gap_aux p q m hpq

/-- A gap between distinct positive integral powers is at least twice the lower predecessor power. -/
theorem abs_power_gap (k p q : ℕ) (hk : 2 ≤ k) (hpq : p ≠ q) :
    (2 : ℤ) * (min p q : ℕ)^(k-1) ≤ |(p : ℤ)^k-(q : ℤ)^k| := by
  rcases lt_or_gt_of_ne hpq with h | h
  · rw [min_eq_left h.le, abs_of_nonpos (by exact sub_nonpos.mpr (by exact_mod_cast Nat.pow_le_pow_left h.le k))]
    have hh := pow_gap k p q hk h
    have hhz : (p : ℤ)^k + 2*(p : ℤ)^(k-1) ≤ (q : ℤ)^k := by exact_mod_cast hh
    linarith
  · rw [min_eq_right h.le, abs_of_nonneg (by exact sub_nonneg.mpr (by exact_mod_cast Nat.pow_le_pow_left h.le k))]
    have hh := pow_gap k q p hk h
    have hhz : (q : ℤ)^k + 2*(q : ℤ)^(k-1) ≤ (p : ℤ)^k := by exact_mod_cast hh
    linarith

/-- Squaring removes the fractional powers in the source's lower bound. -/
theorem predecessor_power_lower (k u : ℕ) (D B : ℤ)
    (hk : 2 ≤ k) (hu : 0 < u) (hD : 1 ≤ D)
    (hB : B^2 ≤ D*(u : ℤ)^k) : B ≤ D*(u : ℤ)^(k-1) := by
  have hu' : (1 : ℤ) ≤ (u : ℤ) := by exact_mod_cast hu
  have hpow : (u : ℤ)^k ≤ (u : ℤ)^(2*(k-1)) :=
    pow_le_pow_right₀ hu' (by omega)
  have hDsq : D ≤ D^2 := by nlinarith
  have hsq : B^2 ≤ (D*(u : ℤ)^(k-1))^2 := by
    calc
      B^2 ≤ D*(u : ℤ)^k := hB
      _ ≤ D^2*(u : ℤ)^(2*(k-1)) :=
        mul_le_mul hDsq hpow (by positivity) (by positivity)
      _ = (D*(u : ℤ)^(k-1))^2 := by
        rw [mul_pow, ← pow_mul, Nat.mul_comm 2 (k-1)]
  exact le_of_sq_le_sq hsq (by positivity)

theorem scaled_power_gap (k p q : ℕ) (D B : ℤ)
    (hk : 2 ≤ k) (hp : 0 < p) (hq : 0 < q) (hpq : p ≠ q)
    (hD : 1 ≤ D) (hB : B^2 ≤ D*(min p q : ℕ)^k) :
    2*B ≤ |D*((p : ℤ)^k-(q : ℤ)^k)| := by
  have hmin : 0 < min p q := lt_min hp hq
  have hpred := predecessor_power_lower k (min p q) D B hk hmin hD hB
  have hgap := abs_power_gap k p q hk hpq
  rw [abs_mul, abs_of_nonneg (by omega : 0 ≤ D)]
  have hmul := mul_le_mul_of_nonneg_left hgap (by omega : 0 ≤ D)
  nlinarith

/-- The exact four-cycle determinant before any estimates are made. -/
theorem shifted_determinant (a a' b b' c : ℤ) :
    (a*b-c)*(a'*b'-c) - (a*b'-c)*(a'*b-c) = -c*(a'-a)*(b'-b) := by
  ring

/-- Two sufficiently close rows and columns cannot be a shifted-power four-cycle. -/
theorem no_thin_four_cycle {k a a' b b' : ℕ} {c : ℤ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (hb : 0 < b)
    (haa : a < a') (hbb : b < b')
    (hlarge : 2*c.natAbs ≤ a*b)
    (hthin : c.natAbs*(a'-a)*(b'-b) < a*b)
    (h11 : ShiftedPower k c (a*b)) (h12 : ShiftedPower k c (a*b'))
    (h21 : ShiftedPower k c (a'*b)) (h22 : ShiftedPower k c (a'*b')) : False := by
  obtain ⟨_, u, hu, he11⟩ := h11
  obtain ⟨_, v, hv, he12⟩ := h12
  obtain ⟨_, w, hw, he21⟩ := h21
  obtain ⟨_, z, hz, he22⟩ := h22
  have he11' : (u : ℤ)^k = (a : ℤ)*b-c := by push_cast at he11; linarith
  have he12' : (v : ℤ)^k = (a : ℤ)*b'-c := by push_cast at he12; linarith
  have he21' : (w : ℤ)^k = (a' : ℤ)*b-c := by push_cast at he21; linarith
  have he22' : (z : ℤ)^k = (a' : ℤ)*b'-c := by push_cast at he22; linarith
  have hab : (0 : ℤ) < (a : ℤ)*b := by positivity
  have hcabs : c ≤ (c.natAbs : ℤ) := le_trans (le_abs_self c) (by simp)
  have hlarge' : 2*(c.natAbs : ℤ) ≤ (a : ℤ)*b := by exact_mod_cast hlarge
  have hbase : 0 ≤ (a : ℤ)*b-c := by omega
  have haale : (a : ℤ) ≤ (a' : ℤ) := by exact_mod_cast haa.le
  have hbble : (b : ℤ) ≤ (b' : ℤ) := by exact_mod_cast hbb.le
  have hmin11 : (a : ℤ)*b-c ≤ (u : ℤ)^k := he11'.symm.le
  have hmin12 : (a : ℤ)*b-c ≤ (v : ℤ)^k := by rw [he12']; nlinarith
  have hmin21 : (a : ℤ)*b-c ≤ (w : ℤ)^k := by rw [he21']; nlinarith
  have hmin22 : (a : ℤ)*b-c ≤ (z : ℤ)^k := by rw [he22']; nlinarith
  have hp : 0 < u*z := Nat.mul_pos hu hz
  have hq : 0 < v*w := Nat.mul_pos hv hw
  have hdet : ((u*z : ℕ) : ℤ)^k - ((v*w : ℕ) : ℤ)^k =
      -c*((a' : ℤ)-a)*((b' : ℤ)-b) := by
    push_cast
    rw [mul_pow, mul_pow, he11', he12', he21', he22']
    exact shifted_determinant a a' b b' c
  have hdifA : (a' : ℤ)-a ≠ 0 := by
    exact ne_of_gt (sub_pos.mpr (by exact_mod_cast haa))
  have hdifB : (b' : ℤ)-b ≠ 0 := by
    exact ne_of_gt (sub_pos.mpr (by exact_mod_cast hbb))
  have hpq : u*z ≠ v*w := by
    intro he
    rw [he, sub_self] at hdet
    exact (mul_ne_zero (mul_ne_zero (neg_ne_zero.mpr hc) hdifA) hdifB) hdet.symm
  have hpbound : ((a : ℤ)*b-c)^2 ≤ ((u*z : ℕ) : ℤ)^k := by
    rw [Nat.cast_mul, mul_pow, pow_two]
    exact mul_le_mul hmin11 hmin22 hbase (by positivity)
  have hqbound : ((a : ℤ)*b-c)^2 ≤ ((v*w : ℕ) : ℤ)^k := by
    rw [Nat.cast_mul, mul_pow, pow_two]
    exact mul_le_mul hmin12 hmin21 hbase (by positivity)
  have hminbound : ((a : ℤ)*b-c)^2 ≤ (min (u*z) (v*w) : ℕ)^k := by
    rcases le_total (u*z) (v*w) with h | h
    · simpa only [min_eq_left h] using hpbound
    · simpa only [min_eq_right h] using hqbound
  have hgap := scaled_power_gap k (u*z) (v*w) 1 ((a : ℤ)*b-c)
    hk hp hq hpq (by norm_num) (by simpa using hminbound)
  simp only [one_mul] at hgap
  rw [hdet, abs_mul, abs_mul, abs_neg,
    abs_of_nonneg (sub_nonneg.mpr haale),
    abs_of_nonneg (sub_nonneg.mpr hbble)] at hgap
  have hthin' : (c.natAbs : ℤ)*((a' : ℤ)-a)*((b' : ℤ)-b) < (a : ℤ)*b := by
    have hh : (c.natAbs : ℤ)*((a'-a : ℕ) : ℤ)*((b'-b : ℕ) : ℤ) < (a : ℤ)*b := by
      exact_mod_cast hthin
    simpa only [Nat.cast_sub haa.le, Nat.cast_sub hbb.le] using hh
  have habs : |c| = (c.natAbs : ℤ) := by simp
  rw [habs] at hgap
  omega

end Conjectures.HajduSarkozy
