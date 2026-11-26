import Conjectures.ChernFuLinThreeStatisticReduction

/-! # Z tails: the high block followed by the low block -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Crossing Finset

def highPos {a b : ℕ} (i : Fin b) : Fin (a+b) := ⟨i.val,by omega⟩
def lowPos {a b : ℕ} (i : Fin a) : Fin (a+b) := ⟨b+i.val,by omega⟩

def skew {a b : ℕ} (A : Equiv.Perm (Fin a)) (B : Equiv.Perm (Fin b)) : Equiv.Perm (Fin (a+b)) :=
  (finCongr (Nat.add_comm a b)).trans (finSumFinEquiv.symm.trans
    ((Equiv.sumCongr B A).trans ((Equiv.sumComm _ _).trans finSumFinEquiv)))

@[simp] theorem skew_high {a b : ℕ} (A : Equiv.Perm (Fin a)) (B : Equiv.Perm (Fin b)) (i : Fin b) :
    skew A B (highPos i)=(B i).natAdd a := by
  have h : (finCongr (Nat.add_comm a b)) (highPos i)=i.castAdd a := rfl
  simp [skew,h]

@[simp] theorem skew_low {a b : ℕ} (A : Equiv.Perm (Fin a)) (B : Equiv.Perm (Fin b)) (i : Fin a) :
    skew A B (lowPos i)=(A i).castAdd b := by
  have h : (finCongr (Nat.add_comm a b)) (lowPos i)=i.natAdd b := rfl
  simp [skew,h]

private theorem allPos {a b : ℕ} (i : Fin (a+b)) : (∃ j : Fin b, highPos j=i) ∨ ∃ j : Fin a, lowPos j=i := by
  by_cases h : i.val<b
  · exact Or.inl ⟨⟨i.val,h⟩,rfl⟩
  · exact Or.inr ⟨⟨i.val-b,by omega⟩,Fin.ext (by change b+(i.val-b)=i.val; omega)⟩

theorem tailOK_skew {a b : ℕ} (A : Equiv.Perm (Fin a)) (B : Equiv.Perm (Fin b)) :
    TailOK true a b (skew A B) ↔ inClass true A ∧ inClass true B := by
  let lowC : Copy A (skew A B) := ⟨lowPos,fun i j h => (by change b+i.val < b+j.val; omega),
    fun i j => by simp only [skew_low]; exact (Fin.strictMono_castAdd _).lt_iff_lt⟩
  let highC : Copy B (skew A B) := ⟨highPos,fun _ _ h => h,by simp⟩
  have lo (i : Fin (a+b)) : (skew A B i).val<a ↔ ∃ j, True ∧ lowC.f j=i := by
    constructor
    · intro h; rcases allPos i with ⟨j,rfl⟩ | ⟨j,rfl⟩
      · simp [Fin.val_natAdd] at h
      · exact ⟨j,trivial,rfl⟩
    · rintro ⟨j,_,rfl⟩; change (skew A B (lowPos j)).val<a; rw [skew_low]; exact (A j).isLt
  have hi (i : Fin (a+b)) : a≤(skew A B i).val ↔ ∃ j, True ∧ highC.f j=i := by
    constructor
    · intro h; rcases allPos i with ⟨j,rfl⟩ | ⟨j,rfl⟩
      · exact ⟨j,trivial,rfl⟩
      · simp at h; omega
    · rintro ⟨j,_,rfl⟩; change a≤(skew A B (highPos j)).val; simp
  have ht : tailRules true (fun i => (skew A B i).val) (@tailRole a b (skew A B)) := by
    intro i j hij h₁ h₂; simp [tailRole] at h₁ h₂
    obtain ⟨i,_,rfl⟩ := (lo i).1 h₁; obtain ⟨j,_,rfl⟩ := (hi j).1 h₂
    change b+i.val < j.val at hij; omega
  unfold TailOK
  rw [funext (fun i => propext (lo i)),funext (fun i => propext (hi i)),lowC.avoid_iff,highC.avoid_iff,avoidOn_all,avoidOn_all]
  tauto

