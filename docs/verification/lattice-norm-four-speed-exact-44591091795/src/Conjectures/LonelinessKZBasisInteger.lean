import Conjectures.LonelinessKZBasisVectors
import Conjectures.LonelinessKZBasisGram
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.LinearAlgebra.Determinant
import Mathlib.Algebra.Group.Int.Units
import Mathlib.Algebra.Order.Ring.Int
import Mathlib.Data.Nat.Find

/-! Integer prefix Gram determinants and an integer-valued basis potential.
The complete integer basis has Gram determinant one. This supplies the exact
product identity for its Euclidean Gram–Schmidt lengths without a covolume
assumption. A basis minimizing the potential exists by natural-number
well-ordering; reduction properties of that basis are proved separately. -/

namespace Loneliness.KZBasis

open scoped BigOperators

noncomputable section

variable {N : ℕ}

def integerGram (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (r : ℕ) :
    Matrix (Fin r) (Fin r) ℤ :=
  fun i j => ∑ a : Fin N, integerFamily B i.val a * integerFamily B j.val a

def prefixDet (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (r : ℕ) : ℕ :=
  (integerGram B r).det.natAbs

def basisPotential (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) : ℕ :=
  ∑ r ∈ Finset.range (N + 1), prefixDet B r

theorem integerGram_cast (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (r : ℕ) :
    (integerGram B r).map (fun z => (z : ℝ)) =
      Matrix.gram ℝ (fun i : Fin r => realFamily B i.val) := by
  ext i j
  simp [integerGram, realFamily, realVector, Matrix.gram_apply,
    EuclideanSpace.inner_toLp_toLp, dotProduct, mul_comm]

theorem integerGram_det_cast (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (r : ℕ) :
    ((integerGram B r).det : ℝ) =
      (Matrix.gram ℝ (fun i : Fin r => realFamily B i.val)).det := by
  rw [Int.cast_det, integerGram_cast]

theorem prefixDet_cast (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (r : ℕ) :
    (prefixDet B r : ℝ) =
      (Matrix.gram ℝ (fun i : Fin r => realFamily B i.val)).det := by
  rw [prefixDet, Nat.cast_natAbs, Int.cast_abs, integerGram_det_cast]
  exact abs_of_nonneg (Matrix.posSemidef_gram ℝ _).det_nonneg

theorem prefixDet_eq_gs_product (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (r : ℕ) :
    (prefixDet B r : ℝ) =
      ∏ i ∈ Finset.range r, ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) i‖ ^ 2 :=
  (prefixDet_cast B r).trans (gramSchmidt_prefix_det_range (realFamily B) r)

theorem integerGram_full (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) :
    integerGram B N = Matrix.of (fun i => B i) * (Matrix.of (fun i => B i)).transpose := by
  ext i j
  simp [integerGram, Matrix.mul_apply, Matrix.transpose_apply]

theorem integerGram_full_det (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) :
    (integerGram B N).det = 1 := by
  have hu : IsUnit (Matrix.of (fun i : Fin N => B i)).det := by
    simpa only [Pi.basisFun_det_apply] using (Pi.basisFun ℤ (Fin N)).isUnit_det B
  rcases Int.isUnit_iff.mp hu with h | h
  · rw [integerGram_full, Matrix.det_mul, Matrix.det_transpose, h]
    norm_num
  · rw [integerGram_full, Matrix.det_mul, Matrix.det_transpose, h]
    norm_num

@[simp]
theorem prefixDet_full (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) : prefixDet B N = 1 := by
  simp [prefixDet, integerGram_full_det]

theorem gs_product_eq_one (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) :
    (∏ i ∈ Finset.range N, ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) i‖ ^ 2) = 1 := by
  have h := prefixDet_eq_gs_product B N
  simpa only [prefixDet_full, Nat.cast_one] using h.symm

theorem gs_sq_positive (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ) (hi : i < N) :
    0 < ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) i‖ ^ 2 := by
  have hp : (∏ j ∈ Finset.range N,
      ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) j‖ ^ 2) ≠ 0 := by
    rw [gs_product_eq_one]
    norm_num
  have hn := Finset.prod_ne_zero_iff.mp hp i (Finset.mem_range.mpr hi)
  exact lt_of_le_of_ne (sq_nonneg _) hn.symm

theorem gs_tail_product {n : ℕ}
    (B : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ)) :
    (∏ i ∈ Finset.range n,
      ‖InnerProductSpace.gramSchmidt ℝ (realFamily B) (i + 1)‖ ^ 2) *
        ‖realVector (B 0)‖ ^ 2 = 1 := by
  have h := gs_product_eq_one B
  have hfirst : InnerProductSpace.gramSchmidt ℝ (realFamily B) 0 = realVector (B 0) :=
    (InnerProductSpace.gramSchmidt_bot ℝ (realFamily B)).trans (realFamily_apply B 0)
  rw [Finset.prod_range_succ', hfirst] at h
  exact h

/-- Natural-number well-ordering chooses an actual integer basis with minimum
potential among all bases whose first vector equals the prescribed one. -/
theorem exists_minimal_basis {n : ℕ}
    (B₀ : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ)) :
    ∃ B : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ), B 0 = B₀ 0 ∧
      ∀ C : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ),
        C 0 = B₀ 0 → basisPotential B ≤ basisPotential C := by
  classical
  let p : ℕ → Prop := fun m =>
    ∃ B : Module.Basis (Fin (n + 1)) ℤ (Fin (n + 1) → ℤ),
      B 0 = B₀ 0 ∧ basisPotential B = m
  have hp : ∃ m, p m := ⟨basisPotential B₀, B₀, rfl, rfl⟩
  obtain ⟨B, hB, hpot⟩ := Nat.find_spec hp
  refine ⟨B, hB, ?_⟩
  intro C hC
  rw [hpot]
  exact Nat.find_min' hp ⟨C, hC, rfl⟩

end

end Loneliness.KZBasis
