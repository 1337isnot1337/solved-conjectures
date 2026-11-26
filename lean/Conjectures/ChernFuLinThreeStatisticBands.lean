import Conjectures.ChernFuLinThreeStatisticExpansion
import Conjectures.ChernFuLinThreeStatisticDecomposition
import Mathlib.Order.Interval.Finset.Nat

/-! # Recovering the two right-hand value intervals in the minimum split -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Finset

/-- Right-hand labels form the union of a lowest interval and one further
interval, both disjoint from the minimum. A missing second interval has rank 0. -/
def Bands (a b r : ℕ) : Finset ℕ := Ico 1 (1+a) ∪ Ico (1+a+r) (1+a+r+b)

theorem bands_card (a b r : ℕ) : (Bands a b r).card = a+b := by
  unfold Bands
  rw [card_union_of_disjoint (Finset.disjoint_left.mpr (by
    intro i hi hi'; simp only [mem_Ico] at hi hi'; omega)),Nat.card_Ico,Nat.card_Ico]; omega

theorem enc_right_mem {a b r v : ℕ} (hv : v<a+b) : enc a b r (.right v) ∈ Bands a b r := by
  simp only [enc,Bands,mem_union,mem_Ico]; split_ifs <;> omega

theorem enc_left_not_mem {a b r q : ℕ} (hq : q ≠ r) : enc a b r (.left q) ∉ Bands a b r := by
  simp only [enc,Bands,mem_union,mem_Ico]; split_ifs <;> omega

