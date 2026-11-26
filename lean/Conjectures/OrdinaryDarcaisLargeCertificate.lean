import Conjectures.OrdinaryDarcaisBalancedDigits
import Conjectures.OrdinaryDarcaisLargeData

/-! Verification of the scalar recurrence and Turán signs for the ordinary D’Arcais polynomial at every real parameter at least one. -/

namespace OrdinaryDarcais

open Polynomial

def largeLeft (a : ℕ → ℕ) (n : ℕ) := (n + 1) * a n ^ 2

def largeRight (a : ℕ → ℕ) (n : ℕ) := n * a (n - 1) * a (n + 1)

def largeHeight (n : ℕ) := (2*n+1).log2+1

def LargeSignCertificate (n : ℕ) : Prop :=
  largeLeft largeMass n < largeDigitBase ∧ largeRight largeMass n < largeDigitBase ∧
  blockCompare largeDigitBase (largeHeight n) (largeLeft largePacked n) (largeRight largePacked n) = true ∧
  largeRight largePacked n < largeDigitBase^(2^(largeHeight n)) ∧
  largeRight largePacked n % largeDigitBase < largeLeft largePacked n % largeDigitBase

instance (n : ℕ) : Decidable (LargeSignCertificate n) := by unfold LargeSignCertificate; infer_instance

def LargeIndexCertificate (n : ℕ) : Prop :=
  largeMass (n+1) = 2 * nestedSum n largeMass n ∧
  largePacked (n+1) = (1+largeDigitBase) * nestedSum n largePacked n ∧
  (26 ≤ n → LargeSignCertificate n)

instance (n : ℕ) : Decidable (LargeIndexCertificate n) := by unfold LargeIndexCertificate; infer_instance

private theorem strictTuran_of_scaled_large {n : ℕ} {t : ℝ} (hn₀ : 0 < n)
    (hh : (n : ℝ) * scaledValue t (n - 1) * scaledValue t (n + 1) <
      ((n + 1 : ℕ) : ℝ) * scaledValue t n ^ 2) :
    darcais (1+t) (n-1) * darcais (1+t) (n+1) < darcais (1+t) n^2 := by
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

theorem strictTuran_of_large_certificates {N : ℕ} (h₀ : largeMass 0 = 1 ∧ largePacked 0 = 1)
    (cert : ∀ j < N, LargeIndexCertificate j) {n : ℕ} (hn : 26 ≤ n) (hn' : n < N)
    {x : ℝ} (hx : 1 ≤ x) :
    darcais x (n - 1) * darcais x (n + 1) < darcais x n ^ 2 := by
  let p (i : ℕ) := rowPoly (shiftedRow i)
  have mass (j : ℕ) (hj : j ≤ N) : largeMass j = (p j).eval 1 :=
    scalarCandidate_eval h₀.1 (fun k hk => (cert k hk).1) hj
  have packed (j : ℕ) (hj : j ≤ N) : largePacked j = (p j).eval largeDigitBase :=
    scalarCandidate_eval h₀.2 (fun k hk => (cert k hk).2.1) hj
  let l := C (n + 1) * p n ^ 2
  let r := C n * p (n - 1) * p (n + 1)
  have Hl {a : ℕ → ℕ} {d : ℕ} (ha : ∀ j, j ≤ N → a j = (p j).eval d) :
      largeLeft a n = l.eval d := by
    simp [largeLeft, l, ha n (by omega)]
  have Hr {a : ℕ → ℕ} {d : ℕ} (ha : ∀ j, j ≤ N → a j = (p j).eval d) :
      largeRight a n = r.eval d := by
    simp [largeRight, r, ha (n - 1) (by omega), ha (n + 1) (by omega)]
  obtain ⟨hL, hR, hd, bound, hstrict⟩ := (cert n hn').2.2 hn
  rw [Hl mass] at hL
  rw [Hr mass] at hR
  rw [Hl packed, Hr packed] at hd
  rw [Hr packed] at bound
  rw [Hl packed, Hr packed] at hstrict
  have hh := eval_lt_of_packed_check hL hR (blockCompare_sound hd bound) hstrict (sub_nonneg.mpr hx)
  simp only [l, r, p, eval₂_mul, eval₂_pow, eval₂_C, Nat.coe_castRingHom, shiftedRow_eval] at hh
  have h := strictTuran_of_scaled_large (by omega : 0 < n) hh
  simpa only [Nat.cast_one, add_sub_cancel] using h

end OrdinaryDarcais
