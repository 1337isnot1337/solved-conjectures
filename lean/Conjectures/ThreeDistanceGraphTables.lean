import Conjectures.ThreeDistanceGraphFive
import Conjectures.ThreeDistanceGraphSeven
import Conjectures.ThreeDistanceGraphSmall
import Mathlib.Tactic.IntervalCases

namespace ThreeDistanceGraph

noncomputable def fiveStableValue (k : ℕ) : ℝ :=
  match k%7 with
  | 0 => (3*((k:ℝ)+6)-4)/(7*((k:ℝ)+6))
  | 1 => 3/7
  | 2 => (3*((k:ℝ)+6)-3)/(7*((k:ℝ)+6))
  | 3 => (3*(2*(k:ℝ)+5)-5)/(7*(2*(k:ℝ)+5))
  | 4 => (3*((k:ℝ)+6)-2)/(7*((k:ℝ)+6))
  | 5 => (3*((k:ℝ)+6)-5)/(7*((k:ℝ)+6))
  | _ => (3*((k:ℝ)+6)-1)/(7*((k:ℝ)+6))

noncomputable def sevenStableValue (k : ℕ) : ℝ :=
  match k%9 with
  | 0 => (4*((k:ℝ)+8)-5)/(9*((k:ℝ)+8))
  | 1 => 4/9
  | 2 => (4*((k:ℝ)+8)-4)/(9*((k:ℝ)+8))
  | 3 => (4*(2*(k:ℝ)+7)-7)/(9*(2*(k:ℝ)+7))
  | 4 => (4*((k:ℝ)+8)-3)/(9*((k:ℝ)+8))
  | 5 => (4*((k:ℝ)+8)-7)/(9*((k:ℝ)+8))
  | 6 => (4*((k:ℝ)+8)-2)/(9*((k:ℝ)+8))
  | 7 => (4*((k:ℝ)+8)-6)/(9*((k:ℝ)+8))
  | _ => (4*((k:ℝ)+8)-1)/(9*((k:ℝ)+8))

