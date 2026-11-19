import Conjectures.MotzkinCircleLift
import Conjectures.MotzkinCircleGeometry

/-! Geometry of the fixed half-open character window. The representative
translation identity includes the boundary points exactly. -/
namespace Motzkin

open Set MeasureTheory
open RationalIntervals

def initialWindow (h : ℝ) : Set UnitAddCircle :=
  ((↑):ℝ → UnitAddCircle) '' Ico (0:ℝ) h

theorem mem_initialWindow (h : ℝ) (h1 : h ≤ 1) (x : UnitAddCircle) :
    x ∈ initialWindow h ↔ representative x < h := by
  have hs : Ico (0:ℝ) h ⊆ Ico (0:ℝ) 1 :=
    fun _ hr => ⟨hr.1,hr.2.trans_le h1⟩
  rw [initialWindow,image_eq_liftSet hs]
  change (0 ≤ representative x ∧ representative x < h) ↔ representative x < h
  exact ⟨fun hx => hx.2,fun hx => ⟨(representative_mem x).1,hx⟩⟩

theorem measurable_initialWindow (h : ℝ) (h1 : h ≤ 1) :
    MeasurableSet (initialWindow h) :=
  image_measurable (fun _ hr => ⟨hr.1,hr.2.trans_le h1⟩) measurableSet_Ico

theorem initialWindow_norm_sub_lt (h : ℝ) (hh : h ≤ 1/2)
    {x y : UnitAddCircle} (hx : x ∈ initialWindow h) (hy : y ∈ initialWindow h) :
    ‖y-x‖ < h := by
  obtain ⟨r,hr,rfl⟩ := hx
  obtain ⟨s,hs,rfl⟩ := hy
  have habs : |s-r| < h := abs_lt.mpr ⟨by linarith [hr.1,hr.2,hs.1,hs.2],
    by linarith [hr.1,hr.2,hs.1,hs.2]⟩
  have he : ‖((s-r:ℝ):UnitAddCircle)‖=|s-r| :=
    (AddCircle.norm_coe_eq_abs_iff (1:ℝ) (by norm_num)).mpr
      (by simpa only [abs_one] using habs.le.trans hh)
  rwa [← AddCircle.coe_sub,he]

theorem representative_sub_window (x : UnitAddCircle) (h : ℝ)
    (h0 : 0 ≤ h) (h1 : h ≤ 1) :
    representative (x-(h:UnitAddCircle))=
      representative x-h+(if representative x < h then 1 else 0) := by
  have hr := representative_mem x
  have he : ((representative x-h:ℝ):UnitAddCircle)=x-(h:UnitAddCircle) := by
    rw [AddCircle.coe_sub,coe_representative]
  by_cases hx : representative x < h
  · rw [if_pos hx]
    have hm : representative x-h+1 ∈ Ico (0:ℝ) 1 :=
      ⟨by linarith [hr.1],by linarith⟩
    calc
      representative (x-(h:UnitAddCircle))=
          representative ((representative x-h+1:ℝ):UnitAddCircle) := by
        rw [AddCircle.coe_add_period,he]
      _=representative x-h+1 := representative_coe hm
  · rw [if_neg hx,add_zero,← he]
    apply representative_coe
    exact ⟨by linarith,by linarith [hr.2]⟩

/-- The positive real norm, viewed in the circle, is the original point or
its negative. In particular it belongs to every subgroup containing the point. -/
theorem coe_norm_eq_or_neg (x : UnitAddCircle) :
    ((‖x‖:ℝ):UnitAddCircle)=x ∨ ((‖x‖:ℝ):UnitAddCircle)=-x := by
  obtain ⟨r⟩ := x
  change ((‖(r:UnitAddCircle)‖:ℝ):UnitAddCircle)=(r:UnitAddCircle) ∨
    ((‖(r:UnitAddCircle)‖:ℝ):UnitAddCircle)=-(r:UnitAddCircle)
  let c : ℝ := r-round r
  have hint : ((round r:ℝ):UnitAddCircle)=0 :=
    (AddCircle.coe_eq_zero_iff (1:ℝ)).mpr ⟨round r,by simp⟩
  have he : (c:UnitAddCircle)=(r:UnitAddCircle) := by
    dsimp only [c]
    rw [AddCircle.coe_sub,hint,sub_zero]
  have hn : ‖(r:UnitAddCircle)‖=|c| := UnitAddCircle.norm_eq
  rw [hn]
  by_cases hc : 0 ≤ c
  · left
    rw [abs_of_nonneg hc]
    exact he
  · right
    rw [abs_of_neg (lt_of_not_ge hc),AddCircle.coe_neg,he]

end Motzkin
