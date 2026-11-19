import Solitaire.Columns

namespace SolitaireGeneral

open LayerRule

theorem moment_sequencePiles (r : Nat → Nat) (N : Nat) (g : Nat → Nat) (hg : g 0=0) :
    moment (sequencePiles r N) g=∑ k ∈ Finset.range N, g (r k) := by
  rw [sequencePiles,moment_filter_positive _ _ hg]
  simp only [moment,Multiset.map_map,Function.comp_def]
  rfl

theorem sequencePiles_positive (r : Nat → Nat) (N : Nat) :
    ∀ j ∈ sequencePiles r N, 0 < j := by
  intro j hj
  exact (Multiset.mem_filter.mp hj).2

theorem multiset_eq_of_moments (s t : Multiset Nat)
    (hs : ∀ j ∈ s, 0 < j) (ht : ∀ j ∈ t, 0 < j)
    (h : ∀ g : Nat → Nat, g 0=0 → moment s g=moment t g) : s=t := by
  apply Multiset.ext.mpr
  intro q
  by_cases hq : q=0
  · subst q
    have hs0 : 0 ∉ s := by intro hz; have hh := hs 0 hz; omega
    have ht0 : 0 ∉ t := by intro hz; have hh := ht 0 hz; omega
    simp [hs0,ht0]
  · rw [← moment_indicator,← moment_indicator]
    apply h
    simp [Ne.symm hq]

theorem sum_shift (h : Nat → Nat) (N : Nat) :
    h 0+(∑ k ∈ Finset.range N, h (k+1))=(∑ k ∈ Finset.range N, h k)+h N := by
  induction N with
  | zero => simp
  | succ N ih =>
    rw [Finset.sum_range_succ,Finset.sum_range_succ]
    omega

namespace LayerRule

def stableState (L : LayerRule) (j : Nat) : Multiset Nat :=
  sequencePiles (L.stablePile j) (j+1)

theorem stableState_positive (L : LayerRule) (j : Nat) :
    ∀ q ∈ L.stableState j, 0 < q := sequencePiles_positive _ _

theorem stableState_mass (L : LayerRule) (j : Nat) :
    (L.stableState j).sum=L.stableMass j := by
  have h := moment_sequencePiles (L.stablePile j) (j+1) id rfl
  simpa [stableState,moment,stableMass] using h

theorem stableState_columns (L : LayerRule) (j : Nat) :
    columns (L.stableState j)=L.stablePile j := by
  funext k
  exact columns_sequencePiles (L.stablePile j) (j+1) (L.stablePile_antitone j)
    (fun k hk => L.stablePile_eq_zero j k (by omega)) k

theorem picked_stable_sum (L : LayerRule) (j N : Nat) :
    (∑ k ∈ Finset.range N, L.picked (L.stablePile j k))+L.stablePile j N=j := by
  induction N with
  | zero => simp
  | succ N ih =>
    rw [Finset.sum_range_succ,stablePile_succ]
    have hp := L.picked_le (L.stablePile j N)
    dsimp [remains]
    omega

theorem stableState_birthSize (L : LayerRule) (j : Nat) :
    L.birthSize (L.stableState j)=j := by
  change moment (sequencePiles (L.stablePile j) (j+1)) L.picked=j
  rw [moment_sequencePiles _ _ _ L.zero]
  have h := L.picked_stable_sum j (j+1)
  rw [L.stablePile_eq_zero j (j+1) (by omega),Nat.add_zero] at h
  exact h

/-- The reference profile is an actual fixed point of the solitaire move. -/
theorem stableState_fixed (L : LayerRule) (j : Nat) :
    L.move (L.stableState j)=L.stableState j := by
  apply multiset_eq_of_moments _ _ (L.move_positive _) (L.stableState_positive j)
  intro g hg
  rw [L.moment_move _ _ hg,L.stableState_birthSize]
  change g j+moment (sequencePiles (L.stablePile j) (j+1)) (g ∘ L.remains)=
    moment (sequencePiles (L.stablePile j) (j+1)) g
  rw [moment_sequencePiles _ _ _ (by simp [hg]),
    moment_sequencePiles _ _ _ hg]
  simp only [Function.comp_apply,← stablePile_succ]
  have h := sum_shift (fun k => g (L.stablePile j k)) (j+1)
  rw [L.stablePile_zero_column,L.stablePile_eq_zero j (j+1) (by omega),hg,Nat.add_zero] at h
  exact h

end LayerRule
end SolitaireGeneral
