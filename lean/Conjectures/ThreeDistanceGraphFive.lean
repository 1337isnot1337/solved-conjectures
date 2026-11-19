import Conjectures.ThreeDistanceGraphConstructions

namespace ThreeDistanceGraph

theorem gap_five_residue0 (j : ℕ) (hj : 2 ≤ j) :
    gapValue (7*j+0) 5=intRatio (3*(j:ℤ)+2) (7*(j:ℤ)+6) := by
  apply le_antisymm
  · apply gap_five_bound (7*j+0) (by omega)
      (U:=3*(j:ℤ)+2) (V:=6*(j:ℤ)+1)
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
  · apply gap_lower_normal (7*j+0) 5 (C:=4) (K:=3)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_five_residue1 (j : ℕ) (hj : 0 ≤ j) :
    gapValue (7*j+1) 5=intRatio (3*(j:ℤ)+3) (7*(j:ℤ)+7) := by
  apply le_antisymm
  · apply gap_five_bound (7*j+1) (by omega)
      (U:=3*(j:ℤ)+3) (V:=6*(j:ℤ)+3)
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
  · apply gap_lower_normal (7*j+1) 5 (C:=0) (K:=3)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_five_residue2 (j : ℕ) (hj : 1 ≤ j) :
    gapValue (7*j+2) 5=intRatio (3*(j:ℤ)+3) (7*(j:ℤ)+8) := by
  apply le_antisymm
  · apply gap_five_bound (7*j+2) (by omega)
      (U:=3*(j:ℤ)+3) (V:=6*(j:ℤ)+3)
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
  · apply gap_lower_normal (7*j+2) 5 (C:=3) (K:=3)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_five_residue3 (j : ℕ) (hj : 1 ≤ j) :
    gapValue (7*j+3) 5=intRatio (6*(j:ℤ)+4) (14*(j:ℤ)+11) := by
  apply le_antisymm
  · apply gap_five_bound (7*j+3) (by omega)
      (U:=3*(j:ℤ)+3) (V:=6*(j:ℤ)+4)
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
  · apply gap_lower_special (7*j+3) 5 (z:=3*(j:ℤ)+1)
    · push_cast
      ring
    · omega
    · omega
    · push_cast
      ring

theorem gap_five_residue4 (j : ℕ) (hj : 0 ≤ j) :
    gapValue (7*j+4) 5=intRatio (3*(j:ℤ)+4) (7*(j:ℤ)+10) := by
  apply le_antisymm
  · apply gap_five_bound (7*j+4) (by omega)
      (U:=3*(j:ℤ)+4) (V:=6*(j:ℤ)+5)
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
  · apply gap_lower_normal (7*j+4) 5 (C:=2) (K:=3)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_five_residue5 (j : ℕ) (hj : 2 ≤ j) :
    gapValue (7*j+5) 5=intRatio (3*(j:ℤ)+4) (7*(j:ℤ)+11) := by
  apply le_antisymm
  · apply gap_five_bound (7*j+5) (by omega)
      (U:=3*(j:ℤ)+4) (V:=6*(j:ℤ)+5)
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
  · apply gap_lower_normal (7*j+5) 5 (C:=5) (K:=3)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

theorem gap_five_residue6 (j : ℕ) (hj : 0 ≤ j) :
    gapValue (7*j+6) 5=intRatio (3*(j:ℤ)+5) (7*(j:ℤ)+12) := by
  apply le_antisymm
  · apply gap_five_bound (7*j+6) (by omega)
      (U:=3*(j:ℤ)+5) (V:=6*(j:ℤ)+7)
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
  · apply gap_lower_normal (7*j+6) 5 (C:=1) (K:=3)
    · push_cast
      ring
    · omega
    · norm_num
    · ring
    · omega

end ThreeDistanceGraph
