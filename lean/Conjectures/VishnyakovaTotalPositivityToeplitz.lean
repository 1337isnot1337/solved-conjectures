module

public import Conjectures.VishnyakovaTotalPositivityMinors
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.RingTheory.PowerSeries.Basic

/-!
# Finite Toeplitz matrices of power-series coefficients

Finite upper triangular Toeplitz matrices preserve multiplication of formal
power series and their identity element. Their determinants are powers of the
constant coefficient. Alternating the coefficient signs is canceled entrywise
by the checkerboard matrix signs used in complementary-minor identities.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Matrix
open scoped BigOperators

def finiteToeplitz (a : ℕ → ℝ) (N : ℕ) : Matrix (Fin N) (Fin N) ℝ :=
  (toeplitz a).submatrix Fin.val Fin.val

theorem finiteToeplitz_apply (a : ℕ → ℝ) (N : ℕ) (i j : Fin N) :
    finiteToeplitz a N i j = if i.val ≤ j.val then a (j.val - i.val) else 0 := rfl

theorem finiteToeplitz_totallyNonneg {a : ℕ → ℝ}
    (ha : (toeplitz a).IsTotallyNonneg) (N : ℕ) :
    (finiteToeplitz a N).IsTotallyNonneg :=
  ha.submatrix (fun _ _ h => h) (fun _ _ h => h)

theorem finiteToeplitz_isUpperTriangular (a : ℕ → ℝ) (N : ℕ) :
    (finiteToeplitz a N).IsUpperTriangular := by
  intro i j hij
  have hij' : j.val < i.val := hij
  simp [finiteToeplitz_apply, Nat.not_le_of_gt hij']

theorem finiteToeplitz_det (a : ℕ → ℝ) (N : ℕ) :
    (finiteToeplitz a N).det = a 0 ^ N := by
  rw [Matrix.det_of_isUpperTriangular (finiteToeplitz_isUpperTriangular a N)]
  simp [finiteToeplitz_apply]

theorem finiteToeplitz_one (N : ℕ) :
    finiteToeplitz (fun n => PowerSeries.coeff n (1 : PowerSeries ℝ)) N = 1 := by
  ext i j
  by_cases hij : i = j
  · subst j
    simp [finiteToeplitz_apply, PowerSeries.coeff_one]
  · have hval : i.val ≠ j.val := fun h => hij (Fin.ext h)
    by_cases hle : i.val ≤ j.val
    · have hne : j.val - i.val ≠ 0 := by omega
      simp [finiteToeplitz_apply, PowerSeries.coeff_one, hij, hle, hne]
    · simp [finiteToeplitz_apply, hij, hle]

/-- Truncated upper triangular Toeplitz matrices respect formal-series
multiplication, with no convergence assumption. -/
theorem finiteToeplitz_mul (f g : PowerSeries ℝ) (N : ℕ) :
    finiteToeplitz (fun n => PowerSeries.coeff n (f * g)) N =
      finiteToeplitz (fun n => PowerSeries.coeff n f) N *
        finiteToeplitz (fun n => PowerSeries.coeff n g) N := by
  classical
  ext i j
  rw [Matrix.mul_apply]
  by_cases hij : i.val ≤ j.val
  · rw [finiteToeplitz_apply, ite_eq_left hij, PowerSeries.coeff_mul]
    let s : Finset (Fin N) :=
      Finset.univ.filter (fun k => i.val ≤ k.val ∧ k.val ≤ j.val)
    have hsum : (∑ k : Fin N,
        finiteToeplitz (fun n => PowerSeries.coeff n f) N i k *
          finiteToeplitz (fun n => PowerSeries.coeff n g) N k j) =
        ∑ k ∈ s, PowerSeries.coeff (k.val - i.val) f *
          PowerSeries.coeff (j.val - k.val) g := by
      dsimp [s]
      rw [Finset.sum_filter]
      apply Finset.sum_congr rfl
      intro k hk
      by_cases hik : i.val ≤ k.val <;> by_cases hkj : k.val ≤ j.val <;>
        simp [finiteToeplitz_apply, hik, hkj]
    rw [hsum]
    let phi : (p : ℕ × ℕ) → p ∈ Finset.antidiagonal (j.val - i.val) → Fin N :=
      fun p hp => ⟨i.val + p.1, by
        have hs := Finset.mem_antidiagonal.mp hp
        have hj := j.isLt
        omega⟩
    refine Finset.sum_bij phi ?_ ?_ ?_ ?_
    · intro p hp
      simp only [s, Finset.mem_filter, Finset.mem_univ, true_and]
      dsimp [phi]
      have hs := Finset.mem_antidiagonal.mp hp
      omega
    · intro p hp q hq heq
      have hfirst := congrArg Fin.val heq
      dsimp [phi] at hfirst
      have hp' := Finset.mem_antidiagonal.mp hp
      have hq' := Finset.mem_antidiagonal.mp hq
      apply Prod.ext <;> omega
    · intro k hk
      have hk' : i.val ≤ k.val ∧ k.val ≤ j.val := (Finset.mem_filter.mp hk).2
      refine ⟨(k.val - i.val, j.val - k.val), Finset.mem_antidiagonal.mpr ?_, ?_⟩
      · omega
      · apply Fin.ext
        dsimp [phi]
        omega
    · intro p hp
      have hs := Finset.mem_antidiagonal.mp hp
      change PowerSeries.coeff p.1 f * PowerSeries.coeff p.2 g =
        PowerSeries.coeff (i.val + p.1 - i.val) f *
          PowerSeries.coeff (j.val - (i.val + p.1)) g
      rw [show i.val + p.1 - i.val = p.1 by omega,
        show j.val - (i.val + p.1) = p.2 by omega]
  · rw [finiteToeplitz_apply, ite_eq_right hij]
    symm
    apply Finset.sum_eq_zero
    intro k hk
    by_cases hik : i.val ≤ k.val
    · have hkj : ¬ k.val ≤ j.val := by omega
      simp [finiteToeplitz_apply, hik, hkj]
    · simp [finiteToeplitz_apply, hik]

/-- Coefficient sign alternation and row/column checkerboard signs cancel. -/
theorem finiteToeplitz_checkerboard (b : ℕ → ℝ) (N : ℕ) (i j : Fin N) :
    (-1 : ℝ) ^ (i.val + j.val) *
        finiteToeplitz (fun n => (-1 : ℝ) ^ n * b n) N i j =
      finiteToeplitz b N i j := by
  by_cases hij : i.val ≤ j.val
  · simp only [finiteToeplitz_apply, ite_eq_left hij]
    have heq : i.val + j.val + (j.val - i.val) = 2 * j.val := by omega
    rw [← mul_assoc, ← pow_add, heq, pow_mul]
    norm_num
  · simp [finiteToeplitz_apply, hij]

end VishnyakovaTotalPositivity
