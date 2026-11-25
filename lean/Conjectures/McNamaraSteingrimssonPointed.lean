module

public import Conjectures.McNamaraSteingrimssonNormalize

@[expose] public section
namespace McNamaraSteingrimsson

/-- Prepend the largest entry; all other entries retain their original values. -/
def pointedPermutation {n : ℕ} (p : Equiv.Perm (Fin n)) : Equiv.Perm (Fin (n+1)) where
  toFun i := Fin.cases (Fin.last n) (fun j => (p j).castSucc) i
  invFun i := Fin.lastCases 0 (fun j => (p.symm j).succ) i
  left_inv i := by
    refine Fin.cases ?_ (fun j => ?_) i <;> simp
  right_inv i := by
    refine Fin.lastCases (motive := fun k => Fin.cases (Fin.last n) (fun j => (p j).castSucc)
      (Fin.lastCases 0 (fun j => (p.symm j).succ) k)=k) ?_ (fun j => ?_) i <;> simp

@[simp] theorem pointed_zero {n : ℕ} (p : Equiv.Perm (Fin n)) :
    pointedPermutation p 0=Fin.last n := rfl

@[simp] theorem pointed_succ {n : ℕ} (p : Equiv.Perm (Fin n)) (j : Fin n) :
    pointedPermutation p j.succ=(p j).castSucc := rfl

theorem classicalPattern_trans {a b c : ℕ} {p : Equiv.Perm (Fin a)}
    {q : Equiv.Perm (Fin b)} {r : Equiv.Perm (Fin c)}
    (hpq : ClassicalPattern p q) (hqr : ClassicalPattern q r) :
    ClassicalPattern p r := by
  obtain ⟨f,hf,hp⟩ := hpq
  obtain ⟨g,hg,hq⟩ := hqr
  exact ⟨g ∘ f,hg.comp hf,fun i j => (hp i j).trans (hq (f i) (f j))⟩

theorem pointedPattern_lift {m n : ℕ} {p : Equiv.Perm (Fin m)} {q : Equiv.Perm (Fin n)}
    (h : ClassicalPattern p q) : ClassicalPattern (pointedPermutation p) (pointedPermutation q) := by
  obtain ⟨g,hmono,hord⟩ := h
  refine ⟨fun i => Fin.cases 0 (fun j => (g j).succ) i,?_,?_⟩
  · intro i j hij
    refine Fin.cases ?_ (fun a => ?_) i hij
    · intro hi
      refine Fin.cases ?_ (fun b _ => ?_) j hi
      · simp
      · simp
    · intro hi
      refine Fin.cases ?_ (fun b hab => ?_) j hi
      · simp
      · exact Fin.succ_lt_succ_iff.mpr (hmono (Fin.succ_lt_succ_iff.mp hab))
  · intro i j
    refine Fin.cases ?_ (fun a => ?_) i
    · refine Fin.cases ?_ (fun b => ?_) j
      · simp
      · simp only [Fin.cases_zero,Fin.cases_succ,pointed_zero,pointed_succ]
        have hm : ¬Fin.last m < (p b).castSucc :=
          not_lt_of_ge (Fin.le_last _)
        have hn : ¬Fin.last n < (q (g b)).castSucc :=
          not_lt_of_ge (Fin.le_last _)
        simp [hm,hn]
    · refine Fin.cases ?_ (fun b => ?_) j
      · simp
      · simpa using hord a b

/-- A selected pattern omitting the leading maximum already occurs in the tail. -/
theorem pointedPattern_omit {m n : ℕ} {p : Equiv.Perm (Fin m)}
    {q : Equiv.Perm (Fin n)} (f : Fin m→Fin (n+1)) (hf : StrictMono f)
    (hp : ∀ i j, p i<p j ↔ pointedPermutation q (f i)<pointedPermutation q (f j))
    (h0 : ∀ i, f i≠0) :
    ClassicalPattern p q := by
  refine ⟨fun i => (f i).pred (h0 i), ?_,?_⟩
  · intro i j hij
    exact Fin.succ_lt_succ_iff.mp (by simpa only [Fin.succ_pred] using hf hij)
  · intro i j
    have he := hp i j
    rw [← Fin.succ_pred (f i) (h0 i),← Fin.succ_pred (f j) (h0 j),
      pointed_succ,pointed_succ] at he
    simpa using he

/-- A pointed pattern using the leading maximum induces a tail occurrence. -/
theorem pointedPattern_project {m n : ℕ} {p : Equiv.Perm (Fin m)}
    {q : Equiv.Perm (Fin n)} (f : Fin (m+1)→Fin (n+1)) (hf : StrictMono f)
    (hp : ∀ i j, pointedPermutation p i<pointedPermutation p j ↔
      pointedPermutation q (f i)<pointedPermutation q (f j))
    (h0 : f 0=0) :
    ClassicalPattern p q := by
  have hpos (i : Fin m) : f i.succ≠0 := by
    have hi : (0:Fin (m+1)) < i.succ := Fin.pos_iff_ne_zero.mpr (Fin.succ_ne_zero i)
    have hi := hf hi
    rwa [h0,Fin.pos_iff_ne_zero] at hi
  refine ⟨fun i => (f i.succ).pred (hpos i),?_,?_⟩
  · intro i j hij
    have h := hf (Fin.succ_lt_succ_iff.mpr hij)
    exact Fin.succ_lt_succ_iff.mp (by simpa only [Fin.succ_pred] using h)
  · intro i j
    have h := hp i.succ j.succ
    rw [← Fin.succ_pred (f i.succ) (hpos i),← Fin.succ_pred (f j.succ) (hpos j)] at h
    simpa only [pointed_succ,Fin.castSucc_lt_castSucc_iff] using h

