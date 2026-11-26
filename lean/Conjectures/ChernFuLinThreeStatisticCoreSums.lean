import Conjectures.ChernFuLinThreeStatisticProduct
import Conjectures.ChernFuLinThreeStatisticWords

/-! # Independent core factors in the literal minimum decomposition -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Finset Crossing
noncomputable section
open Classical

theorem prefixMarks_last_iff {m : ℕ} (σ : Equiv.Perm (Fin (m+1))) :
    Fin.last m ∈ lmi σ ↔ (σ (Fin.last m)).val=0 := by
  constructor
  · intro hm; let q := σ.symm (0 : Fin (m+1)); have hq : (σ q).val=0 := congrArg Fin.val (σ.apply_symm_apply _)
    by_cases h : q=Fin.last m; · simpa [h] using hq
    have h' := mem_lmi.mp hm q (lt_of_le_of_ne (Fin.le_last _) h)
    change (σ (Fin.last m)).val < (σ q).val at h'; omega
  · intro h; apply mem_lmi.mpr; intro j hj
    exact lt_of_le_of_ne (by change (σ (Fin.last m)).val ≤ _; omega) (σ.injective.ne hj.ne')

theorem seen_append_false (u : List Bool) (i : Fin (u.length+1)) :
    i ∈ seen (u++[false]) ↔ ∃ j : Fin u.length, j∈markedPositions u ∧ j.castSucc=i := by
  simp only [seen,mem_filter,mem_univ,true_and]
  by_cases hi : i.val<u.length
  · rw [List.getElem?_append_left hi,List.getElem?_eq_getElem hi,Option.some.injEq]
    exact ⟨fun hv => ⟨⟨i.val,hi⟩,by simpa [markedPositions] using hv,rfl⟩,
      fun ⟨j,hj,he⟩ => by subst i; simpa [markedPositions] using hj⟩
  · have he : i.val=u.length := by omega
    rw [List.getElem?_append_right (by omega)]; simp [he]; intro j _ hj
    have := congrArg Fin.val hj; change j.val=i.val at this; omega

theorem core_nonzero_iff (u : List Bool) (σ : Equiv.Perm (Fin (u.length+1))) :
    lmi σ=seen (u++[false]) ↔ prefixMarks σ=markedPositions u ∧ (σ (Fin.last u.length)).val≠0 := by
  constructor
  · intro hl; constructor
    · ext j; simp only [prefixMarks,mem_filter,mem_univ,true_and,hl,seen_append_false]; simp
    · intro e; have h := (prefixMarks_last_iff σ).2 e; rw [hl,seen_append_false] at h
      obtain ⟨j,_,hj⟩ := h; exact Fin.castSucc_ne_last j hj
  · rintro ⟨h,hne⟩; ext i; rw [seen_append_false]
    refine Fin.lastCases ?_ (fun j => ?_) i
    · rw [prefixMarks_last_iff]; simp [hne,Fin.castSucc_ne_last]
    · have he := Finset.ext_iff.mp h j; simpa [prefixMarks] using he

theorem coreSum_high (z : Bool) (u : List Bool) {b : ℕ} (hb : 0<b) :
    coreSum z (markedPositions u) b = markWeight z (u++[false]) := by
  rw [markWeight_seen (n:=u.length+1) _ (by simp) (by omega),markedWeight_subtype]
  unfold coreSum
  let e : CoreSet z (markedPositions u) b ≃
      {σ : Equiv.Perm (Fin (u.length+1)) // inClass z σ ∧ lmi σ=seen (u++[false])} :=
    Equiv.subtypeEquivRight (fun σ => by simp only [core_nonzero_iff,show ¬b=0 from hb.ne',false_iff])
  exact Fintype.sum_equiv e _ _ (fun _ => rfl)

theorem coreSum_low (z : Bool) {m : ℕ} (hm : 0<m) (U : Finset (Fin m)) :
    coreSum z U 0 = markedWeight (inClass z) U*T*Z := by
  let P := {π : Equiv.Perm (Fin m) // inClass z π ∧ lmi π=U}
  let e : P ≃ CoreSet z U 0 := Equiv.ofBijective (fun p =>
    ⟨putMin (Fin.last m) p.val,(inClass_putMin_boundary _ (Or.inr rfl) _).2 p.property.1,
      (putMin_prefixMarks _).trans p.property.2,by simp⟩) <| by
    constructor
    · intro x y h; apply Subtype.ext; apply (putMinEquiv (Fin.last m)).injective
      exact Subtype.ext (congrArg (fun q : CoreSet z U 0 => q.val) h)
    · rintro ⟨σ,hσ,hU,hc⟩
      let x : {π : Equiv.Perm (Fin (m+1)) // π (Fin.last m)=0} := ⟨σ,Fin.ext (hc.mp rfl)⟩
      obtain ⟨p,hp⟩ := (putMinEquiv (Fin.last m)).surjective x
      have he : putMin (Fin.last m) p=σ := congrArg Subtype.val hp
      subst σ; exact ⟨⟨p,(inClass_putMin_boundary _ (Or.inr rfl) _).1 hσ,(putMin_prefixMarks p).symm.trans hU⟩,rfl⟩
  rw [markedWeight_subtype,Finset.sum_mul,Finset.sum_mul]; unfold coreSum
  exact (Fintype.sum_equiv e (fun p => wt p.val*T*Z) (fun σ => wt σ.val) (fun p => (wt_putMin_last hm p.val).symm)).symm

theorem tailSum_low (z : Bool) (a : ℕ) : tailSum z a 0 = totalWeight z a := by
  have hmem (ν : Equiv.Perm (Fin a)) : TailOK z a 0 ν ↔ inClass z ν := by
    have hall (i : Fin a) : (ν i).val<a := (ν i).isLt
    have hno : AvoidOn ν z (fun j => a≤(ν j).val) := by
      intro k τ hb f _ _ hs; obtain ⟨p,_,_,_,_,_⟩ := basis_internal_min hb
      exact (hall (f p)).not_ge (hs p)
    have ht : Crossing.tailRules z (fun i => (ν i).val) (@tailRole a 0 ν) := by
      cases z <;> simp [Crossing.tailRules,tailRole,hall]
    have hP : (fun i => (ν i).val<a) = (fun _ => True) := funext fun i => propext (iff_true_intro (hall i))
    change (_ ∧ AvoidOn ν z (fun i => (ν i).val<a) ∧ AvoidOn ν z (fun i => a≤(ν i).val)) ↔ _
    rw [hP,avoidOn_all]; tauto
  have hw (ν : Equiv.Perm (Fin a)) : tailWeight a 0 ν=wt ν := by simp [tailWeight,wt,ides_internal,internal]
  let e : TailSet z a 0 ≃ {ν : Equiv.Perm (Fin a) // inClass z ν} := Equiv.subtypeEquivRight hmem
  have hh : totalWeight z a = ∑ ν : {ν : Equiv.Perm (Fin a) // inClass z ν}, wt ν.val := by
    unfold totalWeight; rw [← sum_filter]; exact Finset.sum_subtype _ (by simp) _
  rw [hh,tailSum]; exact Fintype.sum_equiv e _ _ (fun ν => hw ν.val)

end
end Conjectures.ChernFuLinThreeStatistic.Expansion
