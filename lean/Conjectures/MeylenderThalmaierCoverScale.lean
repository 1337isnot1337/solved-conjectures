import Conjectures.MeylenderThalmaierArea

/-! The supremal scale of the four required geometric shapes is exactly one
for the explicit parallelogram. -/

noncomputable section

namespace MeylenderThalmaier

def scaled (r : ℝ) (shape : Set Plane) : Set Plane := (fun x => r • x) '' shape

def coversAt (a b : ℝ) (K : Set Plane) (r : ℝ) : Prop :=
  0≤r ∧ Fits K (scaled r (convexHull ℝ horizontal)) ∧ Fits K (scaled r (convexHull ℝ vertical)) ∧
  Fits K (scaled r (convexHull ℝ (triangle (legX a b) (legY a b)))) ∧
  Fits K (scaled r (convexHull ℝ (triangle (-legX a b) (-legY a b))))

def coverScale (a b : ℝ) (K : Set Plane) := sSup {r | coversAt a b K r}

theorem fits_vertical_le {a r : ℝ} (h : Fits (parallelogram a) (scaled r (convexHull ℝ vertical))) : r≤1 := by
  obtain ⟨z,hz⟩ := h
  let w : Plane := ![0,1]
  have base : (0 : Plane)∈convexHull ℝ vertical := subset_convexHull ℝ _ (Or.inl rfl)
  have tip : w∈convexHull ℝ vertical := subset_convexHull ℝ _ (Or.inr rfl)
  have h₀ := hz _ ⟨0,base,rfl⟩
  have h₁ := hz _ ⟨w,tip,rfl⟩
  have h₀' : |axisU z|≤1/2 := by simpa using h₀.1
  have hu : axisU (z+r • w)=axisU z+r := by simp [axisU,w]; ring
  have h₁' : |axisU z+r|≤1/2 := hu ▸ h₁.1
  rw [abs_le] at h₀' h₁'
  linarith

theorem parallelogram_scale {a b : ℝ} (ha : 0<a) (ha' : a<1) (hb : 0<b) (hb' : b<1) :
    coverScale a b (parallelogram a)=1 := by
  have one (s : Set Plane) : scaled 1 s=s := by simp [scaled]
  have atOne : coversAt a b (parallelogram a) 1 := by
    simpa only [coversAt,fourShapes,one,zero_le_one,true_and] using parallelogram_covers ha ha' hb hb'
  have upper (r : ℝ) (hr : coversAt a b (parallelogram a) r) : r≤1 := fits_vertical_le hr.2.2.1
  apply le_antisymm (csSup_le ⟨1,atOne⟩ upper)
  exact le_csSup ⟨1,upper⟩ atOne

/-- The inverse ratio evaluated with the geometric covering scale and the
truncated-square area 1−ab/2. -/
theorem parallelogram_ratio {a b : ℝ} (ha : 0<a) (ha' : a<1) (hb : 0<b) (hb' : b<1) :
    2*(MeasureTheory.volume (parallelogram a)).toReal*(1-a*b/2) /
        coverScale a b (parallelogram a)^2=parallelRatioInv a b := by
  rw [parallelogram_scale ha ha' hb hb',volume_parallelogram ha']
  rw [ENNReal.toReal_ofReal (div_nonneg zero_le_one (by linarith) : 0≤1/(2-a))]
  unfold parallelRatioInv
  field_simp [show 2-a≠0 by linarith]

end MeylenderThalmaier
