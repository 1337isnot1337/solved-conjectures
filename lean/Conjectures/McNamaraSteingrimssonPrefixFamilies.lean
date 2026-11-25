module

public import Conjectures.McNamaraSteingrimssonTwoSummandInterval

@[expose] public section
namespace McNamaraSteingrimsson

/-- The largest value sits in the first position (when the permutation is
nonempty). This definition is convenient when the length is not written n+1. -/
def BeginsWithMaximum {d : ℕ} (p : Equiv.Perm (Fin d)) : Prop :=
  ∀ i : Fin d, i.val=0 → (p i).val+1=d

theorem rightFactor_beginsWithMaximum {a b : List Bool} {l : ℕ}
    {p : Equiv.Perm (Fin l)} (ha : 2≤a.length)
    (hl : ClassicalPattern (pointedPermutation (layerPermutation a)) p)
    (hr : ClassicalPattern p (pointedPermutation (layerPermutation b))) :
    0<l ∧ BeginsWithMaximum p := by
  cases l with
  | zero =>
    have h := classicalPattern_size_le hl
    omega
  | succ l =>
    refine ⟨by omega,?_⟩
    intro i hi
    have h312 : Has312 p := (pointedLayer_contains312 a ha).of_pattern hl
    have h0 := pattern_first_maximum_of_has312 h312 (layerPermutation_avoids312 b) hr
    have hi' : i=0 := Fin.ext hi
    rw [hi',h0]
    rfl

theorem castSum_at_rightMaximum {k l d : ℕ} (e : k+l=d)
    (pL : Equiv.Perm (Fin k)) (pR : Equiv.Perm (Fin l))
    (hpos : 0<l) (hmax : BeginsWithMaximum pR) :
    ∃ t : Fin d, t.val=k ∧ ((castPermutation e (directSumPermutation pL pR)) t).val+1=d := by
  let j : Fin l := ⟨0,hpos⟩
  let t := Fin.cast e (Fin.natAdd k j)
  refine ⟨t,by simp [t,j],?_⟩
  have he := hmax j rfl
  rw [castPermutation_apply]
  have hT : Fin.cast e.symm t=Fin.natAdd k j := by simp [t]
  rw [hT,directSum_natAdd]
  change k+(pR j).val+1=d
  omega

theorem FullPrefixFamily_low_value {m n d : ℕ} {α : Equiv.Perm (Fin (m+1))}
    {π : Equiv.Perm (Fin n)} {β : Equiv.Perm (Fin d)}
    (h : FullPrefixFamily α π β) (i : Fin d) (hi : i.val<m+1) :
    (β i).val<m+1 := by
  obtain ⟨l,e,q,rfl,_⟩ := h
  let j : Fin (m+1) := ⟨i.val,hi⟩
  have hj : Fin.cast e.symm i=Fin.castAdd l j := Fin.ext rfl
  rw [castPermutation_apply,hj,directSum_castAdd]
  exact (α j).isLt

/-- At every strictly positive relative rank, the two actual families of
the smaller two-summand interval are disjoint. -/
theorem twoSummand_families_disjoint {a b : List Bool} {d : ℕ}
    {β : Equiv.Perm (Fin d)} (ha : 2≤a.length) (hd : Fintype.card (LayerPosition a)+1<d)
    (hF : FullPrefixFamily (pointedPermutation (layerPermutation a))
      (pointedPermutation (layerPermutation b)) β) :
    ¬ProperPrefixFamily (pointedPermutation (layerPermutation a))
      (pointedPermutation (layerPermutation b)) β := by
  rintro ⟨k,l,e,pL,pR,hk,hb,_,hl,hr⟩
  obtain ⟨hpos,hmax⟩ := rightFactor_beginsWithMaximum ha hl hr
  obtain ⟨i,hi,hv⟩ := castSum_at_rightMaximum e pL pR hpos hmax
  rw [hb] at hv
  have hl := FullPrefixFamily_low_value hF i (hi.symm ▸ hk)
  omega

end McNamaraSteingrimsson
