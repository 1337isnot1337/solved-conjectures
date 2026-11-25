import Conjectures.UlasDisjointSquareBlocksParity
import Mathlib.Algebra.Field.ZMod
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.Finsupp.LinearCombination
import Mathlib.NumberTheory.Chebyshev

/-!
# Binary squareclasses of blocks

The primes up to the largest entry suffice to test whether a product is a
square. Chebyshev's upper bound lets the number of available starts exceed
any fixed multiple of the number of these coordinates.
-/

open Finset Filter

namespace UlasDisjointSquareBlocks

abbrev PrimeCoord (X : ℕ) := ↥(Nat.primesLE X)
abbrev Squareclass (X : ℕ) := PrimeCoord X → ZMod 2

/-- Prime exponent parities, restricted to the primes at most `X`. -/
def squareclass (X n : ℕ) : Squareclass X := fun p => n.factorization p

@[simp] theorem squareclass_one (X : ℕ) : squareclass X 1 = 0 := by
  ext p
  simp [squareclass]

theorem squareclass_mul {X a b : ℕ} (ha : a ≠ 0) (hb : b ≠ 0) :
    squareclass X (a * b) = squareclass X a + squareclass X b := by
  ext p
  simp [squareclass, Nat.factorization_mul ha hb]

theorem squareclass_prod {ι : Type*} {X : ℕ} (s : Finset ι) (f : ι → ℕ)
    (hf : ∀ i ∈ s, f i ≠ 0) :
    squareclass X (∏ i ∈ s, f i) = ∑ i ∈ s, squareclass X (f i) := by
  ext p
  simp [squareclass, Nat.factorization_prod_apply hf]

theorem blockProduct_ne_zero (length a : ℕ) : blockProduct length a ≠ 0 := by
  exact prod_ne_zero_iff.mpr fun i _ => by omega

theorem factorization_block_eq_zero {length a X p : ℕ} (ha : a + length ≤ X)
    (hp : X < p) : (blockProduct length a).factorization p = 0 := by
  unfold blockProduct
  rw [Nat.factorization_prod_apply (fun i _ => by omega)]
  apply sum_eq_zero
  intro i hi
  apply Nat.factorization_eq_zero_of_lt
  have := mem_range.mp hi
  omega

theorem isSquare_prod_blocks_iff {ι : Type*} {X length : ℕ} (s : Finset ι)
    (start : ι → ℕ) (hs : ∀ i ∈ s, start i + length ≤ X) :
    IsSquare (∏ i ∈ s, blockProduct length (start i)) ↔
      ∑ i ∈ s, squareclass X (blockProduct length (start i)) = 0 := by
  rw [← squareclass_prod _ _ (fun i _ => blockProduct_ne_zero length (start i))]
  rw [Nat.isSquare_iff_even_factorization]
  constructor
  · intro h
    ext p
    exact (h p (Nat.prime_of_mem_primesLE p.prop)).natCast_zmod_two
  · intro h p hp
    by_cases hpX : p ≤ X
    · apply ZMod.natCast_eq_zero_iff_even.mp
      exact congrFun h (⟨p, Nat.mem_primesLE.mpr ⟨hpX, hp⟩⟩ : PrimeCoord X)
    · rw [Nat.factorization_prod_apply (fun i _ => blockProduct_ne_zero length (start i)),
        sum_eq_zero (fun i hi => factorization_block_eq_zero (hs i hi) (lt_of_not_ge hpX))]
      exact ⟨0, rfl⟩

/-- Over the binary field every vector in the span is a subset sum. -/
theorem exists_subset_sum_of_mem_span {ι V : Type*} [AddCommGroup V] [Module (ZMod 2) V]
    {s : Finset ι} {v : ι → V} {x : V}
    (hx : x ∈ Submodule.span (ZMod 2) (v '' (s : Set ι))) :
    ∃ t ⊆ s, ∑ i ∈ t, v i = x := by
  classical
  obtain ⟨c, hc⟩ := (Submodule.mem_span_image_finset_iff_exists_fun' (ZMod 2)).mp hx
  refine ⟨s.filter (fun i => c i ≠ 0), filter_subset _ _, ?_⟩
  rw [sum_filter, ← hc]
  apply sum_congr rfl
  intro i _
  by_cases hi : c i = 0
  · simp [hi]
  · simp [show c i = 1 from Fin.eq_one_of_ne_zero (c i) hi]

/-- The prime-coordinate budget is sublinear in any fixed linear cutoff. -/
theorem exists_prime_budget (A K B : ℕ) (hA : 0 < A) :
    ∃ n ≥ B, K * ((Nat.primesLE (A * n)).card + 1) < n := by
  have hbound := Chebyshev.eventually_primeCounting_le (ε := 1) (by norm_num)
  obtain ⟨C, hC⟩ := eventually_atTop.mp hbound
  let L : ℝ := (2 * (K : ℝ) + 1) * A * (Real.log 4 + 1)
  obtain ⟨n, hn⟩ := exists_nat_gt (max (max C (Real.exp L)) (max (B : ℝ) (2 * K + 1)))
  have hnC : C ≤ (n : ℝ) := by
    exact ((le_max_left _ _).trans (le_max_left _ _)).trans hn.le
  have hnL : Real.exp L < (n : ℝ) :=
    ((le_max_right _ _).trans (le_max_left _ _)).trans_lt hn
  have hnB : (B : ℝ) ≤ n :=
    ((le_max_left _ _).trans (le_max_right _ _)).trans hn.le
  have hnK : (2 * (K : ℝ) + 1) < n :=
    ((le_max_right _ _).trans (le_max_right _ _)).trans_lt hn
  have hn0 : 0 < (n : ℝ) := (Real.exp_pos _).trans hnL
  have hAn : (n : ℝ) ≤ (A : ℝ) * n := by
    have hA1 : (1 : ℝ) ≤ A := by exact_mod_cast hA
    nlinarith
  have hlog : L < Real.log ((A : ℝ) * n) :=
    (Real.log_lt_log (Real.exp_pos _) (hnL.trans_le hAn)).trans_le' (by simp)
  have hlog_pos : 0 < Real.log ((A : ℝ) * n) := by
    have : 0 ≤ L := by dsimp [L]; positivity
    linarith
  have hp := hC ((A : ℝ) * n) (hnC.trans hAn)
  rw [← Nat.cast_mul, Nat.floor_natCast] at hp
  rw [← Nat.cast_mul] at hlog hlog_pos
  rw [← Nat.primesLE_card_eq_primeCounting] at hp
  have hmul := (le_div_iff₀ hlog_pos).mp hp
  have hsmall : (2 * (K : ℝ) + 1) * (Nat.primesLE (A * n)).card ≤ n := by
    have hp0 : (0 : ℝ) ≤ (Nat.primesLE (A * n)).card := by positivity
    have hh := mul_le_mul_of_nonneg_left hlog.le hp0
    have hcoeff : 0 < (A : ℝ) * (Real.log 4 + 1) := by positivity
    apply le_of_mul_le_mul_right _ hcoeff
    push_cast at hh hmul
    dsimp [L] at hh
    nlinarith only [hh, hmul]
  refine ⟨n, by exact_mod_cast hnB, ?_⟩
  exact_mod_cast (show (K : ℝ) * ((Nat.primesLE (A * n)).card + 1) < n by
    have hp0 : (0 : ℝ) ≤ (Nat.primesLE (A * n)).card := by positivity
    nlinarith [mul_nonneg (show (0 : ℝ) ≤ K by positivity) hp0])

end UlasDisjointSquareBlocks
