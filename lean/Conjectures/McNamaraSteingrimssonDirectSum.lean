module

public import Conjectures.McNamaraSteingrimssonPointed
public import Mathlib.Logic.Equiv.Fin.Basic

@[expose] public section
namespace McNamaraSteingrimsson

def directSumPermutation {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    Equiv.Perm (Fin (m+n)) :=
  finSumFinEquiv.symm.trans ((Equiv.sumCongr p q).trans finSumFinEquiv)

@[simp] theorem directSum_castAdd {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n))
    (i : Fin m) :
    directSumPermutation p q (Fin.castAdd n i)=Fin.castAdd n (p i) := by
  simp [directSumPermutation]

@[simp] theorem directSum_natAdd {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n))
    (i : Fin n) :
    directSumPermutation p q (Fin.natAdd m i)=Fin.natAdd m (q i) := by
  simp [directSumPermutation]

theorem occurrence_in_left {l m n : ℕ} {p : Equiv.Perm (Fin l)}
    {q : Equiv.Perm (Fin m)} {r : Equiv.Perm (Fin n)} :
    ClassicalPattern p q → ClassicalPattern p (directSumPermutation q r) := by
  rintro ⟨f,hf,ho⟩
  refine ⟨fun i => Fin.castAdd n (f i),fun _ _ h => hf h,?_⟩
  intro i j
  simpa only [directSum_castAdd,Fin.lt_def,Fin.val_castAdd] using ho i j

theorem occurrence_in_right {l m n : ℕ} {p : Equiv.Perm (Fin l)}
    {q : Equiv.Perm (Fin m)} {r : Equiv.Perm (Fin n)} :
    ClassicalPattern p r → ClassicalPattern p (directSumPermutation q r) := by
  rintro ⟨f,hf,ho⟩
  refine ⟨fun i => Fin.natAdd m (f i),?_,?_⟩
  · intro i j hij
    have h := hf hij
    change m+(f i).val<m+(f j).val
    exact Nat.add_lt_add_left h _
  · intro i j
    simp only [directSum_natAdd,Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left]
    exact ho i j

private theorem occurrence_project_left {l m n : ℕ} {p : Equiv.Perm (Fin l)}
    {q : Equiv.Perm (Fin m)} {r : Equiv.Perm (Fin n)} (f : Fin l→Fin (m+n))
    (hf : StrictMono f) (ho : ∀ i j, p i<p j ↔
      directSumPermutation q r (f i)<directSumPermutation q r (f j))
    (h : ∀ i, (f i).val<m) :
    ClassicalPattern p q := by
  let g : Fin l→Fin m := fun i => ⟨(f i).val,h i⟩
  have he (i : Fin l) : f i=Fin.castAdd n (g i) := Fin.ext rfl
  refine ⟨g,fun _ _ hij => hf hij,?_⟩
  intro i j
  have hij := ho i j
  rw [he i,he j,directSum_castAdd,directSum_castAdd] at hij
  exact hij

private theorem occurrence_project_right {l m n : ℕ} {p : Equiv.Perm (Fin l)}
    {q : Equiv.Perm (Fin m)} {r : Equiv.Perm (Fin n)} (f : Fin l→Fin (m+n))
    (hf : StrictMono f) (ho : ∀ i j, p i<p j ↔
      directSumPermutation q r (f i)<directSumPermutation q r (f j))
    (h : ∀ i, m≤(f i).val) :
    ClassicalPattern p r := by
  let g : Fin l→Fin n := fun i => ⟨(f i).val-m,by have hp := (f i).isLt; have hhi := h i; omega⟩
  have he (i : Fin l) : f i=Fin.natAdd m (g i) := Fin.ext (by
    change (f i).val=m+((f i).val-m)
    have hhi := h i
    omega)
  refine ⟨g,?_,?_⟩
  · intro i j hij
    have hf' := hf hij
    rw [he i,he j] at hf'
    simpa only [Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left] using hf'
  · intro i j
    have hij := ho i j
    rw [he i,he j,directSum_natAdd,directSum_natAdd] at hij
    simpa only [Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left] using hij

theorem pointedPattern_in_directSum_iff {l m n : ℕ} {p : Equiv.Perm (Fin l)}
    {q : Equiv.Perm (Fin m)} {r : Equiv.Perm (Fin n)} :
    ClassicalPattern (pointedPermutation p) (directSumPermutation q r) ↔
      ClassicalPattern (pointedPermutation p) q ∨ ClassicalPattern (pointedPermutation p) r := by
  constructor
  · rintro ⟨f,hf,ho⟩
    by_cases h0 : (f 0).val<m
    · apply Or.inl
      refine occurrence_project_left f hf ho ?_
      intro i
      by_contra! hi
      let a : Fin m := ⟨(f 0).val,h0⟩
      let b : Fin n := ⟨(f i).val-m,by have hp := (f i).isLt; omega⟩
      have ha : f 0=Fin.castAdd n a := Fin.ext rfl
      have hb : f i=Fin.natAdd m b := Fin.ext (by
        change (f i).val=m+((f i).val-m)
        omega)
      have hlt := ho 0 i
      rw [ha,hb,directSum_castAdd,directSum_natAdd,pointed_zero] at hlt
      have hc : Fin.castAdd n (q a)<Fin.natAdd m (r b) := by
        change (q a).val<m+(r b).val
        have hp := (q a).isLt
        omega
      exact (not_lt_of_ge (Fin.le_last _)) (hlt.mpr hc)
    · apply Or.inr
      refine occurrence_project_right f hf ho ?_
      intro i
      exact (Nat.le_of_not_gt h0).trans (hf.monotone (Fin.zero_le i))
  · rintro (h|h)
    · exact occurrence_in_left h
    · exact occurrence_in_right h

end McNamaraSteingrimsson
