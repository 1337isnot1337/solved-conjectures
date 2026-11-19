import Conjectures.DistanceGraphCharacter

namespace DistanceGraph

theorem small_character_formula (l k s : ℕ) (n u : ℤ) (hl : 2 ≤ l) (hk : 0 < k)
    (hs : (s : ℤ) = 2*l-1) (hdiv : (l : ℤ)*(k-1) = (s+2)*n+u)
    (hu0 : 0 ≤ u) (hus : u ≤ s) (hsize : (s : ℤ)*u ≤ k+s+1) :
    Loneliness.value [1,k,k+s] =
      ((l : ℝ)*(k+s+1 : ℕ)-(u : ℝ))/((s+2 : ℕ)*(k+s+1 : ℕ)) := by
  rw [small_character_value l k s n u hl hk hs hdiv hu0 hus hsize]
  have hnum := (small_witness_data l k s n u (by exact_mod_cast hl)
    (by exact_mod_cast hk) hs hdiv hus hsize).2.2.1
  have hn : ((s+2 : ℕ) : ℝ)*((n+l : ℤ) : ℝ) =
      (l : ℝ)*(k+s+1 : ℕ)-(u : ℝ) := by exact_mod_cast hnum
  rw [← hn]
  have hq : ((s+2 : ℕ) : ℝ) ≠ 0 := by positivity
  have hp : ((k+s+1 : ℕ) : ℝ) ≠ 0 := by positivity
  field_simp

/-- The exceptional residue branch `k ≡ 3 (mod s+2)`. The size condition
allows the analytic upper bound, while the construction itself works for
all nonnegative values of `z`. -/
theorem exceptional_character_value (l k s : ℕ) (z : ℤ)
    (hl : 2 ≤ l) (hz : 0 ≤ z) (hs : (s : ℤ) = 2*l-1)
    (hkEq : (k : ℤ) = ((s : ℤ)+2)*z+3)
    (hsize : (s : ℤ)*s ≤ 2*(k : ℤ)+s) :
    Loneliness.value [1,k,k+s] = ((2*(l : ℤ)*z+l+1 : ℤ) : ℝ)/(2*k+s : ℕ) := by
  have hlZ : (2 : ℤ) ≤ l := by exact_mod_cast hl
  have hsZ : (0 : ℤ) < s := by omega
  have hkZ : (0 : ℤ) < k := by
    have hh := mul_nonneg (show 0 ≤ (s : ℤ)+2 by omega) hz
    omega
  have hdiv : (l : ℤ)*(k-1) = ((s : ℤ)+2)*((l : ℤ)*z)+((s : ℤ)+1) := by
    linear_combination (l : ℤ)*hkEq-hs
  have hHnum : (k : ℤ)*l-s*((l : ℤ)*z+1) = 2*(l : ℤ)*z+l+1 := by
    linear_combination (l : ℤ)*hkEq-hs
  have hdata := exceptional_witness_data l s z hlZ hz hs
  dsimp only at hdata
  rw [← hkEq] at hdata
  obtain ⟨hH, htwo, hnum, hkm, hksm⟩ := hdata
  apply le_antisymm
  · apply value_le_of_half_interval
    intro t ht0 hthalf
    have htlo := clearance_le_time (ds := [1,k,k+s]) (by simp) t ht0
    obtain ⟨hklo,hkhi⟩ := fractional_bounds_of_clearance (ds := [1,k,k+s]) (d := k) (by simp) t
    obtain ⟨hkslo,hkshi⟩ := fractional_bounds_of_clearance (ds := [1,k,k+s]) (d := k+s) (by simp) t
    have hh := large_fractional_upper l k s ((l : ℤ)*z) hlZ hkZ hs hdiv hsize
      (Loneliness.clearance [1,k,k+s] t) t htlo hthalf hklo hkhi
      (by simpa only [Int.cast_add, Int.cast_natCast, Nat.cast_add] using hkslo)
      (by simpa only [Int.cast_add, Int.cast_natCast, Nat.cast_add] using hkshi)
    rw [hHnum] at hh
    simpa only [Int.cast_add, Int.cast_natCast, Int.cast_mul, Int.cast_ofNat,
      Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat] using hh
  · let H : ℤ := 2*(l : ℤ)*z+l+1
    let P : ℤ := 2*(k : ℤ)+s
    let t : ℝ := ((H : ℝ)+1)/P
    have hPZ : 0 < P := by dsimp [P]; omega
    have hPR : (0 : ℝ) < P := by exact_mod_cast hPZ
    have ht : t ∈ Set.Icc (0 : ℝ) 1 := by
      have hHR : (0 : ℝ) < H := by exact_mod_cast hH
      refine ⟨by dsimp [t]; positivity, ?_⟩
      apply (div_le_one hPR).mpr
      exact_mod_cast (show H+1 ≤ P by dsimp [H,P]; omega)
    have hhalf : (H : ℝ)/P ≤ 1/2 := by
      apply (div_le_iff₀ hPR).mpr
      have hh : (2 : ℝ)*H ≤ P := by exact_mod_cast (show 2*H ≤ P by dsimp [H,P]; omega)
      linarith
    have hlow : (H : ℝ)/P ≤ Loneliness.clearance [1,k,k+s] t := by
      apply Loneliness.le_clearance hhalf
      intro d hd
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hd
      rcases hd with hd | hd | hd <;> subst d
      · have hh := distance_lower_from_residue P (H+1) 1 0 (H+1) H hPZ (by ring)
          (by omega) (by dsimp [H,P]; omega)
        simpa only [t, Int.cast_add, Int.cast_one, Nat.cast_one, one_mul] using hh
      · have hh := distance_lower_from_residue P (H+1) k ((l : ℤ)*z+1) H H hPZ hkm
          le_rfl (by dsimp [H,P]; omega)
        simpa only [t, Int.cast_add, Int.cast_one, Int.cast_natCast] using hh
      · have hh := distance_lower_from_residue P (H+1) ((k : ℤ)+s) (H-(l : ℤ)*z-1) (P-H) H
          hPZ hksm (by dsimp [H,P]; omega) le_rfl
        simpa only [t, Int.cast_add, Int.cast_one, Int.cast_natCast, Nat.cast_add] using hh
    have hh := hlow.trans (Loneliness.le_value ht)
    simpa only [H,P,Int.cast_add,Int.cast_natCast,Int.cast_one,Int.cast_mul,Int.cast_ofNat,
      Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] using hh

theorem exceptional_character_formula (l k s : ℕ) (z : ℤ)
    (hl : 2 ≤ l) (hz : 0 ≤ z) (hs : (s : ℤ) = 2*l-1)
    (hkEq : (k : ℤ) = ((s : ℤ)+2)*z+3)
    (hsize : (s : ℤ)*s ≤ 2*(k : ℤ)+s) :
    Loneliness.value [1,k,k+s] =
      ((l : ℝ)*(2*k+s : ℕ)-s)/((s+2 : ℕ)*(2*k+s : ℕ)) := by
  rw [exceptional_character_value l k s z hl hz hs hkEq hsize]
  have hdata := exceptional_witness_data l s z (by exact_mod_cast hl) hz hs
  dsimp only at hdata
  rw [← hkEq] at hdata
  have hn : ((s+2 : ℕ) : ℝ)*((2*(l : ℤ)*z+l+1 : ℤ) : ℝ) =
      (l : ℝ)*(2*k+s : ℕ)-s := by exact_mod_cast hdata.2.2.1
  rw [← hn]
  have hq : ((s+2 : ℕ) : ℝ) ≠ 0 := by positivity
  field_simp

end DistanceGraph
