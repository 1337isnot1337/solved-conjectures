module

public import Conjectures.XuZhouDistanceLayers
public import Conjectures.XuZhouLaplacianEnergy
public import Conjectures.XuZhouTridiagonal

@[expose] public section
namespace XuZhou
open Matrix Finset
open scoped Matrix BigOperators InnerProductSpace

variable {V : Type*} [Fintype V] [DecidableEq V] {n : ℕ}

def layerSize (layer : V→Fin n) (i : Fin n) : ℕ := Fintype.card {v : V // layer v=i}

omit [DecidableEq V] in
theorem layerSize_pos (layer : V→Fin n) (h : Function.Surjective layer) (i : Fin n) :
    0 < layerSize layer i := by
  obtain ⟨v,hv⟩ := h i
  let : Nonempty {v : V // layer v=i} := ⟨⟨v,hv⟩⟩
  exact Fintype.card_pos

omit [DecidableEq V] in
theorem card_eq_sum_layerSize (layer : V→Fin n) :
    Fintype.card V = ∑ i,layerSize layer i := by
  rw [← Fintype.card_congr (Equiv.sigmaFiberEquiv layer),Fintype.card_sigma]
  rfl

omit [DecidableEq V] in
theorem sum_by_layer (layer : V→Fin n) (f : Fin n→ℝ) :
    (∑ v,f (layer v)) = ∑ i,(layerSize layer i:ℝ)*f i := by
  let e := Equiv.sigmaFiberEquiv layer
  rw [← Equiv.sum_comp e (fun v => f (layer v)),Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro i _
  have hi (v : {v : V // layer v=i}) : layer (e ⟨i,v⟩)=i := v.property
  simp only [hi,Finset.sum_const,Finset.card_univ,nsmul_eq_mul,layerSize]

omit [DecidableEq V] in
theorem sum_pair_by_layer (layer : V→Fin n) (f : Fin n→Fin n→ℝ) :
    (∑ u,∑ v,f (layer u) (layer v)) =
      ∑ i,∑ j,(layerSize layer i:ℝ)*(layerSize layer j:ℝ)*f i j := by
  have h (i : Fin n) : (∑ v,f i (layer v)) = ∑ j,(layerSize layer j:ℝ)*f i j :=
    sum_by_layer layer (f i)
  simp_rw [h]
  rw [sum_by_layer layer (fun i => ∑ j,(layerSize layer j:ℝ)*f i j)]
  simp only [Finset.mul_sum,mul_assoc]

omit [Fintype V] [DecidableEq V] in
theorem layerCliqueGraph_adj_of_consecutive {layer : V→Fin n} {u v : V}
    (h : consecutive (layer u) (layer v)) : (layerCliqueGraph layer).Adj u v := by
  have hne : u≠v := fun he => (not_consecutive_self (layer u)) (he ▸ h)
  unfold consecutive at h
  exact ⟨hne,by omega,by omega⟩

omit [Fintype V] [DecidableEq V] in
theorem consecutive_of_layerCliqueGraph_adj {layer : V→Fin n} {u v : V}
    (h : (layerCliqueGraph layer).Adj u v) (hne : layer u≠layer v) :
    consecutive (layer u) (layer v) := by
  have hv : (layer u).val≠(layer v).val := fun he => hne (Fin.ext he)
  obtain ⟨_,h1,h2⟩ := h
  unfold consecutive
  omega

theorem layerCliqueGraph_energy (layer : V→Fin n) (v : Fin n→ℝ)
    (x : EuclideanSpace ℝ V) (hx : ∀ u,x u=v (layer u)) :
    quadraticEnergy ((layerCliqueGraph layer).lapMatrix ℝ) x =
      (∑ i,∑ j,if consecutive i j then
        (layerSize layer i:ℝ)*(layerSize layer j:ℝ)*(v i-v j)^2 else 0)/2 := by
  rw [quadraticEnergy_lapMatrix]
  have h (r s : V) :
      (if (layerCliqueGraph layer).Adj r s then (x r-x s)^2 else 0) =
        if consecutive (layer r) (layer s) then (v (layer r)-v (layer s))^2 else 0 := by
    rw [hx,hx]
    by_cases hcon : consecutive (layer r) (layer s)
    · simp [hcon,layerCliqueGraph_adj_of_consecutive hcon]
    · by_cases he : layer r=layer s
      · simp [he,not_consecutive_self]
      · have hn : ¬(layerCliqueGraph layer).Adj r s :=
          fun hh => hcon (consecutive_of_layerCliqueGraph_adj hh he)
        simp [hcon,hn]
  simp_rw [h]
  rw [sum_pair_by_layer layer (fun i j => if consecutive i j then (v i-v j)^2 else 0)]
  congr 1
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  by_cases hcon : consecutive i j <;> simp [hcon]

omit [DecidableEq V] in
theorem layerCliqueGraph_norm (layer : V→Fin n) (v : Fin n→ℝ)
    (x : EuclideanSpace ℝ V) (hx : ∀ u,x u=v (layer u)) :
    ‖x‖^2 = ∑ i,(layerSize layer i:ℝ)*(v i)^2 := by
  rw [← real_inner_self_eq_norm_sq,EuclideanSpace.inner_eq_star_dotProduct]
  simp only [star_trivial,dotProduct,hx]
  simpa [pow_two] using sum_by_layer layer (fun i => v i*v i)

end XuZhou
