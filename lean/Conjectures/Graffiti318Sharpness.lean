import Conjectures.Graffiti318
import Mathlib.Tactic.FinCases

/-! The sharpness graph `K₁ ∨ (2K₂)` for Graffiti.pc Conjecture 318.

Result, proof, and sharpness example credited to @JesterInABarrel; see
`results/graffiti-pc-318/PROOF.md`. Vertex zero is universal. The other
edges are `{1,2}` and `{3,4}`.
-/

namespace Graffiti318

open SimpleGraph

def sharpGraph : SimpleGraph (Fin 5) where
  Adj i j := i ≠ j ∧ (i = 0 ∨ j = 0 ∨
    (i = 1 ∧ j = 2) ∨ (i = 2 ∧ j = 1) ∨
    (i = 3 ∧ j = 4) ∨ (i = 4 ∧ j = 3))
  symm := by
    constructor
    intro i j h
    refine ⟨Ne.symm h.1,?_⟩
    tauto
  loopless := by constructor; intro i h; exact h.1 rfl

instance sharpGraph_decidableAdj : DecidableRel sharpGraph.Adj :=
  fun i j => inferInstanceAs (Decidable (i ≠ j ∧ (i = 0 ∨ j = 0 ∨
    (i = 1 ∧ j = 2) ∨ (i = 2 ∧ j = 1) ∨
    (i = 3 ∧ j = 4) ∨ (i = 4 ∧ j = 3))))

theorem sharp_universal : sharpGraph.IsUniversal 0 := by
  intro i hi
  exact ⟨hi,Or.inl rfl⟩

theorem sharp_connected : sharpGraph.Connected :=
  SimpleGraph.Connected.of_isUniversal sharp_universal

theorem sharp_adj_zero (i : Fin 5) (hi : i ≠ 0) : sharpGraph.Adj i 0 :=
  (sharp_universal (Ne.symm hi)).symm

theorem sharp_distance (i j : Fin 5) :
    sharpGraph.dist i j = if i = j then 0 else if sharpGraph.Adj i j then 1 else 2 := by
  by_cases hij : i = j
  · subst j
    simp only [SimpleGraph.dist_self, ite_eq_left]
  rw [ite_eq_right hij]
  by_cases hadj : sharpGraph.Adj i j
  · rw [ite_eq_left hadj]
    exact SimpleGraph.dist_eq_one_iff_adj.mpr hadj
  rw [ite_eq_right hadj]
  have hi : i ≠ 0 := by
    intro h
    subst i
    exact hadj (sharp_universal hij)
  have hj : j ≠ 0 := by
    intro h
    subst j
    exact hadj (sharp_adj_zero i hij)
  let p : sharpGraph.Walk i j :=
    .cons (sharp_adj_zero i hi) (.cons (sharp_adj_zero j hj).symm .nil)
  have hle : sharpGraph.dist i j ≤ 2 := by
    simpa only [p, SimpleGraph.Walk.length_cons, SimpleGraph.Walk.length_nil] using
      SimpleGraph.dist_le p
  have hgt := sharp_connected.one_lt_dist_of_ne_of_not_adj hij hadj
  omega

theorem sharp_evenDistanceCount (i : Fin 5) :
    evenDistanceCount sharpGraph i = if i = 0 then 1 else 3 := by
  unfold evenDistanceCount
  simp_rw [sharp_distance]
  fin_cases i <;> decide +kernel

theorem sharp_missingEdgeCount : missingEdgeCount sharpGraph = 4 := by
  decide +kernel

theorem sharp_maxEvenDistanceCount : maxEvenDistanceCount sharpGraph = 3 := by
  unfold maxEvenDistanceCount
  rw [show evenDistanceCount sharpGraph = (fun i : Fin 5 => if i = 0 then 1 else 3)
    from funext sharp_evenDistanceCount]
  decide +kernel

theorem sharp_pair_totalDominating : TotalDominating sharpGraph {0,1} := by
  change ∀ x : Fin 5, ∃ y ∈ ({0,1} : Finset (Fin 5)), sharpGraph.Adj x y
  decide +kernel

theorem sharp_four_minimalTotalDominating :
    MinimalTotalDominating sharpGraph {1,2,3,4} := by
  unfold MinimalTotalDominating TotalDominating
  decide +kernel

theorem sharp_totalDominationNumber : totalDominationNumber sharpGraph = 2 :=
  totalDominationNumber_eq_two_of_pair sharpGraph 0 0 1
    (by decide +kernel) sharp_pair_totalDominating

theorem sharp_not_wellTotalDominated : ¬ WellTotalDominated sharpGraph := by
  intro h
  have hmin := h {1,2,3,4} sharp_four_minimalTotalDominating
  have hcard := hmin.2 {0,1} sharp_pair_totalDominating
  have hfour : ({1,2,3,4} : Finset (Fin 5)).card = 4 := by decide +kernel
  have htwo : ({0,1} : Finset (Fin 5)).card = 2 := by decide +kernel
  rw [hfour,htwo] at hcard
  omega

/-- The one-unit relaxation of the distance hypothesis holds for a connected
five-vertex graph that is not well total dominated. -/
theorem sharpness :
    sharpGraph.Connected ∧
    missingEdgeCount sharpGraph = 4 ∧
    maxEvenDistanceCount sharpGraph = 3 ∧
    totalDominationNumber sharpGraph = 2 ∧
    missingEdgeCount sharpGraph - 1 ≤ maxEvenDistanceCount sharpGraph ∧
    ¬ WellTotalDominated sharpGraph := by
  refine ⟨sharp_connected,sharp_missingEdgeCount,sharp_maxEvenDistanceCount,
    sharp_totalDominationNumber,?_,sharp_not_wellTotalDominated⟩
  rw [sharp_missingEdgeCount,sharp_maxEvenDistanceCount]

end Graffiti318
