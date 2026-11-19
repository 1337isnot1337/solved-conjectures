import Conjectures.LonelinessModularCoverBits

/-! Compositional checks for exact states of the existing support tape.

A fragment follows the actual tape instructions. It may reuse an earlier
frame only after checking equality of the fuel, instruction index and all
four state values. The finite reference order proves every reused check;
no termination claim about a certificate producer is needed. The final
statement is the original `Bits.tapeCheck`, so its checked soundness theorem
and the existing initial-support interfaces apply without alteration. -/

namespace Loneliness.Modular.SupportSearch.Bits.Cuts

structure Frame where
  fuel : ℕ
  index : ℕ
  selected : ℕ
  available : ℕ
  uncovered : ℕ
  slots : ℕ
  deriving DecidableEq, Inhabited

def Frame.Checked (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frame : Frame) : Prop :=
  tapeCheck cover compatible terminal lookup frame.fuel frame.index
    frame.selected frame.available frame.uncovered frame.slots=true

def Frame.absent (frame : Frame) (a index : ℕ) : Frame :=
  ⟨frame.fuel-1,index,frame.selected,erase frame.available a,frame.uncovered,frame.slots⟩

def Frame.present (cover compatible : ℕ → ℕ) (frame : Frame) (a index : ℕ) : Frame :=
  ⟨frame.fuel-1,index,insertBit frame.selected a,after compatible frame.available a,
    Nat.ldiff frame.uncovered (cover a),frame.slots-1⟩

inductive Fragment where
  | reuse (index : ℕ)
  | leaf
  | split (without withCandidate : Fragment)
  deriving Inhabited

def Fragment.size : Fragment → ℕ
  | .reuse _ => 1
  | .leaf => 1
  | .split without withCandidate => 1+without.size+withCandidate.size

def fragmentCheck (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Frame) (bound : ℕ) :
    Fragment → Frame → Bool
  | .reuse index, frame => decide (index<bound ∧ frame=frames index)
  | .leaf, frame =>
      match frame.fuel, lookup frame.index with
      | Nat.succ _, .leaf certificate =>
          Bits.check cover compatible terminal certificate
            frame.selected frame.available frame.uncovered frame.slots
      | _, _ => false
  | .split without withCandidate, frame =>
      match frame.fuel, lookup frame.index with
      | Nat.succ _, .split a left right =>
          decide (frame.available.testBit a=true ∧ 0<frame.slots) &&
            (fragmentCheck cover compatible terminal lookup frames bound without
                (frame.absent a left) &&
              fragmentCheck cover compatible terminal lookup frames bound withCandidate
                (frame.present cover compatible a right))
      | _, _ => false

theorem fragmentCheck_sound
    (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Frame) (bound : ℕ)
    (hprevious : ∀ index, index<bound → Frame.Checked cover compatible terminal lookup (frames index))
    (fragment : Fragment) (frame : Frame)
    (hcheck : fragmentCheck cover compatible terminal lookup frames bound fragment frame=true) :
    Frame.Checked cover compatible terminal lookup frame := by
  induction fragment generalizing frame with
  | reuse index =>
    change decide (index<bound ∧ frame=frames index)=true at hcheck
    obtain ⟨hi,hframe⟩ := of_decide_eq_true hcheck
    rw [hframe]
    exact hprevious index hi
  | leaf =>
    rcases frame with ⟨fuel,index,selected,available,uncovered,slots⟩
    cases fuel with
    | zero =>
      simp only [fragmentCheck] at hcheck
      cases hcheck
    | succ fuel =>
      cases hnode : lookup index with
      | leaf certificate =>
        simpa only [fragmentCheck,Frame.Checked,tapeCheck,hnode] using hcheck
      | split a left right =>
        simp only [fragmentCheck,hnode] at hcheck
        cases hcheck
  | split without withCandidate ihwithout ihwith =>
    rcases frame with ⟨fuel,index,selected,available,uncovered,slots⟩
    cases fuel with
    | zero =>
      simp only [fragmentCheck] at hcheck
      cases hcheck
    | succ fuel =>
      cases hnode : lookup index with
      | leaf certificate =>
        simp only [fragmentCheck,hnode] at hcheck
        cases hcheck
      | split a left right =>
        have hh := Bool.and_eq_true_iff.mp
          (show (decide (available.testBit a=true ∧ 0<slots) &&
            (fragmentCheck cover compatible terminal lookup frames bound without
                (Frame.absent ⟨fuel+1,index,selected,available,uncovered,slots⟩ a left) &&
              fragmentCheck cover compatible terminal lookup frames bound withCandidate
                (Frame.present cover compatible
                  ⟨fuel+1,index,selected,available,uncovered,slots⟩ a right)))=true from
            by simpa only [fragmentCheck,hnode] using hcheck)
        have hc := Bool.and_eq_true_iff.mp hh.2
        have hl := ihwithout _ hc.1
        have hr := ihwith _ hc.2
        change tapeCheck cover compatible terminal lookup (fuel+1) index
          selected available uncovered slots=true
        rw [tapeCheck,hnode]
        apply Bool.and_eq_true_iff.mpr
        refine ⟨hh.1,Bool.and_eq_true_iff.mpr ⟨?_,?_⟩⟩
        · simpa only [Frame.Checked,Frame.absent,Nat.add_sub_cancel] using hl
        · simpa only [Frame.Checked,Frame.present,Nat.add_sub_cancel] using hr

