import Conjectures.DistanceGraphBounds
import Conjectures.Loneliness

/-! Exact real character values for the two generic odd-gap branches. -/
namespace DistanceGraph

theorem distance_eq_min_fract (x : ℝ) :
    Loneliness.distance x = min (Int.fract x) (1-Int.fract x) :=
  abs_sub_round_eq_min x

theorem distance_add_int (x : ℝ) (z : ℤ) :
    Loneliness.distance (x+z) = Loneliness.distance x := by
  rw [distance_eq_min_fract, distance_eq_min_fract, Int.fract_add_intCast]

theorem distance_neg_le (x : ℝ) : Loneliness.distance (-x) ≤ Loneliness.distance x := by
  have hh := Loneliness.distance_le_int (-x) (-round x)
  have he : (-x)-((-round x : ℤ) : ℝ) = -(x-(round x : ℝ)) := by push_cast; ring
  rw [he, abs_neg] at hh
  exact hh

theorem distance_neg (x : ℝ) : Loneliness.distance (-x) = Loneliness.distance x := by
  exact le_antisymm (distance_neg_le x) (by simpa only [neg_neg] using distance_neg_le (-x))

theorem distance_reflect (d : ℕ) (t : ℝ) :
    Loneliness.distance ((d : ℝ)*(1-t)) = Loneliness.distance ((d : ℝ)*t) := by
  have he : (d : ℝ)*(1-t) = -((d : ℝ)*t)+(d : ℤ) := by push_cast; ring
  rw [he, distance_add_int, distance_neg]

theorem clearance_reflect (ds : List ℕ) (t : ℝ) :
    Loneliness.clearance ds (1-t) = Loneliness.clearance ds t := by
  induction ds with
  | nil => rfl
  | cons d ds ih => rw [Loneliness.clearance, Loneliness.clearance, distance_reflect, ih]

theorem value_le_of_half_interval (ds : List ℕ) (r : ℝ)
    (h : ∀ t : ℝ, 0 ≤ t → t ≤ 1/2 → Loneliness.clearance ds t ≤ r) :
    Loneliness.value ds ≤ r := by
  apply Loneliness.value_le
  intro t ht
  by_cases hh : t ≤ 1/2
  · exact h t ht.1 hh
  · rw [← clearance_reflect ds t]
    exact h (1-t) (by linarith [ht.2]) (by linarith)

theorem clearance_le_time {ds : List ℕ} (h1 : 1 ∈ ds) (t : ℝ) (ht : 0 ≤ t) :
    Loneliness.clearance ds t ≤ t := by
  have hc := Loneliness.clearance_le_of_mem h1 t
  simp only [Nat.cast_one, one_mul] at hc
  have hh := hc.trans (Loneliness.distance_le_int t 0)
  simpa only [Nat.cast_one, one_mul, Int.cast_zero, sub_zero, abs_of_nonneg ht] using hh

theorem fractional_bounds_of_clearance {ds : List ℕ} {d : ℕ} (hd : d ∈ ds) (t : ℝ) :
    Loneliness.clearance ds t ≤ Int.fract ((d : ℝ)*t) ∧
      Int.fract ((d : ℝ)*t) ≤ 1-Loneliness.clearance ds t := by
  have hh := Loneliness.clearance_le_of_mem hd t
  rw [distance_eq_min_fract, le_min_iff] at hh
  exact ⟨hh.1, by linarith [hh.2]⟩

theorem distance_lower_from_residue (P p d z r H : ℤ) (hP : 0 < P)
    (he : d*p = P*z+r) (hlo : H ≤ r) (hhi : r ≤ P-H) :
    (H : ℝ)/P ≤ Loneliness.distance ((d : ℝ)*((p : ℝ)/P)) := by
  have hPR : (0 : ℝ) < P := by exact_mod_cast hP
  have heR : (d : ℝ)*p = (P : ℝ)*z+r := by exact_mod_cast he
  have hres : (d : ℝ)*((p : ℝ)/P)-(z : ℝ) = (r : ℝ)/P := by
    apply (eq_div_iff (ne_of_gt hPR)).mpr
    field_simp
    nlinarith
  apply Loneliness.distance_lower_of_cell (k := z)
  · rw [hres]
    apply (div_le_div_iff_of_pos_right hPR).mpr
    exact_mod_cast hlo
  · rw [hres]
    apply (div_le_iff₀ hPR).mpr
    have hhiR : (r : ℝ) ≤ (P : ℝ)-H := by exact_mod_cast hhi
    have hh : (1-(H : ℝ)/P)*(P : ℝ) = (P : ℝ)-H := by field_simp
    rw [hh]
    exact hhiR

