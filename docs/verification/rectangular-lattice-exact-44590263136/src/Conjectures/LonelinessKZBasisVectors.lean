import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.LinearAlgebra.TensorProduct.Basis
import Mathlib.LinearAlgebra.TensorProduct.Pi

/-! Integer coordinate vectors, their Euclidean realizations, and scalar
extension of an actual integer basis. Values outside the finite basis are zero,
so the resulting natural-number family can be used by Gram–Schmidt prefix
lemmas without changing the basis indexing. -/

namespace Loneliness.KZBasis

noncomputable section

variable {ι : Type*} [Fintype ι]

def realVector (z : ι → ℤ) : EuclideanSpace ℝ ι :=
  WithLp.toLp 2 (fun i => (z i : ℝ))

omit [Fintype ι] in
@[simp]
theorem realVector_apply [Fintype ι] (z : ι → ℤ) (i : ι) : realVector z i = (z i : ℝ) := rfl

omit [Fintype ι] in
@[simp]
theorem realVector_zero [Fintype ι] : realVector (0 : ι → ℤ) = 0 := by
  ext i
  simp [realVector]

omit [Fintype ι] in
@[simp]
theorem realVector_add [Fintype ι] (z w : ι → ℤ) : realVector (z + w) = realVector z + realVector w := by
  ext i
  simp [realVector]

omit [Fintype ι] in
@[simp]
theorem realVector_sub [Fintype ι] (z w : ι → ℤ) : realVector (z - w) = realVector z - realVector w := by
  ext i
  simp [realVector]

omit [Fintype ι] in
theorem realVector_zsmul [Fintype ι] (c : ℤ) (z : ι → ℤ) :
    realVector (c • z) = (c : ℝ) • realVector z := by
  ext i
  simp [realVector]

variable {N : ℕ}

def integerFamily (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ) : Fin N → ℤ :=
  if h : i < N then B ⟨i, h⟩ else 0

def realFamily (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : ℕ) :
    EuclideanSpace ℝ (Fin N) := realVector (integerFamily B i)

@[simp]
theorem integerFamily_apply (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : Fin N) :
    integerFamily B i.val = B i := by
  simp [integerFamily, i.isLt]

@[simp]
theorem realFamily_apply (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : Fin N) :
    realFamily B i.val = realVector (B i) := by
  simp [realFamily]

def realBasis (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) :
    Module.Basis (Fin N) ℝ (EuclideanSpace ℝ (Fin N)) :=
  ((B.baseChange ℝ).map (TensorProduct.piScalarRight ℤ ℝ ℝ (Fin N))).map
    (WithLp.linearEquiv 2 ℝ (Fin N → ℝ)).symm

@[simp]
theorem realBasis_apply (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) (i : Fin N) :
    realBasis B i = realVector (B i) := by
  ext j
  simp [realBasis, realVector, zsmul_eq_mul]

theorem realVector_basis_linearIndependent (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) :
    LinearIndependent ℝ (fun i => realVector (B i)) := by
  have h : (realBasis B : Fin N → EuclideanSpace ℝ (Fin N)) =
      fun i => realVector (B i) := funext (realBasis_apply B)
  simpa only [h] using (realBasis B).linearIndependent

theorem realFamily_prefix_independent (B : Module.Basis (Fin N) ℤ (Fin N → ℤ))
    (r : ℕ) (hr : r ≤ N) :
    LinearIndependent ℝ (fun i : Fin r => realFamily B i.val) := by
  let e : Fin r → Fin N := Fin.castLE hr
  have he : Function.Injective e := by
    intro i j hij
    apply Fin.ext
    exact congrArg (fun x : Fin N => x.val) hij
  have h := (realVector_basis_linearIndependent B).comp e he
  have hfamily : (fun i : Fin r => realFamily B i.val) =
      fun i => realVector (B (e i)) := by
    funext i
    exact realFamily_apply B (e i)
  rw [hfamily]
  exact h

theorem integerFamily_prefix_independent (B : Module.Basis (Fin N) ℤ (Fin N → ℤ))
    (r : ℕ) (hr : r ≤ N) :
    LinearIndependent ℝ
      (fun i : Fin r => fun j => (integerFamily B i.val j : ℝ)) := by
  have h := (realFamily_prefix_independent B r hr).map_injOn
    (WithLp.linearEquiv 2 ℝ (Fin N → ℝ)).toLinearMap
    (WithLp.linearEquiv 2 ℝ (Fin N → ℝ)).injective.injOn
  simpa only [Function.comp_def, LinearEquiv.coe_coe, WithLp.coe_linearEquiv,
    realFamily, realVector, WithLp.ofLp_toLp] using h

theorem realFamily_full_span (B : Module.Basis (Fin N) ℤ (Fin N → ℤ)) :
    Submodule.span ℝ (realFamily B '' Set.Iio N) = ⊤ := by
  have hset : realFamily B '' Set.Iio N = Set.range (realBasis B) := by
    ext x
    constructor
    · rintro ⟨i, hi, rfl⟩
      refine ⟨⟨i, hi⟩, ?_⟩
      rw [realBasis_apply, realFamily_apply B ⟨i, hi⟩]
    · rintro ⟨i, rfl⟩
      exact ⟨i.val, i.isLt, (realFamily_apply B i).trans (realBasis_apply B i).symm⟩
  rw [hset]
  exact (realBasis B).span_eq

end

end Loneliness.KZBasis
