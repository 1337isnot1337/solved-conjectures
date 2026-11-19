import Mathlib.Analysis.Normed.Group.AddCircle
import Mathlib.Analysis.Normed.Group.Int
import Mathlib.Tactic.Abel
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! The antipodal identity on the unit circle gives the rank-one odd-relation
bound used in the explicit Motzkin value formula. -/
namespace Motzkin

noncomputable def halfPoint : UnitAddCircle := ((1/2:ℝ):UnitAddCircle)

theorem halfPoint_add : halfPoint+halfPoint=0 := by
  calc
    _ = ((1/2+1/2:ℝ):UnitAddCircle) := rfl
    _ = ((1:ℝ):UnitAddCircle) := by congr 1; ring
    _ = 0 := AddCircle.coe_period (1:ℝ)

theorem norm_halfPoint : ‖halfPoint‖=(1:ℝ)/2 := by
  simpa only [halfPoint,abs_one] using AddCircle.norm_half_period_eq (1:ℝ)

theorem norm_sub_halfPoint (x : UnitAddCircle) : ‖x-halfPoint‖=1/2-‖x‖ := by
  obtain ⟨r⟩ := x
  change ‖(r:UnitAddCircle)-halfPoint‖=1/2-‖(r:UnitAddCircle)‖
  let c : ℝ := r-round r
  have hc : |c| ≤ 1/2 := abs_sub_round r
  have hcl := (abs_le.mp hc).1
  have hcu := (abs_le.mp hc).2
  have hint : ((round r:ℝ):UnitAddCircle)=0 :=
    (AddCircle.coe_eq_zero_iff (1:ℝ)).mpr ⟨round r,by simp⟩
  have he : (c:UnitAddCircle)=(r:UnitAddCircle) := by
    dsimp only [c]
    rw [AddCircle.coe_sub,hint,sub_zero]
  rw [← he]
  have hn : ‖(c:UnitAddCircle)‖=|c| :=
    (AddCircle.norm_coe_eq_abs_iff (1:ℝ) (by norm_num)).mpr (by simpa only [abs_one] using hc)
  rw [hn]
  by_cases h0 : 0 ≤ c
  · have hm : |c-1/2| ≤ 1/2 := abs_le.mpr ⟨by linarith,by linarith⟩
    have hnm : ‖((c-1/2:ℝ):UnitAddCircle)‖=|c-1/2| :=
      (AddCircle.norm_coe_eq_abs_iff (1:ℝ) (by norm_num)).mpr (by simpa only [abs_one] using hm)
    change ‖((c-1/2:ℝ):UnitAddCircle)‖=1/2-|c|
    rw [hnm,abs_of_nonpos (by linarith),abs_of_nonneg h0]
    ring
  · have hc0 : c < 0 := lt_of_not_ge h0
    have hp0 : 0 ≤ c+1/2 := by linarith
    have hp : |c+1/2| ≤ 1/2 := abs_le.mpr ⟨by linarith,by linarith⟩
    have hnp : ‖((c+1/2:ℝ):UnitAddCircle)‖=|c+1/2| :=
      (AddCircle.norm_coe_eq_abs_iff (1:ℝ) (by norm_num)).mpr (by simpa only [abs_one] using hp)
    have hshift : (c:UnitAddCircle)-halfPoint=((c+1/2:ℝ):UnitAddCircle) := by
      calc
        _ = ((c-1/2:ℝ):UnitAddCircle) := rfl
        _ = (((c-1/2)+1:ℝ):UnitAddCircle) := (AddCircle.coe_add_period (1:ℝ) (c-1/2)).symm
        _ = ((c+1/2:ℝ):UnitAddCircle) := by congr 1; ring
    rw [hshift,hnp,abs_of_nonneg hp0,abs_of_neg hc0]
    ring

theorem odd_zsmul_halfPoint (n : ℤ) (hn : Odd n) : n • halfPoint=halfPoint := by
  obtain ⟨k,hk⟩ := hn
  rw [hk,two_mul,add_zsmul,add_zsmul,one_zsmul]
  have hh : k • halfPoint+k • halfPoint=0 := by
    rw [← zsmul_add,halfPoint_add,zsmul_zero]
  rw [hh,zero_add]

theorem int_norm_natAbs (n : ℤ) : ‖n‖=(n.natAbs:ℝ) := by
  rw [Int.norm_eq_abs,← Int.cast_abs,← Int.natCast_natAbs,Int.cast_natCast]

theorem odd_relation_linear_bound (u v : ℤ) (hodd : Odd (u+v)) (x y : UnitAddCircle)
    (hrel : u • x+v • y=0) :
    1 ≤ ((u.natAbs+v.natAbs:ℕ):ℝ)*(1-2*min ‖x‖ ‖y‖) := by
  have he : u • (x-halfPoint)+v • (y-halfPoint) = -halfPoint := by
    calc
      _ = (u • x+v • y)-(u+v) • halfPoint := by
        rw [zsmul_sub,zsmul_sub,add_zsmul]
        abel
      _ = -halfPoint := by rw [hrel,odd_zsmul_halfPoint _ hodd,zero_sub]
  have hh : (1:ℝ)/2 ≤ ‖u‖*‖x-halfPoint‖+‖v‖*‖y-halfPoint‖ := by
    calc
      (1:ℝ)/2 = ‖u • (x-halfPoint)+v • (y-halfPoint)‖ := by rw [he,norm_neg,norm_halfPoint]
      _ ≤ ‖u • (x-halfPoint)‖+‖v • (y-halfPoint)‖ := norm_add_le _ _
      _ ≤ ‖u‖*‖x-halfPoint‖+‖v‖*‖y-halfPoint‖ :=
        add_le_add (norm_zsmul_le u _) (norm_zsmul_le v _)
  rw [norm_sub_halfPoint,norm_sub_halfPoint,int_norm_natAbs,int_norm_natAbs] at hh
  have hx := mul_nonneg (Nat.cast_nonneg u.natAbs : (0:ℝ) ≤ u.natAbs)
    (sub_nonneg.mpr (min_le_left ‖x‖ ‖y‖))
  have hy := mul_nonneg (Nat.cast_nonneg v.natAbs : (0:ℝ) ≤ v.natAbs)
    (sub_nonneg.mpr (min_le_right ‖x‖ ‖y‖))
  push_cast
  nlinarith

end Motzkin
