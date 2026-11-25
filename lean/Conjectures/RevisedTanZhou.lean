import Conjectures.RevisedTanZhouPacking

/-!
# The revised Tan–Zhou conjecture

The lower order is an extended nonnegative real, so the same theorem
includes infinite lower order and the zero-dimension conclusion.
-/

open Filter Set Metric MeasureTheory
open scoped Topology ENNReal NNReal

namespace RevisedTanZhou
noncomputable section

def orderAt (ψ : ℕ → ℝ) (q : ℕ) : ℝ≥0∞ :=
  ENNReal.ofReal (-Real.log (ψ q) / Real.log (q : ℝ))

def lowerOrder (ψ : ℕ → ℝ) : ℝ≥0∞ := liminf (orderAt ψ) atTop

private theorem power_le_iff {q : ℕ} (hq : 2 ≤ q) {z t : ℝ} (hz : 0 < z) :
    z ≤ (q : ℝ) ^ (-t) ↔ t ≤ -Real.log z / Real.log (q : ℝ) := by
  have hq2 : (2 : ℝ) ≤ q := by exact_mod_cast hq
  have hq0 : 0 < (q : ℝ) := by linarith
  have hlog : 0 < Real.log (q : ℝ) := Real.log_pos (by linarith)
  rw [← Real.log_le_log_iff hz (Real.rpow_pos_of_pos hq0 _),
    Real.log_rpow hq0, le_div_iff₀ hlog]
  constructor <;> intro h <;> linarith

private theorem le_power_iff {q : ℕ} (hq : 2 ≤ q) {z t : ℝ} (hz : 0 < z) :
    (q : ℝ) ^ (-t) ≤ z ↔ -Real.log z / Real.log (q : ℝ) ≤ t := by
  have hq2 : (2 : ℝ) ≤ q := by exact_mod_cast hq
  have hq0 : 0 < (q : ℝ) := by linarith
  have hlog : 0 < Real.log (q : ℝ) := Real.log_pos (by linarith)
  rw [← Real.log_le_log_iff (Real.rpow_pos_of_pos hq0 _) hz,
    Real.log_rpow hq0, div_le_iff₀ hlog]
  constructor <;> intro h <;> linarith

theorem eventually_power_of_lt_order {ψ : ℕ → ℝ} (hψ : ∀ q, ψ q ∈ Ioc (0 : ℝ) 1)
    {t : ℝ} (ht : ENNReal.ofReal t < lowerOrder ψ) :
    ∀ᶠ q : ℕ in atTop, ψ q ≤ (q : ℝ) ^ (-t) := by
  filter_upwards [eventually_lt_of_lt_liminf ht, eventually_ge_atTop (2 : ℕ)] with q hq hq2
  have hqR : (2 : ℝ) ≤ q := by exact_mod_cast hq2
  have hnonneg : 0 ≤ -Real.log (ψ q) / Real.log (q : ℝ) :=
    div_nonneg (neg_nonneg.mpr (Real.log_nonpos (hψ q).1.le (hψ q).2))
      (Real.log_nonneg (by linarith))
  exact (power_le_iff hq2 (hψ q).1).mpr ((ENNReal.ofReal_le_ofReal_iff hnonneg).mp hq.le)

theorem frequently_power_of_order_lt {ψ : ℕ → ℝ} (hψ : ∀ q, ψ q ∈ Ioc (0 : ℝ) 1)
    {t : ℝ} (ht : 0 < t) (hord : lowerOrder ψ < ENNReal.ofReal t) :
    ∃ᶠ q : ℕ in atTop, (q : ℝ) ^ (-t) ≤ ψ q := by
  have hfreq : ∃ᶠ q : ℕ in atTop, orderAt ψ q < ENNReal.ofReal t := by
    exact frequently_lt_of_liminf_lt (by isBoundedDefault) hord
  exact (hfreq.and_eventually (eventually_ge_atTop (2 : ℕ))).mono fun q ⟨hq, hq2⟩ =>
    (le_power_iff hq2 (hψ q).1).mpr ((ENNReal.ofReal_lt_ofReal_iff ht).mp hq).le

private theorem dim_le_one (ψ : ℕ → ℝ) : dimH (approxSet ψ) ≤ 1 :=
  (dimH_mono (subset_univ _)).trans_eq Real.dimH_univ

private theorem threshold_eq {T : ℝ} (hT : 0 ≤ T) :
    ((1 : ℝ≥0∞) + ENNReal.ofReal T)⁻¹ = ENNReal.ofReal (1 / (1 + T)) := by
  rw [one_div, ENNReal.ofReal_inv_of_pos (by positivity),
    ENNReal.ofReal_add (by norm_num) hT, ENNReal.ofReal_one]

