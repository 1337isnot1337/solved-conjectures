import Solitaire.Renewal
import Mathlib.Data.Finset.Max

namespace SolitaireGeneral.LayerRule.Cycle

variable {L : LayerRule} {n p : Nat} [NeZero p]

/-- On a recurrent trajectory, pile age already gives decreasing pile order. -/
theorem age_antitone (C : Cycle L n p) (hn : 0 < n) (t : ZMod p) :
    Antitone (C.age t) := by
  apply antitone_nat_of_succ_le
  intro k
  change L.stablePile (C.birth (t-((k+1:Nat):ZMod p))) (k+1) ≤ L.stablePile (C.birth (t-k)) k
  unfold stablePile
  rw [Function.iterate_succ_apply]
  exact L.stablePile_monotone k (C.attained_birth_range hn _ _)

theorem birth_extrema (C : Cycle L n p) : ∃ u v : ZMod p,
    (∀ t, C.birth u ≤ C.birth t) ∧ (∀ t, C.birth t ≤ C.birth v) := by
  classical
  obtain ⟨u,_,hu⟩ := Finset.exists_min_image Finset.univ C.birth
    (show (Finset.univ:Finset (ZMod p)).Nonempty from ⟨0,by simp⟩)
  obtain ⟨v,_,hv⟩ := Finset.exists_max_image Finset.univ C.birth
    (show (Finset.univ:Finset (ZMod p)).Nonempty from ⟨0,by simp⟩)
  exact ⟨u,v,fun t => hu t (by simp),fun t => hv t (by simp)⟩

theorem stableMass_birth_bounds (C : Cycle L n p) (u v : ZMod p)
    (hu : ∀ t, C.birth u ≤ C.birth t) (hv : ∀ t, C.birth t ≤ C.birth v) :
    L.stableMass (C.birth u) ≤ n ∧ n ≤ L.stableMass (C.birth v) := by
  constructor
  · calc
      L.stableMass (C.birth u) = ∑ k ∈ Finset.range n, L.stablePile (C.birth u) k :=
        L.stableMass_eq_sum_range_of_le _ _ (C.birth_le u)
      _ ≤ ∑ k ∈ Finset.range n, C.age 0 k := by
        apply Finset.sum_le_sum
        intro k _
        exact L.stablePile_monotone k (hu _)
      _ = n := C.age_mass 0
  · calc
      n = ∑ k ∈ Finset.range n, C.age 0 k := (C.age_mass 0).symm
      _ ≤ ∑ k ∈ Finset.range n, L.stablePile (C.birth v) k := by
        apply Finset.sum_le_sum
        intro k _
        exact L.stablePile_monotone k (hv _)
      _ = L.stableMass (C.birth v) :=
        (L.stableMass_eq_sum_range_of_le _ _ (C.birth_le v)).symm

theorem maximal_stable_between_births (C : Cycle L n p) (j : Nat)
    (hj : L.stableMass j ≤ n) (hjnext : n < L.stableMass (j+1)) :
    (∃ u, C.birth u ≤ j) ∧ (∃ v, j ≤ C.birth v) := by
  obtain ⟨u,v,hu,hv⟩ := C.birth_extrema
  obtain ⟨hlo,hhi⟩ := C.stableMass_birth_bounds u v hu hv
  constructor
  · refine ⟨u,?_⟩
    by_contra h
    have hh := L.stableMass_monotone (show j+1 ≤ C.birth u by omega)
    omega
  · refine ⟨v,?_⟩
    by_contra h
    have hh := L.stableMass_strictMono (show C.birth v < j by omega)
    omega

/-- The actual sorted pile sequence and any stable top between two attained
births interlace by one column. -/
theorem age_interlacing (C : Cycle L n p) (hn : 0 < n) (j : Nat)
    (hlo : ∃ u, C.birth u ≤ j) (hhi : ∃ v, j ≤ C.birth v) (t : ZMod p) :
    (∀ k, C.age t (k+1) ≤ L.stablePile j k) ∧
      (∀ k, L.stablePile j (k+1) ≤ C.age t k) := by
  obtain ⟨u,hu⟩ := hlo
  obtain ⟨v,hv⟩ := hhi
  constructor
  · intro k
    change L.stablePile (C.birth (t-((k+1:Nat):ZMod p))) (k+1) ≤ L.stablePile j k
    unfold stablePile
    rw [Function.iterate_succ_apply]
    exact L.stablePile_monotone k ((C.attained_birth_range hn u _).trans hu)
  · intro k
    change L.stablePile j (k+1) ≤ L.stablePile (C.birth (t-k)) k
    unfold stablePile
    rw [Function.iterate_succ_apply]
    exact L.stablePile_monotone k
      ((L.remains_monotone hv).trans (C.attained_birth_range hn _ v))

theorem maximal_stable_interlacing (C : Cycle L n p) (hn : 0 < n) (j : Nat)
    (hj : L.stableMass j ≤ n) (hjnext : n < L.stableMass (j+1)) (t : ZMod p) :
    (∀ k, C.age t (k+1) ≤ L.stablePile j k) ∧
      (∀ k, L.stablePile j (k+1) ≤ C.age t k) := by
  obtain ⟨hlo,hhi⟩ := C.maximal_stable_between_births j hj hjnext
  exact C.age_interlacing hn j hlo hhi t

end SolitaireGeneral.LayerRule.Cycle
