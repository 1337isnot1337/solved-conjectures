module
public import Conjectures.PomeranceSarkozyPoissonMoments
public import Conjectures.PomeranceSarkozyPoissonTuple

@[expose] public section
namespace PomeranceSarkozy

open scoped NNReal ENNReal BigOperators

private theorem natSquare_descFactorial (k : ℕ) :
    (k:ℝ)^2=(k.descFactorial 2:ℝ)+(k:ℝ) := by
  cases k with
  | zero => norm_num [Nat.descFactorial_succ]
  | succ k =>
    rw [Nat.descFactorial_succ,Nat.descFactorial_one,Nat.succ_sub_one,Nat.cast_mul,Nat.cast_succ]
    ring

theorem poisson_square_hasSum (b : ℝ≥0) :
    HasSum (fun k : ℕ => (k:ℝ)^2*poissonNatMass b k) ((b:ℝ)^2+b) := by
  have he : (fun k : ℕ => (k:ℝ)^2*poissonNatMass b k) =
      fun k : ℕ => (k.descFactorial 2:ℝ)*poissonNatMass b k+(k:ℝ)*poissonNatMass b k := by
    funext k
    rw [natSquare_descFactorial,add_mul]
  rw [he]
  exact (poisson_descFactorial_hasSum b 2).add (poisson_mean_hasSum b)

/-- Centered second moment of the actual Poisson law. -/
theorem poisson_variance_hasSum (b : ℝ≥0) :
    HasSum (fun k : ℕ => ((k:ℝ)-(b:ℝ))^2*poissonNatMass b k) (b:ℝ) := by
  have hm := (poisson_mean_hasSum b).mul_left (2*(b:ℝ))
  have hconst := (poissonNatMass_hasSum b).mul_left ((b:ℝ)^2)
  have hc := ((poisson_square_hasSum b).sub hm).add hconst
  have he : (fun k : ℕ => ((k:ℝ)-(b:ℝ))^2*poissonNatMass b k) =
      (fun k : ℕ => (k:ℝ)^2*poissonNatMass b k -
        2*(b:ℝ)*((k:ℝ)*poissonNatMass b k)+(b:ℝ)^2*poissonNatMass b k) := by
    funext k
    ring
  rw [he]
  convert hc using 1; ring

/-- Poisson survival mass as an extended nonnegative sum. -/
noncomputable def poissonSurvival (b : ℝ≥0) (h : ℕ) : ℝ≥0∞ :=
  ∑' k : ℕ, if h<k then ENNReal.ofReal (poissonNatMass b k) else 0

/-- Exact all-threshold survival-sum identity. -/
theorem poissonSurvival_tsum (b : ℝ≥0) :
    (∑' h,poissonSurvival b h)=ENNReal.ofReal (b:ℝ) := by
  unfold poissonSurvival
  rw [ENNReal.tsum_comm]
  have hstep (k : ℕ) :
      (∑' h : ℕ, if h<k then ENNReal.ofReal (poissonNatMass b k) else 0) =
        ENNReal.ofReal ((k:ℝ)*poissonNatMass b k) := by
    rw [tsum_eq_sum (s:=Finset.range k)]
    · simp only [← Finset.mem_range,Finset.sum_ite_mem,Finset.inter_self,Finset.sum_const,
        Finset.card_range,nsmul_eq_mul,ENNReal.ofReal_mul (Nat.cast_nonneg k),ENNReal.ofReal_natCast]
    · intro h hh
      exact ite_eq_right (fun hh' => hh (Finset.mem_range.mpr hh'))
  simp_rw [hstep]
  rw [← ENNReal.ofReal_tsum_of_nonneg (fun k =>
    mul_nonneg (Nat.cast_nonneg k) (poissonNatMass_nonneg b k))
    (poisson_mean_hasSum b).summable,(poisson_mean_hasSum b).tsum_eq]

end PomeranceSarkozy
