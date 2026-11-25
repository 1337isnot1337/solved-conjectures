module

public import Conjectures.XuZhouCliqueDiameter
public import Conjectures.XuZhouDiameter

@[expose] public section
namespace XuZhou
open Finset
open scoped BigOperators

abbrev SharpIndex (t : ℕ) := Fin (4*t+1)

def doubled {t : ℕ} (i : SharpIndex t) : Prop := i.val % 4 = 2

instance {t : ℕ} (i : SharpIndex t) : Decidable (doubled i) := by unfold doubled; infer_instance

def sharpSize {t : ℕ} (i : SharpIndex t) : ℕ := if doubled i then 2 else 1

theorem sharpSize_pos {t : ℕ} (i : SharpIndex t) : 0<sharpSize i := by
  unfold sharpSize
  split <;> decide

def sharpDoubledEquiv (t : ℕ) : Fin t ≃ {i : SharpIndex t // doubled i} where
  toFun j := ⟨⟨4*j.val+2,by have h := j.isLt; omega⟩, by unfold doubled; change (4*j.val+2)%4=2; omega⟩
  invFun x := ⟨x.val.val/4,by
    have h := x.val.isLt
    have hr := x.property
    unfold doubled at hr
    omega⟩
  left_inv j := by
    apply Fin.ext
    change (4*j.val+2)/4=j.val
    omega
  right_inv j := by
    apply Subtype.ext
    apply Fin.ext
    change 4*(j.val.val/4)+2=j.val.val
    have h := j.property
    unfold doubled at h
    omega

abbrev SharpVertex (t : ℕ) := Σ i : SharpIndex t, Fin (sharpSize i)

def sharpLayer (t : ℕ) (v : SharpVertex t) : SharpIndex t := v.1

def sharpGraph (t : ℕ) : SimpleGraph (SharpVertex t) := layerCliqueGraph (sharpLayer t)

theorem sharpLayer_surjective (t : ℕ) : Function.Surjective (sharpLayer t) :=
  fun i => ⟨⟨i,⟨0,sharpSize_pos i⟩⟩,rfl⟩

def sharpFiberEquiv {t : ℕ} (i : SharpIndex t) :
    {v : SharpVertex t // sharpLayer t v=i} ≃ Fin (sharpSize i) where
  toFun v := (finCongr (congrArg sharpSize v.property)) v.val.2
  invFun j := ⟨⟨i,j⟩,rfl⟩
  left_inv v := by
    rcases v with ⟨⟨j,w⟩,h⟩
    change j=i at h
    subst j
    rfl
  right_inv j := rfl

theorem sharpLayer_size {t : ℕ} (i : SharpIndex t) : layerSize (sharpLayer t) i=sharpSize i := by
  rw [layerSize,Fintype.card_congr (sharpFiberEquiv i),Fintype.card_fin]

theorem sharpLayer_surplus (t : ℕ) : (∑ i,(layerSize (sharpLayer t) i-1))=t := by
  have h : (∑ i : SharpIndex t,(sharpSize i-1)) =
      (Finset.univ.filter (fun i : SharpIndex t => doubled i)).card := by
    rw [Finset.card_eq_sum_ones,Finset.sum_filter]
    apply Finset.sum_congr rfl
    intro i _
    unfold sharpSize
    by_cases hi : doubled i <;> simp [hi]
  simp_rw [sharpLayer_size]
  rw [h,← Fintype.card_subtype]
  simpa using (Fintype.card_congr (sharpDoubledEquiv t)).symm

theorem sharpVertex_card (t : ℕ) : Fintype.card (SharpVertex t)=5*t+1 := by
  rw [card_eq_layer_count_add_surplus (sharpLayer t) (sharpLayer_surjective t),sharpLayer_surplus]
  omega

theorem sharpGraph_diameter {t : ℕ} (ht : 1≤t) : (sharpGraph t).diam=4*t := by
  rw [sharpGraph,layerCliqueGraph_diameter (sharpLayer_surjective t) (by omega)]
  omega

theorem sharpGraph_connected {t : ℕ} (ht : 1≤t) : (sharpGraph t).Connected :=
  layerCliqueGraph_connected (sharpLayer_surjective t) (by omega)

end XuZhou
