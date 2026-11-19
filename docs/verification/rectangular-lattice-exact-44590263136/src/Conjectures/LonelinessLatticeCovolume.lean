module

public import Mathlib.Algebra.Module.ZLattice.Covolume
public import Mathlib.Analysis.InnerProductSpace.GramMatrix
public import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
public import Mathlib.Tactic

@[expose] public section

/-!
# Covolume and the Gram determinant

For a lattice in a finite-dimensional real inner product space, the square of
its covolume is the Gram determinant of any integer basis. An integral Gram
matrix therefore gives an integer squared covolume of at least one.
-/

namespace Loneliness.LatticeCovolume

open Module MeasureTheory

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
variable [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

omit [DecidableEq ι] in
theorem orthonormal_fundamentalDomain_volume (b₀ : OrthonormalBasis ι ℝ E) :
    volume.real (ZSpan.fundamentalDomain b₀.toBasis) = 1 := by
  rw [measureReal_congr (ZSpan.fundamentalDomain_ae_parallelepiped b₀.toBasis volume)]
  simp only [measureReal_def, OrthonormalBasis.coe_toBasis,
    b₀.volume_parallelepiped, ENNReal.toReal_one]

omit [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] in
theorem gram_det_eq_basis_det_sq (b₀ : OrthonormalBasis ι ℝ E) (v : ι → E) :
    (Matrix.gram ℝ v).det = (b₀.toBasis.det v) ^ 2 := by
  have hrepr : Matrix.of (fun i j => b₀.repr (v j) i) = b₀.toBasis.toMatrix v := by
    ext i j
    exact (b₀.coe_toBasis_repr_apply (v j) i).symm
  rw [Matrix.gram_eq_conjTranspose_mul b₀, hrepr, Matrix.det_mul,
    Matrix.det_conjTranspose, Basis.det_apply]
  simp only [star_trivial, pow_two]

theorem covolume_sq_eq_gram_det (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (b : Basis ι ℤ L) :
    ZLattice.covolume L ^ 2 = (Matrix.gram ℝ (fun i => (b i : E))).det := by
  classical
  let e : Fin (finrank ℝ E) ≃ ι := Fintype.equivOfCardEq (by
    rw [Fintype.card_fin, finrank_eq_card_basis (b.ofZLatticeBasis ℝ)])
  let b₀ : OrthonormalBasis ι ℝ E := (stdOrthonormalBasis ℝ E).reindex e
  have hc := ZLattice.covolume_eq_det_mul_measureReal L volume b b₀.toBasis
  rw [orthonormal_fundamentalDomain_volume b₀, mul_one] at hc
  rw [hc, gram_det_eq_basis_det_sq b₀, sq_abs]
  rfl

theorem covolume_sq_eq_int_gram_det (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (b : Basis ι ℤ L)
    (G : Matrix ι ι ℤ)
    (hG : G.map (fun z => (z : ℝ)) = Matrix.gram ℝ (fun i => (b i : E))) :
    ZLattice.covolume L ^ 2 = (G.det : ℝ) := by
  rw [covolume_sq_eq_gram_det L b, ← hG, ← Int.cast_det]

/-- Positivity and integrality give the exact lower bound required for
the rank-five ambient-space norm estimate. -/
theorem one_le_covolume_sq_of_integral_gram (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (b : Basis ι ℤ L)
    (G : Matrix ι ι ℤ)
    (hG : G.map (fun z => (z : ℝ)) = Matrix.gram ℝ (fun i => (b i : E))) :
    1 ≤ ZLattice.covolume L ^ 2 := by
  have hc := covolume_sq_eq_int_gram_det L b G hG
  have hp : (0 : ℝ) < (G.det : ℝ) := by
    rw [← hc]
    exact sq_pos_of_pos (ZLattice.covolume_pos L)
  have hi : (0 : ℤ) < G.det := by exact_mod_cast hp
  have hle : (1 : ℤ) ≤ G.det := by omega
  rw [hc]
  exact_mod_cast hle

end

end Loneliness.LatticeCovolume
