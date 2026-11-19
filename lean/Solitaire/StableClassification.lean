import Solitaire.StableConfiguration
import Solitaire.Recurrent
import Solitaire.StableBounds

namespace SolitaireGeneral

open LayerRule

theorem sequencePiles_eq_of_zero_tail (r : Nat → Nat) (N M : Nat)
    (hN : ∀ k, N ≤ k → r k=0) (hM : ∀ k, M ≤ k → r k=0) :
    sequencePiles r N=sequencePiles r M := by
  apply multiset_eq_of_moments _ _ (sequencePiles_positive _ _) (sequencePiles_positive _ _)
  intro g hg
  rw [moment_sequencePiles _ _ _ hg,moment_sequencePiles _ _ _ hg]
  have heN : (∑ k ∈ Finset.range N, g (r k))=
      ∑ k ∈ Finset.range (max N M), g (r k) := by
    apply Finset.sum_subset (Finset.range_mono (le_max_left N M))
    intro k _ hk
    rw [hN k (by simpa using hk),hg]
  have heM : (∑ k ∈ Finset.range M, g (r k))=
      ∑ k ∈ Finset.range (max N M), g (r k) := by
    apply Finset.sum_subset (Finset.range_mono (le_max_right N M))
    intro k _ hk
    rw [hM k (by simpa using hk),hg]
  exact heN.trans heM.symm

namespace LayerRule

/-- Every positive-pile fixed point is the stable profile indexed by its
new-pile size.  This proves exhaustion of actual stable configurations. -/
theorem fixed_eq_stableState (L : LayerRule) (s : Multiset Nat)
    (hs : ∀ j ∈ s, 0 < j) (hfixed : L.move s=s) :
    s=L.stableState (L.birthSize s) := by
  let C := L.orbitCycle s hs 1 (by simpa using hfixed)
  have hstate : ∀ t : ZMod 1, C.piles t=s := by
    intro t
    have ht : t=0 := Subsingleton.elim _ _
    rw [ht]
    exact L.orbitCycle_zero s hs 1 _
  have hbirth : ∀ t : ZMod 1, C.birth t=L.birthSize s := by
    intro t
    change L.birthSize (C.piles (t-1))=L.birthSize s
    rw [hstate]
  have hage : C.age 0=L.stablePile (L.birthSize s) := by
    funext k
    unfold Cycle.age
    rw [hbirth]
  have hseq : s=sequencePiles (L.stablePile (L.birthSize s)) s.sum := by
    have hh := C.piles_eq_ages 0
    rw [hstate,hage] at hh
    exact hh
  apply hseq.trans
  exact sequencePiles_eq_of_zero_tail _ _ _
    (fun k hk => L.stablePile_eq_zero _ k ((L.birthSize_le s).trans hk))
    (fun k hk => L.stablePile_eq_zero _ k (by omega))

theorem fixed_iff_stableState (L : LayerRule) (s : Multiset Nat)
    (hs : ∀ j ∈ s, 0 < j) :
    L.move s=s ↔ ∃ j, s=L.stableState j := by
  constructor
  · intro h
    exact ⟨L.birthSize s,L.fixed_eq_stableState s hs h⟩
  · rintro ⟨j,rfl⟩
    exact L.stableState_fixed j

theorem fixed_columns (L : LayerRule) (s : Multiset Nat)
    (hs : ∀ j ∈ s, 0 < j) (hfixed : L.move s=s) :
    columns s=L.stablePile (L.birthSize s) := by
  have h := L.fixed_eq_stableState s hs hfixed
  calc
    columns s=columns (L.stableState (L.birthSize s)) := congrArg columns h
    _ = _ := L.stableState_columns _

/-- The chosen reference has maximal mass among all actual stable states
whose mass is at most `n`. -/
theorem fixed_mass_le_reference (L : LayerRule) (n : Nat) (s : Multiset Nat)
    (hs : ∀ j ∈ s, 0 < j) (hfixed : L.move s=s) (hmass : s.sum ≤ n) :
    s.sum ≤ L.stableMass (L.referenceIndex n) := by
  have he := congrArg Multiset.sum (L.fixed_eq_stableState s hs hfixed)
  rw [L.stableState_mass] at he
  have hj := L.referenceIndex_maximal n (L.birthSize s) (by omega)
  rw [he]
  exact L.stableMass_monotone hj

theorem referenceState_maximal (L : LayerRule) (n : Nat) :
    L.move (L.stableState (L.referenceIndex n))=L.stableState (L.referenceIndex n) ∧
      (L.stableState (L.referenceIndex n)).sum ≤ n ∧
      ∀ s : Multiset Nat, (∀ j ∈ s, 0 < j) → L.move s=s → s.sum ≤ n →
        s.sum ≤ (L.stableState (L.referenceIndex n)).sum := by
  refine ⟨L.stableState_fixed _,?_,?_⟩
  · rw [L.stableState_mass]
    exact (L.reference_spec n).1
  · intro s hs hfixed hmass
    rw [L.stableState_mass]
    exact L.fixed_mass_le_reference n s hs hfixed hmass

end LayerRule
end SolitaireGeneral
