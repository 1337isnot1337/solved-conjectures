module

public import Conjectures.GesselZhuangHistoryBlocks
public import Conjectures.GesselZhuangChoices

/-!
# Gessel–Zhuang conjecture

Deleting the maximum recovers the preceding block state, and the resulting
state uniquely determines the insertion choice. Consequently an actual
ordered block permutation has at most one complete insertion history.
-/

@[expose] public section

namespace GesselZhuang

abbrev TotalHistory (n : ℕ) := Σ h : ℕ, Σ p : HeightPath n h, History p

namespace TotalHistory

def blocks {n : ℕ} (T : TotalHistory n) : Blocks := History.blocks T.2.1 T.2.2

def extend {n : ℕ} : (T : TotalHistory n) → InsertionChoice T.1 → TotalHistory (n + 1)
  | ⟨h, p, H⟩, .up i => ⟨h + 1, p.up, (H, i)⟩
  | ⟨h, p, H⟩, .flat i e => ⟨h, p.flat, (H, (i, e))⟩
  | ⟨0, _, _⟩, .down i => Fin.elim0 i
  | ⟨h + 1, p, H⟩, .down i => ⟨h, p.down, (H, i)⟩

def disassemble {n : ℕ} : TotalHistory (n + 1) → Σ T : TotalHistory n, InsertionChoice T.1
  | ⟨_, .up p, H⟩ => ⟨⟨_, p, H.1⟩, .up H.2⟩
  | ⟨_, .flat p, H⟩ => ⟨⟨_, p, H.1⟩, .flat H.2.1 H.2.2⟩
  | ⟨_, .down p, H⟩ => ⟨⟨_, p, H.1⟩, .down H.2⟩

theorem extend_disassemble {n : ℕ} (T : TotalHistory (n + 1)) :
    extend (disassemble T).1 (disassemble T).2 = T := by
  rcases T with ⟨h, p, H⟩
  cases p <;> cases H <;> rfl

theorem disassemble_extend {n : ℕ} (T : TotalHistory n) (c : InsertionChoice T.1) :
    disassemble (extend T c) = ⟨T, c⟩ := by
  rcases T with ⟨h, p, H⟩
  cases c with
  | up i => rfl
  | flat i e => rfl
  | down i => cases h with
    | zero => exact Fin.elim0 i
    | succ h => rfl

theorem extend_blocks {n : ℕ} (T : TotalHistory n) (c : InsertionChoice T.1) :
    (extend T c).blocks = c.act T.blocks (n + 1) := by
  rcases T with ⟨h, p, H⟩
  cases c with
  | up i => rfl
  | flat i e => rfl
  | down i => cases h with
    | zero => exact Fin.elim0 i
    | succ h => rfl

/-- The literal blocks determine the entire height path and all its choices. -/
theorem blocks_injective (n : ℕ) : Function.Injective (@blocks n) := by
  induction n with
  | zero =>
      rintro ⟨h, p, H⟩ ⟨k, q, J⟩ _
      cases p
      cases q
      cases H
      cases J
      rfl
  | succ n ih =>
      have hext : Function.Injective
          (fun s : Σ T : TotalHistory n, InsertionChoice T.1 => (extend s.1 s.2).blocks) := by
        rintro ⟨T, c⟩ ⟨U, d⟩ heq
        change (extend T c).blocks = (extend U d).blocks at heq
        rw [extend_blocks, extend_blocks] at heq
        dsimp only [blocks] at heq
        have herase := congrArg (fun B => eraseBlocks B (n + 1)) heq
        rw [InsertionChoice.erase_act (History.blocks_length T.2.1 T.2.2)
          (History.blocks_nonempty T.2.1 T.2.2) (History.blocks_avoid_next T.2.1 T.2.2),
          InsertionChoice.erase_act (History.blocks_length U.2.1 U.2.2)
          (History.blocks_nonempty U.2.1 U.2.2) (History.blocks_avoid_next U.2.1 U.2.2)] at herase
        have hTU : T = U := ih herase
        subst U
        have hcd : c = d := InsertionChoice.act_injective
          (History.blocks_length T.2.1 T.2.2) (History.blocks_nonempty T.2.1 T.2.2)
          (History.blocks_avoid_next T.2.1 T.2.2) heq
        cases hcd
        rfl
      intro A B hab
      have hd : disassemble A = disassemble B := hext (by
        simpa only [extend_disassemble] using hab)
      have hh := congrArg (fun s => extend s.1 s.2) hd
      simpa only [extend_disassemble] using hh

end TotalHistory

end GesselZhuang
