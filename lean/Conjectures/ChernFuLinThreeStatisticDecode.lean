import Conjectures.ChernFuLinThreeStatisticBands

/-! # Counting equivalence for the core, cut and tail of a divided permutation -/

namespace Conjectures.ChernFuLinThreeStatistic.Expansion

open Finset

theorem tailSet_expand {m a b : ℕ} (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b))) :
    tailSet (expand σ ν) = Bands a b (σ (Fin.last m)).val := by
  apply eq_of_subset_of_card_le _ (by rw [bands_card,tailSet_card])
  rintro y hy
  obtain ⟨j,_,rfl⟩ := mem_image.mp hy
  rw [expand_right]; exact enc_right_mem (ν j).isLt

/-- If the actual right values are the two specified bands, decoding the
core and tail always succeeds. The chosen ranks are permutations, rather
than arbitrary functions; injectivity follows from the literal `π`. -/
theorem decode_fixed {m a b r : ℕ} (hr : r≤m) (π : Equiv.Perm (Fin (m+1+(a+b))))
    (h0 : (π ((Fin.last m).castAdd (a+b))).val=0) (hB : tailSet π = Bands a b r) :
    ∃ (σ : Equiv.Perm (Fin (m+1))) (ν : Equiv.Perm (Fin (a+b))),
      (σ (Fin.last m)).val=r ∧ expand σ ν=π := by
  classical
  let mid := (Fin.last m).castAdd (a+b)
  have nz {i} (hi : i ≠ mid) : (π i).val ≠ 0 := fun e => hi (π.injective (Fin.ext (e.trans h0.symm)))
  have leftInfo (i : Fin (m+1)) (hi : i ≠ Fin.last m) :
      ∃ q : Fin (m+1), q.val ≠ r ∧ enc a b r (.left q.val) = (π (i.castAdd (a+b))).val := by
    let y := (π (i.castAdd (a+b))).val
    have hyn : y ≠ 0 := nz (fun e => hi ((Fin.strictMono_castAdd _).injective e))
    have hym : y ∉ Bands a b r := by
      rw [← hB,val_mem_tailSet]; change ¬ m < i.val; omega
    have hv : Valid m (a+b) r (dec a b r y) := dec_valid hr (π _).isLt
    have he := enc_dec a b r y
    cases eq : dec a b r y with
    | minimum => rw [eq] at he; exact (hyn he.symm).elim
    | left q => rw [eq] at hv he; exact ⟨⟨q,Nat.lt_succ_of_le hv.1⟩,hv.2,he⟩
    | right v => rw [eq] at hv he; exact (hym (he ▸ enc_right_mem hv)).elim
  have rightInfo (i : Fin (a+b)) :
      ∃ v : Fin (a+b), enc a b r (.right v.val) = (π (i.natAdd (m+1))).val := by
    let y := (π (i.natAdd (m+1))).val
    have hym : y ∈ Bands a b r := by rw [← hB]; exact mem_image.mpr ⟨i,mem_univ _,rfl⟩
    have hyn : y ≠ 0 := fun e => by simp [e,Bands] at hym
    have hv : Valid m (a+b) r (dec a b r y) := dec_valid hr (π _).isLt
    have he := enc_dec a b r y
    cases eq : dec a b r y with
    | minimum => rw [eq] at he; exact (hyn he.symm).elim
    | left q => rw [eq] at hv he; exact ((enc_left_not_mem hv.2) (he ▸ hym)).elim
    | right v => rw [eq] at hv he; exact ⟨⟨v,hv⟩,he⟩
  let f (i : Fin (m+1)) := if hi : i=Fin.last m then (⟨r,Nat.lt_succ_of_le hr⟩ : Fin (m+1))
    else (leftInfo i hi).choose
  let g (i : Fin (a+b)) := (rightInfo i).choose
  have hf0 : (f (Fin.last m)).val=r := by simp [f]
  have hf {i : Fin (m+1)} (hi : i≠Fin.last m) : (f i).val ≠ r ∧
      enc a b r (.left (f i).val) = (π (i.castAdd (a+b))).val := by
    simpa only [f,dite_eq_right hi] using (leftInfo i hi).choose_spec
  have hg (i : Fin (a+b)) : enc a b r (.right (g i).val) = (π (i.natAdd (m+1))).val :=
    (rightInfo i).choose_spec
  have hfI : Function.Injective f := by
    intro i j e
    by_cases hi : i=Fin.last m
    · subst i; by_contra h; exact (hf (Ne.symm h)).1 ((congrArg Fin.val e).symm.trans hf0)
    by_cases hj : j=Fin.last m
    · subst j; exact ((hf hi).1 ((congrArg Fin.val e).trans hf0)).elim
    have H := (hf hi).2.symm.trans ((congrArg (fun v : Fin (m+1) => enc a b r (.left v.val)) e).trans (hf hj).2)
    exact (Fin.strictMono_castAdd _).injective (π.injective (Fin.ext H))
  have hgI : Function.Injective g := by
    intro i j e
    have H := (hg i).symm.trans ((congrArg (fun v : Fin (a+b) => enc a b r (.right v.val)) e).trans (hg j))
    exact (Fin.strictMono_natAdd _).injective (π.injective (Fin.ext H))
  let σ := Equiv.ofBijective f ((Fintype.bijective_iff_injective_and_card f).2 ⟨hfI,rfl⟩)
  let ν := Equiv.ofBijective g ((Fintype.bijective_iff_injective_and_card g).2 ⟨hgI,rfl⟩)
  have hσ : (σ (Fin.last m)).val=r := hf0
  refine ⟨σ,ν,hσ,Equiv.ext (fun i => Fin.ext ?_)⟩
  refine Fin.addCases (fun i => ?_) (fun j => ?_) i
  · by_cases hi : i=Fin.last m
    · subst i; exact (expand_minimum σ ν).trans h0.symm
    · rw [expand_left _ _ _ hi,hσ]; exact (hf hi).2
  · rw [expand_right,hσ]; exact hg j

