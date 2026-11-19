import Solitaire.BirthRange
import Mathlib.Algebra.Order.BigOperators.Group.Multiset
import Mathlib.Data.Multiset.Filter
import Mathlib.Data.ZMod.Basic

namespace SolitaireGeneral.LayerRule

def birthSize (L : LayerRule) (s : Multiset Nat) : Nat := (s.map L.picked).sum

/-- The actual arbitrary-layer solitaire move on a multiset of pile sizes. -/
def move (L : LayerRule) (s : Multiset Nat) : Multiset Nat :=
  (L.birthSize s ::ₘ s.map L.remains).filter (0 < ·)

def moment (s : Multiset Nat) (g : Nat → Nat) : Nat := (s.map g).sum

theorem moment_filter_positive (s : Multiset Nat) (g : Nat → Nat) (hg : g 0=0) :
    moment (s.filter (0 < ·)) g=moment s g := by
  induction s using Multiset.induction_on with
  | empty => simp [moment]
  | @cons a s ih =>
    by_cases ha : 0 < a
    · simp [ha,moment] at ih ⊢
      exact ih
    · have hz : a=0 := by omega
      subst a
      simpa [moment,hg] using ih

theorem moment_move (L : LayerRule) (s : Multiset Nat) (g : Nat → Nat) (hg : g 0=0) :
    moment (L.move s) g=g (L.birthSize s)+moment s (g ∘ L.remains) := by
  rw [move,moment_filter_positive _ _ hg]
  simp [moment,Multiset.map_map]

theorem move_positive (L : LayerRule) (s : Multiset Nat) :
    ∀ j ∈ L.move s, 0 < j := by
  intro j hj
  exact (Multiset.mem_filter.mp hj).2

theorem move_mass (L : LayerRule) (s : Multiset Nat) : (L.move s).sum=s.sum := by
  have h := L.moment_move s id rfl
  have h' : (L.move s).sum=L.birthSize s+(s.map L.remains).sum := by
    simpa [moment] using h
  rw [h',birthSize]
  clear h h'
  induction s using Multiset.induction_on with
  | empty => simp
  | @cons j s ih =>
    have hp := L.picked_le j
    simp only [Multiset.map_cons,Multiset.sum_cons] at ih ⊢
    dsimp [remains] at *
    omega

theorem birthSize_le (L : LayerRule) (s : Multiset Nat) : L.birthSize s ≤ s.sum := by
  exact Multiset.sum_map_le_sum _ (fun j _ => L.picked_le j)

theorem birthSize_pos (L : LayerRule) (s : Multiset Nat) (hs : 0 < s.sum) :
    0 < L.birthSize s := by
  induction s using Multiset.induction_on with
  | empty => simp at hs
  | @cons j s ih =>
    by_cases hj : 0 < j
    · have hp := L.picked_pos j hj
      simp only [birthSize,Multiset.map_cons,Multiset.sum_cons]
      omega
    · have hz : j=0 := by omega
      have hs' : 0 < s.sum := by simpa [hz] using hs
      simpa [birthSize,hz,L.zero] using ih hs'

/-- A genuine finite cycle: each phase is the actual move from the preceding
phase, and every phase has the prescribed positive card count. -/
structure Cycle (L : LayerRule) (n p : Nat) [NeZero p] where
  piles : ZMod p → Multiset Nat
  positive : ∀ t j, j ∈ piles t → 0 < j
  mass : ∀ t, (piles t).sum=n
  next : ∀ t, piles t=L.move (piles (t-1))

namespace Cycle

def birth {L : LayerRule} {n p : Nat} [NeZero p] (C : Cycle L n p) (t : ZMod p) : Nat :=
  L.birthSize (C.piles (t-1))

theorem birth_le {L : LayerRule} {n p : Nat} [NeZero p] (C : Cycle L n p) (t : ZMod p) :
    C.birth t ≤ n := by
  have h := L.birthSize_le (C.piles (t-1))
  simpa [birth,C.mass] using h

theorem birth_pos {L : LayerRule} {n p : Nat} [NeZero p] (C : Cycle L n p)
    (hn : 0 < n) (t : ZMod p) : 0 < C.birth t := by
  apply L.birthSize_pos
  simpa [C.mass] using hn

theorem pile_le {L : LayerRule} {n p : Nat} [NeZero p] (C : Cycle L n p)
    (t : ZMod p) (j : Nat) (hj : j ∈ C.piles t) : j ≤ n := by
  have h := Multiset.single_le_sum (fun k (_ : k ∈ C.piles t) => Nat.zero_le k) j hj
  simpa [C.mass] using h

theorem moment_eq {L : LayerRule} {n p : Nat} [NeZero p] (C : Cycle L n p)
    (t : ZMod p) (g : Nat → Nat) (hg : g 0=0) :
    moment (C.piles t) g=g (C.birth t)+moment (C.piles (t-1)) (g ∘ L.remains) := by
  conv_lhs => rw [C.next t]
  exact L.moment_move _ _ hg

end Cycle
end SolitaireGeneral.LayerRule
