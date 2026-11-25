module

public import Conjectures.McNamaraSteingrimssonDirectSum

@[expose] public section
namespace McNamaraSteingrimsson

/-- A cut at m means the first m positions carry exactly the lower values.
Injectivity and the equal cardinalities provide the reverse inclusion. -/
def SumCut {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) : Prop :=
  ∀ i : Fin m, (p (Fin.castAdd n i)).val<m

theorem directSum_is_cut {m n : ℕ} (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    SumCut (m := m) (n := n) (directSumPermutation p q) := by
  intro i
  rw [directSum_castAdd]
  exact (p i).isLt

def leftOfCutFun {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p) :
    Fin m→Fin m := fun i => ⟨(p (Fin.castAdd n i)).val,h i⟩

theorem leftOfCutFun_inj {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p) :
    Function.Injective (leftOfCutFun p h) := by
  intro i j hi
  have hh : p (Fin.castAdd n i)=p (Fin.castAdd n j) :=
    Fin.ext (congrArg (fun k : Fin m => k.val) hi)
  exact Fin.ext (congrArg (fun k : Fin (m+n) => k.val) (p.injective hh))

noncomputable def leftOfCut {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p) :
    Equiv.Perm (Fin m) :=
  Equiv.ofBijective (leftOfCutFun p h)
    ⟨leftOfCutFun_inj p h, Finite.surjective_of_injective (leftOfCutFun_inj p h)⟩

theorem rightOfCut_ge {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p)
    (i : Fin n) : m≤(p (Fin.natAdd m i)).val := by
  by_contra! hi
  obtain ⟨j,hj⟩ := (leftOfCut p h).surjective ⟨(p (Fin.natAdd m i)).val,hi⟩
  have hj' : p (Fin.castAdd n j)=p (Fin.natAdd m i) := Fin.ext (congrArg (fun k : Fin m => k.val) hj)
  have he := congrArg Fin.val (p.injective hj')
  have hjlt := j.isLt
  change j.val=m+i.val at he
  omega

def rightOfCutFun {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p) :
    Fin n→Fin n := fun i => ⟨(p (Fin.natAdd m i)).val-m,by
      have hhi := (p (Fin.natAdd m i)).isLt
      have hge := rightOfCut_ge p h i
      omega⟩

theorem rightOfCutFun_inj {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p) :
    Function.Injective (rightOfCutFun p h) := by
  intro i j he
  have hi := rightOfCut_ge p h i
  have hj := rightOfCut_ge p h j
  have he' := congrArg Fin.val he
  change (p (Fin.natAdd m i)).val-m=(p (Fin.natAdd m j)).val-m at he'
  have hp : p (Fin.natAdd m i)=p (Fin.natAdd m j) := Fin.ext (by omega)
  have h₂ := congrArg Fin.val (p.injective hp)
  change m+i.val=m+j.val at h₂
  exact Fin.ext (by omega)

noncomputable def rightOfCut {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p) :
    Equiv.Perm (Fin n) :=
  Equiv.ofBijective (rightOfCutFun p h)
    ⟨rightOfCutFun_inj p h,Finite.surjective_of_injective (rightOfCutFun_inj p h)⟩

/-- The two summands of a cut are recovered from the literal permutation. -/
theorem directSum_cut_eq {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) (h : SumCut (m := m) p) :
    directSumPermutation (leftOfCut p h) (rightOfCut p h)=p := by
  apply Equiv.ext
  intro j
  refine Fin.addCases (motive := fun i => directSumPermutation (leftOfCut p h) (rightOfCut p h) i = p i) ?_ ?_ j
  · intro i
    rw [directSum_castAdd]
    exact Fin.ext rfl
  · intro i
    rw [directSum_natAdd]
    apply Fin.ext
    change m+((p (Fin.natAdd m i)).val-m)=(p (Fin.natAdd m i)).val
    have hge := rightOfCut_ge p h i
    omega

theorem cut_iff_exists_directSum {m n : ℕ} (p : Equiv.Perm (Fin (m+n))) :
    SumCut (m := m) p ↔ ∃ (q : Equiv.Perm (Fin m)) (r : Equiv.Perm (Fin n)),
      directSumPermutation q r=p := by
  constructor
  · exact fun h => ⟨leftOfCut p h,rightOfCut p h,directSum_cut_eq p h⟩
  · rintro ⟨q,r,rfl⟩
    exact directSum_is_cut q r

end McNamaraSteingrimsson
