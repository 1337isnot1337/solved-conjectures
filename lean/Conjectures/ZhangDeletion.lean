import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Data.Nat.ModEq
import Mathlib.Data.ZMod.Basic
import Conjectures.LonelinessRational
import Mathlib.NumberTheory.DiophantineApproximation.Basic

namespace ZhangDeletion

/-- In the boundary case, the first admissible denominator is already coprime. -/
theorem boundary_coprime (r : ℕ) : Nat.Coprime (3 * r + 1) r := by
  simpa [Nat.add_comm] using (Nat.coprime_mul_right_add_left 1 r 3).2 (Nat.coprime_one_left r)

theorem coprime_in_window (n r : ℕ) (hn : 1 ≤ n) (hr : 0 < r) :
    ∃ d, n + r ≤ d ∧ d ≤ n + 2*r - 1 ∧ Nat.Coprime d r := by
  let q := (n + r - 2) / r
  let d := 1 + (q + 1)*r
  have hm := Nat.mod_lt (n+r-2) hr
  have he := Nat.mod_add_div (n+r-2) r
  refine ⟨d, ?_, ?_, ?_⟩
  · dsimp [d, q]; simp only [Nat.mul_comm, Nat.mul_add, Nat.mul_one] at *; omega
  · dsimp [d, q]; simp only [Nat.mul_comm, Nat.mul_add, Nat.mul_one] at *; omega
  · dsimp [d]; exact (Nat.coprime_add_mul_right_left 1 r (q+1)).2 (Nat.coprime_one_left r)

theorem coprime_strict_window (n r : ℕ) (hn : 4 ≤ n) (hr : 1 ≤ r)
    (hsmall : 2*r ≤ n-1) :
    ∃ d, n+r ≤ d ∧ d ≤ 2*n-3 ∧ Nat.Coprime d r := by
  by_cases h : 2*r ≤ n-2
  · obtain ⟨d, hlow, hupp, hc⟩ := coprime_in_window n r (by omega) (by omega)
    exact ⟨d, hlow, by omega, hc⟩
  · refine ⟨3*r+1, ?_, ?_, boundary_coprime r⟩ <;> omega

theorem residue_ne_one (D j r v : ℕ) (hj : Nat.Coprime D j)
    (hrD : r < D) (hvD : v < D) (hvr : v ≠ r)
    (hjr : (r*j) % D = 1) : (v*j) % D ≠ 1 := by
  intro h
  have heq : v*j ≡ r*j [MOD D] := by
    change (v*j) % D = (r*j) % D
    omega
  have hcancel := Nat.ModEq.cancel_right_of_coprime hj heq
  change v % D = r % D at hcancel
  simp only [Nat.mod_eq_of_lt hvD, Nat.mod_eq_of_lt hrD] at hcancel
  exact hvr hcancel

theorem residue_ne_zero (D j v : ℕ) (hj : Nat.Coprime D j)
    (hvD : v < D) (hv : 0 < v) : (v*j) % D ≠ 0 := by
  intro h
  have heq : v*j ≡ 0*j [MOD D] := by
    change (v*j) % D = (0*j) % D
    simp [h]
  have hcancel := Nat.ModEq.cancel_right_of_coprime hj heq
  change v % D = 0 % D at hcancel
  simp only [Nat.mod_eq_of_lt hvD, Nat.zero_mod] at hcancel
  omega

theorem residue_ne_last (D j r v : ℕ) (hj : Nat.Coprime D j)
    (hD : 1 < D) (hvrD : v+r < D) (hv : 0 < v)
    (hjr : (r*j) % D = 1) : (v*j) % D ≠ D-1 := by
  intro h
  have heq : (v+r)*j ≡ 0*j [MOD D] := by
    change ((v+r)*j) % D = (0*j) % D
    rw [Nat.add_mul, Nat.add_mod, h, hjr]
    simp only [Nat.zero_mul, Nat.zero_mod]
    have : D-1+1 = D := by omega
    rw [this, Nat.mod_self]
  have hcancel := Nat.ModEq.cancel_right_of_coprime hj heq
  change (v+r) % D = 0 % D at hcancel
  simp only [Nat.mod_eq_of_lt hvrD, Nat.zero_mod] at hcancel
  omega

