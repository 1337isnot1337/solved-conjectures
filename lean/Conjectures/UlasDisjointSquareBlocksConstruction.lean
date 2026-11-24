import Conjectures.UlasDisjointSquareBlocksAffine
import Mathlib.NumberTheory.Harmonic.Bounds
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Multiset.Bind
import Mathlib.Tactic.FieldSimp

/-!
# Constructing a positive repeatable block count

This implements section 1 of the recorded Ulas argument. We use the
divisors `1, ..., n` of `n!`, where the harmonic sum exceeds the block
length. Denominator coordinates replace the proof's prime coordinates;
there are still only finitely many extra coordinates, independent of the
number of candidate blocks. The selected parity relation makes the entire
affine product square for every natural parameter.
-/

open Finset

namespace UlasDisjointSquareBlocks

/-- The harmonic sums supply enough distinct affine block candidates. -/
theorem exists_factorial_divisor_surplus (length : ℕ) :
    ∃ n : ℕ, 0 < n ∧ length * n.factorial <
      ∑ d : Fin n, n.factorial / (d.val + 1) := by
  let n : ℕ := ⌊Real.exp (length + 1)⌋₊
  have hh : (length : ℝ) < harmonic n := by
    have h := log_le_harmonic_floor (Real.exp (length + 1))
      (Real.exp_nonneg _)
    rw [Real.log_exp] at h
    dsimp [n]
    linarith
  have hn : 0 < n := by
    by_contra h
    have : n = 0 := by omega
    simp only [this, harmonic_zero, Rat.cast_zero] at hh
    exact (not_lt_of_ge (Nat.cast_nonneg length)) hh
  refine ⟨n, hn, ?_⟩
  have hsum : (↑(∑ d : Fin n, n.factorial / (d.val + 1)) : ℝ) =
      (n.factorial : ℝ) * harmonic n := by
    rw [Nat.cast_sum]
    calc
      (∑ d : Fin n, (↑(n.factorial / (d.val + 1)) : ℝ)) =
          ∑ d : Fin n, (n.factorial : ℝ) * (↑(d.val + 1))⁻¹ := by
        apply Finset.sum_congr rfl
        intro d _
        rw [Nat.cast_div_charZero (Nat.dvd_factorial (Nat.succ_pos _) d.isLt),
          div_eq_mul_inv]
      _ = (n.factorial : ℝ) * harmonic n := by
        rw [← Finset.mul_sum]
        congr 1
        simp only [harmonic, Rat.cast_sum, Rat.cast_inv, Rat.cast_natCast]
        rw [Finset.sum_range]
  have hfact : (0 : ℝ) < n.factorial := by exact_mod_cast Nat.factorial_pos n
  have h := mul_lt_mul_of_pos_left hh hfact
  rw [← hsum] at h
  norm_cast at h
  simpa [Nat.mul_comm] using h

/-- Candidate blocks are indexed by a divisor and a multiple of the length. -/
abbrev AffineCandidate (n m : ℕ) :=
  (d : Fin n) × Fin (n.factorial / (d.val + 1) * m)

/-- Coordinates consist of denominators and the common finite root interval. -/
abbrev AffineCoordinate (length n m : ℕ) := Fin n ⊕ Fin (length * n.factorial * m)

def candidateSlope {n m : ℕ} (x : AffineCandidate n m) : ℕ :=
  n.factorial / (x.1.val + 1)

def candidateOffset (length : ℕ) {n m : ℕ} (x : AffineCandidate n m) : ℕ :=
  length * x.2.val

theorem candidateSlope_pos {n m : ℕ} (x : AffineCandidate n m) :
    0 < candidateSlope x := by
  apply Nat.div_pos
  · exact Nat.le_of_dvd (Nat.factorial_pos n)
      (Nat.dvd_factorial (Nat.succ_pos _) x.1.isLt)
  · exact Nat.succ_pos _

theorem factorial_quotient_injective {n : ℕ} {d e : Fin n}
    (h : n.factorial / (d.val + 1) = n.factorial / (e.val + 1)) : d = e := by
  have hd : (d.val + 1) * (n.factorial / (d.val + 1)) = n.factorial :=
    Nat.mul_div_cancel' (Nat.dvd_factorial (Nat.succ_pos _) d.isLt)
  have he : (e.val + 1) * (n.factorial / (e.val + 1)) = n.factorial :=
    Nat.mul_div_cancel' (Nat.dvd_factorial (Nat.succ_pos _) e.isLt)
  have hpos : 0 < n.factorial / (e.val + 1) :=
    Nat.div_pos (Nat.le_of_dvd (Nat.factorial_pos n)
      (Nat.dvd_factorial (Nat.succ_pos _) e.isLt)) (Nat.succ_pos _)
  apply Fin.ext
  rw [h] at hd
  nlinarith

theorem candidateOffset_separated {length n m : ℕ}
    (x y : AffineCandidate n m) (hxy : x ≠ y)
    (hslope : candidateSlope x = candidateSlope y) :
    candidateOffset length x + length ≤ candidateOffset length y ∨
      candidateOffset length y + length ≤ candidateOffset length x := by
  obtain ⟨d, i⟩ := x
  obtain ⟨e, j⟩ := y
  have hde : d = e := factorial_quotient_injective hslope
  subst e
  have hij : i ≠ j := by intro h; subst j; exact hxy rfl
  have hij' : i.val ≠ j.val := by exact fun h => hij (Fin.ext h)
  dsimp [candidateOffset]
  rcases lt_or_gt_of_ne hij' with hij' | hji'
  · left
    nlinarith
  · right
    nlinarith

