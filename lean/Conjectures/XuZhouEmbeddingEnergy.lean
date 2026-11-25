module

public import Conjectures.XuZhouZeroExtension

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]

noncomputable def embeddingExtend (e : κ↪ι) :
    EuclideanSpace ℝ κ →ₗ[ℝ] EuclideanSpace ℝ ι := by
  classical
  refine
    { toFun := fun x => WithLp.toLp 2 (fun i => if h : ∃ j,e j=i then x h.choose else 0)
      map_add' := ?_
      map_smul' := ?_ }
  · intro x y
    apply WithLp.ofLp_injective 2
    funext i
    by_cases h : ∃ j,e j=i <;> simp [h]
  · intro r x
    apply WithLp.ofLp_injective 2
    funext i
    by_cases h : ∃ j,e j=i <;> simp [h]

omit [Fintype ι] [DecidableEq κ] in
theorem embeddingExtend_apply_image (e : κ↪ι) (x : EuclideanSpace ℝ κ) (j : κ) :
    embeddingExtend e x (e j)=x j := by
  classical
  have h : ∃ k,e k=e j := ⟨j,rfl⟩
  change (if h : ∃ k,e k=e j then x h.choose else 0)=x j
  rw [dite_eq_left h]
  exact congrArg x.ofLp (e.injective h.choose_spec)

omit [Fintype ι] [DecidableEq κ] in
theorem embeddingExtend_zero_outside (e : κ↪ι) (x : EuclideanSpace ℝ κ) (i : ι)
    (h : ¬∃ j,e j=i) : embeddingExtend e x i=0 := by
  classical
  change (if h : ∃ j,e j=i then x h.choose else 0)=0
  exact dite_eq_right h

omit [Fintype ι] [DecidableEq κ] in
theorem embeddingExtend_injective (e : κ↪ι) : Function.Injective (embeddingExtend e) := by
  intro x y h
  apply WithLp.ofLp_injective 2
  funext j
  have he := congrArg (fun z : EuclideanSpace ℝ ι => z (e j)) h
  simpa only [embeddingExtend_apply_image] using he

omit [DecidableEq ι] [DecidableEq κ] in
theorem sum_supported_embedding (e : κ↪ι) (f : ι→ℝ) (h : ∀ i,(¬∃ j,e j=i) → f i=0) :
    (∑ i,f i)=∑ j,f (e j) := by
  classical
  let s := (Finset.univ : Finset κ).map e
  calc
    _ = ∑ i∈s,f i := by
      symm
      exact Finset.sum_subset (fun _ _=>Finset.mem_univ _)
        (fun i _ hi => h i (fun ⟨j,hj⟩ => hi (Finset.mem_map.mpr ⟨j,Finset.mem_univ _,hj⟩)))
    _ = _ := Finset.sum_map _ _ _

omit [DecidableEq κ] in
theorem embeddingExtend_norm_square (e : κ↪ι) (x : EuclideanSpace ℝ κ) :
    ‖embeddingExtend e x‖^2=‖x‖^2 := by
  rw [euclidean_norm_square,euclidean_norm_square]
  rw [sum_supported_embedding e (fun i => (embeddingExtend e x i)^2) (fun i h => by
    simp [embeddingExtend_zero_outside e x i h])]
  simp only [embeddingExtend_apply_image]

theorem embeddingExtend_energy_submatrix (e : κ↪ι) (M : Matrix ι ι ℝ)
    (x : EuclideanSpace ℝ κ) :
    quadraticEnergy M (embeddingExtend e x) = quadraticEnergy (M.submatrix e e) x := by
  rw [quadraticEnergy_dotProduct,quadraticEnergy_dotProduct]
  simp only [Matrix.mulVec,dotProduct,Matrix.submatrix_apply]
  change (∑ i:ι,embeddingExtend e x i*(∑ j:ι,M i j*embeddingExtend e x j)) = _
  have h (i : ι) : (∑ j:ι,M i j*embeddingExtend e x j) = ∑ j:κ,M i (e j)*x j := by
    rw [sum_supported_embedding e (fun j=>M i j*embeddingExtend e x j)
      (fun j h => by simp [embeddingExtend_zero_outside e x j h])]
    simp only [embeddingExtend_apply_image]
  simp_rw [h]
  rw [sum_supported_embedding e (fun i=>embeddingExtend e x i*(∑ j:κ,M i (e j)*x j))
    (fun i h => by simp [embeddingExtend_zero_outside e x i h])]
  simp only [embeddingExtend_apply_image]

end XuZhou
