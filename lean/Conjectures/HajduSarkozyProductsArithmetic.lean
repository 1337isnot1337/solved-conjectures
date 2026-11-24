import Conjectures.HajduSarkozyArithmetic

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The mixed-row crossed-product obstruction from the existing entry
`results/hajdu-sarkozy-shifted-products/PROOF.md`, section 1. The two fixed
rows may have different positive coefficients; four unrelated edge colors
are not asserted to satisfy this obstruction.

L. Hajdu and A. Sárközy posed the full bivariate conjecture in *On
multiplicative decompositions of polynomial sequences, II*, Conjecture 1
(Acta Arith. 186 (2018)). The documented argument was recorded by Cinna
Davis in commit `83c325ae559864ec0b5e916d90a342b50a81de7f`. The entry credits
earlier geometric-bin and crossed-product methods and retains its bounded
priority qualification. This module is an ingredient, not a complete result.
-/

namespace Conjectures.HajduSarkozy.Products

/-- Positive values of one scaled shifted-power sequence; zero disables a coefficient. -/
def ScaledShiftedPower (k : ℕ) (c : ℤ) (q n : ℕ) : Prop :=
  0 < q ∧ 0 < n ∧ ∃ u : ℕ, 0 < u ∧ (n : ℤ) = (q : ℤ)*(u : ℤ)^k+c

def scaledPowers (k : ℕ) (c : ℤ) (q : ℕ) : Set ℕ :=
  {n | ScaledShiftedPower k c q n}

@[simp] theorem scaledPowers_zero (k : ℕ) (c : ℤ) : scaledPowers k c 0 = ∅ := by
  ext n
  simp [scaledPowers, ScaledShiftedPower]

