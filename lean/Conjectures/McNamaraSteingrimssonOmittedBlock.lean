module

public import Conjectures.McNamaraSteingrimssonBlockEmbeddings

@[expose] public section
namespace McNamaraSteingrimsson

/-- The long copies in a sum-indecomposable source must occupy different
long host blocks. One more host copy means there is exactly one omission. -/
theorem repeatedBlocks_one_omission {n K : ℕ} {lengths : Fin (n+1)→ℕ}
    {widths : Fin (n+2)→ℕ} {p : BlockOrder lengths} {q : BlockOrder widths}
    (f : BlockEmbedding p q) (hK : 0<K) (hhead : widths 0<K)
    (hsize : ∀ i : Fin n,lengths i.succ=K)
    (hhost : ∀ j : Fin (n+1),widths j.succ=K)
    (hmax : ∀ i : Fin n,BeginsWithMaximum (p i.succ)) :
    ∃ (g : Fin n→Fin (n+1)) (miss : Fin (n+1)), StrictMono g ∧
      (∀ j : Fin (n+1), j≠miss ↔ ∃ i : Fin n,g i=j) ∧
      ∀ i : Fin n, ∃ hp : 0<lengths i.succ,
        blockEmbedding_anchor f hp=(g i).succ ∧
          Function.Surjective (blockEmbedding_slots f hp (hmax i)) := by
  classical
  let hp (i : Fin n) : 0<lengths i.succ := (hsize i).symm ▸ hK
  let a (i : Fin n) : Fin (n+2) := blockEmbedding_anchor f (hp i)
  have hne (i : Fin n) : a i≠0 := by
    intro he
    have h := blockEmbedding_size_le f (hp i) (hmax i)
    change lengths i.succ≤widths (a i) at h
    rw [hsize,he] at h
    exact (not_le_of_gt hhead) h
  let g (i : Fin n) : Fin (n+1) := (a i).pred (hne i)
  have hg (i : Fin n) : (g i).succ=a i := Fin.succ_pred _ _
  have heq (i : Fin n) : lengths i.succ=widths (a i) := by
    rw [← hg i,hsize,hhost]
  have hfull (i : Fin n) : Function.Surjective (blockEmbedding_slots f (hp i) (hmax i)) :=
    blockEmbedding_slots_surj_of_eq f (hp i) (hmax i) (heq i)
  have hmono : StrictMono g := by
    intro i j hij
    have hle := blockEmbedding_anchor_mono f (hp i) (hp j) (Fin.succ_lt_succ_iff.mpr hij)
    have hne' := blockEmbedding_anchor_ne_of_full f (hp i) (hp j) (hmax i) (heq i)
      (fun e => hij.ne (Fin.succ_injective _ e))
    apply Fin.succ_lt_succ_iff.mp
    rw [hg i,hg j]
    exact lt_of_le_of_ne hle hne'
  let used : Finset (Fin (n+1)) := Finset.univ.image g
  have hused : used.card=n := by
    simp [used,Finset.card_image_of_injective,hmono.injective]
  have hc : usedᶜ.card=1 := by
    rw [Finset.card_compl,Fintype.card_fin,hused]
    omega
  obtain ⟨miss,hm⟩ := Finset.card_eq_one.mp hc
  refine ⟨g,miss,hmono,?_,?_⟩
  · intro j
    have h : j∉used ↔ j=miss := by
      rw [← Finset.mem_compl,hm,Finset.mem_singleton]
    have hm' : j∈used ↔ ∃ i,g i=j := by simp [used]
    rw [← hm']
    simpa only [not_not] using (not_congr h.symm)
  · intro i
    exact ⟨hp i,(hg i).symm,hfull i⟩

end McNamaraSteingrimsson
