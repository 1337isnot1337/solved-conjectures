import Conjectures.WachsCompleteGraphActualEGF
import Conjectures.WachsCompleteGraphActualLaguerre
import Conjectures.WachsCompleteGraphBlockEquiv
import Conjectures.WachsCompleteGraphBlockGluing
import Conjectures.WachsCompleteGraphBlockIntervals
import Conjectures.WachsCompleteGraphBlockMoebius
import Conjectures.WachsCompleteGraphBlockOrder
import Conjectures.WachsCompleteGraphBlockRestriction
import Conjectures.WachsCompleteGraphCanonicalBlock
import Conjectures.WachsCompleteGraphCanonicalCut
import Conjectures.WachsCompleteGraphCanonicalUnit
import Conjectures.WachsCompleteGraphCharacteristic
import Conjectures.WachsCompleteGraphCoefficientFormula
import Conjectures.WachsCompleteGraphCoordinateCut
import Conjectures.WachsCompleteGraphCutCancellation
import Conjectures.WachsCompleteGraphDistinguishedBlock
import Conjectures.WachsCompleteGraphEGFComposition
import Conjectures.WachsCompleteGraphEGFTally
import Conjectures.WachsCompleteGraphExponentialFormula
import Conjectures.WachsCompleteGraphFibreProduct
import Conjectures.WachsCompleteGraphFibreWeights
import Conjectures.WachsCompleteGraphForcing
import Conjectures.WachsCompleteGraphGammaFactors
import Conjectures.WachsCompleteGraphGammaProduct
import Conjectures.WachsCompleteGraphHomogeneous
import Conjectures.WachsCompleteGraphIntervalMoebius
import Conjectures.WachsCompleteGraphLabelEmbedding
import Conjectures.WachsCompleteGraphLabelEquiv
import Conjectures.WachsCompleteGraphLaguerreNormalization
import Conjectures.WachsCompleteGraphMarkedCount
import Conjectures.WachsCompleteGraphMoebiusLaw
import Conjectures.WachsCompleteGraphMomentExpansion
import Conjectures.WachsCompleteGraphOrdinaryFibres
import Conjectures.WachsCompleteGraphPartitionCountRecurrence
import Conjectures.WachsCompleteGraphPartitionSum
import Conjectures.WachsCompleteGraphPartitionSupport
import Conjectures.WachsCompleteGraphProductCancellation
import Conjectures.WachsCompleteGraphRankTally
import Conjectures.WachsCompleteGraphSeededRecurrence
import Conjectures.WachsCompleteGraphSizeRecurrence
import Conjectures.WachsCompleteGraphStrictRank
import Conjectures.WachsCompleteGraphTopCancellation
import Conjectures.WachsCompleteGraphTopCut
import Conjectures.WachsCompleteGraphTopExtensions
import Conjectures.WachsCompleteGraphTopScope
import Conjectures.WachsCompleteGraphVandermonde
import Conjectures.WachsCompleteGraphWeightCompletions
import Conjectures.WachsCompleteGraphWeightEquiv
import Conjectures.WachsCompleteGraphWeightRelabel
import Conjectures.WachsCompleteGraphWeightedOrder
import Conjectures.WachsCompleteGraphWeightedPartition
import Conjectures.WachsLagrangeDerivative
import Conjectures.WachsLagrangeInversion
import Conjectures.WachsLagrangeSubstitution
import Conjectures.WachsLagrangeWeight
import Lean.Util.CollectAxioms
import Lean.PrivateName
import Lean.Elab.Command
import Lean.Data.Json

set_option maxRecDepth 100000
set_option maxHeartbeats 0