/-- The ordinary residue branch of the exact real character formula, valid
for every odd gap under the explicit construction size bound. -/
theorem small_character_value (l k s : ℕ) (n u : ℤ) (hl : 2 ≤ l) (hk : 0 < k)
    (hs : (s : ℤ) = 2*l-1) (hdiv : (l : ℤ)*(k-1) = (s+2)*n+u)
    (hu0 : 0 ≤ u) (hus : u ≤ s) (hsize : (s : ℤ)*u ≤ k+s+1) :
    Loneliness.value [1,k,k+s] = ((n+l : ℤ) : ℝ)/(k+s+1 : ℕ) := by
  have hlZ : (2 : ℤ) ≤ l := by exact_mod_cast hl
  have hkZ : (0 : ℤ) < k := by exact_mod_cast hk
  have hsZ : (0 : ℤ) < s := by omega
  have hP : (0 : ℤ) < k+s+1 := by omega
  have hPR : (0 : ℝ) < (k+s+1 : ℕ) := by positivity
  obtain ⟨hH, htwo, hnum, hkm, hksm⟩ := small_witness_data l k s n u hlZ hkZ hs hdiv hus hsize
  apply le_antisymm
  · apply value_le_of_half_interval
    intro t ht0 hthalf
    have htlo := clearance_le_time (ds := [1,k,k+s]) (by simp) t ht0
    obtain ⟨hklo,hkhi⟩ := fractional_bounds_of_clearance (ds := [1,k,k+s]) (d := k) (by simp) t
    obtain ⟨hkslo,hkshi⟩ := fractional_bounds_of_clearance (ds := [1,k,k+s]) (d := k+s) (by simp) t
    have hh := small_fractional_upper l k s n u hlZ hkZ hs hdiv hus hsize
      (Loneliness.clearance [1,k,k+s] t) t htlo hthalf hklo hkhi
      (by simpa only [Int.cast_add, Int.cast_natCast, Nat.cast_add] using hkslo)
      (by simpa only [Int.cast_add, Int.cast_natCast, Nat.cast_add] using hkshi)
    simpa only [Int.cast_add, Int.cast_natCast, Int.cast_one, Nat.cast_add, Nat.cast_one] using hh
  · let H : ℤ := n+l
    let P : ℤ := k+s+1
    let t : ℝ := (H : ℝ)/P
    have hPZ : 0 < P := by dsimp [P]; omega
    have ht : t ∈ Set.Icc (0 : ℝ) 1 := by
      have hHR : (0 : ℝ) < H := by exact_mod_cast hH
      have hPR' : (0 : ℝ) < P := by exact_mod_cast hPZ
      refine ⟨by dsimp [t]; positivity, ?_⟩
      apply (div_le_one hPR').mpr
      exact_mod_cast (show H ≤ P by dsimp [H,P]; omega)
    have hhalf : (H : ℝ)/P ≤ 1/2 := by
      apply (div_le_iff₀ (show (0 : ℝ) < P by exact_mod_cast hPZ)).mpr
      have hh : (2 : ℝ)*H ≤ P := by exact_mod_cast (show 2*H ≤ P by dsimp [H,P]; omega)
      linarith
    have hlow : (H : ℝ)/P ≤ Loneliness.clearance [1,k,k+s] t := by
      apply Loneliness.le_clearance hhalf
      intro d hd
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hd
      rcases hd with hd | hd | hd <;> subst d
      · have hh := distance_lower_from_residue P H 1 0 H H hP (by ring)
          le_rfl (by dsimp [H,P]; omega)
        simpa only [t, Int.cast_one, Nat.cast_one, one_mul] using hh
      · have hh := distance_lower_from_residue P H k n (H+u) H hP
          (by dsimp [H,P]; simpa only [add_assoc] using hkm)
          (by omega) (by dsimp [H,P]; omega)
        simpa only [t, Int.cast_natCast] using hh
      · have hh := distance_lower_from_residue P H (k+s) (H-1) (P-H) H hP hksm
          (by dsimp [H,P]; omega) le_rfl
        simpa only [t, Int.cast_add, Int.cast_natCast, Nat.cast_add] using hh
    have hh := hlow.trans (Loneliness.le_value ht)
    simpa only [H,P,Int.cast_add,Int.cast_natCast,Int.cast_one,Nat.cast_add,Nat.cast_one] using hh

end DistanceGraph
