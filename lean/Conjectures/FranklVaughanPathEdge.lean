module

public import Conjectures.FranklFCBitCode
public import Conjectures.FranklFC
public import Conjectures.FranklShareFlowPointwise
public import Conjectures.FranklFCFiniteDomain

@[expose] public section

set_option maxRecDepth 20000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Frankl.FC.VaughanPathEdge

/-! Proposed by generate_lean_fc_masks.py. The finite decoder, each
branch, and every integer share transfer are checked in Lean. -/

def ground : Finset ℕ := Finset.range 6
def weights (i : ℕ) : ℕ := ([12, 7, 9, 7, 6, 6] : List ℕ).getD i 0
def base : Finset (Finset ℕ) := {{0, 1, 2}, {0, 2, 3}, {0, 1, 2, 3}, {0, 4, 5}, {0, 1, 2, 4, 5}, {0, 2, 3, 4, 5}, {0, 1, 2, 3, 4, 5}}
def codedBase : Finset ℕ := {7, 13, 15, 49, 55, 61, 63}
def codedShare (a : ℕ) : ℤ := share ground weights (BitCode.decode 6 a)

private def c0 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨0, 13, 9⟩,
    ⟨0, 15, 23⟩,
    ⟨0, 49, 1⟩,
    ⟨0, 55, 5⟩,
    ⟨1, 55, 23⟩,
    ⟨3, 49, 9⟩,
    ⟨4, 49, 19⟩,
    ⟨4, 55, 5⟩,
    ⟨4, 61, 5⟩,
    ⟨5, 61, 5⟩,
    ⟨6, 61, 15⟩,
    ⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 49, 15⟩,
    ⟨14, 49, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 55, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨48, 13, 8⟩,
    ⟨48, 15, 15⟩,
    ⟨50, 13, 4⟩,
    ⟨50, 49, 5⟩,
    ⟨52, 15, 5⟩,
    ⟨56, 7, 3⟩,
    ⟨56, 49, 6⟩]
private def c1 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨0, 49, 1⟩,
    ⟨0, 55, 33⟩,
    ⟨3, 49, 9⟩,
    ⟨5, 49, 5⟩,
    ⟨10, 49, 19⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 8, 3⟩,
    ⟨40, 7, 20⟩,
    ⟨40, 13, 1⟩,
    ⟨42, 7, 4⟩,
    ⟨42, 49, 3⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 49, 6⟩,
    ⟨50, 8, 3⟩,
    ⟨52, 49, 5⟩]
private def c2 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨3, 49, 7⟩,
    ⟨3, 8, 2⟩,
    ⟨5, 49, 5⟩,
    ⟨6, 48, 9⟩,
    ⟨6, 56, 6⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 48, 9⟩,
    ⟨14, 48, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 48, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 49, 8⟩,
    ⟨50, 8, 1⟩,
    ⟨52, 49, 5⟩]
private def c3 : ShareFlow.Certificate ℕ :=
  .split 48 c1 c2
private def c4 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 49, 1⟩,
    ⟨3, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 49, 6⟩,
    ⟨50, 4, 3⟩,
    ⟨52, 8, 5⟩,
    ⟨56, 4, 4⟩]
private def c5 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 49, 9⟩,
    ⟨6, 48, 9⟩,
    ⟨6, 56, 6⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 48, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 49, 6⟩,
    ⟨50, 8, 3⟩]
private def c6 : ShareFlow.Certificate ℕ :=
  .split 48 c4 c5
private def c7 : ShareFlow.Certificate ℕ :=
  .split 4 c3 c6
private def c8 : ShareFlow.Certificate ℕ :=
  .split 8 c0 c7
private def c9 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 13, 9⟩,
    ⟨0, 49, 1⟩,
    ⟨0, 61, 33⟩,
    ⟨5, 49, 5⟩,
    ⟨8, 49, 15⟩,
    ⟨8, 51, 18⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 51, 4⟩,
    ⟨10, 49, 7⟩,
    ⟨17, 7, 8⟩,
    ⟨17, 2, 3⟩,
    ⟨18, 7, 13⟩,
    ⟨18, 13, 8⟩,
    ⟨20, 13, 14⟩,
    ⟨20, 49, 3⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 17⟩,
    ⟨24, 13, 4⟩,
    ⟨26, 7, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 8⟩,
    ⟨33, 2, 3⟩,
    ⟨34, 7, 13⟩,
    ⟨34, 13, 8⟩,
    ⟨36, 13, 14⟩,
    ⟨36, 49, 3⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 17⟩,
    ⟨40, 13, 4⟩,
    ⟨42, 7, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨52, 49, 5⟩,
    ⟨56, 2, 5⟩]
private def c10 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 13, 9⟩,
    ⟨5, 49, 5⟩,
    ⟨6, 48, 9⟩,
    ⟨8, 49, 15⟩,
    ⟨8, 50, 5⟩,
    ⟨8, 51, 13⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 50, 4⟩,
    ⟨10, 49, 12⟩,
    ⟨12, 48, 9⟩,
    ⟨12, 50, 6⟩,
    ⟨14, 48, 1⟩,
    ⟨17, 7, 8⟩,
    ⟨17, 2, 3⟩,
    ⟨18, 7, 13⟩,
    ⟨18, 13, 8⟩,
    ⟨20, 13, 14⟩,
    ⟨20, 49, 3⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 17⟩,
    ⟨24, 13, 4⟩,
    ⟨26, 7, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 8⟩,
    ⟨33, 2, 3⟩,
    ⟨34, 7, 13⟩,
    ⟨34, 13, 8⟩,
    ⟨36, 13, 14⟩,
    ⟨36, 49, 3⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 17⟩,
    ⟨40, 13, 4⟩,
    ⟨42, 7, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨52, 49, 5⟩]
private def c11 : ShareFlow.Certificate ℕ :=
  .split 48 c9 c10
private def c12 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 49, 1⟩,
    ⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 4, 9⟩,
    ⟨56, 49, 6⟩,
    ⟨56, 2, 3⟩]
private def c13 : ShareFlow.Certificate ℕ :=
  .leaf [⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 48, 9⟩,
    ⟨12, 50, 6⟩,
    ⟨14, 48, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨56, 49, 6⟩,
    ⟨56, 2, 3⟩]
private def c14 : ShareFlow.Certificate ℕ :=
  .split 48 c12 c13
private def c15 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 49, 1⟩,
    ⟨1, 10, 5⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 4, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 4, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨48, 6, 9⟩,
    ⟨48, 10, 5⟩,
    ⟨48, 12, 9⟩,
    ⟨50, 12, 9⟩,
    ⟨52, 10, 5⟩,
    ⟨56, 6, 9⟩]
private def c16 : ShareFlow.Certificate ℕ :=
  .split 8 c14 c15
private def c17 : ShareFlow.Certificate ℕ :=
  .split 4 c11 c16
private def c18 : ShareFlow.Certificate ℕ :=
  .split 2 c8 c17
private def c19 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨0, 13, 9⟩,
    ⟨0, 15, 23⟩,
    ⟨3, 49, 6⟩,
    ⟨3, 32, 3⟩,
    ⟨5, 32, 5⟩,
    ⟨9, 49, 6⟩,
    ⟨9, 32, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 32, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 3⟩,
    ⟨26, 32, 4⟩,
    ⟨28, 13, 3⟩,
    ⟨34, 49, 9⟩,
    ⟨36, 49, 17⟩,
    ⟨40, 49, 9⟩,
    ⟨42, 49, 7⟩,
    ⟨52, 49, 2⟩]
private def c20 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 36, 7⟩,
    ⟨3, 49, 6⟩,
    ⟨3, 32, 3⟩,
    ⟨9, 49, 6⟩,
    ⟨9, 32, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 32, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨34, 49, 9⟩,
    ⟨40, 49, 9⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩,
    ⟨50, 4, 9⟩,
    ⟨56, 4, 9⟩]
