import Mathlib.Basic.Real.Basic
import Mathlib.RingTheory.PowerSeries.Schroder
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.LinearCombination

/-! The uniform numerator inequalities for the three low-record comparisons. -/
namespace CKZ

def A1 (m : ℝ) := m*(m+47)
def B1 (m : ℝ) := -6*(m-3)
def A2 (m : ℝ) := 1282*m^4+4637*m^3+13106*m^2+11515*m+4740
def B2 (m : ℝ) := -220*m^4-467*m^3-1232*m^2+779*m+420
def A3 (m : ℝ) := 16*m^2+11*m+21
def B3 (m : ℝ) := -3*m^2-9

theorem numerator_positive {A B r s : ℝ} (hA : 0 < A) (hAB : 0 < A+B)
    (hr : 0 < r) (hrs : r ≤ s) : 0 < A*s+B*r := by
  have h1 : 0 ≤ A*(s-r) := mul_nonneg hA.le (sub_nonneg.mpr hrs)
  have h2 : 0 < (A+B)*r := mul_pos hAB hr
  nlinarith

theorem low1_numerator_positive (m r s : ℝ) (hm : 1 ≤ m) (hr : 0 < r) (hrs : r ≤ s) :
    0 < A1 m*s+B1 m*r := by
  apply numerator_positive _ _ hr hrs
  · dsimp [A1]; positivity
  · dsimp [A1, B1]; nlinarith [sq_nonneg (m-1)]

theorem low2_numerator_positive (m r s : ℝ) (hm : 1 ≤ m) (hr : 0 < r) (hrs : r ≤ s) :
    0 < A2 m*s+B2 m*r := by
  apply numerator_positive _ _ hr hrs
  · dsimp [A2]; positivity
  · have heq : A2 m+B2 m = 1062*m^4+4170*m^3+11874*m^2+12294*m+5160 := by
      dsimp [A2, B2]; ring
    rw [heq]
    positivity

theorem low3_numerator_positive (m r s : ℝ) (hm : 1 ≤ m) (hr : 0 < r) (hrs : r ≤ s) :
    0 < A3 m*s+B3 m*r := by
  apply numerator_positive _ _ hr hrs
  · dsimp [A3]; positivity
  · dsimp [A3, B3]; nlinarith [sq_nonneg m]

/-- R counts nonempty separable permutations; its coefficients are shifted large Schröder numbers. -/
def schroder (n : ℕ) : ℕ := match n with
  | 0 => 0
  | n+1 => Nat.largeSchroder n

theorem largeSchroder_pos (n : ℕ) : 0 < Nat.largeSchroder n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Nat.largeSchroder_succ]
    exact lt_of_lt_of_le ih (Nat.le_add_right _ _)

theorem schroder_pos (n : ℕ) (hn : 0 < n) : 0 < schroder n := by
  obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : n ≠ 0)
  exact largeSchroder_pos n

theorem schroder_monotone_succ (n : ℕ) (hn : 0 < n) : schroder n ≤ schroder (n+1) := by
  obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : n ≠ 0)
  simp only [schroder, Nat.largeSchroder_succ]
  exact Nat.le_add_right _ _

noncomputable def schroderSeries : PowerSeries ℝ :=
  PowerSeries.X * (PowerSeries.map (Nat.castRingHom ℝ)) PowerSeries.largeSchroderSeries

theorem schroderSeries_equation :
    schroderSeries = PowerSeries.X + PowerSeries.X*schroderSeries + schroderSeries^2 := by
  have h := congrArg (PowerSeries.map (Nat.castRingHom ℝ))
    PowerSeries.largeSchroderSeries_eq_one_add_X_mul_largeSchroderSeries_add_X_mul_largeSchroderSeries_sq
  simp only [map_add, map_mul, map_one, map_pow, PowerSeries.map_X] at h
  unfold schroderSeries
  linear_combination PowerSeries.X * h

theorem schroderSeries_coeff (n : ℕ) :
    PowerSeries.coeff n schroderSeries = (schroder n : ℝ) := by
  cases n with
  | zero => simp [schroderSeries, schroder, PowerSeries.coeff_zero_eq_constantCoeff_apply]
  | succ n =>
    unfold schroderSeries
    rw [← pow_one (PowerSeries.X : PowerSeries ℝ)]
    rw [PowerSeries.coeff_X_pow_mul, PowerSeries.coeff_map, PowerSeries.coeff_largeSchroderSeries]
    rfl

/-- The three low-record differences reduced using the Schröder quadratic. -/
theorem low1_reduction {R : Type*} [CommRing R] (t r : R) (h : r^2 = (1-t)*r-t) :
    t^2*(1+r)^3-t*(1+r) = t^2+7*t^2*r-t-t*r-6*t^3*r-4*t^3+t^4*r+t^4 := by
  linear_combination (4*t^2+r*t^2-t^3)*h

theorem low2_reduction {R : Type*} [CommRing R] (t r : R) (h : r^2 = (1-t)*r-t) :
    t^2*(1+r)^3-t^3*(1+r)^4*(1+2*r) =
      t^2+7*t^2*r-5*t^3-53*t^3*r+122*t^4*r+42*t^4-87*t^5*r-
        53*t^5+23*t^6*r+19*t^6-2*t^7*r-2*t^7 := by
  linear_combination (4*t^2+r*t^2-42*t^3-27*r*t^3-11*r^2*t^3-2*r^3*t^3+
    53*t^4+15*r*t^4+2*r^2*t^4-19*t^5-2*r*t^5+2*t^6)*h

theorem low3_reduction {R : Type*} [CommRing R] (t r : R) (h : r^2 = (1-t)*r-t) :
    t*(1+r)-t^2*r*(1+r)^2 = t+t*r-4*t^2*r+5*t^3*r+3*t^3-t^4*r-t^4 := by
  linear_combination (-3*t^2-r*t^2+t^3)*h

end CKZ
