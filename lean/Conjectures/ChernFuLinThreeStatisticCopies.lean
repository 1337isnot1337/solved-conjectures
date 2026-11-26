import Conjectures.ChernFuLinThreeStatisticDecode
import Conjectures.ChernFuLinThreeStatisticSplitStats

/-! # Transporting pattern avoidance to selected subwords of the expansion -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Crossing

theorem avoidOn_mono {n : ℕ} {π : Equiv.Perm (Fin n)} {z : Bool} {P Q : Fin n → Prop}
    (h : ∀ i, P i → Q i) (hq : AvoidOn π z Q) : AvoidOn π z P :=
  fun hb f hf ho hall => hq hb f hf ho (fun i => h _ (hall i))

structure Copy {n N : ℕ} (σ : Equiv.Perm (Fin n)) (π : Equiv.Perm (Fin N)) where
  f : Fin n → Fin N
  mono : StrictMono f
  lt_iff : ∀ i j, π (f i) < π (f j) ↔ σ i < σ j

theorem Copy.avoid_iff {n N : ℕ} {σ : Equiv.Perm (Fin n)} {π : Equiv.Perm (Fin N)}
    (e : Copy σ π) (z : Bool) (P : Fin n → Prop) :
    AvoidOn π z (fun y => ∃ x, P x ∧ e.f x=y) ↔ AvoidOn σ z P := by
  constructor
  · intro h k τ hb f hf ho hs
    exact h hb (e.f ∘ f) (e.mono.comp hf) (fun i j => (e.lt_iff _ _).trans (ho i j))
      (fun i => ⟨f i,hs i,rfl⟩)
  · intro h k τ hb f hf ho hs
    choose g hP he using hs
    exact h hb g (fun i j hij => e.mono.lt_iff_lt.mp (by rw [he,he]; exact hf hij))
      (fun i j => (e.lt_iff _ _).symm.trans (by rw [he,he]; exact ho i j)) hP

theorem avoidOn_all {n : ℕ} {π : Equiv.Perm (Fin n)} {z : Bool} :
    AvoidOn π z (fun _ => True) ↔ inClass z π := by
  rw [inClass_iff]; constructor
  · rintro h k τ hb ⟨f,hf,ho⟩; exact h hb f hf ho (fun _ => trivial)
  · intro h k τ hb f hf ho _; exact h hb ⟨f,hf,ho⟩

theorem Copy.mem_of_mem {n N : ℕ} {σ : Equiv.Perm (Fin n)} {π : Equiv.Perm (Fin N)}
    (e : Copy σ π) {z : Bool} (h : inClass z π) : inClass z σ :=
  avoidOn_all.mp ((e.avoid_iff z (fun _ => True)).mp (avoidOn_mono (P:=fun y => ∃ x, True ∧ e.f x=y)
    (fun _ _ => trivial) (avoidOn_all.mpr h)))

variable {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b)))

def tailCopy : Copy ν (expand σ ν) := ⟨Fin.natAdd _,Fin.strictMono_natAdd _,right_order σ ν⟩

def Rep (v : Fin (m+1+(a+b))) : Prop :=
  (b=0 ∧ v=(Fin.last m).castAdd (a+b)) ∨
    ∃ j : Fin (a+b), a≤(ν j).val ∧ v=j.natAdd (m+1)

theorem rep_exists : ∃ v, Rep (m:=m) ν v := by
  by_cases hb : b=0
  · exact ⟨_,Or.inl ⟨hb,rfl⟩⟩
  · let j := ν.symm (⟨a,by omega⟩ : Fin (a+b))
    exact ⟨_,Or.inr ⟨j,by simp [j],rfl⟩⟩

def corePos (v : Fin (m+1+(a+b))) (i : Fin (m+1)) :=
  if i=Fin.last m then v else i.castAdd (a+b)

theorem corePos_mono {v : Fin (m+1+(a+b))} (hv : Rep ν v) : StrictMono (corePos v) := by
  have hvm : m≤v.val := by rcases hv with ⟨_,rfl⟩|⟨j,_,rfl⟩ <;> simp; omega
  intro i j hij
  have hi := (hij.trans_le (Fin.le_last j)).ne
  by_cases hj : j=Fin.last m
  · subst j; simp only [corePos,ite_eq_right hi,ite_true]; change i.val < v.val; exact lt_of_lt_of_le hij hvm
  · simpa only [corePos,ite_eq_right hi,ite_eq_right hj] using (Fin.strictMono_castAdd (a+b)) hij

private theorem left_rep_order (hc : b=0 ↔ (σ (Fin.last m)).val=0) {v : Fin (m+1+(a+b))}
    (hv : Rep ν v) {i : Fin (m+1)} (hi : i≠Fin.last m) :
    expand σ ν (i.castAdd (a+b)) < expand σ ν v ↔ σ i < σ (Fin.last m) := by
  have hq : (σ i).val ≠ (σ (Fin.last m)).val := fun e => hi (σ.injective (Fin.ext e))
  rcases hv with ⟨hb,rfl⟩ | ⟨j,hj,rfl⟩
  · rw [Fin.lt_def,expand_minimum,Fin.lt_def,hc.mp hb]; omega
  · rw [Fin.lt_def,expand_left _ _ _ hi,expand_right,Fin.lt_def]
    simp only [enc]; split_ifs <;> omega

def coreCopy (hc : b=0 ↔ (σ (Fin.last m)).val=0) {v : Fin (m+1+(a+b))} (hv : Rep ν v) :
    Copy σ (expand σ ν) where
  f := corePos v
  mono := corePos_mono ν hv
  lt_iff i j := by
    by_cases hi : i=Fin.last m <;> by_cases hj : j=Fin.last m
    · subst i; subst j; simp
    · subst i; simp only [corePos,ite_true,ite_eq_right hj]
      have hneq : j.castAdd (a+b) ≠ v := by
        simpa only [corePos,ite_eq_right hj,ite_true] using (corePos_mono ν hv).injective.ne hj
      have he := left_rep_order σ ν hc hv hj
      exact ⟨fun h => lt_of_not_ge (fun hl => (lt_asymm h (he.mpr (lt_of_le_of_ne hl (σ.injective.ne hj))))),
        fun h => lt_of_not_ge (fun hl => lt_asymm h (he.mp (lt_of_le_of_ne hl ((expand σ ν).injective.ne hneq))))⟩
    · subst j; simpa only [corePos,ite_true,ite_eq_right hi] using left_rep_order σ ν hc hv hi
    · simpa only [corePos,ite_eq_right hi,ite_eq_right hj] using left_order σ ν hi hj

theorem core_mem (hc : b=0 ↔ (σ (Fin.last m)).val=0) {z : Bool} (h : inClass z (expand σ ν)) : inClass z σ := by
  obtain ⟨v,hv⟩ := rep_exists (m:=m) ν
  exact (coreCopy σ ν hc hv).mem_of_mem h

end Conjectures.ChernFuLinThreeStatistic.Expansion
