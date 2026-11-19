import Conjectures.LineSizeCoreBounds

/-! A global Gaussian bound for the actual normalized core weights.
The corrected product is used only near the saddle. Outside that compact
interval, the distance from the saddle absorbs the inverse square root. -/
noncomputable section
namespace LineSize.EulerKernel

open Real

def coreCoordinate (r : ℕ) (t : ℝ) : ℝ :=
  ((r : ℝ) * t - Profile.u0) / sqrt t

theorem coreCoordinate_square (r : ℕ) {t : ℝ} (ht : 0 < t) :
    (coreCoordinate r t) ^ 2 = ((r : ℝ) * t - Profile.u0) ^ 2 / t := by
  rw [coreCoordinate, div_pow, Real.sq_sqrt ht.le]

theorem coreCoordinate_identity (r : ℕ) {t : ℝ} (ht : 0 < t) :
    (r : ℝ) * t = Profile.u0 + sqrt t * coreCoordinate r t := by
  have hs : sqrt t ≠ 0 := (Real.sqrt_pos.mpr ht).ne'
  unfold coreCoordinate
  field_simp
  ring

theorem coreCoordinate_grid (r : ℕ) {t : ℝ} (ht : 0 < t) :
    -Profile.u0 / sqrt t + sqrt t * (r : ℝ) = coreCoordinate r t := by
  have hs : sqrt t ≠ 0 := (Real.sqrt_pos.mpr ht).ne'
  apply (eq_div_iff hs).mpr
  change (-Profile.u0 / sqrt t + sqrt t * (r : ℝ)) * sqrt t =
    (r : ℝ) * t - Profile.u0
  calc
    _ = -Profile.u0 + (sqrt t) ^ 2 * (r : ℝ) := by field_simp; ring
    _ = _ := by rw [Real.sq_sqrt ht.le]; ring

theorem normalizedWeight_global_gaussian (r : ℕ) {β t : ℝ}
    (hβ : 0 ≤ β) (ht : 0 < t) :
    normalizedWeight r β t ≤ (sqrt t)⁻¹ * exp (-(coreCoordinate r t) ^ 2) := by
  have h := normalizedWeight_le_global r hβ ht
  rw [coreCoordinate_square r ht]
  simpa only [neg_div] using h

theorem normalizedWeight_compact_gaussian {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∃ K : ℝ, 0 < K ∧ ∀ (r : ℕ) (β t : ℝ), 0 ≤ β → 0 < r → 0 < t → t ≤ 1 →
      a ≤ (r : ℝ) * t → (r : ℝ) * t ≤ b →
      normalizedWeight r β t ≤ K * exp (-(coreCoordinate r t) ^ 2) := by
  obtain ⟨K, hK, hbound⟩ := coreWeight_le_compact ha hb
  refine ⟨K, hK, ?_⟩
  intro r β t hβ hr ht ht1 hau hub
  have hs : sqrt t ≠ 0 := (Real.sqrt_pos.mpr ht).ne'
  have he : exp (Profile.A / t) ≠ 0 := (Real.exp_pos _).ne'
  have hd : 0 < sqrt t * exp (Profile.A / t) := by positivity
  have hphi : (Profile.Phi ((r : ℝ) * t) - Profile.A) / t ≤
      -(coreCoordinate r t) ^ 2 := by
    rw [coreCoordinate_square r ht]
    have h := Profile.Phi_le_gaussian (by positivity : 0 ≤ (r : ℝ) * t)
    rw [← neg_div]
    exact div_le_div_of_nonneg_right (by linarith) ht.le
  calc
    normalizedWeight r β t ≤
        (K * sqrt t * exp (Profile.Phi ((r : ℝ) * t) / t)) /
          (sqrt t * exp (Profile.A / t)) :=
      div_le_div_of_nonneg_right (hbound r β t hβ hr ht ht1 hau hub) hd.le
    _ = K * exp ((Profile.Phi ((r : ℝ) * t) - Profile.A) / t) := by
      rw [sub_div, Real.exp_sub]
      field_simp
    _ ≤ K * exp (-(coreCoordinate r t) ^ 2) :=
      mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr hphi) hK.le

theorem normalizedWeight_gaussian_bound :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (β t : ℝ), 0 ≤ β → 0 < t → t ≤ 1 →
      normalizedWeight r β t ≤
        C * (1 + |coreCoordinate r t|) * exp (-(coreCoordinate r t) ^ 2) := by
  have hu0 := Profile.u0_pos
  let δ : ℝ := Profile.u0 / 2
  have hδ : 0 < δ := by dsimp [δ]; exact half_pos Profile.u0_pos
  have hb : 0 < 3 * Profile.u0 / 2 := by positivity
  obtain ⟨K, hK, hcompact⟩ := normalizedWeight_compact_gaussian hδ hb
  let C := K + 1 / δ
  have hC : 0 < C := by dsimp [C]; positivity
  refine ⟨C, hC, ?_⟩
  intro r β t hβ ht ht1
  let z := coreCoordinate r t
  have hs : 0 < sqrt t := Real.sqrt_pos.mpr ht
  by_cases hu : δ ≤ (r : ℝ) * t ∧ (r : ℝ) * t ≤ 3 * Profile.u0 / 2
  · have hrR : (0 : ℝ) < r := by nlinarith [hu.1]
    have hr : 0 < r := by exact_mod_cast hrR
    have hcoeff : K ≤ C * (1 + |z|) := by
      have hdelta : 0 < 1 / δ := one_div_pos.mpr hδ
      dsimp [C]
      nlinarith [abs_nonneg z]
    exact (hcompact r β t hβ hr ht ht1 hu.1 hu.2).trans
      (mul_le_mul_of_nonneg_right hcoeff (Real.exp_pos _).le)
  · have hgap : δ ≤ |(r : ℝ) * t - Profile.u0| := by
      by_cases hlo : (r : ℝ) * t < δ
      · apply (show δ ≤ -((r : ℝ) * t - Profile.u0) by dsimp [δ] at *; linarith).trans
        exact neg_le_abs _
      · have hhi : 3 * Profile.u0 / 2 < (r : ℝ) * t := by
          by_contra h
          exact hu ⟨le_of_not_gt hlo, le_of_not_gt h⟩
        apply (show δ ≤ (r : ℝ) * t - Profile.u0 by dsimp [δ]; linarith).trans
        exact le_abs_self _
    have hinv : (sqrt t)⁻¹ ≤ |z| / δ := by
      calc
        (sqrt t)⁻¹ = δ / (sqrt t * δ) := by field_simp
        _ ≤ |(r : ℝ) * t - Profile.u0| / (sqrt t * δ) :=
          div_le_div_of_nonneg_right hgap (by positivity)
        _ = |z| / δ := by
          dsimp [z, coreCoordinate]
          rw [abs_div, abs_of_pos hs]
          ring
    have hcoeff : |z| / δ ≤ C * (1 + |z|) := by
      have hdelta : 0 < 1 / δ := one_div_pos.mpr hδ
      dsimp [C]
      rw [div_eq_mul_inv]
      nlinarith [abs_nonneg z]
    exact (normalizedWeight_global_gaussian r hβ ht).trans
      (mul_le_mul_of_nonneg_right (hinv.trans hcoeff) (Real.exp_pos _).le)

end LineSize.EulerKernel
