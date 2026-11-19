import Mathlib.GroupTheory.OrderOfElement
import Lean.Elab.Tactic.Omega

/-! Finite class-order arithmetic for the alternative norm obstruction. -/

namespace HadamardAutomorphism

theorem class_order_five_excludes_norm_cube
    {G : Type*} [Group G] (g : G) (horder : orderOf g = 5)
    (a b : ℕ) (hab : a + b = 3) :
    g ^ (239 * ((a : ℤ) - (b : ℤ))) ≠ 1 := by
  intro h
  have hd := orderOf_dvd_iff_zpow_eq_one.mpr h
  rw [horder] at hd
  rcases hd with ⟨k, hk⟩
  omega

theorem class_order_five_excludes_equal_norm_powers
    {G : Type*} [Group G] (g : G) (horder : orderOf g = 5)
    (a b : ℕ) (hab : a + b = 3) :
    g ^ (239 * a) ≠ g ^ (239 * b) := by
  intro h
  have hm := pow_inj_mod.mp h
  rw [horder] at hm
  omega

end HadamardAutomorphism
