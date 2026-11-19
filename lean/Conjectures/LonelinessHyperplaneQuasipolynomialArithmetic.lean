import Mathlib.RingTheory.Polynomial.Pochhammer
import Mathlib.Data.Finsupp.Multiset
import Mathlib.Data.Sym.NatCard
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! Polynomial formulas for shifted weak-composition counts. The
offset bound is what makes these formulas valid at every nonnegative
argument, including arguments before the offset. This is an arithmetic
component for lattice counting, not a general Ehrhart theorem. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

def shiftedChoosePolynomial (d a : ℕ) : ℚ[X] :=
  C ((d.factorial : ℚ)⁻¹) *
    (descPochhammer ℚ d).comp (X + C (d : ℚ) - C (a : ℚ))

theorem shiftedChoosePolynomial_natDegree_le (d a : ℕ) :
    (shiftedChoosePolynomial d a).natDegree ≤ d := by
  unfold shiftedChoosePolynomial
  apply (natDegree_C_mul_le _ _).trans
  apply natDegree_comp_le.trans
  rw [descPochhammer_natDegree]
  have hlinear : (X + C (d : ℚ) - C (a : ℚ)).natDegree ≤ 1 := by
    calc
      _ ≤ max (X + C (d : ℚ)).natDegree (C (a : ℚ)).natDegree := natDegree_sub_le _ _
      _ = 1 := by rw [natDegree_X_add_C, natDegree_C]; decide
  simpa only [Nat.mul_one] using Nat.mul_le_mul_left d hlinear

theorem shiftedChoosePolynomial_eval (d a n : ℕ) (ha : a ≤ d) :
    (shiftedChoosePolynomial d a).eval (n : ℚ) =
      if a ≤ n then ((n - a + d).choose d : ℚ) else 0 := by
  simp only [shiftedChoosePolynomial, eval_mul, eval_C, eval_comp,
    eval_sub, eval_add, eval_X]
  by_cases han : a ≤ n
  · rw [ite_eq_left han, Nat.cast_choose_eq_descPochhammer_div]
    have he : (n : ℚ) + (d : ℚ) - (a : ℚ) = ((n - a + d : ℕ) : ℚ) := by
      rw [Nat.cast_add, Nat.cast_sub han]
      ring
    rw [he, div_eq_mul_inv, mul_comm]
  · rw [ite_eq_right han]
    have hna : n < a := lt_of_not_ge han
    have hbound : a ≤ n + d := by omega
    have hlt : n + d - a < d := by omega
    have he : (n : ℚ) + (d : ℚ) - (a : ℚ) = ((n + d - a : ℕ) : ℚ) := by
      rw [Nat.cast_sub hbound, Nat.cast_add]
    rw [he, descPochhammer_eval_coe_nat_of_lt hlt, mul_zero]

variable {ι : Type*} [Fintype ι] [Nonempty ι]

