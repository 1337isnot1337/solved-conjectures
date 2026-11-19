import Conjectures.LineSizeEulerWeights

/-! Uniform bounds for the normalized positive core weights. The compact
estimate retains its square-root prefactor; the global estimate retains
the phase loss outside that compact interval. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set

def productDenominator (u : ℝ) : ℝ := 2 * Real.pi * (1 - exp (-u))

theorem productDenominator_pos {u : ℝ} (hu : 0 < u) : 0 < productDenominator u := by
  unfold productDenominator
  exact mul_pos (by positivity) (Profile.one_sub_exp_neg_pos hu)

theorem productDenominator_mono : Monotone productDenominator := by
  intro u v huv
  unfold productDenominator
  have he : exp (-v) ≤ exp (-u) := Real.exp_le_exp.mpr (neg_le_neg huv)
  exact mul_le_mul_of_nonneg_left (sub_le_sub_left he 1) (by positivity)

theorem correctionError_uniform {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (t : ℝ), 0 < r → 0 < t →
      a ≤ (r : ℝ) * t → (r : ℝ) * t ≤ b →
      |regularError r t - stirlingError r| ≤ C * t := by
  obtain ⟨C, hC, hbound⟩ := logEuler_correction_uniform ha hb
  refine ⟨C, hC, ?_⟩
  intro r t hr ht ha' hb'
  have h := hbound r t hr ht ha' hb'
  rw [logEuler_correction_exact hr ht] at h
  have hid : logMain r t + regularError r t - stirlingError r - logMain r t =
      regularError r t - stirlingError r := by ring
  rwa [hid] at h

theorem coreWeight_le_compact {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∃ K : ℝ, 0 < K ∧ ∀ (r : ℕ) (β t : ℝ), 0 ≤ β → 0 < r → 0 < t → t ≤ 1 →
      a ≤ (r : ℝ) * t → (r : ℝ) * t ≤ b →
      coreWeight r β t ≤ K * sqrt t * exp (Profile.Phi ((r : ℝ) * t) / t) := by
  obtain ⟨C, hC, hbound⟩ := correctionError_uniform ha hb
  let K := exp C / sqrt (productDenominator a)
  have hda := productDenominator_pos ha
  refine ⟨K, div_pos (Real.exp_pos _) (Real.sqrt_pos.mpr hda), ?_⟩
  intro r β t hβ hr ht ht1 hau hub
  have hu : 0 < (r : ℝ) * t := mul_pos (Nat.cast_pos.mpr hr) ht
  have hdu := productDenominator_pos hu
  have hden := productDenominator_mono hau
  have hs : sqrt (t / productDenominator ((r : ℝ) * t)) ≤
      sqrt t / sqrt (productDenominator a) := by
    rw [← Real.sqrt_div ht.le]
    exact Real.sqrt_le_sqrt (div_le_div_of_nonneg_left ht.le hda hden)
  have he : regularError r t - stirlingError r ≤ C :=
    ((le_abs_self _).trans (hbound r t hr ht hau hub)).trans (by nlinarith)
  have hp : exp (Profile.Phi ((r : ℝ) * t) / t - β * ((r : ℝ) * t)) ≤
      exp (Profile.Phi ((r : ℝ) * t) / t) := by
    apply Real.exp_le_exp.mpr
    have hnonneg : 0 ≤ β * ((r : ℝ) * t) := mul_nonneg hβ hu.le
    linarith
  rw [coreWeight_correction_exact hr ht]
  change exp (Profile.Phi ((r : ℝ) * t) / t - β * ((r : ℝ) * t)) *
      sqrt (t / productDenominator ((r : ℝ) * t)) * exp (regularError r t - stirlingError r) ≤ _
  calc
    _ ≤ exp (Profile.Phi ((r : ℝ) * t) / t) *
        (sqrt t / sqrt (productDenominator a)) * exp C := by
      exact mul_le_mul
        (mul_le_mul hp hs (Real.sqrt_nonneg _) (Real.exp_pos _).le)
        (Real.exp_le_exp.mpr he) (Real.exp_pos _).le (by positivity)
    _ = K * sqrt t * exp (Profile.Phi ((r : ℝ) * t) / t) := by dsimp [K]; ring

def normalizedWeight (r : ℕ) (β t : ℝ) : ℝ :=
  coreWeight r β t / (sqrt t * exp (Profile.A / t))

theorem normalizedWeight_pos (r : ℕ) (β : ℝ) {t : ℝ} (ht : 0 < t) :
    0 < normalizedWeight r β t :=
  div_pos (coreWeight_pos r β ht) (mul_pos (Real.sqrt_pos.mpr ht) (Real.exp_pos _))

theorem normalizedWeight_le_global (r : ℕ) {β t : ℝ} (hβ : 0 ≤ β) (ht : 0 < t) :
    normalizedWeight r β t ≤
      (sqrt t)⁻¹ * exp (-((r : ℝ) * t - Profile.u0) ^ 2 / t) := by
  have hs : sqrt t ≠ 0 := (Real.sqrt_pos.mpr ht).ne'
  have he : exp (Profile.A / t) ≠ 0 := (Real.exp_pos _).ne'
  have h := div_le_div_of_nonneg_right (coreWeight_le_gaussian r hβ ht)
    (show 0 ≤ sqrt t * exp (Profile.A / t) by positivity)
  unfold normalizedWeight
  apply h.trans_eq
  rw [sub_div, Real.exp_sub]
  rw [show -((r : ℝ) * t - Profile.u0) ^ 2 / t =
    -(((r : ℝ) * t - Profile.u0) ^ 2 / t) by ring, Real.exp_neg]
  field_simp

theorem normalizedWeight_correction_exact {r : ℕ} {β t : ℝ} (hr : 0 < r) (ht : 0 < t) :
    normalizedWeight r β t =
      exp ((Profile.Phi ((r : ℝ) * t) - Profile.A) / t - β * ((r : ℝ) * t)) /
        sqrt (productDenominator ((r : ℝ) * t)) *
          exp (regularError r t - stirlingError r) := by
  have hs : sqrt t ≠ 0 := (Real.sqrt_pos.mpr ht).ne'
  have he : exp (Profile.A / t) ≠ 0 := (Real.exp_pos _).ne'
  rw [normalizedWeight, coreWeight_correction_exact hr ht]
  change exp (Profile.Phi ((r : ℝ) * t) / t - β * ((r : ℝ) * t)) *
    sqrt (t / productDenominator ((r : ℝ) * t)) * exp (regularError r t - stirlingError r) /
      (sqrt t * exp (Profile.A / t)) = _
  rw [Real.sqrt_div ht.le]
  have hexp : (Profile.Phi ((r : ℝ) * t) - Profile.A) / t - β * ((r : ℝ) * t) =
      (Profile.Phi ((r : ℝ) * t) / t - β * ((r : ℝ) * t)) - Profile.A / t := by ring
  rw [hexp, Real.exp_sub]
  field_simp
  ring

end LineSize.EulerKernel
