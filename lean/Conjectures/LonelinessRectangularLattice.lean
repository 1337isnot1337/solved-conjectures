import Conjectures.LonelinessPrimitiveBasis
import Conjectures.LonelinessKZBasisVectors
import Conjectures.LonelinessKZBasisGram
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.Algebra.Group.Int.Units

/-!
# Integer images of rectangular matrices

An integer left inverse identifies the integer image of a matrix with all
integer points of its real column space. It also transfers unimodularity and
integer bases. The Gram determinant is unchanged by an integer basis change.

The three literal maps below are the rank-five triangle map and the two
rank-four maps used in the six-speed spectrum reduction. This file supplies
their lattice algebra; it does not assert a loneliness or norm bound.
-/

namespace Loneliness.RectangularLattice

open scoped BigOperators Matrix

noncomputable section

variable {m n : Type*} [Fintype m] [Fintype n] [DecidableEq n]

/-- A matrix left inverse is also a left inverse on coordinate vectors. -/
theorem left_inverse_mulVec {R : Type*} [CommRing R]
    (A : Matrix m n R) (L : Matrix n m R) (hLA : L * A = 1) (u : n → R) :
    L *ᵥ (A *ᵥ u) = u := by
  rw [Matrix.mulVec_mulVec, hLA, Matrix.one_mulVec]

theorem mulVec_injective {R : Type*} [CommRing R]
    (A : Matrix m n R) (L : Matrix n m R) (hLA : L * A = 1) :
    Function.Injective (fun u => A *ᵥ u) := by
  intro u v huv
  have h := congrArg (fun w => L *ᵥ w) huv
  simpa only [left_inverse_mulVec A L hLA] using h

/-- Scalar extension preserves the given integer left inverse. -/
omit [Fintype n] in
theorem real_left_inverse (A : Matrix m n ℤ) (L : Matrix n m ℤ)
    (hLA : L * A = 1) :
    L.map (Int.castRingHom ℝ) * A.map (Int.castRingHom ℝ) = 1 := by
  rw [← Matrix.map_mul, hLA]
  ext i j
  simp [Matrix.one_apply]

/-- Real parameters producing an integer vector are themselves integers. -/
theorem parameters_integral (A : Matrix m n ℤ) (L : Matrix n m ℤ)
    (hLA : L * A = 1) (u : n → ℝ) (v : m → ℤ)
    (hu : A.map (Int.castRingHom ℝ) *ᵥ u = fun i => (v i : ℝ)) :
    u = fun j => ((L *ᵥ v) j : ℝ) := by
  have h := left_inverse_mulVec (A.map (Int.castRingHom ℝ))
    (L.map (Int.castRingHom ℝ)) (real_left_inverse A L hLA) u
  rw [hu] at h
  funext j
  exact (congrFun h j).symm.trans
    ((Int.castRingHom ℝ).map_mulVec L v j).symm

/-- The real column space has no extra integer points beyond the integer image. -/
theorem integral_points_iff (A : Matrix m n ℤ) (L : Matrix n m ℤ)
    (hLA : L * A = 1) (v : m → ℤ) :
    (∃ u : n → ℝ, A.map (Int.castRingHom ℝ) *ᵥ u = fun i => (v i : ℝ)) ↔
      ∃ z : n → ℤ, A *ᵥ z = v := by
  constructor
  · rintro ⟨u, hu⟩
    refine ⟨L *ᵥ v, ?_⟩
    have hz := parameters_integral A L hLA u v hu
    rw [hz] at hu
    funext i
    apply Int.cast_injective (α := ℝ)
    exact ((Int.castRingHom ℝ).map_mulVec A (L *ᵥ v) i).trans (congrFun hu i)
  · rintro ⟨z, rfl⟩
    refine ⟨fun j => (z j : ℝ), ?_⟩
    funext i
    exact ((Int.castRingHom ℝ).map_mulVec A z i).symm

/-- Primitivity in the functional sense is preserved in both directions. -/
theorem isUnimodular_image_iff (A : Matrix m n ℤ) (L : Matrix n m ℤ)
    (hLA : L * A = 1) (u : n → ℤ) :
    Module.IsUnimodular ℤ (A *ᵥ u) ↔ Module.IsUnimodular ℤ u := by
  constructor
  · rintro ⟨f, hf⟩
    exact ⟨f.comp A.mulVecLin, hf⟩
  · rintro ⟨f, hf⟩
    refine ⟨f.comp L.mulVecLin, ?_⟩
    change f (L *ᵥ (A *ᵥ u)) = 1
    rw [left_inverse_mulVec A L hLA, hf]

/-- The parameter module is linearly equivalent to the actual integer image. -/
def imageEquiv (A : Matrix m n ℤ) (L : Matrix n m ℤ) (hLA : L * A = 1) :
    (n → ℤ) ≃ₗ[ℤ] LinearMap.range A.mulVecLin :=
  LinearEquiv.ofInjective A.mulVecLin (mulVec_injective A L hLA)