theorem gap_five_stable_value (k : ℕ) (hk : 6 ≤ k) (h7 : k ≠ 7) (h12 : k ≠ 12) :
    gapValue k 5=fiveStableValue k := by
  have hmod : k%7 < 7 := Nat.mod_lt k (by norm_num)
  have hdecomp : k=7*(k/7)+k%7 := by omega
  interval_cases hres : k%7
  · have he : k=7*(k/7)+0 := by omega
    have hh := gap_five_residue0 (k/7) (by omega)
    have hc : (k:ℝ)=7*((k/7:ℕ):ℝ)+0 := by exact_mod_cast he
    calc
      gapValue k 5=intRatio (3*((k/7:ℕ):ℤ)+2) (7*((k/7:ℕ):ℤ)+6) := by simpa only [←he] using hh
      _=fiveStableValue k := by
        simp only [fiveStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=7*(k/7)+1 := by omega
    have hh := gap_five_residue1 (k/7) (by omega)
    calc
      gapValue k 5=intRatio (3*((k/7:ℕ):ℤ)+3) (7*((k/7:ℕ):ℤ)+7) := by simpa only [←he] using hh
      _=fiveStableValue k := by
        simp only [fiveStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        field_simp
  · have he : k=7*(k/7)+2 := by omega
    have hh := gap_five_residue2 (k/7) (by omega)
    have hc : (k:ℝ)=7*((k/7:ℕ):ℝ)+2 := by exact_mod_cast he
    calc
      gapValue k 5=intRatio (3*((k/7:ℕ):ℤ)+3) (7*((k/7:ℕ):ℤ)+8) := by simpa only [←he] using hh
      _=fiveStableValue k := by
        simp only [fiveStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=7*(k/7)+3 := by omega
    have hh := gap_five_residue3 (k/7) (by omega)
    have hc : (k:ℝ)=7*((k/7:ℕ):ℝ)+3 := by exact_mod_cast he
    calc
      gapValue k 5=intRatio (6*((k/7:ℕ):ℤ)+4) (14*((k/7:ℕ):ℤ)+11) := by simpa only [←he] using hh
      _=fiveStableValue k := by
        simp only [fiveStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=7*(k/7)+4 := by omega
    have hh := gap_five_residue4 (k/7) (by omega)
    have hc : (k:ℝ)=7*((k/7:ℕ):ℝ)+4 := by exact_mod_cast he
    calc
      gapValue k 5=intRatio (3*((k/7:ℕ):ℤ)+4) (7*((k/7:ℕ):ℤ)+10) := by simpa only [←he] using hh
      _=fiveStableValue k := by
        simp only [fiveStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=7*(k/7)+5 := by omega
    have hh := gap_five_residue5 (k/7) (by omega)
    have hc : (k:ℝ)=7*((k/7:ℕ):ℝ)+5 := by exact_mod_cast he
    calc
      gapValue k 5=intRatio (3*((k/7:ℕ):ℤ)+4) (7*((k/7:ℕ):ℤ)+11) := by simpa only [←he] using hh
      _=fiveStableValue k := by
        simp only [fiveStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=7*(k/7)+6 := by omega
    have hh := gap_five_residue6 (k/7) (by omega)
    have hc : (k:ℝ)=7*((k/7:ℕ):ℝ)+6 := by exact_mod_cast he
    calc
      gapValue k 5=intRatio (3*((k/7:ℕ):ℤ)+5) (7*((k/7:ℕ):ℤ)+12) := by simpa only [←he] using hh
      _=fiveStableValue k := by
        simp only [fiveStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring

theorem gap_seven_stable_value (k : ℕ) (hk : 8 ≤ k)
    (hex : k ∉ [9,11,14,16,18,23,25,32]) :
    gapValue k 7=sevenStableValue k := by
  by_cases h12 : k=12
  · subst k
    change Loneliness.value [1,12,19]=_
    rw [gap7_k12_value]
    norm_num [sevenStableValue]
  simp only [List.mem_cons,List.not_mem_nil,or_false,not_or] at hex
  have hmod : k%9 < 9 := Nat.mod_lt k (by norm_num)
  have hdecomp : k=9*(k/9)+k%9 := by omega
  interval_cases hres : k%9
  · have he : k=9*(k/9)+0 := by omega
    have hh := gap_seven_residue0 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+0 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+3) (9*((k/9:ℕ):ℤ)+8) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=9*(k/9)+1 := by omega
    have hh := gap_seven_residue1 (k/9) (by omega)
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+4) (9*((k/9:ℕ):ℤ)+9) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        field_simp
  · have he : k=9*(k/9)+2 := by omega
    have hh := gap_seven_residue2 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+2 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+4) (9*((k/9:ℕ):ℤ)+10) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=9*(k/9)+3 := by omega
    have hh := gap_seven_residue3 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+3 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (8*((k/9:ℕ):ℤ)+5) (18*((k/9:ℕ):ℤ)+13) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=9*(k/9)+4 := by omega
    have hh := gap_seven_residue4 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+4 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+5) (9*((k/9:ℕ):ℤ)+12) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=9*(k/9)+5 := by omega
    have hh := gap_seven_residue5 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+5 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+5) (9*((k/9:ℕ):ℤ)+13) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=9*(k/9)+6 := by omega
    have hh := gap_seven_residue6 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+6 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+6) (9*((k/9:ℕ):ℤ)+14) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=9*(k/9)+7 := by omega
    have hh := gap_seven_residue7 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+7 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+6) (9*((k/9:ℕ):ℤ)+15) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring
  · have he : k=9*(k/9)+8 := by omega
    have hh := gap_seven_residue8 (k/9) (by omega)
    have hc : (k:ℝ)=9*((k/9:ℕ):ℝ)+8 := by exact_mod_cast he
    calc
      gapValue k 7=intRatio (4*((k/9:ℕ):ℤ)+7) (9*((k/9:ℕ):ℤ)+16) := by simpa only [←he] using hh
      _=sevenStableValue k := by
        simp only [sevenStableValue,hres]
        unfold intRatio
        simp only [Int.cast_add,Int.cast_mul,Int.cast_ofNat,Int.cast_natCast]
        rw [hc]
        field_simp
        ring

end ThreeDistanceGraph
