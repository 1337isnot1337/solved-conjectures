import Conjectures.LonelinessCriticalBase
import Conjectures.LonelinessExamples
import Conjectures.LonelinessPairBridge

/-! An explicit six-speed realization for every denominator parameter congruent
to five modulo six.  The upper bound reduces the six phase inequalities to
six triangles.  On each triangle an integer linear relation lies strictly
between consecutive integers.  No lonely-runner or exhaustion assumption is
used. -/

namespace Loneliness.SixProgression

noncomputable section

def speeds (n : ℕ) : List ℕ :=
  [6, 6 * n + 5, 6 * n + 11, 6 * n + 17, 6 * n + 23, 12 * n + 28]

def target (n : ℕ) : ℝ := (6 * (n : ℝ) + 16) / (6 * (6 * (n : ℝ) + 17))

def witness (n : ℕ) : ℝ := ((n : ℝ) - 2 / 3 - target n) / 6

private theorem distance_gap {r x : ℝ} (h : r < distance x) (k : ℤ) :
    x < (k : ℝ) - r ∨ (k : ℝ) + r < x := by
  have ha : r < |x - k| := h.trans_le (distance_le_int x k)
  rcases lt_abs.mp ha with ha | ha
  · right; linarith
  · left; linarith

private theorem phase_bounds {r x : ℝ} (h : r < distance x) :
    r < Int.fract x ∧ Int.fract x < 1 - r := by
  rw [distance, abs_sub_round_eq_min, lt_min_iff] at h
  exact ⟨h.1, by linarith [h.2]⟩

private theorem distance_sub_integer (x : ℝ) (k : ℤ) :
    distance (x - k) = distance x := by
  simpa only [sub_add_cancel] using
    (CriticalFamilies.distance_add_int (x - k) k).symm

private theorem distance_fracts_linear (a b : ℕ) (u v : ℝ) :
    distance ((a : ℝ) * Int.fract u + (b : ℝ) * Int.fract v) =
      distance ((a : ℝ) * u + (b : ℝ) * v) := by
  have he : (a : ℝ) * Int.fract u + (b : ℝ) * Int.fract v =
      ((a : ℝ) * u + (b : ℝ) * v) -
        (((a : ℤ) * ⌊u⌋ + (b : ℤ) * ⌊v⌋ : ℤ) : ℝ) := by
    simp only [Int.fract, Int.cast_add, Int.cast_mul, Int.cast_natCast]
    ring
  rw [he, distance_sub_integer]