private def c21 : ShareFlow.Certificate ℕ :=
  .split 4 c19 c20
private def c22 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨1, 40, 3⟩,
    ⟨3, 8, 5⟩,
    ⟨3, 32, 3⟩,
    ⟨3, 40, 1⟩,
    ⟨5, 49, 2⟩,
    ⟨5, 32, 3⟩,
    ⟨6, 40, 11⟩,
    ⟨10, 49, 19⟩,
    ⟨17, 7, 8⟩,
    ⟨17, 8, 3⟩,
    ⟨18, 7, 13⟩,
    ⟨18, 13, 8⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 8, 3⟩,
    ⟨24, 7, 20⟩,
    ⟨24, 13, 1⟩,
    ⟨26, 7, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨34, 49, 15⟩,
    ⟨34, 57, 6⟩,
    ⟨36, 49, 17⟩,
    ⟨42, 49, 4⟩,
    ⟨50, 8, 5⟩,
    ⟨52, 8, 5⟩]
private def c23 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 8, 5⟩,
    ⟨3, 32, 3⟩,
    ⟨3, 40, 1⟩,
    ⟨5, 32, 5⟩,
    ⟨6, 40, 11⟩,
    ⟨9, 32, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 4, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 4, 2⟩,
    ⟨34, 49, 15⟩,
    ⟨34, 57, 6⟩,
    ⟨42, 49, 4⟩,
    ⟨48, 12, 9⟩,
    ⟨50, 4, 9⟩]
private def c24 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 49, 9⟩,
    ⟨6, 40, 11⟩,
    ⟨10, 49, 19⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨34, 49, 6⟩,
    ⟨34, 1, 3⟩,
    ⟨34, 9, 12⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨50, 4, 9⟩,
    ⟨52, 8, 5⟩,
    ⟨56, 4, 4⟩]
private def c25 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 49, 9⟩,
    ⟨6, 40, 11⟩,
    ⟨6, 48, 4⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 48, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨34, 49, 6⟩,
    ⟨34, 1, 3⟩,
    ⟨34, 9, 12⟩,
    ⟨38, 48, 3⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨50, 4, 2⟩,
    ⟨50, 8, 5⟩,
    ⟨50, 12, 2⟩]
private def c26 : ShareFlow.Certificate ℕ :=
  .split 48 c24 c25
private def c27 : ShareFlow.Certificate ℕ :=
  .split 1 c23 c26
private def c28 : ShareFlow.Certificate ℕ :=
  .split 4 c22 c27
private def c29 : ShareFlow.Certificate ℕ :=
  .split 8 c21 c28
private def c30 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 13, 9⟩,
    ⟨1, 34, 3⟩,
    ⟨5, 49, 2⟩,
    ⟨5, 32, 3⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 32, 3⟩,
    ⟨9, 34, 1⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 34, 11⟩,
    ⟨17, 7, 8⟩,
    ⟨17, 2, 3⟩,
    ⟨18, 7, 13⟩,
    ⟨18, 13, 8⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 32, 3⟩,
    ⟨24, 7, 20⟩,
    ⟨24, 13, 1⟩,
    ⟨26, 7, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨36, 49, 17⟩,
    ⟨40, 49, 15⟩,
    ⟨40, 51, 6⟩,
    ⟨42, 49, 4⟩,
    ⟨52, 2, 5⟩,
    ⟨56, 2, 5⟩]
private def c31 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 32, 3⟩,
    ⟨5, 32, 5⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 32, 3⟩,
    ⟨9, 34, 1⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 34, 11⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 4, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨33, 4, 2⟩,
    ⟨40, 49, 15⟩,
    ⟨40, 51, 6⟩,
    ⟨42, 49, 4⟩,
    ⟨48, 6, 9⟩,
    ⟨56, 2, 5⟩,
    ⟨56, 4, 4⟩]
private def c32 : ShareFlow.Certificate ℕ :=
  .leaf [⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 34, 11⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨40, 49, 6⟩,
    ⟨40, 1, 3⟩,
    ⟨40, 3, 12⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨50, 4, 9⟩,
    ⟨56, 2, 5⟩,
    ⟨56, 4, 4⟩]
private def c33 : ShareFlow.Certificate ℕ :=
  .leaf [⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 34, 11⟩,
    ⟨12, 48, 4⟩,
    ⟨14, 48, 1⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨40, 49, 6⟩,
    ⟨40, 1, 3⟩,
    ⟨40, 3, 12⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨44, 48, 3⟩,
    ⟨56, 2, 5⟩,
    ⟨56, 4, 2⟩,
    ⟨56, 6, 2⟩]
private def c34 : ShareFlow.Certificate ℕ :=
  .split 48 c32 c33
private def c35 : ShareFlow.Certificate ℕ :=
  .split 1 c31 c34
private def c36 : ShareFlow.Certificate ℕ :=
  .split 4 c30 c35
private def c37 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 34, 3⟩,
    ⟨1, 40, 3⟩,
    ⟨1, 42, 12⟩,
    ⟨3, 40, 5⟩,
    ⟨5, 49, 2⟩,
    ⟨5, 32, 3⟩,
    ⟨6, 40, 11⟩,
    ⟨17, 7, 8⟩,
    ⟨17, 2, 3⟩,
    ⟨18, 7, 13⟩,
    ⟨18, 13, 8⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 8, 3⟩,
    ⟨24, 7, 20⟩,
    ⟨24, 13, 1⟩,
    ⟨26, 7, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨36, 49, 17⟩,
    ⟨50, 8, 5⟩,
    ⟨52, 2, 5⟩]
private def c38 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 34, 3⟩,
    ⟨1, 40, 3⟩,
    ⟨1, 42, 12⟩,
    ⟨3, 40, 5⟩,
    ⟨5, 49, 5⟩,
    ⟨6, 40, 11⟩,
    ⟨6, 48, 4⟩,
    ⟨12, 48, 9⟩,
    ⟨12, 50, 6⟩,
    ⟨14, 48, 1⟩,
    ⟨17, 7, 8⟩,
    ⟨17, 2, 3⟩,
    ⟨18, 7, 13⟩,
    ⟨18, 13, 8⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 8, 3⟩,
    ⟨24, 7, 20⟩,
    ⟨24, 13, 1⟩,
    ⟨26, 7, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨36, 49, 14⟩,
    ⟨36, 50, 3⟩,
    ⟨38, 48, 2⟩,
    ⟨38, 56, 1⟩,
    ⟨44, 50, 3⟩,
    ⟨52, 10, 5⟩]
private def c39 : ShareFlow.Certificate ℕ :=
  .split 48 c37 c38
private def c40 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 34, 3⟩,
    ⟨1, 36, 7⟩,
    ⟨1, 40, 3⟩,
    ⟨1, 42, 5⟩,
    ⟨3, 40, 9⟩,
    ⟨9, 34, 3⟩,
    ⟨17, 7, 11⟩,
    ⟨18, 7, 10⟩,
    ⟨18, 13, 11⟩,
    ⟨20, 13, 17⟩,
    ⟨22, 13, 3⟩,
    ⟨24, 7, 21⟩,
    ⟨26, 4, 7⟩,
    ⟨28, 13, 3⟩,
    ⟨48, 6, 9⟩,
    ⟨48, 10, 5⟩,
    ⟨48, 12, 9⟩,
    ⟨50, 12, 9⟩,
    ⟨52, 10, 5⟩,
    ⟨56, 6, 9⟩]
private def c41 : ShareFlow.Certificate ℕ :=
  .split 4 c39 c40
