import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! The unbounded arithmetic behind the Goddyn--Wong acceleration criterion.
The criterion excludes every integer coprime to r from [s,m*s). -/

namespace Loneliness.TwoInsertions

def AccelerationGap (r s m : ℕ) : Prop :=
  ∀ k : ℕ, s ≤ k → k < m*s → 1 < Nat.gcd r k

theorem AccelerationGap.excludes {r s m : ℕ} (h : AccelerationGap r s m)
    {k : ℕ} (hk : Nat.Coprime r k) (hs : s ≤ k) : m*s ≤ k := by
  by_contra hn
  have hg := h k hs (by omega)
  rw [hk.gcd_eq_one] at hg
  omega

theorem exists_coprime_in_block (r s : ℕ) (hr : 0 < r) :
    ∃ k : ℕ, s ≤ k ∧ k < s+r ∧ Nat.Coprime r k := by
  let k := r*(s/r+1)-1
  have hrem : s%r < r := Nat.mod_lt s hr
  have hdecomp := Nat.mod_add_div s r
  have hmul : r*(s/r+1) = r*(s/r)+r := by ring
  have hpos : 1 ≤ r*(s/r+1) := by nlinarith
  refine ⟨k, ?_, ?_, ?_⟩
  · dsimp [k]
    omega
  · dsimp [k]
    omega
  · change Nat.gcd r (r*(s/r+1)-1) = 1
    rw [Nat.gcd_mul_left_sub_right hpos]
    simp

theorem AccelerationGap.sandwich {r s m : ℕ} (h : AccelerationGap r s m)
    (hr : 0 < r) (hs : 0 < s) (hm : 2 ≤ m) :
    2 ≤ s ∧ s < r ∧ m*s < r := by
  have hs2 : 2 ≤ s := by
    by_contra hn
    have he : s = 1 := by omega
    have hg := h 1 (by omega) (by nlinarith)
    simpa using hg
  have hsr : s < r := by
    by_contra hn
    obtain ⟨k, hklo, hkhi, hkcop⟩ := exists_coprime_in_block r s hr
    have hex := h.excludes hkcop hklo
    have hmul := Nat.mul_le_mul_right s hm
    nlinarith
  have hcop : Nat.Coprime r (r-1) := by
    exact (Nat.coprime_self_sub_right (show 1 ≤ r by omega)).mpr (by simp)
  have hlast := h.excludes hcop (by omega)
  exact ⟨hs2, hsr, by omega⟩

theorem exists_coprime_near_half (r : ℕ) (hr : 4 ≤ r) :
    ∃ k : ℕ, 2*k ≤ r ∧ r ≤ 2*k+4 ∧ Nat.Coprime r k := by
  by_cases hodd : r%2 = 1
  · let k := r/2
    have he : r = 2*k+1 := by dsimp [k]; omega
    refine ⟨k, by omega, by omega, ?_⟩
    rw [he]
    exact (Nat.coprime_mul_right_add_left 1 k 2).mpr (by simp)
  · let n := r/4
    by_cases hfour : r%4 = 0
    · have he : r = 4*n := by dsimp [n]; omega
      have hn : 1 ≤ n := by omega
      let k := 2*n-1
      have hk : k+1 = 2*n := by dsimp [k]; omega
      have hcop2 : Nat.Coprime 2 k := by
        change Nat.gcd 2 (2*n-1) = 1
        rw [Nat.gcd_mul_left_sub_right (show 1 ≤ 2*n by omega)]
        norm_num
      have hrk : r = 2+2*k := by omega
      refine ⟨k, by omega, by omega, ?_⟩
      rw [hrk]
      exact (Nat.coprime_add_mul_right_left 2 k 2).mpr hcop2
    · have he : r = 4*n+2 := by dsimp [n]; omega
      have hn : 1 ≤ n := by omega
      let k := 2*n-1
      have hk : k+1 = 2*n := by dsimp [k]; omega
      have hcop2 : Nat.Coprime 2 k := by
        change Nat.gcd 2 (2*n-1) = 1
        rw [Nat.gcd_mul_left_sub_right (show 1 ≤ 2*n by omega)]
        norm_num
      have hcop4 : Nat.Coprime 4 k := by
        simpa using hcop2.pow_left 2
      have hrk : r = 4+2*k := by omega
      refine ⟨k, by omega, by omega, ?_⟩
      rw [hrk]
      exact (Nat.coprime_add_mul_right_left 4 k 2).mpr hcop4

theorem AccelerationGap.twice_mul_le {r s m : ℕ} (h : AccelerationGap r s m)
    (hr : 0 < r) (hs : 0 < s) (hm : 3 ≤ m) : 2*(m*s) ≤ r := by
  obtain ⟨hs2, _, hms⟩ := h.sandwich hr hs (by omega)
  have hfour : 2*s+4 ≤ r := by
    by_cases hs3 : 3 ≤ s
    · have hmul := Nat.mul_le_mul_right s hm
      nlinarith
    · have hsEq : s = 2 := by omega
      subst s
      by_cases hm4 : 4 ≤ m
      · nlinarith
      · have hmEq : m = 3 := by omega
        subst m
        by_contra hn
        have hrEq : r = 7 := by omega
        subst r
        have hbad := h 2 (by decide) (by decide)
        norm_num at hbad
  obtain ⟨k, hkhi, hklo, hcop⟩ := exists_coprime_near_half r (by omega)
  have hsk : s ≤ k := by omega
  have hmk := h.excludes hcop hsk
  omega

theorem AccelerationGap.accelerated_cell {r s m : ℕ} (h : AccelerationGap r s m)
    (hr : 0 < r) (hs : 0 < s) (hm : 2 ≤ m) :
    (m-1)*(r+s+2) < m*r := by
  obtain ⟨hs2, _, hms⟩ := h.sandwich hr hs hm
  have hm1 : 1 ≤ m := by omega
  have hsub : m-1+1 = m := by omega
  have hgap : m*s+2*(m-1) < r+s := by
    by_cases hm2 : m = 2
    · subst m
      norm_num only [Nat.reduceSub, Nat.reduceMul]
      nlinarith
    · have hhalf := h.twice_mul_le hr hs (by omega)
      have hmul := Nat.mul_le_mul_left m hs2
      nlinarith
  have hidentity : (m-1)*(r+s+2)+(r+s+2) = m*(r+s+2) := by
    calc
      (m-1)*(r+s+2)+(r+s+2) = (m-1+1)*(r+s+2) := by ring
      _ = m*(r+s+2) := by rw [hsub]
  nlinarith

theorem acceleration_cell_bounds (p r m : ℕ) (hr : 0 < r) (hrp : r < p)
    (hm : 0 < m) (hgap : AccelerationGap r (p-r) m) :
    (m-1)*(p+2) < m*r ∧ m*r < m*p := by
  constructor
  · by_cases hm1 : m = 1
    · subst m
      simpa using hr
    · have hp : p = r+(p-r) := by omega
      have h := hgap.accelerated_cell hr (by omega) (by omega)
      simpa only [← hp] using h
  · exact Nat.mul_lt_mul_of_pos_left hrp hm

end Loneliness.TwoInsertions
