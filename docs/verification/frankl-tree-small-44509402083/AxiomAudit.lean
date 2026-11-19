module
import all Conjectures.FranklTreeCone
import all Conjectures.FranklTreeRoot
import all Conjectures.FranklTreeSpan
import all Conjectures.FranklTreeCertificate
import all Conjectures.FranklTreeDataK03
import all Conjectures.FranklTreeDataK04
import all Conjectures.FranklTreeDataK05
import all Conjectures.FranklTreeDataK06
import all Conjectures.FranklTreeDataK07
import all Conjectures.FranklTreeDataK08
import all Conjectures.FranklTreeDataK09
import all Conjectures.FranklTreeDataK10
import all Conjectures.FranklTreeDataK11
import all Conjectures.FranklTreeDataK12
import all Conjectures.FranklTreeDataK13
import all Conjectures.FranklTreeDataK14
import all Conjectures.FranklTreeBoundK03
import all Conjectures.FranklTreeBoundK04
import all Conjectures.FranklTreeBoundK05
import all Conjectures.FranklTreeBoundK06
import all Conjectures.FranklTreeBoundK07
import all Conjectures.FranklTreeBoundK08
import all Conjectures.FranklTreeBoundK09
import all Conjectures.FranklTreeBoundK10
import all Conjectures.FranklTreeBoundK11
import all Conjectures.FranklTreeBoundK12
import all Conjectures.FranklTreeBoundK13
import all Conjectures.FranklTreeBoundK14
import all Conjectures.FranklTreeSmallDegrees
import Lean.Util.CollectAxioms
import Lean.PrivateName

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[`FranklTreeCone.Degree03.checked,
    `FranklTreeCone.Degree03.generator0_checked,
    `FranklTreeCone.Degree03.generator1_checked,
    `FranklTreeCone.Degree03.generator2_checked,
    `FranklTreeCone.Degree03.generator3_checked,
    `FranklTreeCone.Degree03.generator4_checked,
    `FranklTreeCone.Degree03.generator5_checked,
    `FranklTreeCone.Degree03.point0_checked,
    `FranklTreeCone.Degree03.point1_checked,
    `FranklTreeCone.Degree03.point2_checked,
    `FranklTreeCone.Degree03.point3_checked,
    `FranklTreeCone.Degree03.point4_checked,
    `FranklTreeCone.Degree03.point5_checked,
    `FranklTreeCone.Degree03.root_checked,
    `FranklTreeCone.Degree04.checked,
    `FranklTreeCone.Degree04.generator0_checked,
    `FranklTreeCone.Degree04.generator1_checked,
    `FranklTreeCone.Degree04.generator2_checked,
    `FranklTreeCone.Degree04.generator3_checked,
    `FranklTreeCone.Degree04.generator4_checked,
    `FranklTreeCone.Degree04.generator5_checked,
    `FranklTreeCone.Degree04.point0_checked,
    `FranklTreeCone.Degree04.point1_checked,
    `FranklTreeCone.Degree04.point2_checked,
    `FranklTreeCone.Degree04.point3_checked,
    `FranklTreeCone.Degree04.point4_checked,
    `FranklTreeCone.Degree04.point5_checked,
    `FranklTreeCone.Degree04.root_checked,
    `FranklTreeCone.Degree05.checked,
    `FranklTreeCone.Degree05.generator0_checked,
    `FranklTreeCone.Degree05.generator1_checked,
    `FranklTreeCone.Degree05.generator2_checked,
    `FranklTreeCone.Degree05.generator3_checked,
    `FranklTreeCone.Degree05.generator4_checked,
    `FranklTreeCone.Degree05.generator5_checked,
    `FranklTreeCone.Degree05.point0_checked,
    `FranklTreeCone.Degree05.point1_checked,
    `FranklTreeCone.Degree05.point2_checked,
    `FranklTreeCone.Degree05.point3_checked,
    `FranklTreeCone.Degree05.point4_checked,
    `FranklTreeCone.Degree05.point5_checked,
    `FranklTreeCone.Degree05.root_checked,
    `FranklTreeCone.Degree06.checked,
    `FranklTreeCone.Degree06.generator0_checked,
    `FranklTreeCone.Degree06.generator1_checked,
    `FranklTreeCone.Degree06.generator2_checked,
    `FranklTreeCone.Degree06.generator3_checked,
    `FranklTreeCone.Degree06.generator4_checked,
    `FranklTreeCone.Degree06.generator5_checked,
    `FranklTreeCone.Degree06.point0_checked,
    `FranklTreeCone.Degree06.point1_checked,
    `FranklTreeCone.Degree06.point2_checked,
    `FranklTreeCone.Degree06.point3_checked,
    `FranklTreeCone.Degree06.point4_checked,
    `FranklTreeCone.Degree06.point5_checked,
    `FranklTreeCone.Degree06.root_checked,
    `FranklTreeCone.Degree07.checked,
    `FranklTreeCone.Degree07.generator0_checked,
    `FranklTreeCone.Degree07.generator1_checked,
    `FranklTreeCone.Degree07.generator2_checked,
    `FranklTreeCone.Degree07.generator3_checked,
    `FranklTreeCone.Degree07.generator4_checked,
    `FranklTreeCone.Degree07.generator5_checked,
    `FranklTreeCone.Degree07.point0_checked,
    `FranklTreeCone.Degree07.point1_checked,
    `FranklTreeCone.Degree07.point2_checked,
    `FranklTreeCone.Degree07.point3_checked,
    `FranklTreeCone.Degree07.point4_checked,
    `FranklTreeCone.Degree07.point5_checked,
    `FranklTreeCone.Degree07.root_checked,
    `FranklTreeCone.Degree08.checked,
    `FranklTreeCone.Degree08.generator0_checked,
    `FranklTreeCone.Degree08.generator1_checked,
    `FranklTreeCone.Degree08.generator2_checked,
    `FranklTreeCone.Degree08.generator3_checked,
    `FranklTreeCone.Degree08.generator4_checked,
    `FranklTreeCone.Degree08.generator5_checked,
    `FranklTreeCone.Degree08.point0_checked,
    `FranklTreeCone.Degree08.point1_checked,
    `FranklTreeCone.Degree08.point2_checked,
    `FranklTreeCone.Degree08.point3_checked,
    `FranklTreeCone.Degree08.point4_checked,
    `FranklTreeCone.Degree08.point5_checked,
    `FranklTreeCone.Degree08.root_checked,
    `FranklTreeCone.Degree09.checked,
    `FranklTreeCone.Degree09.generator0_checked,
    `FranklTreeCone.Degree09.generator1_checked,
    `FranklTreeCone.Degree09.generator2_checked,
    `FranklTreeCone.Degree09.generator3_checked,
    `FranklTreeCone.Degree09.generator4_checked,
    `FranklTreeCone.Degree09.generator5_checked,
    `FranklTreeCone.Degree09.point0_checked,
    `FranklTreeCone.Degree09.point1_checked,
    `FranklTreeCone.Degree09.point2_checked,
    `FranklTreeCone.Degree09.point3_checked,
    `FranklTreeCone.Degree09.point4_checked,
    `FranklTreeCone.Degree09.point5_checked,
    `FranklTreeCone.Degree09.root_checked,
    `FranklTreeCone.Degree10.checked,
    `FranklTreeCone.Degree10.generator0_checked,
    `FranklTreeCone.Degree10.generator1_checked,
    `FranklTreeCone.Degree10.generator2_checked,
    `FranklTreeCone.Degree10.generator3_checked,
    `FranklTreeCone.Degree10.generator4_checked,
    `FranklTreeCone.Degree10.generator5_checked,
    `FranklTreeCone.Degree10.point0_checked,
    `FranklTreeCone.Degree10.point1_checked,
    `FranklTreeCone.Degree10.point2_checked,
    `FranklTreeCone.Degree10.point3_checked,
    `FranklTreeCone.Degree10.point4_checked,
    `FranklTreeCone.Degree10.point5_checked,
    `FranklTreeCone.Degree10.root_checked,
    `FranklTreeCone.Degree11.checked,
    `FranklTreeCone.Degree11.generator0_checked,
    `FranklTreeCone.Degree11.generator1_checked,
    `FranklTreeCone.Degree11.generator2_checked,
    `FranklTreeCone.Degree11.generator3_checked,
    `FranklTreeCone.Degree11.generator4_checked,
    `FranklTreeCone.Degree11.generator5_checked,
    `FranklTreeCone.Degree11.point0_checked,
    `FranklTreeCone.Degree11.point1_checked,
    `FranklTreeCone.Degree11.point2_checked,
    `FranklTreeCone.Degree11.point3_checked,
    `FranklTreeCone.Degree11.point4_checked,
    `FranklTreeCone.Degree11.point5_checked,
    `FranklTreeCone.Degree11.root_checked,
    `FranklTreeCone.Degree12.checked,
    `FranklTreeCone.Degree12.generator0_checked,
    `FranklTreeCone.Degree12.generator1_checked,
    `FranklTreeCone.Degree12.generator2_checked,
    `FranklTreeCone.Degree12.generator3_checked,
    `FranklTreeCone.Degree12.generator4_checked,
    `FranklTreeCone.Degree12.generator5_checked,
    `FranklTreeCone.Degree12.point0_checked,
    `FranklTreeCone.Degree12.point1_checked,
    `FranklTreeCone.Degree12.point2_checked,
    `FranklTreeCone.Degree12.point3_checked,
    `FranklTreeCone.Degree12.point4_checked,
    `FranklTreeCone.Degree12.point5_checked,
    `FranklTreeCone.Degree12.root_checked,
    `FranklTreeCone.Degree13.checked,
    `FranklTreeCone.Degree13.generator0_checked,
    `FranklTreeCone.Degree13.generator1_checked,
    `FranklTreeCone.Degree13.generator2_checked,
    `FranklTreeCone.Degree13.generator3_checked,
    `FranklTreeCone.Degree13.generator4_checked,
    `FranklTreeCone.Degree13.generator5_checked,
    `FranklTreeCone.Degree13.point0_checked,
    `FranklTreeCone.Degree13.point1_checked,
    `FranklTreeCone.Degree13.point2_checked,
    `FranklTreeCone.Degree13.point3_checked,
    `FranklTreeCone.Degree13.point4_checked,
    `FranklTreeCone.Degree13.point5_checked,
    `FranklTreeCone.Degree13.root_checked,
    `FranklTreeCone.Degree14.checked,
    `FranklTreeCone.Degree14.generator0_checked,
    `FranklTreeCone.Degree14.generator1_checked,
    `FranklTreeCone.Degree14.generator2_checked,
    `FranklTreeCone.Degree14.generator3_checked,
    `FranklTreeCone.Degree14.generator4_checked,
    `FranklTreeCone.Degree14.generator5_checked,
    `FranklTreeCone.Degree14.point0_checked,
    `FranklTreeCone.Degree14.point1_checked,
    `FranklTreeCone.Degree14.point2_checked,
    `FranklTreeCone.Degree14.point3_checked,
    `FranklTreeCone.Degree14.point4_checked,
    `FranklTreeCone.Degree14.point5_checked,
    `FranklTreeCone.Degree14.root_checked,
    `FranklTreeCone.childrenCheck_sound,
    `FranklTreeCone.highGirthTreeCheck_sound,
    `FranklTreeCone.rootCheck_sound,
    `FranklTreeCone.smallDegreeCertificate_checked,
    `FranklTreeCone.small_degree_tree_bound]
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {name}"
  let expectedPrivate : Array Name := #[]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let modules : Array String := #["Conjectures.FranklTreeCone",
    "Conjectures.FranklTreeRoot",
    "Conjectures.FranklTreeSpan",
    "Conjectures.FranklTreeCertificate",
    "Conjectures.FranklTreeDataK03",
    "Conjectures.FranklTreeDataK04",
    "Conjectures.FranklTreeDataK05",
    "Conjectures.FranklTreeDataK06",
    "Conjectures.FranklTreeDataK07",
    "Conjectures.FranklTreeDataK08",
    "Conjectures.FranklTreeDataK09",
    "Conjectures.FranklTreeDataK10",
    "Conjectures.FranklTreeDataK11",
    "Conjectures.FranklTreeDataK12",
    "Conjectures.FranklTreeDataK13",
    "Conjectures.FranklTreeDataK14",
    "Conjectures.FranklTreeBoundK03",
    "Conjectures.FranklTreeBoundK04",
    "Conjectures.FranklTreeBoundK05",
    "Conjectures.FranklTreeBoundK06",
    "Conjectures.FranklTreeBoundK07",
    "Conjectures.FranklTreeBoundK08",
    "Conjectures.FranklTreeBoundK09",
    "Conjectures.FranklTreeBoundK10",
    "Conjectures.FranklTreeBoundK11",
    "Conjectures.FranklTreeBoundK12",
    "Conjectures.FranklTreeBoundK13",
    "Conjectures.FranklTreeBoundK14",
    "Conjectures.FranklTreeSmallDegrees"]
  let env ← getEnv
  let mut count : Nat := 0
  let mut ownedCount : Nat := 0
  let mut seenPrivate : Array Name := #[]
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => modules.contains mod.module.toString
      | none => false
    if owned then
      ownedCount := ownedCount + 1
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {name}"
      if let .thmInfo _ := info then
        count := count + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private certificate theorem: {name}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private certificate theorem count mismatch"
  logInfo m!"PASS: {count} project theorems audited; all {expectedPrivate.size} private certificate-node proofs visible; only standard logical axioms"
  logInfo m!"PASS: {ownedCount} owned declarations audited transitively"
  logInfo "Private certificate-node counts by module: {}"
