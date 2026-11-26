import Conjectures.ChernFuLinThreeStatisticCopies

/-! # The class test separates into an independent core and decorated tail -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Crossing

def tailRole {a b : ℕ} (ν : Equiv.Perm (Fin (a+b))) (j : Fin (a+b)) : Role :=
  if (ν j).val<a then 1 else 3

def TailOK (z : Bool) (a b : ℕ) (ν : Equiv.Perm (Fin (a+b))) : Prop :=
  tailRules z (fun i => (ν i).val) (@tailRole a b ν) ∧
    AvoidOn ν z (fun j => (ν j).val<a) ∧ AvoidOn ν z (fun j => a≤(ν j).val)

private theorem role_rules_iff {N t : ℕ} {z : Bool} (π : Equiv.Perm (Fin N)) (ν : Equiv.Perm (Fin t))
    (e : Copy ν π) (big : Fin N → Role) (small : Fin t → Role)
    (h : ∀ i c, c=1 ∨ c=3 → (big i=c ↔ ∃ j, small j=c ∧ e.f j=i)) :
    tailRules z (fun i => (π i).val) big ↔ tailRules z (fun i => (ν i).val) small := by
  have emb (j : Fin t) (c : Role) (hc : c=1 ∨ c=3) : big (e.f j)=c ↔ small j=c := by
    rw [h _ _ hc]; exact ⟨fun ⟨k,hk,he⟩ => e.mono.injective he ▸ hk, fun hj => ⟨j,hj,rfl⟩⟩
  have h1 := fun i => h i 1 (Or.inl rfl)
  have h3 := fun i => h i 3 (Or.inr rfl)
  have e1 := fun i => (emb i 1 (Or.inl rfl)).mpr
  have e3 := fun i => (emb i 3 (Or.inr rfl)).mpr
  cases z
  · constructor
    · rintro ⟨decr,cut⟩
      exact ⟨fun i j hij hi hj => (e.lt_iff _ _).1 (decr _ _ (e.mono hij) (e3 _ hi) (e3 _ hj)),
        fun i j l b hij hjl hjb hi hj hl hb hji hil => cut _ _ _ _ (e.mono hij) (e.mono hjl)
          (e.mono hjb) (e1 _ hi) (e1 _ hj) (e1 _ hl) (e3 _ hb) ((e.lt_iff _ _).2 hji) ((e.lt_iff _ _).2 hil)⟩
    · rintro ⟨decr,cut⟩; constructor
      · intro i j hij hi hj
        obtain ⟨i,h₁,rfl⟩ := (h3 _).1 hi; obtain ⟨j,h₂,rfl⟩ := (h3 _).1 hj
        exact (e.lt_iff _ _).2 (decr _ _ (e.mono.lt_iff_lt.1 hij) h₁ h₂)
      · intro i j l b hij hjl hjb hi hj hl hb hji hil
        obtain ⟨i,h₁,rfl⟩ := (h1 _).1 hi; obtain ⟨j,h₂,rfl⟩ := (h1 _).1 hj
        obtain ⟨l,h₃,rfl⟩ := (h1 _).1 hl; obtain ⟨b,h₄,rfl⟩ := (h3 _).1 hb
        exact cut _ _ _ _ (e.mono.lt_iff_lt.1 hij) (e.mono.lt_iff_lt.1 hjl) (e.mono.lt_iff_lt.1 hjb)
          h₁ h₂ h₃ h₄ ((e.lt_iff _ _).1 hji) ((e.lt_iff _ _).1 hil)
  · constructor
    · intro ht i j hij hi hj; exact ht _ _ (e.mono hij) (e1 _ hi) (e3 _ hj)
    · intro ht i j hij hi hj
      obtain ⟨i,h₁,rfl⟩ := (h1 _).1 hi; obtain ⟨j,h₂,rfl⟩ := (h3 _).1 hj
      exact ht _ _ (e.mono.lt_iff_lt.1 hij) h₁ h₂

variable {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b)))

