import Conjectures.ThreeDistanceGraphConstructions

namespace ThreeDistanceGraph

theorem gap_seven_residue0 (j : ℕ) (hj : 3 ≤ j) :
    gapValue (9*j+0) 7=intRatio (4*(j:ℤ)+3) (9*(j:ℤ)+8) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+0) (by omega)
      (U:=4*(j:ℤ)+3) (V:=8*(j:ℤ)+2)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+0) 7 (C:=5) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_seven_residue1 (j : ℕ) (hj : 0 ≤ j) :
    gapValue (9*j+1) 7=intRatio (4*(j:ℤ)+4) (9*(j:ℤ)+9) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+1) (by omega)
      (U:=4*(j:ℤ)+4) (V:=8*(j:ℤ)+4)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+1) 7 (C:=0) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_seven_residue2 (j : ℕ) (hj : 2 ≤ j) :
    gapValue (9*j+2) 7=intRatio (4*(j:ℤ)+4) (9*(j:ℤ)+10) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+2) (by omega)
      (U:=4*(j:ℤ)+4) (V:=8*(j:ℤ)+4)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+2) 7 (C:=4) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_seven_residue3 (j : ℕ) (hj : 2 ≤ j) :
    gapValue (9*j+3) 7=intRatio (8*(j:ℤ)+5) (18*(j:ℤ)+13) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+3) (by omega)
      (U:=4*(j:ℤ)+4) (V:=8*(j:ℤ)+5)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_special (9*j+3) 7 (z:=4*(j:ℤ)+1)
    · push_cast
      ring
    · omega
    · omega
    · push_cast
      ring

theorem gap_seven_residue4 (j : ℕ) (hj : 1 ≤ j) :
    gapValue (9*j+4) 7=intRatio (4*(j:ℤ)+5) (9*(j:ℤ)+12) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+4) (by omega)
      (U:=4*(j:ℤ)+5) (V:=8*(j:ℤ)+6)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+4) 7 (C:=3) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_seven_residue5 (j : ℕ) (hj : 4 ≤ j) :
    gapValue (9*j+5) 7=intRatio (4*(j:ℤ)+5) (9*(j:ℤ)+13) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+5) (by omega)
      (U:=4*(j:ℤ)+5) (V:=8*(j:ℤ)+6)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+5) 7 (C:=7) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_seven_residue6 (j : ℕ) (hj : 0 ≤ j) :
    gapValue (9*j+6) 7=intRatio (4*(j:ℤ)+6) (9*(j:ℤ)+14) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+6) (by omega)
      (U:=4*(j:ℤ)+6) (V:=8*(j:ℤ)+8)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+6) 7 (C:=2) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_seven_residue7 (j : ℕ) (hj : 3 ≤ j) :
    gapValue (9*j+7) 7=intRatio (4*(j:ℤ)+6) (9*(j:ℤ)+15) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+7) (by omega)
      (U:=4*(j:ℤ)+6) (V:=8*(j:ℤ)+8)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+7) 7 (C:=6) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_seven_residue8 (j : ℕ) (hj : 0 ≤ j) :
    gapValue (9*j+8) 7=intRatio (4*(j:ℤ)+7) (9*(j:ℤ)+16) := by
  apply le_antisymm
  · apply gap_seven_bound (9*j+8) (by omega)
      (U:=4*(j:ℤ)+7) (V:=8*(j:ℤ)+10)
    · omega
    · omega
    · intro H hh
      push_cast at hh
      omega
    · intro H hh
      push_cast at hh
      rcases le_max_iff.mp hh with hh | hh <;> omega
    · push_cast
      nlinarith
    · push_cast
      nlinarith
  · apply gap_lower_normal (9*j+8) 7 (C:=1) (K:=4)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

end ThreeDistanceGraph