structure Code (m t : ℕ) where
  a : ℕ
  b : ℕ
  total : a+b=t
  core : Equiv.Perm (Fin (m+1))
  tail : Equiv.Perm (Fin (a+b))
  canonical : b=0 ↔ (core (Fin.last m)).val=0

def Code.word {m t : ℕ} (c : Code m t) : Equiv.Perm (Fin (m+1+t)) := c.total ▸ expand c.core c.tail

theorem code_bands {m t : ℕ} (c : Code m t) : tailSet c.word = Bands c.a c.b (c.core (Fin.last m)).val := by
  rcases c with ⟨a,b,rfl,σ,ν,hc⟩; exact tailSet_expand σ ν

theorem code_injective {m t : ℕ} : Function.Injective (@Code.word m t) := by
  rintro ⟨a,b,rfl,σ,ν,hc⟩ ⟨a',b',hs',σ',ν',hc'⟩ hw
  have he := (code_bands _).symm.trans ((congrArg tailSet hw).trans (code_bands _))
  obtain ⟨e,e',hr⟩ := bands_unique rfl hs' hc hc' he
  subst a'; subst b'
  change expand σ ν = expand σ' ν' at hw
  obtain ⟨rfl,rfl⟩ := expand_injective_fixed (Fin.ext hr) hw
  rfl

theorem code_exists_of_mem {m t : ℕ} (hm : 0<m) {π : Equiv.Perm (Fin (m+1+t))} {z : Bool}
    (h0 : (π ⟨m,by omega⟩).val=0) (hc : inClass z π) : ∃ c : Code m t, c.word=π := by
  obtain ⟨a,b,r,hab,hr,hcan,hB⟩ := exists_bands hm h0 hc
  subst t
  obtain ⟨σ,ν,hσ,he⟩ := decode_fixed hr π h0 hB
  exact ⟨⟨a,b,rfl,σ,ν,by rwa [hσ]⟩,he⟩

theorem code_minimum {m t : ℕ} (c : Code m t) : (c.word ⟨m,by omega⟩).val=0 := by
  rcases c with ⟨a,b,rfl,σ,ν,hc⟩; exact expand_minimum σ ν

/-- The canonical minimum-split codes parametrise a literal class fibre. The
extra predicate can specify *any* statistics of the original permutation. -/
noncomputable def classCodeEquiv {m t : ℕ} (hm : 0<m) (z : Bool)
    (P : Equiv.Perm (Fin (m+1+t)) → Prop) :
    {c : Code m t // inClass z c.word ∧ P c.word} ≃
    {π : Equiv.Perm (Fin (m+1+t)) // inClass z π ∧ P π ∧ (π ⟨m,by omega⟩).val=0} :=
  Equiv.ofBijective (fun c => ⟨c.val.word,c.property.1,c.property.2,code_minimum _⟩) <| by
    constructor
    · intro c c' he; exact Subtype.ext (code_injective (congrArg Subtype.val he))
    · rintro ⟨π,hπ,hP,h0⟩
      obtain ⟨c,rfl⟩ := code_exists_of_mem hm h0 hπ
      exact ⟨⟨c,hπ,hP⟩,rfl⟩

end Conjectures.ChernFuLinThreeStatistic.Expansion
