import Conjectures.MotzkinRankOne
import Mathlib.Data.Finset.Max

/-! The annihilator of a rank-two lattice with basis (m,0),(s,k) is the
explicit m-by-k grid of circle pairs used by the Motzkin value formula. -/
namespace Motzkin

noncomputable def rankTwoPoint (m k : ℕ) (s : ℤ) (i j : ℕ) :
    UnitAddCircle × UnitAddCircle :=
  (((i:ℝ)/(m:ℝ):ℝ),((j:ℝ)/(k:ℝ)-(s:ℝ)*(i:ℝ)/((m:ℝ)*(k:ℝ)):ℝ))

theorem rankTwoPoint_relations (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k)
    (i j : ℕ) :
    m • (rankTwoPoint m k s i j).1=0 ∧
      s • (rankTwoPoint m k s i j).1+k • (rankTwoPoint m k s i j).2=0 := by
  have hm0 : (m:ℝ) ≠ 0 := by exact_mod_cast hm.ne'
  have hk0 : (k:ℝ) ≠ 0 := by exact_mod_cast hk.ne'
  constructor
  · change m • (((i:ℝ)/(m:ℝ):ℝ):UnitAddCircle)=0
    rw [← AddCircle.coe_nsmul]
    apply (AddCircle.coe_eq_zero_iff (1:ℝ)).mpr
    refine ⟨(i:ℤ),?_⟩
    simp only [nsmul_eq_mul,zsmul_eq_mul,Int.cast_natCast,mul_one]
    field_simp
  · change s • (((i:ℝ)/(m:ℝ):ℝ):UnitAddCircle)+
      k • (((j:ℝ)/(k:ℝ)-(s:ℝ)*(i:ℝ)/((m:ℝ)*(k:ℝ)):ℝ):UnitAddCircle)=0
    rw [← AddCircle.coe_zsmul,← AddCircle.coe_nsmul,← AddCircle.coe_add]
    apply (AddCircle.coe_eq_zero_iff (1:ℝ)).mpr
    refine ⟨(j:ℤ),?_⟩
    simp only [nsmul_eq_mul,zsmul_eq_mul,Int.cast_natCast,mul_one]
    field_simp
    ring

theorem rank_two_grid_complete (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k)
    (x y : UnitAddCircle) (hmx : m • x=0) (hsky : s • x+k • y=0) :
    ∃ i : Fin m, ∃ j : Fin k, (x,y)=rankTwoPoint m k s i j := by
  obtain ⟨i,hi,hxi⟩ := (AddCircle.nsmul_eq_zero_iff hm).mp hmx
  simp only [mul_one] at hxi
  let c : ℝ := (s:ℝ)*(i:ℝ)/((m:ℝ)*(k:ℝ))
  have hm0 : (m:ℝ) ≠ 0 := by exact_mod_cast hm.ne'
  have hk0 : (k:ℝ) ≠ 0 := by exact_mod_cast hk.ne'
  have hshift : k • (c:UnitAddCircle)=s • x := by
    rw [← hxi,← AddCircle.coe_nsmul,← AddCircle.coe_zsmul]
    congr 1
    simp only [nsmul_eq_mul,zsmul_eq_mul]
    dsimp only [c]
    field_simp
  have ht : k • (y+(c:UnitAddCircle))=0 := by
    rw [nsmul_add,hshift,add_comm]
    exact hsky
  obtain ⟨j,hj,htj⟩ := (AddCircle.nsmul_eq_zero_iff hk).mp ht
  simp only [mul_one] at htj
  have hyj : y=(((j:ℝ)/(k:ℝ)-c:ℝ):UnitAddCircle) := by
    rw [AddCircle.coe_sub]
    exact eq_sub_of_add_eq htj.symm
  refine ⟨⟨i,hi⟩,⟨j,hj⟩,?_⟩
  exact Prod.ext hxi.symm hyj

theorem rank_two_annihilator_maximum (m k : ℕ) (s : ℤ) (hm : 0 < m) (hk : 0 < k) :
    ∃ i : Fin m, ∃ j : Fin k,
      ∀ x y : UnitAddCircle, m • x=0 → s • x+k • y=0 →
        min ‖x‖ ‖y‖ ≤
          min ‖(rankTwoPoint m k s i j).1‖ ‖(rankTwoPoint m k s i j).2‖ := by
  classical
  let S : Finset (Fin m × Fin k) := Finset.univ
  have hS : S.Nonempty := ⟨(⟨0,hm⟩,⟨0,hk⟩),Finset.mem_univ _⟩
  let score (p : Fin m × Fin k) :=
    min ‖(rankTwoPoint m k s p.1 p.2).1‖ ‖(rankTwoPoint m k s p.1 p.2).2‖
  obtain ⟨p,_,hp⟩ := Finset.exists_max_image S score hS
  refine ⟨p.1,p.2,?_⟩
  intro x y hx hy
  obtain ⟨i,j,hij⟩ := rank_two_grid_complete m k s hm hk x y hx hy
  have h := hp (i,j) (Finset.mem_univ _)
  change min ‖(rankTwoPoint m k s i j).1‖ ‖(rankTwoPoint m k s i j).2‖ ≤ _ at h
  rw [← hij] at h
  exact h

end Motzkin
