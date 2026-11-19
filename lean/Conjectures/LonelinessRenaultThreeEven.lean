import Conjectures.LonelinessRenaultAffine
import Conjectures.LonelinessRenaultPhaseCells
import Conjectures.LonelinessRenaultGcdOrbit
import Conjectures.LonelinessRenaultThirdObstructions
import Conjectures.LonelinessRenaultSmallPhases
import Mathlib.Tactic.FinCases

/-! The normalized three-even case of Renault's five-speed proof. -/

namespace Loneliness.Renault

noncomputable section

/-- Doubling cannot leave both distances strictly above one third. -/
theorem no_double_middle_distance (x : ℝ)
    (hx : (1 / 3 : ℝ) < distance x)
    (hdouble : (1 / 3 : ℝ) < distance (2 * x)) : False := by
  have hhalf := distance_le_half x
  have hbound := distance_le_int (2 * distance x) 1
  have hsign : 2 * distance x - 1 ≤ 0 := by linarith
  rw [Int.cast_one, abs_of_nonpos hsign] at hbound
  have he : distance (2 * distance x) = distance (2 * x) := by
    simpa only [Nat.cast_ofNat] using distance_nat_mul_distance 2 x
  rw [he] at hbound
  linarith

private theorem window_dilations_safe (x : ℝ)
    (hx : ((1 / 12 : ℝ) ≤ Int.fract x ∧ Int.fract x ≤ 1 / 6) ∨
      Int.fract x = 1 / 5) :
    (1 / 6 : ℝ) ≤ distance (2 * x) ∧ (1 / 6 : ℝ) ≤ distance (4 * x) := by
  have htwo : 2 * x - ((2 * ⌊x⌋ : ℤ) : ℝ) = 2 * Int.fract x := by
    simp only [Int.fract, Int.cast_mul, Int.cast_ofNat]
    ring
  have hfour : 4 * x - ((4 * ⌊x⌋ : ℤ) : ℝ) = 4 * Int.fract x := by
    simp only [Int.fract, Int.cast_mul, Int.cast_ofNat]
    ring
  constructor
  · apply distance_lower_of_cell (k := 2 * ⌊x⌋)
    · rw [htwo]
      rcases hx with hx | hx <;> linarith
    · rw [htwo]
      rcases hx with hx | hx <;> linarith
  · apply distance_lower_of_cell (k := 4 * ⌊x⌋)
    · rw [hfour]
      rcases hx with hx | hx <;> linarith
    · rw [hfour]
      rcases hx with hx | hx <;> linarith