private theorem six_cells {r x y : ℝ} (hr : 8 / 51 ≤ r)
    (hx : r < x ∧ x < 1 - r) (hy : r < y ∧ y ≤ 1 / 2)
    (hxy : r < distance (x + y)) (h2 : r < distance (2 * x + y))
    (h3 : r < distance (3 * x + y)) (h32 : r < distance (3 * x + 2 * y)) :
    (r < x ∧ x < 1 / 3 - r ∧ r < y ∧ y < 1 / 2 - 2 * r) ∨
    (r < x ∧ x < 1 / 3 - r ∧ 2 * r < y ∧ y < 1 - 4 * r) ∨
    (2 * r < x ∧ x < 1 / 2 - r ∧ r < y ∧ y < 1 - 5 * r) ∨
    (3 * r < x ∧ x < 2 / 3 - r ∧ r < y ∧ y < 1 - 5 * r) ∨
    (3 * r < x ∧ x < 2 / 3 - r ∧ 2 * r < y ∧ y < 1 - 4 * r) ∨
    (1 / 2 + r < x ∧ x < 1 - 2 * r ∧ r < y ∧ y < 1 / 2 - 2 * r) := by
  have hxy' : x + y < 1 - r := by
    rcases distance_gap hxy 1 with h | h
    · simpa using h
    · norm_num at h
      have h32u : 3 * x + 2 * y < 4 - r := by
        rcases distance_gap h32 4 with hl | hu
        · simpa using hl
        · norm_num at hu; linarith [hx.2, hy.2]
      rcases distance_gap h2 2 with ha | ha <;>
        rcases distance_gap h3 3 with hb | hb <;>
        rcases distance_gap h32 3 with hc | hc <;>
        norm_num at ha hb hc <;>
        linarith [hx.1, hx.2, hy.1, hy.2]
  rcases distance_gap h32 1 with ha | ha
  · left
    norm_num at ha
    exact ⟨hx.1, by linarith [hy.1], hy.1, by linarith [hx.1]⟩
  · right
    norm_num at ha
    rcases distance_gap h3 1 with hb | hb
    · left
      norm_num at hb
      exact ⟨hx.1, by linarith, by linarith, by linarith [hx.1]⟩
    · right
      norm_num at hb
      rcases distance_gap h2 1 with hc | hc
      · left
        norm_num at hc
        exact ⟨by linarith, by linarith [hy.1], hy.1, by linarith⟩
      · right
        norm_num at hc
        rcases distance_gap h32 2 with hd | hd
        · left
          norm_num at hd
          exact ⟨by linarith, by linarith [hy.1], hy.1, by linarith⟩
        · right
          norm_num at hd
          rcases distance_gap h3 2 with he | he
          · left
            norm_num at he
            exact ⟨by linarith, by linarith, by linarith, by linarith⟩
          · right
            norm_num at he
            exact ⟨by linarith, by linarith [hy.1], hy.1, by linarith⟩

