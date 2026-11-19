module

public import Conjectures.FranklTreeBoundK03
public import Conjectures.FranklTreeBoundK04
public import Conjectures.FranklTreeBoundK05
public import Conjectures.FranklTreeBoundK06
public import Conjectures.FranklTreeBoundK07
public import Conjectures.FranklTreeBoundK08
public import Conjectures.FranklTreeBoundK09
public import Conjectures.FranklTreeBoundK10
public import Conjectures.FranklTreeBoundK11
public import Conjectures.FranklTreeBoundK12
public import Conjectures.FranklTreeBoundK13
public import Conjectures.FranklTreeBoundK14

@[expose] public section

namespace FranklTreeCone

def smallDegreeCertificate (k : ℕ) : List AlternatingLevel :=
  match k with
  | 3 => Degree03.levels
  | 4 => Degree04.levels
  | 5 => Degree05.levels
  | 6 => Degree06.levels
  | 7 => Degree07.levels
  | 8 => Degree08.levels
  | 9 => Degree09.levels
  | 10 => Degree10.levels
  | 11 => Degree11.levels
  | 12 => Degree12.levels
  | 13 => Degree13.levels
  | 14 => Degree14.levels
  | _ => []

theorem smallDegreeCertificate_checked (k : ℕ) (hk : 3 ≤ k) (hk' : k ≤ 14) :
    highGirthTreeCheck k (smallDegreeCertificate k) = true := by
  have hcases : k = 3 ∨ k = 4 ∨ k = 5 ∨ k = 6 ∨ k = 7 ∨ k = 8 ∨ k = 9 ∨ k = 10 ∨ k = 11 ∨ k = 12 ∨ k = 13 ∨ k = 14 := by omega
  rcases hcases with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · exact Degree03.checked
  · exact Degree04.checked
  · exact Degree05.checked
  · exact Degree06.checked
  · exact Degree07.checked
  · exact Degree08.checked
  · exact Degree09.checked
  · exact Degree10.checked
  · exact Degree11.checked
  · exact Degree12.checked
  · exact Degree13.checked
  · exact Degree14.checked

theorem small_degree_tree_bound (k : ℕ) (hk : 3 ≤ k) (hk' : k ≤ 14)
    {x y z : Message}
    (hx : x ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2)
    (hy : y ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2)
    (hz : z ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2)
    (htotal : 0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z) :
    rootOccupiedCount x y z / (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤
      (481792 : ℝ) / 1000000 :=
  highGirthTreeCheck_sound (smallDegreeCertificate_checked k hk hk') hx hy hz htotal

end FranklTreeCone
