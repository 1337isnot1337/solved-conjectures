module

public import Conjectures.FranklSmallCyclicData1
public import Conjectures.FranklSmallCyclicData2
public import Conjectures.FranklSmallCyclicData3
public import Conjectures.FranklSmallCyclicData4
public import Conjectures.FranklSmallCyclicData5
public import Conjectures.FranklSmallCyclicData6
public import Lean.Elab.Tactic.Omega

@[expose] public section

/-! Exhaustive reduction for every literal cyclic period at most six.
The finite certificates cover all subsets of the normalized generator
pool. No rotation representative or external small-ground theorem is used.
-/

namespace FranklSmallCyclic

theorem obstruction_le_six {n : ℕ} [NeZero n] (hn : n ≤ 6)
    {G : Finset (Finset (Fin n))} (hspan : FranklSpanFour.CyclicSpanFour G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) : Obstruction G := by
  have hnpos : 0 < n := Nat.pos_of_ne_zero (NeZero.ne n)
  have hcases : n = 1 ∨ n = 2 ∨ n = 3 ∨ n = 4 ∨ n = 5 ∨ n = 6 := by omega
  rcases hcases with rfl | rfl | rfl | rfl | rfl | rfl
  · exact Period1.obstruction hspan hlarge
  · exact Period2.obstruction hspan hlarge
  · exact Period3.obstruction hspan hlarge
  · exact Period4.obstruction hspan hlarge
  · exact Period5.obstruction hspan hlarge
  · exact Period6.obstruction hspan hlarge

theorem nonempty_obstruction_le_six {n : ℕ} [NeZero n] (hn : n ≤ 6)
    {G : Finset (Finset (Fin n))} (hG : G.Nonempty)
    (hspan : FranklSpanFour.CyclicSpanFour G) (hlarge : ∀ g ∈ G, 3 ≤ g.card) :
    (∃ A B C p, TripleWitness G A B C p) ∨
      (∃ g x y, TwoPointWitness G G g x y) ∨ ∃ f, PaschWitness G f := by
  rcases obstruction_le_six hn hspan hlarge with hempty | h
  · exact False.elim (hG.ne_empty hempty)
  · exact h

end FranklSmallCyclic