/-- An integer parameter basis induces a basis of the image lattice. -/
def imageBasis (A : Matrix m n ℤ) (L : Matrix n m ℤ) (hLA : L * A = 1)
    (B : Module.Basis n ℤ (n → ℤ)) :
    Module.Basis n ℤ (LinearMap.range A.mulVecLin) :=
  B.map (imageEquiv A L hLA)

theorem imageBasis_apply (A : Matrix m n ℤ) (L : Matrix n m ℤ) (hLA : L * A = 1)
    (B : Module.Basis n ℤ (n → ℤ)) (i : n) :
    ((imageBasis A L hLA B i : LinearMap.range A.mulVecLin) : m → ℤ) =
      A *ᵥ B i := by
  simp only [imageBasis, Module.Basis.map_apply, imageEquiv]
  exact LinearEquiv.ofInjective_apply A.mulVecLin (B i)

/-- A primitive image direction can be the first vector of an integer
parameter basis, with its image exactly the prescribed direction. -/
theorem exists_basis_first_image {r : ℕ}
    (A : Matrix m (Fin (r + 1)) ℤ) (L : Matrix (Fin (r + 1)) m ℤ)
    (hLA : L * A = 1) (u : Fin (r + 1) → ℤ)
    (hu : Module.IsUnimodular ℤ (A *ᵥ u)) :
    ∃ B : Module.Basis (Fin (r + 1)) ℤ (Fin (r + 1) → ℤ),
      B 0 = u ∧ A *ᵥ B 0 = A *ᵥ u := by
  obtain ⟨B, hB⟩ := PrimitiveBasis.unimodular_basis_extension
    (Pi.basisFun ℤ (Fin (r + 1))) u ((isUnimodular_image_iff A L hLA u).mp hu)
  exact ⟨B, hB, congrArg (fun z => A *ᵥ z) hB⟩

/-- A primitive image direction is the first vector of a basis of the
actual integer image, rather than just a basis of parameter coordinates. -/
theorem exists_image_basis_first {r : ℕ}
    (A : Matrix m (Fin (r + 1)) ℤ) (L : Matrix (Fin (r + 1)) m ℤ)
    (hLA : L * A = 1) (u : Fin (r + 1) → ℤ)
    (hu : Module.IsUnimodular ℤ (A *ᵥ u)) :
    ∃ B : Module.Basis (Fin (r + 1)) ℤ (LinearMap.range A.mulVecLin),
      ((B 0 : LinearMap.range A.mulVecLin) : m → ℤ) = A *ᵥ u := by
  obtain ⟨B, hB, _⟩ := exists_basis_first_image A L hLA u hu
  refine ⟨imageBasis A L hLA B, ?_⟩
  rw [imageBasis_apply, hB]

/-- The columns of an integer matrix, in the actual Euclidean ambient space. -/
def columns (A : Matrix m n ℤ) : n → EuclideanSpace ℝ m :=
  fun j => KZBasis.realVector (fun i => A i j)

/-- The integer Gram matrix casts to the Euclidean Gram matrix. -/
omit [Fintype n] [DecidableEq n] in
theorem gram_cast (A : Matrix m n ℤ) :
    (A.transpose * A).map (fun z => (z : ℝ)) = Matrix.gram ℝ (columns A) := by
  ext i j
  simp [columns, Matrix.gram_apply, KZBasis.realVector,
    EuclideanSpace.inner_toLp_toLp, dotProduct, Matrix.mul_apply,
    Matrix.transpose_apply, mul_comm]

theorem gram_det_cast (A : Matrix m n ℤ) :
    ((A.transpose * A).det : ℝ) = (Matrix.gram ℝ (columns A)).det := by
  rw [Int.cast_det, gram_cast]

/-- The coefficient matrix of an integer basis has determinant square one. -/
theorem basis_det_sq (B : Module.Basis n ℤ (n → ℤ)) :
    ((Matrix.of (fun i => B i)).det : ℝ) ^ 2 = 1 := by
  have hu : IsUnit (Matrix.of (fun i => B i)).det := by
    simpa only [Pi.basisFun_det_apply] using (Pi.basisFun ℤ n).isUnit_det B
  rcases Int.isUnit_iff.mp hu with h | h <;> rw [h] <;> norm_num

/-- An integer parameter basis gives the same Euclidean Gram determinant. -/
theorem gram_det_image_basis (A : Matrix m n ℤ)
    (B : Module.Basis n ℤ (n → ℤ)) :
    (Matrix.gram ℝ (fun j => KZBasis.realVector (A *ᵥ B j))).det =
      (Matrix.gram ℝ (columns A)).det := by
  let C : Matrix n n ℝ := fun i j => (B j i : ℝ)
  have hfamily : (fun j => KZBasis.realVector (A *ᵥ B j)) =
      fun j => ∑ i, C i j • columns A i := by
    funext j
    ext k
    simp [C, columns, KZBasis.realVector, Matrix.mulVec, dotProduct, mul_comm]
  have hC : C = (Matrix.of (fun i => B i)).transpose.map (fun z => (z : ℝ)) := rfl
  have hdet : C.det ^ 2 = 1 := by
    rw [hC, ← Int.cast_det, Matrix.det_transpose]
    exact basis_det_sq B
  rw [hfamily, KZBasis.gram_det_linearCombination, hdet, one_mul]

