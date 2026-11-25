module

public import Conjectures.McNamaraSteingrimssonCuts

@[expose] public section
namespace McNamaraSteingrimsson

theorem sumCut_of_cross_values {m n : ℕ} (p : Equiv.Perm (Fin (m+n)))
    (h : ∀ i : Fin m, ∀ j : Fin n, p (Fin.castAdd n i) < p (Fin.natAdd m j)) :
    SumCut (m := m) p := by
  intro i
  let v := p (Fin.castAdd n i)
  have hv : v.val+1≤m+n := Nat.succ_le_of_lt v.isLt
  let preimage (x : Fin (v.val+1)) := p.symm (Fin.castLE hv x)
  have hpred (x : Fin (v.val+1)) : (preimage x).val<m := by
    by_contra! hx
    let r : Fin n := ⟨(preimage x).val-m,by have ht := (preimage x).isLt; omega⟩
    have hr : preimage x=Fin.natAdd m r := Fin.ext (by
      change (preimage x).val=m+((preimage x).val-m)
      omega)
    have hlt := h i r
    rw [← hr] at hlt
    change v < p (p.symm (Fin.castLE hv x)) at hlt
    rw [Equiv.apply_symm_apply] at hlt
    have hx := x.isLt
    change v.val < x.val at hlt
    omega
  let f : Fin (v.val+1)→Fin m := fun x => ⟨(preimage x).val,hpred x⟩
  have hf : Function.Injective f := by
    intro x y he
    apply Fin.castLE_injective hv
    apply p.symm.injective
    apply Fin.ext
    exact congrArg (fun k : Fin m => k.val) he
  have hc : v.val+1≤m := by
    simpa only [Fintype.card_fin] using Fintype.card_le_of_injective f hf
  exact Nat.lt_of_succ_le hc

/-- A pattern occurrence split by the host's direct-sum boundary induces
the corresponding direct-sum cut of the source pattern. -/
theorem pattern_embedding_cut {m n a b : ℕ}
    {p : Equiv.Perm (Fin (m+n))} {q : Equiv.Perm (Fin a)} {r : Equiv.Perm (Fin b)}
    (f : Fin (m+n)→Fin (a+b))
    (ho : ∀ i j, p i < p j ↔
      directSumPermutation q r (f i) < directSumPermutation q r (f j))
    (hl : ∀ i : Fin m, (f (Fin.castAdd n i)).val<a)
    (hr : ∀ j : Fin n, a≤(f (Fin.natAdd m j)).val) :
    SumCut (m := m) p := by
  apply sumCut_of_cross_values p
  intro i j
  let x : Fin a := ⟨(f (Fin.castAdd n i)).val,hl i⟩
  let y : Fin b := ⟨(f (Fin.natAdd m j)).val-a,by
    have hp := (f (Fin.natAdd m j)).isLt
    have hh := hr j
    omega⟩
  have hx : f (Fin.castAdd n i)=Fin.castAdd b x := Fin.ext rfl
  have hy : f (Fin.natAdd m j)=Fin.natAdd a y := Fin.ext (by
    change (f (Fin.natAdd m j)).val=a+((f (Fin.natAdd m j)).val-a)
    have h := hr j
    omega)
  apply (ho _ _).mpr
  rw [hx,hy,directSum_castAdd,directSum_natAdd]
  change (q x).val<a+(r y).val
  have h := (q x).isLt
  omega

/-- Any increasing sequence of selected positions crosses a fixed host
boundary at most once. Empty prefixes and tails are included. -/
theorem embedding_boundary_index {d h : ℕ} (f : Fin d→Fin h) (hf : StrictMono f) (a : ℕ) :
    ∃ k≤d, ∀ i : Fin d, (f i).val < a ↔ i.val < k := by
  classical
  let R := (Finset.univ : Finset (Fin d)).filter (fun i => a≤(f i).val)
  by_cases hr : R.Nonempty
  · let j := R.min' hr
    have hj : j∈R := Finset.min'_mem _ _
    have hR : a≤(f j).val := (Finset.mem_filter.mp hj).2
    refine ⟨j.val,j.isLt.le,?_⟩
    intro i
    constructor
    · intro hi
      by_contra! hn
      have H : j ≤ i := hn
      exact (not_lt_of_ge (hR.trans (hf.monotone H))) hi
    · intro hi
      by_contra! hn
      have hh : i ∈ R := Finset.mem_filter.mpr ⟨Finset.mem_univ _,hn⟩
      have H : j ≤ i := Finset.min'_le _ _ hh
      exact (not_lt_of_ge H) hi
  · refine ⟨d,le_rfl,?_⟩
    intro i
    refine iff_of_true ?_ i.isLt
    by_contra! hh
    exact hr ⟨i,Finset.mem_filter.mpr ⟨Finset.mem_univ _,hh⟩⟩

theorem pattern_embedding_factors {m n a b : ℕ}
    {p : Equiv.Perm (Fin (m+n))} {q : Equiv.Perm (Fin a)} {r : Equiv.Perm (Fin b)}
    (f : Fin (m+n)→Fin (a+b)) (hf : StrictMono f)
    (ho : ∀ i j, p i < p j ↔
      directSumPermutation q r (f i) < directSumPermutation q r (f j))
    (hl : ∀ i : Fin m, (f (Fin.castAdd n i)).val<a)
    (hr : ∀ j : Fin n, a≤(f (Fin.natAdd m j)).val) :
    ∃ (pL : Equiv.Perm (Fin m)) (pR : Equiv.Perm (Fin n)),
      directSumPermutation pL pR=p ∧ ClassicalPattern pL q ∧ ClassicalPattern pR r := by
  have hc := pattern_embedding_cut f ho hl hr
  let pL := leftOfCut p hc
  let pR := rightOfCut p hc
  have hp : directSumPermutation pL pR=p := directSum_cut_eq p hc
  refine ⟨pL,pR,hp,?_,?_⟩
  · let fL : Fin m→Fin a := fun i => ⟨(f (Fin.castAdd n i)).val,hl i⟩
    have he (i : Fin m) : f (Fin.castAdd n i)=Fin.castAdd b (fL i) := Fin.ext rfl
    refine ⟨fL,?_,?_⟩
    · intro i j hij
      exact hf (show Fin.castAdd n i < Fin.castAdd n j from hij)
    · intro i j
      have h := ho (Fin.castAdd n i) (Fin.castAdd n j)
      rw [he i,he j,directSum_castAdd,directSum_castAdd,← hp,
        directSum_castAdd,directSum_castAdd] at h
      exact h
  · let fR : Fin n→Fin b := fun j => ⟨(f (Fin.natAdd m j)).val-a,by
      have h := (f (Fin.natAdd m j)).isLt
      have h' := hr j
      omega⟩
    have he (j : Fin n) : f (Fin.natAdd m j)=Fin.natAdd a (fR j) := Fin.ext (by
      change (f (Fin.natAdd m j)).val=a+((f (Fin.natAdd m j)).val-a)
      have h := hr j
      omega)
    refine ⟨fR,?_,?_⟩
    · intro i j hij
      have hlo : Fin.natAdd m i < Fin.natAdd m j := by
        simpa only [Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left] using hij
      have hlt := hf hlo
      rw [he i,he j] at hlt
      simpa only [Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left] using hlt
    · intro i j
      have h := ho (Fin.natAdd m i) (Fin.natAdd m j)
      rw [he i,he j,directSum_natAdd,directSum_natAdd,← hp,
        directSum_natAdd,directSum_natAdd] at h
      simpa only [Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left] using h

end McNamaraSteingrimsson
