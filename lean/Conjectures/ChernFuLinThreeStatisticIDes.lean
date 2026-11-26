import Conjectures.ChernFuLinThreeStatisticExpansion
import Conjectures.ChernFuLinThreeStatisticDefs

/-! # Inverse descents across the value bands of the minimum split -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

/-- Inverse positions, extended by a sentinel outside the value range. -/
def pos {n : ℕ} (π : Equiv.Perm (Fin n)) (y : ℕ) : ℕ :=
  if h : y<n then (π.symm ⟨y,h⟩).val else n

/-- Consecutive descents *within* an interval of values. -/
def internal (f : ℕ → ℕ) (i len : ℕ) := ∑ j ∈ Finset.range (len-1),
  if f (i+j+1) < f (i+j) then 1 else 0

theorem ides_internal {n : ℕ} (π : Equiv.Perm (Fin n)) : ides π = internal (pos π) 0 n := by
  cases n with
  | zero => simp [ides,internal]
  | succ n =>
    simp only [ides,internal,Nat.add_sub_cancel,zero_add,← Fin.sum_univ_eq_sum_range]
    apply Finset.sum_congr rfl; intro i _
    simp only [pos,dite_eq_left (by omega : i.val+1<n+1),dite_eq_left (by omega : i.val<n+1)]
    rfl

def join (f : ℕ → ℕ) (i n m : ℕ) :=
  if 0<n ∧ 0<m ∧ f (i+n)<f (i+n-1) then 1 else 0

theorem internal_add (f : ℕ → ℕ) (i n m : ℕ) : internal f i (n+m) =
    internal f i n + internal f (i+n) m + join f i n m := by
  cases n with
  | zero => simp [internal,join]
  | succ n =>
    cases m with
    | zero => simp [internal,join]
    | succ m =>
      simp only [internal,Nat.succ_sub_one,show n+1+(m+1)-1=(n+1)+m by omega,Finset.sum_range_add,
        Finset.sum_range_succ (n:=n),join,Nat.zero_lt_succ,true_and,Nat.add_succ_sub_one]
      simp only [Nat.add_assoc]; ac_rfl

theorem internal_copy {f g : ℕ → ℕ} {lo old len off : ℕ}
    (h : ∀ j, j<len → f (lo+j)=off+g (old+j)) : internal f lo len = internal g old len := by
  apply Finset.sum_congr rfl; intro j hj
  have hj' := Finset.mem_range.mp hj
  have h' := h (j+1) (by omega)
  rw [← Nat.add_assoc,← Nat.add_assoc] at h'
  rw [h',h j (by omega)]; simp

theorem pos_of_apply {n : ℕ} {π : Equiv.Perm (Fin n)} {i : Fin n} {y : ℕ}
    (h : (π i).val=y) : pos π y=i.val := by subst y; simp [pos]

variable {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b)))

theorem pos_min : pos (expand σ ν) 0 = m := pos_of_apply (expand_minimum σ ν)

