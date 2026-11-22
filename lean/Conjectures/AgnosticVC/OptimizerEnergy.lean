module

public import Conjectures.AgnosticVC.OptimizerSensitivity
public import Conjectures.AgnosticVC.Information
public import Mathlib.Analysis.Calculus.ContDiff.Deriv
public import Mathlib.Analysis.SpecialFunctions.Sqrt
public import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus

@[expose] public section

open scoped BigOperators Topology
open MeasureTheory Set

namespace AgnosticVC

variable {α κ : Type*} [Fintype α] [Fintype κ]
variable {γ : κ → Type*} [∀ j, Fintype (γ j)]

@[simp] theorem hellingerSq_self (p : α → ℝ) : hellingerSq p p = 0 := by simp [hellingerSq]

theorem hellingerSq_comm (p q : α → ℝ) : hellingerSq p q = hellingerSq q p := by
  exact Finset.sum_congr rfl fun a _ => by ring

/-- The score's squared norm, expressed directly in mass coordinates. -/
noncomputable def scoreEnergy (p v : α → ℝ) : ℝ := ∑ a, (v a)^2 / p a

theorem scoreEnergy_nonneg {p : α → ℝ} (hp : ∀ a, 0 ≤ p a) (v : α → ℝ) :
    0 ≤ scoreEnergy p v := Finset.sum_nonneg fun a _ => div_nonneg (sq_nonneg _) (hp a)

private theorem scoreEnergy_sqrt (p v : α → ℝ) (hp : ∀ a, 0 < p a) :
    (∑ a, (v a / (2 * √(p a)))^2) = scoreEnergy p v / 4 := by
  unfold scoreEnergy
  rw [Finset.sum_div]
  apply Finset.sum_congr rfl
  intro a _
  rw [div_pow, mul_pow, Real.sq_sqrt (hp a).le]
  ring

