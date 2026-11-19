import Conjectures.LonelinessRationalSubspace
import Conjectures.LonelinessLatticeCovolume
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.InnerProductSpace.Subspace
import Mathlib.LinearAlgebra.Dimension.Free

/-!
# The integer-point lattice of a rational coordinate subspace

The lattice is the full intersection of the real Euclidean subspace with
the standard integer lattice. Clearing denominators proves that this
intersection spans the subspace. Its integer basis has an integral Gram
matrix, whose determinant equals the square of the actual covolume.

The full-span and discrete-lattice properties are proved from rationality.
This file does not assume a covolume bound, a lattice basis, or a saturated
matrix parameterization.
-/

namespace Loneliness.RationalLattice

open scoped BigOperators Matrix

noncomputable section

section General

variable {ι : Type*} [Fintype ι]

/-- Rational coordinates in the Euclidean ambient space. -/
def rationalVector (x : ι → ℚ) : EuclideanSpace ℝ ι :=
  WithLp.toLp 2 (fun i => (x i : ℝ))

/-- Integer coordinates in the Euclidean ambient space. -/
def integerVector (z : ι → ℤ) : EuclideanSpace ℝ ι :=
  WithLp.toLp 2 (fun i => (z i : ℝ))

/-- The Euclidean realization of the real span of a rational subspace. -/
def space (E : Submodule ℚ (ι → ℚ)) : Submodule ℝ (EuclideanSpace ℝ ι) :=
  (CoordinateSubspace.realSpan E).map
    (WithLp.linearEquiv 2 ℝ (ι → ℝ)).symm.toLinearMap

omit [Fintype ι] in
theorem space_eq_span (E : Submodule ℚ (ι → ℚ)) :
    space E = Submodule.span ℝ (Set.range (fun x : E => rationalVector (x : ι → ℚ))) := by
  unfold space CoordinateSubspace.realSpan
  rw [Submodule.map_span]
  congr 1
  ext x
  constructor
  · rintro ⟨y, ⟨v, hv, rfl⟩, rfl⟩
    exact ⟨⟨v, hv⟩, rfl⟩
  · rintro ⟨v, rfl⟩
    exact ⟨CoordinateSubspace.rationalVector (v : ι → ℚ),
      ⟨(v : ι → ℚ), v.property, rfl⟩, rfl⟩

omit [Fintype ι] in
theorem rationalVector_mem_space (E : Submodule ℚ (ι → ℚ))
    {x : ι → ℚ} (hx : x ∈ E) : rationalVector x ∈ space E := by
  rw [space_eq_span]
  exact Submodule.subset_span ⟨⟨x, hx⟩, rfl⟩

omit [Fintype ι] in
theorem integerVector_mem_space (E : Submodule ℚ (ι → ℚ))
    {z : ι → ℤ} (hz : (fun i => (z i : ℚ)) ∈ E) : integerVector z ∈ space E := by
  have h := rationalVector_mem_space E hz
  simpa only [rationalVector, integerVector, Rat.cast_intCast] using h

theorem finrank_space (E : Submodule ℚ (ι → ℚ)) :
    Module.finrank ℝ (space E) = Module.finrank ℚ E := by
  unfold space
  rw [LinearEquiv.finrank_map_eq, CoordinateSubspace.finrank_realSpan]

/-- The standard integer lattice in the Euclidean coordinate space. -/
def standardLattice (ι : Type*) [Fintype ι] : Submodule ℤ (EuclideanSpace ℝ ι) :=
  Submodule.span ℤ (Set.range (EuclideanSpace.basisFun ι ℝ).toBasis)

instance standardLattice_discrete : DiscreteTopology (standardLattice ι) :=
  inferInstanceAs (DiscreteTopology
    (Submodule.span ℤ (Set.range (EuclideanSpace.basisFun ι ℝ).toBasis)))

