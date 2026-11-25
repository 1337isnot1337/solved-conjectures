module

public import Conjectures.McNamaraSteingrimssonRepeatedActualFactors
public import Conjectures.McNamaraSteingrimssonFamilyCounts

@[expose] public section
namespace McNamaraSteingrimsson

theorem classicalPattern_into_anchor {s t : ℕ} {l : Fin s→ℕ} {w : Fin t→ℕ}
    {p : BlockOrder l} {q : BlockOrder w} (f : BlockEmbedding p q) {i : Fin s}
    (hi : 0<l i) (hp : BeginsWithMaximum (p i)) :
    ClassicalPattern (p i) (q (blockEmbedding_anchor f hi)) := by
  let g := blockEmbedding_slots f hi hp
  let j := blockEmbedding_anchor f hi
  have hg (x : Fin (l i)) : f.map ⟨i,x⟩=⟨j,g x⟩ :=
    blockPosition_ext (blockEmbedding_single_label f hi hp x) rfl
  refine ⟨g,blockEmbedding_slots_mono f hi hp,?_⟩
  intro x y
  have h := f.value_iff ⟨i,x⟩ ⟨i,y⟩
  rw [hg x,hg y] at h
  change (p i x).val < (p i y).val ↔ (q j (g x)).val < (q j (g y)).val
  simpa only [blockValueLT,lt_irrefl,false_or,true_and] using h

/-- If the repeated lower endpoint occurs in any product with only one
more block and no width exceeding the long length, then its short
summand is a pattern of the first or second factor. -/
theorem repeatedSource_short_in_initial_two {n A K B : ℕ} {w : Fin (n+2)→ℕ}
    {a : Equiv.Perm (Fin A)} {p : Equiv.Perm (Fin K)}
    (hAK : A<K) (hA : 0<A) (ha : BeginsWithMaximum a) (hp : BeginsWithMaximum p)
    (hB : ∀ i,w i≤B) (hW : ∀ i,w i≤K) (q : BlockOrder w)
    (h : ClassicalPattern (repeatedPattern n a p hAK.le) (blockPermutation hB q)) :
    ClassicalPattern a (q 0) ∨ ClassicalPattern a (q (0 : Fin (n+1)).succ) := by
  let l := repeatedWidths n A K
  let s := repeatedOrders (n := n) a p
  obtain ⟨f⟩ := (blockPermutation_pattern_iff (repeatedWidths_le hAK.le) hB s q).mp h
  let j : Fin (n+2) := blockEmbedding_anchor f (i := 0) hA
  let ht : 0<K := hA.trans hAK
  let g (i : Fin n) := blockEmbedding_anchor f (i := i.succ) ht
  have hg (i : Fin n) : l i.succ=w (g i) := by
    have he := blockEmbedding_size_le f (i := i.succ) ht hp
    exact le_antisymm he (hW (g i))
  have hgt (i : Fin n) : j < g i := by
    have hmono := blockEmbedding_anchor_mono f (i := 0) (j := i.succ) hA ht (Fin.succ_pos i)
    have hne := blockEmbedding_anchor_ne_of_full f (i := i.succ) (j := 0) ht hA hp (hg i)
      (Fin.succ_ne_zero i)
    exact lt_of_le_of_ne hmono (Ne.symm hne)
  have hinj : Function.Injective g := by
    intro i k he
    by_contra hn
    exact blockEmbedding_anchor_ne_of_full f (i := i.succ) (j := k.succ) ht ht hp (hg i)
      (fun e => hn (Fin.succ_injective _ e)) he
  let f' (i : Fin n) : Fin (n+1-j.val) := ⟨(g i).val-(j.val+1),by
    have h₁ : j.val<(g i).val := hgt i
    have h₂ := (g i).isLt
    omega⟩
  have hf' : Function.Injective f' := by
    intro i k he
    have h₁ : j.val<(g i).val := hgt i
    have h₂ : j.val<(g k).val := hgt k
    have hsub : (g i).val-(j.val+1)=(g k).val-(j.val+1) := congrArg Fin.val he
    exact hinj (Fin.ext (by omega))
  have hcard : n≤n+1-j.val := by simpa using Fintype.card_le_of_injective f' hf'
  have hslot : j.val≤1 := by omega
  have hpattern : ClassicalPattern a (q j) := classicalPattern_into_anchor f (i := 0) hA ha
  by_cases h0 : j.val=0
  · exact Or.inl ((show j=(0 : Fin (n+2)) from Fin.ext h0) ▸ hpattern)
  · have h1 : j=(0 : Fin (n+1)).succ := Fin.ext (by
      change j.val=1
      omega)
    exact Or.inr (h1 ▸ hpattern)

end McNamaraSteingrimsson
