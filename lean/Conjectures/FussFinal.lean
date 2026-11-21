import Conjectures.FussSlot
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Algebra.BigOperators.Fin

namespace FussFinal
open Polynomial
open scoped BigOperators

noncomputable instance (m n k : ℕ) [Fact (0 < m)] [Fact (0 < n)] :
    Fintype (FussWords.PathsByNE m n k) :=
  Fintype.ofEquiv (Σ i : Fin (n+1), FussWords.DyckPaths m n k i.val)
    (FussWords.pathsByCountEquiv m n k).symm

/-- The literal sum over every Fuss--Dyck word with exactly k occurrences of NE. -/
noncomputable def actualEnumerator (m n k : ℕ) (hm : 0 < m) (hn : 0 < n) : ℝ[X] := by
  let : Fact (0 < m) := ⟨hm⟩
  let : Fact (0 < n) := ⟨hn⟩
  exact ∑ w : FussWords.PathsByNE m n k, X^(FussWords.countNNE w.val)

set_option backward.isDefEq.respectTransparency false in
theorem actualEnumerator_eq_pathPolynomial (m n k : ℕ) (hm : 0 < m) (hn : 0 < n) :
    actualEnumerator m n k hm hn = FussSlot.pathPolynomial m n k hm hn := by
  let : Fact (0 < m) := ⟨hm⟩
  let : Fact (0 < n) := ⟨hn⟩
  unfold actualEnumerator
  rw [← (FussWords.pathsByCountEquiv m n k).symm.sum_comp]
  rw [Fintype.sum_sigma]
  unfold FussSlot.pathPolynomial
  rw [← Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro i hi
  have hconst : ∀ w : FussWords.DyckPaths m n k i.val, FussWords.countNNE w.val = i.val :=
    fun w => w.property.2.2.2.2.2
  change (∑ w : FussWords.DyckPaths m n k i.val, X^(FussWords.countNNE w.val)) = _
  simp only [hconst, Finset.sum_const, Finset.card_univ, nsmul_eq_mul, Polynomial.C_eq_natCast]
  rfl

theorem actualEnumerator_eq_closedForm (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k ≤ n) :
    actualEnumerator m n k hm hn = FussCatalan.closedForm m n k := by
  rw [actualEnumerator_eq_pathPolynomial, FussSlot.pathPolynomial_eq_closedForm m n k hm hn hk hkn]

theorem fussCatalan_conjecture (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k ≤ n) : (actualEnumerator m n k hm hn).Splits := by
  rw [actualEnumerator_eq_closedForm m n k hm hn hk hkn]
  exact FussCatalan.closedForm_splits m n k

/-- The Fuss parameter changes the enumerator only by a positive scalar. -/
theorem actualEnumerator_scalar_reduction (m n k : ℕ) (hm : 0 < m) (hn : 0 < n)
    (hk : 0 < k) (hkn : k ≤ n) :
    actualEnumerator m n k hm hn =
      C (((n+1 : ℝ) * ((m*n+1).choose k : ℝ)) /
        ((m*n+1 : ℝ) * ((n+1).choose k : ℝ))) *
      actualEnumerator 1 n k (by omega) hn := by
  rw [actualEnumerator_eq_closedForm m n k hm hn hk hkn,
    actualEnumerator_eq_closedForm 1 n k (by omega) hn hk hkn]
  have hp : (0 : ℝ) < ((n+1).choose k : ℝ) := by exact_mod_cast Nat.choose_pos (by omega : k ≤ n+1)
  have hp' : ((n+1).choose k : ℝ) ≠ 0 := ne_of_gt hp
  have hn' : (n+1 : ℝ) ≠ 0 := by positivity
  have hm' : (m*n+1 : ℝ) ≠ 0 := by positivity
  unfold FussCatalan.closedForm
  by_cases h : n = k
  · subst k
    simp only [↓reduceIte, one_mul, Nat.cast_one]
    rw [← Polynomial.C_mul]
    congr 1
    field_simp
  · simp only [h, ↓reduceIte, one_mul, Nat.cast_one]
    rw [← mul_assoc, ← Polynomial.C_mul]
    congr 2
    field_simp

end FussFinal