private def c42 : ShareFlow.Certificate ℕ :=
  .split 8 c36 c41
private def c43 : ShareFlow.Certificate ℕ :=
  .split 2 c29 c42
private def c44 : ShareFlow.Certificate ℕ :=
  .split 32 c18 c43
private def c45 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨0, 13, 9⟩,
    ⟨0, 15, 23⟩,
    ⟨3, 49, 6⟩,
    ⟨3, 16, 3⟩,
    ⟨5, 16, 5⟩,
    ⟨9, 49, 6⟩,
    ⟨9, 16, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 16, 1⟩,
    ⟨18, 49, 9⟩,
    ⟨20, 49, 17⟩,
    ⟨24, 49, 9⟩,
    ⟨26, 49, 7⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 16, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨52, 49, 2⟩]
private def c46 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 20, 7⟩,
    ⟨3, 49, 6⟩,
    ⟨3, 16, 3⟩,
    ⟨9, 49, 6⟩,
    ⟨9, 16, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 16, 1⟩,
    ⟨18, 49, 9⟩,
    ⟨24, 49, 9⟩,
    ⟨26, 49, 7⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 4, 9⟩,
    ⟨56, 4, 9⟩]
private def c47 : ShareFlow.Certificate ℕ :=
  .split 4 c45 c46
private def c48 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨1, 24, 3⟩,
    ⟨3, 8, 5⟩,
    ⟨3, 16, 3⟩,
    ⟨3, 24, 1⟩,
    ⟨5, 49, 2⟩,
    ⟨5, 16, 3⟩,
    ⟨6, 24, 11⟩,
    ⟨10, 49, 19⟩,
    ⟨18, 49, 11⟩,
    ⟨18, 57, 10⟩,
    ⟨20, 49, 17⟩,
    ⟨33, 7, 8⟩,
    ⟨33, 8, 3⟩,
    ⟨34, 7, 13⟩,
    ⟨34, 13, 8⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 8, 3⟩,
    ⟨40, 7, 20⟩,
    ⟨40, 13, 1⟩,
    ⟨42, 7, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 49, 4⟩,
    ⟨50, 8, 5⟩,
    ⟨52, 8, 5⟩]
private def c49 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 8, 5⟩,
    ⟨3, 16, 3⟩,
    ⟨3, 24, 1⟩,
    ⟨5, 16, 5⟩,
    ⟨6, 24, 11⟩,
    ⟨9, 16, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨17, 4, 2⟩,
    ⟨18, 49, 15⟩,
    ⟨18, 57, 6⟩,
    ⟨26, 49, 4⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 4, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨48, 12, 9⟩,
    ⟨50, 4, 9⟩]
private def c50 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 49, 9⟩,
    ⟨6, 24, 11⟩,
    ⟨10, 49, 19⟩,
    ⟨18, 49, 6⟩,
    ⟨18, 1, 3⟩,
    ⟨18, 9, 12⟩,
    ⟨26, 49, 7⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 4, 9⟩,
    ⟨52, 8, 5⟩,
    ⟨56, 4, 4⟩]
private def c51 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 49, 9⟩,
    ⟨6, 24, 11⟩,
    ⟨6, 48, 4⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 48, 1⟩,
    ⟨18, 49, 6⟩,
    ⟨18, 1, 3⟩,
    ⟨18, 9, 12⟩,
    ⟨22, 48, 3⟩,
    ⟨26, 49, 7⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 4, 2⟩,
    ⟨50, 8, 5⟩,
    ⟨50, 12, 2⟩]
private def c52 : ShareFlow.Certificate ℕ :=
  .split 48 c50 c51
private def c53 : ShareFlow.Certificate ℕ :=
  .split 1 c49 c52
private def c54 : ShareFlow.Certificate ℕ :=
  .split 4 c48 c53
private def c55 : ShareFlow.Certificate ℕ :=
  .split 8 c47 c54
private def c56 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 13, 9⟩,
    ⟨1, 18, 3⟩,
    ⟨5, 49, 2⟩,
    ⟨5, 16, 3⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 18, 1⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨20, 49, 17⟩,
    ⟨24, 49, 11⟩,
    ⟨24, 51, 10⟩,
    ⟨33, 7, 8⟩,
    ⟨33, 2, 3⟩,
    ⟨34, 7, 13⟩,
    ⟨34, 13, 8⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 16, 3⟩,
    ⟨40, 7, 20⟩,
    ⟨40, 13, 1⟩,
    ⟨42, 7, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨52, 2, 5⟩,
    ⟨56, 49, 4⟩,
    ⟨56, 2, 5⟩]
private def c57 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 16, 3⟩,
    ⟨5, 16, 5⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 18, 1⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨17, 4, 2⟩,
    ⟨24, 49, 15⟩,
    ⟨24, 51, 6⟩,
    ⟨26, 49, 4⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 4, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨48, 6, 9⟩,
    ⟨56, 2, 5⟩,
    ⟨56, 4, 4⟩]
private def c58 : ShareFlow.Certificate ℕ :=
  .leaf [⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨24, 49, 6⟩,
    ⟨24, 1, 3⟩,
    ⟨24, 3, 12⟩,
    ⟨26, 49, 7⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 4, 9⟩,
    ⟨56, 2, 5⟩,
    ⟨56, 4, 4⟩]
private def c59 : ShareFlow.Certificate ℕ :=
  .leaf [⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨12, 48, 4⟩,
    ⟨14, 48, 1⟩,
    ⟨24, 49, 6⟩,
    ⟨24, 1, 3⟩,
    ⟨24, 3, 12⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 48, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 1, 4⟩,
    ⟨44, 13, 3⟩,
    ⟨56, 2, 5⟩,
    ⟨56, 4, 2⟩,
    ⟨56, 6, 2⟩]
private def c60 : ShareFlow.Certificate ℕ :=
  .split 48 c58 c59
private def c61 : ShareFlow.Certificate ℕ :=
  .split 1 c57 c60
private def c62 : ShareFlow.Certificate ℕ :=
  .split 4 c56 c61
private def c63 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 18, 3⟩,
    ⟨1, 24, 3⟩,
    ⟨1, 26, 12⟩,
    ⟨3, 24, 5⟩,
    ⟨5, 49, 2⟩,
    ⟨5, 16, 3⟩,
    ⟨6, 24, 11⟩,
    ⟨20, 49, 17⟩,
    ⟨33, 7, 8⟩,
    ⟨33, 2, 3⟩,
    ⟨34, 7, 13⟩,
    ⟨34, 13, 8⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 8, 3⟩,
    ⟨40, 7, 20⟩,
    ⟨40, 13, 1⟩,
    ⟨42, 7, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨50, 8, 5⟩,
    ⟨52, 2, 5⟩]
private def c64 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 18, 3⟩,
    ⟨1, 24, 3⟩,
    ⟨1, 26, 12⟩,
    ⟨3, 24, 5⟩,
    ⟨5, 49, 5⟩,
    ⟨6, 24, 11⟩,
    ⟨6, 48, 4⟩,
    ⟨12, 48, 9⟩,
    ⟨12, 50, 6⟩,
    ⟨14, 48, 1⟩,
    ⟨20, 49, 14⟩,
    ⟨20, 50, 3⟩,
    ⟨22, 48, 2⟩,
    ⟨22, 56, 1⟩,
    ⟨28, 50, 3⟩,
    ⟨33, 7, 8⟩,
    ⟨33, 2, 3⟩,
    ⟨34, 7, 13⟩,
    ⟨34, 13, 8⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 8, 3⟩,
    ⟨40, 7, 20⟩,
    ⟨40, 13, 1⟩,
    ⟨42, 7, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨52, 10, 5⟩]
private def c65 : ShareFlow.Certificate ℕ :=
  .split 48 c63 c64
