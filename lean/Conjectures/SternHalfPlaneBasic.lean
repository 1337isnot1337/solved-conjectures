import Mathlib.Data.Nat.EvenOddRec
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Basic.Complex.Basic
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic

/-!
# Dilcher–Kidwai–Tomkins's Stern-polynomial half-plane conjecture

The actual Stern recurrence, its polynomial realization, and elementary
binary identities used by the recorded proof at
`results/stern-half-plane/PROOF.md`, commit
`6a2a2d00c8e352f0f07166fad96dcffa831f9552`.

These are foundations for the full all-index conjecture, not a complete
formalization or a separate conjecture result.
-/

namespace Conjectures.SternHalfPlane

open Finset

section Semiring

variable {R : Type*} [Semiring R]

/-- The consecutive Stern values, computed from the binary digits. -/
def sternPair (z : R) : ℕ → R × R :=
  Nat.evenOddRec (0, 1)
    (fun _ p => (z * p.1, p.1 + p.2))
    (fun _ p => (p.1 + p.2, z * p.2))

def stern (n : ℕ) (z : R) : R := (sternPair z n).1

@[simp] theorem sternPair_zero (z : R) : sternPair z 0 = (0, 1) := rfl

@[simp] theorem sternPair_even (n : ℕ) (z : R) :
    sternPair z (2 * n) =
      (z * (sternPair z n).1, (sternPair z n).1 + (sternPair z n).2) := by
  unfold sternPair
  rw [Nat.evenOddRec_even _ _ _ (by simp)]

@[simp] theorem sternPair_odd (n : ℕ) (z : R) :
    sternPair z (2 * n + 1) =
      ((sternPair z n).1 + (sternPair z n).2, z * (sternPair z n).2) := by
  unfold sternPair
  rw [Nat.evenOddRec_odd _ _ _ (by simp)]

@[simp] theorem stern_zero (z : R) : stern 0 z = 0 := rfl

@[simp] theorem stern_one (z : R) : stern 1 z = 1 := by
  simpa [stern] using congrArg Prod.fst (sternPair_odd 0 z)

theorem sternPair_second (n : ℕ) (z : R) : (sternPair z n).2 = stern (n + 1) z := by
  induction n using Nat.evenOddRec with
  | h0 => change (1 : R) = stern 1 z; rw [stern_one]
  | h_even n _ => simp [stern]
  | h_odd n ih =>
    rw [show 2 * n + 1 + 1 = 2 * (n + 1) by omega]
    simp only [sternPair_odd, stern, sternPair_even, ih]

@[simp] theorem stern_even (n : ℕ) (z : R) : stern (2 * n) z = z * stern n z := by
  simp [stern]

@[simp] theorem stern_odd (n : ℕ) (z : R) :
    stern (2 * n + 1) z = stern n z + stern (n + 1) z := by
  simp only [stern, sternPair_odd]
  rw [sternPair_second]
  rfl

theorem stern_pow_two (a : ℕ) (z : R) : stern (2 ^ a) z = z ^ a := by
  induction a with
  | zero => simp
  | succ a ih => simp only [pow_succ', stern_even, ih]

def geom (a : ℕ) (z : R) : R := ∑ i ∈ range a, z ^ i

@[simp] theorem geom_zero (z : R) : geom 0 z = 0 := by simp [geom]

@[simp] theorem geom_one (z : R) : geom 1 z = 1 := by simp [geom]

theorem geom_succ (a : ℕ) (z : R) : geom (a + 1) z = geom a z + z ^ a :=
  sum_range_succ _ _

theorem stern_pow_two_sub_one (a : ℕ) (z : R) :
    stern (2 ^ a - 1) z = geom a z := by
  induction a with
  | zero => simp
  | succ a ih =>
    have hpow : 0 < 2 ^ a := by positivity
    have he : 2 ^ (a + 1) - 1 = 2 * (2 ^ a - 1) + 1 := by
      rw [pow_succ]
      omega
    rw [he, stern_odd, ih, Nat.sub_add_cancel hpow, stern_pow_two, geom_succ]

theorem map_sternPair {S : Type*} [Semiring S] (f : R →+* S) (z : R) (n : ℕ) :
    ((f (sternPair z n).1), f (sternPair z n).2) = sternPair (f z) n := by
  induction n using Nat.evenOddRec with
  | h0 => simp
  | h_even n ih =>
    have h1 := congrArg Prod.fst ih
    have h2 := congrArg Prod.snd ih
    dsimp only at h1 h2
    simp only [sternPair_even, map_mul, map_add, h1, h2]
  | h_odd n ih =>
    have h1 := congrArg Prod.fst ih
    have h2 := congrArg Prod.snd ih
    dsimp only at h1 h2
    simp only [sternPair_odd, map_mul, map_add, h1, h2]

theorem map_stern {S : Type*} [Semiring S] (f : R →+* S) (z : R) (n : ℕ) :
    f (stern n z) = stern n (f z) :=
  congrArg Prod.fst (map_sternPair f z n)

end Semiring

/-- Integer-coefficient Stern polynomials, with the source's normalization. -/
noncomputable def sternPolynomial (n : ℕ) : Polynomial ℤ := stern n Polynomial.X

theorem eval_sternPolynomial (n : ℕ) (z : ℂ) :
    (sternPolynomial n).eval₂ (Int.castRingHom ℂ) z = stern n z := by
  simpa [sternPolynomial] using
    map_stern (Polynomial.eval₂RingHom (Int.castRingHom ℂ) z) Polynomial.X n

theorem stern_conj (n : ℕ) (z : ℂ) : star (stern n z) = stern n (star z) :=
  map_stern (starRingEnd ℂ) z n

theorem sternPair_positive {z : ℝ} (hz : 0 < z) (n : ℕ) :
    0 ≤ (sternPair z n).1 ∧ 0 < (sternPair z n).2 ∧
      (n ≠ 0 → 0 < (sternPair z n).1) := by
  induction n using Nat.evenOddRec with
  | h0 => simp
  | h_even n ih =>
    simp only [sternPair_even]
    exact ⟨mul_nonneg hz.le ih.1, add_pos_of_nonneg_of_pos ih.1 ih.2.1,
      fun hn => mul_pos hz (ih.2.2 (by omega))⟩
  | h_odd n ih =>
    simp only [sternPair_odd]
    have h := add_pos_of_nonneg_of_pos ih.1 ih.2.1
    exact ⟨h.le, mul_pos hz ih.2.1, fun _ => h⟩

theorem stern_pos {z : ℝ} (hz : 0 < z) {n : ℕ} (hn : 0 < n) :
    0 < stern n z := (sternPair_positive hz n).2.2 (by omega)

end Conjectures.SternHalfPlane