/-- A persistent middle-third condition on a rational phase fiber forces divisibility. -/
theorem odd_divides_of_middle_condition (a b c : ℕ) (hb : 0 < b)
    (hcop : Nat.Coprime b 6)
    (hmiddle : ∀ t : ℝ, Int.fract ((b : ℝ) * t) = 0 →
      (1 / 6 : ℝ) ≤ distance ((a : ℝ) * t) →
        (1 / 3 : ℝ) < distance ((c : ℝ) * t)) : b ∣ a := by
  by_contra hnot
  let q := b / Nat.gcd a b
  have hqpos : 0 < q := Nat.div_gcd_pos_of_pos_right a hb
  have hfactor : Nat.gcd a b * q = b := Nat.mul_div_cancel' (Nat.gcd_dvd_right a b)
  have hqdiv : q ∣ b := ⟨Nat.gcd a b, by rw [mul_comm]; exact hfactor.symm⟩
  have hqcop : Nat.Coprime q 6 := Nat.Coprime.of_dvd_left hqdiv hcop
  have hq1 : q ≠ 1 := by
    intro h
    rw [h, mul_one] at hfactor
    apply hnot
    rw [← hfactor]
    exact Nat.gcd_dvd_left a b
  have hq2 : q ≠ 2 := by intro h; rw [h] at hqcop; norm_num at hqcop
  have hq3 : q ≠ 3 := by intro h; rw [h] at hqcop; norm_num at hqcop
  have hq4 : q ≠ 4 := by intro h; rw [h] at hqcop; norm_num at hqcop
  have hq6 : q ≠ 6 := by intro h; rw [h] at hqcop; norm_num at hqcop
  have hqcase : q = 5 ∨ 7 ≤ q := by omega
  have hqR : (0 : ℝ) < q := by exact_mod_cast hqpos
  have hwindow : ∃ j : ℕ, j < q ∧
      (((1 / 12 : ℝ) ≤ (j : ℝ) / q ∧ (j : ℝ) / q ≤ 1 / 6) ∨
        (j : ℝ) / q = 1 / 5) := by
    rcases hqcase with hq5 | hq7
    · refine ⟨1, by omega, Or.inr ?_⟩
      rw [hq5]
      norm_num
    · let j := q / 6
      have hlow : q ≤ 12 * j := by dsimp [j]; omega
      have hhigh : 6 * j ≤ q := by dsimp [j]; omega
      have hj : j < q := by dsimp [j]; omega
      have hlowR : (q : ℝ) ≤ 12 * (j : ℝ) := by exact_mod_cast hlow
      have hhighR : 6 * (j : ℝ) ≤ q := by exact_mod_cast hhigh
      refine ⟨j, hj, Or.inl ⟨?_, ?_⟩⟩
      · apply (le_div_iff₀ hqR).mpr
        linarith
      · apply (div_le_iff₀ hqR).mpr
        linarith
  obtain ⟨j, hj, hwindow⟩ := hwindow
  obtain ⟨t, hzero, hphase⟩ := gcd_orbit_point a b hb j hj
  have hsafe := window_dilations_safe ((a : ℝ) * t) (by rw [hphase]; exact hwindow)
  have hzero_mul (k : ℕ) : Int.fract ((b : ℝ) * ((k : ℝ) * t)) = 0 := by
    rw [show (b : ℝ) * ((k : ℝ) * t) = (k : ℝ) * ((b : ℝ) * t) by ring,
      ← fract_nat_mul_fract, hzero]
    simp
  have hsafe2 : (1 / 6 : ℝ) ≤ distance ((a : ℝ) * (2 * t)) := by
    rw [show (a : ℝ) * (2 * t) = 2 * ((a : ℝ) * t) by ring]
    exact hsafe.1
  have hsafe4 : (1 / 6 : ℝ) ≤ distance ((a : ℝ) * (4 * t)) := by
    rw [show (a : ℝ) * (4 * t) = 4 * ((a : ℝ) * t) by ring]
    exact hsafe.2
  have hmid2 := hmiddle (2 * t) (by simpa using hzero_mul 2) hsafe2
  have hmid4 := hmiddle (4 * t) (by simpa using hzero_mul 4) hsafe4
  rw [show (c : ℝ) * (4 * t) = 2 * ((c : ℝ) * (2 * t)) by ring] at hmid4
  exact no_double_middle_distance ((c : ℝ) * (2 * t)) hmid2 hmid4

private theorem three_even_distance_eq_of_fract_eq {x y : ℝ}
    (h : Int.fract x = Int.fract y) : distance x = distance y := by
  simp only [distance_eq_min_fract, h]

private theorem safe_signed_sixth (e : ℤ) (he : e = 1 ∨ e = -1)
    (b : ℕ) (hb : 1 ≤ b) (hb5 : b ≤ 5) :
    (1 / 6 : ℝ) ≤ distance ((e : ℝ) * (b : ℝ) / 6) := by
  have hbR : (1 : ℝ) ≤ b := by exact_mod_cast hb
  have hb5R : (b : ℝ) ≤ 5 := by exact_mod_cast hb5
  have h : (1 / 6 : ℝ) ≤ distance ((b : ℝ) / 6) := by
    apply distance_lower_of_cell (k := 0) <;>
      norm_num only [Int.cast_zero, sub_zero] <;> linarith
  rcases he with rfl | rfl
  · simpa using h
  · simpa only [Int.cast_neg, Int.cast_one, neg_one_mul, neg_div,
      CriticalFamilies.distance_neg] using h