private def c66 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 18, 3⟩,
    ⟨1, 20, 7⟩,
    ⟨1, 24, 3⟩,
    ⟨1, 26, 5⟩,
    ⟨3, 24, 9⟩,
    ⟨9, 18, 3⟩,
    ⟨33, 7, 11⟩,
    ⟨34, 7, 10⟩,
    ⟨34, 13, 11⟩,
    ⟨36, 13, 17⟩,
    ⟨38, 13, 3⟩,
    ⟨40, 7, 21⟩,
    ⟨42, 4, 7⟩,
    ⟨44, 13, 3⟩,
    ⟨48, 6, 9⟩,
    ⟨48, 10, 5⟩,
    ⟨48, 12, 9⟩,
    ⟨50, 12, 9⟩,
    ⟨52, 10, 5⟩,
    ⟨56, 6, 9⟩]
private def c67 : ShareFlow.Certificate ℕ :=
  .split 4 c65 c66
private def c68 : ShareFlow.Certificate ℕ :=
  .split 8 c62 c67
private def c69 : ShareFlow.Certificate ℕ :=
  .split 2 c55 c68
private def c70 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨0, 13, 9⟩,
    ⟨0, 15, 23⟩,
    ⟨3, 49, 3⟩,
    ⟨3, 16, 3⟩,
    ⟨3, 32, 3⟩,
    ⟨5, 16, 5⟩,
    ⟨6, 48, 9⟩,
    ⟨9, 49, 3⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 32, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 48, 9⟩,
    ⟨14, 16, 1⟩,
    ⟨18, 49, 12⟩,
    ⟨20, 49, 17⟩,
    ⟨24, 49, 12⟩,
    ⟨26, 49, 7⟩,
    ⟨36, 49, 2⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 16, 4⟩]
private def c71 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 20, 7⟩,
    ⟨1, 36, 7⟩,
    ⟨3, 49, 3⟩,
    ⟨3, 16, 3⟩,
    ⟨3, 32, 3⟩,
    ⟨6, 48, 9⟩,
    ⟨9, 49, 3⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 32, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 48, 9⟩,
    ⟨14, 16, 1⟩,
    ⟨24, 49, 12⟩,
    ⟨26, 49, 7⟩,
    ⟨34, 49, 12⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩]
private def c72 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 18, 3⟩,
    ⟨1, 20, 7⟩,
    ⟨1, 36, 7⟩,
    ⟨3, 32, 3⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 18, 6⟩,
    ⟨10, 49, 16⟩,
    ⟨10, 36, 3⟩,
    ⟨12, 18, 11⟩,
    ⟨12, 48, 4⟩,
    ⟨14, 32, 1⟩,
    ⟨24, 49, 6⟩,
    ⟨24, 36, 5⟩,
    ⟨24, 50, 5⟩,
    ⟨24, 51, 5⟩,
    ⟨26, 49, 5⟩,
    ⟨26, 36, 2⟩,
    ⟨28, 50, 3⟩,
    ⟨40, 49, 3⟩,
    ⟨40, 22, 18⟩,
    ⟨42, 4, 7⟩,
    ⟨56, 49, 6⟩,
    ⟨56, 51, 3⟩]
private def c73 : ShareFlow.Certificate ℕ :=
  .split 18 c71 c72
private def c74 : ShareFlow.Certificate ℕ :=
  .split 4 c70 c73
private def c75 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 7, 9⟩,
    ⟨3, 8, 5⟩,
    ⟨3, 16, 3⟩,
    ⟨3, 24, 1⟩,
    ⟨5, 16, 5⟩,
    ⟨6, 24, 11⟩,
    ⟨6, 40, 4⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 32, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 48, 9⟩,
    ⟨14, 32, 1⟩,
    ⟨18, 49, 6⟩,
    ⟨18, 40, 5⟩,
    ⟨18, 57, 10⟩,
    ⟨20, 49, 17⟩,
    ⟨22, 32, 3⟩,
    ⟨34, 49, 9⟩,
    ⟨36, 49, 2⟩,
    ⟨38, 8, 3⟩]
private def c76 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 8, 5⟩,
    ⟨3, 24, 4⟩,
    ⟨5, 49, 1⟩,
    ⟨5, 16, 4⟩,
    ⟨6, 24, 11⟩,
    ⟨6, 40, 4⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 48, 9⟩,
    ⟨14, 32, 1⟩,
    ⟨18, 49, 6⟩,
    ⟨18, 1, 3⟩,
    ⟨18, 9, 12⟩,
    ⟨20, 49, 14⟩,
    ⟨20, 1, 3⟩,
    ⟨22, 32, 3⟩,
    ⟨26, 49, 7⟩,
    ⟨34, 1, 3⟩,
    ⟨34, 9, 17⟩,
    ⟨34, 24, 1⟩,
    ⟨36, 49, 4⟩,
    ⟨36, 1, 7⟩,
    ⟨38, 8, 3⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 16, 4⟩,
    ⟨50, 49, 9⟩]
private def c77 : ShareFlow.Certificate ℕ :=
  .split 1 c75 c76
private def c78 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 8, 5⟩,
    ⟨3, 16, 3⟩,
    ⟨3, 24, 1⟩,
    ⟨5, 16, 5⟩,
    ⟨6, 24, 11⟩,
    ⟨6, 40, 4⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 32, 3⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 32, 1⟩,
    ⟨17, 4, 2⟩,
    ⟨18, 49, 6⟩,
    ⟨18, 36, 9⟩,
    ⟨18, 40, 5⟩,
    ⟨18, 44, 1⟩,
    ⟨22, 40, 3⟩,
    ⟨26, 49, 7⟩,
    ⟨33, 4, 7⟩,
    ⟨34, 12, 6⟩,
    ⟨34, 28, 15⟩,
    ⟨38, 24, 3⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 20, 1⟩,
    ⟨50, 49, 9⟩]
private def c79 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 49, 9⟩,
    ⟨6, 24, 11⟩,
    ⟨6, 40, 4⟩,
    ⟨10, 49, 19⟩,
    ⟨14, 32, 1⟩,
    ⟨18, 49, 6⟩,
    ⟨18, 1, 3⟩,
    ⟨18, 9, 12⟩,
    ⟨22, 32, 3⟩,
    ⟨26, 49, 7⟩,
    ⟨34, 1, 3⟩,
    ⟨34, 9, 17⟩,
    ⟨34, 12, 1⟩,
    ⟨38, 8, 3⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 2⟩,
    ⟨42, 16, 2⟩,
    ⟨50, 4, 6⟩,
    ⟨50, 8, 3⟩]
private def c80 : ShareFlow.Certificate ℕ :=
  .split 1 c78 c79
private def c81 : ShareFlow.Certificate ℕ :=
  .split 4 c77 c80
private def c82 : ShareFlow.Certificate ℕ :=
  .split 8 c74 c81
private def c83 : ShareFlow.Certificate ℕ :=
  .leaf [⟨0, 13, 9⟩,
    ⟨3, 16, 3⟩,
    ⟨3, 32, 3⟩,
    ⟨5, 16, 5⟩,
    ⟨6, 48, 9⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 18, 1⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨12, 34, 4⟩,
    ⟨14, 32, 1⟩,
    ⟨20, 49, 17⟩,
    ⟨24, 49, 6⟩,
    ⟨24, 34, 5⟩,
    ⟨24, 51, 10⟩,
    ⟨28, 32, 3⟩,
    ⟨36, 49, 2⟩,
    ⟨40, 49, 9⟩,
    ⟨44, 2, 3⟩]
