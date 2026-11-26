import Mathlib.FieldTheory.Finite.GaloisField
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure

/-! # Frobenius labels for the roots of a regular specialization

Indexing by the seed's geometric roots packages its factor degrees as cycles of
Frobenius. A separable polynomial with the same permutation on its roots is root-free
over the ground field if that permutation has no fixed point.
-/

namespace Conjectures.AsgarliGhiocaYip

open Polynomial Finset

variable {K E : Type*} [Field K] [Fintype K] [Field E] [Algebra K E]

private theorem mem_base_of_pow_card {x : E} (hx : x ^ Fintype.card K = x) :
    x ∈ (algebraMap K E).range := by
  let p : K[X] := X ^ Fintype.card K - X
  have hsplit : p.Splits := by simpa [p, Nat.card_eq_fintype_card] using
    (Polynomial.splits_X_pow_nat_card_sub_X (K := K))
  apply hsplit.mem_range_of_isRoot (FiniteField.X_pow_card_sub_X_ne_zero K Fintype.one_lt_card)
  simp [p, IsRoot.def, hx]

/-- The permutation induced by the cardinality-power Frobenius on the distinct roots. -/
noncomputable def rootPermutation [Algebra.IsAlgebraic K E] (p : K[X]) :
    Equiv.Perm (p.rootSet E) := by
  let F := FiniteField.frobeniusAlgEquivOfAlgebraic K E
  have mem (e : E ≃ₐ[K] E) {x : E} (h : x ∈ p.rootSet E) : e x ∈ p.rootSet E := by
    obtain ⟨hn, hx⟩ := mem_rootSet.mp h
    refine mem_rootSet.mpr ⟨hn, ?_⟩
    change aeval (e.toAlgHom x) p = 0
    rw [aeval_algHom_apply, hx, map_zero]
  exact ⟨fun x ↦ ⟨F x, mem F x.property⟩, fun x ↦ ⟨F.symm x, mem F.symm x.property⟩,
    fun _ ↦ Subtype.ext (F.symm_apply_apply _), fun _ ↦ Subtype.ext (F.apply_symm_apply _)⟩

/-- At a seed without a rational root, every Frobenius cycle has length at least two. -/
theorem rootPermutation_no_fixed_point [Algebra.IsAlgebraic K E] (p : K[X])
    (hp : ∀ a : K, p.eval a ≠ 0) (x : p.rootSet E) : rootPermutation p x ≠ x := by
  intro he
  have hpow : x.val ^ Fintype.card K = x.val := congrArg Subtype.val he
  obtain ⟨a, ha⟩ := mem_base_of_pow_card hpow
  have hroot := (mem_rootSet.mp x.property).2
  rw [← ha, ← eval_map_algebraMap, eval_map_apply] at hroot
  exact hp a ((algebraMap K E).injective (hroot.trans (map_zero _).symm))

/-- At a regular point of the twisted ordered-root equations, a rational root would
give a fixed label. The factorization and the Frobenius equations are in `E`. -/
theorem no_root_of_frobenius_labels {L : Type*} [Fintype L] (σ : Equiv.Perm L)
    (hσ : ∀ i, σ i ≠ i) (r : L → E) (hr : ∀ i, r (σ i) = r i ^ Fintype.card K)
    (p : K[X]) (hp : p.Separable)
    (hsplit : p.map (algebraMap K E) = ∏ i, (X - C (r i))) :
    ∀ x : K, p.eval x ≠ 0 := by
  classical
  have hs := hp.map (f := algebraMap K E)
  rw [hsplit, separable_prod_X_sub_C_iff] at hs
  intro x hx
  have he : (p.map (algebraMap K E)).eval (algebraMap K E x) = 0 := by simp [hx]
  rw [hsplit, eval_prod, prod_eq_zero_iff] at he
  obtain ⟨i, _, hi⟩ := he
  have hi' : algebraMap K E x = r i := sub_eq_zero.mp (by simpa using hi)
  apply hσ i (hs ?_)
  rw [hr, ← hi', ← map_pow, FiniteField.pow_card]

end Conjectures.AsgarliGhiocaYip
