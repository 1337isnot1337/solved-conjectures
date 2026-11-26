import Conjectures.ChernFuLinThreeStatisticXMarkedTail
import Conjectures.ChernFuLinThreeStatisticFlagTree
import Mathlib.Data.List.OfFn

/-! # Literal right-maximum flags on the active prefix of an X permutation -/

namespace Conjectures.ChernFuLinThreeStatistic.Growth

open BursteinA218225 Expansion Kernel

def rightBit {n : ℕ} (π : Equiv.Perm (Fin n)) (k : ℕ) : Bool :=
  if h : k<n then decide (∀ j > (⟨k,h⟩ : Fin n), π j < π ⟨k,h⟩) else false

def flags {n : ℕ} (π : Equiv.Perm (Fin n)) (start len : ℕ) : List Bool :=
  List.ofFn fun i : Fin len => rightBit π (start+i.val)

theorem flags_add {n : ℕ} (π : Equiv.Perm (Fin n)) (i a b : ℕ) :
    flags π i (a+b) = flags π i a ++ flags π (i+a) b := by
  simp [flags,List.ofFn_add,Nat.add_assoc]

@[simp] theorem flags_length {n : ℕ} (π : Equiv.Perm (Fin n)) (i len : ℕ) : (flags π i len).length=len := List.length_ofFn

@[simp] theorem flags_zero {n : ℕ} (π : Equiv.Perm (Fin n)) (i : ℕ) : flags π i 0=[] := rfl

private theorem bit_false {n : ℕ} (π : Equiv.Perm (Fin (n+1))) {i : ℕ} (h : i<(maxGap π).val) :
    rightBit π i=false := by
  have hi : i<n+1 := h.trans (maxGap π).isLt
  have hg : ¬ IsRightMax π (⟨i,hi⟩ : Fin (n+1)) := fun H => by
    have hh := H _ (show (⟨i,hi⟩ : Fin (n+1)) < maxGap π from h); rw [maxGap,Equiv.apply_symm_apply] at hh; exact (Fin.le_last _).not_gt hh
  simp only [rightBit,dite_eq_left hi,decide_eq_false_iff_not]; exact hg

private theorem bit_true {n : ℕ} (π : Equiv.Perm (Fin (n+1))) : rightBit π (maxGap π).val=true := by
  have hm (j : Fin (n+1)) (h : maxGap π<j) : π j < π (maxGap π) := by
    rw [maxGap,Equiv.apply_symm_apply]; apply lt_of_le_of_ne (Fin.le_last _); exact fun e => h.ne' (π.symm_apply_eq.mpr e.symm).symm
  simp [rightBit,(maxGap π).isLt]; exact hm

theorem flags_before {n : ℕ} (π : Equiv.Perm (Fin (n+1))) {i len : ℕ} (h : i+len≤(maxGap π).val) :
    flags π i len = List.replicate len false := by
  unfold flags; rw [← List.ofFn_const]; congr 1; funext j; exact bit_false π (by omega)

theorem flags_at {n : ℕ} (π : Equiv.Perm (Fin (n+1))) : flags π (maxGap π).val 1=[true] := by
  simp [flags,List.ofFn_succ,bit_true]

private theorem bit_after_insert {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n+1)) {i : ℕ}
    (hg : g.val ≤ i) (hi : i < n) : rightBit (insertMax π g) (i+1)=rightBit π i := by
  let j := (⟨i,hi⟩ : Fin n)
  have hs : (g.succAbove j).val=i+1 := by rw [Fin.succAbove_of_le_castSucc _ _ hg]; rfl
  have hbit : IsRightMax (insertMax π g) (g.succAbove j) ↔ IsRightMax π j := by
    rw [isRightMax_insertMax_old]; exact and_iff_right ((Fin.lt_succAbove_iff_le_castSucc ..).mpr hg)
  have he : g.succAbove j = ⟨i+1,by omega⟩ := Fin.ext hs
  rw [he] at hbit; unfold IsRightMax at hbit
  simp only [rightBit,dite_eq_left (by omega : i+1<n+1),dite_eq_left hi]; simp only [j] at hbit; simp only [hbit]

theorem flags_after_insert {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n+1)) {i len : ℕ}
    (hg : g.val ≤ i) (hn : i+len ≤ n) : flags (insertMax π g) (i+1) len = flags π i len := by
  unfold flags; congr 1; funext j; rw [show i+1+j.val=(i+j.val)+1 by omega]; exact bit_after_insert π g (by omega) (by omega)

noncomputable def state {n : ℕ} (π : Equiv.Perm (Fin n)) : State :=
  let a := firstDescent π-1
  let j := kX π-firstDescent π
  if least213Mid π=kX π then .A a (flags π a j) else .B a j

theorem state_A_low {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hX : InX π) (hA : least213Mid π=kX π)
    (g : Fin (n+2)) (hg : g.val<firstDescent π-1) :
    state (insertMax π g) = .A (g.val+1) (pre ((firstDescent π-1)-1-g.val) ++
      flags π (firstDescent π-1) (kX π-firstDescent π)) := by
  have bounds := invariantsX_bounds π
  have loc : firstDescent π=(maxGap π).val+2 := by rcases max_location hX with ⟨_,h⟩|⟨_,_,_⟩; exact h; omega
  obtain ⟨hd,hb,hk⟩ := updateX_lt_d hX g (by omega)
  simp only [state,hd,hb,hk,ite_true,show g.val+2-1=g.val+1 by omega]
  apply congrArg (State.A _)
  rw [show least213Mid π+1-(g.val+2) = (maxGap π).val-g.val + (1+(kX π-firstDescent π)) by omega]
  rw [flags_after_insert π g (by omega) (by omega),flags_add,flags_before π (by omega),
    show g.val+((maxGap π).val-g.val)=(maxGap π).val by omega,flags_add,flags_at,pre,loc]
  simp [List.append_assoc]

