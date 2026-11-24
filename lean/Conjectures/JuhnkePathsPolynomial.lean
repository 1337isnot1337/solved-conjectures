import Conjectures.JuhnkePathsRuns
import Mathlib.Basic.Real.Basic
import Mathlib.Algebra.Polynomial.Coeff

/-!
# Juhnke's conjecture

The counting polynomial of literal positive-step paths is the source's
unit-word run expansion. All optional cuts are counted, without imposing a
diagonal restriction or any coherence condition.
-/

namespace Juhnke

open scoped BigOperators
open Polynomial

/-- A superset is uniquely obtained by adjoining a subset of the complement. -/
def cutSupersetEquiv {α : Type*} [Fintype α] [DecidableEq α] (s : Finset α) :
    {t : Finset α // s ⊆ t} ≃ (sᶜ.powerset) where
  toFun t := ⟨t.val \ s, by
    rw [Finset.mem_powerset]
    intro a ha
    exact Finset.mem_compl.mpr (Finset.mem_sdiff.mp ha).2⟩
  invFun u := ⟨s ∪ u.val, Finset.subset_union_left⟩
  left_inv t := by
    apply Subtype.ext
    exact Finset.union_sdiff_of_subset t.property
  right_inv u := by
    apply Subtype.ext
    have hu := Finset.mem_powerset.mp u.property
    ext a
    have ha : a ∈ u.val → a ∉ s := fun h ↦ Finset.mem_compl.mp (hu h)
    simp only [Finset.mem_sdiff, Finset.mem_union]
    tauto

theorem cutSupersetEquiv_symm_card {α : Type*} [Fintype α] [DecidableEq α]
    (s : Finset α) (u : sᶜ.powerset) :
    ((cutSupersetEquiv s).symm u).val.card = s.card + u.val.card := by
  apply Finset.card_union_of_disjoint
  rw [Finset.disjoint_left]
  intro a ha hu
  exact (Finset.mem_compl.mp ((Finset.mem_powerset.mp u.property) hu)) ha

/-- The independent optional-cut identity, over any commutative semiring. -/
theorem cutSuperset_generating {R α : Type*} [CommSemiring R] [Fintype α]
    [DecidableEq α] (s : Finset α) (z : R) :
    (∑ t : {t : Finset α // s ⊆ t}, z ^ (t.val.card + 1)) =
      z ^ (s.card + 1) * (1 + z) ^ (Fintype.card α - s.card) := by
  classical
  rw [← Equiv.sum_comp (cutSupersetEquiv s).symm]
  simp_rw [cutSupersetEquiv_symm_card]
  have hexp (u : sᶜ.powerset) : s.card + u.val.card + 1 = s.card + 1 + u.val.card := by
    omega
  simp_rw [hexp, pow_add]
  rw [← Finset.mul_sum]
  rw [← Finset.sum_subtype sᶜ.powerset (fun _ ↦ Iff.rfl) (fun u ↦ z ^ u.card)]
  have hsum : (∑ u ∈ sᶜ.powerset, z ^ u.card) = (1 + z) ^ sᶜ.card := by
    simpa using (Finset.prod_one_add (s := sᶜ) (f := fun _ : α ↦ z)).symm
  rw [hsum, Finset.card_compl]

/-- Count literal paths of total length `N`, ending at `(a,N-a)`, by their step count. -/
noncomputable def pathPolynomial (N a : ℕ) : ℝ[X] :=
  ∑ p : LiteralPath N, if p.east = a then X ^ p.stepCount else 0

/-- The exact number of paths with the indicated endpoint and number of steps. -/
noncomputable def pathCount (N a k : ℕ) : ℕ :=
  Fintype.card {p : LiteralPath N // p.east = a ∧ p.stepCount = k}

/-- Count actual unit words with the indicated east count and number of maximal runs. -/
noncomputable def unitWordCount (N a r : ℕ) : ℕ :=
  Fintype.card {w : Fin N → Bool // eastCount w = a ∧ runCount w = r}

theorem unitWordCount_zero {N : ℕ} (hN : 0 < N) (a : ℕ) :
    unitWordCount N a 0 = 0 := by
  classical
  unfold unitWordCount
  apply Fintype.card_eq_zero_iff.mpr
  refine ⟨fun w ↦ ?_⟩
  have h := runCount_pos hN w.val
  rw [w.property.2] at h
  omega

theorem unitWordCount_one {N a : ℕ} (ha : 0 < a) (haN : a < N) :
    unitWordCount N a 1 = 0 := by
  classical
  unfold unitWordCount
  apply Fintype.card_eq_zero_iff.mpr
  refine ⟨fun w ↦ ?_⟩
  have h := eastCount_of_one_run (by omega : 0 < N) w.val w.property.2
  rw [w.property.1] at h
  omega

theorem pathPolynomial_coeff (N a k : ℕ) :
    (pathPolynomial N a).coeff k = (pathCount N a k : ℝ) := by
  classical
  simp only [pathPolynomial, finsetSum_coeff]
  unfold pathCount
  rw [Fintype.card_subtype, Finset.card_eq_sum_ones, Finset.sum_filter, Nat.cast_sum]
  apply Finset.sum_congr rfl
  intro p _
  by_cases ha : p.east = a <;> by_cases hk : p.stepCount = k <;>
    simp [ha, hk, coeff_X_pow, eq_comm]
  exact Ne.symm hk

theorem cutsToLiteralPath_stepCount {N : ℕ} (hN : 0 < N) (p : CutPath N) :
    (cutsToLiteralPath p).stepCount = p.2.val.card + 1 :=
  compositionCutsEquiv_symm_length hN p.2.val

theorem cutsToLiteralPath_east {N : ℕ} (p : CutPath N) :
    (cutsToLiteralPath p).east = eastCount p.1 := by
  rw [LiteralPath.east_eq_word_eastCount, cutsToLiteralPath_word]

/-- Expanding a literal path into unit edges yields exactly the source's run polynomial. -/
theorem pathPolynomial_runExpansion {N : ℕ} (hN : 0 < N) (a : ℕ) :
    pathPolynomial N a =
      ∑ w : Fin N → Bool, if eastCount w = a then
        X ^ runCount w * (1 + X) ^ (N - runCount w) else 0 := by
  classical
  unfold pathPolynomial
  rw [← Equiv.sum_comp (literalPathCutsEquiv N).symm]
  change (∑ p : CutPath N,
    if (cutsToLiteralPath p).east = a then X ^ (cutsToLiteralPath p).stepCount else 0) = _
  simp_rw [cutsToLiteralPath_east, cutsToLiteralPath_stepCount hN]
  rw [Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro w _
  by_cases hw : eastCount w = a
  · simp only [hw, ite_true]
    rw [cutSuperset_generating, runCount_of_pos hN]
    congr 2
    simp only [Fintype.card_fin]
    omega
  · simp [hw]

/-- Group the exact unit-word expansion by the number of maximal direction runs. -/
theorem pathPolynomial_sum_runCounts {N : ℕ} (hN : 0 < N) (a : ℕ) :
    pathPolynomial N a = ∑ r ∈ Finset.range (N + 1),
      C (unitWordCount N a r : ℝ) * X ^ r * (1 + X) ^ (N - r) := by
  classical
  rw [pathPolynomial_runExpansion hN]
  let s : Finset (Fin N → Bool) := Finset.univ.filter fun w ↦ eastCount w = a
  change (∑ w : Fin N → Bool, if eastCount w = a then
    X ^ runCount w * (1 + X) ^ (N - runCount w) else 0) = _
  rw [← Finset.sum_filter]
  change (∑ w ∈ s, X ^ runCount w * (1 + X) ^ (N - runCount w)) = _
  have hm : ∀ w ∈ s, runCount w ∈ Finset.range (N + 1) := by
    intro w _
    exact Finset.mem_range.mpr (Nat.lt_succ_of_le (runCount_le w))
  rw [← Finset.sum_fiberwise_of_maps_to' hm
    (fun r ↦ (X : ℝ[X]) ^ r * (1 + X) ^ (N - r))]
  apply Finset.sum_congr rfl
  intro r _
  have hc : (s.filter fun w ↦ runCount w = r).card = unitWordCount N a r := by
    unfold unitWordCount
    rw [Fintype.card_subtype]
    congr 1
    ext w
    simp [s]
  rw [Finset.sum_const, hc]
  simp [nsmul_eq_mul, mul_assoc]

end Juhnke
