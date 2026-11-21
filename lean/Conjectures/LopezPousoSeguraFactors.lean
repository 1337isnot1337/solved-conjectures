import Conjectures.LopezPousoSeguraAsymptoticBridge

namespace LopezPousoSegura
open Filter
open scoped Topology

theorem eventual_violation_of_factor_approximations (κ ratio T A errT errA : ℕ → ℝ)
    (hκ : ∀ᶠ n in atTop, κ n ≠ 0)
    (hε : Tendsto (fun n => 1/(κ n)^2) atTop (𝓝 0))
    (herrT : Tendsto errT atTop (𝓝 0)) (herrA : Tendsto errA atTop (𝓝 0))
    (hT : ∀ᶠ n in atTop, T n = ratioT (Real.pi/2) (1/(κ n)^2) + (1/(κ n)^2)^2 * errT n)
    (hA : ∀ᶠ n in atTop, A n = ratioF (Real.pi/2) (1/(κ n)^2) + (1/(κ n)^2)^2 * errA n)
    (hratio : ∀ᶠ n in atTop, ratio n = (2/Real.pi)*T n*A n) :
    ∀ᶠ n in atTop, Real.pi^2/(12*(κ n)^2) < ratio n - 1 := by
  let ε : ℕ → ℝ := fun n => 1/(κ n)^2
  change Tendsto ε atTop (𝓝 0) at hε
  let E : ℕ → ℝ := fun n => (2/Real.pi) *
    (errT n * ratioF (Real.pi/2) (ε n) + errA n * ratioT (Real.pi/2) (ε n) + (ε n)^2*errT n*errA n)
  have hFc : ContinuousAt (ratioF (Real.pi/2)) 0 := by unfold ratioF; fun_prop
  have hTc : ContinuousAt (ratioT (Real.pi/2)) 0 := by unfold ratioT; fun_prop
  have hF : Tendsto (fun n => ratioF (Real.pi/2) (ε n)) atTop (𝓝 1) := by
    have hh := hFc.tendsto.comp hε
    simpa [ratioF, Function.comp_def] using hh
  have hTv : Tendsto (fun n => ratioT (Real.pi/2) (ε n)) atTop (𝓝 (Real.pi/2)) := by
    have hh := hTc.tendsto.comp hε
    simpa [ratioT, Function.comp_def] using hh
  have hE : Tendsto E atTop (𝓝 0) := by
    have hh := ((herrT.mul hF).add (herrA.mul hTv)).add (((hε.pow 2).mul herrT).mul herrA)
    have hh' := hh.const_mul (2/Real.pi)
    simpa [E] using hh'
  apply eventual_violation_of_product_approx κ ratio E hκ hε hE
  filter_upwards [hT,hA,hratio] with n hnT hnA hnR
  rw [hnR, hnT, hnA]
  dsimp [E,ε]
  ring


noncomputable def centralC (ε : ℝ) : ℝ := 1-ε/8+11*ε^2/128
noncomputable def centralD (a ε : ℝ) : ℝ := 1+ε/4+(a^2-1)*ε^2/8
noncomputable def centralR (a ε : ℝ) : ℝ := 11*a^2*ε/1024-a^2/64-11*ε/1024+19/512

theorem central_product_algebra (a ε : ℝ) :
    centralC ε * centralD a ε = ratioF a ε + ε^3 * centralR a ε := by
  simp [centralC, centralD, ratioF, centralR]
  ring

theorem amplitude_approximation (ε C D errC errD : ℕ → ℝ)
    (hε : Tendsto ε atTop (𝓝 0)) (herrC : Tendsto errC atTop (𝓝 0)) (herrD : Tendsto errD atTop (𝓝 0))
    (hC : ∀ᶠ n in atTop, C n = centralC (ε n) + (ε n)^2*errC n)
    (hD : ∀ᶠ n in atTop, D n = centralD (Real.pi/2) (ε n) + (ε n)^2*errD n) :
    ∃ errA : ℕ → ℝ, Tendsto errA atTop (𝓝 0) ∧
      ∀ᶠ n in atTop, C n * D n = ratioF (Real.pi/2) (ε n) + (ε n)^2*errA n := by
  let errA : ℕ → ℝ := fun n => errC n * centralD (Real.pi/2) (ε n) +
    errD n * centralC (ε n) + (ε n)^2*errC n*errD n + ε n * centralR (Real.pi/2) (ε n)
  refine ⟨errA, ?_, ?_⟩
  · have hc : ContinuousAt centralC 0 := by unfold centralC; fun_prop
    have hd : ContinuousAt (centralD (Real.pi/2)) 0 := by unfold centralD; fun_prop
    have hr : ContinuousAt (centralR (Real.pi/2)) 0 := by unfold centralR; fun_prop
    have hcc : Tendsto (fun n => centralC (ε n)) atTop (𝓝 1) := by
      have hh := hc.tendsto.comp hε
      simpa [centralC, Function.comp_def] using hh
    have hdd : Tendsto (fun n => centralD (Real.pi/2) (ε n)) atTop (𝓝 1) := by
      have hh := hd.tendsto.comp hε
      simpa [centralD, Function.comp_def] using hh
    have hrr := hr.tendsto.comp hε
    have hh := (((herrC.mul hdd).add (herrD.mul hcc)).add (((hε.pow 2).mul herrC).mul herrD)).add (hε.mul hrr)
    simpa [errA, Function.comp_def] using hh
  · filter_upwards [hC,hD] with n hnC hnD
    rw [hnC,hnD]
    have hh := central_product_algebra (Real.pi/2) (ε n)
    dsimp [errA]
    nlinarith [hh]


theorem eventual_violation_of_three_approximations (κ ratio T C D errT errC errD : ℕ → ℝ)
    (hκ : ∀ᶠ n in atTop, κ n ≠ 0)
    (hε : Tendsto (fun n => 1/(κ n)^2) atTop (𝓝 0))
    (herrT : Tendsto errT atTop (𝓝 0)) (herrC : Tendsto errC atTop (𝓝 0)) (herrD : Tendsto errD atTop (𝓝 0))
    (hT : ∀ᶠ n in atTop, T n = ratioT (Real.pi/2) (1/(κ n)^2) + (1/(κ n)^2)^2*errT n)
    (hC : ∀ᶠ n in atTop, C n = centralC (1/(κ n)^2) + (1/(κ n)^2)^2*errC n)
    (hD : ∀ᶠ n in atTop, D n = centralD (Real.pi/2) (1/(κ n)^2) + (1/(κ n)^2)^2*errD n)
    (hratio : ∀ᶠ n in atTop, ratio n = (2/Real.pi)*T n*(C n*D n)) :
    ∀ᶠ n in atTop, Real.pi^2/(12*(κ n)^2) < ratio n - 1 := by
  obtain ⟨errA, herrA, hA⟩ := amplitude_approximation (fun n => 1/(κ n)^2) C D errC errD hε herrC herrD hC hD
  exact eventual_violation_of_factor_approximations κ ratio T (fun n => C n*D n) errT errA
    hκ hε herrT herrA hT hA hratio

end LopezPousoSegura
