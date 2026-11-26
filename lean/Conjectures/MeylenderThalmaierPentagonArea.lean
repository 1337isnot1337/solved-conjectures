import Conjectures.MeylenderThalmaierPentagon
import Conjectures.MeylenderThalmaierStrips

/-! The exact Lebesgue area and covering ratio of the rational pentagonal
competitor, evaluated by splitting its vertical sections at the vertices. -/

noncomputable section

namespace MeylenderThalmaier
open Set MeasureTheory

private abbrev leftBand := band (-2/3) (-1/9) (-114/125) (-71/125) (111/125) (79/125)
private abbrev middleBand := band (-1/9) (1/3) (2031/2275) (-836/2275) (-22659/20480) (1681/4096)
private abbrev rightBand := band (1/3) (177/455) (681/760) (-127453/345800) (-22659/20480) (1681/4096)

private theorem pentagon_bands :
    pentagon={pentagonVertices 0} ∪ (leftBand ∪ (middleBand ∪ rightBand)) := by
  ext p
  constructor
  · intro h
    obtain ⟨_,_,_,_,_⟩ := (pentagon_mem p).mp h
    by_cases h₀ : p 0≤ -2/3
    · left
      change p = pentagonVertices 0
      ext i
      fin_cases i <;> dsimp [pentagonVertices] <;> linarith
    right
    by_cases h₁ : p 0≤ -1/9
    · left
      apply band_mem.mpr
      exact ⟨⟨by linarith,h₁⟩,by constructor <;> linarith⟩
    right
    by_cases h₂ : p 0≤1/3
    · left
      apply band_mem.mpr
      exact ⟨⟨by linarith,h₂⟩,by constructor <;> linarith⟩
    right
    apply band_mem.mpr
    exact ⟨by constructor <;> linarith,by constructor <;> linarith⟩
  · rintro (h|h|h|h)
    · rw [Set.mem_singleton_iff] at h
      exact h ▸ pentagon_vertices 0
    all_goals
      obtain ⟨⟨hl,hr⟩,⟨hb,ht⟩⟩ := band_mem.mp h
      apply (pentagon_mem _).mpr
      exact ⟨by linarith,by linarith,by linarith,by linarith,by linarith⟩

theorem volume_pentagon : volume pentagon=ENNReal.ofReal (1092843/2070250) := by
  have leftVol : volume leftBand=ENNReal.ofReal (5/18) := by
    rw [volume_band (by norm_num) (by rintro x ⟨h₁,h₂⟩; linarith)]
    norm_num
  have midVol : volume middleBand=ENNReal.ofReal (2589331/10483200) := by
    rw [volume_band (by norm_num) (by rintro x ⟨h₁,h₂⟩; linarith)]
    norm_num
  have rightVol : volume rightBand=ENNReal.ofReal (1644963/529984000) := by
    rw [volume_band (by norm_num) (by rintro x ⟨h₁,h₂⟩; linarith)]
    norm_num
  have d₁ : Disjoint leftBand (middleBand ∪ rightBand) := by
    apply Set.disjoint_left.mpr
    rintro x h (h'|h')
    all_goals
      have := (band_mem.mp h).1.2
      have := (band_mem.mp h').1.1
      linarith
  have d₂ : Disjoint middleBand rightBand := by
    apply Set.disjoint_left.mpr
    intro x h h'
    exact (not_lt.mpr (band_mem.mp h).1.2) (band_mem.mp h').1.1
  have zero (s : Set Plane) : volume ({pentagonVertices 0} ∪ s)=volume s := by
    apply le_antisymm _ (measure_mono Set.subset_union_right)
    simpa using (measure_union_le ({pentagonVertices 0} : Set Plane) s (μ := volume))
  rw [pentagon_bands,zero,measure_union d₁ ((band_measurable ..).union (band_measurable ..)),
    measure_union d₂ (band_measurable ..),leftVol,midVol,rightVol]
  rw [← ENNReal.ofReal_add (by norm_num) (by norm_num),
      ← ENNReal.ofReal_add (by norm_num) (by norm_num)]
  norm_num

theorem pentagon_geometric_counterexample :
    coverRatioInv (1/10) (9/10) pentagon=208733013/207025000 ∧
    trapezoidRatioInv (1/10) (9/10)=783100/753571 ∧
    1<coverRatioInv (1/10) (9/10) pentagon ∧
    coverRatioInv (1/10) (9/10) pentagon<trapezoidRatioInv (1/10) (9/10) := by
  rw [coverRatioInv,pentagon_scale,volume_pentagon,
    volume_truncatedSquare (by norm_num) (by norm_num) (by norm_num) (by norm_num)]
  norm_num [trapezoidRatioInv,legX,legY,cut]

end MeylenderThalmaier
