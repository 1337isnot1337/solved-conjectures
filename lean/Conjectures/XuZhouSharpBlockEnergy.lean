module

public import Conjectures.XuZhouSharpPrincipal
public import Conjectures.XuZhouEmbeddingEnergy

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators

noncomputable def sharpLocalVector (a b : ℝ) : Fin 4→ℝ := ![b,a-b/2,-a-b/2,b]

theorem sharpLocalVector_energy (a b : ℝ) :
    (∑ i : Fin 4,∑ j : Fin 4,sharpLocalVector a b i *
      (diamondMatrix i j * sharpLocalVector a b j)) =
    4*(∑ i : Fin 4,(sharpLocalVector a b i)^2)+b^2 := by
  simp [Fin.sum_univ_succ,sharpLocalVector,diamondMatrix,localDiamond,blockOffset]
  ring

noncomputable def sharpBlockWeights (t : ℕ) :
    (Fin t × Fin 2→ℝ) →ₗ[ℝ] EuclideanSpace ℝ (Fin t × Fin 4) where
  toFun c := WithLp.toLp 2 (fun i => sharpLocalVector (c (i.1,0)) (c (i.1,1)) i.2)
  map_add' c d := by
    apply WithLp.ofLp_injective 2
    funext i
    obtain ⟨i,j⟩ := i
    fin_cases j <;> simp [sharpLocalVector] <;> ring
  map_smul' r c := by
    apply WithLp.ofLp_injective 2
    funext i
    obtain ⟨i,j⟩ := i
    fin_cases j <;> simp [sharpLocalVector] <;> ring

@[simp] theorem sharpBlockWeights_apply {t : ℕ} (c : Fin t×Fin 2→ℝ)
    (i : Fin t) (j : Fin 4) :
    sharpBlockWeights t c (i,j)=sharpLocalVector (c (i,0)) (c (i,1)) j := by
  unfold sharpBlockWeights
  rfl

theorem sharpBlockWeights_injective (t : ℕ) : Function.Injective (sharpBlockWeights t) := by
  intro c d h
  funext ij
  obtain ⟨i,j⟩ := ij
  have e0 := congrArg (fun x : EuclideanSpace ℝ (Fin t×Fin 4) => x (i,0)) h
  have e1 := congrArg (fun x : EuclideanSpace ℝ (Fin t×Fin 4) => x (i,1)) h
  change c (i,1)=d (i,1) at e0
  change c (i,0)-c (i,1)/2=d (i,0)-d (i,1)/2 at e1
  fin_cases j
  · change c (i,0)=d (i,0)
    linarith
  · exact e0

theorem principal_blocks_energy {t : ℕ} (x : EuclideanSpace ℝ (Fin t×Fin 4)) :
    quadraticEnergy (((sharpGraph t).lapMatrix ℝ).submatrix
        (sharpBlockEmbedding t) (sharpBlockEmbedding t)) x =
      ∑ i : Fin t,∑ j : Fin 4,∑ k : Fin 4,x (i,j)*(diamondMatrix j k*x (i,k)) := by
  let B := ((sharpGraph t).lapMatrix ℝ).submatrix (sharpBlockEmbedding t) (sharpBlockEmbedding t)
  rw [quadraticEnergy_dotProduct]
  simp only [Matrix.mulVec,dotProduct]
  change (∑ p : Fin t×Fin 4,x p*(∑ q : Fin t×Fin 4,B p q*x q))=_
  rw [Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  rw [Fintype.sum_prod_type]
  simp_rw [show ∀ k c, B (i,j) (k,c) = if i=k then diamondMatrix j c else 0 from
    fun k c => sharpBlock_principal_entries i k j c]
  have h (k : Fin t) : (∑ c : Fin 4, (if i=k then diamondMatrix j c else 0)*x (k,c)) =
      if i=k then ∑ c : Fin 4, diamondMatrix j c*x (k,c) else 0 := by
    by_cases he : i=k <;> simp [he]
  simp_rw [h]
  rw [Finset.sum_ite_eq]
  simp only [Finset.mem_univ,ite_true,Finset.mul_sum]

theorem sharpBlockWeights_lower {t : ℕ} (c : Fin t×Fin 2→ℝ) :
    4*‖sharpBlockWeights t c‖^2 ≤ quadraticEnergy (((sharpGraph t).lapMatrix ℝ).submatrix
      (sharpBlockEmbedding t) (sharpBlockEmbedding t)) (sharpBlockWeights t c) := by
  rw [principal_blocks_energy,euclidean_norm_square,Fintype.sum_prod_type]
  simp only [sharpBlockWeights_apply]
  simp_rw [sharpLocalVector_energy]
  rw [Finset.sum_add_distrib,← Finset.mul_sum]
  exact le_add_of_nonneg_right (Finset.sum_nonneg (fun i _ => sq_nonneg _))

end XuZhou
