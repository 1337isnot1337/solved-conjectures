import Conjectures.LopezPousoSeguraBesselAverage
import Mathlib.Analysis.Asymptotics.SpecificAsymptotics
open Filter Asymptotics
open scoped Topology
namespace BesselWeights

theorem weightedMean_tendsto (w c : ℕ → ℝ) (L : ℝ)
    (hw : ∀ n, 0 < w n) (hc : Tendsto c atTop (𝓝 L))
    (hS : Tendsto (weightSum w) atTop atTop) :
    Tendsto (weightedMean w c) atTop (𝓝 L) := by
  have hdiff : Tendsto (fun n => c n-L) atTop (𝓝 0) := by
    have hconst : Tendsto (fun _ : ℕ => L) atTop (𝓝 L) := tendsto_const_nhds
    simpa using hc.sub hconst
  have hlittle : (fun n => w n * (c n-L)) =o[atTop] w := by
    have hh := (isBigO_refl w atTop).mul_isLittleO ((isLittleO_one_iff ℝ).2 hdiff)
    simpa using hh
  have hsum := hlittle.sum_range (show 0 ≤ w from fun n => (hw n).le) hS
  have hne : ∀ᶠ n in atTop, weightSum w n ≠ 0 := hS.eventually_ne_atTop 0
  have hquot : Tendsto (fun n => (∑ k ∈ Finset.range n, w k*(c k-L))/weightSum w n) atTop (𝓝 0) := by
    apply (isLittleO_iff_tendsto' ?_).1 hsum
    filter_upwards [hne] with n hn
    exact fun h => (hn h).elim
  have hshift := hquot.comp (tendsto_add_atTop_nat 1)
  apply tendsto_sub_nhds_zero_iff.1
  apply hshift.congr'
  filter_upwards with n
  have hn : weightSum w (n+1) ≠ 0 := (weightSum_positive w hw n).ne'
  dsimp [weightedMean, Function.comp_def, weightSum, weightedSum] at *
  simp_rw [mul_sub]
  rw [Finset.sum_sub_distrib, ← Finset.sum_mul]
  field_simp [hn]

theorem sourceK_tendsto_of_C (g lam : ℝ → ℝ) (L : ℝ)
    (hgp : ∀ n : ℕ, 0 < g (n+1))
    (hC : Tendsto (sourceC g lam) atTop (𝓝 L))
    (hS : Tendsto (weightSum (sourceWeight g)) atTop atTop) :
    Tendsto (sourceK g lam) atTop (𝓝 L) := by
  have hw : ∀ k, 0 < sourceWeight g k := fun k => div_pos (hgp k) (by norm_num)
  have hform : ∀ k, sourceC g lam k = 2*weightSum (sourceWeight g) k + sourceWeight g k - sourceLambda lam k/2 := by
    intro k
    simpa [sourceC, sourceWeight, sourceLambda, weightSum] using C_source_formula g lam k
  have heq : sourceK g lam = weightedMean (sourceWeight g) (sourceC g lam) := by
    funext n
    exact source_K_is_mean _ _ _ n hw hform
  rw [heq]
  exact weightedMean_tendsto _ _ _ hw hC hS
end BesselWeights