def boundedCheck (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Frame) (bound limit : ℕ)
    (fragment : Fragment) (frame : Frame) : Bool :=
  decide (fragment.size≤limit) &&
    fragmentCheck cover compatible terminal lookup frames bound fragment frame

theorem boundedCheck_size
    (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Frame) (bound limit : ℕ)
    (fragment : Fragment) (frame : Frame)
    (hcheck : boundedCheck cover compatible terminal lookup frames bound limit fragment frame=true) :
    fragment.size≤limit :=
  of_decide_eq_true (Bool.and_eq_true_iff.mp hcheck).1

theorem boundedCheck_sound
    (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Frame) (bound limit : ℕ)
    (hprevious : ∀ index, index<bound → Frame.Checked cover compatible terminal lookup (frames index))
    (fragment : Fragment) (frame : Frame)
    (hcheck : boundedCheck cover compatible terminal lookup frames bound limit fragment frame=true) :
    Frame.Checked cover compatible terminal lookup frame :=
  fragmentCheck_sound cover compatible terminal lookup frames bound hprevious fragment frame
    (Bool.and_eq_true_iff.mp hcheck).2

/-- Every frame in a finite certificate table satisfies the original tape
check. The numerical checks require strictly earlier references, so even
a malformed producer cannot assume its own conclusion through a cycle. -/
theorem table_sound
    (cover compatible : ℕ → ℕ) (terminal : Finset ℕ → ℕ → Bool)
    (lookup : ℕ → Tape.Node) (frames : ℕ → Frame) (fragments : ℕ → Fragment)
    (count limit : ℕ)
    (hchecks : ∀ index, index<count →
      boundedCheck cover compatible terminal lookup frames index limit
        (fragments index) (frames index)=true) :
    ∀ index, index<count → Frame.Checked cover compatible terminal lookup (frames index) := by
  intro index
  induction index using Nat.strong_induction_on with
  | h index ih =>
    intro hi
    apply boundedCheck_sound cover compatible terminal lookup frames index limit
      (fun previous hp => ih previous hp (lt_trans hp hi))
      (fragments index) (frames index)
    exact hchecks index hi

def exampleFrames : ℕ → Frame
  | 0 => ⟨2,1,0,4,3,2⟩
  | 1 => ⟨2,2,2,4,2,1⟩
  | _ => ⟨3,0,0,6,3,2⟩

def exampleFragments : ℕ → Fragment
  | 0 => .leaf
  | 1 => .split .leaf .leaf
  | _ => .split (.reuse 0) (.reuse 1)

theorem example_checked : ∀ index : Fin 3,
    boundedCheck exampleCoverMask (fun _ => 6) exampleTerminal Tape.exampleLookup
      exampleFrames index.val 3 (exampleFragments index.val) (exampleFrames index.val)=true := by
  decide +kernel

theorem example_complete :
    tapeCheck exampleCoverMask (fun _ => 6) exampleTerminal Tape.exampleLookup
      3 0 0 6 3 2=true := by
  exact table_sound exampleCoverMask (fun _ => 6) exampleTerminal Tape.exampleLookup
    exampleFrames exampleFragments 3 3
    (fun index hi => example_checked ⟨index,hi⟩) 2 (by decide)

end Loneliness.Modular.SupportSearch.Bits.Cuts