private def thirdTripleIndex (i : Fin 3) : Fin 5 :=
  if i = 0 then 1 else if i = 1 then 2 else 4

private theorem triple_strict_at_odd_zero
    (v : Fin 5 → ℕ) (e q : Fin 5 → ℤ)
    (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (he1 : e 1 = 2 ∨ e 1 = -2) (he2 : e 2 = 2 ∨ e 2 = -2)
    (he3 : e 3 = 1 ∨ e 3 = -1) (he4 : e 4 = 1 ∨ e 4 = -1)
    (hno : ∀ t : ℝ, ¬ AllSafe v t) (t : ℝ)
    (hzero : Int.fract ((v 3 : ℝ) * t) = 0)
    (hsafe0 : (1 / 6 : ℝ) ≤ distance ((v 0 : ℝ) * t)) :
    ∀ k : Fin 3, (1 / 6 : ℝ) < distance ((v (thirdTripleIndex k) : ℝ) * t) := by
  intro k
  by_contra! hk
  obtain ⟨b, hb, hb5, hgood⟩ := three_even_shift_phase
    (fun i => (v (thirdTripleIndex i) : ℝ) * t)
    (fun i => e (thirdTripleIndex i))
    (by simpa [thirdTripleIndex] using he1)
    (by simpa [thirdTripleIndex] using he2)
    (by simpa [thirdTripleIndex] using he4) ⟨k, hk⟩
  let s := t + (b : ℝ) / 6
  have hshift (i : Fin 5) : distance ((v i : ℝ) * s) =
      distance ((v i : ℝ) * t + (e i : ℝ) * (b : ℝ) / 6) := by
    simpa only [s, Int.cast_one, one_mul, Int.cast_natCast] using
      distance_time_affine_six (v i) 1 (b : ℤ) (e i) (q i) t (hres i)
  have hphase3 : Int.fract ((v 3 : ℝ) * s) =
      Int.fract ((e 3 : ℝ) * (b : ℝ) / 6) := by
    have h : Int.fract ((v 3 : ℝ) * s) =
        Int.fract ((v 3 : ℝ) * t + (e 3 : ℝ) * (b : ℝ) / 6) := by
      simpa only [s, Int.cast_one, one_mul, Int.cast_natCast] using
        fract_time_affine_six (v 3) 1 (b : ℤ) (e 3) (q 3) t (hres 3)
    rw [h, ← Int.fract_fract_add, hzero, zero_add]
  apply hno s
  intro i
  fin_cases i
  · rw [hshift, he0, Int.cast_zero, zero_mul, zero_div, add_zero]
    exact hsafe0
  · rw [hshift]
    simpa [thirdTripleIndex] using hgood 0
  · rw [hshift]
    simpa [thirdTripleIndex] using hgood 1
  · rw [three_even_distance_eq_of_fract_eq hphase3]
    exact safe_signed_sixth (e 3) he3 b hb hb5
  · rw [hshift]
    simpa [thirdTripleIndex] using hgood 2

private theorem distance_time_half_residue (v : ℕ) (e q : ℤ) (t : ℝ)
    (hv : (v : ℤ) = e + 6 * q) :
    distance ((v : ℝ) * (t + 1 / 2)) = distance ((v : ℝ) * t + (e : ℝ) / 2) := by
  have h := distance_time_affine_six v 1 3 e q t hv
  convert h using 1 <;> congr 1 <;> push_cast <;> ring

private theorem distance_add_even_half (e : ℤ) (he : e = 0 ∨ e = 2 ∨ e = -2)
    (x : ℝ) : distance (x + (e : ℝ) / 2) = distance x := by
  have heq : (e : ℝ) / 2 = ((e / 2 : ℤ) : ℝ) := by
    rcases he with rfl | rfl | rfl <;> norm_num
  rw [heq, CriticalFamilies.distance_add_int]

private theorem distance_add_odd_half (e : ℤ) (he : e = 1 ∨ e = -1)
    (x : ℝ) : distance (x + (e : ℝ) / 2) = 1 / 2 - distance x := by
  rcases he with rfl | rfl
  · simpa only [Int.cast_one] using distance_add_half x
  · have heq : x + ((-1 : ℤ) : ℝ) / 2 = (x + 1 / 2) + (-1 : ℤ) := by
      push_cast
      ring
    rw [heq, CriticalFamilies.distance_add_int, distance_add_half]

private theorem middle_at_first_odd_zero
    (v : Fin 5 → ℕ) (e q : Fin 5 → ℤ)
    (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (he1 : e 1 = 2 ∨ e 1 = -2) (he2 : e 2 = 2 ∨ e 2 = -2)
    (he3 : e 3 = 1 ∨ e 3 = -1) (he4 : e 4 = 1 ∨ e 4 = -1)
    (hno : ∀ t : ℝ, ¬ AllSafe v t) (t : ℝ)
    (hzero : Int.fract ((v 3 : ℝ) * t) = 0)
    (hsafe0 : (1 / 6 : ℝ) ≤ distance ((v 0 : ℝ) * t)) :
    (1 / 3 : ℝ) < distance ((v 4 : ℝ) * t) := by
  have htriple := triple_strict_at_odd_zero v e q hres he0 he1 he2 he3 he4
    hno t hzero hsafe0
  have hs1 : (1 / 6 : ℝ) < distance ((v 1 : ℝ) * t) := by
    simpa [thirdTripleIndex] using htriple 0
  have hs2 : (1 / 6 : ℝ) < distance ((v 2 : ℝ) * t) := by
    simpa [thirdTripleIndex] using htriple 1
  have hzdist : distance ((v 3 : ℝ) * t) = 0 := by
    rw [distance_eq_min_fract, hzero]
    norm_num
  by_contra! hs4
  apply hno (t + 1 / 2)
  intro i
  fin_cases i
  · rw [distance_time_half_residue _ _ _ _ (hres 0),
      distance_add_even_half (e 0) (Or.inl he0)]
    exact hsafe0
  · rw [distance_time_half_residue _ _ _ _ (hres 1),
      distance_add_even_half (e 1) (Or.inr he1)]
    exact hs1.le
  · rw [distance_time_half_residue _ _ _ _ (hres 2),
      distance_add_even_half (e 2) (Or.inr he2)]
    exact hs2.le
  · rw [distance_time_half_residue _ _ _ _ (hres 3), distance_add_odd_half (e 3) he3,
      hzdist]
    norm_num
  · rw [distance_time_half_residue _ _ _ _ (hres 4), distance_add_odd_half (e 4) he4]
    linarith

private theorem middle_at_second_odd_zero
    (v : Fin 5 → ℕ) (e q : Fin 5 → ℤ)
    (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (he1 : e 1 = 2 ∨ e 1 = -2) (he2 : e 2 = 2 ∨ e 2 = -2)
    (he3 : e 3 = 1 ∨ e 3 = -1) (he4 : e 4 = 1 ∨ e 4 = -1)
    (hno : ∀ t : ℝ, ¬ AllSafe v t) (t : ℝ)
    (hzero : Int.fract ((v 4 : ℝ) * t) = 0)
    (hsafe0 : (1 / 6 : ℝ) ≤ distance ((v 0 : ℝ) * t)) :
    (1 / 3 : ℝ) < distance ((v 3 : ℝ) * t) := by
  let σ := Equiv.swap (3 : Fin 5) 4
  let w := v ∘ σ
  have hno' : ∀ s : ℝ, ¬ AllSafe w s := by
    intro s hs
    apply hno s
    intro i
    obtain ⟨j, hj⟩ := σ.surjective i
    simpa only [w, Function.comp_def, hj] using hs j
  have hm := middle_at_first_odd_zero w (e ∘ σ) (q ∘ σ)
    (fun i => hres (σ i))
    (by simpa [σ, Function.comp_def, Equiv.swap_apply_def] using he0)
    (by simpa [σ, Function.comp_def, Equiv.swap_apply_def] using he1)
    (by simpa [σ, Function.comp_def, Equiv.swap_apply_def] using he2)
    (by simpa [σ, Function.comp_def, Equiv.swap_apply_def] using he4)
    (by simpa [σ, Function.comp_def, Equiv.swap_apply_def] using he3)
    hno' t
    (by simpa [w, σ, Function.comp_def, Equiv.swap_apply_def] using hzero)
    (by simpa [w, σ, Function.comp_def, Equiv.swap_apply_def] using hsafe0)
  simpa [w, σ, Function.comp_def, Equiv.swap_apply_def] using hm

private theorem not_three_dvd_signed (v : ℕ) (e q : ℤ)
    (hv : (v : ℤ) = e + 6 * q)
    (he : e = 1 ∨ e = -1 ∨ e = 2 ∨ e = -2) : ¬3 ∣ v := by
  intro hdiv
  have hdivI : (3 : ℤ) ∣ (v : ℤ) := by exact_mod_cast hdiv
  obtain ⟨k, hk⟩ := hdivI
  rcases he with rfl | rfl | rfl | rfl <;> omega

private theorem coprime_six_of_odd_residue (v : ℕ)
    (hv : v % 6 = 1 ∨ v % 6 = 5) : Nat.Coprime v 6 := by
  rw [Nat.coprime_iff_gcd_eq_one, Nat.gcd_comm, Nat.gcd_rec]
  rcases hv with hv | hv <;> rw [hv] <;> norm_num

private theorem small_time_forces_safe
    (v : Fin 5 → ℕ) (hpos : 0 < v 0) (hdiv : 3 ∣ v 0)
    (hnondiv : ∀ i : Fin 5, i ≠ 0 → ¬3 ∣ v i)
    (hsmall3 : 6 * v 3 ≤ v 0) (hsmall4 : 6 * v 4 ≤ v 0) :
    ∃ t : ℝ, AllSafe v t := by
  classical
  by_contra hnone
  have hno : ∀ t : ℝ, ¬AllSafe v t := by simpa only [not_exists] using hnone
  let t : ℝ := 1 / (6 * (v 0 : ℝ))
  have hvpos : (0 : ℝ) < v 0 := by exact_mod_cast hpos
  have hbase : (v 0 : ℝ) * t = 1 / 6 := by
    dsimp [t]
    field_simp [ne_of_gt hvpos]
  have hsmall (i : Fin 5) (hi : 6 * v i ≤ v 0)
      (a : ℕ) (ha : a ≤ 5) :
      distance ((v i : ℝ) * ((a : ℝ) * t)) < (1 / 6 : ℝ) := by
    have hiR : 6 * (v i : ℝ) ≤ v 0 := by exact_mod_cast hi
    have haR : (a : ℝ) ≤ 5 := by exact_mod_cast ha
    have hav := mul_le_mul_of_nonneg_right haR (Nat.cast_nonneg (v i) : (0 : ℝ) ≤ v i)
    have heq : (v i : ℝ) * ((a : ℝ) * t) =
        (a : ℝ) * (v i : ℝ) / (6 * (v 0 : ℝ)) := by dsimp [t]; ring
    have hnonneg : (0 : ℝ) ≤ (v i : ℝ) * ((a : ℝ) * t) := by
      rw [heq]
      positivity
    have hbound : (v i : ℝ) * ((a : ℝ) * t) ≤ 5 / 36 := by
      rw [heq]
      apply (div_le_iff₀ (by positivity : (0 : ℝ) < 6 * (v 0 : ℝ))).mpr
      nlinarith
    have hd := distance_le_int ((v i : ℝ) * ((a : ℝ) * t)) 0
    rw [Int.cast_zero, sub_zero, abs_of_nonneg hnonneg] at hd
    linarith
  have hsafe0 (a : ℕ) (ha : 1 ≤ a) (ha5 : a ≤ 5) :
      (1 / 6 : ℝ) ≤ distance ((v 0 : ℝ) * ((a : ℝ) * t)) := by
    have heq : (v 0 : ℝ) * ((a : ℝ) * t) = (a : ℝ) / 6 := by
      calc
        (v 0 : ℝ) * ((a : ℝ) * t) = (a : ℝ) * ((v 0 : ℝ) * t) := by ring
        _ = (a : ℝ) / 6 := by rw [hbase]; ring
    have haR : (1 : ℝ) ≤ a := by exact_mod_cast ha
    have ha5R : (a : ℝ) ≤ 5 := by exact_mod_cast ha5
    rw [heq]
    apply distance_lower_of_cell (k := 0) <;>
      norm_num only [Int.cast_zero, sub_zero] <;> linarith
  have hstrict (a : ℕ) (ha : 1 ≤ a) (ha5 : a ≤ 5) :
      (1 / 6 : ℝ) < distance ((v 1 : ℝ) * ((a : ℝ) * t)) := by
    by_contra! hclose
    obtain ⟨j, hj⟩ := exists_third_shift_of_three_close v {0} ((a : ℝ) * t)
      (by
        intro j i hi
        have hi0 : i = 0 := by simpa only [Finset.mem_singleton] using hi
        subst i
        rw [distance_third_shift_of_dvd (v 0) hdiv]
        exact hsafe0 a ha ha5)
      (by intro i hi; exact hnondiv i (by simpa only [Finset.mem_singleton] using hi))
      (by norm_num) 1 3 4 (by decide) (by decide) (by decide)
      (by decide) (by decide) (by decide)
      hclose (hsmall 3 hsmall3 a ha5).le (hsmall 4 hsmall4 a ha5).le
    exact hno _ hj
  have hone : (1 / 6 : ℝ) < distance ((v 1 : ℝ) * t) := by
    simpa using hstrict 1 (by decide) (by decide)
  obtain ⟨a, ha, ha5, hbad⟩ := exists_small_multiplier_unsafe ((v 1 : ℝ) * t) hone
  have hgood := hstrict a (by omega) ha5
  rw [show (v 1 : ℝ) * ((a : ℝ) * t) = (a : ℝ) * ((v 1 : ℝ) * t) by ring] at hgood
  exact (not_lt_of_ge hgood.le) hbad

/-- Renault's three-even case, with explicit signed residues modulo six. -/
theorem three_even_safe_time_of_signed_residues
    (v : Fin 5 → ℕ) (e q : Fin 5 → ℤ)
    (hpositive : ∀ i, 0 < v i) (hdiv : 6 ∣ v 0)
    (hres : ∀ i, (v i : ℤ) = e i + 6 * q i) (he0 : e 0 = 0)
    (he1 : e 1 = 2 ∨ e 1 = -2) (he2 : e 2 = 2 ∨ e 2 = -2)
    (he3 : e 3 = 1 ∨ e 3 = -1) (he4 : e 4 = 1 ∨ e 4 = -1)
    (hcop3 : Nat.Coprime (v 3) 6) (hcop4 : Nat.Coprime (v 4) 6) :
    ∃ t : ℝ, AllSafe v t := by
  classical
  by_contra hnone
  have hno : ∀ t : ℝ, ¬AllSafe v t := by simpa only [not_exists] using hnone
  have hdiv3 : v 3 ∣ v 0 := odd_divides_of_middle_condition (v 0) (v 3) (v 4)
    (hpositive 3) hcop3
    (middle_at_first_odd_zero v e q hres he0 he1 he2 he3 he4 hno)
  have hdiv4 : v 4 ∣ v 0 := odd_divides_of_middle_condition (v 0) (v 4) (v 3)
    (hpositive 4) hcop4
    (middle_at_second_odd_zero v e q hres he0 he1 he2 he3 he4 hno)
  have hmultiple3 : 6 * v 3 ∣ v 0 := hcop3.symm.mul_dvd_of_dvd_of_dvd hdiv hdiv3
  have hmultiple4 : 6 * v 4 ∣ v 0 := hcop4.symm.mul_dvd_of_dvd_of_dvd hdiv hdiv4
  have hnondiv : ∀ i : Fin 5, i ≠ 0 → ¬3 ∣ v i := by
    intro i hi
    apply not_three_dvd_signed (v i) (e i) (q i) (hres i)
    fin_cases i
    · exact False.elim (hi rfl)
    · exact Or.inr (Or.inr he1)
    · exact Or.inr (Or.inr he2)
    · exact he3.elim Or.inl (fun h => Or.inr (Or.inl h))
    · exact he4.elim Or.inl (fun h => Or.inr (Or.inl h))
  exact hnone (small_time_forces_safe v (hpositive 0) (dvd_trans (by decide : 3 ∣ 6) hdiv)
    hnondiv (Nat.le_of_dvd (hpositive 0) hmultiple3)
      (Nat.le_of_dvd (hpositive 0) hmultiple4))

private theorem signed_mod_six (v : ℕ) :
    ∃ e q : ℤ, (v : ℤ) = e + 6 * q ∧
      (v % 6 = 0 → e = 0) ∧
      (v % 6 = 1 ∨ v % 6 = 5 → e = 1 ∨ e = -1) ∧
      (v % 6 = 2 ∨ v % 6 = 4 → e = 2 ∨ e = -2) := by
  have hv : (v : ℤ) = ((v % 6 : ℕ) : ℤ) + 6 * ((v / 6 : ℕ) : ℤ) := by
    exact_mod_cast (Nat.mod_add_div v 6).symm
  by_cases hsmall : v % 6 ≤ 3
  · refine ⟨((v % 6 : ℕ) : ℤ), ((v / 6 : ℕ) : ℤ), hv, ?_, ?_, ?_⟩
    · intro h
      simp only [h, Nat.cast_zero]
    · rintro (h | h)
      · exact Or.inl (by simp only [h, Nat.cast_one])
      · omega
    · rintro (h | h)
      · exact Or.inl (by simp only [h, Nat.cast_ofNat])
      · omega
  · refine ⟨((v % 6 : ℕ) : ℤ) - 6, ((v / 6 : ℕ) : ℤ) + 1, by omega, ?_, ?_, ?_⟩
    · intro h
      omega
    · rintro (h | h)
      · omega
      · exact Or.inr (by simp only [h, Nat.cast_ofNat]; norm_num)
    · rintro (h | h)
      · omega
      · exact Or.inr (by simp only [h, Nat.cast_ofNat]; norm_num)

/-- Five positive integer speeds admit a one-sixth-safe time when exactly the
three displayed speeds are even and only the distinguished speed is divisible
by three. -/
theorem three_even_safe_time (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hdiv : 6 ∣ v 0) (heven1 : v 1 % 6 = 2 ∨ v 1 % 6 = 4)
    (heven2 : v 2 % 6 = 2 ∨ v 2 % 6 = 4)
    (hodd3 : v 3 % 6 = 1 ∨ v 3 % 6 = 5)
    (hodd4 : v 4 % 6 = 1 ∨ v 4 % 6 = 5) :
    ∃ t : ℝ, ∀ i, (1 / 6 : ℝ) ≤ distance ((v i : ℝ) * t) := by
  classical
  choose e q hres hzero hodd heven using fun i : Fin 5 => signed_mod_six (v i)
  exact three_even_safe_time_of_signed_residues v e q hpositive hdiv hres
    (hzero 0 (Nat.mod_eq_zero_of_dvd hdiv)) (heven 1 heven1) (heven 2 heven2)
    (hodd 3 hodd3) (hodd 4 hodd4) (coprime_six_of_odd_residue (v 3) hodd3)
    (coprime_six_of_odd_residue (v 4) hodd4)

end

end Loneliness.Renault
