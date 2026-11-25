module

public import Conjectures.McNamaraSteingrimssonDirectSum

@[expose] public section
namespace McNamaraSteingrimsson

theorem castAdd_lt_natAdd {m n : ℕ} (i : Fin m) (j : Fin n) :
    Fin.castAdd n i < Fin.natAdd m j := by
  change i.val < m+j.val
  have h := i.isLt
  omega

theorem directSum_cases_injective {m n : ℕ} (p p' : Equiv.Perm (Fin m))
    (q q' : Equiv.Perm (Fin n)) :
    directSumPermutation p q = directSumPermutation p' q' ↔ p=p' ∧ q=q' := by
  constructor
  · intro h
    constructor
    · apply Equiv.ext
      intro i
      have he := congrFun (congrArg Equiv.toFun h) (Fin.castAdd n i)
      change directSumPermutation p q (Fin.castAdd n i) =
        directSumPermutation p' q' (Fin.castAdd n i) at he
      simp only [directSum_castAdd] at he
      exact Fin.ext (congrArg (fun z : Fin (m+n) => z.val) he)
    · apply Equiv.ext
      intro i
      have he := congrFun (congrArg Equiv.toFun h) (Fin.natAdd m i)
      change directSumPermutation p q (Fin.natAdd m i) =
        directSumPermutation p' q' (Fin.natAdd m i) at he
      simp only [directSum_natAdd] at he
      have hm := congrArg (fun z : Fin (m+n) => z.val) he
      change m+(q i).val=m+(q' i).val at hm
      exact Fin.ext (Nat.add_left_cancel hm)
  · rintro ⟨rfl,rfl⟩
    rfl

theorem classicalPattern_directSum {a b c d : ℕ} {p : Equiv.Perm (Fin a)} {q : Equiv.Perm (Fin b)}
    {r : Equiv.Perm (Fin c)} {s : Equiv.Perm (Fin d)}
    (hp : ClassicalPattern p q) (hr : ClassicalPattern r s) :
    ClassicalPattern (directSumPermutation p r) (directSumPermutation q s) := by
  obtain ⟨f,hf,hfo⟩ := hp
  obtain ⟨g,hg,hgo⟩ := hr
  let k : Fin (a+c)→Fin (b+d) :=
    fun i => Fin.addCases (motive := fun _ => Fin (b+d)) (fun i => Fin.castAdd d (f i))
      (fun j => Fin.natAdd b (g j)) i
  have hk₁ (i : Fin a) : k (Fin.castAdd c i)=Fin.castAdd d (f i) := by simp [k]
  have hk₂ (j : Fin c) : k (Fin.natAdd a j)=Fin.natAdd b (g j) := by simp [k]
  refine ⟨k,?_,?_⟩
  · intro i j hij
    refine Fin.addCases (motive := fun i => i<j → k i<k j) ?_ ?_ i hij
    · intro i hi
      refine Fin.addCases (motive := fun j => Fin.castAdd c i < j → k (Fin.castAdd c i) < k j) ?_ ?_ j hi
      · intro j hj
        rw [hk₁,hk₁]
        exact hf hj
      · intro j _
        rw [hk₁,hk₂]
        exact castAdd_lt_natAdd _ _
    · intro i hi
      refine Fin.addCases (motive := fun j => Fin.natAdd a i < j → k (Fin.natAdd a i) < k j) ?_ ?_ j hi
      · intro j hji
        exact (lt_asymm (castAdd_lt_natAdd j i) hji).elim
      · intro j hj
        rw [hk₂,hk₂]
        simp only [Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left] at hj ⊢
        exact hg hj
  · intro i j
    let P := directSumPermutation p r
    let Q := directSumPermutation q s
    have hL (i : Fin a) : Q (k (Fin.castAdd c i))=Fin.castAdd d (q (f i)) := by
      rw [hk₁,directSum_castAdd]
    have hR (j : Fin c) : Q (k (Fin.natAdd a j))=Fin.natAdd b (s (g j)) := by
      rw [hk₂,directSum_natAdd]
    change P i < P j ↔ Q (k i) < Q (k j)
    refine Fin.addCases (motive := fun i => P i < P j ↔ Q (k i) < Q (k j)) ?_ ?_ i
    · intro i
      refine Fin.addCases
        (motive := fun j => P (Fin.castAdd c i)<P j ↔ Q (k (Fin.castAdd c i))<Q (k j))
        ?_ ?_ j
      · intro j
        rw [hL,hL]
        rw [show P=directSumPermutation p r from rfl,directSum_castAdd,directSum_castAdd]
        exact hfo _ _
      · intro j
        rw [hL,hR]
        rw [show P=directSumPermutation p r from rfl,directSum_castAdd,directSum_natAdd]
        exact iff_of_true (castAdd_lt_natAdd _ _) (castAdd_lt_natAdd _ _)
    · intro i
      refine Fin.addCases
        (motive := fun j => P (Fin.natAdd a i)<P j ↔ Q (k (Fin.natAdd a i))<Q (k j))
        ?_ ?_ j
      · intro j
        rw [hR,hL]
        rw [show P=directSumPermutation p r from rfl,directSum_natAdd,directSum_castAdd]
        exact iff_of_false (not_lt_of_ge (castAdd_lt_natAdd _ _).le)
          (not_lt_of_ge (castAdd_lt_natAdd _ _).le)
      · intro j
        rw [hR,hR]
        rw [show P=directSumPermutation p r from rfl,directSum_natAdd,directSum_natAdd]
        simpa only [Fin.lt_def,Fin.val_natAdd,Nat.add_lt_add_iff_left] using hgo i j

end McNamaraSteingrimsson
