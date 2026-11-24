module

public import Conjectures.ChowCone
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.LinearCombination

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The ordered complex cone used for the Savage–Visontai threshold transform.
This file adds the nonvanishing and adjacent-sum facts needed for the internal-gap
path recurrence in `results/gessel-zhuang-pinnacle-gamma/PROOF.md`, Section 2.
The cone preservation itself is the already checked algebraic argument in
`ChowCone`; no root-preserving theorem is assumed.
-/

@[expose] public section

namespace GesselZhuang

open scoped BigOperators ComplexConjugate
open Chow

theorem cone_diagonal {z : ℂ} (hz : 0 ≤ z.im) (a : ℂ) :
    0 ≤ (a * conj a).im ∧ 0 ≤ (z * a * conj a).im := by
  rw [Complex.mul_conj, mul_assoc, Complex.mul_conj]
  simp only [Complex.ofReal_im, Complex.im_mul_ofReal]
  exact ⟨le_rfl, mul_nonneg hz (Complex.normSq_nonneg a)⟩

/-- Two ordered cone values cannot cancel in the strict upper half-plane. -/
theorem eq_zero_of_add_eq_zero {z a b : ℂ} (hz : 0 < z.im)
    (hab : 0 ≤ (z * a * conj b).im) (hsum : a + b = 0) : a = 0 := by
  have hb : b = -a := by linear_combination hsum
  rw [hb, map_neg, mul_neg, mul_assoc, Complex.mul_conj,
    Complex.neg_im, Complex.im_mul_ofReal] at hab
  apply Complex.normSq_eq_zero.mp
  nlinarith [Complex.normSq_nonneg a]

theorem add_ne_zero {z a b : ℂ} (hz : 0 < z.im)
    (hab : 0 ≤ (z * a * conj b).im) (ha : a ≠ 0) : a + b ≠ 0 :=
  fun h => ha (eq_zero_of_add_eq_zero hz hab h)

/-- A zero sum in an ordered cone has no nonzero summands. -/
theorem orderedCone_sum_eq_zero {n : ℕ} {z : ℂ} (hz : 0 < z.im)
    {f : Fin n → ℂ} (hf : OrderedCone z f) (hsum : ∑ i, f i = 0) :
    ∀ i, f i = 0 := by
  induction n with
  | zero => exact fun i => Fin.elim0 i
  | succ n ih =>
      have hpair : 0 ≤ (z * f 0 * conj (∑ i : Fin n, f i.succ)).im := by
        have h : 0 ≤ ∑ i : Fin n, (z * f 0 * conj (f i.succ)).im :=
          Finset.sum_nonneg fun i _ => (hf 0 i.succ (Fin.zero_le _)).2
        simpa only [map_sum, Finset.mul_sum, Complex.im_sum] using h
      have hzero : f 0 = 0 :=
        eq_zero_of_add_eq_zero hz hpair (by simpa only [Fin.sum_univ_succ] using hsum)
      have htail : ∀ i : Fin n, f i.succ = 0 := by
        apply ih (f := fun i => f i.succ)
        · intro i j hij
          exact hf i.succ j.succ (Fin.succ_le_succ_iff.mpr hij)
        · simpa only [Fin.sum_univ_succ, hzero, zero_add] using hsum
      exact Fin.cases hzero htail

theorem orderedCone_sum_ne_zero {n : ℕ} {z : ℂ} (hz : 0 < z.im)
    {f : Fin n → ℂ} (hf : OrderedCone z f) (h : ∃ i, f i ≠ 0) :
    ∑ i, f i ≠ 0 := by
  intro hsum
  obtain ⟨i, hi⟩ := h
  exact hi (orderedCone_sum_eq_zero hz hf hsum i)

/-- Every threshold value is nonzero, provided some input value is nonzero. -/
theorem cutValue_ne_zero {n : ℕ} {z : ℂ} (hz : 0 < z.im)
    {f : Fin n → ℂ} (hf : OrderedCone z f) (h : ∃ i, f i ≠ 0) (k : ℕ) :
    cutValue z f k ≠ 0 := by
  let s : Finset (Fin n) := Finset.univ.filter fun i => i.val < k
  let t : Finset (Fin n) := Finset.univ.filter fun i => ¬i.val < k
  let A := ∑ i ∈ s, f i
  let B := ∑ i ∈ t, f i
  have hpair : 0 ≤ (B * conj A).im := (orderedCone_sum_pair hf s t (by
    intro i hi j hj
    simp only [s, t, Finset.mem_filter, Finset.mem_univ, true_and] at hi hj
    exact Fin.le_iff_val_le_val.mpr (by omega))).1
  have hcut : cutValue z f k = z * A + B := by
    dsimp [cutValue, A, B, s, t]
    simp only [Finset.sum_filter, Finset.mul_sum, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    split_ifs <;> simp
  have hsum : ∑ i, f i = A + B := by
    dsimp [A, B, s, t]
    simp only [Finset.sum_filter, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro i _
    split_ifs <;> simp
  intro hzero
  have hB : B = -(z * A) := by rw [hcut] at hzero; linear_combination hzero
  rw [hB, neg_mul, mul_assoc, Complex.mul_conj, Complex.neg_im,
    Complex.im_mul_ofReal] at hpair
  have hA : A = 0 := Complex.normSq_eq_zero.mp (by
    nlinarith [Complex.normSq_nonneg A])
  apply orderedCone_sum_ne_zero hz hf h
  rw [hsum, hB, hA]
  simp

/-- Adjacent sums preserve the ordered cone, including overlapping pairs. -/
theorem orderedCone_adjacent {n : ℕ} {z : ℂ} (hz : 0 ≤ z.im)
    {f : Fin (n + 1) → ℂ} (hf : OrderedCone z f) :
    OrderedCone z (fun i : Fin n => f i.castSucc + f i.succ) := by
  intro i j hij
  by_cases heq : i = j
  · subst j
    exact cone_diagonal hz _
  have hstrict : i.val < j.val := by
    have := Fin.le_iff_val_le_val.mp hij
    have : i.val ≠ j.val := fun h => heq (Fin.ext h)
    omega
  have h00 := hf i.castSucc j.castSucc (by simpa using hij)
  have h01 := hf i.castSucc j.succ (by change i.val ≤ j.val + 1; omega)
  have h10 := hf i.succ j.castSucc (by change i.val + 1 ≤ j.val; omega)
  have h11 := hf i.succ j.succ (Fin.succ_le_succ_iff.mpr hij)
  constructor
  · simpa only [map_add, add_mul, mul_add, Complex.add_im] using
      add_nonneg (add_nonneg h00.1 h01.1) (add_nonneg h10.1 h11.1)
  · simpa only [map_add, add_mul, mul_add, Complex.add_im] using
      add_nonneg (add_nonneg h00.2 h10.2) (add_nonneg h01.2 h11.2)

theorem adjacent_ne_zero {n : ℕ} {z : ℂ} (hz : 0 < z.im)
    {f : Fin (n + 1) → ℂ} (hf : OrderedCone z f) (h : ∀ i, f i ≠ 0)
    (i : Fin n) : f i.castSucc + f i.succ ≠ 0 :=
  add_ne_zero hz (hf i.castSucc i.succ (by change i.val ≤ i.val + 1; omega)).2
    (h i.castSucc)

end GesselZhuang