namespace SixSpectrumMaps

def triangle : Matrix (Fin 6) (Fin 5) ℤ :=
  ![![1, 0, 0, 0, 0], ![0, 1, 0, 0, 0], ![-1, -1, 0, 0, 0],
    ![0, 0, 1, 0, 0], ![0, 0, 0, 1, 0], ![0, 0, 0, 0, 1]]

def triangleLeft : Matrix (Fin 5) (Fin 6) ℤ :=
  ![![1, 0, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0], ![0, 0, 0, 1, 0, 0],
    ![0, 0, 0, 0, 1, 0], ![0, 0, 0, 0, 0, 1]]

def shape0 : Matrix (Fin 6) (Fin 4) ℤ :=
  ![![1, 0, 0, 0], ![0, 1, 0, 0], ![1, 1, 0, 0],
    ![1, -1, 0, 0], ![0, 0, 1, 0], ![0, 0, 0, 1]]

def shape0Left : Matrix (Fin 4) (Fin 6) ℤ :=
  ![![1, 0, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0],
    ![0, 0, 0, 0, 1, 0], ![0, 0, 0, 0, 0, 1]]

def shape1 : Matrix (Fin 6) (Fin 4) ℤ :=
  ![![1, 0, 0, 0], ![0, 1, 0, 0], ![1, 1, 0, 0],
    ![0, 0, 1, 0], ![1, 0, 1, 0], ![0, 0, 0, 1]]

def shape1Left : Matrix (Fin 4) (Fin 6) ℤ :=
  ![![1, 0, 0, 0, 0, 0], ![0, 1, 0, 0, 0, 0],
    ![0, 0, 0, 1, 0, 0], ![0, 0, 0, 0, 0, 1]]

theorem triangle_left_inverse : triangleLeft * triangle = 1 := by decide +kernel
theorem shape0_left_inverse : shape0Left * shape0 = 1 := by decide +kernel
theorem shape1_left_inverse : shape1Left * shape1 = 1 := by decide +kernel

theorem triangle_apply (u : Fin 5 → ℤ) :
    triangle *ᵥ u = ![u 0, u 1, -u 0 - u 1, u 2, u 3, u 4] := by
  ext i
  fin_cases i <;> simp [triangle, Matrix.mulVec, dotProduct, Fin.sum_univ_succ, sub_eq_add_neg]

theorem shape0_apply (u : Fin 4 → ℤ) :
    shape0 *ᵥ u = ![u 0, u 1, u 0 + u 1, u 0 - u 1, u 2, u 3] := by
  ext i
  fin_cases i <;> simp [shape0, Matrix.mulVec, dotProduct, Fin.sum_univ_succ, sub_eq_add_neg]

theorem shape1_apply (u : Fin 4 → ℤ) :
    shape1 *ᵥ u = ![u 0, u 1, u 0 + u 1, u 2, u 0 + u 2, u 3] := by
  ext i
  fin_cases i <;> simp [shape1, Matrix.mulVec, dotProduct, Fin.sum_univ_succ]

theorem triangle_gram_det : (triangle.transpose * triangle).det = 3 := by decide +kernel
theorem shape0_gram_det : (shape0.transpose * shape0).det = 9 := by decide +kernel
theorem shape1_gram_det : (shape1.transpose * shape1).det = 8 := by decide +kernel

theorem triangle_integral_points (v : Fin 6 → ℤ) :
    (∃ u : Fin 5 → ℝ,
      triangle.map (Int.castRingHom ℝ) *ᵥ u = fun i => (v i : ℝ)) ↔
      ∃ z : Fin 5 → ℤ, triangle *ᵥ z = v :=
  integral_points_iff triangle triangleLeft triangle_left_inverse v

theorem shape0_integral_points (v : Fin 6 → ℤ) :
    (∃ u : Fin 4 → ℝ,
      shape0.map (Int.castRingHom ℝ) *ᵥ u = fun i => (v i : ℝ)) ↔
      ∃ z : Fin 4 → ℤ, shape0 *ᵥ z = v :=
  integral_points_iff shape0 shape0Left shape0_left_inverse v

theorem shape1_integral_points (v : Fin 6 → ℤ) :
    (∃ u : Fin 4 → ℝ,
      shape1.map (Int.castRingHom ℝ) *ᵥ u = fun i => (v i : ℝ)) ↔
      ∃ z : Fin 4 → ℤ, shape1 *ᵥ z = v :=
  integral_points_iff shape1 shape1Left shape1_left_inverse v

end SixSpectrumMaps

end

end Loneliness.RectangularLattice
