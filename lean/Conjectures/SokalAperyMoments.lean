import Mathlib.Analysis.Complex.CauchyIntegral
import Mathlib.Data.Nat.Choose.Bounds
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Measure.ResolventTransform
import Mathlib.Tactic

/-! Apéry moments and necessary conditions on a Stieltjes representing measure. -/

namespace SokalApery

open Finset Set Filter MeasureTheory
open scoped Topology

/-- The Apéry polynomial evaluated at a real parameter. -/
def apery (x : ℝ) (n : ℕ) : ℝ :=
  ∑ k ∈ range (n + 1), (n.choose k : ℝ) ^ 2 * ((n + k).choose k : ℝ) ^ 2 * x ^ k

/-- A positive Borel measure supported on the nonnegative real axis, with all the stated moments. -/
def Represents (ν : Measure ℝ) (a : ℕ → ℝ) : Prop :=
  (∀ᵐ q ∂ν, 0 ≤ q) ∧
    ∀ n, Integrable (fun q : ℝ => q ^ n) ν ∧ (∫ q : ℝ, q ^ n ∂ν) = a n

def IsStieltjes (a : ℕ → ℝ) : Prop := ∃ ν, Represents ν a

theorem apery_zero_index (x : ℝ) : apery x 0 = 1 := by simp [apery]

theorem apery_nonneg {x : ℝ} (hx : 0 ≤ x) (n : ℕ) : 0 ≤ apery x n := by
  unfold apery
  positivity

