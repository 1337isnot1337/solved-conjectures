import Conjectures.LonelinessHyperplaneSignedBoxCounting
import Mathlib.Logic.Equiv.Prod
import Mathlib.Logic.Equiv.Sum

/-! Exact counts for an arbitrary single integer relation in a closed
box. Zero coefficients contribute free coordinates; they are not
discarded by a full-support assumption. Every formula holds at N = 0
as well as at positive side lengths. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open Polynomial
open scoped BigOperators

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

abbrev normalZeros (m : ι → ℤ) := {i : ι // m i = 0}

abbrev normalSupport (m : ι → ℤ) := {i : ι // m i ≠ 0}

theorem support_pairing_sum (m : ι → ℤ) (v : ι → ℤ) :
    (∑ i : normalSupport m, m i.1 * v i.1) = ∑ i, m i * v i := by
  have hzero : (∑ i : normalZeros m, m i.1 * v i.1) = 0 := by
    apply Finset.sum_eq_zero
    intro i _
    rw [i.2, zero_mul]
  have hsplit := Fintype.sum_subtype_add_sum_subtype
    (fun i => m i = 0) (fun i => m i * v i)
  rw [hzero, zero_add] at hsplit
  exact hsplit

/-- The zero-normal coordinates are independent factors of the actual
solution type. -/
def closedRelationBox_supportEquiv (m : ι → ℤ) (N : ℕ) :
    closedRelationBox m N ≃
      (normalZeros m → Fin (N + 1)) ×
        closedRelationBox (fun i : normalSupport m => m i.1) N := by
  let e := Equiv.piEquivPiSubtypeProd (fun i => m i = 0)
    (fun _ : ι => Fin (N + 1))
  let e' : closedRelationBox m N ≃
      {p : (normalZeros m → Fin (N + 1)) × (normalSupport m → Fin (N + 1)) //
        (∑ i : normalSupport m, m i.1 * (p.2 i : ℕ)) = 0} :=
    e.subtypeEquiv (fun v => by
      change (∑ i, m i * (v i : ℕ)) = 0 ↔
        (∑ i : normalSupport m, m i.1 * (v i.1 : ℕ)) = 0
      rw [support_pairing_sum m (fun i => ((v i : ℕ) : ℤ))])
  refine e'.trans
    { toFun := fun p => ⟨p.1.1, ⟨p.1.2, p.2⟩⟩
      invFun := fun p => ⟨⟨p.1, p.2.1⟩, p.2.2⟩
      left_inv := ?_
      right_inv := ?_ }
  · rintro ⟨⟨z, v⟩, h⟩
    rfl
  · rintro ⟨z, v⟩
    rfl

theorem closedRelationBox_card_factor (m : ι → ℤ) (N : ℕ) :
    Nat.card (closedRelationBox m N) =
      (N + 1) ^ Fintype.card (normalZeros m) *
        Nat.card (closedRelationBox (fun i : normalSupport m => m i.1) N) := by
  rw [Nat.card_congr (closedRelationBox_supportEquiv m N), Nat.card_prod, Nat.card_fun]
  simp only [Nat.card_eq_fintype_card, Fintype.card_fin]

theorem normal_card_split (m : ι → ℤ) :
    Fintype.card (normalZeros m) + Fintype.card (normalSupport m) = Fintype.card ι := by
  simpa only [Fintype.card_sum] using
    Fintype.card_congr (Equiv.sumCompl (fun i => m i = 0))

/-- A nonzero normal may have zero coordinates. The degree bound is
still the expected one-codimensional bound. -/
theorem closedRelationBox_quasipolynomial_of_nonzero
    (m : ι → ℤ) (hm : m ≠ 0) :
    ∃ M : ℕ, 0 < M ∧ ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (closedRelationBox m (M * n + r)) : ℚ) = (P r).eval (n : ℚ) := by
  classical
  have hsupport : ∃ i, m i ≠ 0 := by
    by_contra h
    apply hm
    funext i
    by_contra hi
    exact h ⟨i, hi⟩
  obtain ⟨i, hi⟩ := hsupport
  letI : Nonempty (normalSupport m) := ⟨⟨i, hi⟩⟩
  obtain ⟨M, hM, P, hdegree, heval⟩ :=
    closedRelationBox_quasipolynomial_of_full_support
      (fun j : normalSupport m => m j.1) (fun j => j.2)
  let L : Fin M → ℚ[X] := fun r => C (M : ℚ) * X + C (((r : ℕ) : ℚ) + 1)
  let Q : Fin M → ℚ[X] := fun r => L r ^ Fintype.card (normalZeros m) * P r
  have hL : ∀ r, (L r).natDegree ≤ 1 := by
    intro r
    apply natDegree_add_le_of_degree_le
    · exact (natDegree_C_mul_le _ _).trans (by simp only [natDegree_X])
    · simp only [natDegree_C]
      omega
  refine ⟨M, hM, Q, ?_, ?_⟩
  · intro r
    have hp : (L r ^ Fintype.card (normalZeros m)).natDegree ≤
        Fintype.card (normalZeros m) := by
      simpa only [Nat.mul_one] using
        natDegree_pow_le_of_le (Fintype.card (normalZeros m)) (hL r)
    have hq := natDegree_mul_le_of_le hp (hdegree r)
    have hsplit := normal_card_split m
    have hpos : 0 < Fintype.card (normalSupport m) := Fintype.card_pos
    exact hq.trans (by omega)
  · intro r n
    rw [closedRelationBox_card_factor, Nat.cast_mul, Nat.cast_pow, heval r n]
    simp only [Q, L, eval_mul, eval_pow, eval_add, eval_C, eval_X,
      Nat.cast_add, Nat.cast_mul, Nat.cast_one]
    ring

def closedRelationBox_zero_equiv (N : ℕ) :
    closedRelationBox (0 : ι → ℤ) N ≃ (ι → Fin (N + 1)) where
  toFun v := v.1
  invFun v := ⟨v, by simp⟩
  left_inv v := Subtype.ext rfl
  right_inv _ := rfl

theorem closedRelationBox_zero_card (N : ℕ) :
    Nat.card (closedRelationBox (0 : ι → ℤ) N) = (N + 1) ^ Fintype.card ι := by
  rw [Nat.card_congr (closedRelationBox_zero_equiv N), Nat.card_fun]
  simp only [Nat.card_eq_fintype_card, Fintype.card_fin]

/-- The all-zero normal is included. Its degree is the ambient
dimension; every other normal has degree at most one less. -/
theorem closedRelationBox_quasipolynomial (m : ι → ℤ) :
    ∃ M : ℕ, 0 < M ∧ ∃ P : Fin M → ℚ[X],
      (∀ r, (P r).natDegree ≤ if m = 0 then Fintype.card ι else Fintype.card ι - 1) ∧
      ∀ (r : Fin M) (n : ℕ),
        (Nat.card (closedRelationBox m (M * n + r)) : ℚ) = (P r).eval (n : ℚ) := by
  classical
  by_cases hm : m = 0
  · subst m
    refine ⟨1, by omega, fun _ => (X + 1) ^ Fintype.card ι, ?_, ?_⟩
    · intro r
      simp only [if_pos rfl]
      have hlinear : ((X : ℚ[X]) + 1).natDegree ≤ 1 :=
        natDegree_add_le_of_degree_le (by simp only [natDegree_X])
          (by simp only [natDegree_one]; omega)
      simpa only [Nat.mul_one] using natDegree_pow_le_of_le (Fintype.card ι) hlinear
    · intro r n
      have hr : (r : ℕ) = 0 := by omega
      rw [hr, one_mul, add_zero, closedRelationBox_zero_card]
      simp only [Nat.cast_pow, Nat.cast_add, Nat.cast_one, eval_pow, eval_add,
        eval_X, eval_one]
  · obtain ⟨M, hM, P, hdegree, heval⟩ := closedRelationBox_quasipolynomial_of_nonzero m hm
    exact ⟨M, hM, P, by simpa only [if_neg hm] using hdegree, heval⟩

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
