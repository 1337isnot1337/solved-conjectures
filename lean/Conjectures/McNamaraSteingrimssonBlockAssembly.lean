module

public import Conjectures.McNamaraSteingrimssonBlockUncons
public import Conjectures.McNamaraSteingrimssonRepeatedPatternShape

@[expose] public section
namespace McNamaraSteingrimsson

/-- Ordered block injection and ordinary containment in each selected
block give containment of the actual direct sums. -/
theorem classicalPattern_of_block_matches {s t B C : ℕ}
    {w : Fin s→ℕ} {v : Fin t→ℕ} (hB : ∀ i,w i≤B) (hC : ∀ j,v j≤C)
    (p : BlockOrder w) (q : BlockOrder v)
    (g : Fin s→Fin t) (hg : StrictMono g)
    (h : ∀ i,ClassicalPattern (p i) (q (g i))) :
    ClassicalPattern (blockPermutation hB p) (blockPermutation hC q) := by
  classical
  choose f hf ho using h
  let e (x : BlockPosition w) : BlockPosition v := ⟨g x.fst,f x.fst x.snd⟩
  have hI : Function.Injective e := by
    intro x y H
    rcases x with ⟨i,x⟩
    rcases y with ⟨j,y⟩
    have hJ : i=j := hg.injective (congrArg Sigma.fst H)
    subst j
    have hF := congrArg (fun z : BlockPosition v => z.snd.val) H
    change (f i x).val=(f i y).val at hF
    exact congrArg (Sigma.mk i) ((hf i).injective (Fin.ext hF))
  apply (blockPermutation_pattern_iff hB hC p q).mpr
  refine ⟨⟨e,hI,?_,?_⟩⟩
  · rintro ⟨i,x⟩ ⟨j,y⟩
    rcases lt_trichotomy i j with hij|rfl|hji
    · exact iff_of_true (Or.inl hij) (Or.inl (hg hij))
    · change i < i ∨ i=i ∧ x.val<y.val ↔
        g i < g i ∨ g i=g i ∧ (f i x).val<(f i y).val
      simp only [lt_irrefl,false_or,true_and]
      exact (hf i).lt_iff_lt.symm
    · exact iff_of_false
        (fun H => H.elim (lt_asymm hji) (fun H => hji.ne H.1.symm))
        (fun H => H.elim (lt_asymm (hg hji)) (fun H => (hg hji).ne H.1.symm))
  · rintro ⟨i,x⟩ ⟨j,y⟩
    rcases lt_trichotomy i j with hij|rfl|hji
    · exact iff_of_true (Or.inl hij) (Or.inl (hg hij))
    · change i < i ∨ i=i ∧ (p i x).val<(p i y).val ↔
        g i < g i ∨ g i=g i ∧ (q (g i) (f i x)).val<(q (g i) (f i y)).val
      simp only [lt_irrefl,false_or,true_and]
      exact ho i x y
    · exact iff_of_false
        (fun H => H.elim (lt_asymm hji) (fun H => hji.ne H.1.symm))
        (fun H => H.elim (lt_asymm (hg hji)) (fun H => (hg hji).ne H.1.symm))

/-- The permutation itself recovers every local ordering once the
sizes and order of the factors are fixed. -/
theorem blockPermutation_orders_injective {s B C : ℕ} {w : Fin s→ℕ}
    (hB : ∀ i,w i≤B) (hC : ∀ i,w i≤C) {p q : BlockOrder w}
    (h : blockPermutation hB p=blockPermutation hC q) : p=q := by
  funext i
  apply Equiv.ext
  intro x
  have h₁ := congrArg (fun q : Equiv.Perm (Fin (Fintype.card (BlockPosition w))) =>
    q (blockOffsetCode ⟨i,x⟩)) h
  simp only [blockPermutation_at_offset] at h₁
  have h₂ := blockOffsetCode_injective h₁
  exact Fin.ext (congrArg (fun z : BlockPosition w => z.snd.val) h₂)

end McNamaraSteingrimsson
