module

public import Conjectures.XuZhouScaledQuotient

@[expose] public section
namespace XuZhou
open Finset
open scoped BigOperators
variable {n : ℕ} {V : Type*} [Fintype V] [DecidableEq V]

private theorem layer_close_iff (i j : Fin n) :
    (i.val≤ j.val+1 ∧ j.val≤ i.val+1) ↔ i=j ∨ consecutive i j := by
  constructor
  · rintro ⟨h1,h2⟩
    by_cases h : i.val=j.val
    · exact Or.inl (Fin.ext h)
    · right; unfold consecutive; omega
  · rintro (h | h)
    · subst j; omega
    · unfold consecutive at h; omega

theorem layerCliqueGraph_degree (layer : V→Fin n) (u : V) :
    (layerCliqueGraph layer).degree u =
      layerSize layer (layer u)+leftSize (layerSize layer) (layer u)+
        rightSize (layerSize layer) (layer u)-1 := by
  let a := layerSize layer
  let i := layer u
  let H := layerCliqueGraph layer
  let C := (Finset.univ : Finset V).filter (fun v => i=layer v ∨ consecutive i (layer v))
  have hu : u∈C := by exact Finset.mem_filter.mpr ⟨Finset.mem_univ _,Or.inl rfl⟩
  have hN : H.neighborFinset u = C.erase u := by
    ext v
    rw [SimpleGraph.mem_neighborFinset,Finset.mem_erase]
    change (u≠v ∧ ((layer u).val ≤ (layer v).val+1 ∧
      (layer v).val ≤ (layer u).val+1)) ↔ v≠u ∧ v∈ C
    rw [layer_close_iff,show (u≠v) ↔ (v≠u) from ne_comm]
    simp only [C,Finset.mem_filter,Finset.mem_univ,true_and,i]
  have hc : C.card=a i+leftSize a i+rightSize a i := by
    suffices h : (C.card:ℝ)=(a i:ℝ)+leftSize a i+rightSize a i by exact_mod_cast h
    change (((Finset.univ : Finset V).filter (fun v =>
      i=layer v ∨ consecutive i (layer v))).card:ℝ)=_
    rw [Finset.card_eq_sum_ones,Nat.cast_sum,Finset.sum_filter]
    push_cast
    rw [sum_by_layer layer (fun j => if i=j ∨ consecutive i j then (1:ℝ) else 0)]
    have hterm (j : Fin n) : (a j:ℝ)*(if i=j ∨ consecutive i j then 1 else 0) =
        (if i=j then (a i:ℝ) else 0)+(if consecutive i j then (a j:ℝ) else 0) := by
      by_cases h : i=j
      · subst j
        simp [not_consecutive_self]
      · by_cases hc' : consecutive i j <;> simp [h,hc']
    simp_rw [show layerSize layer=a from rfl,hterm]
    rw [Finset.sum_add_distrib,Finset.sum_ite_eq,consecutive_weight_sum]
    simp [add_assoc]
  change H.degree u=_
  rw [SimpleGraph.degree,hN,Finset.card_erase_of_mem hu,hc]

end XuZhou
