import Mathlib.RingTheory.MvPolynomial.Symmetric.FundamentalTheorem
import Mathlib.RingTheory.MvPolynomial.Homogeneous
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Data.Fin.Basic

open SimpleGraph MvPolynomial
open scoped BigOperators

namespace Li

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- A proper colouring with three colours. -/
def proper3 (G : SimpleGraph V) [DecidableRel G.Adj] (κ : V → Fin 3) : Prop :=
  ∀ u v, G.Adj u v → κ u ≠ κ v

instance (G : SimpleGraph V) [DecidableRel G.Adj] (κ : V → Fin 3) :
    Decidable (proper3 G κ) := by
  unfold proper3
  infer_instance

/-- Relabelling colours by a permutation of `Fin 3`. -/
def permColor (e : Equiv.Perm (Fin 3)) : (V → Fin 3) ≃ (V → Fin 3) where
  toFun κ v := e (κ v)
  invFun κ v := e.symm (κ v)
  left_inv κ := by funext v; simp
  right_inv κ := by funext v; simp

theorem proper3_permColor (G : SimpleGraph V) [DecidableRel G.Adj]
    (e : Equiv.Perm (Fin 3)) (κ : V → Fin 3) :
    proper3 G (permColor e κ) ↔ proper3 G κ := by
  constructor
  · intro h u v huv heq
    exact h u v huv (by simp [permColor, heq])
  · intro h u v huv heq
    exact h u v huv (e.injective heq)

/-- The three-variable chromatic symmetric polynomial of a finite graph:
the sum over proper three-colourings of the corresponding monomial. -/
noncomputable def chromPoly (G : SimpleGraph V) [DecidableRel G.Adj] :
    MvPolynomial (Fin 3) ℚ :=
  ∑ κ ∈ Finset.univ.filter (proper3 G),
    ∏ v : V, (MvPolynomial.X (κ v) : MvPolynomial (Fin 3) ℚ)

theorem chromPoly_isSymmetric (G : SimpleGraph V) [DecidableRel G.Adj] :
    (chromPoly G).IsSymmetric := by
  intro e
  rw [chromPoly, map_sum]
  refine Finset.sum_bij (fun κ _ => permColor e κ) ?_ ?_ ?_ ?_
  · intro κ hκ
    simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ ⊢
    exact (proper3_permColor G e κ).mpr hκ
  · intro κ₁ _ κ₂ _ heq
    exact (permColor e).injective heq
  · intro κ hκ
    refine ⟨(permColor e).symm κ, ?_, ?_⟩
    · simp only [Finset.mem_filter, Finset.mem_univ, true_and] at hκ ⊢
      exact (proper3_permColor G e ((permColor e).symm κ)).mp (by simpa using hκ)
    · exact (permColor e).apply_symm_apply κ
  · intro κ _
    rw [map_prod]
    apply Finset.prod_congr rfl
    intro v _
    simp [permColor]

theorem chromPoly_isHomogeneous (G : SimpleGraph V) [DecidableRel G.Adj] :
    (chromPoly G).IsHomogeneous (Fintype.card V) := by
  rw [chromPoly]
  apply IsHomogeneous.sum
  intro κ _
  have := IsHomogeneous.prod (s := Finset.univ)
    (φ := fun v : V => (MvPolynomial.X (κ v) : MvPolynomial (Fin 3) ℚ))
    (n := fun _ => 1) (by intro v _; exact isHomogeneous_X _ _)
  simpa using this

variable {A : Type*} [CommRing A] [Algebra ℚ A]

theorem aeval_chromPoly (G : SimpleGraph V) [DecidableRel G.Adj] (w : Fin 3 → A) :
    MvPolynomial.aeval w (chromPoly G) =
      ∑ κ ∈ Finset.univ.filter (proper3 G), ∏ v : V, w (κ v) := by
  rw [chromPoly, map_sum]
  apply Finset.sum_congr rfl
  intro κ _
  rw [map_prod]
  apply Finset.prod_congr rfl
  intro v _
  simp

end Li
