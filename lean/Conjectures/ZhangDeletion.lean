import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Data.Nat.ModEq

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

end ZhangDeletion
