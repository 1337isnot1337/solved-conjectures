import Conjectures.DistanceGraphExceptional

namespace DistanceGraph

noncomputable def characterFraction (l P C : ℕ) : ℝ :=
  ((l : ℝ)*P-C)/((2*l+1 : ℕ)*P)

noncomputable def gapFiveGeneric (k : ℕ) : ℝ :=
  match k%7 with
  | 0 => characterFraction 3 (k+6) 4
  | 1 => 3/7
  | 2 => characterFraction 3 (k+6) 3
  | 3 => characterFraction 3 (2*k+5) 5
  | 4 => characterFraction 3 (k+6) 2
  | 5 => characterFraction 3 (k+6) 5
  | _ => characterFraction 3 (k+6) 1

theorem gap_five_ordinary (k C : ℕ) (n : ℤ) (hk : 0 < k)
    (hdiv : 3*((k : ℤ)-1) = 7*n+C) (hC : C ≤ 5) (hsize : 5*C ≤ k+6) :
    Loneliness.value [1,k,k+5] = characterFraction 3 (k+6) C := by
  have hh := small_character_formula 3 k 5 n C (by decide) hk (by decide) hdiv
    (by exact_mod_cast Nat.zero_le C) (by exact_mod_cast hC) (by
      have hz : (5 : ℤ)*C ≤ k+6 := by exact_mod_cast hsize
      omega)
  simpa [characterFraction, Nat.add_assoc] using hh

theorem gap_five_exceptional (k : ℕ) (hmod : k%7 = 3) (hne : k ≠ 3) :
    Loneliness.value [1,k,k+5] = characterFraction 3 (2*k+5) 5 := by
  have heq : (k : ℤ) = (5+2)*((k/7 : ℕ) : ℤ)+3 := by omega
  have hsize : (5 : ℤ)*5 ≤ 2*(k : ℤ)+5 := by omega
  have hh := exceptional_character_formula 3 k 5 ((k/7 : ℕ) : ℤ) (by decide)
    (by omega) (by decide) heq hsize
  simpa [characterFraction, Nat.add_assoc] using hh

/-- The gap-five table, with the five parameters requiring a separate small
certificate removed. The value k=4 already satisfies its generic branch. -/
theorem gap_five_generic_value (k : ℕ) (hk : 0 < k)
    (h2 : k ≠ 2) (h3 : k ≠ 3) (h5 : k ≠ 5) (h7 : k ≠ 7) (h12 : k ≠ 12) :
    Loneliness.value [1,k,k+5] = gapFiveGeneric k := by
  have hb : k%7 < 7 := Nat.mod_lt _ (by decide)
  have hcases : k%7=0 ∨ k%7=1 ∨ k%7=2 ∨ k%7=3 ∨ k%7=4 ∨ k%7=5 ∨ k%7=6 := by omega
  rcases hcases with hmod | hmod | hmod | hmod | hmod | hmod | hmod
  · rw [gapFiveGeneric, hmod]
    exact gap_five_ordinary k 4 (3*((k/7 : ℕ) : ℤ)-1) hk (by omega) (by decide) (by omega)
  · rw [gapFiveGeneric, hmod]
    have hh := gap_five_ordinary k 0 (3*((k/7 : ℕ) : ℤ)) hk (by omega) (by decide) (by omega)
    rw [hh, characterFraction]
    have hp : ((k+6 : ℕ) : ℝ) ≠ 0 := by positivity
    norm_num only [Nat.cast_ofNat, Nat.cast_zero, sub_zero]
    field_simp
  · rw [gapFiveGeneric, hmod]
    exact gap_five_ordinary k 3 (3*((k/7 : ℕ) : ℤ)) hk (by omega) (by decide) (by omega)
  · rw [gapFiveGeneric, hmod]
    exact gap_five_exceptional k hmod h3
  · rw [gapFiveGeneric, hmod]
    exact gap_five_ordinary k 2 (3*((k/7 : ℕ) : ℤ)+1) hk (by omega) (by decide) (by omega)
  · rw [gapFiveGeneric, hmod]
    exact gap_five_ordinary k 5 (3*((k/7 : ℕ) : ℤ)+1) hk (by omega) (by decide) (by omega)
  · rw [gapFiveGeneric, hmod]
    exact gap_five_ordinary k 1 (3*((k/7 : ℕ) : ℤ)+2) hk (by omega) (by decide) (by omega)

end DistanceGraph