theorem mem_standardLattice_iff (x : EuclideanSpace ℝ ι) :
    x ∈ standardLattice ι ↔ ∀ i, ∃ z : ℤ, (z : ℝ) = x i := by
  classical
  change x ∈ Submodule.span ℤ (Set.range (EuclideanSpace.basisFun ι ℝ).toBasis) ↔ _
  rw [Module.Basis.mem_span_iff_repr_mem]
  simp only [OrthonormalBasis.coe_toBasis_repr_apply, EuclideanSpace.basisFun_repr,
    Set.mem_range, algebraMap_int_eq]
  rfl

/-- The full integer-point lattice, as a submodule of its intrinsic Euclidean space. -/
def integerPoints (E : Submodule ℚ (ι → ℚ)) : Submodule ℤ (space E) :=
  ZLattice.comap ℝ (standardLattice ι) (space E).subtype

instance integerPoints_discrete (E : Submodule ℚ (ι → ℚ)) :
    DiscreteTopology (integerPoints E) :=
  ZLattice.comap_discreteTopology ℝ (standardLattice ι)
    continuous_subtype_val (space E).subtype_injective

theorem mem_integerPoints_iff (E : Submodule ℚ (ι → ℚ)) (x : space E) :
    x ∈ integerPoints E ↔ ∀ i, ∃ z : ℤ, (z : ℝ) = (x : EuclideanSpace ℝ ι) i :=
  mem_standardLattice_iff (x : EuclideanSpace ℝ ι)

/-- Rationality proves full real span by clearing denominators of each generator. -/
theorem integerPoints_span_top (E : Submodule ℚ (ι → ℚ)) :
    Submodule.span ℝ (integerPoints E : Set (space E)) = ⊤ := by
  classical
  have himage : Submodule.span ℝ
      ((space E).subtype '' (integerPoints E : Set (space E))) = space E := by
    apply le_antisymm
    · apply Submodule.span_le.mpr
      rintro _ ⟨x, _, rfl⟩
      exact x.property
    · calc
        space E = Submodule.span ℝ
            (Set.range (fun x : E => rationalVector (x : ι → ℚ))) := space_eq_span E
        _ ≤ Submodule.span ℝ
            ((space E).subtype '' (integerPoints E : Set (space E))) := by
          apply Submodule.span_le.mpr
          rintro _ ⟨x, rfl⟩
          obtain ⟨d, w, hd, hw⟩ :=
            CoordinateSubspace.clear_rational_denominators (x : ι → ℚ)
          have hweq : integerVector w = (d : ℝ) • rationalVector (x : ι → ℚ) := by
            ext i
            change (w i : ℝ) = (d : ℝ) * ((x : ι → ℚ) i : ℝ)
            exact_mod_cast hw i
          have hwspace : integerVector w ∈ space E := by
            rw [hweq]
            exact (space E).smul_mem _ (rationalVector_mem_space E x.property)
          have hwlat : (⟨integerVector w, hwspace⟩ : space E) ∈ integerPoints E :=
            (mem_integerPoints_iff E _).mpr (fun i => ⟨w i, rfl⟩)
          have hwspan : integerVector w ∈ Submodule.span ℝ
              ((space E).subtype '' (integerPoints E : Set (space E))) :=
            Submodule.subset_span ⟨⟨integerVector w, hwspace⟩, hwlat, rfl⟩
          have hdR : (d : ℝ) ≠ 0 := Int.cast_ne_zero.mpr (ne_of_gt hd)
          have hrecover : rationalVector (x : ι → ℚ) = (d : ℝ)⁻¹ • integerVector w := by
            rw [hweq, smul_smul, inv_mul_cancel₀ hdR, one_smul]
          change rationalVector (x : ι → ℚ) ∈ Submodule.span ℝ
            ((space E).subtype '' (integerPoints E : Set (space E)))
          rw [hrecover]
          exact Submodule.smul_mem _ _ hwspan
  apply Submodule.map_injective_of_injective (space E).subtype_injective
  rw [Submodule.map_span, Submodule.map_top, Submodule.range_subtype]
  exact himage

instance integerPoints_isZLattice (E : Submodule ℚ (ι → ℚ)) :
    IsZLattice ℝ (integerPoints E) where
  span_top := integerPoints_span_top E

