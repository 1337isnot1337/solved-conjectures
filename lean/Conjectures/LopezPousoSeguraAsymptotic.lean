import Conjectures.LopezPousoSegura
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Deriv
import Mathlib.Tactic.Ring

namespace LopezPousoSegura

noncomputable def perturb1 (u : ℝ) : ℝ := -u * Real.sin u / 8
noncomputable def perturb1' (u : ℝ) : ℝ := -(Real.sin u + u * Real.cos u) / 8
noncomputable def perturb1'' (u : ℝ) : ℝ := -(2 * Real.cos u - u * Real.sin u) / 8

noncomputable def perturb2 (u : ℝ) : ℝ := (9/128)*(u*Real.sin u-u^2*Real.cos u)-u^3*Real.sin u/24
noncomputable def perturb2' (u : ℝ) : ℝ := -u^3*Real.cos u/24-7*u^2*Real.sin u/128-9*u*Real.cos u/128+9*Real.sin u/128
noncomputable def perturb2'' (u : ℝ) : ℝ := u^3*Real.sin u/24-23*u^2*Real.cos u/128-5*u*Real.sin u/128

theorem perturb1_hasDeriv (u : ℝ) : HasDerivAt perturb1 (perturb1' u) u := by
  have h := ((hasDerivAt_id u).mul (Real.hasDerivAt_sin u)).neg.div_const 8
  convert h using 1
  all_goals try funext v
  all_goals simp [perturb1, perturb1'] <;> ring

theorem perturb1'_hasDeriv (u : ℝ) : HasDerivAt perturb1' (perturb1'' u) u := by
  have h := ((Real.hasDerivAt_sin u).add ((hasDerivAt_id u).mul (Real.hasDerivAt_cos u))).neg.div_const 8
  convert h using 1
  all_goals try funext v
  all_goals simp [perturb1', perturb1''] <;> ring

theorem perturb2_hasDeriv (u : ℝ) : HasDerivAt perturb2 (perturb2' u) u := by
  have h1 := ((hasDerivAt_id u).mul (Real.hasDerivAt_sin u)).sub (((hasDerivAt_id u).pow 2).mul (Real.hasDerivAt_cos u))
  have h2 := (((hasDerivAt_id u).pow 3).mul (Real.hasDerivAt_sin u)).div_const 24
  have h := (h1.const_mul (9/128 : ℝ)).sub h2
  convert h using 1
  all_goals try funext v
  all_goals simp [perturb2, perturb2'] <;> ring

theorem perturb2'_hasDeriv (u : ℝ) : HasDerivAt perturb2' (perturb2'' u) u := by
  have h1 := (((hasDerivAt_id u).pow 3).mul (Real.hasDerivAt_cos u)).neg.div_const 24
  have h2 := ((((hasDerivAt_id u).pow 2).const_mul (7:ℝ)).mul (Real.hasDerivAt_sin u)).div_const 128
  have h3 := (((hasDerivAt_id u).const_mul (9:ℝ)).mul (Real.hasDerivAt_cos u)).div_const 128
  have h4 := (Real.hasDerivAt_sin u).const_mul (9/128 : ℝ)
  have h := ((h1.sub h2).sub h3).add h4
  convert h using 1
  all_goals try funext v
  all_goals simp [perturb2', perturb2''] <;> ring

theorem perturb1_ode (u : ℝ) : perturb1'' u + perturb1 u = - Real.cos u / 4 := by
  simp [perturb1, perturb1'']; ring

theorem perturb2_ode (u : ℝ) : perturb2'' u + perturb2 u = - perturb1 u / 4 - u^2 * Real.cos u / 4 := by
  simp [perturb1, perturb2, perturb2'']; ring

theorem perturb_values :
    perturb1 (Real.pi/2) = -(Real.pi/2)/8 ∧ perturb1' (Real.pi/2) = -1/8 ∧
    perturb1'' (Real.pi/2) = (Real.pi/2)/8 ∧
    perturb2 (Real.pi/2) = 9*(Real.pi/2)/128 - (Real.pi/2)^3/24 ∧
    perturb2' (Real.pi/2) = 9/128 - 7*(Real.pi/2)^2/128 := by
  norm_num [perturb1, perturb1', perturb1'', perturb2, perturb2', Real.sin_pi_div_two, Real.cos_pi_div_two]
  <;> constructor <;> ring


theorem asymptotic_product_algebra (a ε : ℝ) :
    (a + (-a/8+a^3/3)*ε + (11*a/128-a^3/24-a^3/8+2*a^5/15)*ε^2) *
      (1+ε/8+(a^2/8-9/128)*ε^2) =
    a + (a^3/3)*ε + (2*a^5/15)*ε^2 + ε^3 *
      (a^7*ε/60-29*a^5*ε/960+7*a^5/120+23*a^3*ε/1024-23*a^3/384-99*a*ε/16384+5*a/256) := by
  ring

theorem asymptotic_normalized_coefficients (ε : ℝ) :
    (2/Real.pi) * ((Real.pi/2) + ((Real.pi/2)^3/3)*ε + (2*(Real.pi/2)^5/15)*ε^2) =
      1 + (Real.pi^2/12)*ε + (Real.pi^4/120)*ε^2 := by
  have hp : Real.pi ≠ 0 := ne_of_gt Real.pi_pos
  field_simp
  ring


open Filter
open scoped Topology

theorem eventual_violation_of_scaled_limit (κ ratio : ℕ → ℝ)
    (hκ : ∀ᶠ n in atTop, κ n ≠ 0)
    (hlim : Tendsto (fun n => (κ n)^4 * (ratio n - 1 - Real.pi^2/(12*(κ n)^2)))
      atTop (𝓝 (Real.pi^4/120))) :
    ∀ᶠ n in atTop, Real.pi^2/(12*(κ n)^2) < ratio n - 1 := by
  have hp : 0 < Real.pi^4/120 := by positivity
  have he := hlim.eventually (eventually_gt_nhds hp)
  filter_upwards [hκ, he] with n hn he
  have hk : 0 < (κ n)^4 := (by decide : Even (4:ℕ)).pow_pos hn
  have hv : 0 < ratio n - 1 - Real.pi^2/(12*(κ n)^2) := by
    exact pos_of_mul_pos_right he (le_of_lt hk)
  linarith


end LopezPousoSegura