private theorem in_tail (i : Fin (m+1+(a+b))) : m < i.val ↔ ∃ j : Fin (a+b), j.natAdd (m+1)=i := by
  constructor
  · intro hi; exact ⟨⟨i.val-(m+1),by omega⟩,Fin.ext (by change m+1+(i.val-(m+1))=i.val; omega)⟩
  · rintro ⟨j,rfl⟩; change m < m+1+j.val; omega

private theorem core_pos_cover {v x : Fin (m+1+(a+b))} (hx : x.val<m ∨ x=v) :
    ∃ i, True ∧ corePos v i=x := by
  rcases hx with hx | rfl
  · let i : Fin (m+1) := ⟨x.val,by omega⟩
    have hi : i≠Fin.last m := (show i < Fin.last m from hx).ne
    exact ⟨i,trivial,by simp only [corePos,ite_eq_right hi]; rfl⟩
  · exact ⟨Fin.last m,trivial,by simp [corePos]⟩

/-- `expand` is in the actual class if and only if the core and the decorated
right word satisfy their respective independent tests. -/
theorem inClass_expand_iff {z : Bool} (hm : 0<m) (hc : b=0 ↔ (σ (Fin.last m)).val=0) :
    inClass z (expand σ ν) ↔ inClass z σ ∧ TailOK z a b ν := by
  classical
  let π := expand σ ν
  let M := (Fin.last m).castAdd (a+b)
  obtain ⟨hbound,i,hi,he⟩ := recover_low hm σ ν (by simpa using hc)
  let l := i.castAdd (a+b)
  have hlm : l<M := (Fin.strictMono_castAdd _ ) (lt_of_le_of_ne (Fin.le_last i) hi)
  have hlv : (π l).val=a+1 := he
  have hM : (π M).val=0 := expand_minimum σ ν
  have hmin (j) (hj : j ≠ M) : π M < π j := by
    have hn := π.injective.ne hj; rw [Fin.ne_iff_vne,hM] at hn; rw [Fin.lt_def,hM]; omega
  have hl (j : Fin _) (hj : j<M) : π l ≤ π j := by
    let q : Fin (m+1) := ⟨j.val,by change j.val<m at hj; omega⟩
    have hq : q≠Fin.last m := (show q<Fin.last m from hj).ne
    change (π l).val≤(π j).val; rw [hlv]; exact hbound q hq
  have hside (j) : (low π M l j ↔ ∃ v, (ν v).val<a ∧ v.natAdd (m+1)=j) ∧
      (high π M l j ↔ ∃ v, a≤(ν v).val ∧ v.natAdd (m+1)=j) := by
    have hlp (v : Fin (a+b)) : (π (v.natAdd (m+1)) < π l ↔ (ν v).val<a) ∧
        (π l < π (v.natAdd (m+1)) ↔ a≤(ν v).val) := by
      have hcan : b=0 ↔ (σ (Fin.last m)).val=0 := hc
      simp only [Fin.lt_def,hlv,π,expand_right,enc]; split_ifs <;> omega
    have hh (v : Fin (a+b)) : M<v.natAdd (m+1) := by change m<m+1+v.val; omega
    constructor <;> constructor
    · rintro ⟨hm,hv⟩; obtain ⟨v,rfl⟩ := (in_tail _).1 hm; exact ⟨v,(hlp v).1.mp hv,rfl⟩
    · rintro ⟨v,hv,rfl⟩; exact ⟨hh v,(hlp v).1.mpr hv⟩
    · rintro ⟨hm,hv⟩; obtain ⟨v,rfl⟩ := (in_tail _).1 hm; exact ⟨v,(hlp v).2.mp hv,rfl⟩
    · rintro ⟨v,hv,rfl⟩; exact ⟨hh v,(hlp v).2.mpr hv⟩
  have hdiv : Divided π M l := by
    intro j k q hj hk hjq hqk
    obtain ⟨u,hu,rfl⟩ := (hside _).2.1 hj; obtain ⟨v,hv,rfl⟩ := (hside _).2.1 hk
    apply (val_mem_tailSet π q).1; rw [tailSet_expand]
    change (expand σ ν (u.natAdd _)).val < (π q).val at hjq
    change (π q).val < (expand σ ν (v.natAdd _)).val at hqk
    simp only [expand_right,enc,ite_eq_right hu.not_gt,ite_eq_right hv.not_gt] at hjq hqk
    apply Finset.mem_union_right; apply Finset.mem_Ico.mpr; constructor <;> omega
  have hRole (j c) (H : c=1 ∨ c=3) : cutRole π M l j=c ↔
      ∃ v, @tailRole a b ν v=c ∧ (tailCopy σ ν).f v=j := by
    rcases H with rfl|rfl
    · simp [tailRole,tailCopy,role_low,hside]
    · simp [tailRole,tailCopy,role_high π M l hlm,hside]
  have ht := role_rules_iff (z:=z) π ν (tailCopy σ ν) _ _ hRole
  have part (P : Fin _ → Prop) (S : Finset (Fin _))
      (hS : ∀ i, i∈S ↔ ∃ v, P v ∧ v.natAdd (m+1)=i) : inClass z (standardize π S) ↔ AvoidOn ν z P := by
    rw [inClass_standardize_iff,← (tailCopy σ ν).avoid_iff]
    have e : (fun i => i∈S) = (fun i => ∃ v, P v ∧ (tailCopy σ ν).f v=i) := funext fun i => propext (hS i)
    rw [e]
  have hA := part (fun v => (ν v).val<a) (Finset.univ.filter fun j => M < j ∧ π j < π l)
    (by intro i; simpa only [low,Finset.mem_filter,Finset.mem_univ,true_and] using (hside i).1)
  have hB := part (fun v => a≤(ν v).val) (Finset.univ.filter fun j => M < j ∧ π l < π j)
    (by intro i; simpa only [high,Finset.mem_filter,Finset.mem_univ,true_and] using (hside i).2)
  constructor
  · intro hπ; obtain ⟨_,hT,ha,hb,_⟩ := (minimum_iff hmin hlm hl).mp hπ
    exact ⟨core_mem σ ν (by simpa using hc) hπ,ht.mp hT,hA.mp ha,hB.mp hb⟩
  · rintro ⟨hσ,hT,ha,hb⟩; apply (minimum_iff hmin hlm hl).mpr
    refine ⟨hdiv,ht.mpr hT,hA.mpr ha,hB.mpr hb,fun y => ?_⟩
    apply (inClass_standardize_iff ..).mpr
    by_cases hex : ∃ v : Fin (a+b), some (v.natAdd (m+1))=y ∧ a≤(ν v).val
    · obtain ⟨v,hy,hv⟩ := hex
      let e := coreCopy σ ν (by simpa using hc) (Or.inr ⟨v,hv,rfl⟩)
      apply avoidOn_mono (Q:=fun j => ∃ k, True ∧ e.f k=j) _ ((e.avoid_iff z _).mpr (avoidOn_all.mpr hσ))
      intro j hj; apply core_pos_cover; rcases (Finset.mem_filter.mp hj).2 with h|⟨_,he⟩
      · exact Or.inl h
      · exact Or.inr (Option.some.inj (he.trans hy.symm))
    · obtain ⟨v,hv⟩ := rep_exists (m:=m) ν
      let e := coreCopy σ ν (by simpa using hc) hv
      apply avoidOn_mono (Q:=fun j => ∃ k, True ∧ e.f k=j) _ ((e.avoid_iff z _).mpr (avoidOn_all.mpr hσ))
      intro j hj; apply core_pos_cover; left
      rcases (Finset.mem_filter.mp hj).2 with h|⟨h,he⟩; exact h
      obtain ⟨k,hk,rfl⟩ := (hside _).2.1 h; exact (hex ⟨k,he,hk⟩).elim

end Conjectures.ChernFuLinThreeStatistic.Expansion
