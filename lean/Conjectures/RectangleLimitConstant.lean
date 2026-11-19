import Conjectures.RectangleBasel

namespace RectangleEuler

/-- The partition/rectangle leading constant in the notation of the note. -/
theorem twice_sqrt_basel : 2*Real.sqrt basel = Real.pi*Real.sqrt (2/3 : ℝ) := by
  have hs4 : Real.sqrt (4 : ℝ) = 2 := by
    calc
      Real.sqrt (4 : ℝ) = Real.sqrt ((2 : ℝ)^2) := by norm_num
      _ = 2 := Real.sqrt_sq (by norm_num)
  calc
    2*Real.sqrt basel = Real.sqrt 4*Real.sqrt (Real.pi^2/6) := by
      rw [basel_eq_pi_sq_div_six,hs4]
    _ = Real.sqrt (4*(Real.pi^2/6)) := (Real.sqrt_mul (by norm_num) _).symm
    _ = Real.sqrt (Real.pi^2*(2/3 : ℝ)) := by congr 1; ring
    _ = Real.pi*Real.sqrt (2/3 : ℝ) := by
      rw [Real.sqrt_mul (sq_nonneg _),Real.sqrt_sq Real.pi_pos.le]

end RectangleEuler