/-- The exact dimension for the monotone approximation function in Lee's
revised conjecture, with the standard unreduced Lüroth denominators. -/
theorem revised_tan_zhou {ψ : ℕ → ℝ} (hψ : ∀ q, ψ q ∈ Ioc (0 : ℝ) 1)
    (hmono : Antitone ψ) : dimH (approxSet ψ) = (1 + lowerOrder ψ)⁻¹ := by
  by_cases hinf : lowerOrder ψ = ∞
  · simp only [hinf, add_top, ENNReal.inv_top]
    apply le_antisymm _ bot_le
    by_contra! hpos
    obtain ⟨s, hs, hsd⟩ := exists_between hpos
    lift s to ℝ≥0 using (hsd.trans_le (dim_le_one ψ)).ne_top
    have hsNN : 0 < s := ENNReal.coe_lt_coe.mp hs
    have hsR : 0 < (s : ℝ) := by exact_mod_cast hsNN
    let t := 1 / (s : ℝ)
    have ht : ENNReal.ofReal t < lowerOrder ψ := by rw [hinf]; exact ENNReal.ofReal_lt_top
    have hc : 1 < (s : ℝ) * (1 + t) := by dsimp [t]; field_simp; nlinarith
    have hz := hausdorff_zero_of_eventually_power hsR hc (eventually_power_of_lt_order hψ ht)
    exact ENNReal.zero_ne_top (hz.symm.trans (hausdorffMeasure_of_lt_dimH hsd))
  · let T := (lowerOrder ψ).toReal
    have hT : 0 ≤ T := ENNReal.toReal_nonneg
    have hord : lowerOrder ψ = ENNReal.ofReal T := (ENNReal.ofReal_toReal hinf).symm
    rw [hord, threshold_eq hT]
    apply le_antisymm
    · by_contra! hbad
      obtain ⟨s, h₁, h₂⟩ := exists_between hbad
      lift s to ℝ≥0 using (h₂.trans_le (dim_le_one ψ)).ne_top
      have hsNN : 0 < s := ENNReal.coe_lt_coe.mp (lt_of_le_of_lt bot_le h₁)
      have hs : 0 < (s : ℝ) := by exact_mod_cast hsNN
      have hs1 : (s : ℝ) ≤ 1 := by exact_mod_cast h₂.le.trans (dim_le_one ψ)
      have h₁' : 1 / (1 + T) < (s : ℝ) := (ENNReal.ofReal_lt_ofReal_iff hs).mp
        (by simpa using h₁)
      let b := 1 / (s : ℝ) - 1
      have hb : 0 ≤ b := by
        dsimp [b]
        have hh : (1 : ℝ) ≤ 1 / (s : ℝ) := (le_div_iff₀ hs).mpr (by simpa using hs1)
        linarith
      have hbT : b < T := by
        dsimp [b]
        have hh := (div_lt_iff₀ (by positivity : 0 < 1 + T)).mp h₁'
        have h := (div_lt_iff₀ hs).mpr (by linarith : 1 < (1 + T) * (s : ℝ))
        linarith
      let t := (b + T) / 2
      have htT : t < T := by dsimp [t]; linarith
      have htb : b < t := by dsimp [t]; linarith
      have hc : 1 < (s : ℝ) * (1 + t) := by
        dsimp [b] at htb
        have hh : 1 / (s : ℝ) < 1 + t := by linarith
        linarith [(div_lt_iff₀ hs).mp hh]
      have hord' : ENNReal.ofReal t < lowerOrder ψ := by
        rw [hord]
        exact (ENNReal.ofReal_lt_ofReal_iff (hb.trans_lt (hbT))).mpr htT
      have hz := hausdorff_zero_of_eventually_power hs hc (eventually_power_of_lt_order hψ hord')
      exact ENNReal.zero_ne_top (hz.symm.trans (hausdorffMeasure_of_lt_dimH h₂))
    · by_contra! hbad
      obtain ⟨u, h₁, h₂⟩ := exists_between hbad
      lift u to ℝ≥0 using (h₂.trans ENNReal.ofReal_lt_top).ne
      have hu : 0 < u := ENNReal.coe_lt_coe.mp (lt_of_le_of_lt bot_le h₁)
      have huR : 0 < (u : ℝ) := by exact_mod_cast hu
      have h₂' : (u : ℝ) < 1 / (1 + T) := (ENNReal.ofReal_lt_ofReal_iff (by positivity)).mp
        (by simpa using h₂)
      let b := 1 / (u : ℝ) - 1
      have hTb : T < b := by
        dsimp [b]
        have hh := (lt_div_iff₀ (by positivity : 0 < 1 + T)).mp h₂'
        have h := (lt_div_iff₀ huR).mpr (by linarith : (1 + T) * (u : ℝ) < 1)
        linarith
      let t := (T + b) / 2
      have hTt : T < t := by dsimp [t]; linarith
      have htb : t < b := by dsimp [t]; linarith
      have ht : 0 < t := hT.trans_lt hTt
      have hc : (u : ℝ) * (1 + t) < 1 := by
        dsimp [b] at htb
        have hh : 1 + t < 1 / (u : ℝ) := by linarith
        linarith [(lt_div_iff₀ huR).mp hh]
      have hfreq := frequently_power_of_order_lt hψ ht (by
        rw [hord]
        exact (ENNReal.ofReal_lt_ofReal_iff ht).mpr hTt)
      exact (not_le_of_gt h₁) (lower_of_frequently_power hmono hu ht.le hc hfreq)

end
end RevisedTanZhou
