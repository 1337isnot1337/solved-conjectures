module

public import Mathlib.Analysis.Matrix.Spectrum
public import Mathlib.Combinatorics.SimpleGraph.LapMatrix
public import Mathlib.Tactic

@[expose] public section
namespace XuZhou
open Matrix
open scoped Matrix InnerProductSpace BigOperators

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

noncomputable def quadraticEnergy (M : Matrix ι ι ℝ) (x : EuclideanSpace ℝ ι) : ℝ :=
  ⟪x, Matrix.toEuclideanLin M x⟫_ℝ

theorem matrix_apply_eigenvector {M : Matrix ι ι ℝ} (hM : M.IsHermitian) (i : ι) :
    Matrix.toEuclideanLin M (hM.eigenvectorBasis i) =
      hM.eigenvalues i • hM.eigenvectorBasis i := by
  rw [Matrix.toEuclideanLin,Matrix.toLpLin_apply,hM.mulVec_eigenvectorBasis]
  rfl

omit [DecidableEq ι] in
theorem orthonormal_coords_norm (b : OrthonormalBasis ι ℝ (EuclideanSpace ℝ ι))
    (x : EuclideanSpace ℝ ι) :
    ‖x‖^2 = ∑ i, (b.repr x i)^2 := by
  calc
    _ = ⟪x, x⟫_ℝ := (real_inner_self_eq_norm_sq x).symm
    _ = ⟪x, ∑ i, (b.repr x i) • b i⟫_ℝ :=
      congrArg (fun z => ⟪x,z⟫_ℝ) (b.sum_repr x).symm
    _ = _ := by
      rw [inner_sum]
      apply Finset.sum_congr rfl
      intro i _
      rw [real_inner_smul_right,real_inner_comm (b i) x,← b.repr_apply_apply]
      ring

