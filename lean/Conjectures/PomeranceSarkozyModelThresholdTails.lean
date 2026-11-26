module
public import Conjectures.PomeranceSarkozyPoissonVariance

@[expose] public section
namespace PomeranceSarkozy

open scoped NNReal ENNReal BigOperators

/-- Survival probabilities are bounded by the mass of the full Poisson law. -/
theorem poissonSurvival_le_one (b : ℝ≥0) (h : ℕ) : poissonSurvival b h ≤ 1 := by
  calc
    poissonSurvival b h ≤ ∑' k, ENNReal.ofReal (poissonNatMass b k) := by
      apply ENNReal.tsum_le_tsum
      intro k
      by_cases hk : h < k <;> simp [hk]
    _ = 1 := by
      rw [← ENNReal.ofReal_tsum_of_nonneg (poissonNatMass_nonneg b)
        (poissonNatMass_hasSum b).summable, (poissonNatMass_hasSum b).tsum_eq, ENNReal.ofReal_one]

private theorem poissonSurvival_ne_top (b : ℝ≥0) (h : ℕ) : poissonSurvival b h ≠ ∞ :=
  ne_top_of_le_ne_top ENNReal.one_ne_top (poissonSurvival_le_one b h)

theorem poissonSurvival_toReal_le_one (b : ℝ≥0) (h : ℕ) :
    (poissonSurvival b h).toReal ≤ 1 := by
  simpa using ENNReal.toReal_mono ENNReal.one_ne_top (poissonSurvival_le_one b h)

theorem poissonSurvival_toReal_summable (b : ℝ≥0) :
    Summable fun h => (poissonSurvival b h).toReal := by
  apply ENNReal.summable_toReal
  rw [poissonSurvival_tsum]
  exact ENNReal.ofReal_ne_top

