module

public import Conjectures.SobolewskiUlasExceptionOriginalReduction

@[expose] public section
namespace SobolewskiUlasException

/-- The forbidden shape in Legendre's three-square theorem. -/
def ForbiddenThreeSquare (v : ℕ) : Prop := ∃ a b : ℕ, v = 4^a*(8*b+7)

private theorem square_mod_four (x : ℤ) : x^2%4=0 ∨ x^2%4=1 := by
  rw [pow_two, Int.mul_emod]
  have hr : 0≤x%4 ∧ x%4<4 := ⟨Int.emod_nonneg _ (by decide),Int.emod_lt_of_pos _ (by decide)⟩
  have hc : x%4=0 ∨ x%4=1 ∨ x%4=2 ∨ x%4=3 := by omega
  rcases hc with h0|h1|h2|h3 <;> norm_num [*]

private theorem square_mod_eight (x : ℤ) : x^2%8=0 ∨ x^2%8=1 ∨ x^2%8=4 := by
  rw [pow_two, Int.mul_emod]
  have hr : 0≤x%8 ∧ x%8<8 := ⟨Int.emod_nonneg _ (by decide),Int.emod_lt_of_pos _ (by decide)⟩
  have hc : x%8=0 ∨ x%8=1 ∨ x%8=2 ∨ x%8=3 ∨ x%8=4 ∨ x%8=5 ∨ x%8=6 ∨ x%8=7 := by omega
  rcases hc with h0|h1|h2|h3|h4|h5|h6|h7 <;> norm_num [*]

private theorem even_of_sq_mod_four_zero (x : ℤ) (h : x^2%4=0) : x%2=0 := by
  rw [pow_two, Int.mul_emod] at h
  have hr : 0≤x%4 ∧ x%4<4 := ⟨Int.emod_nonneg _ (by decide),Int.emod_lt_of_pos _ (by decide)⟩
  have hx : x%2=(x%4)%2 := by omega
  rw [hx]
  have hc : x%4=0 ∨ x%4=1 ∨ x%4=2 ∨ x%4=3 := by omega
  rcases hc with h0|h1|h2|h3
  · rw [h0]
    decide
  · norm_num [h1] at h
  · rw [h2]
    decide
  · norm_num [h3] at h

theorem forbidden_not_three_squares (v : ℕ) (h : ForbiddenThreeSquare v) :
    ¬∃ x y z : ℤ, (v : ℤ)=x^2+y^2+z^2 := by
  obtain ⟨a,b,rfl⟩ := h
  push_cast
  induction a with
  | zero =>
    rintro ⟨x,y,z,h⟩
    simp only [pow_zero,one_mul] at h
    have hm := congrArg (· % (8 : ℤ)) h
    change (8*(b:ℤ)+7)%8=(x^2+y^2+z^2)%8 at hm
    have hl : (8*(b:ℤ)+7)%8=7 := by omega
    rw [hl,Int.add_emod (x^2+y^2),Int.add_emod (x^2) (y^2)] at hm
    rcases square_mod_eight x with hx|hx|hx <;>
      rcases square_mod_eight y with hy|hy|hy <;>
      rcases square_mod_eight z with hz|hz|hz <;> norm_num [hx,hy,hz] at hm
  | succ a ih =>
    rintro ⟨x,y,z,h⟩
    rw [pow_succ] at h
    have hm := congrArg (· % (4 : ℤ)) h
    change (4^a*4*(8*(b : ℤ)+7))%4=(x^2+y^2+z^2)%4 at hm
    have hl : (4^a*4*(8*(b : ℤ)+7))%4=0 := by
      rw [mul_right_comm]
      simp
    rw [hl,Int.add_emod (x^2+y^2),Int.add_emod (x^2) (y^2)] at hm
    have hz₀ : x^2%4=0 ∧ y^2%4=0 ∧ z^2%4=0 := by
      rcases square_mod_four x with hx|hx <;>
        rcases square_mod_four y with hy|hy <;>
        rcases square_mod_four z with hz|hz <;> norm_num [hx,hy,hz] at hm
      exact ⟨hx,hy,hz⟩
    obtain ⟨hx,hy,hz⟩ := hz₀
    refine ih ⟨x/2,y/2,z/2,?_⟩
    have ex : x = 2*(x/2) := by
      have hEven := even_of_sq_mod_four_zero x hx
      omega
    have ey : y = 2*(y/2) := by
      have hEven := even_of_sq_mod_four_zero y hy
      omega
    have ez : z = 2*(z/2) := by
      have hEven := even_of_sq_mod_four_zero z hz
      omega
    calc
      _ = (4^a*(8*(b : ℤ)+7)*4)/4 := by rw [Int.mul_ediv_cancel _ (by decide : (4:ℤ) ≠ 0)]
      _ = ((2*(x/2))^2+(2*(y/2))^2+(2*(z/2))^2)/4 := by
        rw [← ex,← ey,← ez]
        congr 1
        linarith
      _ = _ := by
        have hh : (2*(x/2))^2+(2*(y/2))^2+(2*(z/2))^2 =
            ((x/2)^2+(y/2)^2+(z/2)^2)*4 := by ring
        rw [hh]
        simp

end SobolewskiUlasException
