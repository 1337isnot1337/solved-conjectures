module

public import Conjectures.XuZhouSharpBlockEnergy
public import Conjectures.XuZhouSharpSpectral
public import Conjectures.XuZhouLaplacianSpectralUpper

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators

theorem sharpGraph_high_ge (t : ℕ) :
    2*t ≤ Fintype.card {i : SharpVertex t //
      (4:ℝ) ≤ ((sharpGraph t).isHermitian_lapMatrix ℝ).eigenvalues i} := by
  let e := sharpBlockEmbedding t
  let L : (Fin t×Fin 2→ℝ) →ₗ[ℝ] EuclideanSpace ℝ (SharpVertex t) :=
    (embeddingExtend e).comp (sharpBlockWeights t)
  let W := L.range
  have hi : Function.Injective L :=
    (embeddingExtend_injective e).comp (sharpBlockWeights_injective t)
  have hdim : Module.finrank ℝ W=2*t := by
    change Module.finrank ℝ L.range=_
    rw [LinearMap.finrank_range_of_inj hi]
    simp [Fintype.card_prod,Nat.mul_comm]
  have hW (x : W) :
      4*‖x.val‖^2 ≤ quadraticEnergy ((sharpGraph t).lapMatrix ℝ) x.val := by
    obtain ⟨c,hc⟩ := x.property
    rw [←hc]
    change 4*‖embeddingExtend e (sharpBlockWeights t c)‖^2 ≤
      quadraticEnergy ((sharpGraph t).lapMatrix ℝ) (embeddingExtend e (sharpBlockWeights t c))
    rw [embeddingExtend_norm_square,embeddingExtend_energy_submatrix]
    exact sharpBlockWeights_lower c
  rw [←hdim]
  exact finrank_le_card_ge_of_quadratic_lower ((sharpGraph t).isHermitian_lapMatrix ℝ) 4 W hW

theorem sharpGraph_high_count (t : ℕ) :
    Fintype.card {i : SharpVertex t //
      (4:ℝ) ≤ ((sharpGraph t).isHermitian_lapMatrix ℝ).eigenvalues i}=2*t := by
  apply le_antisymm _ (sharpGraph_high_ge t)
  have H := cliqueChain_card_eigenvalues_ge_four (sharpLayer t) (sharpLayer_surjective t)
  rw [sharpLayer_surplus] at H
  exact H

theorem sharpGraph_closed_count (t : ℕ) :
    laplacianCount (sharpGraph t) 4 (Fintype.card (SharpVertex t):ℝ)=2*t := by
  let h := (sharpGraph t).isHermitian_lapMatrix ℝ
  let e : {i : SharpVertex t // (4:ℝ) ≤ h.eigenvalues i ∧
      h.eigenvalues i ≤ (Fintype.card (SharpVertex t):ℝ)} ≃
      {i : SharpVertex t // (4:ℝ) ≤ h.eigenvalues i} :=
    { toFun := fun x => ⟨x.val,x.property.1⟩
      invFun := fun x => ⟨x.val,x.property,laplacian_eigenvalue_le_card (sharpGraph t) x.val⟩
      left_inv := fun _ => rfl
      right_inv := fun _ => rfl }
  unfold laplacianCount
  exact (Fintype.card_congr e).trans (sharpGraph_high_count t)

/-- The original inequality is attained for every positive number of doubled
layers. In particular the attaining parameter c=t−1 is unbounded. -/
theorem diameter_laplacian_sharp_family (t : ℕ) (ht : 1≤t) :
    let G := sharpGraph t
    let n := Fintype.card (SharpVertex t)
    let d := G.diam
    let c := t-1
    G.Connected ∧ d=4*t ∧ n=5*t+1 ∧
      2≤d ∧ c≤d-2 ∧ d≤n-2-c ∧
      laplacianCount G ((n-d+2-c:ℕ):ℝ) (n:ℝ)=n-d+c := by
  dsimp only
  have hd := sharpGraph_diameter ht
  have hn := sharpVertex_card t
  have hc := sharpGraph_closed_count t
  refine ⟨sharpGraph_connected ht,hd,hn,by omega,by omega,by omega,?_⟩
  have hcut : Fintype.card (SharpVertex t)-(sharpGraph t).diam+2-(t-1)=4 := by omega
  have hval : Fintype.card (SharpVertex t)-(sharpGraph t).diam+(t-1)=2*t := by omega
  rw [hcut,hval]
  simpa using hc

end XuZhou
