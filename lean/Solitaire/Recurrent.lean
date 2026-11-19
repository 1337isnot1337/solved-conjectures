import Solitaire.Moves
import Mathlib.Logic.Function.Iterate

namespace SolitaireGeneral.LayerRule

def Recurrent (L : LayerRule) (s : Multiset Nat) : Prop :=
  ∃ p : Nat, 0 < p ∧ (L.move^[p]) s=s

theorem iterate_move_mass (L : LayerRule) (s : Multiset Nat) (k : Nat) :
    ((L.move^[k]) s).sum=s.sum := by
  induction k with
  | zero => rfl
  | succ k ih => rw [Function.iterate_succ_apply',L.move_mass,ih]

theorem iterate_move_positive (L : LayerRule) (s : Multiset Nat)
    (hs : ∀ j ∈ s, 0 < j) (k : Nat) : ∀ j ∈ (L.move^[k]) s, 0 < j := by
  cases k with
  | zero => exact hs
  | succ k =>
    rw [Function.iterate_succ_apply']
    exact L.move_positive _

theorem orbit_periodic (L : LayerRule) (s : Multiset Nat) (p : Nat)
    (hp : (L.move^[p]) s=s) : Function.Periodic (fun k => (L.move^[k]) s) p := by
  intro k
  change (L.move^[k+p]) s=(L.move^[k]) s
  rw [Function.iterate_add_apply,hp]

/-- Every recurrent positive-pile state gives a cycle of the actual move. -/
def orbitCycle (L : LayerRule) (s : Multiset Nat) (hs : ∀ j ∈ s, 0 < j)
    (p : Nat) [NeZero p] (hp : (L.move^[p]) s=s) : Cycle L s.sum p where
  piles := fun t => (L.move^[t.val]) s
  positive := fun t => L.iterate_move_positive s hs t.val
  mass := fun t => L.iterate_move_mass s t.val
  next := by
    intro t
    have he : ((t-1).val+1)%p=t.val := by
      rw [← ZMod.val_natCast p ((t-1).val+1),Nat.cast_add,Nat.cast_one,
        ZMod.natCast_zmod_val,sub_add_cancel]
    have hh := (L.orbit_periodic s p hp).map_mod_nat ((t-1).val+1)
    rw [he,Function.iterate_succ_apply'] at hh
    exact hh

theorem orbitCycle_zero (L : LayerRule) (s : Multiset Nat) (hs : ∀ j ∈ s, 0 < j)
    (p : Nat) [NeZero p] (hp : (L.move^[p]) s=s) :
    (L.orbitCycle s hs p hp).piles 0=s := by
  simp [orbitCycle]

namespace Cycle

variable {L : LayerRule} {n p : Nat} [NeZero p]

theorem piles_add_nat (C : Cycle L n p) (t : ZMod p) (k : Nat) :
    C.piles (t+k)=(L.move^[k]) (C.piles t) := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [C.next]
    have he : t+((k+1:Nat):ZMod p)-1=t+k := by
      simp only [Nat.cast_add,Nat.cast_one,← add_assoc,add_sub_cancel_right]
    rw [he,ih,Function.iterate_succ_apply']

theorem recurrent (C : Cycle L n p) (t : ZMod p) : L.Recurrent (C.piles t) := by
  refine ⟨p,NeZero.pos p,?_⟩
  have h := C.piles_add_nat t p
  simpa only [ZMod.natCast_self,add_zero] using h.symm

end Cycle
end SolitaireGeneral.LayerRule