private theorem six_cells_not_integer (n : ℕ) {r x y : ℝ}
    (hr : (6 * (n : ℝ) + 17) * r = n + 8 / 3)
    (hrlo : 8 / 51 ≤ r) (hrhi : r < 1 / 6)
    (hx : r < x ∧ x < 1 - r) (hy : r < y ∧ y ≤ 1 / 2)
    (hxy : r < distance (x + y)) (h2 : r < distance (2 * x + y))
    (h3 : r < distance (3 * x + y)) (h32 : r < distance (3 * x + 2 * y))
    (z : ℤ) (hz : (6 * (n : ℝ) + 5) * x - 6 * y = z) : False := by
  have hB : 0 < 6 * (n : ℝ) + 5 := by positivity
  rcases six_cells hrlo hx hy hxy h2 h3 h32 with h | h | h | h | h | h
  · rcases h with ⟨hlx, hux, hly, huy⟩
    have hl := mul_lt_mul_of_pos_left hlx hB
    have hu := mul_lt_mul_of_pos_left hux hB
    have hzlo : (n : ℝ) - 1 < z := by linarith only [hl, huy, hr, hz, hrlo, hrhi]
    have hzhi : (z : ℝ) < n := by linarith only [hu, hly, hr, hz, hrlo, hrhi]
    have hzi : (n : ℤ) - 1 < z := by exact_mod_cast hzlo
    have hzj : z < (n : ℤ) := by exact_mod_cast hzhi
    omega
  · rcases h with ⟨hlx, hux, hly, huy⟩
    have hl := mul_lt_mul_of_pos_left hlx hB
    have hu := mul_lt_mul_of_pos_left hux hB
    have hzlo : (n : ℝ) - 2 < z := by linarith only [hl, huy, hr, hz, hrlo, hrhi]
    have hzhi : (z : ℝ) < n - 1 := by linarith only [hu, hly, hr, hz, hrlo, hrhi]
    have hzi : (n : ℤ) - 2 < z := by exact_mod_cast hzlo
    have hzj : z < (n : ℤ) - 1 := by exact_mod_cast hzhi
    omega
  · rcases h with ⟨hlx, hux, hly, huy⟩
    have hl := mul_lt_mul_of_pos_left hlx hB
    have hu := mul_lt_mul_of_pos_left hux hB
    have hzlo : 2 * (n : ℝ) < z := by linarith only [hl, huy, hr, hz, hrlo, hrhi]
    have hzhi : (z : ℝ) < 2 * n + 1 := by linarith only [hu, hly, hr, hz, hrlo, hrhi]
    have hzi : 2 * (n : ℤ) < z := by exact_mod_cast hzlo
    have hzj : z < 2 * (n : ℤ) + 1 := by exact_mod_cast hzhi
    omega
  · rcases h with ⟨hlx, hux, hly, huy⟩
    have hl := mul_lt_mul_of_pos_left hlx hB
    have hu := mul_lt_mul_of_pos_left hux hB
    have hzlo : 3 * (n : ℝ) + 1 < z := by linarith only [hl, huy, hr, hz, hrlo, hrhi]
    have hzhi : (z : ℝ) < 3 * n + 2 := by linarith only [hu, hly, hr, hz, hrlo, hrhi]
    have hzi : 3 * (n : ℤ) + 1 < z := by exact_mod_cast hzlo
    have hzj : z < 3 * (n : ℤ) + 2 := by exact_mod_cast hzhi
    omega
  · rcases h with ⟨hlx, hux, hly, huy⟩
    have hl := mul_lt_mul_of_pos_left hlx hB
    have hu := mul_lt_mul_of_pos_left hux hB
    have hzlo : 3 * (n : ℝ) < z := by linarith only [hl, huy, hr, hz, hrlo, hrhi]
    have hzhi : (z : ℝ) < 3 * n + 1 := by linarith only [hu, hly, hr, hz, hrlo, hrhi]
    have hzi : 3 * (n : ℤ) < z := by exact_mod_cast hzlo
    have hzj : z < 3 * (n : ℤ) + 1 := by exact_mod_cast hzhi
    omega
  · rcases h with ⟨hlx, hux, hly, huy⟩
    have hl := mul_lt_mul_of_pos_left hlx hB
    have hu := mul_lt_mul_of_pos_left hux hB
    have hzlo : 4 * (n : ℝ) + 2 < z := by linarith only [hl, huy, hr, hz, hrlo, hrhi]
    have hzhi : (z : ℝ) < 4 * n + 3 := by linarith only [hu, hly, hr, hz, hrlo, hrhi]
    have hzi : 4 * (n : ℤ) + 2 < z := by exact_mod_cast hzlo
    have hzj : z < 4 * (n : ℤ) + 3 := by exact_mod_cast hzhi
    omega

