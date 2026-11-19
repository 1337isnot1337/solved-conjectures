module
import all Conjectures.Base
import all Conjectures.Left
import all Conjectures.Right
import all Conjectures.Top
public meta import Lean.Util.CollectAxioms
public meta import Lean.PrivateName
public meta import Lean.Elab.Command

open Lean Elab Command in
run_cmd do
  let required : Array Name := #[`ParallelFixture.base, `ParallelFixture.Left.value, `ParallelFixture.Right.value, `ParallelFixture.Top.both, `ParallelFixture.Other.value]
  let expectedPrivate : Array Name := #[`ParallelFixture.Left.checked, `ParallelFixture.Right.checked]
  let modules : Array String := #["Conjectures.Base", "Conjectures.Left", "Conjectures.Right", "Conjectures.Top"]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let mut declarations : Nat := 0
  let mut theorems : Nat := 0
  let mut seenPrivate : Array Name := #[]
  let mut seenRequired : Array Name := #[]
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => modules.contains mod.module.toString
      | none => false
    if owned then
      declarations := declarations + 1
      if required.contains name then
        unless info.isTheorem do
          throwError "Required endpoint is not a theorem: {name}"
        seenRequired := seenRequired.push name
        logInfo m!"PARALLEL-AUDIT-ENDPOINT {name}"
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {name}"
      if let .thmInfo _ := info then
        theorems := theorems + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private theorem {name}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private theorem count mismatch"
  logInfo m!"PARALLEL-AUDIT PASS: {declarations} owned declarations; {theorems} theorems; {expectedPrivate.size} private proofs; {seenRequired.size} endpoints"