private def c84 : ShareFlow.Certificate ℕ :=
  .leaf [⟨5, 49, 1⟩,
    ⟨5, 16, 4⟩,
    ⟨6, 48, 9⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 18, 4⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨12, 34, 4⟩,
    ⟨14, 32, 1⟩,
    ⟨20, 49, 14⟩,
    ⟨20, 1, 3⟩,
    ⟨24, 49, 6⟩,
    ⟨24, 1, 3⟩,
    ⟨24, 3, 12⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 32, 3⟩,
    ⟨36, 49, 4⟩,
    ⟨36, 1, 7⟩,
    ⟨40, 1, 3⟩,
    ⟨40, 3, 17⟩,
    ⟨40, 18, 1⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 16, 4⟩,
    ⟨44, 2, 3⟩,
    ⟨56, 49, 9⟩]
private def c85 : ShareFlow.Certificate ℕ :=
  .split 1 c83 c84
private def c86 : ShareFlow.Certificate ℕ :=
  .leaf [⟨3, 16, 3⟩,
    ⟨3, 32, 3⟩,
    ⟨5, 16, 5⟩,
    ⟨9, 2, 5⟩,
    ⟨9, 16, 3⟩,
    ⟨9, 18, 1⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨12, 34, 4⟩,
    ⟨14, 32, 1⟩,
    ⟨17, 4, 2⟩,
    ⟨24, 49, 6⟩,
    ⟨24, 34, 5⟩,
    ⟨24, 36, 9⟩,
    ⟨24, 38, 1⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 34, 3⟩,
    ⟨33, 4, 7⟩,
    ⟨40, 6, 6⟩,
    ⟨40, 22, 15⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 20, 4⟩,
    ⟨56, 49, 9⟩]
private def c87 : ShareFlow.Certificate ℕ :=
  .leaf [⟨9, 49, 9⟩,
    ⟨10, 49, 19⟩,
    ⟨12, 18, 11⟩,
    ⟨12, 34, 4⟩,
    ⟨14, 32, 1⟩,
    ⟨24, 49, 6⟩,
    ⟨24, 1, 3⟩,
    ⟨24, 3, 12⟩,
    ⟨26, 49, 7⟩,
    ⟨28, 32, 3⟩,
    ⟨40, 1, 3⟩,
    ⟨40, 3, 17⟩,
    ⟨40, 6, 1⟩,
    ⟨42, 49, 3⟩,
    ⟨42, 4, 4⟩,
    ⟨44, 2, 1⟩,
    ⟨44, 16, 2⟩,
    ⟨56, 2, 5⟩,
    ⟨56, 4, 4⟩]
private def c88 : ShareFlow.Certificate ℕ :=
  .split 1 c86 c87
private def c89 : ShareFlow.Certificate ℕ :=
  .split 4 c85 c88
private def c90 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 18, 3⟩,
    ⟨1, 24, 3⟩,
    ⟨1, 26, 12⟩,
    ⟨3, 24, 5⟩,
    ⟨3, 32, 3⟩,
    ⟨3, 40, 1⟩,
    ⟨5, 16, 5⟩,
    ⟨6, 24, 11⟩,
    ⟨6, 40, 4⟩,
    ⟨9, 32, 3⟩,
    ⟨9, 34, 6⟩,
    ⟨12, 34, 7⟩,
    ⟨12, 48, 8⟩,
    ⟨14, 48, 1⟩,
    ⟨20, 49, 14⟩,
    ⟨20, 34, 3⟩,
    ⟨22, 32, 3⟩,
    ⟨28, 32, 1⟩,
    ⟨28, 34, 2⟩,
    ⟨33, 10, 10⟩,
    ⟨36, 18, 3⟩,
    ⟨36, 26, 14⟩,
    ⟨38, 24, 3⟩,
    ⟨44, 18, 3⟩,
    ⟨52, 49, 5⟩]
private def c91 : ShareFlow.Certificate ℕ :=
  .leaf [⟨1, 10, 5⟩,
    ⟨1, 20, 2⟩,
    ⟨1, 24, 3⟩,
    ⟨1, 26, 5⟩,
    ⟨1, 42, 8⟩,
    ⟨3, 24, 9⟩,
    ⟨5, 32, 5⟩,
    ⟨9, 18, 3⟩,
    ⟨9, 32, 3⟩,
    ⟨9, 34, 3⟩,
    ⟨17, 2, 3⟩,
    ⟨17, 4, 5⟩,
    ⟨33, 2, 3⟩,
    ⟨33, 4, 2⟩,
    ⟨33, 10, 6⟩]
private def c92 : ShareFlow.Certificate ℕ :=
  .split 4 c90 c91
private def c93 : ShareFlow.Certificate ℕ :=
  .split 8 c89 c92
private def c94 : ShareFlow.Certificate ℕ :=
  .split 2 c82 c93
private def c95 : ShareFlow.Certificate ℕ :=
  .split 32 c69 c94
private def c96 : ShareFlow.Certificate ℕ :=
  .split 16 c44 c95

private theorem checked0 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) ({2, 8, 16, 32}) c0 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked1 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 57, 61, 63}) ({2, 4, 16, 32, 48}) c1 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked2 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 48, 49, 55, 56, 57, 61, 63}) ({2, 4, 16, 32}) c2 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked3 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 57, 61, 63}) ({2, 4, 16, 32}) c3 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({2, 4, 16, 32} : Finset ℕ) = {2, 4, 16, 32, 48} := by decide +kernel
    rw [he]
    exact checked1
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 13, 15, 57, 61, 63}) 48 = {8, 13, 15, 48, 49, 55, 56, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked2
private theorem checked4 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 53, 55, 57, 61, 63}) ({2, 16, 32, 48}) c4 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked5 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63}) ({2, 16, 32}) c5 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked6 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 53, 55, 57, 61, 63}) ({2, 16, 32}) c6 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({2, 16, 32} : Finset ℕ) = {2, 16, 32, 48} := by decide +kernel
    rw [he]
    exact checked4
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 8, 12, 13, 15, 53, 55, 57, 61, 63}) 48 = {4, 7, 8, 12, 13, 15, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63} := by decide +kernel
    rw [hf]
    exact checked5
private theorem checked7 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 57, 61, 63}) ({2, 16, 32}) c7 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2, 16, 32} : Finset ℕ) = {2, 4, 16, 32} := by decide +kernel
    rw [he]
    exact checked3
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 13, 15, 57, 61, 63}) 4 = {4, 7, 8, 12, 13, 15, 53, 55, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked6
private theorem checked8 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) ({2, 16, 32}) c8 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({2, 16, 32} : Finset ℕ) = {2, 8, 16, 32} := by decide +kernel
    rw [he]
    exact checked0
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 8 = {8, 13, 15, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked7
private theorem checked9 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 51, 55, 63}) ({4, 16, 32, 48}) c9 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked10 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 48, 49, 50, 51, 55, 61, 63}) ({4, 16, 32}) c10 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked11 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 51, 55, 63}) ({4, 16, 32}) c11 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({4, 16, 32} : Finset ℕ) = {4, 16, 32, 48} := by decide +kernel
    rw [he]
    exact checked9
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 51, 55, 63}) 48 = {2, 7, 15, 48, 49, 50, 51, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked10
private theorem checked12 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 51, 53, 55, 61, 63}) ({8, 16, 32, 48}) c12 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked13 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) ({8, 16, 32}) c13 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked14 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 51, 53, 55, 61, 63}) ({8, 16, 32}) c14 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({8, 16, 32} : Finset ℕ) = {8, 16, 32, 48} := by decide +kernel
    rw [he]
    exact checked12
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 51, 53, 55, 61, 63}) 48 = {2, 4, 6, 7, 13, 15, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked13
private theorem checked15 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 51, 53, 55, 57, 59, 61, 63}) ({16, 32}) c15 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked16 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 51, 53, 55, 61, 63}) ({16, 32}) c16 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({16, 32} : Finset ℕ) = {8, 16, 32} := by decide +kernel
    rw [he]
    exact checked14
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 51, 53, 55, 61, 63}) 8 = {2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 51, 53, 55, 57, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked15
private theorem checked17 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 51, 55, 63}) ({16, 32}) c17 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({16, 32} : Finset ℕ) = {4, 16, 32} := by decide +kernel
    rw [he]
    exact checked11
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 51, 55, 63}) 4 = {2, 4, 6, 7, 13, 15, 51, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked16
private theorem checked18 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) ({16, 32}) c18 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 ({16, 32} : Finset ℕ) = {2, 16, 32} := by decide +kernel
    rw [he]
    exact checked8
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 2 = {2, 7, 15, 51, 55, 63} := by decide +kernel
    rw [hf]
    exact checked17
