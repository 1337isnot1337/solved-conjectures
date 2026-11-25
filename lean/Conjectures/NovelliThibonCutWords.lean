module
public import Conjectures.NovelliThibonRepeatedAlphabet
public import Conjectures.NovelliThibonRankPrefixes

@[expose] public section
namespace NovelliThibon

open Classical
variable {n : ℕ}

def OrdinaryRepeatedWord (D : Finset (Fin n)) (m : ℕ) (w : Fin (n+1) → Fin (m+1)) : Prop :=
  Monotone w ∧ ∀ i ∈ D,w i.castSucc < w i.succ

abbrev OrdinaryCutWord (D : Finset (Fin n)) (m a : ℕ) :=
  {w : Fin (n+1) → Fin (m+1) //
    OrdinaryRepeatedWord D m w ∧ ∀ i : Fin (n+1), (w i).val < m ↔ i.val < a}

def SuffixClean (D : Finset (Fin n)) (a : ℕ) : Prop :=
  ∀ i : Fin n,a ≤ i.val → i∉D

def weakPrefixBoundaries (D : Finset (Fin n)) (k : ℕ) (hk : k ≤ n) : Finset (Fin k) :=
  Finset.univ.filter fun i => i.castLE hk ∉ D

theorem mem_weakPrefixBoundaries (D : Finset (Fin n)) {k : ℕ} (hk : k ≤ n) (i : Fin k) :
    i∈weakPrefixBoundaries D k hk ↔ i.castLE hk∉D := by simp [weakPrefixBoundaries]

theorem ordinaryCutWord_suffixClean (D : Finset (Fin n)) {m a : ℕ}
    (w : OrdinaryCutWord D m a) : SuffixClean D a := by
  intro i hi hiD
  have h1 : ¬(w.val i.castSucc).val < m := fun h => (not_lt_of_ge hi) ((w.property.2 _).mp h)
  have h2 : ¬(w.val i.succ).val < m := fun h => by
    have hh := (w.property.2 _).mp h
    change i.val+1 < a at hh
    omega
  have e₁ := (w.val i.castSucc).isLt
  have e₂ := (w.val i.succ).isLt
  have hs : (w.val i.castSucc).val < (w.val i.succ).val := w.property.1.2 _ hiD
  omega

/-- On an actual prefix/suffix split, the finite fundamental word
condition yields exactly the required weak-boundary slice. -/
noncomputable def cutWordEquivSlice (D : Finset (Fin n)) (m k : ℕ) (hk : k ≤ n)
    (hc : SuffixClean D (k+1)) :
    OrdinaryCutWord D m (k+1) ≃ RepeatedAlphabetSlice (weakPrefixBoundaries D k hk) (n-k) m := by
  let e : Fin ((k+1)+(n-k)) ≃ Fin (n+1) := finCongr (by omega)
  have hv (i : Fin ((k+1)+(n-k))) : (e i).val=i.val := rfl
  have hr (i : Fin (n+1)) : (e.symm i).val=i.val := rfl
  refine ⟨?_,?_,?_,?_⟩
  · intro w
    refine ⟨w.val ∘ e,?_,?_,?_,?_⟩
    · intro i
      apply (w.property.2 _).mpr
      rw [hv]
      exact i.isLt
    · intro j
      apply Fin.ext
      have hh := (w.val (e (Fin.natAdd (k+1) j))).isLt
      have hn : ¬ (w.val (e (Fin.natAdd (k+1) j))).val < m := by
        rw [w.property.2]
        rw [hv]
        change ¬ k+1+j.val < k+1
        omega
      change (w.val (e (Fin.natAdd (k+1) j))).val=m
      omega
    · intro i j hij
      exact w.property.1.1 (show e i ≤ e j from by
        change (e i).val ≤ (e j).val
        rwa [hv,hv])
    · intro i hi
      have hd : i.castLE hk∈D := by
        by_contra h
        exact hi ((mem_weakPrefixBoundaries D hk i).mpr h)
      have h1 : e (Fin.castAdd (n-k) i.castSucc)=(i.castLE hk).castSucc := Fin.ext rfl
      have h2 : e (Fin.castAdd (n-k) i.succ)=(i.castLE hk).succ := Fin.ext rfl
      change w.val (e (Fin.castAdd (n-k) i.castSucc)) < w.val (e (Fin.castAdd (n-k) i.succ))
      rw [h1,h2]
      exact w.property.1.2 _ hd
  · intro f
    have hmark (i : Fin (n+1)) : (f.val (e.symm i)).val < m ↔ i.val < k+1 := by
      by_cases h : i.val < k+1
      · let j : Fin (k+1) := ⟨i.val,h⟩
        have h' : e.symm i = Fin.castAdd (n-k) j := Fin.ext rfl
        exact ⟨fun _ => h,fun _ => h' ▸ f.property.1 j⟩
      · let j : Fin (n-k) := ⟨i.val-(k+1),by have hi := i.isLt; omega⟩
        have h' : e.symm i = Fin.natAdd (k+1) j := by
          apply Fin.ext
          rw [hr]
          change i.val=k+1+(i.val-(k+1))
          omega
        rw [h',f.property.2.1]
        simp [h]
    refine ⟨f.val ∘ e.symm,⟨?_,?_⟩,hmark⟩
    · intro i j hij
      exact f.property.2.2.1 (show e.symm i ≤ e.symm j from by
        change (e.symm i).val ≤ (e.symm j).val
        rwa [hr,hr])
    · intro i hi
      by_cases hi' : i.val < k
      · let j : Fin k := ⟨i.val,hi'⟩
        have hj : j.castLE hk=i := Fin.ext rfl
        have hn : j∉weakPrefixBoundaries D k hk := by
          rw [mem_weakPrefixBoundaries,hj]
          exact not_not_intro hi
        have e1 : e.symm i.castSucc=Fin.castAdd (n-k) j.castSucc := Fin.ext rfl
        have e2 : e.symm i.succ=Fin.castAdd (n-k) j.succ := Fin.ext rfl
        change f.val (e.symm i.castSucc) < f.val (e.symm i.succ)
        rw [e1,e2]
        exact f.property.2.2.2 j hn
      · have heq : i.val=k := by
          by_contra hne
          exact hc i (by omega) hi
        have ha : (f.val (e.symm i.castSucc)).val < m := (hmark _).mpr (by change i.val < k+1; omega)
        have hb : ¬ (f.val (e.symm i.succ)).val < m := fun h => by
          have h' := (hmark _).mp h
          change i.val+1 < k+1 at h'
          omega
        change (f.val (e.symm i.castSucc)).val < (f.val (e.symm i.succ)).val
        omega
  · intro w
    apply Subtype.ext
    funext i
    change w.val (e (e.symm i)) = _
    rw [e.apply_symm_apply]
  · intro f
    apply Subtype.ext
    funext i
    change f.val (e.symm (e i)) = _
    rw [e.symm_apply_apply]

end NovelliThibon