/-- An exponential bound on the full parameter interval in the excluded-side argument. -/
theorem apery_le_pow {x : ℝ} (hx : 0 ≤ x) (hx' : x ≤ 1) (n : ℕ) :
    apery x n ≤ (128 : ℝ) ^ n := by
  have hn (i : ℕ) : i + 1 ≤ 2 ^ i := by
    induction i with
    | zero => simp
    | succ i hi => rw [pow_succ]; omega
  have hk (k : ℕ) (h : k ∈ range (n + 1)) :
      (n.choose k : ℝ) ^ 2 * ((n + k).choose k : ℝ) ^ 2 * x ^ k ≤ (64 : ℝ) ^ n := by
    have hk' : k ≤ n := Nat.le_of_lt_succ (mem_range.mp h)
    have h₁ : (n.choose k : ℝ) ≤ (2 : ℝ) ^ n := by exact_mod_cast Nat.choose_le_two_pow n k
    have h₂ : ((n + k).choose k : ℝ) ≤ (4 : ℝ) ^ n := by
      calc
        _ ≤ (2 : ℝ) ^ (n + k) := by exact_mod_cast Nat.choose_le_two_pow (n + k) k
        _ ≤ (2 : ℝ) ^ (n + n) := pow_le_pow_right₀ (by norm_num) (Nat.add_le_add_left hk' n)
        _ = _ := by rw [pow_add, ← mul_pow]; norm_num
    calc
      _ ≤ ((2 : ℝ) ^ n) ^ 2 * ((4 : ℝ) ^ n) ^ 2 * 1 := by
        gcongr
        exact pow_le_one₀ hx hx'
      _ = _ := by rw [← pow_mul, ← pow_mul, mul_comm n 2, pow_mul, pow_mul, ← mul_pow]; norm_num
  calc
    _ ≤ ∑ _k ∈ range (n + 1), (64 : ℝ) ^ n := sum_le_sum hk
    _ = (n + 1 : ℝ) * (64 : ℝ) ^ n := by simp [nsmul_eq_mul]
    _ ≤ (2 : ℝ) ^ n * (64 : ℝ) ^ n := by gcongr; exact_mod_cast hn n
    _ = _ := by rw [← mul_pow]; norm_num

theorem Represents.isFiniteMeasure {ν : Measure ℝ} {a : ℕ → ℝ} (h : Represents ν a) :
    IsFiniteMeasure ν := by
  have hi := (h.2 0).1
  simp only [pow_zero] at hi
  exact (integrable_const_iff_isFiniteMeasure one_ne_zero).mp hi

/-- The exponential moment bound forces a compactly supported representing measure. -/
theorem apery_support_subset {ν : Measure ℝ} {x : ℝ} (hx : 0 ≤ x) (hx' : x ≤ 1)
    (hν : Represents ν (apery x)) : ν.support ⊆ Icc 0 129 := by
  let := hν.isFiniteMeasure
  let U := Ioi (129 : ℝ)
  have hle (n : ℕ) : (129 : ℝ) ^ n * ν.real U ≤ (128 : ℝ) ^ n := by
    calc
      _ = ∫ _ in U, (129 : ℝ) ^ n ∂ν := by rw [setIntegral_const, smul_eq_mul, mul_comm]
      _ ≤ ∫ q in U, q ^ n ∂ν := by
        apply setIntegral_mono_on (integrable_const _) (hν.2 n).1.integrableOn measurableSet_Ioi
        intro q hq
        exact pow_le_pow_left₀ (by norm_num) (mem_Ioi.mp hq).le _
      _ ≤ ∫ q : ℝ, q ^ n ∂ν := by
        apply setIntegral_le_integral (hν.2 n).1
        filter_upwards [hν.1] with q hq using pow_nonneg hq n
      _ ≤ _ := (hν.2 n).2.le.trans (apery_le_pow hx hx' n)
  have hb (n : ℕ) : ν.real U ≤ ((128 : ℝ) / 129) ^ n := by
    rw [div_pow, le_div_iff₀ (by positivity)]
    simpa [mul_comm] using hle n
  have hz : ν.real U = 0 := by
    apply le_antisymm _ measureReal_nonneg
    exact ge_of_tendsto' (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num) (by norm_num)) hb
  have hn : ν U = 0 := (measureReal_eq_zero_iff (measure_ne_top ν U)).mp hz
  apply Measure.support_subset_of_isClosed isClosed_Icc
  have hu : ∀ᵐ q ∂ν, q ∉ U := ae_iff.mpr (by simpa using hn)
  filter_upwards [hν.1, hu] with q hq hq'
  exact ⟨hq, le_of_not_gt hq'⟩

/-- A shifted or unshifted finite Hankel quadratic form. -/
def hankelForm (a : ℕ → ℝ) {d : ℕ} (c : Fin d → ℝ) (s : ℕ) : ℝ :=
  ∑ i, ∑ j, c i * c j * a (s + i.val + j.val)

/-- The Hankel forms of a Stieltjes moment sequence integrate a nonnegative weighted square. -/
theorem hankelForm_nonneg {a : ℕ → ℝ} (ha : IsStieltjes a) {d : ℕ} (c : Fin d → ℝ) (s : ℕ) :
    0 ≤ hankelForm a c s := by
  obtain ⟨ν, hν⟩ := ha
  have hi (i j : Fin d) : Integrable (fun q => (c i * c j) * q ^ (s + i.val + j.val)) ν :=
    (hν.2 _).1.const_mul _
  have he (q : ℝ) :
      q ^ s * (∑ i, c i * q ^ i.val) ^ 2 =
        ∑ i, ∑ j, c i * c j * q ^ (s + i.val + j.val) := by
    simp only [pow_two, sum_mul, mul_sum, pow_add]
    refine sum_congr rfl fun i _ => sum_congr rfl fun j _ => ?_
    ring
  calc
    0 ≤ ∫ q, q ^ s * (∑ i, c i * q ^ i.val) ^ 2 ∂ν := by
      apply integral_nonneg_of_ae
      filter_upwards [hν.1] with q hq using mul_nonneg (pow_nonneg hq _) (sq_nonneg _)
    _ = _ := by
      simp_rw [he, hankelForm]
      rw [integral_finsetSum _ _]
      · apply sum_congr rfl
        intro i _
        rw [integral_finsetSum _ (fun j _ => hi i j)]
        simp only [integral_const_mul, (hν.2 _).2]
      · exact fun i _ => integrable_finsetSum _ (fun j _ => hi i j)

/-- A fixed quadratic gives a negative Hankel form on a subinterval adjacent to zero. -/
theorem not_stieltjes_of_small_parameter {x : ℝ} (hx : 0 < x) (hx' : x ≤ 1 / 40) :
    ¬ IsStieltjes (apery x) := by
  intro h
  have hp := hankelForm_nonneg h (![3, -4, 1] : Fin 3 → ℝ) 0
  have he : hankelForm (apery x) (![3, -4, 1] : Fin 3 → ℝ) 0 =
      x * (-56 + 1692 * x + 16400 * x ^ 2 + 4900 * x ^ 3) := by
    norm_num [hankelForm, Fin.sum_univ_succ, apery, Finset.sum_range_succ, Nat.choose]
    ring
  have hp2 : x ^ 2 ≤ (1 / 40 : ℝ) ^ 2 := pow_le_pow_left₀ hx.le hx' _
  have hp3 : x ^ 3 ≤ (1 / 40 : ℝ) ^ 3 := pow_le_pow_left₀ hx.le hx' _
  rw [he] at hp
  exact (not_lt_of_ge hp) (mul_neg_of_pos_of_neg hx (by linarith))

private def quarterWitness (x : ℝ) : ℝ :=
  hankelForm (apery x) (![5664, -5368, 1448, -147, 5] : Fin 5 → ℝ) 1

private theorem quarterWitness_neg : quarterWitness (1 / 4) < 0 := by
  norm_num [quarterWitness, hankelForm, Fin.sum_univ_succ, apery, Finset.sum_range_succ, Nat.choose]

/-- At the exceptional parameter one quarter, a shifted Hankel form is negative. -/
theorem not_stieltjes_at_quarter : ¬ IsStieltjes (apery (1 / 4)) :=
  fun h => quarterWitness_neg.not_ge (hankelForm_nonneg h _ _)

/-- The same shifted Hankel form excludes an open neighborhood of one quarter. -/
theorem eventually_not_stieltjes_at_quarter : ∀ᶠ x : ℝ in 𝓝 (1 / 4), ¬ IsStieltjes (apery x) := by
  have hc : Continuous quarterWitness := by unfold quarterWitness hankelForm apery; fun_prop
  have h : ∀ᶠ x : ℝ in 𝓝 (1 / 4), quarterWitness x < 0 :=
    (isOpen_lt hc continuous_const).mem_nhds quarterWitness_neg
  exact h.mono fun x hx hμ => hx.not_ge (hankelForm_nonneg hμ _ _)

/-- The ordinary generating function written as a moment integral. -/
noncomputable def momentTransform (ν : Measure ℝ) (z : ℂ) : ℂ :=
  ∫ q : ℝ, (1 - (q : ℂ) * z)⁻¹ ∂ν

private theorem momentTransform_eq_resolvent (ν : Measure ℝ) {z : ℂ} (hz : z ≠ 0) :
    momentTransform ν z = -z⁻¹ * resolventTransform ν z⁻¹ := by
  rw [momentTransform, resolventTransform_apply, ← integral_const_mul]
  apply integral_congr_ae (Eventually.of_forall fun q => ?_)
  rw [resolvent, Ring.inverse_eq_inv]
  change (1 - (q : ℂ) * z)⁻¹ = -z⁻¹ * ((q : ℂ) - z⁻¹)⁻¹
  have he : 1 - (q : ℂ) * z = (-z) * ((q : ℂ) - z⁻¹) := by
    field_simp
    ring
  rw [he, mul_inv, inv_neg]

/-- A Stieltjes representation gives a holomorphic continuation at each nonreal
or negative real argument. -/
theorem momentTransform_analyticAt {ν : Measure ℝ} {a : ℕ → ℝ} (hν : Represents ν a)
    {z : ℂ} (hz : z.im ≠ 0 ∨ z.re < 0) : AnalyticAt ℂ (momentTransform ν) z := by
  let := hν.isFiniteMeasure
  have h0 : z ≠ 0 := by rintro rfl; simp at hz
  have hsupport : ν.support ⊆ Ici 0 := Measure.support_subset_of_isClosed isClosed_Ici hν.1
  have hn : z⁻¹ ∈ (algebraMap ℝ ℂ '' ν.support)ᶜ := by
    rintro ⟨q, hq, he⟩
    have hq₀ : 0 ≤ q := hsupport hq
    change (q : ℂ) = z⁻¹ at he
    have he' : z = ((q : ℂ)⁻¹) := by rw [he, inv_inv]
    rw [he', ← Complex.ofReal_inv, Complex.ofReal_im, Complex.ofReal_re] at hz
    exact hz.elim (fun h => h rfl) (not_lt_of_ge (inv_nonneg.mpr hq₀))
  have hopen : IsOpen (algebraMap ℝ ℂ '' ν.support)ᶜ :=
    (Complex.isometry_ofReal.isClosedEmbedding.isClosedMap _ Measure.isClosed_support).isOpen_compl
  have ha : AnalyticAt ℂ (resolventTransform (A := ℂ) ν) z⁻¹ :=
    AnalyticOn.analyticAt (hopen.mem_nhds hn) analyticOn_resolventTransform
  have hi : AnalyticAt ℂ (fun w : ℂ => w⁻¹) z := analyticAt_inv h0
  have hne : ∀ᶠ w : ℂ in 𝓝 z, w ≠ 0 := isOpen_ne.mem_nhds h0
  exact (hi.neg.mul (ha.comp hi)).congr
    (hne.mono fun w hw => (momentTransform_eq_resolvent ν hw).symm)

/-- Near zero the continuation agrees with the actual Apéry series. -/
theorem momentTransform_hasSum {ν : Measure ℝ} {x : ℝ} (hx : 0 ≤ x) (hx' : x ≤ 1)
    (hν : Represents ν (apery x)) {z : ℂ} (hz : ‖z‖ < 1 / 129) :
    HasSum (fun n : ℕ => (apery x n : ℂ) * z ^ n) (momentTransform ν z) := by
  let := hν.isFiniteMeasure
  let r := 129 * ‖z‖
  have hr₀ : 0 ≤ r := by positivity
  have hr₁ : r < 1 := by dsimp [r]; linarith
  have hb : ∀ᵐ q : ℝ ∂ν, ‖(q : ℂ) * z‖ ≤ r := by
    filter_upwards [Measure.support_mem_ae] with q hq
    have h := apery_support_subset hx hx' hν hq
    rw [norm_mul, Complex.norm_real, Real.norm_of_nonneg h.1]
    exact mul_le_mul_of_nonneg_right h.2 (norm_nonneg z)
  have he (n : ℕ) : (∫ q : ℝ, ((q : ℂ) * z) ^ n ∂ν) = (apery x n : ℂ) * z ^ n := by
    simp only [mul_pow, ← Complex.ofReal_pow, integral_mul_const, integral_complex_ofReal, (hν.2 n).2]
  simp_rw [← he]
  apply hasSum_integral_of_dominated_convergence (fun n (_ : ℝ) => r ^ n)
  · intro n
    fun_prop
  · intro n
    filter_upwards [hb] with q hq
    rw [norm_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) hq n
  · exact Eventually.of_forall fun _ => summable_geometric_of_lt_one hr₀ hr₁
  · exact integrable_const _
  · filter_upwards [hb] with q hq
    exact hasSum_geometric_of_norm_lt_one (hq.trans_lt hr₁)

end SokalApery
