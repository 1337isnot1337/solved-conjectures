import Conjectures.OrdinaryDarcaisData

/-! Verified finite root comparisons and the first part of the Turán bridge. -/

namespace OrdinaryDarcais

open Polynomial

private def rootCheck (n : ℕ) : Bool :=
  packedCheck (n * (n + 1) + 1)
    (fun t => (n + 1) ^ n * rowEval t (checkedRow n) ^ (n + 1))
    (fun t => n.factorial * rowEval t (checkedRow (n + 1)) ^ n)

private def turanCheck (n : ℕ) : Bool :=
  packedCheck (2 * n + 1)
    (fun t => (n + 1) * rowEval t (checkedRow n) ^ 2)
    (fun t => n * rowEval t (checkedRow (n - 1)) * rowEval t (checkedRow (n + 1)))

private theorem rootCheck_sound {n : ℕ} (hn : n + 1 ≤ 51)
    (h : rootCheck n = true) {t : ℝ} (ht : 0 ≤ t) :
    RootDecrease (1 + t) n := by
  let p := rowPoly (checkedRow n)
  let q := rowPoly (checkedRow (n + 1))
  have hh := packedCheck_sound
    (p := C ((n + 1) ^ n) * p ^ (n + 1)) (q := C n.factorial * q ^ n)
    (fun _ => by simp [p, rowPoly_eval])
    (fun _ => by simp [q, rowPoly_eval]) h ht
  simp only [eval₂_mul, eval₂_pow, eval₂_C, Nat.coe_castRingHom, p, q] at hh
  rw [checkedRow_eval t n (by omega), checkedRow_eval t (n + 1) hn] at hh
  let a := (n.factorial : ℝ)
  let u := darcais (1 + t) n
  let v := darcais (1 + t) (n + 1)
  let c := ((n : ℝ) + 1) ^ n * a ^ (n + 1)
  have hc : 0 < c := by dsimp [c, a]; positivity
  have hleft : a * (scaledValue t (n + 1)) ^ n = c * v ^ n := by
    simp only [scaledValue, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add,
      Nat.cast_one, mul_pow, c, v, a]
    rw [pow_succ ((n.factorial : ℝ)) n]
    ring
  have hright : (((n + 1) ^ n : ℕ) : ℝ) * (scaledValue t n) ^ (n + 1) = c * u ^ (n + 1) := by
    simp [scaledValue, c, a, u, mul_pow, mul_assoc]
  rw [show ((n.factorial : ℕ) : ℝ) = a from rfl, hleft, hright] at hh
  exact (mul_lt_mul_iff_right₀ hc).mp hh

private theorem turanCheck_sound {n : ℕ} (hn₀ : 0 < n) (hn : n + 1 ≤ 51)
    (h : turanCheck n = true) {t : ℝ} (ht : 0 ≤ t) :
    darcais (1 + t) (n - 1) * darcais (1 + t) (n + 1) < darcais (1 + t) n ^ 2 := by
  let p := rowPoly (checkedRow n)
  let q := rowPoly (checkedRow (n - 1))
  let r := rowPoly (checkedRow (n + 1))
  have hh := packedCheck_sound
    (p := C (n + 1) * p ^ 2) (q := C n * q * r)
    (fun _ => by simp [p, rowPoly_eval])
    (fun _ => by simp [q, r, rowPoly_eval]) h ht
  simp only [eval₂_mul, eval₂_pow, eval₂_C, Nat.coe_castRingHom, p, q, r] at hh
  rw [checkedRow_eval t n (by omega), checkedRow_eval t (n - 1) (by omega),
    checkedRow_eval t (n + 1) hn] at hh
  let c := ((n + 1 : ℕ) : ℝ) * (n.factorial : ℝ) ^ 2
  have hc : 0 < c := by dsimp [c]; positivity
  have hef : (n : ℝ) * ((n - 1).factorial : ℝ) = (n.factorial : ℝ) := by
    have he : n - 1 + 1 = n := by omega
    calc
      _ = ((n - 1 + 1 : ℕ) : ℝ) * ((n - 1).factorial : ℝ) := by rw [he]
      _ = (((n - 1 + 1).factorial : ℕ) : ℝ) := by rw [Nat.factorial_succ, Nat.cast_mul]
      _ = _ := by rw [he]
  have hleft : (n : ℝ) * scaledValue t (n - 1) * scaledValue t (n + 1) =
      c * (darcais (1 + t) (n - 1) * darcais (1 + t) (n + 1)) := by
    simp only [scaledValue, Nat.factorial_succ, Nat.cast_mul, c]
    rw [← hef]
    ring
  have hright : ((n + 1 : ℕ) : ℝ) * (scaledValue t n) ^ 2 =
      c * darcais (1 + t) n ^ 2 := by
    simp [scaledValue, c, mul_pow, mul_assoc]
  rw [hleft, hright] at hh
  exact (mul_lt_mul_iff_right₀ hc).mp hh

set_option maxRecDepth 10000 in
set_option maxHeartbeats 8000000 in
private theorem rootChecks (n : ℕ) (hn : 6 ≤ n) (hn' : n ≤ 25) : rootCheck n = true := by
  interval_cases n <;> decide +kernel

set_option maxRecDepth 10000 in
set_option maxHeartbeats 8000000 in
private theorem turanChecks (n : ℕ) (hn : 26 ≤ n) (hn' : n ≤ 50) : turanCheck n = true := by
  interval_cases n <;> decide +kernel

theorem rootDecrease_small {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 6 ≤ n) (hn' : n ≤ 25) :
    RootDecrease x n := by
  have hh := rootCheck_sound (by omega) (rootChecks n hn hn') (sub_nonneg.mpr hx)
  rwa [show 1 + (x - 1) = x by ring] at hh

theorem strictTuran_finite {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 26 ≤ n) (hn' : n ≤ 50) :
    darcais x (n - 1) * darcais x (n + 1) < darcais x n ^ 2 := by
  have hh := turanCheck_sound (by omega) (by omega) (turanChecks n hn hn') (sub_nonneg.mpr hx)
  rwa [show 1 + (x - 1) = x by ring] at hh

theorem rootDecrease_through_fifty {x : ℝ} (hx : 1 ≤ x) {n : ℕ} (hn : 6 ≤ n) (hn' : n ≤ 50) :
    RootDecrease x n := by
  by_cases h : n ≤ 25
  · exact rootDecrease_small hx hn h
  · have hall (m : ℕ) (hm : 25 ≤ m) : m ≤ 50 → RootDecrease x m := by
      induction m, hm using Nat.le_induction with
      | base => exact fun _ => rootDecrease_small hx (by decide) le_rfl
      | succ m hm ih =>
        intro hm'
        apply rootDecrease_succ (by linarith) (ih (by omega))
        exact (strictTuran_finite hx (by omega) hm').le
    exact hall n (by omega) hn'

/-- Beyond the checked range, log-concavity of the original coefficients
suffices for the full root statement. -/
theorem rootDecrease_of_remaining_turan {x : ℝ} (hx : 1 ≤ x)
    (ht : ∀ n ≥ 51, TuranAt x n) {n : ℕ} (hn : 6 ≤ n) :
    RootDecrease x n := by
  by_cases h : n ≤ 50
  · exact rootDecrease_through_fifty hx hn h
  · exact rootDecrease_of_logConcave (by linarith)
      (rootDecrease_through_fifty hx (by decide) le_rfl) (fun m hm => ht m (by omega)) n (by omega)

end OrdinaryDarcais
