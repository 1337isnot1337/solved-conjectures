import Conjectures.LopezPousoSeguraAsymptotic
import Mathlib.Tactic.FunProp

namespace LopezPousoSegura
open Filter
open scoped Topology

noncomputable def ratioT (a ε : ℝ) : ℝ :=
  a + (-a/8+a^3/3)*ε + (11*a/128-a^3/24-a^3/8+2*a^5/15)*ε^2
noncomputable def ratioF (a ε : ℝ) : ℝ := 1+ε/8+(a^2/8-9/128)*ε^2
noncomputable def ratioR (a ε : ℝ) : ℝ :=
  a^7*ε/60-29*a^5*ε/960+7*a^5/120+23*a^3*ε/1024-23*a^3/384-99*a*ε/16384+5*a/256

theorem scaled_limit_of_product_approx (ε ratio err : ℕ → ℝ)
    (hε : Tendsto ε atTop (𝓝 0)) (hε0 : ∀ᶠ n in atTop, ε n ≠ 0)
    (herr : Tendsto err atTop (𝓝 0))
    (hrep : ∀ᶠ n in atTop, ratio n = (2/Real.pi)*ratioT (Real.pi/2) (ε n)*ratioF (Real.pi/2) (ε n) + (ε n)^2*err n) :
    Tendsto (fun n => (ratio n - 1 - (Real.pi^2/12)*ε n)/(ε n)^2)
      atTop (𝓝 (Real.pi^4/120)) := by
  have hcont : ContinuousAt (fun x : ℝ => (2/Real.pi)*ratioR (Real.pi/2) x) 0 := by
    unfold ratioR
    fun_prop
  have hsmall : Tendsto (fun n => ε n * ((2/Real.pi)*ratioR (Real.pi/2) (ε n)) + err n) atTop (𝓝 0) := by
    have hh := (hε.mul (hcont.tendsto.comp hε)).add herr
    simpa using hh
  have hlimit : Tendsto (fun n => Real.pi^4/120 + (ε n * ((2/Real.pi)*ratioR (Real.pi/2) (ε n)) + err n))
      atTop (𝓝 (Real.pi^4/120)) := by
    simpa using tendsto_const_nhds.add hsmall
  apply hlimit.congr'
  filter_upwards [hε0, hrep] with n hn hrepr
  rw [hrepr]
  have ha := asymptotic_product_algebra (Real.pi/2) (ε n)
  have hb := asymptotic_normalized_coefficients (ε n)
  dsimp [ratioT, ratioF, ratioR]
  have hpi : Real.pi ≠ 0 := ne_of_gt Real.pi_pos
  field_simp
  nlinarith [ha,hb]


theorem eventual_violation_of_product_approx (κ ratio err : ℕ → ℝ)
    (hκ : ∀ᶠ n in atTop, κ n ≠ 0)
    (hε : Tendsto (fun n => 1/(κ n)^2) atTop (𝓝 0)) (herr : Tendsto err atTop (𝓝 0))
    (hrep : ∀ᶠ n in atTop,
      ratio n = (2/Real.pi)*ratioT (Real.pi/2) (1/(κ n)^2)*ratioF (Real.pi/2) (1/(κ n)^2) +
        (1/(κ n)^2)^2*err n) :
    ∀ᶠ n in atTop, Real.pi^2/(12*(κ n)^2) < ratio n - 1 := by
  have hε0 : ∀ᶠ n in atTop, 1/(κ n)^2 ≠ 0 := by
    filter_upwards [hκ] with n hn
    simp [hn]
  have hscaled := scaled_limit_of_product_approx (fun n => 1/(κ n)^2) ratio err hε hε0 herr hrep
  apply eventual_violation_of_scaled_limit κ ratio hκ
  apply hscaled.congr'
  filter_upwards [hκ] with n hn
  field_simp

end LopezPousoSegura