private theorem checked19 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({32, 39, 45, 47, 49, 55, 61, 63}) ({2, 4, 8, 16}) c19 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked20 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 13, 15, 32, 36, 39, 45, 47, 49, 53, 55, 61, 63}) ({2, 8, 16}) c20 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked21 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({32, 39, 45, 47, 49, 55, 61, 63}) ({2, 8, 16}) c21 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2, 8, 16} : Finset ℕ) = {2, 4, 8, 16} := by decide +kernel
    rw [he]
    exact checked19
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({32, 39, 45, 47, 49, 55, 61, 63}) 4 = {4, 7, 13, 15, 32, 36, 39, 45, 47, 49, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked20
private theorem checked22 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 32, 39, 40, 45, 47, 49, 55, 57, 61, 63}) ({2, 4, 16}) c22 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked23 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 32, 36, 39, 40, 44, 45, 47, 49, 53, 55, 57, 61, 63}) ({1, 2, 16}) c23 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked24 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 8, 9, 12, 13, 15, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 49, 53, 55, 57, 61, 63}) ({2, 16, 48}) c24 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked25 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 8, 9, 12, 13, 15, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63}) ({2, 16}) c25 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked26 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 8, 9, 12, 13, 15, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 49, 53, 55, 57, 61, 63}) ({2, 16}) c26 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({2, 16} : Finset ℕ) = {2, 16, 48} := by decide +kernel
    rw [he]
    exact checked24
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 4, 5, 7, 8, 9, 12, 13, 15, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 49, 53, 55, 57, 61, 63}) 48 = {1, 4, 5, 7, 8, 9, 12, 13, 15, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63} := by decide +kernel
    rw [hf]
    exact checked25
private theorem checked27 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 32, 36, 39, 40, 44, 45, 47, 49, 53, 55, 57, 61, 63}) ({2, 16}) c27 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({2, 16} : Finset ℕ) = {1, 2, 16} := by decide +kernel
    rw [he]
    exact checked23
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 8, 12, 13, 15, 32, 36, 39, 40, 44, 45, 47, 49, 53, 55, 57, 61, 63}) 1 = {1, 4, 5, 7, 8, 9, 12, 13, 15, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 49, 53, 55, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked26
private theorem checked28 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 32, 39, 40, 45, 47, 49, 55, 57, 61, 63}) ({2, 16}) c28 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2, 16} : Finset ℕ) = {2, 4, 16} := by decide +kernel
    rw [he]
    exact checked22
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 13, 15, 32, 39, 40, 45, 47, 49, 55, 57, 61, 63}) 4 = {4, 7, 8, 12, 13, 15, 32, 36, 39, 40, 44, 45, 47, 49, 53, 55, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked27
private theorem checked29 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({32, 39, 45, 47, 49, 55, 61, 63}) ({2, 16}) c29 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({2, 16} : Finset ℕ) = {2, 8, 16} := by decide +kernel
    rw [he]
    exact checked21
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({32, 39, 45, 47, 49, 55, 61, 63}) 8 = {8, 13, 15, 32, 39, 40, 45, 47, 49, 55, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked28
private theorem checked30 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 32, 34, 39, 45, 47, 49, 51, 55, 61, 63}) ({4, 8, 16}) c30 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked31 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 32, 34, 36, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63}) ({1, 8, 16}) c31 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked32 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 13, 15, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63}) ({8, 16, 48}) c32 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked33 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 13, 15, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) ({8, 16}) c33 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked34 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 13, 15, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63}) ({8, 16}) c34 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({8, 16} : Finset ℕ) = {8, 16, 48} := by decide +kernel
    rw [he]
    exact checked32
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 2, 3, 4, 5, 6, 7, 13, 15, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63}) 48 = {1, 2, 3, 4, 5, 6, 7, 13, 15, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked33
private theorem checked35 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 32, 34, 36, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63}) ({8, 16}) c35 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({8, 16} : Finset ℕ) = {1, 8, 16} := by decide +kernel
    rw [he]
    exact checked31
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 32, 34, 36, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63}) 1 = {1, 2, 3, 4, 5, 6, 7, 13, 15, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked34
private theorem checked36 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 32, 34, 39, 45, 47, 49, 51, 55, 61, 63}) ({8, 16}) c36 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({8, 16} : Finset ℕ) = {4, 8, 16} := by decide +kernel
    rw [he]
    exact checked30
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 32, 34, 39, 45, 47, 49, 51, 55, 61, 63}) 4 = {2, 4, 6, 7, 13, 15, 32, 34, 36, 38, 39, 45, 47, 49, 51, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked35
private theorem checked37 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 49, 51, 55, 57, 59, 61, 63}) ({4, 16, 48}) c37 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked38 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63}) ({4, 16}) c38 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked39 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 49, 51, 55, 57, 59, 61, 63}) ({4, 16}) c39 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({4, 16} : Finset ℕ) = {4, 16, 48} := by decide +kernel
    rw [he]
    exact checked37
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 49, 51, 55, 57, 59, 61, 63}) 48 = {2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked38
private theorem checked40 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 32, 34, 36, 38, 39, 40, 42, 44, 45, 46, 47, 49, 51, 53, 55, 57, 59, 61, 63}) ({16}) c40 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked41 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 49, 51, 55, 57, 59, 61, 63}) ({16}) c41 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({16} : Finset ℕ) = {4, 16} := by decide +kernel
    rw [he]
    exact checked39
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 49, 51, 55, 57, 59, 61, 63}) 4 = {2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 32, 34, 36, 38, 39, 40, 42, 44, 45, 46, 47, 49, 51, 53, 55, 57, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked40
private theorem checked42 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 32, 34, 39, 45, 47, 49, 51, 55, 61, 63}) ({16}) c42 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({16} : Finset ℕ) = {8, 16} := by decide +kernel
    rw [he]
    exact checked36
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 32, 34, 39, 45, 47, 49, 51, 55, 61, 63}) 8 = {2, 7, 8, 10, 13, 15, 32, 34, 39, 40, 42, 45, 47, 49, 51, 55, 57, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked41
private theorem checked43 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({32, 39, 45, 47, 49, 55, 61, 63}) ({16}) c43 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 ({16} : Finset ℕ) = {2, 16} := by decide +kernel
    rw [he]
    exact checked29
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({32, 39, 45, 47, 49, 55, 61, 63}) 2 = {2, 7, 15, 32, 34, 39, 45, 47, 49, 51, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked42
private theorem checked44 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) ({16}) c44 = true := by
  apply ShareFlow.check_split
  · have he : insert 32 ({16} : Finset ℕ) = {16, 32} := by decide +kernel
    rw [he]
    exact checked18
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 32 = {32, 39, 45, 47, 49, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked43
private theorem checked45 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 49, 55, 61, 63}) ({2, 4, 8, 32}) c45 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked46 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 13, 15, 16, 20, 23, 29, 31, 49, 53, 55, 61, 63}) ({2, 8, 32}) c46 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked47 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 49, 55, 61, 63}) ({2, 8, 32}) c47 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2, 8, 32} : Finset ℕ) = {2, 4, 8, 32} := by decide +kernel
    rw [he]
    exact checked45
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 29, 31, 49, 55, 61, 63}) 4 = {4, 7, 13, 15, 16, 20, 23, 29, 31, 49, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked46
private theorem checked48 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 16, 23, 24, 29, 31, 49, 55, 57, 61, 63}) ({2, 4, 32}) c48 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked49 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 49, 53, 55, 57, 61, 63}) ({1, 2, 32}) c49 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked50 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 49, 53, 55, 57, 61, 63}) ({2, 32, 48}) c50 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked51 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63}) ({2, 32}) c51 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked52 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 49, 53, 55, 57, 61, 63}) ({2, 32}) c52 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({2, 32} : Finset ℕ) = {2, 32, 48} := by decide +kernel
    rw [he]
    exact checked50
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 49, 53, 55, 57, 61, 63}) 48 = {1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63} := by decide +kernel
    rw [hf]
    exact checked51