theorem inverse_witness (D r : ℕ) (hD : 1 < D) (hr : Nat.Coprime r D) :
    ∃ j, j < D ∧ Nat.Coprime D j ∧ (r*j) % D = 1 := by
  letI : NeZero D := ⟨by omega⟩
  let j := ((r : ZMod D)⁻¹).val
  refine ⟨j, ZMod.val_lt _, ?_, ?_⟩
  · have he := ZMod.mul_val_inv hr
    have hu : IsUnit ((r : ZMod D) * (j : ZMod D)) := by
      rw [show (r : ZMod D) * (j : ZMod D) = 1 from he]
      exact isUnit_one
    exact ((ZMod.isUnit_iff_coprime j D).1 (isUnit_of_mul_isUnit_right hu)).symm
  · have he := ZMod.mul_val_inv hr
    have he' : ((r*j : ℕ) : ZMod D) = ((1 : ℕ) : ZMod D) := by
      simpa only [Nat.cast_mul, Nat.cast_one] using he
    have hm := (ZMod.natCast_eq_natCast_iff' (r*j) 1 D).1 he'
    simpa [Nat.mod_eq_of_lt hD] using hm

theorem modular_witness (n r D : ℕ) (hn : 1 ≤ n) (hr : 1 ≤ r)
    (hD : n+r ≤ D) (hc : Nat.Coprime r D) :
    ∃ j, j < D ∧ ∀ v, 1 ≤ v → v < n → v ≠ r →
      2 ≤ (v*j) % D ∧ (v*j) % D ≤ D-2 := by
  have hD1 : 1 < D := by omega
  obtain ⟨j, hjD, hj, hjr⟩ := inverse_witness D r hD1 hc
  refine ⟨j, hjD, ?_⟩
  intro v hv hvn hvr
  have h0 := residue_ne_zero D j v hj (by omega) (by omega)
  have h1 := residue_ne_one D j r v hj (by omega) (by omega) hvr hjr
  have hl := residue_ne_last D j r v hj hD1 (by omega) (by omega) hjr
  have hm := Nat.mod_lt (v*j) (by omega : 0 < D)
  omega

theorem distance_bound (D v j a : ℕ) (hD : 0 < D)
    (hlo : a ≤ (v*j)%D) (hhi : (v*j)%D + a ≤ D) :
    (a : ℝ) / D ≤ Loneliness.distance (((v*j : ℕ) : ℝ) / D) := by
  have hDi : (0 : ℤ) < D := by exact_mod_cast hD
  have hd := Loneliness.distance_int_div (v*j : ℕ) D hDi
  simp only [Int.cast_natCast] at hd
  rw [hd]
  have hm : (a : ℤ) ≤ min (((v*j : ℕ) : ℤ) % D) (D - (((v*j : ℕ) : ℤ) % D)) := by
    apply le_min
    · rw [← Int.natCast_emod]
      exact_mod_cast hlo
    · rw [← Int.natCast_emod]
      have h1 : (a : ℤ) ≤ (D : ℤ) - (((v*j)%D : ℕ) : ℤ) := by
        have hh : (a : ℤ) + (((v*j)%D : ℕ) : ℤ) ≤ D := by
          have : a + (v*j)%D ≤ D := by omega
          exact_mod_cast this
        omega
      exact h1
  have hmR : (a : ℝ) ≤ ((min (((v*j : ℕ) : ℤ) % D) (D - (((v*j : ℕ) : ℤ) % D)) : ℤ) : ℝ) := by exact_mod_cast hm
  exact div_le_div_of_nonneg_right hmR (by positivity)

def speeds (n r : ℕ) : List ℕ := (List.range' 1 (n-1)).filter (· != r)

theorem modular_lower (n r D : ℕ) (hn : 4 ≤ n) (hr : 1 ≤ r)
    (hD : n+r ≤ D) (hc : Nat.Coprime r D) :
    (2 : ℝ) / D ≤ Loneliness.value (speeds n r) := by
  obtain ⟨j, hjD, hj⟩ := modular_witness n r D (by omega) hr hD hc
  have hDR : (0 : ℝ) < D := by exact_mod_cast (show 0 < D by omega)
  have hD4 : (4 : ℝ) ≤ D := by exact_mod_cast (show 4 ≤ D by omega)
  apply le_trans ?_ (Loneliness.le_value (ds := speeds n r) (t := (j : ℝ)/D) ?_)
  · apply Loneliness.le_clearance
    · apply (div_le_iff₀ hDR).2
      linarith
    · intro v hv
      have hv' : v ∈ List.range' 1 (n-1) ∧ v ≠ r := by
        simpa [speeds] using hv
      have hvBounds : 1 ≤ v ∧ v < n := by
        have h := hv'.1
        simp only [List.mem_range', Nat.one_mul] at h
        obtain ⟨i, hi, rfl⟩ := h
        omega
      obtain ⟨hlo, hhi⟩ := hj v hvBounds.1 hvBounds.2 hv'.2
      have hb := distance_bound D v j 2 (by omega) hlo (by omega)
      push_cast at hb
      simpa only [mul_div_assoc] using hb
  · constructor
    · positivity
    · apply (div_le_one hDR).2
      exact_mod_cast (Nat.le_of_lt hjD)

theorem small_deletion_strict (n r : ℕ) (hn : 4 ≤ n) (hr : 1 ≤ r)
    (hsmall : 2*r ≤ n-1) :
    (1 : ℝ) / (n-1) < Loneliness.value (speeds n r) := by
  obtain ⟨D, hD, hDmax, hc⟩ := coprime_strict_window n r hn hr hsmall
  have hDR : (0 : ℝ) < D := by exact_mod_cast (show 0 < D by omega)
  have hnR : (1 : ℝ) < n := by exact_mod_cast (show 1 < n by omega)
  have hDr : (D : ℝ) + 3 ≤ 2*(n : ℝ) := by
    have h : D + 3 ≤ 2*n := by omega
    exact_mod_cast h
  have hstrict : (1 : ℝ) / (n-1) < 2 / D := by
    apply (div_lt_div_iff₀ (by linarith) hDR).2
    linarith
  exact hstrict.trans_le (modular_lower n r D hn hr hD hc.symm)

theorem large_deletion_lower (n r : ℕ) (hn : 3 ≤ n) (hr : 1 ≤ r)
    (hrn : r ≤ n-1) (hlarge : n-1 < 2*r) :
    (1 : ℝ) / r ≤ Loneliness.value (speeds n r) := by
  have hr2 : 2 ≤ r := by omega
  have hrR : (0 : ℝ) < r := by exact_mod_cast (show 0 < r by omega)
  have hr2R : (2 : ℝ) ≤ r := by exact_mod_cast hr2
  apply le_trans ?_ (Loneliness.le_value (ds := speeds n r) (t := (1 : ℝ)/r) ?_)
  · apply Loneliness.le_clearance
    · apply (div_le_iff₀ hrR).2
      linarith
    · intro v hv
      have hv' : v ∈ List.range' 1 (n-1) ∧ v ≠ r := by simpa [speeds] using hv
      have hvBounds : 1 ≤ v ∧ v < n := by
        have h := hv'.1
        simp only [List.mem_range', Nat.one_mul] at h
        obtain ⟨i, hi, rfl⟩ := h
        omega
      have hmod : 1 ≤ v%r ∧ v%r+1 ≤ r := by
        by_cases h : v < r
        · rw [Nat.mod_eq_of_lt h]; omega
        · have hvr : r ≤ v := by omega
          have hv2 : v-r < r := by omega
          have hvEq : v = r + (v-r) := by omega
          have hvmod : v % r = v-r := by
            conv_lhs => rw [hvEq]
            simp [Nat.add_mod, Nat.mod_eq_of_lt hv2]
          rw [hvmod]
          omega
      have hb := distance_bound r v 1 1 (by omega) (by simpa using hmod.1) (by simpa using hmod.2)
      simpa [div_eq_mul_inv] using hb
  · constructor
    · positivity
    · apply (div_le_one hrR).2
      linarith

theorem question84 (n r : ℕ) (hn : 4 ≤ n) (hr : 1 ≤ r)
    (hrn : r ≤ n-2) :
    (1 : ℝ) / (n-1) < Loneliness.value (speeds n r) := by
  by_cases hs : 2*r ≤ n-1
  · exact small_deletion_strict n r hn hr hs
  · have hrR : (0 : ℝ) < r := by exact_mod_cast (show 0 < r by omega)
    have hnR : (0 : ℝ) < (n : ℝ)-1 := by
      have : (1 : ℝ) < n := by exact_mod_cast (show 1 < n by omega)
      linarith
    have hlt : (1 : ℝ) / (n-1) < 1/r := by
      apply (div_lt_div_iff₀ hnR hrR).2
      have h : (r : ℝ) + 2 ≤ n := by
        have hnat : r+2 ≤ n := by omega
        exact_mod_cast hnat
      linarith
    exact hlt.trans_le (large_deletion_lower n r (by omega) hr (by omega) (by omega))

theorem large_deletion_upper (n r : ℕ) (hn : 3 ≤ n) (hr : 1 ≤ r)
    (hrn : r ≤ n-1) (hlarge : n-1 < 2*r) :
    Loneliness.value (speeds n r) ≤ (1 : ℝ) / r := by
  have hr2 : 2 ≤ r := by omega
  apply Loneliness.value_le
  intro t ht
  obtain ⟨d, hd, hdn, hdist⟩ := Real.exists_nat_abs_mul_sub_round_le t (show 0 < r-1 by omega)
  have hmem : d ∈ speeds n r := by
    simp only [speeds, List.mem_filter, List.mem_range', bne_iff_ne, Nat.one_mul]
    constructor
    · exact ⟨d-1, by omega, by omega⟩
    · omega
  have hbound := Loneliness.clearance_le_of_mem hmem t
  have hEq : ((r-1 : ℕ) : ℝ)+1 = r := by
    have hh : r-1+1 = r := by omega
    exact_mod_cast hh
  rw [hEq] at hdist
  exact hbound.trans hdist

theorem large_deletion_exact (n r : ℕ) (hn : 3 ≤ n) (hr : 1 ≤ r)
    (hrn : r ≤ n-1) (hlarge : n-1 < 2*r) :
    Loneliness.value (speeds n r) = (1 : ℝ) / r :=
  le_antisymm (large_deletion_upper n r hn hr hrn hlarge)
    (large_deletion_lower n r hn hr hrn hlarge)

end ZhangDeletion