private theorem phase_half_impossible (n : ℕ) {r t : ℝ}
    (hr : (6 * (n : ℝ) + 17) * r = n + 8 / 3)
    (hrlo : 8 / 51 ≤ r) (hrhi : r < 1 / 6)
    (h : ∀ d ∈ speeds n, r < distance ((d : ℝ) * t))
    (hyhalf : Int.fract ((6 * (n : ℝ) + 5) * t) ≤ 1 / 2) : False := by
  let x := Int.fract (6 * t)
  let y := Int.fract ((6 * (n : ℝ) + 5) * t)
  have hx : r < x ∧ x < 1 - r := by
    simpa [x] using phase_bounds (h 6 (by simp [speeds]))
  have hy : r < y ∧ y ≤ 1 / 2 := by
    have hb := phase_bounds (h (6 * n + 5) (by simp [speeds]))
    exact ⟨by simpa [y] using hb.1, hyhalf⟩
  have hc (a b d : ℕ) (he : d = 6 * a + (6 * n + 5) * b)
      (hd : d ∈ speeds n) : r < distance ((a : ℝ) * x + (b : ℝ) * y) := by
    dsimp [x, y]
    rw [distance_fracts_linear]
    have he' : (a : ℝ) * (6 * t) + (b : ℝ) * ((6 * (n : ℝ) + 5) * t) =
        (d : ℝ) * t := by
      rw [he]
      push_cast
      ring
    rw [he']
    exact h d hd
  have hxy : r < distance (x + y) := by
    simpa using hc 1 1 (6 * n + 11) (by omega) (by simp [speeds])
  have h2 : r < distance (2 * x + y) := by
    simpa using hc 2 1 (6 * n + 17) (by omega) (by simp [speeds])
  have h3 : r < distance (3 * x + y) := by
    simpa using hc 3 1 (6 * n + 23) (by omega) (by simp [speeds])
  have h32 : r < distance (3 * x + 2 * y) := by
    simpa using hc 3 2 (12 * n + 28) (by omega) (by simp [speeds])
  let z : ℤ := 6 * ⌊(6 * (n : ℝ) + 5) * t⌋ - (6 * (n : ℤ) + 5) * ⌊6 * t⌋
  have hz : (6 * (n : ℝ) + 5) * x - 6 * y = z := by
    simp only [x, y, z, Int.fract, Int.cast_sub, Int.cast_mul, Int.cast_add,
      Int.cast_ofNat, Int.cast_natCast]
    ring
  exact six_cells_not_integer n hr hrlo hrhi hx hy hxy h2 h3 h32 z hz

theorem target_bounds (n : ℕ) : 8 / 51 ≤ target n ∧ target n < 1 / 6 := by
  have hn : (0 : ℝ) ≤ n := Nat.cast_nonneg n
  have hd : 0 < 6 * (6 * (n : ℝ) + 17) := by positivity
  constructor
  · apply (le_div_iff₀ hd).mpr
    nlinarith
  · apply (div_lt_iff₀ hd).mpr
    linarith

theorem target_equation (n : ℕ) :
    (6 * (n : ℝ) + 17) * target n = n + 8 / 3 := by
  unfold target
  have hd : (6 * (n : ℝ) + 17) ≠ 0 := by positivity
  field_simp
  ring

theorem family_upper (n : ℕ) (t : ℝ) : clearance (speeds n) t ≤ target n := by
  apply le_of_not_gt
  intro ht
  have h (d : ℕ) (hd : d ∈ speeds n) : target n < distance ((d : ℝ) * t) :=
    ht.trans_le (clearance_le_of_mem hd t)
  obtain ⟨hrlo, hrhi⟩ := target_bounds n
  have hr := target_equation n
  by_cases hy : Int.fract ((6 * (n : ℝ) + 5) * t) ≤ 1 / 2
  · exact phase_half_impossible n hr hrlo hrhi h hy
  · have hnonzero : Int.fract ((6 * (n : ℝ) + 5) * t) ≠ 0 := by
      intro he
      rw [he] at hy
      norm_num at hy
    have hy' : Int.fract ((6 * (n : ℝ) + 5) * (-t)) ≤ 1 / 2 := by
      rw [mul_neg, Int.fract_neg hnonzero]
      linarith
    apply phase_half_impossible n hr hrlo hrhi (t := -t) _ hy'
    intro d hd
    simpa only [mul_neg, CriticalFamilies.distance_neg] using h d hd

theorem family_lower (n : ℕ) : target n ≤ clearance (speeds n) (witness n) := by
  let r := target n
  let t := witness n
  let k : ℤ := (n : ℤ) - 1
  let m : ℤ := (n : ℤ) ^ 2 - 1
  have hr : (6 * (n : ℝ) + 17) * r = n + 8 / 3 := target_equation n
  have hlo : 0 ≤ r := le_trans (by norm_num) (target_bounds n).1
  have hhi : r < 1 / 6 := (target_bounds n).2
  have h6 : 6 * t - (k : ℝ) = 1 / 3 - r := by
    dsimp [t, witness, k, r]
    push_cast
    ring
  have hB : (6 * (n : ℝ) + 5) * t - (m : ℝ) = 2 * r := by
    dsimp [t, witness, m]
    push_cast
    change (6 * (n : ℝ) + 5) * ((n - 2 / 3 - r) / 6) - ((n : ℝ) ^ 2 - 1) = 2 * r
    nlinarith [hr]
  apply le_clearance (by linarith)
  intro d hd
  simp only [speeds, List.mem_cons, List.not_mem_nil, or_false] at hd
  rcases hd with rfl | rfl | rfl | rfl | rfl | rfl
  · apply distance_lower_of_cell (k := k) <;> norm_num <;> linarith
  · apply distance_lower_of_cell (k := m) <;> push_cast <;> linarith
  · apply distance_lower_of_cell (k := m + k) <;> push_cast <;> nlinarith
  · apply distance_lower_of_cell (k := m + 2 * k) <;> push_cast <;> nlinarith
  · apply distance_lower_of_cell (k := m + 3 * k) <;> push_cast <;> nlinarith
  · apply distance_lower_of_cell (k := 2 * m + 3 * k + 1) <;> push_cast <;> nlinarith

theorem family_value (n : ℕ) :
    value (speeds n) = (6 * (n : ℝ) + 16) / (6 * (6 * (n : ℝ) + 17)) := by
  apply le_antisymm
  · exact value_le (fun t _ => family_upper n t)
  · exact (family_lower n).trans (CriticalFamilies.le_value_any _ _)

theorem family_maximum (n : ℕ) :
    clearance (speeds n) (witness n) = target n ∧
      ∀ t : ℝ, clearance (speeds n) t ≤ target n :=
  ⟨le_antisymm (family_upper n _) (family_lower n), family_upper n⟩

theorem speeds_length (n : ℕ) : (speeds n).length = 6 := rfl

theorem speeds_positive (n : ℕ) : ∀ d ∈ speeds n, 0 < d := by
  intro d hd
  simp only [speeds, List.mem_cons, List.not_mem_nil, or_false] at hd
  rcases hd with rfl | rfl | rfl | rfl | rfl | rfl <;> omega

theorem speeds_distinct (n : ℕ) : (speeds n).Nodup := by
  simp [speeds, List.nodup_cons]
  omega

theorem speeds_primitive (n : ℕ) : (speeds n).foldr Nat.gcd 0 = 1 := by
  have h : Nat.gcd 6 (6 * n + 5) = 1 := by
    rw [Nat.add_comm (6 * n), Nat.gcd_add_mul_left_right]
    decide
  change Nat.gcd 6 (Nat.gcd (6 * n + 5) _) = 1
  rw [← Nat.gcd_assoc, h, Nat.gcd_one_left]

theorem realizes_mod_six_five (P : ℕ) (hP : 11 ≤ P) (hmod : P % 6 = 5) :
    ∃ ds : List ℕ, ds.length = 6 ∧ ds.Nodup ∧ (∀ d ∈ ds, 0 < d) ∧
      ds.foldr Nat.gcd 0 = 1 ∧
      value ds = ((P : ℝ) - 1) / (6 * (P : ℝ)) ∧ value ds < 1 / 6 := by
  by_cases he : P = 11
  · subst P
    have hv := PairSum.Examples.six_second_spectrum_value.value_eq
    refine ⟨[1, 5, 6, 11, 16, 17], rfl, by decide, ?_, by decide, ?_, ?_⟩
    · intro d hd
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hd
      omega
    · norm_num at hv ⊢
      exact hv
    · rw [hv]
      norm_num
  · have hlarge : 17 ≤ P := by omega
    have he : P = 6 * ((P - 17) / 6) + 17 := by omega
    let n := (P - 17) / 6
    refine ⟨speeds n, speeds_length n, speeds_distinct n, speeds_positive n,
      speeds_primitive n, ?_, ?_⟩
    · rw [family_value, he]
      dsimp [n]
      push_cast
      congr 1; ring
    · rw [family_value]
      exact (target_bounds n).2

end

end Loneliness.SixProgression
