import Conjectures.MeylenderThalmaierArea
import Mathlib.MeasureTheory.Measure.Haar.Unique

/-! The corner removed from the unit square has half the area of its
a-by-b bounding rectangle, by central reflection in that rectangle. -/

noncomputable section

namespace MeylenderThalmaier

open Set MeasureTheory
open scoped ENNReal

def unitBox : Set Plane := Icc 0 1
def cornerBox (a b : ℝ) : Set Plane := Icc ![1-a,1-b] 1
def level (a b : ℝ) (x : Plane) := b*x 0+a*x 1
def truncatedSquare (a b : ℝ) : Set Plane := unitBox ∩ {x | level a b x ≤ cut a b}
private def lowerCorner (a b : ℝ) : Set Plane := cornerBox a b ∩ {x | level a b x≤cut a b}
private def upperCorner (a b : ℝ) : Set Plane := cornerBox a b ∩ {x | cut a b≤level a b x}

private theorem box_mem (a b : ℝ) (x : Plane) :
    x∈cornerBox a b ↔ 1-a≤x 0 ∧ 1-b≤x 1 ∧ x 0≤1 ∧ x 1≤1 := by
  change ((∀ i, ![1-a,1-b] i≤x i) ∧ (∀ i, x i≤1)) ↔ _
  rw [Fin.forall_fin_two,Fin.forall_fin_two]
  tauto

private theorem unit_mem (x : Plane) : x∈unitBox ↔ 0≤x 0 ∧ 0≤x 1 ∧ x 0≤1 ∧ x 1≤1 := by
  change ((∀ i, 0≤x i) ∧ (∀ i, x i≤1)) ↔ _
  rw [Fin.forall_fin_two,Fin.forall_fin_two]
  tauto

