module

public import Conjectures.McNamaraSteingrimssonPointed

@[expose] public section
namespace McNamaraSteingrimsson

theorem tail_val_lt {n : ℕ} (p : Equiv.Perm (Fin (n+1))) (h : p 0=Fin.last n)
    (i : Fin n) : (p i.succ).val<n := by
  have hle := Fin.le_last (p i.succ)
  have hne : p i.succ≠Fin.last n := fun hi => Fin.succ_ne_zero i (p.injective (hi.trans h.symm))
  exact lt_of_le_of_ne hle (fun he => hne (Fin.ext he))

theorem preimage_tail_ne_zero {n : ℕ} (p : Equiv.Perm (Fin (n+1)))
    (h : p 0=Fin.last n) (j : Fin n) : p.symm j.castSucc≠0 := by
  intro he
  have hc := congrArg p he
  rw [Equiv.apply_symm_apply,h] at hc
  exact (Fin.castSucc_lt_last j).ne hc

def unpoint {n : ℕ} (p : Equiv.Perm (Fin (n+1))) (h : p 0=Fin.last n) :
    Equiv.Perm (Fin n) where
  toFun i := ⟨(p i.succ).val,tail_val_lt p h i⟩
  invFun j := (p.symm j.castSucc).pred (preimage_tail_ne_zero p h j)
  left_inv i := by
    have he : Fin.castSucc (⟨(p i.succ).val,tail_val_lt p h i⟩ : Fin n)=p i.succ :=
      Fin.ext rfl
    simp only [he,Equiv.symm_apply_apply,Fin.pred_succ]
  right_inv j := by
    apply Fin.ext
    simp only [Fin.succ_pred,Equiv.apply_symm_apply,Fin.val_castSucc]

theorem pointed_unpoint {n : ℕ} (p : Equiv.Perm (Fin (n+1))) (h : p 0=Fin.last n) :
    pointedPermutation (unpoint p h)=p := by
  apply Equiv.ext
  intro i
  refine Fin.cases ?_ (fun j => ?_) i
  · simpa only [pointed_zero] using h.symm
  · rw [pointed_succ]
    apply Fin.ext
    rfl

theorem pattern_first_maximum_of_has312 {m n : ℕ} {p : Equiv.Perm (Fin (m+1))}
    {q : Equiv.Perm (Fin n)} (hp : Has312 p) (hq : ¬Has312 q)
    (h : ClassicalPattern p (pointedPermutation q)) :
    p 0=Fin.last m := by
  obtain ⟨f,hf,ho⟩ := h
  have h0 : f 0=0 := by
    by_contra! h
    refine hq (hp.of_pattern (pointedPattern_omit f hf ho ?_))
    intro i
    exact Fin.pos_iff_ne_zero.mp ((Fin.pos_iff_ne_zero.mpr h).trans_le (hf.monotone (Fin.zero_le i)))
  apply le_antisymm (Fin.le_last _)
  by_contra! ht
  have hb : p 0<p (p.symm (Fin.last m)) := by rwa [Equiv.apply_symm_apply]
  have hc := (ho _ _).mp hb
  rw [h0,pointed_zero] at hc
  exact (not_lt_of_ge (Fin.le_last _)) hc

theorem pattern_in_pointed_iff {m n : ℕ} {p : Equiv.Perm (Fin (m+1))}
    {q : Equiv.Perm (Fin n)} (hp : Has312 p) (hq : ¬Has312 q) :
    ClassicalPattern p (pointedPermutation q) ↔
      ∃ (h : p 0=Fin.last m), ClassicalPattern (unpoint p h) q := by
  constructor
  · intro h
    have ht := pattern_first_maximum_of_has312 hp hq h
    refine ⟨ht,?_⟩
    rw [← pointed_unpoint p ht,pointedPattern_iff_tail_or_omit] at h
    exact h.resolve_right (fun h => hq ((pointed_unpoint p ht) ▸ hp |>.of_pattern h))
  · rintro ⟨ht,h⟩
    rw [← pointed_unpoint p ht]
    exact pointedPattern_lift h

end McNamaraSteingrimsson
