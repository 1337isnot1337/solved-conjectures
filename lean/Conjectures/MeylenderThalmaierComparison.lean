import Conjectures.MeylenderThalmaierCoverScale
import Conjectures.MeylenderThalmaierCutArea

/-! Geometric comparisons using Lebesgue area and the largest scale of the
two unit segments and two normal triangles fitting in the competing body. -/

noncomputable section

namespace MeylenderThalmaier

open Filter MeasureTheory
open scoped Topology

def coverRatioInv (a b : ℝ) (K : Set Plane) : ℝ :=
  2*(volume K).toReal*(volume (truncatedSquare a b)).toReal / coverScale a b K^2

theorem coverRatio_parallelogram {a b : ℝ} (ha : 0<a) (ha' : a<1) (hb : 0<b) (hb' : b<1) :
    coverRatioInv a b (parallelogram a)=parallelRatioInv a b := by
  rw [coverRatioInv,volume_truncatedSquare ha ha' hb hb']
  exact parallelogram_ratio ha ha' hb hb'

theorem geometric_counterexample :
    coverRatioInv (1/2) (9/10) (parallelogram (1/2))=31/30 ∧
    trapezoidRatioInv (1/2) (9/10)=4340/3971 ∧
    coverRatioInv (1/2) (9/10) (parallelogram (1/2)) < trapezoidRatioInv (1/2) (9/10) := by
  rw [coverRatio_parallelogram (by norm_num) (by norm_num) (by norm_num) (by norm_num)]
  exact concrete_comparison

theorem geometric_eventually_better {a : ℝ} (ha : 0<a) (ha' : a<1) :
    ∀ᶠ b in 𝓝[<] (1 : ℝ), coverRatioInv a b (parallelogram a)<trapezoidRatioInv a b := by
  have pos : ∀ᶠ b in 𝓝[<] (1 : ℝ), 0<b :=
    (eventually_gt_nhds zero_lt_one).filter_mono nhdsWithin_le_nhds
  filter_upwards [eventually_better ha ha',pos,(self_mem_nhdsWithin : Set.Iio (1 : ℝ) ∈ 𝓝[<] (1 : ℝ))] with b h hb hb'
  rwa [coverRatio_parallelogram ha ha' hb hb']

end MeylenderThalmaier