theorem bands_unique {d a b r a' b' r' : ℕ} (hn : a+b=d) (hn' : a'+b'=d)
    (hc : b=0 ↔ r=0) (hc' : b'=0 ↔ r'=0)
    (h : Bands a b r = Bands a' b' r') : a=a' ∧ b=b' ∧ r=r' := by
  have memEq (y : ℕ) := Finset.ext_iff.mp h y
  simp only [Bands,mem_union,mem_Ico] at memEq
  have h₁ := memEq (1+a)
  have h₂ := memEq (1+a')
  have ha : a=a' := by omega
  have hb : b=b' := by omega
  have h₃ := memEq (1+a+r)
  have h₄ := memEq (1+a'+r')
  exact ⟨ha,hb,by omega⟩

def tailSet {m t : ℕ} (π : Equiv.Perm (Fin (m+1+t))) : Finset ℕ :=
  univ.image fun i : Fin t => (π (i.natAdd (m+1))).val

theorem tailSet_card {m t : ℕ} (π : Equiv.Perm (Fin (m+1+t))) : (tailSet π).card=t := by
  rw [tailSet,card_image_of_injective,card_univ,Fintype.card_fin]
  exact Fin.val_injective.comp (π.injective.comp (Fin.strictMono_natAdd _).injective)

theorem val_mem_tailSet {m t : ℕ} (π : Equiv.Perm (Fin (m+1+t))) (i : Fin (m+1+t)) :
    (π i).val ∈ tailSet π ↔ m < i.val := by
  simp only [tailSet,mem_image,mem_univ,true_and,Fin.val_inj,π.injective.eq_iff]
  constructor
  · rintro ⟨j,rfl⟩; change m<m+1+j.val; omega
  · intro hi
    exact ⟨⟨i.val-(m+1),by omega⟩,Fin.ext (by change m+1+(i.val-(m+1))=i.val; omega)⟩

/-- Compress any minimum-split permutation in either avoidance class into
its uniquely determined band parameters. This step uses convexity of the high
block; it does not assume an inverse to the expansion. -/
theorem exists_bands {m t : ℕ} {π : Equiv.Perm (Fin (m+1+t))} {z : Bool}
    (hm : 0<m) (hmn : (π ⟨m,by omega⟩).val=0) (hc : inClass z π) :
    ∃ a b r : ℕ, a+b=t ∧ r≤m ∧ (b=0 ↔ r=0) ∧ tailSet π = Bands a b r := by
  let mid : Fin (m+1+t) := ⟨m,by omega⟩
  let S := tailSet π
  let N := m+1+t
  have hm0 : (π mid).val=0 := hmn
  have hN (y) (hy : y ∈ S) : y<N := by
    obtain ⟨j,_,rfl⟩ := Finset.mem_image.mp hy; exact (π _).isLt
  have hzero : 0 ∉ S := by
    rw [← hm0]; exact fun e => (show ¬m<mid.val from (lt_irrefl _)) ((val_mem_tailSet π mid).mp e)
  let U := (univ : Finset (Fin m)).image fun i => (π ⟨i.val,by omega⟩).val
  have hu : U.Nonempty := ⟨_, mem_image.mpr ⟨⟨0,hm⟩,mem_univ _,rfl⟩⟩
  let k := U.min' hu
  obtain ⟨l,_,hv⟩ := mem_image.mp (min'_mem U hu)
  let p : Fin N := ⟨l.val,by omega⟩
  have hp : (π p).val=k := hv
  have hkm : k<N := hp ▸ (π p).isLt
  have hks : k ∉ S := by rw [← hp]; exact fun e => (by have := (val_mem_tailSet π p).mp e; dsimp [p] at this; omega)
  have hmne {i : Fin N} (hi : i ≠ mid) : 0<(π i).val := by
    by_contra! hv; exact hi (π.injective (Fin.ext (by omega)))
  have hkp : 0<k := hp ▸ hmne (by intro e; have := congrArg Fin.val e; dsimp [p,mid] at this; omega)
  have below {y : ℕ} (hy : 0<y) (hyk : y<k) : y ∈ S := by
    let i := π.symm ⟨y,by omega⟩
    have hi : (π i).val=y := congrArg Fin.val (π.apply_symm_apply _)
    rw [← hi]; apply (val_mem_tailSet π i).2
    by_contra! hle
    have him : i ≠ mid := fun e => by rw [e,hm0] at hi; omega
    have hi' : i.val<m := by change i ≠ ⟨m,_⟩ at him; exact lt_of_le_of_ne hle (fun e => him (Fin.ext e))
    have hu' : (π i).val ∈ U := mem_image.mpr ⟨⟨i.val,hi'⟩,mem_univ _,rfl⟩
    have := min'_le U _ hu'; change k≤_ at this; omega
  let H := S.filter (k<·)
  have hmemH (y : ℕ) : y∈H ↔ y∈S ∧ k<y := Finset.mem_filter
  have hS : S.card=t := tailSet_card π
  by_cases h : H.Nonempty
  · let lo := H.min' h
    let top := H.max' h
    have hlo := (hmemH lo).mp (min'_mem H h)
    have htop := (hmemH top).mp (max'_mem H h)
    have hle : lo≤top := min'_le H _ (max'_mem H h)
    have hiN := hN top htop.1
    have convex {y : ℕ} (hy₁ : lo≤y) (hy₂ : y≤top) : y∈S := by
      rcases eq_or_lt_of_le hy₁ with rfl|hy₁; · exact hlo.1
      rcases eq_or_lt_of_le hy₂ with rfl|hy₂; · exact htop.1
      let i := π.symm ⟨lo,by omega⟩; let j := π.symm ⟨top,by omega⟩; let q := π.symm ⟨y,by omega⟩
      have hi : (π i).val=lo := congrArg Fin.val (π.apply_symm_apply _)
      have hj : (π j).val=top := congrArg Fin.val (π.apply_symm_apply _)
      have hq : (π q).val=y := congrArg Fin.val (π.apply_symm_apply _)
      have hL : BursteinA218225.InX π ∨ InZ π := by cases z <;> first | exact Or.inl hc | exact Or.inr hc
      have hip : mid < i := (val_mem_tailSet π i).1 (hi ▸ hlo.1)
      have hjp : mid < j := (val_mem_tailSet π j).1 (hj ▸ htop.1)
      rw [← hq]; exact (val_mem_tailSet π q).2 (highBlock_convex hL (show p < mid from l.isLt)
        hip hjp (by change (π mid).val < (π p).val; omega) (by change (π p).val < (π i).val; omega)
        (by change (π i).val < (π q).val; omega) (by change (π q).val < (π j).val; omega))
    let a := k-1; let b := top+1-lo; let r := lo-k
    have he : S=Bands a b r := by
      ext y; simp only [Bands,mem_union,mem_Ico]; dsimp [a,b,r]
      constructor
      · intro hy; have h0 : y≠0 := fun e => hzero (e ▸ hy)
        rcases lt_trichotomy y k with h|rfl|h
        · left; omega
        · exact (hks hy).elim
        · have hh := (hmemH y).2 ⟨hy,h⟩; have h1 : lo≤y := min'_le _ _ hh; have h2 : y≤top := le_max' _ _ hh
          right; omega
      · rintro (⟨h1,h2⟩|⟨h1,h2⟩); exact below (by omega) (by omega); exact convex (by omega) (by omega)
    have hab : a+b=t := (bands_card a b r).symm.trans ((congrArg Finset.card he).symm.trans hS)
    refine ⟨a,b,r,hab,?_,?_,he⟩ <;> dsimp [a,b,r,N] at * <;> omega
  · have he : S=Bands (k-1) 0 0 := by
      ext y; simp only [Bands,mem_union,mem_Ico]; constructor
      · intro hy; have h0 : y≠0 := fun e => hzero (e ▸ hy)
        have hk : y≠k := fun e => hks (e ▸ hy)
        have hle : ¬ k<y := fun e => h ⟨y,(hmemH y).2 ⟨hy,e⟩⟩
        left; omega
      · rintro (⟨h1,h2⟩|⟨h1,h2⟩); exact below (by omega) (by omega); omega
    exact ⟨k-1,0,0,(bands_card ..).symm.trans ((congrArg Finset.card he).symm.trans hS),by omega,Iff.rfl,he⟩

end Conjectures.ChernFuLinThreeStatistic.Expansion
