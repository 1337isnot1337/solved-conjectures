import Solitaire.Moves
import Solitaire.StableCore

namespace SolitaireGeneral.LayerRule

theorem moment_eq_zero (s : Multiset Nat) (g : Nat → Nat)
    (h : ∀ j ∈ s, g j=0) : moment s g=0 := by
  induction s using Multiset.induction_on with
  | empty => simp [moment]
  | @cons j s ih =>
    have hj := h j (by simp)
    have hs := ih (fun k hk => h k (by simp [hk]))
    simpa [moment,hj] using hs

theorem moment_indicator (s : Multiset Nat) (q : Nat) :
    moment s (fun j => if j=q then 1 else 0)=s.count q := by
  induction s using Multiset.induction_on with
  | empty => simp [moment]
  | @cons j s ih =>
    simp only [moment,Multiset.map_cons,Multiset.sum_cons] at ih ⊢
    rw [ih,Multiset.count_cons]
    by_cases h : j=q
    · subst j
      simp [Nat.add_comm]
    · simp [h,Ne.symm h]

namespace Cycle

variable {L : LayerRule} {n p : Nat} [NeZero p]

def age (C : Cycle L n p) (t : ZMod p) (k : Nat) : Nat :=
  L.stablePile (C.birth (t-k)) k

theorem age_eq_zero (C : Cycle L n p) (t : ZMod p) (k : Nat) (hk : n ≤ k) :
    C.age t k=0 := by
  apply L.stablePile_eq_zero
  exact (C.birth_le _).trans hk

/-- Expanding the genuine move by `N` steps separates the newly born piles
from the remains of every older pile. -/
theorem moment_expand (C : Cycle L n p) (N : Nat) (t : ZMod p)
    (g : Nat → Nat) (hg : g 0=0) :
    moment (C.piles t) g =
      (∑ k ∈ Finset.range N, g (C.age t k))+
        moment (C.piles (t-N)) (fun j => g (L.stablePile j N)) := by
  induction N with
  | zero => simp [stablePile]
  | succ N ih =>
    have ht := C.moment_eq (t-N) (fun j => g (L.stablePile j N)) (by simp [hg])
    have ht' : moment (C.piles (t-N)) (fun j => g (L.stablePile j N)) =
        g (C.age t N)+
          moment (C.piles (t-(N+1))) (fun j => g (L.stablePile j (N+1))) := by
      simpa only [age,Function.comp_def,stablePile,Function.iterate_succ_apply,
        Nat.cast_add,Nat.cast_one,sub_sub] using ht
    rw [ih,ht',Finset.sum_range_succ]
    simp only [Nat.cast_add,Nat.cast_one]
    omega

/-- A pile dies within at most its card count.  Thus every pile on a cycle
is one of the preceding `n` births, with the appropriate number of moves. -/
theorem moment_ages (C : Cycle L n p) (t : ZMod p) (g : Nat → Nat) (hg : g 0=0) :
    moment (C.piles t) g=∑ k ∈ Finset.range n, g (C.age t k) := by
  rw [C.moment_expand n t g hg]
  have hz : moment (C.piles (t-n)) (fun j => g (L.stablePile j n))=0 := by
    apply moment_eq_zero
    intro j hj
    rw [L.stablePile_eq_zero j n (C.pile_le _ _ hj),hg]
  rw [hz,Nat.add_zero]

theorem age_mass (C : Cycle L n p) (t : ZMod p) :
    (∑ k ∈ Finset.range n, C.age t k)=n := by
  have h := C.moment_ages t id rfl
  simpa [moment,C.mass] using h.symm

theorem birth_ages (C : Cycle L n p) (t : ZMod p) :
    C.birth t=∑ k ∈ Finset.range n, L.picked (C.age (t-1) k) := by
  exact C.moment_ages (t-1) L.picked L.zero

/-- The age expansion describes the entire pile multiset, including every
multiplicity, after its zero entries are discarded. -/
theorem piles_eq_ages (C : Cycle L n p) (t : ZMod p) :
    C.piles t=((Finset.range n).val.map (C.age t)).filter (0 < ·) := by
  apply Multiset.ext.mpr
  intro q
  by_cases hq : q=0
  · subst q
    have hzero : 0 ∉ C.piles t := by
      intro hz
      have hh := C.positive t 0 hz
      omega
    simp [hzero]
  · let g := fun j => if j=q then 1 else 0
    have hg : g 0=0 := by simp [g,Ne.symm hq]
    have hs := C.moment_ages t g hg
    have hmap : moment (((Finset.range n).val.map (C.age t)).filter (0 < ·)) g=
        ∑ k ∈ Finset.range n, g (C.age t k) := by
      rw [moment_filter_positive _ _ hg]
      simp only [moment,Multiset.map_map,Function.comp_def]
      rfl
    rw [← moment_indicator,← moment_indicator]
    exact hs.trans hmap.symm

end Cycle
end SolitaireGeneral.LayerRule
