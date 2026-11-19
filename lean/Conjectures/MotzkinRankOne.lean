import Conjectures.MotzkinCircleGeometry
import Mathlib.Algebra.Ring.Int.Parity
import Mathlib.Tactic.FieldSimp

/-! Exact maximization on the annihilator of one integral relation. This is
the algebraic rank-one value; the transfer to arbitrary compact groups is separate. -/
namespace Motzkin

noncomputable def signedReal (n : ℤ) (r : ℝ) : ℝ := if 0 ≤ n then r else -r

theorem mul_signedReal (n : ℤ) (r : ℝ) : (n:ℝ)*signedReal n r = |(n:ℝ)| * r := by
  by_cases hn : 0 ≤ n
  · rw [signedReal,ite_eq_left hn,abs_of_nonneg (by exact_mod_cast hn)]
  · have hn' : (n:ℝ) < 0 := by exact_mod_cast lt_of_not_ge hn
    rw [signedReal,ite_eq_right hn,abs_of_neg hn']
    ring

theorem norm_signedReal (n : ℤ) (r : ℝ) (hr : 0 ≤ r) (hrh : r ≤ 1/2) :
    ‖(signedReal n r:UnitAddCircle)‖=r := by
  have hnorm : ‖(r:UnitAddCircle)‖=r := by
    rw [(AddCircle.norm_coe_eq_abs_iff (1:ℝ) (by norm_num)).mpr
      (by simpa only [abs_one,abs_of_nonneg hr] using hrh),abs_of_nonneg hr]
  by_cases hn : 0 ≤ n
  · rwa [signedReal,ite_eq_left hn]
  · rw [signedReal,ite_eq_right hn,AddCircle.coe_neg,norm_neg,hnorm]

theorem abs_int_real (n : ℤ) : |(n:ℝ)|=(n.natAbs:ℝ) := by
  rw [← Int.norm_eq_abs,int_norm_natAbs]

theorem relation_norm_le_half (x y : UnitAddCircle) : min ‖x‖ ‖y‖ ≤ 1/2 := by
  have hh := AddCircle.norm_le_half_period (1:ℝ) (x:=x) (by norm_num)
  norm_num only [abs_one] at hh
  exact (min_le_left _ _).trans hh

theorem rank_one_upper (u v : ℤ) (hk : 0 < u.natAbs+v.natAbs)
    (x y : UnitAddCircle) (hrel : u • x+v • y=0) :
    min ‖x‖ ‖y‖ ≤ ((u.natAbs+v.natAbs)/2:ℕ)/((u.natAbs+v.natAbs:ℕ):ℝ) := by
  let k := u.natAbs+v.natAbs
  have hkp : (0:ℝ) < k := by exact_mod_cast hk
  change min ‖x‖ ‖y‖ ≤ (k/2:ℕ)/(k:ℝ)
  apply (le_div_iff₀ hkp).mpr
  by_cases he : k%2=0
  · have hd : 2*(k/2)=k := by omega
    have hdr : (2:ℝ)*(k/2:ℕ)=(k:ℝ) := by exact_mod_cast hd
    have hh := relation_norm_le_half x y
    nlinarith
  · have ho : Odd k := Nat.odd_iff.mpr (by omega)
    have huv : Odd (u+v) := by
      change Odd (u.natAbs+v.natAbs) at ho
      rw [Nat.odd_add,Int.natAbs_odd,Int.natAbs_even] at ho
      exact Int.odd_add.mpr ho
    have hb := odd_relation_linear_bound u v huv x y hrel
    have hd : 2*(k/2)+1=k := Nat.two_mul_div_two_add_one_of_odd ho
    have hdr : (2:ℝ)*(k/2:ℕ)+1=(k:ℝ) := by exact_mod_cast hd
    change 1 ≤ (k:ℝ)*(1-2*min ‖x‖ ‖y‖) at hb
    nlinarith

theorem rank_one_attainment (u v : ℤ) (hk : 0 < u.natAbs+v.natAbs) :
    ∃ x y : UnitAddCircle, u • x+v • y=0 ∧
      min ‖x‖ ‖y‖ = ((u.natAbs+v.natAbs)/2:ℕ)/((u.natAbs+v.natAbs:ℕ):ℝ) := by
  let k := u.natAbs+v.natAbs
  let r : ℝ := (k/2:ℕ)/(k:ℝ)
  have hkp : (0:ℝ) < k := by exact_mod_cast hk
  have hkn : (k:ℝ) ≠ 0 := ne_of_gt hkp
  have hr : 0 ≤ r := div_nonneg (Nat.cast_nonneg _) hkp.le
  have hmh : 2*(k/2) ≤ k := by omega
  have hmhr : (2:ℝ)*(k/2:ℕ) ≤ (k:ℝ) := by exact_mod_cast hmh
  have hrh : r ≤ 1/2 := by
    apply (div_le_iff₀ hkp).mpr
    nlinarith only [hmhr]
  refine ⟨(signedReal u r:UnitAddCircle),(signedReal v r:UnitAddCircle),?_,?_⟩
  · rw [← AddCircle.coe_zsmul,← AddCircle.coe_zsmul,← AddCircle.coe_add]
    simp only [zsmul_eq_mul,mul_signedReal,abs_int_real]
    have he : (u.natAbs:ℝ)*r+(v.natAbs:ℝ)*r=(k/2:ℕ) := by
      rw [← add_mul,← Nat.cast_add]
      change (k:ℝ)*((k/2:ℕ)/(k:ℝ))=(k/2:ℕ)
      field_simp
    rw [he]
    exact (AddCircle.coe_eq_zero_iff (1:ℝ)).mpr
      ⟨Int.ofNat (k/2),by simp only [zsmul_eq_mul,Int.ofNat_eq_natCast,Int.cast_natCast,mul_one]⟩
  · rw [norm_signedReal u r hr hrh,norm_signedReal v r hr hrh,min_self]

noncomputable def relationValue (u v : ℤ) : ℝ :=
  sSup {h : ℝ | ∃ x y : UnitAddCircle, u • x+v • y=0 ∧ h=min ‖x‖ ‖y‖}

theorem rank_one_value (u v : ℤ) (hk : 0 < u.natAbs+v.natAbs) :
    relationValue u v = ((u.natAbs+v.natAbs)/2:ℕ)/((u.natAbs+v.natAbs:ℕ):ℝ) := by
  obtain ⟨x,y,hrel,he⟩ := rank_one_attainment u v hk
  unfold relationValue
  apply le_antisymm
  · apply csSup_le
    · exact ⟨min ‖x‖ ‖y‖,x,y,hrel,rfl⟩
    · rintro h ⟨x',y',hrel',rfl⟩
      exact rank_one_upper u v hk x' y' hrel'
  · apply le_csSup
    · refine ⟨1/2,?_⟩
      rintro h ⟨x',y',_,rfl⟩
      exact relation_norm_le_half x' y'
    · exact ⟨x,y,hrel,he.symm⟩

end Motzkin