theorem integerPoints_finrank (E : Submodule ℚ (ι → ℚ)) :
    Module.finrank ℤ (integerPoints E) = Module.finrank ℚ E := by
  rw [ZLattice.rank ℝ, finrank_space]

/-- An actual integer basis exists with the rational dimension as its index cardinality. -/
def integerBasis (E : Submodule ℚ (ι → ℚ)) :
    Module.Basis (Fin (Module.finrank ℚ E)) ℤ (integerPoints E) :=
  Module.finBasisOfFinrankEq ℤ (integerPoints E) (integerPoints_finrank E)

/-- The unique integer coordinates of a lattice point. -/
def integerCoordinates {E : Submodule ℚ (ι → ℚ)} (x : integerPoints E) : ι → ℤ :=
  fun i => Classical.choose ((mem_integerPoints_iff E (x : space E)).mp x.property i)

theorem cast_integerCoordinates {E : Submodule ℚ (ι → ℚ)}
    (x : integerPoints E) (i : ι) :
    (integerCoordinates x i : ℝ) = ((x : space E) : EuclideanSpace ℝ ι) i :=
  Classical.choose_spec ((mem_integerPoints_iff E (x : space E)).mp x.property i)

/-- Coordinate extraction respects the full integer module structure. -/
def integerCoordinateMap (E : Submodule ℚ (ι → ℚ)) :
    integerPoints E →ₗ[ℤ] (ι → ℤ) where
  toFun := integerCoordinates
  map_add' x y := by
    ext i
    apply Int.cast_injective (α := ℝ)
    simp only [Pi.add_apply, Int.cast_add, cast_integerCoordinates,
      Submodule.coe_add, PiLp.add_apply]
  map_smul' c x := by
    ext i
    apply Int.cast_injective (α := ℝ)
    simp only [Pi.smul_apply, RingHom.id_apply, zsmul_eq_mul, Int.cast_id, Int.cast_mul,
      cast_integerCoordinates, Submodule.coe_smul_of_tower, WithLp.ofLp_smul]

/-- An integer point of the real subspace, regarded as a point of its full lattice. -/
def pointOfInteger (E : Submodule ℚ (ι → ℚ)) (z : ι → ℤ)
    (hz : integerVector z ∈ space E) : integerPoints E :=
  ⟨⟨integerVector z, hz⟩, (mem_integerPoints_iff E _).mpr (fun i => ⟨z i, rfl⟩)⟩

theorem integerCoordinates_pointOfInteger (E : Submodule ℚ (ι → ℚ))
    (z : ι → ℤ) (hz : integerVector z ∈ space E) :
    integerCoordinates (pointOfInteger E z hz) = z := by
  ext i
  apply Int.cast_injective (α := ℝ)
  exact cast_integerCoordinates (pointOfInteger E z hz) i

variable {κ : Type*}

/-- The ambient integer coordinate matrix of an integer basis of the full lattice. -/
def basisMatrix (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis κ ℤ (integerPoints E)) : Matrix ι κ ℤ :=
  fun i j => integerCoordinates (b j) i

theorem basisMatrix_mulVec_repr [Fintype κ] (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis κ ℤ (integerPoints E)) (x : integerPoints E) :
    basisMatrix E b *ᵥ (fun j => b.repr x j) = integerCoordinates x := by
  have h := congrArg (integerCoordinateMap E) (b.sum_repr x)
  simp only [map_sum, map_smul] at h
  ext i
  have hi := congrFun h i
  simpa [integerCoordinateMap, basisMatrix, Matrix.mulVec, dotProduct,
    Finset.sum_apply, mul_comm] using hi

theorem inner_eq_integer_dot (E : Submodule ℚ (ι → ℚ))
    (x y : integerPoints E) :
    inner ℝ (x : space E) (y : space E) =
      ((∑ i, integerCoordinates x i * integerCoordinates y i : ℤ) : ℝ) := by
  rw [Submodule.coe_inner, PiLp.inner_apply]
  simp only [Real.inner_apply, Int.cast_sum, Int.cast_mul, cast_integerCoordinates]

