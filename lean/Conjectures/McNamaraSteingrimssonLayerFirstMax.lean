module

public import Conjectures.McNamaraSteingrimssonLayerDownsetCount

@[expose] public section
namespace McNamaraSteingrimsson

/-- A pattern starting at its maximum cannot use more than one layer
in a layered permutation, so its size is at most two here. -/
theorem layered_firstMaximum_pattern_size {m : ℕ} {v : List Bool}
    {p : Equiv.Perm (Fin (m+1))} (hp : BeginsWithMaximum p)
    (h : ClassicalPattern p (layerPermutation v)) : m+1≤2 := by
  obtain ⟨f,hf,ho⟩ := h
  let pos := codeRank (@posCode v) (posCode_inj v)
  let val := codeRank (@valCode v) (valCode_inj v)
  let z (i : Fin (m+1)) := pos.symm (f i)
  let k := (z 0).fst
  have hlabel (i : Fin (m+1)) : (z i).fst=k := by
    by_cases h0 : i=0
    · subst i
      rfl
    have hgt : 0 < i := Fin.pos_iff_ne_zero.mpr h0
    have hpr : pos (z 0)<pos (z i) := by
      simpa [z] using hf hgt
    have hpp : positionLT (z 0) (z i) :=
      (posCode_lt_iff _ _).mp ((codeRank_lt_iff _ _ _ _).mp hpr)
    rcases hpp with hlt|⟨he,_⟩
    · have hv : val (z 0)<val (z i) :=
        (codeRank_lt_iff _ _ _ _).mpr ((valCode_lt_iff _ _).mpr (Or.inl hlt))
      have he := (ho 0 i).mpr hv
      have hm := hp (0 : Fin (m+1)) rfl
      have hi := (p i).isLt
      change (p 0).val < (p i).val at he
      omega
    · exact he.symm
  let localIndex (i : Fin (m+1)) : Fin (sizedAt v k) :=
    ⟨(z i).snd.val,(z i).snd.isLt.trans_le (le_of_eq (congrArg (sizedAt v) (hlabel i)))⟩
  have hInj : Function.Injective localIndex := by
    intro i j he
    apply hf.injective
    apply pos.symm.injective
    change z i=z j
    have hs : (z i).fst=(z j).fst := (hlabel i).trans (hlabel j).symm
    have ht : (z i).snd.val=(z j).snd.val := congrArg Fin.val he
    rcases hzi : z i with ⟨a,ia⟩
    rcases hzj : z j with ⟨b,jb⟩
    rw [hzi,hzj] at hs ht
    cases hs
    exact congrArg (Sigma.mk a) (Fin.ext ht)
  have hsize : m+1≤sizedAt v k := by
    simpa using Fintype.card_le_of_injective localIndex hInj
  exact hsize.trans (sizedAt_le_two v k)

end McNamaraSteingrimsson
