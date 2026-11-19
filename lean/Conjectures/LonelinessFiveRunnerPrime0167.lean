import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch000
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch001
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch002
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch003
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch004
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch005
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch006
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch007
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch008
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch009
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch010
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch011
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch012
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch013
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch014
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch015
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch016
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch017
import Conjectures.LonelinessFiveRunnerPrime0167ChunkBatch018
import Mathlib.Tactic.IntervalCases

/-! Complete support classification at prime 167.
All normalized minimum pairs and supports of size at most five are covered.
The only remaining runner hypothesis is the four-runner lower bound. -/

namespace Loneliness.Modular.FiveRunner.Prime0167

noncomputable section

def trees : ℕ → SupportSearch.Tree
  | 2 => B002.tree
  | 3 => B003.tree
  | 4 => B004.tree
  | 5 => B005.tree
  | 6 => B006.tree
  | 7 => B007.tree
  | 8 => B008.tree
  | 9 => B009.tree
  | 10 => B010.tree
  | 11 => B011.tree
  | 12 => B012.tree
  | 13 => B013.tree
  | 14 => B014.tree
  | 15 => B015.tree
  | 16 => B016.tree
  | 17 => B017.tree
  | 18 => B018.tree
  | 19 => B019.tree
  | 20 => B020.tree
  | 21 => B021.tree
  | 22 => B022.tree
  | 23 => B023.tree
  | 24 => B024.tree
  | 25 => B025.tree
  | 26 => B026.tree
  | 27 => B027.tree
  | 28 => B028.tree
  | 29 => B029.tree
  | 30 => B030.tree
  | 31 => B031.tree
  | 32 => B032.tree
  | 33 => B033.tree
  | 34 => B034.tree
  | 35 => B035.tree
  | 36 => B036.tree
  | 37 => B037.tree
  | 38 => B038.tree
  | 39 => B039.tree
  | 40 => B040.tree
  | 41 => B041.tree
  | 42 => B042.tree
  | 43 => B043.tree
  | 44 => B044.tree
  | 45 => B045.tree
  | 46 => B046.tree
  | 47 => B047.tree
  | 48 => B048.tree
  | 49 => B049.tree
  | 50 => B050.tree
  | 51 => B051.tree
  | 52 => B052.tree
  | 53 => B053.tree
  | 54 => B054.tree
  | 55 => B055.tree
  | 56 => B056.tree
  | 57 => B057.tree
  | 58 => B058.tree
  | 59 => B059.tree
  | 60 => B060.tree
  | 61 => B061.tree
  | 62 => B062.tree
  | 63 => B063.tree
  | 64 => B064.tree
  | 65 => B065.tree
  | 66 => B066.tree
  | 67 => B067.tree
  | 68 => B068.tree
  | 69 => B069.tree
  | 70 => B070.tree
  | 71 => B071.tree
  | 72 => B072.tree
  | 73 => B073.tree
  | 74 => B074.tree
  | 75 => B075.tree
  | 76 => B076.tree
  | 77 => B077.tree
  | 78 => B078.tree
  | 79 => B079.tree
  | 80 => B080.tree
  | 81 => B081.tree
  | 82 => B082.tree
  | 83 => B083.tree
  | _ => B002.tree

theorem initial_checked (b : ℕ) (hb : 2 ≤ b) (hbound : 2 * b ≤ 167) :
    SupportSearch.check (InitialSupport.badTimes 6 167)
      (InitialSupport.pairCompatible 167 inverse b) terminal (trees b)
      (InitialSupport.selected b) (InitialSupport.available 167 inverse b)
      (InitialSupport.uncovered 6 167 b) 3 = true := by
  have hbupper : b ≤ 83 := by omega
  interval_cases b
  · exact B002.root_checked
  · exact B003.root_checked
  · exact B004.root_checked
  · exact B005.root_checked
  · exact B006.root_checked
  · exact B007.root_checked
  · exact B008.root_checked
  · exact B009.root_checked
  · exact B010.root_checked
  · exact B011.root_checked
  · exact B012.root_checked
  · exact B013.root_checked
  · exact B014.root_checked
  · exact B015.root_checked
  · exact B016.root_checked
  · exact B017.root_checked
  · exact B018.root_checked
  · exact B019.root_checked
  · exact B020.root_checked
  · exact B021.root_checked
  · exact B022.root_checked
  · exact B023.root_checked
  · exact B024.root_checked
  · exact B025.root_checked
  · exact B026.root_checked
  · exact B027.root_checked
  · exact B028.root_checked
  · exact B029.root_checked
  · exact B030.root_checked
  · exact B031.root_checked
  · exact B032.root_checked
  · exact B033.root_checked
  · exact B034.root_checked
  · exact B035.root_checked
  · exact B036.root_checked
  · exact B037.root_checked
  · exact B038.root_checked
  · exact B039.root_checked
  · exact B040.root_checked
  · exact B041.root_checked
  · exact B042.root_checked
  · exact B043.root_checked
  · exact B044.root_checked
  · exact B045.root_checked
  · exact B046.root_checked
  · exact B047.root_checked
  · exact B048.root_checked
  · exact B049.root_checked
  · exact B050.root_checked
  · exact B051.root_checked
  · exact B052.root_checked
  · exact B053.root_checked
  · exact B054.root_checked
  · exact B055.root_checked
  · exact B056.root_checked
  · exact B057.root_checked
  · exact B058.root_checked
  · exact B059.root_checked
  · exact B060.root_checked
  · exact B061.root_checked
  · exact B062.root_checked
  · exact B063.root_checked
  · exact B064.root_checked
  · exact B065.root_checked
  · exact B066.root_checked
  · exact B067.root_checked
  · exact B068.root_checked
  · exact B069.root_checked
  · exact B070.root_checked
  · exact B071.root_checked
  · exact B072.root_checked
  · exact B073.root_checked
  · exact B074.root_checked
  · exact B075.root_checked
  · exact B076.root_checked
  · exact B077.root_checked
  · exact B078.root_checked
  · exact B079.root_checked
  · exact B080.root_checked
  · exact B081.root_checked
  · exact B082.root_checked
  · exact B083.root_checked

/-- Actual primitive speeds, with this prime's numerical checks discharged. -/
theorem primitive_classification
    (hLRC : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Search.Primitive v)
    (hmod : ∀ i, v i % 167 ≠ 0)
    (hlow : value (List.ofFn v) ≤ (1 / 6 : ℝ)) :
    ∃ ds ∈ FiveRunner.directions, (List.ofFn v).Perm ds := by
  exact FiveRunner.checked_prime_classification 167 (by decide) (by decide)
    hLRC inverse inverse_valid rows rows_valid trees initial_checked
    v hpositive hprimitive hmod hlow

theorem primitive_classification_cases
    (hLRC : CoordinateSubspace.LonelyRunnerBound 4)
    (v : Fin 5 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Search.Primitive v)
    (hmod : ∀ i, v i % 167 ≠ 0)
    (hlow : value (List.ofFn v) ≤ (1 / 6 : ℝ)) :
    (List.ofFn v).Perm FiveRunner.consecutive ∨
      (List.ofFn v).Perm FiveRunner.exceptional :=
  (FiveRunner.classified_iff _).mp
    (primitive_classification hLRC v hpositive hprimitive hmod hlow)

end
end Loneliness.Modular.FiveRunner.Prime0167
