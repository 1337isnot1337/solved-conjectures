import Conjectures.ChernFuLinThreeStatisticBoundary

/-! # Passing between bit words, boundary permutations, and marked sums -/

namespace Conjectures.ChernFuLinThreeStatistic

open Expansion Finset BursteinA218225

def seen (w : List Bool) {n : ℕ} : Finset (Fin n) := univ.filter fun i : Fin n => w[i.val]? = some true

theorem markWeight_seen {n : ℕ} (w : List Bool) (hw : w.length=n) (hn : 0<n) (z : Bool) :
    markWeight z w = markedWeight (@inClass n z) (seen w) := by
  subst n
  have h : w ≠ [] := by rintro rfl; simp at hn
  cases z <;> simp only [markWeight,ite_eq_right h,Bool.false_eq_true,ite_false,ite_true]
  all_goals congr 1; ext i; simp [seen,markedPositions]

theorem prefixMarks_word (u : List Bool) : @seen u u.length = markedPositions u := by
  ext i; simp [seen,markedPositions]

theorem markWeight_split (z : Bool) (u : List Bool) (t : ℕ) :
    markWeight z (u++true::List.replicate t false) = markedWeight (inClass z) (marksAt t (markedPositions u)) := by
  rw [markWeight_seen _ (show (u++true::List.replicate t false).length = u.length+1+t by simp; omega) (by omega)]
  congr 1; ext i; rw [mem_marksAt]; simp only [seen,mem_filter,mem_univ,true_and]
  by_cases hi : i.val<u.length
  · rw [List.getElem?_append_left hi,List.getElem?_eq_getElem hi,Option.some.injEq]
    constructor
    · intro hv; exact Or.inr ⟨⟨i.val,hi⟩,by simpa [markedPositions] using hv,rfl⟩
    · rintro (he|⟨j,hj,he⟩); · omega
      simpa [markedPositions,he] using hj
  · rw [List.getElem?_append_right (by omega)]
    by_cases he : i.val=u.length
    · simp [he]
    · have hd : i.val-u.length=(i.val-u.length-1)+1 := by omega
      have hno : ¬ ∃ j : Fin u.length, j∈markedPositions u ∧ j.val=i.val := fun ⟨j,_,hj⟩ => hi (hj ▸ j.isLt)
      rw [hd,List.getElem?_cons_succ,List.getElem?_replicate]; split_ifs <;> simp [he,hno]

theorem zero_mark {n : ℕ} (π : Equiv.Perm (Fin (n+1))) : (0 : Fin (n+1))∈lmi π :=
  mem_lmi.mpr (fun j hj => (Fin.not_lt_zero j hj).elim)

theorem unmarked_actual (z : Bool) (n : ℕ) : markWeight z (List.replicate n false)=0 := by
  cases n with
  | zero => simp [markWeight]
  | succ n =>
    rw [markWeight_seen _ List.length_replicate (Nat.zero_lt_succ _)]; rw [markedWeight_sum]
    apply sum_eq_zero; intro π _
    have h : lmi π ≠ seen (List.replicate (n+1) false) := by
      intro e; have h := zero_mark π; rw [e] at h; simp [seen,List.getElem?_replicate] at h
    simp [h]

theorem singleton_actual (z : Bool) : markWeight z [true]=Z := by
  classical
  rw [markWeight_seen (n:=1) _ rfl (by decide) z,markedWeight_sum,Fintype.sum_unique]
  let π := (default : Equiv.Perm (Fin 1))
  have hm : lmi π = seen [true] := by ext i; fin_cases i; simp [seen,IsLeftMin]
  have hc : inClass z π := by
    apply (inClass_iff ..).2; rintro k τ hb ⟨f,hf,_⟩
    obtain ⟨p,q,r,hpq,_,_⟩ := basis_internal_min hb
    exact (hf hpq).ne (Subsingleton.elim ..)
  have hR : rma π=1 := by simp [rma]
  have hI : ides π=0 := by simp [ides]
  change (if inClass z π ∧ lmi π=seen [true] then wt π else 0)=Z
  simp [hc,hm,wt,hR,hI]

theorem putMin_prefixMarks {m : ℕ} (π : Equiv.Perm (Fin m)) : prefixMarks (putMin (Fin.last m) π)=lmi π := by
  ext i; simp only [prefixMarks,mem_filter,mem_univ,true_and,mem_lmi]
  constructor
  · intro h j hj
    have hh := h j.castSucc ((Fin.strictMono_castSucc) hj)
    simpa only [← Fin.succAbove_last,putMin_old,Fin.succ_lt_succ_iff] using hh
  · intro h j
    refine Fin.lastCases (fun hj => ((Fin.le_last _).not_gt hj).elim) (fun k hk => ?_) j
    simpa only [← Fin.succAbove_last,putMin_old,Fin.succ_lt_succ_iff] using h k (Fin.castSucc_lt_castSucc_iff.mp hk)

theorem wt_putMin_last {m : ℕ} (hm : 0<m) (π : Equiv.Perm (Fin m)) : wt (putMin (Fin.last m) π)=wt π*T*Z := by
  cases m with
  | zero => omega
  | succ m =>
    have hd := ides_putMin (Fin.last _) π
    have hi : (Fin.last (m+1)).succAbove (π.symm 0) < Fin.last _ := by simp
    simp only [ite_eq_left hi] at hd
    have hr := rma_putMin (Fin.last _) π
    simp [wt,hd,hr,pow_add]; ring

theorem wt_putMin_first {m : ℕ} (hm : 0<m) (π : Equiv.Perm (Fin m)) : wt (putMin 0 π)=wt π := by
  cases m with
  | zero => omega
  | succ m =>
    have hd := ides_putMin 0 π
    have hi : (0 : Fin (m+2))≠Fin.last _ := by intro e; have := congrArg Fin.val e; simp at this
    simp [wt,hd,rma_putMin,hi]

end Conjectures.ChernFuLinThreeStatistic