private theorem checked53 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 49, 53, 55, 57, 61, 63}) ({2, 32}) c53 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({2, 32} : Finset ℕ) = {1, 2, 32} := by decide +kernel
    rw [he]
    exact checked49
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 49, 53, 55, 57, 61, 63}) 1 = {1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 49, 53, 55, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked52
private theorem checked54 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 16, 23, 24, 29, 31, 49, 55, 57, 61, 63}) ({2, 32}) c54 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2, 32} : Finset ℕ) = {2, 4, 32} := by decide +kernel
    rw [he]
    exact checked48
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 13, 15, 16, 23, 24, 29, 31, 49, 55, 57, 61, 63}) 4 = {4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 49, 53, 55, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked53
private theorem checked55 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 49, 55, 61, 63}) ({2, 32}) c55 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({2, 32} : Finset ℕ) = {2, 8, 32} := by decide +kernel
    rw [he]
    exact checked47
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 29, 31, 49, 55, 61, 63}) 8 = {8, 13, 15, 16, 23, 24, 29, 31, 49, 55, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked54
private theorem checked56 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 16, 18, 23, 29, 31, 49, 51, 55, 61, 63}) ({4, 8, 32}) c56 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked57 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63}) ({1, 8, 32}) c57 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked58 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63}) ({8, 32, 48}) c58 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked59 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) ({8, 32}) c59 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked60 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63}) ({8, 32}) c60 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({8, 32} : Finset ℕ) = {8, 32, 48} := by decide +kernel
    rw [he]
    exact checked58
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63}) 48 = {1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked59
private theorem checked61 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63}) ({8, 32}) c61 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({8, 32} : Finset ℕ) = {1, 8, 32} := by decide +kernel
    rw [he]
    exact checked57
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63}) 1 = {1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked60
private theorem checked62 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 16, 18, 23, 29, 31, 49, 51, 55, 61, 63}) ({8, 32}) c62 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({8, 32} : Finset ℕ) = {4, 8, 32} := by decide +kernel
    rw [he]
    exact checked56
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 16, 18, 23, 29, 31, 49, 51, 55, 61, 63}) 4 = {2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 49, 51, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked61
private theorem checked63 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 49, 51, 55, 57, 59, 61, 63}) ({4, 32, 48}) c63 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked64 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63}) ({4, 32}) c64 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked65 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 49, 51, 55, 57, 59, 61, 63}) ({4, 32}) c65 = true := by
  apply ShareFlow.check_split
  · have he : insert 48 ({4, 32} : Finset ℕ) = {4, 32, 48} := by decide +kernel
    rw [he]
    exact checked63
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 49, 51, 55, 57, 59, 61, 63}) 48 = {2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked64
private theorem checked66 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16, 18, 20, 22, 23, 24, 26, 28, 29, 30, 31, 49, 51, 53, 55, 57, 59, 61, 63}) ({32}) c66 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked67 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 49, 51, 55, 57, 59, 61, 63}) ({32}) c67 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({32} : Finset ℕ) = {4, 32} := by decide +kernel
    rw [he]
    exact checked65
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 49, 51, 55, 57, 59, 61, 63}) 4 = {2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16, 18, 20, 22, 23, 24, 26, 28, 29, 30, 31, 49, 51, 53, 55, 57, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked66
private theorem checked68 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 16, 18, 23, 29, 31, 49, 51, 55, 61, 63}) ({32}) c68 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({32} : Finset ℕ) = {8, 32} := by decide +kernel
    rw [he]
    exact checked62
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 16, 18, 23, 29, 31, 49, 51, 55, 61, 63}) 8 = {2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 49, 51, 55, 57, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked67
private theorem checked69 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 49, 55, 61, 63}) ({32}) c69 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 ({32} : Finset ℕ) = {2, 32} := by decide +kernel
    rw [he]
    exact checked55
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 29, 31, 49, 55, 61, 63}) 2 = {2, 7, 15, 16, 18, 23, 29, 31, 49, 51, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked68
private theorem checked70 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63}) ({2, 4, 8}) c70 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked71 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 13, 15, 16, 20, 23, 29, 31, 32, 36, 39, 45, 47, 48, 49, 52, 53, 55, 61, 63}) ({2, 8, 18}) c71 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked72 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 32, 36, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) ({2, 8}) c72 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked73 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 13, 15, 16, 20, 23, 29, 31, 32, 36, 39, 45, 47, 48, 49, 52, 53, 55, 61, 63}) ({2, 8}) c73 = true := by
  apply ShareFlow.check_split
  · have he : insert 18 ({2, 8} : Finset ℕ) = {2, 8, 18} := by decide +kernel
    rw [he]
    exact checked71
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 13, 15, 16, 20, 23, 29, 31, 32, 36, 39, 45, 47, 48, 49, 52, 53, 55, 61, 63}) 18 = {4, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 32, 36, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked72
private theorem checked74 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63}) ({2, 8}) c74 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2, 8} : Finset ℕ) = {2, 4, 8} := by decide +kernel
    rw [he]
    exact checked70
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63}) 4 = {4, 7, 13, 15, 16, 20, 23, 29, 31, 32, 36, 39, 45, 47, 48, 49, 52, 53, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked73
private theorem checked75 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 16, 23, 24, 29, 31, 32, 39, 40, 45, 47, 48, 49, 55, 56, 57, 61, 63}) ({1, 2, 4}) c75 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked76 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 7, 8, 9, 13, 15, 16, 17, 23, 24, 25, 29, 31, 32, 33, 39, 40, 41, 45, 47, 48, 49, 55, 56, 57, 61, 63}) ({2, 4}) c76 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked77 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 16, 23, 24, 29, 31, 32, 39, 40, 45, 47, 48, 49, 55, 56, 57, 61, 63}) ({2, 4}) c77 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({2, 4} : Finset ℕ) = {1, 2, 4} := by decide +kernel
    rw [he]
    exact checked75
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 13, 15, 16, 23, 24, 29, 31, 32, 39, 40, 45, 47, 48, 49, 55, 56, 57, 61, 63}) 1 = {1, 7, 8, 9, 13, 15, 16, 17, 23, 24, 25, 29, 31, 32, 33, 39, 40, 41, 45, 47, 48, 49, 55, 56, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked76
private theorem checked78 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 32, 36, 39, 40, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63}) ({1, 2}) c78 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked79 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63}) ({2}) c79 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked80 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 32, 36, 39, 40, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63}) ({2}) c80 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({2} : Finset ℕ) = {1, 2} := by decide +kernel
    rw [he]
    exact checked78
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 32, 36, 39, 40, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63}) 1 = {1, 4, 5, 7, 8, 9, 12, 13, 15, 16, 17, 20, 21, 23, 24, 25, 28, 29, 31, 32, 33, 36, 37, 39, 40, 41, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63} := by decide +kernel
    rw [hf]
    exact checked79
