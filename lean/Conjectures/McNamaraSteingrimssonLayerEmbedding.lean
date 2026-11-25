module

public import Conjectures.McNamaraSteingrimssonSubwords
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Order.Fin.Basic
public import Mathlib.Data.Fintype.Sigma

@[expose] public section
namespace McNamaraSteingrimsson

def sizedAt (w : List Bool) (i : Fin w.length) : ℕ := layerSize w[i]

theorem sizedAt_pos (w : List Bool) (i : Fin w.length) : 0<sizedAt w i := by
  simp [sizedAt,layerSize]
  split <;> decide

def IndexMatching (u v : List Bool) : Prop :=
  ∃ g : Fin u.length → Fin v.length, StrictMono g ∧ ∀ i, sizedAt u i≤sizedAt v (g i)

theorem indexMatching_of_subword {u v : List Bool} (h : LayerSubword u v) :
    IndexMatching u v := by
  induction h with
  | nil => exact ⟨fun i => i.elim0,fun i => i.elim0,fun i => i.elim0⟩
  | cons hfit _ ih =>
    obtain ⟨g,hg,hsize⟩ := ih
    refine ⟨fun i => Fin.cases 0 (fun j => (g j).succ) i,?_,?_⟩
    · intro i j hij
      refine Fin.cases ?_ (fun i' => ?_) i hij
      · intro hij
        refine Fin.cases ?_ (fun j' _ => ?_) j hij
        · simp
        · simp
      · intro hij
        refine Fin.cases ?_ (fun j' hj' => ?_) j hij
        · simp
        · exact Fin.succ_lt_succ_iff.mpr (hg (Fin.succ_lt_succ_iff.mp hj'))
    · intro i
      refine Fin.cases ?_ (fun j => ?_) i
      · exact hfit
      · exact hsize j
  | cons_right _ ih =>
    obtain ⟨g,hg,hs⟩ := ih
    exact ⟨fun i => (g i).succ,fun _ _ h => Fin.succ_lt_succ_iff.mpr (hg h),hs⟩

theorem subword_of_indexMatching {u v : List Bool} (h : IndexMatching u v) :
    LayerSubword u v := by
  induction v generalizing u with
  | nil =>
    cases u with
    | nil => exact .nil
    | cons a u =>
      obtain ⟨g,_,_⟩ := h
      exact (g 0).elim0
  | cons b v ih =>
    cases u with
    | nil => exact .nil
    | cons a u =>
      obtain ⟨g,hg,hs⟩ := h
      by_cases h0 : g 0=0
      · have hn (i : Fin u.length) : g i.succ≠0 := by
          have hp := hg (show (0 : Fin (a::u).length) < i.succ from Fin.pos_iff_ne_zero.mpr (Fin.succ_ne_zero i))
          rwa [h0,Fin.pos_iff_ne_zero] at hp
        apply List.SublistForall₂.cons
        · have hf := hs 0
          rwa [h0] at hf
        apply ih
        refine ⟨fun i => (g i.succ).pred (hn i),?_,?_⟩
        · intro i j hij
          have hlt := hg (Fin.succ_lt_succ_iff.mpr hij)
          exact (Fin.succ_lt_succ_iff.mp (by simpa only [Fin.succ_pred] using hlt))
        · intro i
          have hsi := hs i.succ
          have he := Fin.succ_pred (g i.succ) (hn i)
          rw [← he] at hsi
          exact hsi
      · have hn (i : Fin (a::u).length) : g i≠0 := by
          have hp : g 0≤g i := hg.monotone (Fin.zero_le _)
          exact Fin.pos_iff_ne_zero.mp ((Fin.pos_iff_ne_zero.mpr h0).trans_le hp)
        apply List.SublistForall₂.cons_right
        apply ih
        refine ⟨fun i => (g i).pred (hn i),?_,?_⟩
        · intro i j hij
          exact Fin.succ_lt_succ_iff.mp (by simpa only [Fin.succ_pred] using hg hij)
        · intro i
          have hsi := hs i
          have he := Fin.succ_pred (g i) (hn i)
          rw [← he] at hsi
          exact hsi

theorem indexMatching_iff_subword {u v : List Bool} :
    IndexMatching u v ↔ LayerSubword u v :=
  ⟨subword_of_indexMatching,indexMatching_of_subword⟩

/-- Positions in the literal direct sum of decreasing layers. The first
coordinate is the block, and the second coordinate is the position in it. -/
abbrev LayerPosition (v : List Bool) := Σ i : Fin v.length, Fin (sizedAt v i)

def positionLT {v : List Bool} (p q : LayerPosition v) : Prop :=
  p.1<q.1 ∨ p.1=q.1 ∧ p.2.val<q.2.val

def valueLT {v : List Bool} (p q : LayerPosition v) : Prop :=
  p.1<q.1 ∨ p.1=q.1 ∧ q.2.val<p.2.val

def LayerPattern (u v : List Bool) : Prop :=
  ∃ f : LayerPosition u → LayerPosition v,
    Function.Injective f ∧
    (∀ a b, positionLT a b ↔ positionLT (f a) (f b)) ∧
    ∀ a b, valueLT a b ↔ valueLT (f a) (f b)

theorem layerPattern_of_indexMatching {u v : List Bool} (h : IndexMatching u v) :
    LayerPattern u v := by
  obtain ⟨g,hg,hs⟩ := h
  let f : LayerPosition u → LayerPosition v :=
    fun ⟨i,j⟩ => ⟨g i,Fin.castLE (hs i) j⟩
  refine ⟨f,?_,?_,?_⟩
  · rintro ⟨i,j⟩ ⟨i',j'⟩ h
    have hi : i=i' := hg.injective (congrArg Sigma.fst h)
    subst i'
    congr
    apply Fin.ext
    have hv : (f ⟨i,j⟩).2.val=(f ⟨i,j'⟩).2.val :=
      congrArg (fun q : LayerPosition v => q.2.val) h
    exact hv
  · rintro ⟨i,j⟩ ⟨i',j'⟩
    simp [f,positionLT,hg.lt_iff_lt,hg.injective.eq_iff]
  · rintro ⟨i,j⟩ ⟨i',j'⟩
    simp [f,valueLT,hg.lt_iff_lt,hg.injective.eq_iff]

def firstPosition (v : List Bool) (i : Fin v.length) : LayerPosition v :=
  ⟨i,⟨0,sizedAt_pos v i⟩⟩

theorem indexMatching_of_layerPattern {u v : List Bool} (h : LayerPattern u v) :
    IndexMatching u v := by
  obtain ⟨f,_,hp,hv⟩ := h
  let g : Fin u.length → Fin v.length := fun i => (f (firstPosition u i)).1
  have hsink (i : Fin u.length) (j : Fin (sizedAt u i)) : (f ⟨i,j⟩).1=g i := by
    by_cases h0 : j.val=0
    · have h' : j=(firstPosition u i).2 := Fin.ext h0
      subst j
      rfl
    · have hj : 0<j.val := Nat.pos_of_ne_zero h0
      have hP : positionLT (firstPosition u i) ⟨i,j⟩ := Or.inr ⟨rfl,hj⟩
      have hV : ¬valueLT (firstPosition u i) ⟨i,j⟩ := by
        simp [firstPosition,valueLT]
      rcases (hp _ _).mp hP with hlt|heq
      · exact (hV ((hv _ _).mpr (Or.inl hlt))).elim
      · exact heq.1.symm
  refine ⟨g,?_,?_⟩
  · intro i j hi
    have hP := (hp (firstPosition u i) (firstPosition u j)).mp (Or.inl hi)
    have hV := (hv (firstPosition u i) (firstPosition u j)).mp (Or.inl hi)
    rcases hP with hlt|⟨he,hp'⟩
    · exact hlt
    rcases hV with hlt|⟨_,hv'⟩
    · exact hlt
    · exact (lt_asymm hp' hv').elim
  · intro i
    let q : Fin (sizedAt u i) → Fin (sizedAt v (g i)) := fun j =>
      ⟨(f ⟨i,j⟩).2.val,by
        rw [← hsink i j]
        exact (f ⟨i,j⟩).2.isLt⟩
    have hq : StrictMono q := by
      intro j k hjk
      have hh := (hp ⟨i,j⟩ ⟨i,k⟩).mp (Or.inr ⟨rfl,hjk⟩)
      rcases hh with hlt|⟨_,hlt⟩
      · rw [hsink i j,hsink i k] at hlt
        exact (lt_irrefl _ hlt).elim
      · exact hlt
    simpa only [Fintype.card_fin] using Fintype.card_le_of_injective q hq.injective

theorem layerPattern_iff_subword {u v : List Bool} :
    LayerPattern u v ↔ LayerSubword u v := by
  rw [← indexMatching_iff_subword]
  exact ⟨indexMatching_of_layerPattern,layerPattern_of_indexMatching⟩

end McNamaraSteingrimsson
