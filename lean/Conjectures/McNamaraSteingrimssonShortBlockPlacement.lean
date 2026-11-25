module

public import Conjectures.McNamaraSteingrimssonRepeatedPatternShape

@[expose] public section
namespace McNamaraSteingrimsson

/-- If a long slot other than the first is omitted, the short initial
source summand must fill the short initial host summand. If the short
summand instead lands in a long host, that host is the omitted first copy. -/
theorem shortBlock_placement_of_long_images {n A K : ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)}
    (f : BlockEmbedding (repeatedOrders (n := n) a p) (repeatedOrders (n := n+1) a p))
    (hA : 0<A) (hK : 0<K) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (g : Fin n→Fin (n+1)) (miss : Fin (n+1))
    (hmiss : ∀ j : Fin (n+1), j≠miss ↔ ∃ i : Fin n,g i=j)
    (hmap : ∀ i : Fin n, blockEmbedding_anchor f (i := i.succ) hK=(g i).succ) :
    let α := blockEmbedding_anchor f (i := 0) hA
    (α=0 ∧ Function.Surjective (blockEmbedding_slots f (i := 0) hA ha)) ∨
      (miss=0 ∧ α=(0 : Fin (n+1)).succ) := by
  dsimp only
  let α := blockEmbedding_anchor f (i := 0) hA
  by_cases ha0 : α=0
  · left
    refine ⟨ha0,blockEmbedding_slots_surj_of_eq _ _ _ ?_⟩
    change A=repeatedWidths (n+1) A K α
    rw [ha0,repeatedWidths_head]
  · right
    let j := α.pred ha0
    have hj : j.succ=α := Fin.succ_pred _ _
    have hnot (i : Fin n) : g i≠j := by
      intro he
      have hwidth : repeatedWidths n A K i.succ =
          repeatedWidths (n+1) A K (blockEmbedding_anchor f (i := i.succ) hK) := by
        rw [hmap i,repeatedWidths_tail,repeatedWidths_tail]
      have hn := blockEmbedding_anchor_ne_of_full f (i := i.succ) (j := 0) hK hA hp hwidth
        (Fin.succ_ne_zero i)
      exact hn ((hmap i).trans ((congrArg Fin.succ he).trans hj))
    have hm : j=miss := by
      by_contra! h
      obtain ⟨i,hi⟩ := (hmiss j).mp h
      exact hnot i hi
    have hm0 : miss=0 := by
      by_contra! h
      have h0 : (0 : Fin (n+1))≠miss := Ne.symm h
      obtain ⟨i,hi⟩ := (hmiss (0 : Fin (n+1))).mp h0
      have ha_le := blockEmbedding_anchor_mono f (i := 0) (j := i.succ) hA hK
        (Fin.pos_iff_ne_zero.mpr (Fin.succ_ne_zero i))
      change α≤blockEmbedding_anchor f (i := i.succ) hK at ha_le
      rw [hmap i, hi, ← hj,hm,Fin.succ_le_succ_iff] at ha_le
      exact h (Fin.le_zero_iff.mp ha_le)
    refine ⟨hm0,?_⟩
    exact hj.symm.trans (congrArg Fin.succ (hm.trans hm0))

end McNamaraSteingrimsson