theorem weakComposition_card (n : ℕ) :
    Nat.card {q : ι → ℕ // ∑ i, q i = n} =
      (n + (Fintype.card ι - 1)).choose (Fintype.card ι - 1) := by
  classical
  rw [← Nat.card_congr (Sym.equivNatSumOfFintype ι n),
    Sym.natCard_sym_eq_choose, Nat.card_eq_fintype_card]
  have hk : 0 < Fintype.card ι := Fintype.card_pos
  have hn : n ≤ Fintype.card ι + n - 1 := by omega
  rw [Nat.choose_symm hn]
  congr 1 <;> omega

def shiftedWeakComposition (M T n : ℕ) : Type _ :=
  {q : ι → ℕ // M * (∑ i, q i) + T = n}

theorem shiftedWeakComposition_finite (M T n : ℕ) (hM : 0 < M) :
    Finite (shiftedWeakComposition (ι := ι) M T n) := by
  classical
  have hbound : ∀ q : shiftedWeakComposition (ι := ι) M T n, ∀ i, q.1 i ≤ n := by
    intro q i
    have hi : q.1 i ≤ ∑ j, q.1 j :=
      Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
    have hmul := Nat.mul_le_mul_right (∑ j, q.1 j) (show 1 ≤ M from hM)
    have hq := q.2
    omega
  let F : shiftedWeakComposition (ι := ι) M T n → (ι → Fin (n + 1)) :=
    fun q i => ⟨q.1 i, by have hi := hbound q i; omega⟩
  apply Finite.of_injective F
  intro q q' hq
  apply Subtype.ext
  funext i
  exact congrArg Fin.val (congrFun hq i)

theorem shiftedWeakComposition_card
    (M T n : ℕ) (hM : 0 < M) :
    Nat.card (shiftedWeakComposition (ι := ι) M T n) =
      if T ≤ n ∧ M ∣ n - T then
        ((n - T) / M + (Fintype.card ι - 1)).choose (Fintype.card ι - 1)
      else 0 := by
  classical
  by_cases hvalid : T ≤ n ∧ M ∣ n - T
  · rw [ite_eq_left hvalid]
    have heq : ∀ q : ι → ℕ,
        M * (∑ i, q i) + T = n ↔ ∑ i, q i = (n - T) / M := by
      intro q
      constructor
      · intro hq
        have hsub : M * (∑ i, q i) = n - T := Nat.eq_sub_of_add_eq hq
        rw [← hsub, Nat.mul_div_cancel_left _ hM]
      · intro hq
        rw [hq, Nat.mul_div_cancel' hvalid.2, Nat.sub_add_cancel hvalid.1]
    rw [shiftedWeakComposition, Nat.card_congr (Equiv.subtypeEquivRight heq)]
    exact weakComposition_card ((n - T) / M)
  · rw [ite_eq_right hvalid]
    letI : IsEmpty (shiftedWeakComposition (ι := ι) M T n) := ⟨by
      rintro ⟨q, hq⟩
      apply hvalid
      refine ⟨by omega, ?_⟩
      rw [← hq, Nat.add_sub_cancel]
      exact dvd_mul_right _ _⟩
    exact Nat.card_of_isEmpty

/-- On every arithmetic progression, the shifted composition count
agrees with a rational polynomial of degree at most one below the
number of coordinates. The offset is strictly below one period per
coordinate; this condition avoids an eventual-only conclusion. -/
theorem shiftedWeakComposition_polynomial_on_progressions
    (M T : ℕ) (hM : 0 < M) (hT : T < Fintype.card ι * M) :
    ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (shiftedWeakComposition (ι := ι) M T (M * n + r)) : ℚ) =
          (P r).eval (n : ℚ) := by
  classical
  let a := T / M
  let d := Fintype.card ι - 1
  have ha : a ≤ d := by
    have hdiv : T / M < Fintype.card ι := (Nat.div_lt_iff_lt_mul hM).mpr hT
    dsimp only [a, d]
    omega
  let P : Fin M → ℚ[X] := fun r =>
    if T % M = (r : ℕ) then shiftedChoosePolynomial d a else 0
  refine ⟨P, ?_, ?_⟩
  · intro r
    dsimp only [P]
    split_ifs
    · exact shiftedChoosePolynomial_natDegree_le d a
    · simp only [natDegree_zero]
      exact Nat.zero_le _
  · intro r n
    by_cases hr : T % M = (r : ℕ)
    · have hdecomp : T = M * a + (r : ℕ) := by
        have h := Nat.mod_add_div T M
        rw [hr] at h
        dsimp only [a]
        omega
      have heq : ∀ q : ι → ℕ,
          M * (∑ i, q i) + T = M * n + (r : ℕ) ↔ (∑ i, q i) + a = n := by
        intro q
        rw [hdecomp]
        constructor <;> intro h
        · nlinarith
        · nlinarith
      dsimp only [P]
      rw [ite_eq_left hr, shiftedChoosePolynomial_eval d a n ha]
      by_cases han : a ≤ n
      · rw [ite_eq_left han]
        have hsum : ∀ q : ι → ℕ,
            M * (∑ i, q i) + T = M * n + (r : ℕ) ↔ ∑ i, q i = n - a := by
          intro q
          rw [heq q]
          omega
        have hcard : Nat.card (shiftedWeakComposition (ι := ι) M T (M * n + r)) =
            (n - a + d).choose d := by
          rw [shiftedWeakComposition, Nat.card_congr (Equiv.subtypeEquivRight hsum)]
          exact weakComposition_card (n - a)
        exact congrArg (fun x : ℕ => (x : ℚ)) hcard
      · rw [ite_eq_right han]
        letI : IsEmpty (shiftedWeakComposition (ι := ι) M T (M * n + r)) := ⟨by
          rintro ⟨q, hq⟩
          have h := (heq q).mp hq
          omega⟩
        simp only [Nat.card_of_isEmpty, Nat.cast_zero]
    · have hnone : IsEmpty (shiftedWeakComposition (ι := ι) M T (M * n + r)) := ⟨by
        rintro ⟨q, hq⟩
        apply hr
        have hmod := congrArg (fun x : ℕ => x % M) hq
        simpa only [Nat.add_mod, Nat.mul_mod_right, zero_add, Nat.mod_mod,
          Nat.mod_eq_of_lt r.isLt] using hmod⟩
      letI := hnone
      simp only [P, ite_eq_right hr, eval_zero, Nat.card_of_isEmpty, Nat.cast_zero]

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
