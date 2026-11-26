import Conjectures.ChernFuLinThreeStatisticDecode
import Conjectures.ChernFuLinThreeStatisticSplitStats
import Conjectures.ChernFuLinThreeStatisticWeights

/-! # Enumeration on the actual fibre of a prescribed set of minimum positions -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Finset

/-- Transport a prescribed prefix set of marks to the ambient word and mark
the global minimum. Positions after it are unmarked. -/
def marksAt (t : ℕ) {m : ℕ} (U : Finset (Fin m)) : Finset (Fin (m+1+t)) :=
  insert ((Fin.last m).castAdd t) (U.map (Fin.castLEEmb (by omega)))

theorem mem_marksAt {m t : ℕ} {U : Finset (Fin m)} (i : Fin (m+1+t)) :
    i ∈ marksAt t U ↔ i.val=m ∨ ∃ j : Fin m, j ∈ U ∧ j.val=i.val := by
  simp only [marksAt,Finset.mem_insert,Finset.mem_map,Fin.ext_iff]; rfl

theorem min_of_lmi_marks {m t : ℕ} {π : Equiv.Perm (Fin (m+1+t))} {U : Finset (Fin m)}
    (h : lmi π = marksAt t U) : (π ⟨m,by omega⟩).val=0 := by
  let mid : Fin (m+1+t) := ⟨m,by omega⟩
  let i := π.symm (⟨0,by omega⟩ : Fin (m+1+t))
  have hi : (π i).val=0 := congrArg Fin.val (π.apply_symm_apply _)
  have hli : i ∈ lmi π := mem_lmi.mpr fun j hj => lt_of_le_of_ne (by change (π i).val ≤ _; omega)
    (π.injective.ne hj.ne')
  rw [h,mem_marksAt] at hli
  have hm : IsLeftMin π mid := mem_lmi.mp (h ▸ (mem_marksAt mid).2 (Or.inl rfl))
  rcases hli with he|⟨j,_,he⟩
  · change (π mid).val=0; rw [← show i=mid from Fin.ext he]; exact hi
  · have e := hm i (by change i.val<m; omega); change (π mid).val < (π i).val at e; omega

def prefixMarks {m : ℕ} (σ : Equiv.Perm (Fin (m+1))) : Finset (Fin m) :=
  univ.filter fun i => i.castSucc ∈ lmi σ

theorem lmi_expand {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b))) :
    lmi (expand σ ν) = marksAt (a+b) (prefixMarks σ) := by
  ext i; rw [mem_lmi,mem_marksAt]
  refine Fin.addCases (fun i => ?_) (fun j => ?_) i
  · refine Fin.lastCases ?_ (fun j => ?_) i
    · exact iff_of_true (leftMin_middle σ ν) (Or.inl rfl)
    · rw [leftMin_prefix σ ν (Fin.castSucc_ne_last j)]
      constructor
      · intro hj; right; exact ⟨j,mem_filter.mpr ⟨mem_univ _,mem_lmi.mpr hj⟩,rfl⟩
      · rintro (he|⟨k,hk,hkj⟩)
        · change j.val=m at he; omega
        · have he : k=j := Fin.ext hkj; subst k; exact mem_lmi.mp (mem_filter.mp hk).2
  · rw [iff_false_left (not_leftMin_right σ ν j)]
    rintro (he|⟨k,_,he⟩) <;> change _ = _ at he <;> simp only [Fin.val_natAdd] at he <;> omega

theorem code_lmi {m t : ℕ} (c : Code m t) : lmi c.word = marksAt t (prefixMarks c.core) := by
  rcases c with ⟨a,b,rfl,σ,ν,hcan⟩; exact lmi_expand σ ν

theorem marksAt_injective (m t : ℕ) : Function.Injective (@marksAt t m) := by
  intro U V he; ext j
  let i := (j.castSucc).castAdd t
  have hU (S : Finset (Fin m)) : i ∈ marksAt t S ↔ j ∈ S := by
    rw [mem_marksAt]; constructor
    · rintro (e|⟨k,hk,he⟩); · exact (j.isLt.ne e).elim
      exact (show k=j from Fin.ext he) ▸ hk
    · exact fun hj => Or.inr ⟨j,hj,rfl⟩
  rw [← hU U,he,hU V]

/-- An actual equivalence of marked fibres.
Core marks can be prescribed before constructing the expanded permutation. -/
noncomputable def markedCodeEquiv {m t : ℕ} (hm : 0<m) (z : Bool) (U : Finset (Fin m)) :
    {c : Code m t // inClass z c.word ∧ prefixMarks c.core=U} ≃
      {π : Equiv.Perm (Fin (m+1+t)) // inClass z π ∧ lmi π=marksAt t U} :=
    Equiv.ofBijective (fun c => ⟨c.val.word,c.property.1,(code_lmi _).trans (congrArg _ c.property.2)⟩) <| by
      constructor
      · exact fun _ _ h => Subtype.ext (code_injective (congrArg Subtype.val h))
      · rintro ⟨π,hπ,hL⟩; obtain ⟨c,rfl⟩ := code_exists_of_mem hm (min_of_lmi_marks hL) hπ
        exact ⟨⟨c,hπ,marksAt_injective m t ((code_lmi c).symm.trans hL)⟩,rfl⟩

instance {m t : ℕ} : Finite (Code m t) := Finite.of_injective _ code_injective

noncomputable section
open Classical

/-- Sum any weight over actual permutations with exactly these minima. -/
theorem sum_markedCodes {m t : ℕ} (hm : 0<m) (z : Bool) (U : Finset (Fin m))
    {R : Type*} [AddCommMonoid R] (w : Equiv.Perm (Fin (m+1+t)) → R) :
    letI := Fintype.ofFinite (Code m t)
    (∑ c : {c : Code m t // inClass z c.word ∧ prefixMarks c.core=U}, w c.val.word) =
      ∑ π : {π : Equiv.Perm (Fin (m+1+t)) // inClass z π ∧ lmi π=marksAt t U}, w π.val := by
  let _ := Fintype.ofFinite (Code m t)
  exact Fintype.sum_equiv (markedCodeEquiv hm z U) _ _ (fun _ => rfl)

end

end Conjectures.ChernFuLinThreeStatistic.Expansion