private theorem checked81 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({8, 13, 15, 16, 23, 24, 29, 31, 32, 39, 40, 45, 47, 48, 49, 55, 56, 57, 61, 63}) ({2}) c81 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({2} : Finset ℕ) = {2, 4} := by decide +kernel
    rw [he]
    exact checked77
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({8, 13, 15, 16, 23, 24, 29, 31, 32, 39, 40, 45, 47, 48, 49, 55, 56, 57, 61, 63}) 4 = {4, 7, 8, 12, 13, 15, 16, 20, 23, 24, 28, 29, 31, 32, 36, 39, 40, 44, 45, 47, 48, 49, 52, 53, 55, 56, 57, 60, 61, 63} := by decide +kernel
    rw [hf]
    exact checked80
private theorem checked82 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63}) ({2}) c82 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 ({2} : Finset ℕ) = {2, 8} := by decide +kernel
    rw [he]
    exact checked74
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63}) 8 = {8, 13, 15, 16, 23, 24, 29, 31, 32, 39, 40, 45, 47, 48, 49, 55, 56, 57, 61, 63} := by decide +kernel
    rw [hf]
    exact checked81
private theorem checked83 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) ({1, 4, 8}) c83 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked84 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 7, 13, 15, 16, 17, 18, 19, 23, 29, 31, 32, 33, 34, 35, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) ({4, 8}) c84 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked85 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) ({4, 8}) c85 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({4, 8} : Finset ℕ) = {1, 4, 8} := by decide +kernel
    rw [he]
    exact checked83
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) 1 = {1, 2, 3, 7, 13, 15, 16, 17, 18, 19, 23, 29, 31, 32, 33, 34, 35, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked84
private theorem checked86 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 32, 34, 36, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) ({1, 8}) c86 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked87 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) ({8}) c87 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked88 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 32, 34, 36, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) ({8}) c88 = true := by
  apply ShareFlow.check_split
  · have he : insert 1 ({8} : Finset ℕ) = {1, 8} := by decide +kernel
    rw [he]
    exact checked86
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 32, 34, 36, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63}) 1 = {1, 2, 3, 4, 5, 6, 7, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 29, 31, 32, 33, 34, 35, 36, 37, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked87
private theorem checked89 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) ({8}) c89 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 ({8} : Finset ℕ) = {4, 8} := by decide +kernel
    rw [he]
    exact checked85
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) 4 = {2, 4, 6, 7, 13, 15, 16, 18, 20, 22, 23, 29, 31, 32, 34, 36, 38, 39, 45, 47, 48, 49, 50, 51, 52, 53, 54, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked88
private theorem checked90 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 32, 34, 39, 40, 42, 45, 47, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63}) ({4}) c90 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked91 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16, 18, 20, 22, 23, 24, 26, 28, 29, 30, 31, 32, 34, 36, 38, 39, 40, 42, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63}) (∅) c91 = true := by
  apply ShareFlow.check_leaf_of_pointwise
  decide +kernel
private theorem checked92 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 32, 34, 39, 40, 42, 45, 47, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63}) (∅) c92 = true := by
  apply ShareFlow.check_split
  · have he : insert 4 (∅ : Finset ℕ) = {4} := by decide +kernel
    rw [he]
    exact checked90
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 32, 34, 39, 40, 42, 45, 47, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63}) 4 = {2, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16, 18, 20, 22, 23, 24, 26, 28, 29, 30, 31, 32, 34, 36, 38, 39, 40, 42, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63} := by decide +kernel
    rw [hf]
    exact checked91
private theorem checked93 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) (∅) c93 = true := by
  apply ShareFlow.check_split
  · have he : insert 8 (∅ : Finset ℕ) = {8} := by decide +kernel
    rw [he]
    exact checked89
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63}) 8 = {2, 7, 8, 10, 13, 15, 16, 18, 23, 24, 26, 29, 31, 32, 34, 39, 40, 42, 45, 47, 48, 49, 50, 51, 55, 56, 57, 58, 59, 61, 63} := by decide +kernel
    rw [hf]
    exact checked92
private theorem checked94 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63}) (∅) c94 = true := by
  apply ShareFlow.check_split
  · have he : insert 2 (∅ : Finset ℕ) = {2} := by decide +kernel
    rw [he]
    exact checked82
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63}) 2 = {2, 7, 15, 16, 18, 23, 29, 31, 32, 34, 39, 45, 47, 48, 49, 50, 51, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked93
private theorem checked95 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ({16, 23, 29, 31, 49, 55, 61, 63}) (∅) c95 = true := by
  apply ShareFlow.check_split
  · have he : insert 32 (∅ : Finset ℕ) = {32} := by decide +kernel
    rw [he]
    exact checked69
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase ({16, 23, 29, 31, 49, 55, 61, 63}) 32 = {16, 23, 29, 31, 32, 39, 45, 47, 48, 49, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked94
private theorem checked96 :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare (∅) (∅) c96 = true := by
  apply ShareFlow.check_split
  · have he : insert 16 (∅ : Finset ℕ) = {16} := by decide +kernel
    rw [he]
    exact checked44
  · have hf : ShareSearch.infer (fun a b : ℕ => a ||| b) codedBase (∅) 16 = {16, 23, 29, 31, 49, 55, 61, 63} := by decide +kernel
    rw [hf]
    exact checked95

@[no_expose] def certificate : ShareFlow.Certificate ℕ := c96

theorem checked :
    ShareFlow.check (fun a b : ℕ => a ||| b) codedBase (BitCode.domain 6)
      codedShare ∅ ∅ certificate = true := by
  exact checked96

theorem coded_extension_share_nonnegative {family : Finset ℕ}
    (hc : ShareSearch.ClosedFor (fun a b : ℕ => a ||| b) codedBase family)
    (hd : family ⊆ (BitCode.domain 6)) :
    0 ≤ ∑ a ∈ family, codedShare a :=
  ShareFlow.certificate_nonnegative certificate checked hc hd

theorem extension_share_nonnegative {family : Finset (Finset ℕ)}
    (hc : ShareSearch.ClosedFor (fun A B => A ∪ B) base family)
    (hd : family ⊆ ground.powerset) :
    0 ≤ ∑ S ∈ family, share ground weights S := by
  exact extension_shares_of_finite_domain_certificate
    (D := BitCode.domain 6) (decode := BitCode.decode 6)
    (join := (fun a b : ℕ => a ||| b)) (codedBase := codedBase)
    (W := ground) (base := base) (w := weights) (codedShare := codedShare)
    (BitCode.decode_injOn 6) (BitCode.image_domain 6)
    (fun _ ha _ hb => BitCode.or_mem_domain ha hb)
    (fun a _ b _ => BitCode.decode_or 6 a b)
    (by decide +kernel) (by decide +kernel) (fun _ _ => rfl)
    certificate checked family hd hc

theorem abundant {family : Finset (Finset ℕ)}
    (hu : UnionClosed family) (hb : base ⊆ family) :
    ∃ x ∈ ground, 0 < weights x ∧ Abundant family x := by
  apply abundant_of_extension_shares hu hb (by decide +kernel)
    (by refine ⟨0, ?_, ?_⟩ <;> decide +kernel)
  exact fun _ hd hc => extension_share_nonnegative hc hd

end Frankl.FC.VaughanPathEdge
