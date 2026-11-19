import Conjectures.ThreeDistanceGraphTheorem

namespace ThreeDistanceGraph

noncomputable def conjecture39Prediction (k : ℕ) : ℝ :=
  (4*(k:ℝ)-2)/(9*((k:ℝ)+1))

theorem gap_seven_residue_five (k : ℕ) (hk : 41 ≤ k) (hmod : k%9=5) :
    gapDensity k 7=(4*(k:ℝ)+25)/(9*((k:ℝ)+8)) := by
  rw [gap_density_eq_value k 7 (by omega),gap_seven_stable_value k (by omega)
    (by simp only [List.mem_cons,List.not_mem_nil,or_false,not_or]; omega)]
  simp only [sevenStableValue,hmod]
  ring

/-- Exact discrepancy in the published residue-five branch. -/
theorem conjecture39_error (k : ℕ) (hk : 41 ≤ k) (hmod : k%9=5) :
    conjecture39Prediction k-gapDensity k 7 =
      ((k:ℝ)-41)/(9*((k:ℝ)+1)*((k:ℝ)+8)) := by
  rw [gap_seven_residue_five k hk hmod]
  unfold conjecture39Prediction
  have h1 : (k:ℝ)+1 ≠ 0 := ne_of_gt (by positivity)
  have h8 : (k:ℝ)+8 ≠ 0 := ne_of_gt (by positivity)
  field_simp
  ring

theorem conjecture39_agrees_at_41 : conjecture39Prediction 41=gapDensity 41 7 := by
  have h := conjecture39_error 41 (by omega) (by norm_num)
  norm_num at h
  linarith

/-- Every parameter 50+9n is a strict counterexample, not merely a finite
collection of checked instances. -/
theorem conjecture39_counterexample (n : ℕ) :
    gapDensity (50+9*n) 7 < conjecture39Prediction (50+9*n) := by
  have he := conjecture39_error (50+9*n) (by omega) (by omega)
  have hn : (0:ℝ)<((50+9*n:ℕ):ℝ)-41 := by
    have hn0 : (0:ℝ) ≤ n := by positivity
    push_cast
    linarith
  have hd : (0:ℝ)<9*(((50+9*n:ℕ):ℝ)+1)*(((50+9*n:ℕ):ℝ)+8) := by positivity
  have hp := div_pos hn hd
  rw [←he] at hp
  exact sub_pos.mp hp

theorem conjecture39_infinitely_many :
    Set.Infinite {k : ℕ | gapDensity k 7 < conjecture39Prediction k} := by
  have hi : Function.Injective (fun n : ℕ => 50+9*n) := by
    intro a b hab
    dsimp only at hab
    omega
  have hinf := Set.infinite_range_of_injective hi
  apply hinf.mono
  rintro k ⟨n,rfl⟩
  exact conjecture39_counterexample n

end ThreeDistanceGraph
