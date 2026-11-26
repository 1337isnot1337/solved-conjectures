import Conjectures.OrdinaryDarcais
import Conjectures.HeimNeuhauserPlanePartitionSaddle
import Mathlib.Analysis.Normed.Group.FunctionSeries
import Mathlib.Analysis.SpecificLimits.Normed

/-! Moment convergence and the unique positive saddle radius for the original weights. -/

namespace OrdinaryDarcais

open Set

theorem divisorSum_lower (n : ℕ) : n ≤ divisorSum n := by
  by_cases zero : n=0
  · simp [zero]
  · exact Finset.single_le_sum (f := fun d : ℕ => d) (fun _ _ => Nat.zero_le _)
      (Nat.mem_divisors.mpr ⟨dvd_refl n,zero⟩)

theorem divisorSum_le_square (n : ℕ) : divisorSum n ≤ PlanePartition.divisorSquareSum n := by
  unfold divisorSum PlanePartition.divisorSquareSum
  apply Finset.sum_le_sum
  intro d _
  cases d with
  | zero => simp
  | succ d => simp [pow_two, Nat.succ_mul, Nat.mul_succ]

noncomputable def momentTerm (j k : ℕ) (r : ℝ) : ℝ :=
  (k : ℝ) ^ j * (divisorSum k : ℝ) * r ^ k

noncomputable def moment (j : ℕ) (r : ℝ) : ℝ := ∑' k : ℕ, momentTerm j k r

theorem momentTerm_nonneg (j k : ℕ) {r : ℝ} (hr : 0 ≤ r) : 0 ≤ momentTerm j k r := by
  unfold momentTerm
  positivity

theorem moment_summable (j : ℕ) {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    Summable (fun k : ℕ => momentTerm j k r) := by
  refine Summable.of_nonneg_of_le (fun k => momentTerm_nonneg _ _ hr) (fun k => ?_)
    (PlanePartition.moment_summable j hr hr')
  unfold momentTerm PlanePartition.momentTerm
  gcongr
  exact_mod_cast divisorSum_le_square k

theorem moment_continuousOn (j : ℕ) {R : ℝ} (hR : 0 ≤ R) (hR' : R < 1) :
    ContinuousOn (moment j) (Icc 0 R) := by
  apply continuousOn_tsum (u := fun k => momentTerm j k R)
  · intro k
    exact (show Continuous (momentTerm j k) by unfold momentTerm; fun_prop).continuousOn
  · exact moment_summable j hR hR'
  · intro k r hr
    rw [Real.norm_eq_abs, abs_of_nonneg (momentTerm_nonneg j k hr.1)]
    unfold momentTerm
    exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hr.1 hr.2 k) (by positivity)

theorem moment_strictMono (j : ℕ) : StrictMonoOn (moment j) (Ico 0 1) := by
  intro a ha b hb hab
  apply (moment_summable j ha.1 ha.2).tsum_lt_tsum
  · intro k
    unfold momentTerm
    exact mul_le_mul_of_nonneg_left (pow_le_pow_left₀ ha.1 hab.le k) (by positivity)
  · exact (show momentTerm j 1 a < momentTerm j 1 b by simpa [momentTerm] using hab)
  · exact moment_summable j hb.1 hb.2

@[simp] theorem moment_zero (j : ℕ) : moment j 0 = 0 := by
  have hz (k : ℕ) : momentTerm j k 0 = 0 := by
    cases k <;> simp [momentTerm, divisorSum]
  simp [moment, hz]

theorem geometric_le_mean {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    (1 - r)⁻¹ ≤ 1 + moment 0 r := by
  have hg := summable_geometric_of_lt_one hr hr'
  have hm := moment_summable 0 hr hr'
  rw [← tsum_geometric_of_lt_one hr hr', hg.tsum_eq_zero_add, moment, hm.tsum_eq_zero_add]
  have hz : momentTerm 0 0 r = 0 := by simp [momentTerm, divisorSum]
  simp only [pow_zero, hz, zero_add]
  apply add_le_add_right
  apply (summable_nat_add_iff 1).mpr hg |>.tsum_le_tsum
  · intro k
    have hlow : 1 ≤ divisorSum (k + 1) := by
      exact (by omega : 1 ≤ k+1).trans (divisorSum_lower _)
    have hreal : (1 : ℝ) ≤ (divisorSum (k + 1) : ℝ) := by exact_mod_cast hlow
    simpa [momentTerm] using mul_le_mul_of_nonneg_right hreal (pow_nonneg hr (k + 1))
  · exact (summable_nat_add_iff 1).mpr hm

/-- The positive radius where the tilted mean equals n exists and is unique. -/
theorem existsUnique_saddle {x n : ℝ} (hx : 0 < x) (hn : 0 < n) :
    ∃! r : ℝ, r ∈ Ioo (0 : ℝ) 1 ∧ x * moment 0 r = n := by
  let R := n / (n + x)
  have hs : 0 < n + x := by positivity
  have hR : 0 < R := div_pos hn hs
  have hR' : R < 1 := (div_lt_one hs).mpr (by linarith)
  have hmean : n ≤ x * moment 0 R := by
    have h := mul_le_mul_of_nonneg_left (geometric_le_mean hR.le hR') hx.le
    have hbase : x * (1 - R)⁻¹ = n + x := by
      dsimp [R]
      rw [show 1 - n / (n + x) = x / (n + x) by field_simp [hs.ne']; ring, inv_div]
      field_simp [hx.ne']
    rw [hbase] at h
    linarith
  obtain ⟨r, hr, he⟩ := intermediate_value_Icc hR.le
    (continuousOn_const.mul (moment_continuousOn 0 hR.le hR')) (show n ∈ Icc (x * moment 0 0) (x * moment 0 R) by
      simpa using And.intro hn.le hmean)
  change x * moment 0 r = n at he
  have hrpos : 0 < r := by
    rcases eq_or_lt_of_le hr.1 with hz | h
    · rw [← hz, moment_zero, mul_zero] at he
      linarith
    · exact h
  have hr1 := hr.2.trans_lt hR'
  refine ⟨r, ⟨⟨hrpos, hr1⟩, he⟩, ?_⟩
  rintro s ⟨hs', he'⟩
  apply (moment_strictMono 0).injOn ⟨hs'.1.le, hs'.2⟩ ⟨hrpos.le, hr1⟩
  exact mul_left_cancel₀ hx.ne' (he'.trans he.symm)

end OrdinaryDarcais
