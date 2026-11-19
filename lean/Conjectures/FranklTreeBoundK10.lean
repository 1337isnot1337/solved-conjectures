module

public import Conjectures.FranklTreeDataK10

@[expose] public section

set_option maxRecDepth 100000
set_option maxHeartbeats 0

namespace FranklTreeCone.Degree10

theorem point0_checked : childrenCheck boundaryRays point0 = true := by
  decide

theorem generator0_checked : childrenCheck boundaryRays generator0 = true := by
  decide

theorem point1_checked : childrenCheck generator0.outgoing point1 = true := by
  decide

theorem generator1_checked : childrenCheck point0.outgoing generator1 = true := by
  decide

theorem point2_checked : childrenCheck generator1.outgoing point2 = true := by
  decide

theorem generator2_checked : childrenCheck point1.outgoing generator2 = true := by
  decide

theorem point3_checked : childrenCheck generator2.outgoing point3 = true := by
  decide

theorem generator3_checked : childrenCheck point2.outgoing generator3 = true := by
  decide

theorem point4_checked : childrenCheck generator3.outgoing point4 = true := by
  decide

theorem generator4_checked : childrenCheck point3.outgoing generator4 = true := by
  decide

theorem point5_checked : childrenCheck generator4.outgoing point5 = true := by
  decide

theorem generator5_checked : childrenCheck point4.outgoing generator5 = true := by
  decide

theorem root_checked : rootCheck generator5.outgoing 481792 1000000 = true := by
  decide

theorem checked : highGirthTreeCheck 10 levels = true := by
  simp only [highGirthTreeCheck, levels, levelChecks, finalRayPair,
    point0_checked, generator0_checked, point1_checked, generator1_checked, point2_checked, generator2_checked, point3_checked, generator3_checked, point4_checked, generator4_checked, point5_checked, generator5_checked, root_checked]
  decide

end FranklTreeCone.Degree10
