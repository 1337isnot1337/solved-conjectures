module

public import Conjectures.XuZhouSpectral

@[expose] public section
namespace XuZhou
open Matrix
open scoped Matrix BigOperators InnerProductSpace

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

theorem spectral_gap_expansion {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) (x : EuclideanSpace ℝ ι) :
    quadraticEnergy M x - μ*‖x‖^2 =
      ∑ i,(hM.eigenvalues i - μ)*(hM.eigenvectorBasis.repr x i)^2 := by
  rw [quadraticEnergy_eigenbasis hM,orthonormal_coords_norm hM.eigenvectorBasis,
    Finset.mul_sum,← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i _
  ring

theorem apply_eq_smul_of_high_gap_zero {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) (x : EuclideanSpace ℝ ι)
    (hx : ∀ i,hM.eigenvalues i < μ → hM.eigenvectorBasis.repr x i=0)
    (hQ : quadraticEnergy M x=μ*‖x‖^2) :
    Matrix.toEuclideanLin M x=μ • x := by
  have hr := spectral_gap_expansion hM μ x
  rw [hQ,sub_self] at hr
  have hn : ∀ i∈(Finset.univ : Finset ι),
      0 ≤ (hM.eigenvalues i-μ)*(hM.eigenvectorBasis.repr x i)^2 := by
    intro i _
    by_cases hi : hM.eigenvalues i < μ
    · simp [hx i hi]
    · exact mul_nonneg (sub_nonneg.mpr (le_of_not_gt hi)) (sq_nonneg _)
  have hs := (Finset.sum_eq_zero_iff_of_nonneg hn).mp hr.symm
  conv_rhs => rw [← hM.eigenvectorBasis.sum_repr x]
  rw [Finset.smul_sum,matrix_apply_eigenbasis_sum hM]
  apply Finset.sum_congr rfl
  intro i hi
  rcases mul_eq_zero.mp (hs i hi) with he | he
  · rw [sub_eq_zero.mp he,smul_smul]
  · have he' : hM.eigenvectorBasis.repr x i * hM.eigenvectorBasis.repr x i=0 := by
      simpa only [pow_two] using he
    have hc : hM.eigenvectorBasis.repr x i=0 := (mul_eq_zero.mp he').elim id id
    simp [hc]

theorem restrictedEigenExpansion_injective {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (P : ι→Prop) [DecidablePred P] :
    Function.Injective (restrictedEigenExpansion hM P) := by
  intro c d h
  funext i
  have he := congrArg (fun x => hM.eigenvectorBasis.repr x i.val) h
  simpa only [restrictedEigenExpansion_coordinates,dite_eq_left i.property] using he

theorem card_ge_le_observation {κ : Type*} [Fintype κ] {M : Matrix ι ι ℝ}
    (hM : M.IsHermitian) (μ : ℝ) (L : EuclideanSpace ℝ ι →ₗ[ℝ] (κ→ℝ))
    (hL : ∀ x, L x=0 → quadraticEnergy M x ≤ μ*‖x‖^2)
    (hker : ∀ x, L x=0 → Matrix.toEuclideanLin M x=μ • x → x=0) :
    Fintype.card {i : ι // μ ≤ hM.eigenvalues i} ≤ Fintype.card κ := by
  classical
  let P (i : ι) := μ ≤ hM.eigenvalues i
  let T := restrictedEigenExpansion hM P
  have hI : Function.Injective (L.comp T) := LinearMap.ker_eq_bot.mp
    (LinearMap.ker_eq_bot'.mpr (by
      intro c hc
      change L (T c)=0 at hc
      have hz (i : ι) (hi : hM.eigenvalues i < μ) : hM.eigenvectorBasis.repr (T c) i=0 := by
        change hM.eigenvectorBasis.repr (restrictedEigenExpansion hM P c) i=0
        rw [restrictedEigenExpansion_coordinates hM P c i]
        exact dite_eq_right (not_le_of_gt hi)
      have hq := le_antisymm (hL _ hc) (quadraticEnergy_ge_on_high hM μ (T c) hz)
      have ht := hker _ hc (apply_eq_smul_of_high_gap_zero hM μ _ hz hq)
      apply restrictedEigenExpansion_injective hM P
      change T c=T 0
      rw [ht,map_zero]))
  have H := LinearMap.finrank_le_finrank_of_injective hI
  simpa [P] using H

noncomputable def strictlyLowSpace {M : Matrix ι ι ℝ} (hM : M.IsHermitian)
    (μ : ℝ) : Submodule ℝ (EuclideanSpace ℝ ι) :=
  (restrictedEigenExpansion hM (fun i=>hM.eigenvalues i<μ)).range

theorem strictlyLowSpace_finrank {M : Matrix ι ι ℝ} (hM : M.IsHermitian) (μ : ℝ) :
    Module.finrank ℝ (strictlyLowSpace hM μ) =
      Fintype.card {i : ι // hM.eigenvalues i<μ} := by
  unfold strictlyLowSpace
  rw [LinearMap.finrank_range_of_inj (restrictedEigenExpansion_injective hM _)]
  simp

theorem strictlyLowSpace_energy {M : Matrix ι ι ℝ} (hM : M.IsHermitian) (μ : ℝ)
    (x : strictlyLowSpace hM μ) (hx : x≠0) : quadraticEnergy M x.val < μ*‖x.val‖^2 := by
  classical
  obtain ⟨c,hc⟩ := x.property
  have hz : x.val ≠ 0 := fun h => hx (Subtype.ext h)
  have hterms : ∀ i∈(Finset.univ : Finset ι),
      (hM.eigenvalues i-μ)*(hM.eigenvectorBasis.repr x.val i)^2 ≤ 0 := by
    intro i _
    by_cases hi : hM.eigenvalues i<μ
    · exact mul_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr hi.le) (sq_nonneg _)
    · have hzero : hM.eigenvectorBasis.repr x.val i=0 := by
        rw [← hc,restrictedEigenExpansion_coordinates,dite_eq_right hi]
      simp [hzero]
  have hex : ∃ i,hM.eigenvectorBasis.repr x.val i≠0 := by
    by_contra! hn
    apply hz
    rw [← hM.eigenvectorBasis.sum_repr x.val]
    simp [hn]
  obtain ⟨i,hi⟩ := hex
  have hi' : hM.eigenvalues i<μ := by
    by_contra hn
    apply hi
    rw [← hc,restrictedEigenExpansion_coordinates,dite_eq_right hn]
  have hlt : (∑ i,(hM.eigenvalues i-μ)*(hM.eigenvectorBasis.repr x.val i)^2)<0 := by
    calc
      _ < ∑ _ : ι,(0:ℝ) := Finset.sum_lt_sum hterms
        ⟨i,Finset.mem_univ _,mul_neg_of_neg_of_pos (sub_neg.mpr hi') (by positivity)⟩
      _ = 0 := by simp
  rw [← spectral_gap_expansion hM μ x.val] at hlt
  exact sub_neg.mp hlt

end XuZhou
