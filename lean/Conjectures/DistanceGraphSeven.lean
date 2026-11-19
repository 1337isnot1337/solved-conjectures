import Conjectures.DistanceGraphFive

namespace DistanceGraph

noncomputable def gapSevenGeneric (k : ℕ) : ℝ :=
  match k%9 with
  | 0 => characterFraction 4 (k+8) 5
  | 1 => 4/9
  | 2 => characterFraction 4 (k+8) 4
  | 3 => characterFraction 4 (2*k+7) 7
  | 4 => characterFraction 4 (k+8) 3
  | 5 => characterFraction 4 (k+8) 7
  | 6 => characterFraction 4 (k+8) 2
  | 7 => characterFraction 4 (k+8) 6
  | _ => characterFraction 4 (k+8) 1

theorem gap_seven_ordinary (k C : ℕ) (n : ℤ) (hk : 0 < k)
    (hdiv : 4*((k : ℤ)-1) = 9*n+C) (hC : C ≤ 7) (hsize : 7*C ≤ k+8) :
    Loneliness.value [1,k,k+7] = characterFraction 4 (k+8) C := by
  have hh := small_character_formula 4 k 7 n C (by decide) hk (by decide) hdiv
    (by exact_mod_cast Nat.zero_le C) (by exact_mod_cast hC) (by
      have hz : (7 : ℤ)*C ≤ k+8 := by exact_mod_cast hsize
      omega)
  simpa [characterFraction, Nat.add_assoc] using hh

theorem gap_seven_exceptional (k : ℕ) (hmod : k%9 = 3) (h3 : k ≠ 3) (h12 : k ≠ 12) :
    Loneliness.value [1,k,k+7] = characterFraction 4 (2*k+7) 7 := by
  have heq : (k : ℤ) = (7+2)*((k/9 : ℕ) : ℤ)+3 := by omega
  have hsize : (7 : ℤ)*7 ≤ 2*(k : ℤ)+7 := by omega
  have hh := exceptional_character_formula 4 k 7 ((k/9 : ℕ) : ℤ) (by decide)
    (by omega) (by decide) heq hsize
  simpa [characterFraction, Nat.add_assoc] using hh

/-- The nine-branch gap-seven character table outside its finite phase
exceptions. The case k=6 is already covered by the generic construction. -/
theorem gap_seven_generic_value (k : ℕ) (hk : 0 < k)
    (hsmall : k ∉ ([2,3,4,5,7,9,11,12,14,16,18,23,25,32] : List ℕ)) :
    Loneliness.value [1,k,k+7] = gapSevenGeneric k := by
  simp only [List.mem_cons, List.not_mem_nil, or_false, not_or] at hsmall
  rcases hsmall with ⟨h2,h3,h4,h5,h7,h9,h11,h12,h14,h16,h18,h23,h25,h32⟩
  have hb : k%9 < 9 := Nat.mod_lt _ (by decide)
  have hcases : k%9=0 ∨ k%9=1 ∨ k%9=2 ∨ k%9=3 ∨ k%9=4 ∨
      k%9=5 ∨ k%9=6 ∨ k%9=7 ∨ k%9=8 := by omega
  rcases hcases with hmod | hmod | hmod | hmod | hmod | hmod | hmod | hmod | hmod
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_ordinary k 5 (4*((k/9 : ℕ) : ℤ)-1) hk (by omega) (by decide) (by omega)
  · rw [gapSevenGeneric, hmod]
    have hh := gap_seven_ordinary k 0 (4*((k/9 : ℕ) : ℤ)) hk (by omega) (by decide) (by omega)
    rw [hh, characterFraction]
    have hp : ((k+8 : ℕ) : ℝ) ≠ 0 := by positivity
    norm_num only [Nat.cast_ofNat, Nat.cast_zero, sub_zero]
    field_simp
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_ordinary k 4 (4*((k/9 : ℕ) : ℤ)) hk (by omega) (by decide) (by omega)
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_exceptional k hmod h3 h12
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_ordinary k 3 (4*((k/9 : ℕ) : ℤ)+1) hk (by omega) (by decide) (by omega)
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_ordinary k 7 (4*((k/9 : ℕ) : ℤ)+1) hk (by omega) (by decide) (by omega)
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_ordinary k 2 (4*((k/9 : ℕ) : ℤ)+2) hk (by omega) (by decide) (by omega)
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_ordinary k 6 (4*((k/9 : ℕ) : ℤ)+2) hk (by omega) (by decide) (by omega)
  · rw [gapSevenGeneric, hmod]
    exact gap_seven_ordinary k 1 (4*((k/9 : ℕ) : ℤ)+3) hk (by omega) (by decide) (by omega)

end DistanceGraph
