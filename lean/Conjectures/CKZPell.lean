import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! The positive inverse of the quadratic denominator in the Newton certificate. -/
namespace CKZPell

def pell : ℕ → ℕ
  | 0 => 1
  | 1 => 2
  | n+2 => 2*pell (n+1)+pell n

def series : PowerSeries ℤ := PowerSeries.mk (fun n => (pell n : ℤ))

theorem coeff_series (n : ℕ) : PowerSeries.coeff n series = (pell n : ℤ) := by
  simp [series]

theorem coeff_X_series_succ (n : ℕ) :
    PowerSeries.coeff (n+1) (PowerSeries.X*series) = (pell n : ℤ) := by
  simpa only [pow_one, coeff_series] using (PowerSeries.coeff_X_pow_mul series 1 n)

theorem coeff_X2_series_succ_succ (n : ℕ) :
    PowerSeries.coeff (n+2) (PowerSeries.X^2*series) = (pell n : ℤ) := by
  exact (PowerSeries.coeff_X_pow_mul series 2 n).trans (coeff_series n)

theorem series_equation :
    (1-2*PowerSeries.X-PowerSeries.X^2)*series = 1 := by
  have heq : (1-2*PowerSeries.X-PowerSeries.X^2)*series =
      series - 2*(PowerSeries.X*series) - PowerSeries.X^2*series := by ring
  rw [heq]
  ext n
  cases n with
  | zero => simp [series, pell, PowerSeries.coeff_zero_eq_constantCoeff_apply]
  | succ n =>
    cases n with
    | zero =>
      simp [map_sub, PowerSeries.coeff_ofNat_mul,
        PowerSeries.coeff_X_pow_mul', coeff_series, pell]
    | succ n =>
      simp only [map_sub, PowerSeries.coeff_ofNat_mul, coeff_X2_series_succ_succ, coeff_series,
        PowerSeries.coeff_one, show n+2 ≠ 0 by omega, ↓reduceIte]
      have hshift := coeff_X_series_succ (n+1)
      simp only [show n+1+1 = n+2 by omega] at hshift
      rw [hshift]
      simp only [pell, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
      ring

end CKZPell