theorem pos_left {q : ℕ} (hq : q<m+1) (hr : q≠(σ (Fin.last m)).val) :
    pos (expand σ ν) (enc a b (σ (Fin.last m)).val (.left q)) = pos σ q := by
  let i := σ.symm (⟨q,hq⟩ : Fin (m+1))
  have hi : i≠Fin.last m := fun e => hr (congrArg Fin.val (σ.symm_apply_eq.mp e))
  have hq' : (σ i).val=q := congrArg Fin.val (σ.apply_symm_apply _)
  have he := expand_left σ ν i hi; rw [hq'] at he
  rw [pos_of_apply he]; simp [pos,hq,i]

theorem pos_right {v : ℕ} (hv : v<a+b) :
    pos (expand σ ν) (enc a b (σ (Fin.last m)).val (.right v)) = m+1+pos ν v := by
  let i := ν.symm (⟨v,hv⟩ : Fin (a+b))
  have hv' : (ν i).val=v := congrArg Fin.val (ν.apply_symm_apply _)
  have he := expand_right σ ν i; rw [hv'] at he
  rw [pos_of_apply he]; simp [pos,hv,i]

/-- Inverse descents from the tail's cut are omitted; the internal descents
of its low and high blocks contribute separately. -/
theorem ides_expand (hcan : b=0 ↔ (σ (Fin.last m)).val=0) :
    ides (expand σ ν) = ides σ + internal (pos ν) 0 a + internal (pos ν) a b + if b=0 then 0 else 1 := by
  let r := (σ (Fin.last m)).val
  let h := m-r
  let f := pos (expand σ ν)
  have hr : r≤m := Fin.le_last _
  have hmid : pos σ r=m := pos_of_apply (i:=Fin.last m) rfl
  have small (q) (hq : q≤m) (hne : q≠r) : pos σ q<m := by
    have hlt : q<m+1 := by omega
    have hn : σ.symm (⟨q,hlt⟩ : Fin (m+1)) ≠ Fin.last m := fun e => hne (congrArg Fin.val (σ.symm_apply_eq.mp e))
    rw [show pos σ q = (σ.symm ⟨q,hlt⟩).val by simp [pos,hlt]]
    exact (show σ.symm ⟨q,hlt⟩ < Fin.last m from lt_of_le_of_ne (Fin.le_last _) hn)
  have hA (v) (hv : v<a) : f (1+v)=m+1+pos ν v := by
    simpa only [enc,ite_eq_left hv] using pos_right σ ν (by omega : v<a+b)
  have hL (q) (hq : q<r) : f (1+a+q)=pos σ q := by
    have e := pos_left σ ν (by omega : q<m+1) hq.ne
    change f (enc a b r (.left q)) = _ at e
    simpa only [enc,ite_eq_left hq,Nat.add_comm a 1] using e
  have hB (j) (hj : j<b) : f (1+a+r+j)=m+1+pos ν (a+j) := by
    have he := pos_right σ ν (show a+j<a+b by omega)
    change f (enc a b r (.right (a+j))) = _ at he
    simpa only [enc,ite_eq_right (by omega : ¬ a+j<a),show r+1+(a+j)=1+a+r+j by omega] using he
  have hH (j) (hj : j<h) : f (1+a+r+b+j)=pos σ (r+1+j) := by
    have hh : r+1+j<m+1 := by dsimp [h] at hj; omega
    have he := pos_left σ ν hh (by change r+1+j≠r; omega)
    change f (enc a b r (.left (r+1+j))) = _ at he
    simpa only [enc,ite_eq_right (by omega : ¬r+1+j<r), show a+b+(r+1+j)=1+a+r+b+j by omega] using he
  have total : m+1+(a+b)=(((1+a)+r)+b)+h := by dsimp [h]; omega
  have core : m+1=(r+1)+h := by dsimp [h]; omega
  have pA : internal f 1 a = internal (pos ν) 0 a := internal_copy (off:=m+1) (by simpa using hA)
  have pL : internal f (1+a) r = internal (pos σ) 0 r := internal_copy (off:=0) (by simpa using hL)
  have pB : internal f (1+a+r) b = internal (pos ν) a b := internal_copy (off:=m+1) hB
  have pH : internal f (1+a+r+b) h = internal (pos σ) (r+1) h := internal_copy (off:=0) (by simpa using hH)
  have jmA : join f 0 1 a = 0 := by
    unfold join; have := pos_min σ ν; change f 0=m at this
    by_cases ha : 0<a
    · have eq := hA 0 ha; simp only [Nat.add_zero] at eq
      simp [eq,this]; omega
    · simp [ha]
  have jmL : join f 0 (1+a) r = (if b=0 then 0 else 1) := by
    unfold join; have h0 : f 0=m := pos_min σ ν
    by_cases hb : b=0
    · have hr0 : r=0 := hcan.mp hb; simp [hr0,hb]
    · have hp : 0<r := by have hn := mt hcan.mpr hb; change r ≠ 0 at hn; omega
      have hs := small 0 (by omega) hp.ne; have eq := hL 0 hp; rw [Nat.add_zero] at eq
      cases a with
      | zero => simp [hb,hp,eq,h0,hs]
      | succ a =>
        have e := hA a (Nat.lt_succ_self _)
        simp only [Nat.zero_add,show 1+(a+1)-1=1+a by omega]; split_ifs <;> omega
  have jmB : join f 0 (1+a+r) b = 0 := by
    unfold join; by_cases hb : 0<b
    · have hp : 0<r := by have hn := mt hcan.mpr hb.ne'; change r≠0 at hn; omega
      have e := hB 0 hb; have e' := hL (r-1) (by omega); have es := small (r-1) (by omega) (by omega)
      rw [Nat.add_zero] at e; rw [show 1+a+(r-1)=1+a+r-1 by omega] at e'
      simp [e,e']; omega
    · simp [hb]
  have jmH : join f 0 (1+a+r+b) h = if h=0 then 0 else 1 := by
    unfold join; by_cases hh : h=0 <;> simp [hh]
    have hp : 0<h := Nat.pos_of_ne_zero hh
    have e := hH 0 hp; simp only [Nat.add_zero] at e
    have es := small (r+1) (by dsimp [h] at hp; omega) (by omega)
    have hb0 : b=0 → r=0 := hcan.mp
    by_cases hb : b=0
    · have hr0 := hb0 hb
      by_cases ha : a=0
      · have e' := pos_min σ ν; change f 0=m at e'; simp_all
      · have e' := hA (a-1) (by omega); simp only [show 1+(a-1)=a by omega] at e'
        simp_all; omega
    · have e' := hB (b-1) (by omega); rw [show 1+a+r+(b-1)=1+a+r+b-1 by omega] at e'
      simp_all; omega
  have jC₁ : join (pos σ) 0 r 1 = 0 := by
    unfold join; by_cases hp : 0<r
    · have e := small (r-1) (by omega) (by omega); simp [hmid,e.not_gt]
    · simp [hp]
  have jC₂ : join (pos σ) 0 (r+1) h = if h=0 then 0 else 1 := by
    unfold join; by_cases hh : h=0 <;> simp [hh,hmid]
    have := small (r+1) (by dsimp [h] at hh; omega) (by omega); omega
  rw [ides_internal,ides_internal]; change internal f 0 _ = _
  rw [total, internal_add f 0 (1+a+r+b) h,internal_add f 0 (1+a+r) b,internal_add f 0 (1+a) r,
    internal_add f 0 1 a,congrArg (internal (pos σ) 0) core,internal_add (pos σ) 0 (r+1) h,internal_add (pos σ) 0 r 1]
  simp only [Nat.zero_add,pA,pL,pB,pH,jmA,jmL,jmB,jmH,jC₁,jC₂]
  simp [internal]; omega

end Conjectures.ChernFuLinThreeStatistic.Expansion
