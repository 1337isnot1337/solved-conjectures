import Conjectures.LonelinessModularCoverByteCounts
import Conjectures.LonelinessModularCoverCuts

/-!
# Bytewise evaluation of the existing bounded support certificates

Only the population-count implementation changes. The final numerical
proposition is still `Cuts.boundedCheck`; every equality below holds for all
cover functions, compatibility functions, terminal predicates, tapes and
frames. No certificate, numeric bound or root coverage is assumed here.
-/

namespace Loneliness.Modular.SupportSearch.Bits.ByteCuts

def capacity (cover : ℕ → ℕ) (available uncovered slots threshold : ℕ) : ℕ :=
  slots * threshold +
    (available.bitIndices.map (fun a => Byte.count (uncovered &&& cover a) - threshold)).sum

theorem capacity_eq (cover : ℕ → ℕ) (available uncovered slots threshold : ℕ) :
    capacity cover available uncovered slots threshold =
      Bits.capacity cover available uncovered slots threshold := by
  simp only [capacity, Bits.capacity, Byte.count_eq]

def leafCheck (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (certificate : SupportSearch.Tree) (selected available uncovered slots : ℕ) : Bool :=
  match certificate with
  | .capacity threshold =>
      decide (capacity cover available uncovered slots threshold < Byte.count uncovered)
  | _ => Bits.check cover compatible terminal certificate selected available uncovered slots

theorem leafCheck_eq (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (certificate : SupportSearch.Tree) (selected available uncovered slots : ℕ) :
    leafCheck cover compatible terminal certificate selected available uncovered slots =
      Bits.check cover compatible terminal certificate selected available uncovered slots := by
  cases certificate with
  | reject => rfl
  | retained index => rfl
  | witness time => rfl
  | capacity threshold =>
    simp only [leafCheck, Bits.check, capacity_eq, Byte.count_eq]
  | incompatible a b => rfl
  | split a without withCandidate => rfl

def fragmentCheck (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Cuts.Frame) (bound : ℕ) :
    Cuts.Fragment → Cuts.Frame → Bool
  | .reuse index, frame => decide (index < bound ∧ frame = frames index)
  | .leaf, frame =>
      match frame.fuel, lookup frame.index with
      | Nat.succ _, .leaf certificate =>
          leafCheck cover compatible terminal certificate
            frame.selected frame.available frame.uncovered frame.slots
      | _, _ => false
  | .split without withCandidate, frame =>
      match frame.fuel, lookup frame.index with
      | Nat.succ _, .split a left right =>
          decide (frame.available.testBit a = true ∧ 0 < frame.slots) &&
            (fragmentCheck cover compatible terminal lookup frames bound without
                (frame.absent a left) &&
              fragmentCheck cover compatible terminal lookup frames bound withCandidate
                (frame.present cover compatible a right))
      | _, _ => false

theorem fragmentCheck_eq
    (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Cuts.Frame) (bound : ℕ)
    (fragment : Cuts.Fragment) (frame : Cuts.Frame) :
    fragmentCheck cover compatible terminal lookup frames bound fragment frame =
      Cuts.fragmentCheck cover compatible terminal lookup frames bound fragment frame := by
  induction fragment generalizing frame with
  | reuse index => rfl
  | leaf =>
    cases hfuel : frame.fuel with
    | zero => simp only [fragmentCheck, Cuts.fragmentCheck, hfuel]
    | succ fuel =>
      cases hnode : lookup frame.index with
      | leaf certificate =>
        simp only [fragmentCheck, Cuts.fragmentCheck, hfuel, hnode, leafCheck_eq]
      | split a left right =>
        simp only [fragmentCheck, Cuts.fragmentCheck, hfuel, hnode]
  | split without withCandidate ihwithout ihwith =>
    cases hfuel : frame.fuel with
    | zero => simp only [fragmentCheck, Cuts.fragmentCheck, hfuel]
    | succ fuel =>
      cases hnode : lookup frame.index with
      | leaf certificate =>
        simp only [fragmentCheck, Cuts.fragmentCheck, hfuel, hnode]
      | split a left right =>
        simp only [fragmentCheck, Cuts.fragmentCheck, hfuel, hnode, ihwithout, ihwith]

def boundedCheck (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Cuts.Frame) (bound limit : ℕ)
    (fragment : Cuts.Fragment) (frame : Cuts.Frame) : Bool :=
  decide (fragment.size ≤ limit) &&
    fragmentCheck cover compatible terminal lookup frames bound fragment frame

theorem boundedCheck_eq
    (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Cuts.Frame) (bound limit : ℕ)
    (fragment : Cuts.Fragment) (frame : Cuts.Frame) :
    boundedCheck cover compatible terminal lookup frames bound limit fragment frame =
      Cuts.boundedCheck cover compatible terminal lookup frames bound limit fragment frame := by
  simp only [boundedCheck, Cuts.boundedCheck, fragmentCheck_eq]

/-- The proof consumer retains the original numerical proposition. -/
theorem boundedCheck_sound
    (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Cuts.Frame) (bound limit : ℕ)
    (fragment : Cuts.Fragment) (frame : Cuts.Frame)
    (hcheck : boundedCheck cover compatible terminal lookup frames bound limit fragment frame = true) :
    Cuts.boundedCheck cover compatible terminal lookup frames bound limit fragment frame = true :=
  (boundedCheck_eq cover compatible terminal lookup frames bound limit fragment frame).symm.trans hcheck

end Loneliness.Modular.SupportSearch.Bits.ByteCuts