theorem coordinate_card_lt_candidate_card {length n : ℕ}
    (hsurplus : length * n.factorial < ∑ d : Fin n, n.factorial / (d.val + 1)) :
    Fintype.card (AffineCoordinate length n (n + 1)) <
      Fintype.card (AffineCandidate n (n + 1)) := by
  simp only [AffineCoordinate, AffineCandidate, Fintype.card_sum, Fintype.card_fin,
    Fintype.card_sigma]
  rw [← Finset.sum_mul]
  nlinarith

theorem candidate_root_bound {length n m : ℕ} (x : AffineCandidate n m)
    (i : Fin length) :
    0 < (x.1.val + 1) * (length * x.2.val + i.val + 1) ∧
      (x.1.val + 1) * (length * x.2.val + i.val + 1) ≤ length * n.factorial * m := by
  refine ⟨Nat.mul_pos (Nat.succ_pos _) (by omega), ?_⟩
  calc
    (x.1.val + 1) * (length * x.2.val + i.val + 1)
        ≤ (x.1.val + 1) * (length * (x.2.val + 1)) := by
          apply Nat.mul_le_mul_left
          nlinarith [i.isLt]
    _ ≤ (x.1.val + 1) * (length * (n.factorial / (x.1.val + 1) * m)) := by
          exact Nat.mul_le_mul_left _ (Nat.mul_le_mul_left _ x.2.isLt)
    _ = length * n.factorial * m := by
          have hd := Nat.mul_div_cancel'
            (Nat.dvd_factorial (Nat.succ_pos x.1.val) x.1.isLt)
          calc
            _ = length * ((x.1.val + 1) *
                (n.factorial / (x.1.val + 1))) * m := by ring
            _ = _ := by rw [hd]

def candidateRoot {length n m : ℕ} (x : AffineCandidate n m) (i : Fin length) :
    Fin (length * n.factorial * m) :=
  ⟨(x.1.val + 1) * (length * x.2.val + i.val + 1) - 1,
    by have h := candidate_root_bound x i; omega⟩

def candidateFactors {length n m : ℕ} (x : AffineCandidate n m) :
    Multiset (AffineCoordinate length n m) :=
  (Finset.univ : Finset (Fin length)).val.bind fun i =>
    {Sum.inr (candidateRoot x i), Sum.inl x.1}

def coordinateValue {length n m : ℕ} (t : ℕ) : AffineCoordinate length n m → ℚ
  | Sum.inl d => (d.val + 1 : ℚ)⁻¹
  | Sum.inr k => (n.factorial : ℚ) * t + k.val + 1

theorem coordinateValue_pair {length n m : ℕ} (t : ℕ)
    (x : AffineCandidate n m) (i : Fin length) :
    coordinateValue t (Sum.inr (candidateRoot x i)) *
      coordinateValue (length := length) (m := m) t (Sum.inl x.1) =
        (candidateSlope x * t + candidateOffset length x + i.val + 1 : ℕ) := by
  have hd : x.1.val + 1 ∣ n.factorial :=
    Nat.dvd_factorial (Nat.succ_pos _) x.1.isLt
  have hroot : (candidateRoot x i).val + 1 =
      (x.1.val + 1) * (length * x.2.val + i.val + 1) := by
    have h := candidate_root_bound x i
    dsimp [candidateRoot]
    omega
  have hrootQ : ((candidateRoot x i).val : ℚ) + 1 =
      (x.1.val + 1 : ℚ) * (length * x.2.val + i.val + 1) := by
    exact_mod_cast hroot
  dsimp [coordinateValue, candidateSlope, candidateOffset]
  push_cast
  rw [Nat.cast_div_charZero hd]
  calc
    ((n.factorial : ℚ) * t + (candidateRoot x i).val + 1) * (x.1.val + 1 : ℚ)⁻¹ =
        ((n.factorial : ℚ) * t +
          (x.1.val + 1) * (length * x.2.val + i.val + 1)) * (x.1.val + 1 : ℚ)⁻¹ := by
      rw [add_assoc, hrootQ]
    _ = _ := by
      have hnonzero : (x.1.val + 1 : ℚ) ≠ 0 := by positivity
      field_simp
      push_cast
      ring

theorem candidateFactors_encoding {length n m : ℕ} (t : ℕ)
    (x : AffineCandidate n m) :
    (blockProduct length (candidateSlope x * t + candidateOffset length x) : ℚ) =
      ((candidateFactors (length := length) x).map (coordinateValue t)).prod := by
  unfold candidateFactors
  rw [Multiset.map_bind, Multiset.prod_bind, Finset.prod_map_val]
  simp only [Multiset.insert_eq_cons, Multiset.map_cons, Multiset.map_singleton, Multiset.prod_cons,
    Multiset.prod_singleton, coordinateValue_pair]
  rw [blockProduct, Nat.cast_prod, Finset.prod_range]

/-- The unconditional affine-parity component of Ulas's argument: at every
positive length there is a fixed positive number of disjoint square-product
blocks that can be placed beyond any prescribed lower endpoint. -/
theorem exists_positive_repeatable_count (length : ℕ) (hlength : 0 < length) :
    ∃ count : ℕ, 0 < count ∧ Repeatable length count := by
  obtain ⟨n, _, hsurplus⟩ := exists_factorial_divisor_surplus length
  exact exists_repeatable_of_factor_encoding hlength
    (candidateSlope (n := n) (m := n + 1)) (candidateOffset length)
    candidateSlope_pos candidateOffset_separated
    candidateFactors coordinateValue candidateFactors_encoding
    (coordinate_card_lt_candidate_card hsurplus)

end UlasDisjointSquareBlocks