/-- The integer coordinate Gram matrix is the actual intrinsic Euclidean Gram matrix. -/
theorem basisMatrix_gram_cast (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis κ ℤ (integerPoints E)) :
    ((basisMatrix E b).transpose * basisMatrix E b).map (fun z => (z : ℝ)) =
      Matrix.gram ℝ (fun j => (b j : space E)) := by
  ext j k
  change ((∑ i, integerCoordinates (b j) i * integerCoordinates (b k) i : ℤ) : ℝ) =
    inner ℝ (b j : space E) (b k : space E)
  exact (inner_eq_integer_dot E (b j) (b k)).symm

theorem covolume_sq_eq_basisMatrix_gram_det [Fintype κ] [DecidableEq κ]
    (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis κ ℤ (integerPoints E)) :
    ZLattice.covolume (integerPoints E) ^ 2 =
      (((basisMatrix E b).transpose * basisMatrix E b).det : ℝ) :=
  LatticeCovolume.covolume_sq_eq_int_gram_det (integerPoints E) b
    ((basisMatrix E b).transpose * basisMatrix E b) (basisMatrix_gram_cast E b)

theorem basisMatrix_gram_det_pos [Fintype κ] [DecidableEq κ]
    (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis κ ℤ (integerPoints E)) :
    0 < ((basisMatrix E b).transpose * basisMatrix E b).det := by
  have h : (0 : ℝ) < (((basisMatrix E b).transpose * basisMatrix E b).det : ℝ) := by
    rw [← covolume_sq_eq_basisMatrix_gram_det E b]
    exact sq_pos_of_pos (ZLattice.covolume_pos (integerPoints E))
  exact_mod_cast h

/-- A nonzero coordinate in one lattice point rules out the corresponding zero basis row. -/
theorem basisMatrix_rows_nonzero [Fintype κ] (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis κ ℤ (integerPoints E)) (x : integerPoints E)
    (hx : ∀ i, integerCoordinates x i ≠ 0) : ∀ i, basisMatrix E b i ≠ 0 := by
  intro i hrow
  apply hx i
  have h := congrFun (basisMatrix_mulVec_repr E b x) i
  change basisMatrix E b i ⬝ᵥ (fun j => b.repr x j) = integerCoordinates x i at h
  rw [hrow, zero_dotProduct] at h
  exact h.symm

/-- A single point with pairwise sign-distinct coordinates rules out equal or opposite basis rows. -/
theorem basisMatrix_rows_separate [Fintype κ] (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis κ ℤ (integerPoints E)) (x : integerPoints E)
    (hx : ∀ i j, i ≠ j → integerCoordinates x i ≠ integerCoordinates x j ∧
      integerCoordinates x i ≠ -integerCoordinates x j) :
    ∀ i j, i ≠ j → basisMatrix E b i ≠ basisMatrix E b j ∧
      basisMatrix E b i ≠ -basisMatrix E b j := by
  intro i j hij
  have hi := congrFun (basisMatrix_mulVec_repr E b x) i
  have hj := congrFun (basisMatrix_mulVec_repr E b x) j
  change basisMatrix E b i ⬝ᵥ (fun k => b.repr x k) = integerCoordinates x i at hi
  change basisMatrix E b j ⬝ᵥ (fun k => b.repr x k) = integerCoordinates x j at hj
  constructor
  · intro hrow
    apply (hx i j hij).1
    rw [hrow, hj] at hi
    exact hi.symm
  · intro hrow
    apply (hx i j hij).2
    rw [hrow, neg_dotProduct, hj] at hi
    exact hi.symm

/-- Integrality gives a squared covolume of at least one in every dimension. -/
theorem one_le_covolume_sq (E : Submodule ℚ (ι → ℚ)) :
    1 ≤ ZLattice.covolume (integerPoints E) ^ 2 := by
  let b := integerBasis E
  exact LatticeCovolume.one_le_covolume_sq_of_integral_gram (integerPoints E) b
    ((basisMatrix E b).transpose * basisMatrix E b) (basisMatrix_gram_cast E b)

end General

end

end Loneliness.RationalLattice