private theorem integral_sq_cs {g : ℝ → ℝ} {a b : ℝ} (hab : a < b)
    (hg : ContinuousOn g (Icc a b)) :
    (∫ t in a..b, g t)^2 ≤ (b - a) * ∫ t in a..b, (g t)^2 := by
  let Δ := b - a
  let c := ∫ t in a..b, g t
  have hg₂ : ContinuousOn (fun t => (g t)^2) (Icc a b) := hg.pow _
  have h₁ : IntervalIntegrable (fun t => Δ^2 * (g t)^2) volume a b :=
    (hg₂.const_mul (Δ^2)).intervalIntegrable_of_Icc hab.le
  have h₂ : IntervalIntegrable (fun t => 2 * Δ * c * g t) volume a b :=
    (hg.const_mul (2 * Δ * c)).intervalIntegrable_of_Icc hab.le
  have h₃ : IntervalIntegrable (fun _ => c^2) volume a b := intervalIntegrable_const
  have he : (∫ t in a..b, (Δ * g t - c)^2) =
      Δ^2 * (∫ t in a..b, (g t)^2) - 2 * Δ * c * c + Δ * c^2 := by
    rw [intervalIntegral.integral_congr (g := fun t => Δ^2 * (g t)^2 -
      2 * Δ * c * g t + c^2) (fun t _ => by ring)]
    rw [intervalIntegral.integral_add (h₁.sub h₂) h₃, intervalIntegral.integral_sub h₁ h₂,
      intervalIntegral.integral_const_mul, intervalIntegral.integral_const_mul,
      intervalIntegral.integral_const, smul_eq_mul]
  have h := intervalIntegral.integral_nonneg_of_forall (μ := volume) hab.le (fun t => sq_nonneg (Δ * g t - c))
  rw [he] at h
  have he' : Δ * ((Δ * ∫ t in a..b, (g t)^2) - c^2) =
      Δ^2 * (∫ t in a..b, (g t)^2) - 2 * Δ * c * c + Δ * c^2 := by ring
  rw [← he'] at h
  exact sub_nonneg.mp (nonneg_of_mul_nonneg_right h (sub_pos.mpr hab))

/-- A positive differentiable probability path has squared Hellinger displacement bounded by
its integrated score energy times one fourth of the interval length. -/
theorem hellingerSq_le_integral_scoreEnergy {p v : ℝ → α → ℝ} {a b : ℝ} (hab : a ≤ b)
    (hpos : ∀ t ∈ Icc a b, ∀ x, 0 < p t x) (hcont : ContinuousOn v (Icc a b))
    (hd : ∀ t ∈ Icc a b, HasDerivWithinAt p (v t) (Icc a b) t) :
    hellingerSq (p b) (p a) ≤ (b - a) * (∫ t in a..b, scoreEnergy (p t) (v t)) / 4 := by
  rcases hab.lt_or_eq with hab | rfl
  · have hp : ContinuousOn p (Icc a b) := fun t ht => (hd t ht).continuousWithinAt
    let speed := fun (x : α) t => v t x / (2 * √(p t x))
    have hs (x : α) : ContinuousOn (speed x) (Icc a b) := by
      refine ((continuous_apply x).comp_continuousOn hcont).div ?_ ?_
      · exact (Real.continuous_sqrt.comp_continuousOn
          ((continuous_apply x).comp_continuousOn hp)).const_mul 2
      · exact fun t ht => mul_ne_zero (by norm_num) (Real.sqrt_pos.mpr (hpos t ht x)).ne'
    have hcoord (x : α) : (√(p b x) - √(p a x))^2 ≤ (b - a) * ∫ t in a..b, (speed x t)^2 := by
      have hcd (t : ℝ) (ht : t ∈ Ioo a b) : HasDerivAt (fun u => √(p u x)) (speed x t) t := by
        have hdx := (hasDerivWithinAt_pi.mp (hd t (Ioo_subset_Icc_self ht)) x).sqrt
          (hpos t (Ioo_subset_Icc_self ht) x).ne'
        exact hdx.hasDerivAt (Icc_mem_nhds ht.1 ht.2)
      have hft := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le hab.le
        (Real.continuous_sqrt.comp_continuousOn ((continuous_apply x).comp_continuousOn hp))
        hcd ((hs x).intervalIntegrable_of_Icc hab.le)
      change (∫ t in a..b, speed x t) = √(p b x) - √(p a x) at hft
      rw [← hft]
      exact integral_sq_cs hab (hs x)
    have hsum := Finset.sum_le_sum fun x (_ : x ∈ Finset.univ) => hcoord x
    rw [← Finset.mul_sum] at hsum
    have hswap : (∫ t in a..b, ∑ x, (speed x t)^2) = ∑ x, ∫ t in a..b, (speed x t)^2 :=
      intervalIntegral.integral_finsetSum (fun x _ => ((hs x).pow 2).intervalIntegrable_of_Icc hab.le)
    rw [← hswap] at hsum
    have he : (∫ t in a..b, ∑ x, (speed x t)^2) = (∫ t in a..b, scoreEnergy (p t) (v t)) / 4 := by
      rw [← intervalIntegral.integral_div]
      apply intervalIntegral.integral_congr
      rw [uIcc_of_le hab.le]
      exact fun t ht => scoreEnergy_sqrt _ _ (hpos t ht)
    rw [he] at hsum
    simpa [hellingerSq, mul_div_assoc] using hsum
  · simp

/-- The optimizer itself has an integrable score-energy path on each nondegenerate admissible
interval. Its derivative is the derivative within that interval, including at the endpoints. -/
theorem optimizer_hellingerSq_le_integral [Nonempty α] (loss lossRate : α → ℝ) (τ : ℝ)
    (coeff coeffRate : κ → ℝ) (restriction : ∀ j, α → γ j) {a b : ℝ}
    (hab : a < b) (hτ : 0 < τ) (hc : ∀ u ∈ Icc a b, ∀ j, 0 ≤ coeff j + u * coeffRate j) :
    let p := fun u => optimizer (fun x => loss x + u * lossRate x) τ
      (fun j => coeff j + u * coeffRate j) restriction
    let v := derivWithin p (Icc a b)
    hellingerSq (p b) (p a) ≤ (b - a) * (∫ u in a..b, scoreEnergy (p u) (v u)) / 4 := by
  intro p v
  have hpc := optimizer_contDiffOn loss lossRate τ coeff coeffRate restriction hτ hc
  have hreg := (contDiffOn_one_iff_derivWithin (uniqueDiffOn_Icc hab)).mp hpc
  refine hellingerSq_le_integral_scoreEnergy hab.le ?_ hreg.2 fun u hu => ?_
  · exact fun u hu => optimizer_pos _ restriction hτ (hc u hu)
  · exact (hreg.1 u hu).hasDerivWithinAt

/-- The density derivative of an admissible optimizer path is the unique derivative within the
whole interval and satisfies the tangent stationarity equation. -/
theorem optimizer_path_stationary [Nonempty α] (loss lossRate : α → ℝ) (τ : ℝ)
    (coeff coeffRate : κ → ℝ) (restriction : ∀ j, α → γ j) {a b u : ℝ}
    (hab : a < b) (hu : u ∈ Icc a b) (hτ : 0 < τ)
    (hc : ∀ w ∈ Icc a b, ∀ j, 0 ≤ coeff j + w * coeffRate j) :
    let p := fun w => optimizer (fun x => loss x + w * lossRate x) τ
      (fun j => coeff j + w * coeffRate j) restriction
    let v := derivWithin p (Icc a b) u
    (∑ x, v x = 0) ∧ ∃ c, ∀ x, entropyHessian τ (fun j => coeff j + u * coeffRate j)
      restriction (p u) v x + gradientForcing lossRate coeffRate restriction (p u) x = c := by
  intro p v
  obtain ⟨v', c, hd, hv, he⟩ := optimizer_hasDerivWithinAt
    loss lossRate τ coeff coeffRate restriction hu hτ hc
  have h : v = v' := hd.derivWithin (uniqueDiffOn_Icc hab u hu)
  rw [h]
  exact ⟨hv, c, he⟩

/-- The part of the loss-removal estimate with all other weights fixed. The factor `1/2` turns
integration over `[0,2]` into the mean rate over the uniform weight. -/
theorem optimizer_remove_weight_le_uniform_energy [Nonempty α] (loss lossRate : α → ℝ)
    (τ : ℝ) (coeff : κ → ℝ) (restriction : ∀ j, α → γ j)
    {u : ℝ} (hu : u ∈ Icc 0 2) (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j) :
    let p := fun w => optimizer (fun x => loss x + w * lossRate x) τ coeff restriction
    let v := derivWithin p (Icc 0 2)
    hellingerSq (p u) (p 0) ≤ (∫ w in (0 : ℝ)..2, scoreEnergy (p w) (v w)) / 2 := by
  intro p v
  have hlt : (0 : ℝ) < 2 := by norm_num
  have hpc : ContDiffOn ℝ 1 p (Icc 0 2) := by
    simpa only [Pi.zero_apply, mul_zero, add_zero] using optimizer_contDiffOn
      loss lossRate τ coeff 0 restriction hτ (s := Icc 0 2)
      (fun w _ j => by simpa only [Pi.zero_apply, mul_zero, add_zero] using hc j)
  have hreg := (contDiffOn_one_iff_derivWithin (uniqueDiffOn_Icc hlt)).mp hpc
  have hpos (w : ℝ) (x : α) : 0 < p w x := optimizer_pos _ restriction hτ hc x
  let E := fun w => scoreEnergy (p w) (v w)
  have hE : ContinuousOn E (Icc 0 2) := by
    unfold E scoreEnergy
    refine continuousOn_finsetSum _ fun x _ => ?_
    exact (((continuous_apply x).comp_continuousOn hreg.2).pow 2).div
      ((continuous_apply x).comp_continuousOn hpc.continuousOn) (fun w _ => (hpos w x).ne')
  have hset : Icc 0 u ⊆ Icc 0 (2 : ℝ) := Icc_subset_Icc_right hu.2
  have hbound := hellingerSq_le_integral_scoreEnergy hu.1 (fun w _ => hpos w) (hreg.2.mono hset)
    (fun w hw => (hreg.1 w (hset hw)).hasDerivWithinAt.mono hset)
  have hincl : Icc u (2 : ℝ) ⊆ Icc 0 2 := Icc_subset_Icc_left hu.1
  have hadd := intervalIntegral.integral_add_adjacent_intervals (μ := volume)
    ((hE.mono hset).intervalIntegrable_of_Icc hu.1) ((hE.mono hincl).intervalIntegrable_of_Icc hu.2)
  have hnon (w : ℝ) : 0 ≤ E w := scoreEnergy_nonneg (fun x => (hpos w x).le) _
  have hle : (∫ w in (0 : ℝ)..u, E w) ≤ ∫ w in (0 : ℝ)..2, E w := by
    rw [← hadd]
    exact le_add_of_nonneg_right (intervalIntegral.integral_nonneg_of_forall hu.2 hnon)
  have hpref := mul_le_mul hu.2 hle
    (intervalIntegral.integral_nonneg_of_forall hu.1 hnon) hlt.le
  change hellingerSq (p u) (p 0) ≤ (∫ w in (0 : ℝ)..2, E w) / 2
  change hellingerSq (p u) (p 0) ≤ (u - 0) * (∫ w in (0 : ℝ)..u, E w) / 4 at hbound
  linarith only [hbound, hpref]

/-- Cauchy–Schwarz in the probability-weighted squared norm. -/
theorem expected_sq_le_scoreEnergy_mul {p : α → ℝ} (hp : ∀ x, 0 < p x) (v f : α → ℝ) :
    (expected v f)^2 ≤ scoreEnergy p v * (∑ x, p x * (f x)^2) := by
  refine Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul _
    (fun x _ => div_nonneg (sq_nonneg _) (hp x).le)
    (fun x _ => mul_nonneg (hp x).le (sq_nonneg _)) (fun x _ => ?_)
  apply le_of_eq
  field_simp [(hp x).ne']

/-- The full entropy coefficient alone controls the score energy in terms of any centered
version of the forcing term. -/
theorem scoreEnergy_le_forcing {τ : ℝ} {coeff : κ → ℝ} (restriction : ∀ j, α → γ j)
    {p v forcing : α → ℝ} {c offset : ℝ} (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j)
    (hp : ∀ a, 0 < p a) (hv : ∑ a, v a = 0)
    (he : ∀ a, entropyHessian τ coeff restriction p v a + forcing a = c) :
    τ^2 * scoreEnergy p v ≤ ∑ a, p a * (forcing a - offset)^2 := by
  have hneg : expected v (fun a => forcing a - offset) =
      -expected v (entropyHessian τ coeff restriction p v) := by
    unfold expected
    have he' (a : α) : forcing a - offset = (c - offset) - entropyHessian τ coeff restriction p v a := by
      linarith [he a]
    simp only [he', mul_sub, Finset.sum_sub_distrib, ← Finset.sum_mul, hv, zero_mul, zero_sub, neg_zero]
  have hcs := expected_sq_le_scoreEnergy_mul hp v (fun a => forcing a - offset)
  rw [hneg, neg_sq] at hcs
  have hlow : τ * scoreEnergy p v ≤ expected v (entropyHessian τ coeff restriction p v) :=
    entropyHessian_lower restriction (fun a => (hp a).le) hc v
  have hE := scoreEnergy_nonneg (fun a => (hp a).le) v
  rcases hE.eq_or_lt with hz | hz
  · rw [← hz, mul_zero]
    exact Finset.sum_nonneg fun a _ => mul_nonneg (hp a).le (sq_nonneg _)
  · have hsq := pow_le_pow_left₀ (mul_nonneg hτ.le hz.le) hlow 2
    have aux := hsq.trans hcs
    rw [mul_pow, pow_two (scoreEnergy p v), ← mul_assoc] at aux
    exact le_of_mul_le_mul_right (by simpa only [mul_comm (scoreEnergy p v) (∑ a, p a *
      (forcing a - offset)^2)] using aux) hz

/-- A uniform squared-gradient bound controls Hellinger displacement along an affine objective
interpolation. The offset may be chosen separately for each interior law. -/
theorem optimizer_hellingerSq_le_forcing [Nonempty α] (loss lossRate : α → ℝ) (τ : ℝ)
    (coeff coeffRate : κ → ℝ) (restriction : ∀ j, α → γ j) {a b K : ℝ}
    (hab : a < b) (hτ : 0 < τ) (hc : ∀ u ∈ Icc a b, ∀ j, 0 ≤ coeff j + u * coeffRate j)
    (hF : ∀ p : α → ℝ, IsLaw p → (∀ x, 0 < p x) → ∃ c, ∑ x, p x *
      (gradientForcing lossRate coeffRate restriction p x - c)^2 ≤ K) :
    let p := fun u => optimizer (fun x => loss x + u * lossRate x) τ
      (fun j => coeff j + u * coeffRate j) restriction
    hellingerSq (p b) (p a) ≤ (b - a)^2 * K / (4 * τ^2) := by
  intro p
  let v := derivWithin p (Icc a b)
  let E := fun w => scoreEnergy (p w) (v w)
  have hpath := optimizer_hellingerSq_le_integral loss lossRate τ coeff coeffRate restriction hab hτ hc
  change hellingerSq (p b) (p a) ≤ (b - a) * (∫ w in a..b, E w) / 4 at hpath
  have hpc := optimizer_contDiffOn loss lossRate τ coeff coeffRate restriction hτ hc
  have hreg := (contDiffOn_one_iff_derivWithin (uniqueDiffOn_Icc hab)).mp hpc
  have hpos (w : ℝ) (hw : w ∈ Icc a b) (x : α) : 0 < p w x :=
    optimizer_pos _ restriction hτ (hc w hw) x
  have hE : ContinuousOn E (Icc a b) := by
    unfold E scoreEnergy
    refine continuousOn_finsetSum _ fun x _ => ?_
    exact (((continuous_apply x).comp_continuousOn hreg.2).pow 2).div
      ((continuous_apply x).comp_continuousOn hpc.continuousOn) (fun w hw => (hpos w hw x).ne')
  have hle : (∫ w in a..b, E w) ≤ (b - a) * (K / τ^2) := by
    rw [← smul_eq_mul, ← intervalIntegral.integral_const]
    apply intervalIntegral.integral_mono_on hab.le (hE.intervalIntegrable_of_Icc hab.le)
      intervalIntegrable_const
    intro w hw
    obtain ⟨hv, c, he⟩ := optimizer_path_stationary loss lossRate τ coeff coeffRate restriction hab hw hτ hc
    obtain ⟨offset, hoffset⟩ := hF (p w) (optimizer_isLaw _ _ _ _) (hpos w hw)
    have hh := scoreEnergy_le_forcing restriction hτ (hc w hw) (hpos w hw) hv (offset := offset) he
    apply (le_div_iff₀ (sq_pos_of_pos hτ)).mpr
    exact (mul_comm (E w) (τ^2)) ▸ hh.trans hoffset
  calc
    _ ≤ (b - a) * (∫ w in a..b, E w) / 4 := hpath
    _ ≤ (b - a) * ((b - a) * (K / τ^2)) / 4 :=
      div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hle (sub_nonneg.mpr hab.le)) (by norm_num)
    _ = _ := by ring

end AgnosticVC