open Lean Elab Command in
run_cmd do
  let expectedModules : Array String := #["Conjectures.WachsCompleteGraphActualEGF", "Conjectures.WachsCompleteGraphActualLaguerre", "Conjectures.WachsCompleteGraphBlockEquiv", "Conjectures.WachsCompleteGraphBlockGluing", "Conjectures.WachsCompleteGraphBlockIntervals", "Conjectures.WachsCompleteGraphBlockMoebius", "Conjectures.WachsCompleteGraphBlockOrder", "Conjectures.WachsCompleteGraphBlockRestriction", "Conjectures.WachsCompleteGraphCanonicalBlock", "Conjectures.WachsCompleteGraphCanonicalCut", "Conjectures.WachsCompleteGraphCanonicalUnit", "Conjectures.WachsCompleteGraphCharacteristic", "Conjectures.WachsCompleteGraphCoefficientFormula", "Conjectures.WachsCompleteGraphCoordinateCut", "Conjectures.WachsCompleteGraphCutCancellation", "Conjectures.WachsCompleteGraphDistinguishedBlock", "Conjectures.WachsCompleteGraphEGFComposition", "Conjectures.WachsCompleteGraphEGFTally", "Conjectures.WachsCompleteGraphExponentialFormula", "Conjectures.WachsCompleteGraphFibreProduct", "Conjectures.WachsCompleteGraphFibreWeights", "Conjectures.WachsCompleteGraphForcing", "Conjectures.WachsCompleteGraphGammaFactors", "Conjectures.WachsCompleteGraphGammaProduct", "Conjectures.WachsCompleteGraphHomogeneous", "Conjectures.WachsCompleteGraphIntervalMoebius", "Conjectures.WachsCompleteGraphLabelEmbedding", "Conjectures.WachsCompleteGraphLabelEquiv", "Conjectures.WachsCompleteGraphLaguerreNormalization", "Conjectures.WachsCompleteGraphMarkedCount", "Conjectures.WachsCompleteGraphMoebiusLaw", "Conjectures.WachsCompleteGraphMomentExpansion", "Conjectures.WachsCompleteGraphOrdinaryFibres", "Conjectures.WachsCompleteGraphPartitionCountRecurrence", "Conjectures.WachsCompleteGraphPartitionSum", "Conjectures.WachsCompleteGraphPartitionSupport", "Conjectures.WachsCompleteGraphProductCancellation", "Conjectures.WachsCompleteGraphRankTally", "Conjectures.WachsCompleteGraphSeededRecurrence", "Conjectures.WachsCompleteGraphSizeRecurrence", "Conjectures.WachsCompleteGraphStrictRank", "Conjectures.WachsCompleteGraphTopCancellation", "Conjectures.WachsCompleteGraphTopCut", "Conjectures.WachsCompleteGraphTopExtensions", "Conjectures.WachsCompleteGraphTopScope", "Conjectures.WachsCompleteGraphVandermonde", "Conjectures.WachsCompleteGraphWeightCompletions", "Conjectures.WachsCompleteGraphWeightEquiv", "Conjectures.WachsCompleteGraphWeightRelabel", "Conjectures.WachsCompleteGraphWeightedOrder", "Conjectures.WachsCompleteGraphWeightedPartition", "Conjectures.WachsLagrangeDerivative", "Conjectures.WachsLagrangeInversion", "Conjectures.WachsLagrangeSubstitution", "Conjectures.WachsLagrangeWeight"]
  let required : Array Name := #[`WachsCompleteGraph.distinguishedBlockEquiv, `WachsCompleteGraph.canonicalPartitionWeightSum_succ, `WachsCompleteGraph.tallyEGF_eq_pow, `WachsCompleteGraph.coeff_subst_blockEGF, `WachsCompleteGraph.formal_lagrange_burmann, `WachsCompleteGraph.actualRankEGF_comp_forcing, `WachsCompleteGraph.actualCharacteristicEGF_coeff, `WachsCompleteGraph.weightedCompleteGraphLagrange, `WachsCompleteGraph.weighted_complete_graph_laguerre_formula, `WachsCompleteGraph.weighted_complete_graph_formal_moments, `WachsCompleteGraph.WeightedCompletePartition.canonicalBlockTotal_one]
  let legacyPrefixes : Array String := #[]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  if env.header.isModule then
    throwError "All-owned audit must use legacy private-import mode"
  unless env.header.modules.size == env.header.moduleData.size do
    throwError "Imported module/data inventory size mismatch"
  let mut rawNames : NameSet := {}
  let mut seenModules : Array String := #[]
  for h : idx in [0:env.header.modules.size] do
    let mod := env.header.modules[idx]
    let moduleName := mod.module.toString
    let isProject := moduleName == "Solitaire" || moduleName.startsWith "Solitaire." ||
      moduleName == "Conjectures" || moduleName.startsWith "Conjectures."
    unless !isProject || expectedModules.contains moduleName do
      throwError "Unregistered project module in audit: {moduleName}"
    if expectedModules.contains moduleName then
      unless mod.hasData && mod.importAll do
        throwError "Project module lacks complete private data: {moduleName}"
      let data := env.header.moduleData[idx]!
      unless data.constNames == data.constants.map (·.name) do
        throwError "Serialized declaration names differ from their constants: {moduleName}"
      seenModules := seenModules.push moduleName
      let mut privateCount := 0
      for name in data.constNames do
        unless (env.find? name).isSome do
          throwError "Serialized project declaration is invisible: {moduleName}: {name}"
        rawNames := rawNames.insert name
        if (privateToUserName? name).isSome then
          privateCount := privateCount + 1
      let record := Json.mkObj [
        ("tag", toJson "module"), ("module", toJson moduleName),
        ("modern", toJson data.isModule), ("import_all", toJson mod.importAll),
        ("has_data", toJson mod.hasData),
        ("names", toJson (data.constNames.map (·.toString))),
        ("private_count", toJson privateCount)]
      logInfo m!"ALL-OWNED-JSON {record.compress}"
  unless seenModules.size == expectedModules.size &&
      expectedModules.all seenModules.contains do
    throwError "Incomplete exact project module inventory"
  let mut audited : NameSet := {}
  let mut declarations := 0
  let mut theorems := 0
  let mut privateDeclarations := 0
  for (name, info) in env.constants.toList do
    let owner := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some mod => mod.module.toString
      | none => ""
    let userName := privateToUserName name
    let byModule := expectedModules.contains owner
    let bySerialized := rawNames.contains name
    let byLegacy := legacyPrefixes.any (fun p => userName.toString.startsWith p)
    if byModule || bySerialized || byLegacy then
      declarations := declarations + 1
      audited := audited.insert name
      let kind := match info with
        | .axiomInfo _ => "axiom"
        | .defnInfo _ => "definition"
        | .thmInfo _ => "theorem"
        | .opaqueInfo _ => "opaque"
        | .quotInfo _ => "quotient"
        | .ctorInfo _ => "constructor"
        | .recInfo _ => "recursor"
        | .inductInfo _ => "inductive"
      if info.isTheorem then
        theorems := theorems + 1
      let privateName := privateToUserName? name
      if privateName.isSome then
        privateDeclarations := privateDeclarations + 1
      if let .axiomInfo _ := info then
        unless allowed.contains name do
          throwError "Unapproved project axiom {name}"
      let axioms ← collectAxioms name
      for axiomName in axioms do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
      let record := Json.mkObj [
        ("tag", toJson "declaration"), ("name", toJson name.toString),
        ("owner", toJson owner), ("kind", toJson kind),
        ("private_user_name", toJson (privateName.map (·.toString))),
        ("by_module", toJson byModule), ("by_serialized", toJson bySerialized),
        ("by_legacy_prefix", toJson byLegacy),
        ("axioms", toJson (axioms.map (·.toString)))]
      logInfo m!"ALL-OWNED-JSON {record.compress}"
  for name in rawNames.toArray do
    unless audited.contains name do
      throwError "Serialized project declaration escaped the audit: {name}"
  for name in required do
    let _ ← getConstInfo name
    unless audited.contains name do
      throwError "Required declaration is outside audited ownership: {name}"
    let record := Json.mkObj [("tag", toJson "required"), ("name", toJson name.toString)]
    logInfo m!"ALL-OWNED-JSON {record.compress}"
  let record := Json.mkObj [
    ("tag", toJson "passed"), ("modules", toJson seenModules.size),
    ("declarations", toJson declarations), ("theorems", toJson theorems),
    ("private_declarations", toJson privateDeclarations),
    ("raw_declarations", toJson rawNames.toArray.size),
    ("required", toJson required.size), ("allowed_axioms", toJson (allowed.map (·.toString)))]
  logInfo m!"ALL-OWNED-JSON {record.compress}"