theorem pointedPattern_iff_tail_or_omit {m n : ℕ}
    (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    ClassicalPattern (pointedPermutation p) (pointedPermutation q) ↔
      ClassicalPattern p q ∨ ClassicalPattern (pointedPermutation p) q := by
  constructor
  · rintro ⟨f,hf,hp⟩
    by_cases h0 : f 0=0
    · exact Or.inl (pointedPattern_project f hf hp h0)
    · apply Or.inr
      apply pointedPattern_omit f hf hp
      intro i
      exact Fin.pos_iff_ne_zero.mp ((Fin.pos_iff_ne_zero.mpr h0).trans_le (hf.monotone (Fin.zero_le i)))
  · rintro (h|⟨f,hf,hp⟩)
    · exact pointedPattern_lift h
    · refine ⟨fun i => (f i).succ,fun _ _ hij => Fin.succ_lt_succ_iff.mpr (hf hij),?_⟩
      intro i j
      simpa only [pointed_succ,Fin.castSucc_lt_castSucc_iff] using hp i j


/-- Explicit 312 occurrence without any appeal to a permutation catalogue. -/
def Has312 {n : ℕ} (p : Equiv.Perm (Fin n)) : Prop :=
  ∃ i j k, i<j ∧ j<k ∧ p j<p k ∧ p k<p i

theorem Has312.of_pattern {m n : ℕ} {p : Equiv.Perm (Fin m)} {q : Equiv.Perm (Fin n)}
    (hp : Has312 p) (h : ClassicalPattern p q) : Has312 q := by
  obtain ⟨i,j,k,hij,hjk,hval,hmax⟩ := hp
  obtain ⟨f,hf,ho⟩ := h
  exact ⟨f i,f j,f k,hf hij,hf hjk,(ho j k).mp hval,(ho k i).mp hmax⟩

theorem layerPermutation_avoids312 (w : List Bool) : ¬Has312 (layerPermutation w) := by
  rintro ⟨i,j,k,hij,hjk,hvjk,hvki⟩
  let p := codeRank (@posCode w) (posCode_inj w)
  let v := codeRank (@valCode w) (valCode_inj w)
  let a := p.symm i
  let b := p.symm j
  let c := p.symm k
  have pU (x y : LayerPosition w) : p x<p y ↔ positionLT x y :=
    (codeRank_lt_iff _ _ _ _).trans (posCode_lt_iff _ _)
  have vU (x y : LayerPosition w) : v x<v y ↔ valueLT x y :=
    (codeRank_lt_iff _ _ _ _).trans (valCode_lt_iff _ _)
  have h₁ : positionLT a b := (pU _ _).mp (by simpa [a,b] using hij)
  have h₂ : positionLT b c := (pU _ _).mp (by simpa [b,c] using hjk)
  have h₃ : valueLT b c := (vU _ _).mp hvjk
  have h₄ : valueLT c a := (vU _ _).mp hvki
  have hbc : b.1<c.1 := by
    rcases h₂ with h|⟨_,h⟩
    · exact h
    rcases h₃ with h'|⟨_,h'⟩
    · exact h'
    · exact (lt_asymm h h').elim
  have hab : a.1≤b.1 := h₁.elim le_of_lt (fun h => le_of_eq h.1)
  have hca : c.1≤a.1 := h₄.elim le_of_lt (fun h => le_of_eq h.1)
  exact (not_lt_of_ge (hca.trans hab)) hbc

theorem pointedLayer_contains312 (w : List Bool) (hw : 2≤w.length) :
    Has312 (pointedPermutation (layerPermutation w)) := by
  let p := codeRank (@posCode w) (posCode_inj w)
  let v := codeRank (@valCode w) (valCode_inj w)
  let a := firstPosition w ⟨0,by omega⟩
  let b := firstPosition w ⟨1,by omega⟩
  have hp : p a < p b := by
    rw [codeRank_lt_iff,posCode_lt_iff]
    exact Or.inl (by change (0:ℕ) < 1; omega)
  have hv : v a < v b := by
    rw [codeRank_lt_iff,valCode_lt_iff]
    exact Or.inl (by change (0:ℕ) < 1; omega)
  refine ⟨0,(p a).succ,(p b).succ,Fin.pos_iff_ne_zero.mpr (Fin.succ_ne_zero _),
    Fin.succ_lt_succ_iff.mpr hp,?_,?_⟩
  · rw [pointed_succ,pointed_succ,Fin.castSucc_lt_castSucc_iff]
    change v (p.symm (p a))<v (p.symm (p b))
    simpa only [Equiv.symm_apply_apply] using hv
  · simpa only [pointed_succ,pointed_zero] using Fin.castSucc_lt_last (layerPermutation w (p b))

theorem pointedLayer_pattern_iff_subword {u v : List Bool} (hu : 2≤u.length) :
    ClassicalPattern (pointedPermutation (layerPermutation u))
      (pointedPermutation (layerPermutation v)) ↔ LayerSubword u v := by
  rw [pointedPattern_iff_tail_or_omit,layerPermutation_pattern_iff_subword]
  exact or_iff_left (fun h => layerPermutation_avoids312 v ((pointedLayer_contains312 u hu).of_pattern h))

end McNamaraSteingrimsson