theorem matrix_apply_eigenbasis_sum {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (x : EuclideanSpace ℝ ι) :
    Matrix.toEuclideanLin M x = ∑ i,
      (hM.eigenvalues i * hM.eigenvectorBasis.repr x i) • hM.eigenvectorBasis i := by
  let b := hM.eigenvectorBasis
  calc
    _ = Matrix.toEuclideanLin M (∑ i,(b.repr x i) • b i) :=
      congrArg (Matrix.toEuclideanLin M) (b.sum_repr x).symm
    _ = _ := by
      rw [map_sum]
      apply Finset.sum_congr rfl
      intro i _
      change Matrix.toEuclideanLin M ((b.repr x i) • hM.eigenvectorBasis i) = _
      rw [map_smul,matrix_apply_eigenvector hM,smul_smul,mul_comm]

theorem quadraticEnergy_eigenbasis {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (x : EuclideanSpace ℝ ι) :
    quadraticEnergy M x = ∑ i,
      hM.eigenvalues i * (hM.eigenvectorBasis.repr x i)^2 := by
  rw [quadraticEnergy,matrix_apply_eigenbasis_sum hM,inner_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [real_inner_smul_right,real_inner_comm (hM.eigenvectorBasis i) x,← OrthonormalBasis.repr_apply_apply]
  ring

theorem quadraticEnergy_ge_on_high {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) (x : EuclideanSpace ℝ ι)
    (hx : ∀ i, hM.eigenvalues i < μ → hM.eigenvectorBasis.repr x i = 0) :
    μ*‖x‖^2 ≤ quadraticEnergy M x := by
  rw [orthonormal_coords_norm hM.eigenvectorBasis,Finset.mul_sum,quadraticEnergy_eigenbasis hM]
  apply Finset.sum_le_sum
  intro i _
  by_cases hi : hM.eigenvalues i < μ
  · simp [hx i hi]
  · exact mul_le_mul_of_nonneg_right (le_of_not_gt hi) (sq_nonneg _)

theorem apply_eq_zero_of_nonnegative_energy_zero {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (x : EuclideanSpace ℝ ι)
    (hx : ∀ i, hM.eigenvalues i < 0 → hM.eigenvectorBasis.repr x i = 0)
    (hzero : quadraticEnergy M x = 0) : Matrix.toEuclideanLin M x = 0 := by
  rw [quadraticEnergy_eigenbasis hM] at hzero
  have hpos : ∀ i ∈ (Finset.univ : Finset ι),
      0 ≤ hM.eigenvalues i * (hM.eigenvectorBasis.repr x i)^2 := by
    intro i _
    by_cases hi : hM.eigenvalues i < 0
    · simp [hx i hi]
    · exact mul_nonneg (le_of_not_gt hi) (sq_nonneg _)
  have hparts := (Finset.sum_eq_zero_iff_of_nonneg hpos).mp hzero
  rw [matrix_apply_eigenbasis_sum hM]
  apply Finset.sum_eq_zero
  intro i hi
  rcases mul_eq_zero.mp (hparts i hi) with h | h
  · simp [h]
  · have hh : hM.eigenvectorBasis.repr x i * hM.eigenvectorBasis.repr x i = 0 := by simpa only [pow_two] using h
    have hc : hM.eigenvectorBasis.repr x i = 0 := (mul_eq_zero.mp hh).elim id id
    simp [hc]

/-- Any vector subspace with a strict upper Rayleigh bound injects into the
actual spectral coordinates strictly below that bound. -/
theorem finrank_le_card_lt_of_strict_quadratic {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) (W : Submodule ℝ (EuclideanSpace ℝ ι))
    (hW : ∀ (x : W), x ≠ 0 → quadraticEnergy M x.val < μ*‖x.val‖^2) :
    Module.finrank ℝ W ≤ Fintype.card { i : ι // hM.eigenvalues i < μ } := by
  let L : W →ₗ[ℝ] ({i : ι // hM.eigenvalues i < μ} → ℝ) :=
    { toFun := fun x i => hM.eigenvectorBasis.repr x.val i.val
      map_add' := fun x y => funext fun i => by simp
      map_smul' := fun c x => funext fun i => by simp }
  have hL : Function.Injective L := LinearMap.ker_eq_bot.mp (LinearMap.ker_eq_bot'.mpr (by
    intro x hzero
    by_contra hx
    have hz (i : ι) (hi : hM.eigenvalues i < μ) : hM.eigenvectorBasis.repr x.val i = 0 :=
      congrFun hzero ⟨i,hi⟩
    exact (not_lt_of_ge (quadraticEnergy_ge_on_high hM μ x.val hz)) (hW x hx)))
  have H := LinearMap.finrank_le_finrank_of_injective hL
  simpa using H

/-- Therefore the upper tail, including the cutoff itself, is bounded by the
complementary dimension. -/
theorem card_ge_le_sub_finrank {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) (W : Submodule ℝ (EuclideanSpace ℝ ι))
    (hW : ∀ (x : W), x ≠ 0 → quadraticEnergy M x.val < μ*‖x.val‖^2) :
    Fintype.card { i : ι // μ ≤ hM.eigenvalues i } ≤
      Fintype.card ι - Module.finrank ℝ W := by
  classical
  have h := Fintype.card_subtype_compl (fun i : ι => hM.eigenvalues i < μ)
  have h' : Fintype.card { i : ι // μ ≤ hM.eigenvalues i } =
      Fintype.card ι - Fintype.card { i : ι // hM.eigenvalues i < μ } := by
    simpa only [not_lt] using h
  rw [h']
  exact Nat.sub_le_sub_left (finrank_le_card_lt_of_strict_quadratic hM μ W hW) _

noncomputable def restrictedEigenExpansion {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (P : ι→Prop) [DecidablePred P] :
    ({i : ι // P i} → ℝ) →ₗ[ℝ] EuclideanSpace ℝ ι where
  toFun c := ∑ i : {i : ι // P i}, c i • hM.eigenvectorBasis i.val
  map_add' x y := by
    simp only [Pi.add_apply,add_smul,Finset.sum_add_distrib]
  map_smul' r x := by
    simp only [Pi.smul_apply,smul_eq_mul,Finset.smul_sum,RingHom.id_apply]
    apply Finset.sum_congr rfl
    intro i _
    rw [smul_smul]

theorem restrictedEigenExpansion_coordinates {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (P : ι→Prop) [DecidablePred P] (c : {i : ι // P i} → ℝ) (j : ι) :
    hM.eigenvectorBasis.repr (restrictedEigenExpansion hM P c) j =
      if h : P j then c ⟨j,h⟩ else 0 := by
  classical
  rw [OrthonormalBasis.repr_apply_apply]
  change ⟪hM.eigenvectorBasis j, ∑ i : {i : ι // P i}, c i • hM.eigenvectorBasis i.val⟫_ℝ = _
  rw [inner_sum]
  simp_rw [real_inner_smul_right,orthonormal_iff_ite.mp hM.eigenvectorBasis.orthonormal]
  by_cases h : P j
  · rw [dite_eq_left h]
    rw [Finset.sum_eq_single (⟨j,h⟩ : {i : ι // P i})]
    · simp
    · intro i _ hne
      have hne' : j ≠ i.val := fun he => hne (Subtype.ext he.symm)
      simp [hne']
    · simp
  · rw [dite_eq_right h]
    apply Finset.sum_eq_zero
    intro i _
    have hne : j ≠ i.val := fun hi => h (hi.symm ▸ i.property)
    simp [hne]

/-- An observation of k scalar coordinates bounds the nonnegative spectrum
when its zero space is nonpositive and contains no nontrivial kernel vector.
The zero-eigenvalue case is not lost. -/
theorem card_nonnegative_le_observation {κ : Type*} [Fintype κ]
    {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (L : EuclideanSpace ℝ ι →ₗ[ℝ] (κ→ℝ))
    (hL : ∀ x, L x=0 → quadraticEnergy M x ≤ 0)
    (hker : ∀ x, L x=0 → Matrix.toEuclideanLin M x=0 → x=0) :
    Fintype.card {i : ι // 0 ≤ hM.eigenvalues i} ≤ Fintype.card κ := by
  classical
  let P (i : ι) := 0 ≤ hM.eigenvalues i
  let T := restrictedEigenExpansion hM P
  have hI : Function.Injective (L.comp T) := LinearMap.ker_eq_bot.mp
    (LinearMap.ker_eq_bot'.mpr (by
      intro c hc
      change L (T c)=0 at hc
      have hz (i : ι) (hi : hM.eigenvalues i < 0) :
          hM.eigenvectorBasis.repr (T c) i = 0 := by
        change hM.eigenvectorBasis.repr (restrictedEigenExpansion hM P c) i = 0
        rw [restrictedEigenExpansion_coordinates hM P c i]
        exact dite_eq_right (not_le_of_gt hi)
      have hq : quadraticEnergy M (T c)=0 := le_antisymm (hL _ hc) (by
        simpa only [zero_mul] using quadraticEnergy_ge_on_high hM 0 (T c) hz)
      have hTc : T c=0 := hker _ hc (apply_eq_zero_of_nonnegative_energy_zero hM _ hz hq)
      funext i
      have hb := congrArg (fun x => hM.eigenvectorBasis.repr x i.val) hTc
      change hM.eigenvectorBasis.repr (restrictedEigenExpansion hM P c) i.val = _ at hb
      rw [restrictedEigenExpansion_coordinates hM P c i.val,dite_eq_left i.property] at hb
      simpa using hb))
  have H := LinearMap.finrank_le_finrank_of_injective hI
  simpa [P] using H

end XuZhou