theorem poissonSurvival_toReal_tsum (b : ℝ≥0) :
    (∑' h, (poissonSurvival b h).toReal) = (b : ℝ) := by
  rw [← ENNReal.tsum_toReal_eq (poissonSurvival_ne_top b), poissonSurvival_tsum,
    ENNReal.toReal_ofReal b.coe_nonneg]

/-- Above twice the mean, the expected excess is bounded by the variance divided by the mean. -/
theorem poissonSurvival_tail_tsum_le_one (b : ℝ≥0) (H : ℕ) (hb : 0 < b)
    (hH : 2 * (b : ℝ) ≤ (H : ℝ)) : (∑' j : ℕ, poissonSurvival b (H + 1 + j)) ≤ 1 := by
  have hbReal : 0 < (b : ℝ) := hb
  unfold poissonSurvival
  rw [ENNReal.tsum_comm]
  have hcount (k : ℕ) :
      (∑' j : ℕ, if H + 1 + j < k then ENNReal.ofReal (poissonNatMass b k) else 0) =
        ENNReal.ofReal ((↑(k - (H + 1)) : ℝ) * poissonNatMass b k) := by
    have hlt (j : ℕ) : H + 1 + j < k ↔ j < k - (H + 1) := by omega
    simp_rw [hlt]
    rw [tsum_eq_sum (s := Finset.range (k - (H + 1)))]
    · simp only [← Finset.mem_range, Finset.sum_ite_mem, Finset.inter_self, Finset.sum_const,
        Finset.card_range, nsmul_eq_mul, ENNReal.ofReal_mul (Nat.cast_nonneg _),
        ENNReal.ofReal_natCast]
    · intro j hj
      exact ite_eq_right fun hj' => hj (Finset.mem_range.mpr hj')
  simp_rw [hcount]
  calc
    _ ≤ ∑' k : ℕ, ENNReal.ofReal (((k : ℝ) - b)^2 * poissonNatMass b k * (b : ℝ)⁻¹) := by
      apply ENNReal.tsum_le_tsum
      intro k
      apply ENNReal.ofReal_le_ofReal
      have hexcess : (↑(k - (H + 1)) : ℝ) ≤ ((k : ℝ) - b)^2 / (b : ℝ) := by
        by_cases hk : k ≤ H + 1
        · simp [Nat.sub_eq_zero_of_le hk, div_nonneg (sq_nonneg _) hbReal.le]
        · have hkReal : ((H + 1 : ℕ) : ℝ) ≤ (k : ℝ) := by exact_mod_cast (Nat.le_of_lt (Nat.lt_of_not_ge hk))
          have hgap : (b : ℝ) ≤ (k : ℝ) - b := by push_cast at hkReal; linarith
          have hcutoff : (b : ℝ) ≤ ((H + 1 : ℕ) : ℝ) := by push_cast; linarith
          rw [Nat.cast_sub (by omega), le_div_iff₀ hbReal]
          calc
            _ ≤ ((k : ℝ) - b) * (b : ℝ) := by gcongr
            _ ≤ ((k : ℝ) - b)^2 := by rw [sq]; gcongr; linarith
      rw [← mul_right_comm, ← div_eq_mul_inv]
      exact mul_le_mul_of_nonneg_right hexcess (poissonNatMass_nonneg b k)
    _ = 1 := by
      have hmoment := (poisson_variance_hasSum b).mul_right ((b : ℝ)⁻¹)
      have hnonneg (k : ℕ) : 0 ≤ ((k : ℝ) - b)^2 * poissonNatMass b k * (b : ℝ)⁻¹ :=
        mul_nonneg (mul_nonneg (sq_nonneg _) (poissonNatMass_nonneg b k)) (inv_nonneg.mpr hbReal.le)
      rw [← ENNReal.ofReal_tsum_of_nonneg hnonneg hmoment.summable,
        hmoment.tsum_eq, mul_inv_cancel₀ hbReal.ne', ENNReal.ofReal_one]

private theorem tsum_eq_zero_add_sum_Icc_add_tail {f : ℕ → ℝ} (hf : Summable f) (H : ℕ) :
    (∑' h, f h) = f 0 + (∑ h ∈ Finset.Icc 1 H, f h) + ∑' j, f (H + 1 + j) := by
  rw [← hf.sum_add_tsum_nat_add (H + 1), Nat.range_succ_eq_Icc_zero]
  have hinsert : insert 0 (Finset.Icc 1 H) = Finset.Icc 0 H := by
    ext h
    simp only [Finset.mem_insert, Finset.mem_Icc]
    omega
  rw [← hinsert, Finset.sum_insert (by simp)]
  simp only [Nat.add_comm (H + 1)]

private theorem poissonSurvival_tail_toReal_tsum_le_one (b : ℝ≥0) (H : ℕ) (hb : 0 < b)
    (hH : 2 * (b : ℝ) ≤ (H : ℝ)) :
    (∑' j : ℕ, (poissonSurvival b (H + 1 + j)).toReal) ≤ 1 := by
  rw [← ENNReal.tsum_toReal_eq (fun j => poissonSurvival_ne_top b (H + 1 + j))]
  simpa using ENNReal.toReal_mono ENNReal.one_ne_top (poissonSurvival_tail_tsum_le_one b H hb hH)

/-- Omitting threshold zero and truncating above twice the mean changes the shifted
survival mean by at most one. -/
theorem poissonSurvival_truncated_mean_bound (b : ℝ≥0) (H : ℕ) (hb : 0 < b)
    (hH : 2 * (b : ℝ) ≤ (H : ℝ)) :
    |1 + (∑ h ∈ Finset.Icc 1 H, (poissonSurvival b h).toReal) - (b : ℝ)| ≤ 1 := by
  have hsplit := tsum_eq_zero_add_sum_Icc_add_tail (poissonSurvival_toReal_summable b) H
  rw [poissonSurvival_toReal_tsum] at hsplit
  have htail := poissonSurvival_tail_toReal_tsum_le_one b H hb hH
  have htail_nonneg : 0 ≤ ∑' j : ℕ, (poissonSurvival b (H + 1 + j)).toReal :=
    tsum_nonneg fun _ => ENNReal.toReal_nonneg
  have hzero := poissonSurvival_toReal_le_one b 0
  have hzero_nonneg : 0 ≤ (poissonSurvival b 0).toReal := ENNReal.toReal_nonneg
  rw [abs_le]
  constructor <;> linarith

private theorem poissonSurvival_variance_nonneg (b : ℝ≥0) (h : ℕ) :
    0 ≤ (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal) :=
  mul_nonneg ENNReal.toReal_nonneg (sub_nonneg.mpr (poissonSurvival_toReal_le_one b h))

private theorem poissonSurvival_variance_le (b : ℝ≥0) (h : ℕ) :
    (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal) ≤
      (poissonSurvival b h).toReal := by
  simpa only [mul_one] using mul_le_mul_of_nonneg_left
    (sub_le_self 1 ENNReal.toReal_nonneg) (ENNReal.toReal_nonneg (a := poissonSurvival b h))

theorem poissonSurvival_variance_summable (b : ℝ≥0) :
    Summable fun h => (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal) :=
  Summable.of_nonneg_of_le (poissonSurvival_variance_nonneg b) (poissonSurvival_variance_le b)
    (poissonSurvival_toReal_summable b)

/-- The finite Bernoulli variance sum differs from the full sum by at most two. -/
theorem poissonSurvival_truncated_variance_bound (b : ℝ≥0) (H : ℕ) (hb : 0 < b)
    (hH : 2 * (b : ℝ) ≤ (H : ℝ)) :
    |(∑' h, (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal)) -
      (∑ h ∈ Finset.Icc 1 H, (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal))| ≤ 2 := by
  let f (h : ℕ) := (poissonSurvival b h).toReal * (1 - (poissonSurvival b h).toReal)
  change |(∑' h, f h) - ∑ h ∈ Finset.Icc 1 H, f h| ≤ 2
  have hf : Summable f := poissonSurvival_variance_summable b
  have hfTail : Summable fun j => f (H + 1 + j) := by
    simpa only [Nat.add_comm (H + 1)] using (summable_nat_add_iff (H + 1) (f := f)).mpr hf
  have hsTail : Summable fun j => (poissonSurvival b (H + 1 + j)).toReal := by
    simpa only [Nat.add_comm (H + 1)] using
      (summable_nat_add_iff (H + 1)).mpr (poissonSurvival_toReal_summable b)
  have htail : (∑' j, f (H + 1 + j)) ≤ 1 :=
    (hfTail.tsum_le_tsum (fun j => poissonSurvival_variance_le b (H + 1 + j)) hsTail).trans
      (poissonSurvival_tail_toReal_tsum_le_one b H hb hH)
  have htail_nonneg : 0 ≤ ∑' j, f (H + 1 + j) :=
    tsum_nonneg fun j => poissonSurvival_variance_nonneg b (H + 1 + j)
  have hzero : f 0 ≤ 1 := (poissonSurvival_variance_le b 0).trans (poissonSurvival_toReal_le_one b 0)
  have hzero_nonneg : 0 ≤ f 0 := poissonSurvival_variance_nonneg b 0
  rw [tsum_eq_zero_add_sum_Icc_add_tail hf H, abs_le]
  constructor <;> linarith

end PomeranceSarkozy
