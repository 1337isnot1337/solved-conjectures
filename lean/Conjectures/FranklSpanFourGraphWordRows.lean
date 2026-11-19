module

public import Conjectures.FranklSpanFourGraphWords
public import Conjectures.FranklSmallCyclicWeights

/-! Relate scalar graph words to the original indexed weight rows without
checking equality of the complete row lists by computation. -/
@[expose] public section

namespace FranklSpanFour.Graph

open FranklSmallCyclic.Weights

theorem shapeWord_naturalWord (code : ℕ) (weights : List ℕ) :
    shapeWord ⟨naturalWord 7 code, weights⟩ = wordOfCode 7 code := by
  funext p
  change letterOfCode ((naturalWord 7 code).getD p.val 0) = _
  rw [naturalWord_eq_decoded, List.getD_eq_getElem?_getD,
    List.getElem?_ofFn, dite_eq_left p.isLt]
  exact letterOfCode_letterCode _

theorem shapeWord_of_naturalWord {entry : Entry} {code : ℕ}
    (hword : entry.word = naturalWord 7 code) :
    shapeWord entry = wordOfCode 7 code := by
  funext p
  change letterOfCode (entry.word.getD p.val 0) = _
  rw [hword, naturalWord_eq_decoded, List.getD_eq_getElem?_getD,
    List.getElem?_ofFn, dite_eq_left p.isLt]
  exact letterOfCode_letterCode _

theorem decoded_codeRows_eq_shapeRows (count : ℕ) (codeAt : ℕ → ℕ) :
    (List.range count).map (fun i => wordOfCode 7 (codeAt i)) =
      ((List.range count).map
        (fun i => (⟨naturalWord 7 (codeAt i), []⟩ : Entry))).map shapeWord := by
  simp only [List.map_map, Function.comp_def, shapeWord_naturalWord]

end FranklSpanFour.Graph