/-- The four-cycle obstruction is uniform in the two positive row coefficients. -/
theorem no_thin_mixed_four_cycle {k a a' b b' q r : ℕ} {c : ℤ}
    (hk : 2 ≤ k) (hc : c ≠ 0) (ha : 0 < a) (hb : 0 < b)
    (haa : a < a') (hbb : b < b')
    (hlarge : 2*c.natAbs ≤ a*b)
    (hthin : c.natAbs*(a'-a)*(b'-b) < a*b)
    (h11 : ScaledShiftedPower k c q (a*b))
    (h12 : ScaledShiftedPower k c q (a*b'))
    (h21 : ScaledShiftedPower k c r (a'*b))
    (h22 : ScaledShiftedPower k c r (a'*b')) : False := by
  obtain ⟨hq, _, u, hu, he11⟩ := h11
  obtain ⟨_, _, v, hv, he12⟩ := h12
  obtain ⟨hr, _, w, hw, he21⟩ := h21
  obtain ⟨_, _, z, hz, he22⟩ := h22
  have he11' : (q : ℤ)*(u : ℤ)^k = (a : ℤ)*b-c := by push_cast at he11; linarith
  have he12' : (q : ℤ)*(v : ℤ)^k = (a : ℤ)*b'-c := by push_cast at he12; linarith
  have he21' : (r : ℤ)*(w : ℤ)^k = (a' : ℤ)*b-c := by push_cast at he21; linarith
  have he22' : (r : ℤ)*(z : ℤ)^k = (a' : ℤ)*b'-c := by push_cast at he22; linarith
  have hq1 : (1 : ℤ) ≤ q := by exact_mod_cast hq
  have hr1 : (1 : ℤ) ≤ r := by exact_mod_cast hr
  have hD : (1 : ℤ) ≤ (q : ℤ)*r := by
    simpa only [one_mul] using mul_le_mul hq1 hr1 zero_le_one (by positivity : (0 : ℤ) ≤ q)
  have hab : (0 : ℤ) < (a : ℤ)*b := by positivity
  have hcabs : c ≤ (c.natAbs : ℤ) := le_trans (le_abs_self c) (by simp)
  have hlarge' : 2*(c.natAbs : ℤ) ≤ (a : ℤ)*b := by exact_mod_cast hlarge
  have hbase : 0 ≤ (a : ℤ)*b-c := by omega
  have haale : (a : ℤ) ≤ (a' : ℤ) := by exact_mod_cast haa.le
  have hbble : (b : ℤ) ≤ (b' : ℤ) := by exact_mod_cast hbb.le
  have hmin11 : (a : ℤ)*b-c ≤ (q : ℤ)*(u : ℤ)^k := he11'.symm.le
  have hmin12 : (a : ℤ)*b-c ≤ (q : ℤ)*(v : ℤ)^k := by
    rw [he12']
    exact sub_le_sub_right (mul_le_mul_of_nonneg_left hbble (by positivity)) c
  have hmin21 : (a : ℤ)*b-c ≤ (r : ℤ)*(w : ℤ)^k := by
    rw [he21']
    exact sub_le_sub_right (mul_le_mul_of_nonneg_right haale (by positivity)) c
  have hmin22 : (a : ℤ)*b-c ≤ (r : ℤ)*(z : ℤ)^k := by
    rw [he22']
    exact sub_le_sub_right (mul_le_mul haale hbble (by positivity) (by positivity)) c
  have hp : 0 < u*z := Nat.mul_pos hu hz
  have hs : 0 < v*w := Nat.mul_pos hv hw
  have hdet : (q : ℤ)*r*(((u*z : ℕ) : ℤ)^k-((v*w : ℕ) : ℤ)^k) =
      -c*((a' : ℤ)-a)*((b' : ℤ)-b) := by
    calc
      (q : ℤ)*r*(((u*z : ℕ) : ℤ)^k-((v*w : ℕ) : ℤ)^k) =
          ((q : ℤ)*(u : ℤ)^k)*((r : ℤ)*(z : ℤ)^k) -
            ((q : ℤ)*(v : ℤ)^k)*((r : ℤ)*(w : ℤ)^k) := by
        push_cast
        simp only [mul_pow]
        ring
      _ = -c*((a' : ℤ)-a)*((b' : ℤ)-b) := by
        rw [he11', he12', he21', he22']
        exact shifted_determinant a a' b b' c
  have hdifA : (a' : ℤ)-a ≠ 0 := by
    exact ne_of_gt (sub_pos.mpr (by exact_mod_cast haa))
  have hdifB : (b' : ℤ)-b ≠ 0 := by
    exact ne_of_gt (sub_pos.mpr (by exact_mod_cast hbb))
  have hps : u*z ≠ v*w := by
    intro he
    rw [he, sub_self, mul_zero] at hdet
    exact (mul_ne_zero (mul_ne_zero (neg_ne_zero.mpr hc) hdifA) hdifB) hdet.symm
  have hpbound : ((a : ℤ)*b-c)^2 ≤ (q : ℤ)*r*((u*z : ℕ) : ℤ)^k := by
    calc
      ((a : ℤ)*b-c)^2 ≤ ((q : ℤ)*(u : ℤ)^k)*((r : ℤ)*(z : ℤ)^k) := by
        rw [pow_two]
        exact mul_le_mul hmin11 hmin22 hbase (by positivity)
      _ = (q : ℤ)*r*((u*z : ℕ) : ℤ)^k := by push_cast; rw [mul_pow]; ring
  have hsbound : ((a : ℤ)*b-c)^2 ≤ (q : ℤ)*r*((v*w : ℕ) : ℤ)^k := by
    calc
      ((a : ℤ)*b-c)^2 ≤ ((q : ℤ)*(v : ℤ)^k)*((r : ℤ)*(w : ℤ)^k) := by
        rw [pow_two]
        exact mul_le_mul hmin12 hmin21 hbase (by positivity)
      _ = (q : ℤ)*r*((v*w : ℕ) : ℤ)^k := by push_cast; rw [mul_pow]; ring
  have hminbound : ((a : ℤ)*b-c)^2 ≤ (q : ℤ)*r*(min (u*z) (v*w) : ℕ)^k := by
    rcases le_total (u*z) (v*w) with h | h
    · simpa only [min_eq_left h] using hpbound
    · simpa only [min_eq_right h] using hsbound
  have hgap := scaled_power_gap k (u*z) (v*w) ((q : ℤ)*r) ((a : ℤ)*b-c)
    hk hp hs hps hD hminbound
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

end Conjectures.HajduSarkozy.Products
