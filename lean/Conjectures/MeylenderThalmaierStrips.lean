import Conjectures.MeylenderThalmaierComparison
import Mathlib.MeasureTheory.Measure.Lebesgue.Integral
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

/-! Lebesgue area of a vertical strip bounded by two affine functions. -/

noncomputable section

namespace MeylenderThalmaier

open Set MeasureTheory

private def bandProd (l r m c n d : ℝ) : Set (ℝ × ℝ) :=
  {p | p.1∈Ioc l r ∧ p.2∈Icc (m*p.1+c) (n*p.1+d)}

def band (l r m c n d : ℝ) : Set Plane := MeasurableEquiv.finTwoArrow ⁻¹' bandProd l r m c n d

theorem band_mem {l r m c n d : ℝ} {p : Plane} :
    p∈band l r m c n d ↔ (l<p 0 ∧ p 0≤r) ∧ (m*p 0+c≤p 1 ∧ p 1≤n*p 0+d) := Iff.rfl

private theorem bandProd_measurable (l r m c n d : ℝ) : MeasurableSet (bandProd l r m c n d) :=
  measurableSet_region_between_cc (f := fun x : ℝ => m*x+c) (g := fun x : ℝ => n*x+d)
    (by fun_prop) (by fun_prop) measurableSet_Ioc

theorem band_measurable (l r m c n d : ℝ) : MeasurableSet (band l r m c n d) :=
  MeasurableEquiv.finTwoArrow.measurable (bandProd_measurable ..)

theorem volume_band {l r m c n d : ℝ} (hlr : l≤r)
    (hfg : ∀ x∈Ioc l r, m*x+c≤n*x+d) :
    volume (band l r m c n d) =
      ENNReal.ofReal ((n-m)*(r^2-l^2)/2+(d-c)*(r-l)) := by
  let f (x : ℝ) := m*x+c
  let g (x : ℝ) := n*x+d
  have hf : Continuous f := by dsimp [f]; fun_prop
  have hg : Continuous g := by dsimp [g]; fun_prop
  have mb := bandProd_measurable l r m c n d
  have mr := measurableSet_regionBetween hf.measurable hg.measurable (measurableSet_Ioc (a := l) (b := r))
  rw [band,(volume_preserving_finTwoArrow ℝ).measure_preimage mb.nullMeasurableSet]
  change (volume : Measure ℝ).prod volume _=_
  calc
    _ = (volume : Measure ℝ).prod volume (regionBetween f g (Ioc l r)) := by
      rw [Measure.prod_apply mb,Measure.prod_apply mr]
      apply lintegral_congr
      intro x
      by_cases hx : x∈Ioc l r
      · have cc : Prod.mk x ⁻¹' bandProd l r m c n d=Icc (f x) (g x) := by
          ext y
          exact and_iff_right hx
        have oo : Prod.mk x ⁻¹' regionBetween f g (Ioc l r)=Ioo (f x) (g x) := by
          ext y
          exact and_iff_right hx
        rw [cc,oo,Real.volume_Icc,Real.volume_Ioo]
      · have cc : Prod.mk x ⁻¹' bandProd l r m c n d=∅ := by
          ext y
          change (_ ∧ _) ↔ False
          exact ⟨fun h => hx h.1,False.elim⟩
        have oo : Prod.mk x ⁻¹' regionBetween f g (Ioc l r)=∅ := by
          ext y
          change (_ ∧ _) ↔ False
          exact ⟨fun h => hx h.1,False.elim⟩
        rw [cc,oo]
    _ = ENNReal.ofReal (∫ x in Ioc l r, (g-f) x) :=
      volume_regionBetween_eq_integral (hf.integrableOn_Icc.mono_set Ioc_subset_Icc_self)
        (hg.integrableOn_Icc.mono_set Ioc_subset_Icc_self) measurableSet_Ioc hfg
    _ = _ := by
      have iden : (g-f) = fun x => (n-m)*x+(d-c) := by funext x; simp [f,g]; ring
      rw [iden,← intervalIntegral.integral_of_le hlr]
      have hint : IntervalIntegrable (fun x : ℝ => (n-m)*x) volume l r :=
        Continuous.intervalIntegrable (by fun_prop) ..
      have hcst : IntervalIntegrable (fun _ : ℝ => d-c) volume l r :=
        Continuous.intervalIntegrable continuous_const ..
      rw [intervalIntegral.integral_add hint hcst,intervalIntegral.integral_const_mul,
          integral_id,intervalIntegral.integral_const]
      congr 1
      simp only [smul_eq_mul]
      ring

end MeylenderThalmaier