private theorem diagonal_null {a b : ℝ} (ha : 0<a) :
    volume {x : Plane | level a b x=cut a b}=0 := by
  let m : Matrix (Fin 2) (Fin 2) ℝ := !![1,0;b,a]
  have hd : LinearMap.det m.toLin'=a := by simp [m,LinearMap.det_toLin',Matrix.det_fin_two_of]
  have row (x : Plane) : m.toLin' x 1=level a b x := by
    simp [m,Matrix.toLin'_apply,Matrix.mulVec,dotProduct,Fin.sum_univ_two,level]
  have eq : {x : Plane | level a b x=cut a b}=m.toLin' ⁻¹' {x : Plane | x 1=cut a b} :=
    Set.ext fun x => by change (_=_) ↔ (_=_); rw [row]
  have nul : volume {x : Plane | x 1=cut a b}=0 :=
    Measure.pi_hyperplane (fun _ : Fin 2 => (volume : Measure ℝ)) 1 (cut a b)
  rw [eq,Measure.addHaar_preimage_linearMap volume (hd ▸ ha.ne'),nul,mul_zero]

private theorem corner_halves {a b : ℝ} :
    volume (lowerCorner a b)=volume (upperCorner a b) := by
  let c : Plane := ![2-a,2-b]
  have ref (x : Plane) : level a b (c-x)=2*cut a b-level a b x := by
    simp [level,c,cut]; ring
  have eq : lowerCorner a b = (c-·) ⁻¹' upperCorner a b := by
    ext x
    change (x∈cornerBox a b ∧ level a b x≤cut a b) ↔
      (c-x∈cornerBox a b ∧ cut a b≤level a b (c-x))
    rw [box_mem,box_mem,ref]
    simp [c]
    constructor <;> rintro ⟨⟨_,_,_,_⟩,_⟩ <;> exact ⟨⟨by linarith,by linarith,by linarith,by linarith⟩,by linarith⟩
  have meas : MeasurableSet (upperCorner a b) := by
    apply measurableSet_Icc.inter
    exact measurableSet_le measurable_const (by unfold level; fun_prop)
  rw [eq]
  exact (Measure.measurePreserving_sub_left volume c).measure_preimage meas.nullMeasurableSet

private theorem corner_inside {a b : ℝ} (ha : a<1) (hb : b<1) :
    cornerBox a b ⊆ unitBox := by
  intro x hx
  rw [box_mem] at hx
  rw [unit_mem]
  obtain ⟨_,_,_,_⟩ := hx
  exact ⟨by linarith,by linarith,by assumption,by assumption⟩

private theorem above_in_corner {a b : ℝ} {x : Plane} (ha : 0<a) (hb : 0<b)
    (hx : x∈unitBox) (h : cut a b≤level a b x) : x∈cornerBox a b := by
  obtain ⟨_,_,h₀,h₁⟩ := (unit_mem x).mp hx
  unfold level cut at h
  apply (box_mem a b x).mpr
  refine ⟨?_,?_,h₀,h₁⟩
  · nlinarith [mul_nonneg ha.le (sub_nonneg.mpr h₁)]
  · nlinarith [mul_nonneg hb.le (sub_nonneg.mpr h₀)]

theorem volume_truncatedSquare {a b : ℝ} (ha : 0<a) (ha' : a<1) (hb : 0<b) (hb' : b<1) :
    (volume (truncatedSquare a b)).toReal=1-a*b/2 := by
  have ms : MeasurableSet (upperCorner a b) := measurableSet_Icc.inter
    (measurableSet_le measurable_const (by unfold level; fun_prop))
  have cn : volume (cornerBox a b)=ENNReal.ofReal (a*b) := by
    rw [cornerBox,Real.volume_Icc_pi,Fin.prod_univ_two]
    simp [ENNReal.ofReal_mul ha.le]
  have un : volume unitBox=1 := by rw [unitBox,Real.volume_Icc_pi,Fin.prod_univ_two]; norm_num
  have join : lowerCorner a b ∪ upperCorner a b=cornerBox a b := by
    ext x
    change ((x∈cornerBox a b ∧ level a b x≤cut a b) ∨ (x∈cornerBox a b ∧ cut a b≤level a b x)) ↔ x∈cornerBox a b
    rcases le_total (level a b x) (cut a b) with h|h <;> tauto
  have join' : truncatedSquare a b ∪ upperCorner a b=unitBox := by
    ext x
    change ((x∈unitBox ∧ level a b x≤cut a b) ∨ (x∈cornerBox a b ∧ cut a b≤level a b x)) ↔ x∈unitBox
    constructor
    · rintro (h|h)
      · exact h.1
      · exact corner_inside ha' hb' h.1
    · intro h
      rcases le_total (level a b x) (cut a b) with q|q
      · exact Or.inl ⟨h,q⟩
      · exact Or.inr ⟨above_in_corner ha hb h q,q⟩
  have null₁ : volume (lowerCorner a b ∩ upperCorner a b)=0 :=
    measure_mono_null (fun _ h => le_antisymm h.1.2 h.2.2) (diagonal_null ha)
  have null₂ : volume (truncatedSquare a b ∩ upperCorner a b)=0 :=
    measure_mono_null (fun _ h => le_antisymm h.1.2 h.2.2) (diagonal_null ha)
  have h₁ := measure_union_add_inter (μ := volume) (lowerCorner a b) ms
  have h₂ := measure_union_add_inter (μ := volume) (truncatedSquare a b) ms
  rw [join,null₁,add_zero,corner_halves,cn] at h₁
  rw [join',null₂,add_zero,un] at h₂
  have fin (s : Set Plane) (h : s⊆unitBox) : volume s ≠ ⊤ := by
    apply ne_top_of_le_ne_top (by simp : (1 : ℝ≥0∞)≠⊤)
    rw [←un]; exact measure_mono h
  have f₁ := fin (upperCorner a b) (fun _ h => corner_inside ha' hb' h.1)
  have f₂ := fin (truncatedSquare a b) (fun _ h => h.1)
  replace h₁ := congrArg ENNReal.toReal h₁
  replace h₂ := congrArg ENNReal.toReal h₂
  rw [ENNReal.toReal_ofReal (mul_nonneg ha.le hb.le),ENNReal.toReal_add f₁ f₁] at h₁
  rw [ENNReal.toReal_one,ENNReal.toReal_add f₂ f₁] at h₂
  linarith

end MeylenderThalmaier
