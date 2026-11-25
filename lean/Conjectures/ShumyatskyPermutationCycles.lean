module

public import Conjectures.ShumyatskyCyclicTransport
public import Mathlib.GroupTheory.Perm.Cycle.Basic
public import Mathlib.Logic.Equiv.Sum

/-! Index every actual permutation cycle by a finite interval.
The initial vertex can be chosen freely, so the edge entering it
can serve as the reserved return edge. Fixed points are length-one
cycles. -/

@[expose] public section

namespace Shumyatsky

variable {ι : Type*}

/-- The cycles of a permutation, including its fixed points. -/
def PermutationCycle (σ : Equiv.Perm ι) : Type _ :=
  Quotient (Equiv.Perm.SameCycle.setoid σ)

def cycleOfVertex (σ : Equiv.Perm ι) (i : ι) : PermutationCycle σ :=
  Quotient.mk _ i

theorem cycleOfVertex_pow (σ : Equiv.Perm ι) (n : ℕ) (i : ι) :
    cycleOfVertex σ ((σ ^ n) i) = cycleOfVertex σ i := by
  symm
  apply Quotient.sound
  exact ⟨(n : ℤ), by rw [zpow_natCast]⟩

theorem cycleOfVertex_apply (σ : Equiv.Perm ι) (i : ι) :
    cycleOfVertex σ (σ i) = cycleOfVertex σ i := by
  simpa using cycleOfVertex_pow σ 1 i

/-- Any choice of one starting vertex per cycle gives an indexed
    partition that intertwines the permutation with cyclic successor. -/
theorem exists_indexed_permutation_cycles [Finite ι] (σ : Equiv.Perm ι)
    (start : ∀ c : PermutationCycle σ, {i : ι // cycleOfVertex σ i = c}) :
    ∃ (size : PermutationCycle σ → ℕ)
      (index : ι ≃ Σ c, Fin (size c)),
      (∀ c, 0 < size c) ∧
        (∀ c (j : Fin (size c)), index.symm ⟨c, j⟩ = (σ ^ j.val) (start c).val) ∧
        (∀ i, index (σ i) = ⟨(index i).1, cycleNext (index i).2⟩) := by
  classical
  let _ := Fintype.ofFinite ι
  let pts (c : PermutationCycle σ) := Finset.univ.filter (fun i => cycleOfVertex σ i = c)
  have hMem {c : PermutationCycle σ} {i : ι} : i ∈ pts c ↔ cycleOfVertex σ i = c := by
    simp [pts]
  have hCycle (c : PermutationCycle σ) : σ.IsCycleOn (pts c : Set ι) := by
    constructor
    · refine ⟨?_, σ.injective.injOn, ?_⟩
      · intro i hi
        exact hMem.mpr ((cycleOfVertex_apply σ i).trans (hMem.mp hi))
      · intro i hi
        refine ⟨σ.symm i, hMem.mpr ?_, σ.apply_symm_apply i⟩
        have h := cycleOfVertex_apply σ (σ.symm i)
        rw [σ.apply_symm_apply] at h
        exact h.symm.trans (hMem.mp hi)
    · intro i hi j hj
      exact Quotient.exact ((hMem.mp hi).trans (hMem.mp hj).symm)
  have hStart (c : PermutationCycle σ) : (start c).val ∈ pts c := hMem.mpr (start c).property
  let eval (c : PermutationCycle σ) (j : Fin (pts c).card) :
      {i : ι // cycleOfVertex σ i = c} :=
    ⟨(σ ^ j.val) (start c).val, (cycleOfVertex_pow σ j.val _).trans (start c).property⟩
  have hBij (c : PermutationCycle σ) : Function.Bijective (eval c) := by
    constructor
    · intro j k h
      apply Fin.ext
      exact (hCycle c).injOn_pow_apply (hStart c) j.isLt k.isLt (congrArg Subtype.val h)
    · intro i
      obtain ⟨j, hj, he⟩ := (hCycle c).exists_pow_eq (hStart c) (hMem.mpr i.property)
      exact ⟨⟨j, hj⟩, Subtype.ext he⟩
  let coord := (Equiv.sigmaCongrRight fun c => Equiv.ofBijective (eval c) (hBij c)).trans
    (Equiv.sigmaFiberEquiv (cycleOfVertex σ))
  have hEval (c : PermutationCycle σ) (j : Fin (pts c).card) :
      coord ⟨c, j⟩ = (σ ^ j.val) (start c).val := rfl
  have hNext (c : PermutationCycle σ) (j : Fin (pts c).card) :
      σ (coord ⟨c, j⟩) = coord ⟨c, cycleNext j⟩ := by
    rw [hEval, hEval, ← Equiv.Perm.mul_apply, ← pow_succ']
    by_cases hj : j.val + 1 < (pts c).card
    · simp [cycleNext, hj]
    · have hlast : j.val + 1 = (pts c).card :=
        Nat.le_antisymm j.isLt (Nat.le_of_not_gt hj)
      rw [hlast, (hCycle c).pow_card_apply (hStart c)]
      simp [cycleNext, hj]
  refine ⟨fun c => (pts c).card, coord.symm, fun c => Finset.card_pos.mpr ⟨_, hStart c⟩,
    hEval, ?_⟩
  intro i
  apply coord.injective
  rw [coord.apply_symm_apply]
  have h := hNext (coord.symm i).1 (coord.symm i).2
  simpa using h

end Shumyatsky
