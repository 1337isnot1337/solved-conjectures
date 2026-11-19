module

public import Conjectures.FranklSpanFourGraphTables
public import Conjectures.FranklSpanFourGraphWordRows
public import Conjectures.FranklSmallCyclicCanonicalWords

@[expose] public section

set_option maxRecDepth 65536
set_option maxHeartbeats 0

namespace FranklSpanFour.Graph.Certificate

open InitialData

def canonicalRows : List FranklSmallCyclic.Weights.Entry :=
  (List.range FranklSmallCyclic.CanonicalWords.count).map
    (fun i => ⟨FranklSmallCyclic.CanonicalWords.wordAt i, []⟩)

def left4 : List (Assembly.Word 7) := decodeWords 7 leftTable.keys

def recurrent : List (Assembly.Word 7) :=
  left4 ++ canonicalRows.map FranklSmallCyclic.Weights.shapeWord

theorem canonicalRows_decoded :
    (List.range FranklSmallCyclic.CanonicalWords.count).map
      (fun i => wordOfCode 7 (FranklSmallCyclic.CanonicalWords.codeAt i)) =
    canonicalRows.map FranklSmallCyclic.Weights.shapeWord := by
  simpa only [canonicalRows, FranklSmallCyclic.CanonicalWords.wordAt_eq, naturalWord] using
    decoded_codeRows_eq_shapeRows FranklSmallCyclic.CanonicalWords.count
      FranklSmallCyclic.CanonicalWords.codeAt

theorem recurrent_partition :
    recurrent = left4 ++ canonicalRows.map FranklSmallCyclic.Weights.shapeWord := rfl

end FranklSpanFour.Graph.Certificate
