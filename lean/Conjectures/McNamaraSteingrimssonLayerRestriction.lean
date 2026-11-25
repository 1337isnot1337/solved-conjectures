module

public import Conjectures.McNamaraSteingrimssonNormalize
public import Mathlib.Data.List.OfFn

@[expose] public section
namespace McNamaraSteingrimsson

open Finset

def usedLayerLabels {v : List Bool} (S : Finset (LayerPosition v)) : Finset (Fin v.length) :=
  S.image Sigma.fst

abbrev UsedLayer {v : List Bool} (S : Finset (LayerPosition v)) :=
  {i : Fin v.length // i ∈ usedLayerLabels S}

abbrev LayerFiber {v : List Bool} (S : Finset (LayerPosition v)) (i : UsedLayer S) :=
  {j : Fin (sizedAt v i.val) // (⟨i.val,j⟩ : LayerPosition v) ∈ S}

theorem layerFiber_card_bounds {v : List Bool} (S : Finset (LayerPosition v)) (i : UsedLayer S) :
    1≤Fintype.card (LayerFiber S i) ∧ Fintype.card (LayerFiber S i)≤2 := by
  classical
  refine ⟨?_,?_⟩
  · obtain ⟨⟨k,j⟩,hj,hk⟩ := Finset.mem_image.mp i.property
    have h : k=i.val := hk
    subst k
    exact Fintype.card_pos_iff.mpr ⟨⟨j,hj⟩⟩
  · exact (Fintype.card_le_of_injective Subtype.val Subtype.val_injective).trans
      (by simpa using sizedAt_le_two v i.val)

def chosenLayerSlots {v : List Bool} (S : Finset (LayerPosition v)) :
    {p : LayerPosition v // p ∈ S} ≃ (Σ i : UsedLayer S, LayerFiber S i) where
  toFun p := ⟨⟨p.val.fst,mem_image_of_mem Sigma.fst p.property⟩, ⟨p.val.snd,p.property⟩⟩
  invFun q := ⟨⟨q.fst.val,q.snd.val⟩,q.snd.property⟩
  left_inv p := by rcases p with ⟨⟨i,j⟩,h⟩; rfl
  right_inv p := by rcases p with ⟨⟨i,hi⟩,⟨j,hj⟩⟩; rfl

noncomputable def usedLayerOrder {v : List Bool} (S : Finset (LayerPosition v)) :
    Fin (Fintype.card (UsedLayer S)) ≃o UsedLayer S :=
  Fintype.orderIsoFinOfCardEq _ rfl

noncomputable def restrictionWord {v : List Bool} (S : Finset (LayerPosition v)) : List Bool :=
  List.ofFn fun k : Fin (Fintype.card (UsedLayer S)) =>
    decide (Fintype.card (LayerFiber S (usedLayerOrder S k))=2)

theorem restrictionWord_length {v : List Bool} (S : Finset (LayerPosition v)) :
    (restrictionWord S).length=Fintype.card (UsedLayer S) := by simp [restrictionWord]

noncomputable def restrictionLayerOrder {v : List Bool} (S : Finset (LayerPosition v)) :
    Fin (restrictionWord S).length ≃o UsedLayer S :=
  (Fin.castOrderIso (restrictionWord_length S)).trans (usedLayerOrder S)

theorem restrictionWord_sizedAt {v : List Bool} (S : Finset (LayerPosition v))
    (i : Fin (restrictionWord S).length) :
    sizedAt (restrictionWord S) i=Fintype.card (LayerFiber S (restrictionLayerOrder S i)) := by
  let c := Fintype.card (LayerFiber S (restrictionLayerOrder S i))
  have hv : (restrictionWord S).get i=decide (c=2) := by
    exact List.get_ofFn
      (fun k : Fin (Fintype.card (UsedLayer S)) =>
        decide (Fintype.card (LayerFiber S (usedLayerOrder S k))=2)) i
  change layerSize ((restrictionWord S).get i)=c
  rw [hv]
  by_cases h : c=2
  · simp [layerSize,h]
  · obtain ⟨h1,h2⟩ := layerFiber_card_bounds S (restrictionLayerOrder S i)
    change 1≤c at h1
    change c≤2 at h2
    have hc : c=1 := by omega
    simp [layerSize,hc]

noncomputable def layerFiberOrder {v : List Bool} (S : Finset (LayerPosition v)) (i : UsedLayer S) :
    LayerFiber S i ≃ Fin (Fintype.card (LayerFiber S i)) :=
  codeRank (fun j : LayerFiber S i => j.val.val)
    (fun _ _ h => Subtype.ext (Fin.ext h))

theorem layerFiberOrder_lt_iff {v : List Bool} (S : Finset (LayerPosition v)) (i : UsedLayer S)
    (a b : LayerFiber S i) :
    layerFiberOrder S i a < layerFiberOrder S i b ↔ a.val.val < b.val.val :=
  codeRank_lt_iff _ _ _ _

noncomputable def layerRestrictionEquiv {v : List Bool} (S : Finset (LayerPosition v)) :
    LayerPosition (restrictionWord S) ≃ {p : LayerPosition v // p∈S} :=
  (Equiv.sigmaCongr (restrictionLayerOrder S).toEquiv fun i =>
    (Fin.castOrderIso (restrictionWord_sizedAt S i)).toEquiv.trans
      (layerFiberOrder S (restrictionLayerOrder S i)).symm).trans (chosenLayerSlots S).symm

theorem layerRestriction_fst {v : List Bool} (S : Finset (LayerPosition v))
    (p : LayerPosition (restrictionWord S)) :
    (layerRestrictionEquiv S p).val.fst=(restrictionLayerOrder S p.fst).val := rfl

private theorem layerRestriction_slot_lt {v : List Bool} (S : Finset (LayerPosition v))
    (i : Fin (restrictionWord S).length) (a b : Fin (sizedAt (restrictionWord S) i)) :
    (layerRestrictionEquiv S ⟨i,a⟩).val.snd.val <
      (layerRestrictionEquiv S ⟨i,b⟩).val.snd.val ↔ a.val < b.val := by
  let e := layerFiberOrder S (restrictionLayerOrder S i)
  let k := Fin.cast (restrictionWord_sizedAt S i)
  change (e.symm (k a)).val.val < (e.symm (k b)).val.val ↔ a.val < b.val
  rw [← layerFiberOrder_lt_iff S (restrictionLayerOrder S i)]
  change e (e.symm (k a)) < e (e.symm (k b)) ↔ _
  simp only [Equiv.apply_symm_apply]
  rfl

theorem layerRestriction_preserves_order {v : List Bool} (S : Finset (LayerPosition v))
    (p q : LayerPosition (restrictionWord S)) :
    (positionLT p q ↔ positionLT (layerRestrictionEquiv S p).val (layerRestrictionEquiv S q).val) ∧
      (valueLT p q ↔ valueLT (layerRestrictionEquiv S p).val (layerRestrictionEquiv S q).val) := by
  rcases p with ⟨i,a⟩
  rcases q with ⟨j,b⟩
  by_cases hij : i=j
  · subst j
    constructor
    · simp only [positionLT,layerRestriction_fst,lt_irrefl,false_or,true_and]
      exact (layerRestriction_slot_lt S i a b).symm
    · simp only [valueLT,layerRestriction_fst,lt_irrefl,false_or,true_and]
      exact (layerRestriction_slot_lt S i b a).symm
  · constructor <;> simp [positionLT,valueLT,layerRestriction_fst,hij]

theorem restrictionWord_subword {v : List Bool} (S : Finset (LayerPosition v)) :
    LayerSubword (restrictionWord S) v := by
  apply layerPattern_iff_subword.mp
  refine ⟨fun p => (layerRestrictionEquiv S p).val,
    Subtype.val_injective.comp (layerRestrictionEquiv S).injective, ?_,?_⟩
  · intro p q
    exact (layerRestriction_preserves_order S p q).1
  · intro p q
    exact (layerRestriction_preserves_order S p q).2

/-- An arbitrary selected subpermutation of a layered permutation is layered.
The canonical word comes from the nonempty intersections with host layers. -/
theorem subpattern_of_layered_is_layered {m : ℕ} {v : List Bool} {p : Equiv.Perm (Fin m)}
    (h : ClassicalPattern p (layerPermutation v)) :
    ∃ w : List Bool, LayerSubword w v ∧ ClassicalPattern p (layerPermutation w) ∧
      ClassicalPattern (layerPermutation w) p := by
  classical
  obtain ⟨f,hf,ho⟩ := h
  let pv := codeRank (@posCode v) (posCode_inj v)
  let vv := codeRank (@valCode v) (valCode_inj v)
  let selection : Fin m → LayerPosition v := fun i => pv.symm (f i)
  let S := Finset.univ.image selection
  let w := restrictionWord S
  let e := layerRestrictionEquiv S
  let pw := codeRank (@posCode w) (posCode_inj w)
  let vw := codeRank (@valCode w) (valCode_inj w)
  have hpv (a b : LayerPosition v) : pv a < pv b ↔ positionLT a b :=
    (codeRank_lt_iff _ _ _ _).trans (posCode_lt_iff _ _)
  have hvv (a b : LayerPosition v) : vv a < vv b ↔ valueLT a b :=
    (codeRank_lt_iff _ _ _ _).trans (valCode_lt_iff _ _)
  have hpw (a b : LayerPosition w) : pw a < pw b ↔ positionLT a b :=
    (codeRank_lt_iff _ _ _ _).trans (posCode_lt_iff _ _)
  have hvw (a b : LayerPosition w) : vw a < vw b ↔ valueLT a b :=
    (codeRank_lt_iff _ _ _ _).trans (valCode_lt_iff _ _)
  let sel : Fin m ≃ {z : LayerPosition v // z ∈ S} :=
    Equiv.ofBijective (fun i => ⟨selection i,Finset.mem_image_of_mem _ (Finset.mem_univ i)⟩)
      ⟨fun _ _ e => hf.injective (pv.symm.injective (congrArg (fun x : {z : LayerPosition v // z ∈ S} => x.val) e)),
      fun ⟨z,hz⟩ => by
        obtain ⟨i,_,hi⟩ := Finset.mem_image.mp hz
        exact ⟨i,Subtype.ext hi⟩⟩
  let g : Fin m ≃ Fin (Fintype.card (LayerPosition w)) := (sel.trans e.symm).trans pw
  have hg' (i : Fin m) : pw.symm (g i) = e.symm (sel i) := by
    simp [g]
  have he' (i : Fin m) : (e (pw.symm (g i))).val=selection i := by
    rw [hg',Equiv.apply_symm_apply]
    rfl
  have hg : StrictMono g := by
    intro i j hij
    have hpos : positionLT (selection i) (selection j) := by
      apply (hpv _ _).mp
      simpa [selection] using hf hij
    have he := (layerRestriction_preserves_order S (pw.symm (g i)) (pw.symm (g j))).1
    rw [show layerRestrictionEquiv S=e from rfl,he',he'] at he
    have h' := (hpw _ _).mpr (he.mpr hpos)
    simpa only [Equiv.apply_symm_apply] using h'
  have horder (i j : Fin m) :
      p i < p j ↔ layerPermutation w (g i) < layerPermutation w (g j) := by
    change p i < p j ↔ vw (pw.symm (g i)) < vw (pw.symm (g j))
    rw [hvw]
    have he := (layerRestriction_preserves_order S (pw.symm (g i)) (pw.symm (g j))).2
    rw [show layerRestrictionEquiv S=e from rfl,he',he'] at he
    rw [he,← hvv]
    exact ho i j
  refine ⟨w,restrictionWord_subword S,⟨g,hg,horder⟩,g.symm,?_,?_⟩
  · intro i j hi
    apply hg.lt_iff_lt.mp
    simpa only [Equiv.apply_symm_apply] using hi
  · intro i j
    have he := (horder (g.symm i) (g.symm j)).symm
    simpa only [Equiv.apply_symm_apply] using he

end McNamaraSteingrimsson
