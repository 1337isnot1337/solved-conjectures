module

public import Conjectures.McNamaraSteingrimssonShortBlockPlacement

@[expose] public section
namespace McNamaraSteingrimsson

/-- In a two-stage literal embedding, every fully used block of the
composite lies in the actual middle occurrence, not just a separate copy. -/
theorem repeatedMiddle_covers_all_but_one {n A K d : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)} (hAK : A<K)
    (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    {b : Equiv.Perm (Fin d)}
    (hs : ClassicalPattern (repeatedPattern n a p hAK.le) b)
    (ht : ClassicalPattern b (repeatedPattern (n+1) a p hAK.le)) :
    ∃ (miss : Fin (n+1)) (selected : Fin d → BlockPosition (repeatedWidths (n+1) A K)),
      (∀ i j, i<j ↔ blockPositionLT (selected i) (selected j)) ∧
      (∀ i j, b i<b j ↔ blockValueLT (repeatedOrders a p) (selected i) (selected j)) ∧
      (∀ j : Fin (n+1), j≠miss → ∀ x : Fin K, ∃ i, selected i=⟨j.succ,x⟩) ∧
      (miss≠0 → ∀ x : Fin A, ∃ i, selected i=⟨0,x⟩) := by
  obtain ⟨s,hsmono,hso⟩ := hs
  obtain ⟨t,htmono,hto⟩ := ht
  let sw := repeatedWidths n A K
  let tw := repeatedWidths (n+1) A K
  let so := repeatedOrders (n := n) a p
  let hoOrd := repeatedOrders (n := n+1) a p
  let hS := repeatedWidths_le (n := n) hAK.le
  let hT := repeatedWidths_le (n := n+1) hAK.le
  let ps := codeRank (blockPositionCode K) (blockPositionCode_inj hS)
  let pt := codeRank (blockPositionCode K) (blockPositionCode_inj hT)
  let vs := codeRank (blockValueCode K so) (blockValueCode_inj hS so)
  let vt := codeRank (blockValueCode K hoOrd) (blockValueCode_inj hT hoOrd)
  let selected : Fin d → BlockPosition tw := fun i => pt.symm (t i)
  have keyPos (i j : Fin d) : i<j ↔ blockPositionLT (selected i) (selected j) := by
    have eq (i : Fin d) : pt (selected i)=t i := Equiv.apply_symm_apply _ _
    have h := (codeRank_lt_iff (blockPositionCode K) (blockPositionCode_inj hT)
      (selected i) (selected j)).trans (blockPositionCode_lt hT _ _)
    change pt (selected i)<pt (selected j) ↔ _ at h
    rw [eq,eq] at h
    exact (htmono.lt_iff_lt).symm.trans h
  have keyVal (i j : Fin d) : b i<b j ↔ blockValueLT hoOrd (selected i) (selected j) := by
    have h := hto i j
    change b i<b j ↔ vt (selected i)<vt (selected j) at h
    exact h.trans ((codeRank_lt_iff _ _ _ _).trans (blockValueCode_lt hT _ _ _))
  have hspos (x y : BlockPosition sw) : ps x<ps y ↔ blockPositionLT x y :=
    (codeRank_lt_iff _ _ _ _).trans (blockPositionCode_lt hS _ _)
  have hsval (x y : BlockPosition sw) : vs x<vs y ↔ blockValueLT so x y :=
    (codeRank_lt_iff _ _ _ _).trans (blockValueCode_lt hS _ _ _)
  let f : BlockEmbedding so hoOrd := ⟨fun x => selected (s (ps x)),
    (pt.symm.injective.comp htmono.injective).comp (hsmono.injective.comp ps.injective), ?_, ?_⟩
  case refine_1 =>
    intro x y
    exact (hspos _ _).symm.trans (hsmono.lt_iff_lt.symm.trans (keyPos _ _))
  case refine_2 =>
    intro x y
    have h := hso (ps x) (ps y)
    change vs (ps.symm (ps x))<vs (ps.symm (ps y)) ↔ _ at h
    simp only [Equiv.symm_apply_apply] at h
    exact (hsval _ _).symm.trans (h.trans (keyVal _ _))
  have hK : 0<K := hA.trans hAK
  have he (i : Fin n) : BeginsWithMaximum (so i.succ) := hp
  obtain ⟨g,miss,_,hmiss,hfill₀⟩ := repeatedBlocks_one_omission f hK hAK
    (fun _ => rfl) (fun _ => rfl) he
  have hfill (i : Fin n) := (hfill₀ i).choose_spec
  have hmap (i : Fin n) : blockEmbedding_anchor f (i := i.succ) hK=(g i).succ := (hfill i).1
  obtain hshort := shortBlock_placement_of_long_images f hA hK ha hp g miss hmiss hmap
  refine ⟨miss,selected,keyPos,keyVal,?_,?_⟩
  · intro j hj x
    obtain ⟨i,hi⟩ := (hmiss j).mp hj
    subst j
    let y : Fin (tw (blockEmbedding_anchor f (i := i.succ) hK)) := Fin.cast ((hmap i).symm ▸ rfl) x
    obtain ⟨z,hz⟩ := (hfill i).2 y
    refine ⟨s (ps ⟨i.succ,z⟩),?_⟩
    change f.map ⟨i.succ,z⟩=⟨(g i).succ,x⟩
    have hf : (f.map ⟨i.succ,z⟩).fst=(g i).succ := by
      calc
        _ = blockEmbedding_anchor f (i := i.succ) hK :=
          blockEmbedding_single_label f (i := i.succ) hK hp z
        _ = _ := hmap i
    refine blockPosition_ext hf ?_
    change ((f.map ⟨i.succ,z⟩).snd).val=x.val
    simpa [blockEmbedding_slots,y] using congrArg Fin.val hz
  · intro hm x
    obtain ⟨hz0,hsurj⟩ := hshort.resolve_right (fun h => hm h.1)
    let y : Fin (tw (blockEmbedding_anchor f (i := 0) hA)) := Fin.cast (hz0.symm ▸ rfl) x
    obtain ⟨z,hz⟩ := hsurj y
    refine ⟨s (ps ⟨0,z⟩),?_⟩
    change f.map ⟨0,z⟩=⟨0,x⟩
    have hf : (f.map ⟨0,z⟩).fst=0 := by
      calc
        _ = blockEmbedding_anchor f (i := 0) hA :=
          blockEmbedding_single_label f (i := 0) hA ha z
        _ = _ := hz0
    refine blockPosition_ext hf ?_
    change ((f.map ⟨0,z⟩).snd).val=x.val
    simpa [blockEmbedding_slots,y] using congrArg Fin.val hz

end McNamaraSteingrimsson
