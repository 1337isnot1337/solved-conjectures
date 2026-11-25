module

public import Conjectures.McNamaraSteingrimssonPrefixFamilies

@[expose] public section
namespace McNamaraSteingrimsson

/-- A numerical sum cut of a standard permutation, including the
two trivial cuts. -/
def CanonicalCut {d : ℕ} (p : Equiv.Perm (Fin d)) (k : ℕ) : Prop :=
  k≤d ∧ ∀ i : Fin d, i.val<k → (p i).val<k

theorem canonicalCut_first_maximum {d : ℕ} {p : Equiv.Perm (Fin d)}
    (hp : BeginsWithMaximum p) {k : ℕ} (hk : CanonicalCut p k) :
    k=0 ∨ k=d := by
  by_cases hz : k=0
  · exact Or.inl hz
  right
  have h0 : 0<d := (Nat.pos_of_ne_zero hz).trans_le hk.1
  let i : Fin d := ⟨0,h0⟩
  have hc := hk.2 i (Nat.pos_of_ne_zero hz)
  have hm := hp i rfl
  have hd := hk.1
  omega

theorem canonicalCut_directSum_left {m n k : ℕ}
    (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) (hk : k≤m) :
    CanonicalCut (directSumPermutation p q) k ↔ CanonicalCut p k := by
  constructor
  · intro h
    refine ⟨hk,fun i hi => ?_⟩
    have hx := h.2 (Fin.castAdd n i) hi
    rwa [directSum_castAdd] at hx
  · intro h
    refine ⟨hk.trans (Nat.le_add_right _ _),?_⟩
    intro i hi
    let j : Fin m := ⟨i.val,hi.trans_le hk⟩
    have hi' : i=Fin.castAdd n j := Fin.ext rfl
    rw [hi',directSum_castAdd]
    exact h.2 j hi

theorem canonicalCut_directSum_right {m n k : ℕ}
    (p : Equiv.Perm (Fin m)) (q : Equiv.Perm (Fin n)) :
    CanonicalCut (directSumPermutation p q) (m+k) ↔ CanonicalCut q k := by
  constructor
  · intro h
    refine ⟨Nat.le_of_add_le_add_left h.1,fun i hi => ?_⟩
    have he : (Fin.natAdd m i).val < m+k := Nat.add_lt_add_left hi _
    have hx := h.2 (Fin.natAdd m i) he
    rw [directSum_natAdd] at hx
    exact Nat.lt_of_add_lt_add_left hx
  · intro h
    refine ⟨Nat.add_le_add_left h.1 _,?_⟩
    intro i
    refine Fin.addCases (motive := fun j => j.val<m+k →
      (directSumPermutation p q j).val<m+k) ?_ ?_ i
    · intro j _
      rw [directSum_castAdd]
      exact (p j).isLt.trans_le (Nat.le_add_right _ _)
    · intro j hj
      rw [directSum_natAdd]
      change m+(q j).val<m+k
      exact Nat.add_lt_add_left (h.2 j (Nat.lt_of_add_lt_add_left hj)) _

end McNamaraSteingrimsson
