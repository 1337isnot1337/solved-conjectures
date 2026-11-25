module

public import Conjectures.XuZhouScaledQuotient
public import Conjectures.XuZhouThreshold
public import Conjectures.XuZhouQuotientInertia

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {V : Type*} [Fintype V] [DecidableEq V] {n : ℕ}

noncomputable def layerLift (layer : V→Fin n) :
    EuclideanSpace ℝ (Fin n) →ₗ[ℝ] EuclideanSpace ℝ V where
  toFun z := WithLp.toLp 2 (fun v => scaledCoordinate (layerSize layer) z.ofLp (layer v))
  map_add' z w := by
    apply WithLp.ofLp_injective 2
    funext i
    simp [scaledCoordinate,mul_add,add_div]
  map_smul' c x := by
    apply WithLp.ofLp_injective 2
    funext i
    simp [scaledCoordinate,div_eq_mul_inv]
    ring

omit [DecidableEq V] in
@[simp] theorem layerLift_apply (layer : V→Fin n) (z : EuclideanSpace ℝ (Fin n)) (v : V) :
    layerLift layer z v = scaledCoordinate (layerSize layer) z.ofLp (layer v) := by
  unfold layerLift
  rfl

omit [DecidableEq V] in
theorem layerLift_injective (layer : V→Fin n) (h : Function.Surjective layer) :
    Function.Injective (layerLift layer) := by
  intro x y hxy
  apply WithLp.ofLp_injective 2
  funext i
  obtain ⟨v,hv⟩ := h i
  have he := congrArg (fun z : EuclideanSpace ℝ V => z v) hxy
  simp only [layerLift_apply,hv,scaledCoordinate] at he
  have hn : (layerSize layer i:ℝ)≠0 := Nat.cast_ne_zero.mpr (layerSize_pos layer h i).ne'
  field_simp [hn] at he
  exact mul_left_cancel₀ (phase_nonzero i) he

/-- The quotient congruence for the graph Laplacian shifted by four. -/
theorem layerCliqueGraph_shifted_energy (layer : V→Fin n) (h : Function.Surjective layer)
    (z : EuclideanSpace ℝ (Fin n)) :
    quadraticEnergy ((layerCliqueGraph layer).lapMatrix ℝ) (layerLift layer z) -
      4*‖layerLift layer z‖^2 = quadraticEnergy (chainTridiagonal (layerSize layer)) z := by
  let a := layerSize layer
  let v := scaledCoordinate a z.ofLp
  have ha := layerSize_pos layer h
  have hx (i : V) : layerLift layer z i = v (layer i) := layerLift_apply layer z i
  rw [layerCliqueGraph_energy layer v _ hx,layerCliqueGraph_norm layer v _ hx]
  change (∑ i,∑ j,if consecutive i j then
      (a i:ℝ)*(a j:ℝ)*(scaledCoordinate a z.ofLp i-scaledCoordinate a z.ofLp j)^2 else 0)/2 -
    4*(∑ i,(a i:ℝ)*(scaledCoordinate a z.ofLp i)^2) = _
  rw [weighted_adjacent_energy a ha,chainEnergy_explicit]
  have hn (i : Fin n) : (a i:ℝ)*(scaledCoordinate a z.ofLp i)^2 = (z i)^2/(a i:ℝ) :=
    scaled_norm_term a z.ofLp i (ha i)
  simp_rw [hn]
  have hd : (∑ i,((leftSize a i:ℝ)+(rightSize a i:ℝ))*(z i)^2/(a i:ℝ)) -
      4*(∑ i,(z i)^2/(a i:ℝ)) = ∑ i,chainDiag a i*(z i)^2 := by
    rw [Finset.mul_sum,← Finset.sum_sub_distrib]
    apply Finset.sum_congr rfl
    intro i _
    unfold chainDiag
    ring
  linarith only [hd]

omit [DecidableEq V] in
theorem card_eq_layer_count_add_surplus (layer : V→Fin n) (h : Function.Surjective layer) :
    Fintype.card V = n+∑ i,(layerSize layer i-1) := by
  have ha := layerSize_pos layer h
  rw [card_eq_sum_layerSize layer]
  have hh : (∑ _ : Fin n,(1:ℕ)) = n := by simp
  calc
    _ = (∑ _ : Fin n,(1:ℕ)) + ∑ i,(layerSize layer i-1) := by
      rw [← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro i _
      have hi := ha i
      omega
    _ = _ := by rw [hh]

/-- At most twice the total layer surplus contributes eigenvalues at least four.
The count includes equality at the cutoff. -/
theorem cliqueChain_card_eigenvalues_ge_four (layer : V→Fin n) (h : Function.Surjective layer) :
    Fintype.card {i : V // (4:ℝ) ≤ ((layerCliqueGraph layer).isHermitian_lapMatrix ℝ).eigenvalues i} ≤
      2*∑ i,(layerSize layer i-1) := by
  classical
  let a := layerSize layer
  let hM := chainTridiagonal_hermitian a
  let W := strictlyLowSpace hM 0
  let L : W →ₗ[ℝ] EuclideanSpace ℝ V := (layerLift layer).comp W.subtype
  let Z := L.range
  have hf : Function.Injective L := (layerLift_injective layer h).comp Subtype.val_injective
  have hdim : Module.finrank ℝ Z = Fintype.card {i : Fin n // hM.eigenvalues i<0} := by
    change Module.finrank ℝ L.range = _
    rw [LinearMap.finrank_range_of_inj hf]
    exact strictlyLowSpace_finrank hM 0
  have hQ := chainTridiagonal_nonnegative_count (layerSize_pos layer h)
  have hcompl : Fintype.card {i : Fin n // (0:ℝ) ≤ hM.eigenvalues i} =
      n-Fintype.card {i : Fin n // hM.eigenvalues i<0} := by
    simpa only [not_lt,Fintype.card_fin] using Fintype.card_subtype_compl
      (fun i : Fin n => hM.eigenvalues i<0)
  have hlow : n - ∑ i,(a i-1) ≤ Module.finrank ℝ Z := by
    rw [hdim]
    have hQ' : Fintype.card {i : Fin n // 0 ≤ hM.eigenvalues i} ≤ ∑ i,(a i-1) := hQ
    rw [hcompl] at hQ'
    omega
  have hZ (x : Z) (hx : x≠0) :
      quadraticEnergy ((layerCliqueGraph layer).lapMatrix ℝ) x.val < 4*‖x.val‖^2 := by
    obtain ⟨y,hy⟩ := x.property
    have hn : y≠0 := fun hy0 => hx (Subtype.ext (by
      rw [← hy,hy0,map_zero]; rfl))
    have hW := strictlyLowSpace_energy hM 0 y hn
    simp only [zero_mul] at hW
    rw [← hy]
    change quadraticEnergy ((layerCliqueGraph layer).lapMatrix ℝ) (layerLift layer y.val) <
      4*‖layerLift layer y.val‖^2
    rw [← sub_lt_zero,layerCliqueGraph_shifted_energy layer h]
    exact hW
  have ht := card_ge_le_sub_finrank ((layerCliqueGraph layer).isHermitian_lapMatrix ℝ) 4 Z hZ
  have hcard : Fintype.card V = n+∑ i,(a i-1) := card_eq_layer_count_add_surplus layer h
  change _ ≤ 2*(∑ i,(a i-1))
  omega

end XuZhou