theorem state_A_after {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hX : InX π) (hA : least213Mid π=kX π)
    (g : Fin (n+2)) (hg : g.val=firstDescent π-1) : state (insertMax π g) =
    .A (g.val+1) (flags π (firstDescent π-1) (kX π-firstDescent π)) := by
  have h := invariantsX_bounds π
  obtain ⟨hd,hb,hk⟩ := updateX_lt_d hX g (by omega)
  simp only [state,hd,hb,hk,ite_true,show g.val+2-1=g.val+1 by omega]
  rw [show least213Mid π+1-(g.val+2)=kX π-firstDescent π by omega,flags_after_insert π g (by omega) (by omega),hg]

theorem state_B_low {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hX : InX π) (hB : least213Mid π≠kX π)
    (g : Fin (n+2)) (hg : g.val<firstDescent π) : state (insertMax π g) =
    .A (g.val+1) (List.replicate (firstDescent π-1-g.val) false) := by
  have h := invariantsX_bounds π
  obtain ⟨hm,hk',hloc⟩ := (max_location hX).resolve_left (fun e => hB e.1)
  obtain ⟨hd,hb,hk⟩ := updateX_lt_d hX g hg
  simp only [state,hd,hb,hk,ite_true,show g.val+2-1=g.val+1 by omega]
  rw [show least213Mid π+1-(g.val+2)=firstDescent π-1-g.val by omega,
    flags_after_insert π g (by omega) (by omega),flags_before π (by omega)]

theorem state_high {n : ℕ} (π : Equiv.Perm (Fin n)) (hX : InX π) (g : Fin (n+1))
    (hlo : firstDescent π≤g.val) (hhi : g.val<kX π) : state (insertMax π g) =
    .B (firstDescent π-1) (g.val+1-firstDescent π) := by
  obtain ⟨hd,hb,hk⟩ := updateX_ge_d hX g hlo hhi
  simp [state,hd,hb,hk,show firstDescent π≠g.val+1 by omega]

def prefCount {n : ℕ} (π : Equiv.Perm (Fin n)) (g : ℕ) := (flags π 0 g).count true

private theorem cnt {n : ℕ} (π : Equiv.Perm (Fin n)) (s l : ℕ) :
    (flags π s l).count true = ∑ i : Fin l, if rightBit π (s+i.val) then 1 else 0 := by
  induction l with
  | zero => simp
  | succ l ih => rw [flags_add π s l 1,List.count_append,ih,Fin.sum_univ_castSucc]; congr 1

theorem count_all {n : ℕ} (π : Equiv.Perm (Fin n)) : (flags π 0 n).count true = rma π := by
  rw [cnt]; unfold rma; apply Finset.sum_congr rfl; intro i _; simp [rightBit,i.isLt]

theorem flags_take {n : ℕ} (π : Equiv.Perm (Fin n)) (s l j : ℕ) (hj : j≤l) :
    (flags π s l).take j=flags π s j := by
  obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj; rw [flags_add]; simp

theorem rma_update {n : ℕ} (π : Equiv.Perm (Fin n)) (g : Fin (n+1)) :
    rma (insertMax π g) + prefCount π g.val = rma π + 1 := by
  let μ := insertMax π g
  have new0 := flags_before μ (i:=0) (len:=g.val) (by simp [μ,maxGap_insertMax])
  have one := flags_at μ; rw [maxGap_insertMax] at one
  have remain := flags_after_insert π g (i:=g.val) (len:=n-g.val) le_rfl (by omega)
  have e (j : ℕ) (hj : j≤n) : flags π 0 n=flags π 0 j++flags π j (n-j) := by
    simpa only [Nat.zero_add] using (show flags π 0 n=flags π 0 j++flags π (0+j) (n-j) from
      (congrArg (flags π 0) (show n=j+(n-j) by omega)).trans (flags_add ..))
  have H := flags_add μ 0 g.val (1+(n-g.val))
  rw [show g.val+(1+(n-g.val))=n+1 by omega,Nat.zero_add,flags_add μ g.val 1 (n-g.val),new0,one,remain] at H
  rw [← count_all,← count_all,show flags (insertMax π g) 0 (n+1)=_ from H,e g.val (by omega)]
  simp [prefCount,List.count_replicate]; omega

theorem high_loss {n : ℕ} (π : Equiv.Perm (Fin (n+1))) (hx : InX π) (hA : least213Mid π=kX π)
    {g : Fin (n+2)} (hg : firstDescent π-1≤g.val) (hk : g.val<kX π) :
    prefCount π g.val = 1 + ((flags π (firstDescent π-1) (kX π-firstDescent π)).take
      (g.val-(firstDescent π-1))).count true := by
  have bounds := invariantsX_bounds π
  have loc : firstDescent π=(maxGap π).val+2 := by rcases max_location hx with ⟨_,h⟩|⟨_,_,_⟩; exact h; omega
  let l := g.val-(firstDescent π-1)
  have hl : l≤kX π-firstDescent π := by dsimp [l]; omega
  rw [flags_take _ _ _ _ hl]; unfold prefCount
  rw [show g.val=(maxGap π).val+(1+l) by dsimp [l]; omega,flags_add,flags_before π (by omega),Nat.zero_add,
      flags_add,flags_at,List.count_append,List.count_append]
  simp [l,loc,List.count_replicate]

end Conjectures.ChernFuLinThreeStatistic.Growth
