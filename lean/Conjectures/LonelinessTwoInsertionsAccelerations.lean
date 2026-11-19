import Conjectures.LonelinessTwoInsertions
import Conjectures.LonelinessTwoInsertionsAccelerationArithmetic
import Conjectures.LonelinessNormalization

/-! The prescribed-interval insertion theorem for every simultaneous
acceleration satisfying the literal Goddyn--Wong gcd criterion. -/

namespace Loneliness.TwoInsertions

def GoddynWongCriterion (p : ℕ) (m : ℕ → ℕ) : Prop :=
  ∀ r : ℕ, 1 ≤ r → r < p → 0 < m r ∧ AccelerationGap r (p-r) (m r)

def acceleratedBase (p : ℕ) (m : ℕ → ℕ) : List ℕ :=
  (List.range' 1 (p-1)).map (fun r => m r*r)

theorem acceleratedBase_length (p : ℕ) (m : ℕ → ℕ) :
    (acceleratedBase p m).length = p-1 := by
  simp [acceleratedBase]

theorem accelerated_speed_good (p r m : ℕ) (hp : 3 ≤ p)
    (hr : 0 < r) (hrp : r < p) (hm : 0 < m)
    (hgap : AccelerationGap r (p-r) m) (t : ℝ) (ht : t ∈ window p) :
    1/(p+2 : ℝ) ≤ distance (((m*r : ℕ) : ℝ)*t) := by
  obtain ⟨hlo, hhi⟩ := acceleration_cell_bounds p r m hr hrp hm hgap
  have hpR : (0 : ℝ) < p := by exact_mod_cast (show 0 < p by omega)
  have hq : (0 : ℝ) < p+2 := by positivity
  have hlowNat : (m-1)*(p+2)+1 ≤ m*r := by omega
  have hhighNat : m*r+1 ≤ m*p := by omega
  have hlowR : ((m : ℝ)-1)*(p+2 : ℝ)+1 ≤ ((m*r : ℕ) : ℝ) := by
    have hh : ((m-1 : ℕ) : ℝ)*(p+2 : ℝ)+1 ≤ ((m*r : ℕ) : ℝ) := by
      exact_mod_cast hlowNat
    simpa only [Nat.cast_sub (show 1 ≤ m by omega), Nat.cast_one] using hh
  have hhighR : ((m*r : ℕ) : ℝ)+1 ≤ (m : ℝ)*(p : ℝ) := by
    exact_mod_cast hhighNat
  have hlowPhase : (m : ℝ)-1+1/(p+2 : ℝ) ≤ ((m*r : ℕ) : ℝ)/(p+2 : ℝ) := by
    apply (le_div_iff₀ hq).mpr
    have heq : ((m : ℝ)-1+1/(p+2 : ℝ))*(p+2 : ℝ) =
        ((m : ℝ)-1)*(p+2 : ℝ)+1 := by
      field_simp [hq.ne']
    rwa [heq]
  have hhighPhase : ((m*r : ℕ) : ℝ)/(p : ℝ) ≤ (m : ℝ)-1/(p : ℝ) := by
    apply (div_le_iff₀ hpR).mpr
    have heq : ((m : ℝ)-1/(p : ℝ))*(p : ℝ) = (m : ℝ)*(p : ℝ)-1 := by
      field_simp [hpR.ne']
    rw [heq]
    linarith
  have hnonneg : (0 : ℝ) ≤ (m*r : ℕ) := Nat.cast_nonneg _
  have hleft : ((m*r : ℕ) : ℝ)/(p+2 : ℝ) ≤ ((m*r : ℕ) : ℝ)*t := by
    simpa only [div_eq_mul_inv, one_mul] using mul_le_mul_of_nonneg_left ht.1 hnonneg
  have hright : ((m*r : ℕ) : ℝ)*t ≤ ((m*r : ℕ) : ℝ)/(p : ℝ) := by
    simpa only [div_eq_mul_inv, one_mul] using mul_le_mul_of_nonneg_left ht.2 hnonneg
  have hrecip : 1/(p+2 : ℝ) ≤ 1/(p : ℝ) :=
    one_div_le_one_div_of_le hpR (by linarith)
  apply distance_lower_of_cell (k := (m : ℤ)-1)
  · norm_num only [Int.cast_sub, Int.cast_natCast, Int.cast_one]
    linarith
  · norm_num only [Int.cast_sub, Int.cast_natCast, Int.cast_one]
    linarith

theorem acceleratedBase_good (p : ℕ) (m : ℕ → ℕ) (hp : 3 ≤ p)
    (h : GoddynWongCriterion p m) :
    ∀ d ∈ acceleratedBase p m, ∀ t ∈ window p,
      1/(p+2 : ℝ) ≤ distance ((d : ℝ)*t) := by
  intro d hd t ht
  obtain ⟨r, hr, rfl⟩ := List.mem_map.mp hd
  obtain ⟨hr1, hrp⟩ := List.mem_range'_1.mp hr
  have hrlt : r < p := by omega
  obtain ⟨hm, hgap⟩ := h r hr1 hrlt
  exact accelerated_speed_good p r (m r) hp (by omega) hrlt hm hgap t ht

theorem goddyn_wong_two_insertions (p b c : ℕ) (m : ℕ → ℕ)
    (hp : 3 ≤ p) (hb : 0 < b) (hc : 0 < c) (h : GoddynWongCriterion p m) :
    ∃ t ∈ Set.Icc (1/(p+2 : ℝ)) (1/(p : ℝ)),
      1/(p+2 : ℝ) ≤ clearance (b::c::acceleratedBase p m) t :=
  insertion_for_interval_base p b c (acceleratedBase p m) hp hb hc
    (acceleratedBase_good p m hp h)

theorem goddyn_wong_insertion_value (p b c : ℕ) (m : ℕ → ℕ)
    (hp : 3 ≤ p) (hb : 0 < b) (hc : 0 < c) (h : GoddynWongCriterion p m) :
    1/(p+2 : ℝ) ≤ value (b::c::acceleratedBase p m) :=
  insertion_value_lower p b c (acceleratedBase p m) hp hb hc
    (acceleratedBase_good p m hp h)

theorem dilated_goddyn_wong_insertion_value (p b c a : ℕ) (m : ℕ → ℕ)
    (hp : 3 ≤ p) (hb : 0 < b) (hc : 0 < c) (ha : 0 < a)
    (h : GoddynWongCriterion p m) :
    1/(p+2 : ℝ) ≤ value ((b::c::acceleratedBase p m).map (fun d => a*d)) := by
  rw [Normalization.value_scale _ a ha]
  exact goddyn_wong_insertion_value p b c m hp hb hc h

end Loneliness.TwoInsertions
