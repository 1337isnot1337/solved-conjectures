import Conjectures.HeimNeuhauserPlanePartitionRows

/-! Coefficient certificates for the two plane-partition polynomial inequalities. -/

namespace PlanePartition

open Polynomial
open OrdinaryDarcais (rowPoly rowEval rowPoly_eval packedCheck packedCheck_sound)

def rootCheck (e n : ℕ) : Bool :=
  packedCheck (n * (n + 1) + 1)
    (fun t => (n + 1) ^ n * rowEval t (checkedRow e n) ^ (n + 1))
    (fun t => n.factorial * rowEval t (checkedRow e (n + 1)) ^ n)

theorem rootCheck_sound {e n : ℕ}
    (h : rootCheck e n = true) {t : ℝ} (ht : 0 ≤ t) :
    RootDecrease ((e : ℝ) + t) n := by
  let p := rowPoly (checkedRow e n)
  let q := rowPoly (checkedRow e (n + 1))
  have hh := packedCheck_sound
    (p := C ((n + 1) ^ n) * p ^ (n + 1)) (q := C n.factorial * q ^ n)
    (fun _ => by simp [p, rowPoly_eval])
    (fun _ => by simp [q, rowPoly_eval]) h ht
  simp only [eval₂_mul, eval₂_pow, eval₂_C, Nat.coe_castRingHom, p, q] at hh
  rw [checkedRow_eval e t n, checkedRow_eval e t (n + 1)] at hh
  let a := (n.factorial : ℝ)
  let u := planePartition ((e : ℝ) + t) n
  let v := planePartition ((e : ℝ) + t) (n + 1)
  let c := ((n : ℝ) + 1) ^ n * a ^ (n + 1)
  have hc : 0 < c := by dsimp [c, a]; positivity
  have hleft : a * (scaledValue e t (n + 1)) ^ n = c * v ^ n := by
    simp only [scaledValue, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add,
      Nat.cast_one, mul_pow, c, v, a]
    rw [pow_succ ((n.factorial : ℝ)) n]
    ring
  have hright : (((n + 1) ^ n : ℕ) : ℝ) * (scaledValue e t n) ^ (n + 1) = c * u ^ (n + 1) := by
    simp [scaledValue, c, a, u, mul_pow, mul_assoc]
  rw [show ((n.factorial : ℕ) : ℝ) = a from rfl, hleft, hright] at hh
  exact (mul_lt_mul_iff_right₀ hc).mp hh

/-- Cancel the identical positive factorial factor on both sides of a Turán comparison. -/
theorem strictTuran_of_scaled {e n : ℕ} {t : ℝ} (hn₀ : 0 < n)
    (hh : (n : ℝ) * scaledValue e t (n - 1) * scaledValue e t (n + 1) <
      ((n + 1 : ℕ) : ℝ) * scaledValue e t n ^ 2) :
    planePartition ((e : ℝ) + t) (n - 1) * planePartition ((e : ℝ) + t) (n + 1) <
      planePartition ((e : ℝ) + t) n ^ 2 := by
  let c := ((n + 1 : ℕ) : ℝ) * (n.factorial : ℝ) ^ 2
  have hc : 0 < c := by dsimp [c]; positivity
  have hef : (n : ℝ) * ((n - 1).factorial : ℝ) = (n.factorial : ℝ) := by
    have he : n - 1 + 1 = n := by omega
    calc
      _ = ((n - 1 + 1 : ℕ) : ℝ) * ((n - 1).factorial : ℝ) := by rw [he]
      _ = (((n - 1 + 1).factorial : ℕ) : ℝ) := by rw [Nat.factorial_succ, Nat.cast_mul]
      _ = _ := by rw [he]
  have hleft : (n : ℝ) * scaledValue e t (n - 1) * scaledValue e t (n + 1) =
      c * (planePartition ((e : ℝ) + t) (n - 1) * planePartition ((e : ℝ) + t) (n + 1)) := by
    simp only [scaledValue, Nat.factorial_succ, Nat.cast_mul, c]
    rw [← hef]
    ring
  have hright : ((n + 1 : ℕ) : ℝ) * (scaledValue e t n) ^ 2 =
      c * planePartition ((e : ℝ) + t) n ^ 2 := by
    simp [scaledValue, c, mul_pow, mul_assoc]
  rw [hleft, hright] at hh
  exact (mul_lt_mul_iff_right₀ hc).mp hh

/-- A certificate at the shift e gives the root inequality for all real x ≥ e. -/
theorem rootDecrease_of_check {e n : ℕ} (h : rootCheck e n = true) {x : ℝ} (hx : (e : ℝ) ≤ x) :
    RootDecrease x n := by
  simpa only [add_sub_cancel] using rootCheck_sound h (sub_nonneg.mpr hx)

end PlanePartition
