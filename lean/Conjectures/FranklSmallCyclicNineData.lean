module

public import Conjectures.FranklSmallCyclicNineData0
public import Conjectures.FranklSmallCyclicNineData1
public import Conjectures.FranklSmallCyclicNineData2
public import Conjectures.FranklSmallCyclicNineData3
public import Conjectures.FranklSmallCyclicNineData4
public import Conjectures.FranklSmallCyclicNineData5
public import Conjectures.FranklSmallCyclicNineData6
public import Conjectures.FranklSmallCyclicNineData7

/-! Complete checked coverage of all nonzero nine-site residual prefixes. -/
@[expose] public section

namespace FranklSmallCyclic

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem nonzeroNineCandidates_eq : nonzeroNineCandidates =
    nineChunk0 ∪ nineChunk1 ∪ nineChunk2 ∪ nineChunk3 ∪ nineChunk4 ∪ nineChunk5 ∪ nineChunk6 ∪ nineChunk7 := by decide +kernel

theorem nine_candidate_abundant {w : List ℕ} (hw : w ∈ nonzeroNineCandidates) :
    Frankl.Abundant (Frankl.generatedUnions (decodedGenerators 9 (wordMasksNine w))) 0 := by
  rw [nonzeroNineCandidates_eq] at hw
  simp only [Finset.mem_union, or_assoc] at hw
  rcases hw with h0 | h1 | h2 | h3 | h4 | h5 | h6 | h7
  · exact nineChunk0_abundant h0
  · exact nineChunk1_abundant h1
  · exact nineChunk2_abundant h2
  · exact nineChunk3_abundant h3
  · exact nineChunk4_abundant h4
  · exact nineChunk5_abundant h5
  · exact nineChunk6_abundant h6
  · exact nineChunk7_abundant h7

end FranklSmallCyclic