private theorem exists_skew {a b : ℕ} (ν : Equiv.Perm (Fin (a+b)))
    (ht : tailRules true (fun i => (ν i).val) (@tailRole a b ν)) :
    ∃ A B, skew A B = ν := by
  classical
  let H := univ.filter fun i : Fin (a+b) => a≤(ν i).val
  let J := univ.filter fun i : Fin (a+b) => i.val<b
  have eH : Fin b ≃ H := Equiv.ofBijective (fun j => ⟨ν.symm (j.natAdd a),by simp [H,Fin.val_natAdd]⟩) <| by
    constructor
    · exact fun _ _ e => (Fin.strictMono_natAdd _).injective (ν.symm.injective (congrArg Subtype.val e))
    · rintro ⟨i,hi⟩; have ha : a≤(ν i).val := (mem_filter.mp hi).2
      refine ⟨⟨(ν i).val-a,by omega⟩,Subtype.ext (ν.symm_apply_eq.mpr (Fin.ext (by change a+((ν i).val-a)=(ν i).val; omega)))⟩
  have eJ : Fin b ≃ J := Equiv.ofBijective (fun j => ⟨highPos j,mem_filter.mpr ⟨mem_univ _,j.isLt⟩⟩) <| by
    constructor
    · intro i j e; exact Fin.ext (congrArg (fun x : J => x.val.val) e)
    · rintro ⟨i,h⟩; exact ⟨⟨i.val,(mem_filter.mp h).2⟩,rfl⟩
  have hcard : H.card=J.card := by simpa using Fintype.card_congr (eH.symm.trans eJ)
  have lowHigh (i j : Fin (a+b)) (hij : i<j) (hi : i∉H) (hj : j∈H) : False := by
    have hi' : (ν i).val<a := by simp [H] at hi; exact hi
    exact ht i j hij (by simp [tailRole,hi']) (by simp [tailRole,(mem_filter.mp hj).2.not_gt])
  have sub : J⊆H := by
    intro i hi; by_contra h
    have sub' : H⊆J := by
      intro j hj; apply mem_filter.mpr; refine ⟨mem_univ _,?_⟩
      by_contra! hle; have hlt := (mem_filter.mp hi).2
      exact lowHigh i j (by change i.val<j.val; omega) h hj
    exact h ((eq_of_subset_of_card_le sub' hcard.ge) ▸ hi)
  have eq := eq_of_subset_of_card_le sub hcard.le
  have ord (i : Fin (a+b)) : i.val<b ↔ a≤(ν i).val := by
    have he := Finset.ext_iff.mp eq i; simpa [H,J] using he
  let f (i : Fin a) : Fin a := ⟨(ν (lowPos i)).val,by
    have := (ord (lowPos i)).not; change (¬ b+i.val<b) ↔ _ at this; omega⟩
  let g (i : Fin b) : Fin b := ⟨(ν (highPos i)).val-a,by have := (ord (highPos i)).mp i.isLt; omega⟩
  have hf (i : Fin a) : (f i).castAdd b=ν (lowPos i) := rfl
  have hg (i : Fin b) : (g i).natAdd a=ν (highPos i) := Fin.ext (by
    have := (ord (highPos i)).mp i.isLt; change a+((ν (highPos i)).val-a)=_; omega)
  have fi : Function.Injective f := by
    intro i j e; have he := ν.injective ((hf i).symm.trans ((congrArg (Fin.castAdd b) e).trans (hf j)))
    have h := congrArg Fin.val he; change b+i.val=b+j.val at h; exact Fin.ext (by omega)
  have gi : Function.Injective g := by
    intro i j e; have he := ν.injective ((hg i).symm.trans ((congrArg (Fin.natAdd a) e).trans (hg j)))
    exact Fin.ext (congrArg (fun j : Fin (a+b) => j.val) he)
  let A := Equiv.ofBijective f ((Fintype.bijective_iff_injective_and_card f).2 ⟨fi,rfl⟩)
  let B := Equiv.ofBijective g ((Fintype.bijective_iff_injective_and_card g).2 ⟨gi,rfl⟩)
  refine ⟨A,B,Equiv.ext fun i => ?_⟩; rcases allPos i with ⟨j,rfl⟩|⟨j,rfl⟩
  · exact (skew_high A B j).trans (hg j)
  · exact (skew_low A B j).trans (hf j)

theorem rma_skew {a b : ℕ} (A : Equiv.Perm (Fin a)) (B : Equiv.Perm (Fin b)) :
    rma (skew A B)=rma A+rma B := by
  have hL (i : Fin a) : IsRightMax (skew A B) (lowPos i) ↔ IsRightMax A i := by
    constructor
    · intro h j hj; have hh := h (lowPos j) (by change b+i.val < b+j.val; omega)
      exact (Fin.strictMono_castAdd _).lt_iff_lt.mp (by simpa only [skew_low] using hh)
    · intro h j hj; rcases allPos j with ⟨k,rfl⟩|⟨k,rfl⟩
      · change b+i.val < k.val at hj; omega
      · change b+i.val < b+k.val at hj; simp only [skew_low]; exact (Fin.strictMono_castAdd _) (h k (by change i.val < k.val; omega))
  have hH (i : Fin b) : IsRightMax (skew A B) (highPos i) ↔ IsRightMax B i := by
    constructor
    · intro h j hj; have hh := h (highPos j) hj; simpa using hh
    · intro h j hj; rcases allPos j with ⟨k,rfl⟩|⟨k,rfl⟩
      · simpa using h k hj
      · simp only [skew_low,skew_high,Fin.lt_def,Fin.val_natAdd,Fin.val_castAdd]; omega
  let e : Fin (a+b) ≃ Fin b ⊕ Fin a := (finCongr (Nat.add_comm a b)).trans finSumFinEquiv.symm
  let I {n : ℕ} (π : Equiv.Perm (Fin n)) (i : Fin n) := if ∀ j>i, π j<π i then 1 else 0
  change (∑ i, I (skew A B) i) = (∑ i, I A i)+(∑ i, I B i)
  rw [← e.symm.sum_comp,Fintype.sum_sum_type,add_comm (∑ i, I A i)]
  exact congrArg₂ Nat.add (Finset.sum_congr rfl fun i _ => if_congr (hH i) rfl rfl)
    (Finset.sum_congr rfl fun i _ => if_congr (hL i) rfl rfl)

theorem tailWeight_skew {a b : ℕ} (A : Equiv.Perm (Fin a)) (B : Equiv.Perm (Fin b)) :
    tailWeight a b (skew A B)=wt A*wt B := by
  have low (v : ℕ) (hv : v<a) : pos (skew A B) v=b+pos A v := by
    let i := A.symm (⟨v,hv⟩ : Fin a)
    have he : ((skew A B) (lowPos i)).val=v := by simp [i]
    rw [pos_of_apply he]; simp [lowPos,i,pos,hv]
  have high (v : ℕ) (hv : v<b) : pos (skew A B) (a+v)=pos B v := by
    let i := B.symm (⟨v,hv⟩ : Fin b)
    have he : ((skew A B) (highPos i)).val=a+v := by simp [i]
    rw [pos_of_apply he]; simp [highPos,i,pos,hv]
  have h₁ : internal (pos (skew A B)) 0 a=internal (pos A) 0 a :=
    internal_copy (off:=b) (by simpa using low)
  have h₂ : internal (pos (skew A B)) a b=internal (pos B) 0 b :=
    internal_copy (off:=0) (by simpa using high)
  rw [tailWeight,h₁,h₂,rma_skew,← ides_internal,← ides_internal]; simp [wt,pow_add]; ring

noncomputable section
open Classical

theorem tailSum_Z (a b : ℕ) : tailSum true a b=totalWeight true a*totalWeight true b := by
  let P (n : ℕ) := {π : Equiv.Perm (Fin n) // inClass true π}
  let e : P a × P b ≃ TailSet true a b := Equiv.ofBijective
    (fun p => ⟨skew p.1.val p.2.val,(tailOK_skew ..).mpr ⟨p.1.property,p.2.property⟩⟩) <| by
    constructor
    · rintro ⟨A,B⟩ ⟨A',B'⟩ e
      have he : skew A.val B.val=skew A'.val B'.val := congrArg Subtype.val e
      apply Prod.ext <;> apply Subtype.ext <;> apply Equiv.ext <;> intro i
      · have hh := congrArg (fun π : Equiv.Perm (Fin (a+b)) => π (lowPos i)) he
        rw [skew_low,skew_low] at hh; exact (Fin.strictMono_castAdd _).injective hh
      · have hh := congrArg (fun π : Equiv.Perm (Fin (a+b)) => π (highPos i)) he
        rw [skew_high,skew_high] at hh; exact (Fin.strictMono_natAdd _).injective hh
    · rintro ⟨ν,h⟩; obtain ⟨A,B,rfl⟩ := exists_skew ν h.1
      obtain ⟨ha,hb⟩ := (tailOK_skew ..).mp h; exact ⟨(⟨A,ha⟩,⟨B,hb⟩),rfl⟩
  have ht (n : ℕ) : totalWeight true n=∑ π : P n, wt π.val := by
    unfold totalWeight; rw [← sum_filter]; exact Finset.sum_subtype _ (by simp) _
  rw [tailSum,← e.sum_comp,Fintype.sum_prod_type,ht,ht,Finset.sum_mul]
  apply sum_congr rfl; intro A _; rw [Finset.mul_sum]; exact sum_congr rfl fun B _ => tailWeight_skew A.val B.val

theorem Z_tail_identity (n : ℕ) : nonemptyHigh true (n+1) = tails (markWeight true) (n+1) := by
  let p : Split (n+1) := ⟨(0,n+1),by simp⟩
  have hs (i : ℕ) : scalar (markWeight true) i = if i=0 then 0 else totalWeight true i := by
    by_cases hi : i=0
    · subst i; simp [scalar,markWeight]
    · simp [hi,scalar_markWeight (Nat.pos_of_ne_zero hi)]
  have h0 : totalWeight true 0=1 := by
    unfold totalWeight; rw [Fintype.sum_unique]; have hc : inClass true (default : Equiv.Perm (Fin 0)) := by
      apply (inClass_iff ..).2; rintro k τ hb ⟨f,_,_⟩; obtain ⟨i,_,_,_,_,_⟩ := basis_internal_min hb; exact Fin.elim0 (f i)
    rw [ite_eq_left hc]; simp [wt,ides,rma]
  have hsum : (∑ x ∈ antidiagonal (n+1), scalar (markWeight true) x.1 * scalar (markWeight true) x.2) =
      ∑ x : Split (n+1), scalar (markWeight true) x.val.1 * scalar (markWeight true) x.val.2 :=
    Finset.sum_subtype _ (by simp) _
  have hsingle : scalar (markWeight true) (n+1) = ∑ q : Split (n+1), if q=p then scalar (markWeight true) (n+1) else 0 := by simp
  unfold nonemptyHigh tails; rw [hsum,hsingle,←sum_add_distrib]; apply sum_congr rfl; intro q _
  by_cases ha : q.val.1=0
  · have he : q=p := Subtype.ext (Prod.ext ha (by have := mem_antidiagonal.mp q.property; change _=n+1; omega))
    subst q; simp [p,hs,tailSum_Z,h0]
  · have he : q≠p := fun e => ha (e ▸ rfl)
    by_cases hb : q.val.2=0 <;> simp [ha,hb,he,hs,tailSum_Z]

end

/-- All five equations of the literal Z distribution. -/
theorem markedRecurrence_Z : MarkedRecurrence (markWeight true) T Z Z⁻¹ :=
  marked_of_tail Z_tail_identity

/-- The scalar X tail sum is the sole remaining hypothesis of this reduction. -/
theorem equidistributed_of_X_tail (h : ∀ n, nonemptyHigh false (n+1) = tails (markWeight false) (n+1)) :
    Equidistributed := equidistributed_of_marked_recurrences (marked_of_tail h) markedRecurrence_Z

end Conjectures.ChernFuLinThreeStatistic.Expansion
