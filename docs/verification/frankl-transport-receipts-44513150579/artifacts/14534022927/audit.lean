module
import all Conjectures.FranklBasic
import all Conjectures.FranklFamily
import all Conjectures.FranklFCBitCode
import all Conjectures.FranklCyclicRank
import all Conjectures.FranklLocalFibers
import all Conjectures.FranklSmallCyclicMasks
import all Conjectures.FranklCyclicWords
import all Conjectures.FranklLocalWeights
import all Conjectures.FranklLocalCertificate
import all Conjectures.FranklLocalEnumeration
import all Conjectures.FranklLocalMaximalCover
import all Conjectures.FranklLocalEnumerationCore
import all Conjectures.FranklLocalEnumerationMap
import all Conjectures.FranklLocalMaskCertificate
import all Conjectures.FranklCyclicGenerators
import all Conjectures.FranklLocalFiniteSupport
import all Conjectures.FranklLocalMaskDomains
import all Conjectures.FranklCyclicCertificates
import all Conjectures.FranklLocalMaskEquivalence
import all Conjectures.FranklSmallCyclicMaskWindows
import all Conjectures.FranklSmallCyclicWeights
import all Conjectures.FranklSmallCyclicCanonicalWords
import all Conjectures.FranklSmallCyclicWeightTransport
import all Conjectures.FranklSmallCyclicWeightsPilotData
import all Conjectures.FranklSmallCyclicMaskTransport
import all Conjectures.FranklSmallCyclicWeights9Pilot
import all Conjectures.FranklSmallCyclicRowCoverage
import all Conjectures.FranklSmallCyclicTransportG077B000Data
import all Conjectures.FranklSmallCyclicTransportG077B000
import Lean.Util.CollectAxioms
import Lean.PrivateName

open Lean Elab Command in
run_cmd do
  let modules : Array String := #["Conjectures.FranklBasic", "Conjectures.FranklFamily", "Conjectures.FranklFCBitCode", "Conjectures.FranklCyclicRank", "Conjectures.FranklLocalFibers", "Conjectures.FranklSmallCyclicMasks", "Conjectures.FranklCyclicWords", "Conjectures.FranklLocalWeights", "Conjectures.FranklLocalCertificate", "Conjectures.FranklLocalEnumeration", "Conjectures.FranklLocalMaximalCover", "Conjectures.FranklLocalEnumerationCore", "Conjectures.FranklLocalEnumerationMap", "Conjectures.FranklLocalMaskCertificate", "Conjectures.FranklCyclicGenerators", "Conjectures.FranklLocalFiniteSupport", "Conjectures.FranklLocalMaskDomains", "Conjectures.FranklCyclicCertificates", "Conjectures.FranklLocalMaskEquivalence", "Conjectures.FranklSmallCyclicMaskWindows", "Conjectures.FranklSmallCyclicWeights", "Conjectures.FranklSmallCyclicCanonicalWords", "Conjectures.FranklSmallCyclicWeightTransport", "Conjectures.FranklSmallCyclicWeightsPilotData", "Conjectures.FranklSmallCyclicMaskTransport", "Conjectures.FranklSmallCyclicWeights9Pilot", "Conjectures.FranklSmallCyclicRowCoverage", "Conjectures.FranklSmallCyclicTransportG077B000Data", "Conjectures.FranklSmallCyclicTransportG077B000"]
  let required : Array Name := #[`FranklSmallCyclic.CanonicalWords.block000_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block001_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block002_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block003_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block004_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block005_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block006_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block007_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block008_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block009_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block010_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block011_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block012_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block013_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block014_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block015_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block016_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block017_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block018_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block019_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block020_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block021_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block022_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block023_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block024_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block025_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block026_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block027_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block028_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block029_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block030_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block031_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block032_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block033_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block034_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block035_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block036_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block037_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block038_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block039_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block040_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block041_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block042_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block043_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block044_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block045_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block046_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block047_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block048_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block049_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block050_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block051_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block052_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block053_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block054_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block055_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block056_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block057_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block058_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block059_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block060_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block061_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block062_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block063_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block064_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block065_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block066_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block067_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block068_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block069_bounded_check,
    `FranklSmallCyclic.CanonicalWords.block070_bounded_check,
    `FranklSmallCyclic.CanonicalWords.codeAt_all_lt,
    `FranklSmallCyclic.CanonicalWords.codeAt_bounded_check,
    `FranklSmallCyclic.CanonicalWords.codeAt_lt,
    `FranklSmallCyclic.CanonicalWords.codes_length,
    `FranklSmallCyclic.CanonicalWords.count_eq,
    `FranklSmallCyclic.CanonicalWords.getD_lt,
    `FranklSmallCyclic.CanonicalWords.wordAt_eq,
    `FranklSmallCyclic.CanonicalWords.wordAt_length,
    `FranklSmallCyclic.CanonicalWords.words_length,
    `FranklSmallCyclic.MaskTransport.maskTransportCheck_entryCheck,
    `FranklSmallCyclic.MaskTransport.maskTransportCheck_sound,
    `FranklSmallCyclic.MaskWindows.checked_window_certificate,
    `FranklSmallCyclic.MaskWindows.windowCheck_global,
    `FranklSmallCyclic.RowCoverage.allRows_length,
    `FranklSmallCyclic.RowCoverage.checked_entry_for_index,
    `FranklSmallCyclic.RowCoverage.coverageCheck_sound,
    `FranklSmallCyclic.RowCoverage.decode_combinedMask,
    `FranklSmallCyclic.RowCoverage.entries_checked,
    `FranklSmallCyclic.RowCoverage.entries_length,
    `FranklSmallCyclic.RowCoverage.entry_for_index,
    `FranklSmallCyclic.RowCoverage.entry_for_original,
    `FranklSmallCyclic.RowCoverage.entry_words_toFinset,
    `FranklSmallCyclic.RowCoverage.indexCheck_sound,
    `FranklSmallCyclic.RowCoverage.indices_nodup,
    `FranklSmallCyclic.RowCoverage.indices_toFinset,
    `FranklSmallCyclic.RowCoverage.wordsCheck_sound,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period10Chunk_entries,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period10_index_check,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period10_words_check,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period8Chunk_entries,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period8_index_check,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period8_words_check,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period9Chunk_entries,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period9_index_check,
    `FranklSmallCyclic.TransportBatches.G077.B000.Data.period9_words_check,
    `FranklSmallCyclic.TransportBatches.G077.B000.period10_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period10_chunk_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period10_each_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period8_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period8_chunk_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period8_each_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period9_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period9_chunk_checked,
    `FranklSmallCyclic.TransportBatches.G077.B000.period9_each_checked,
    `FranklSmallCyclic.Weights.Period9Pilot.checked,
    `FranklSmallCyclic.Weights.Period9Pilot.each_checked,
    `FranklSmallCyclic.Weights.batchCheck_certificate,
    `FranklSmallCyclic.Weights.batchCheck_entry,
    `FranklSmallCyclic.Weights.batchCheck_global,
    `FranklSmallCyclic.Weights.batchCheck_wellFormed]
  let expectedPrivate : Array Name := #[`FranklSmallCyclic.TransportBatches.G077.B000.checked0,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked1,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked10,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked100,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked101,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked102,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked103,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked104,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked105,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked11,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked12,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked13,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked14,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked15,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked16,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked17,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked18,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked19,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked2,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked20,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked21,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked22,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked23,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked24,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked25,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked26,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked27,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked28,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked29,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked3,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked30,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked31,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked32,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked33,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked34,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked35,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked36,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked37,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked38,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked39,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked4,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked40,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked41,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked42,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked43,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked44,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked45,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked46,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked47,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked48,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked49,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked5,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked50,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked51,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked52,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked53,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked54,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked55,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked56,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked57,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked58,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked59,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked6,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked60,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked61,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked62,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked63,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked64,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked65,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked66,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked67,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked68,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked69,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked7,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked70,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked71,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked72,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked73,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked74,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked75,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked76,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked77,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked78,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked79,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked8,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked80,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked81,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked82,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked83,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked84,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked85,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked86,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked87,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked88,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked89,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked9,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked90,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked91,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked92,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked93,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked94,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked95,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked96,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked97,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked98,
    `FranklSmallCyclic.TransportBatches.G077.B000.checked99,
    `FranklSmallCyclic.Weights.Period9Pilot.checked0,
    `FranklSmallCyclic.Weights.Period9Pilot.checked1,
    `FranklSmallCyclic.Weights.Period9Pilot.checked2,
    `FranklSmallCyclic.Weights.Period9Pilot.checked3,
    `FranklSmallCyclic.Weights.Period9Pilot.checked4,
    `FranklSmallCyclic.Weights.Period9Pilot.checked5,
    `FranklSmallCyclic.Weights.Period9Pilot.checked6,
    `FranklSmallCyclic.Weights.Period9Pilot.checked7]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let env ← getEnv
  let imported := env.header.modules.filter fun m => m.module.toString.startsWith "Conjectures."
  unless imported.size == modules.size do
    throwError "Project import closure count mismatch"
  for m in imported do
    unless modules.contains m.module.toString do
      throwError "Unexpected project import: {m.module}"
  for name in required do
    let info ← getConstInfo name
    unless info.isTheorem do
      throwError "Required endpoint is not a theorem: {name}"
  let mut declarations : Nat := 0
  let mut theorems : Nat := 0
  let mut seenPrivate : Array Name := #[]
  for (name, info) in env.constants.toList do
    let owned := match env.getModuleIdxFor? name |>.bind (env.header.modules[·]?) with
      | some m => modules.contains m.module.toString
      | none => false
    if owned then
      declarations := declarations + 1
      if info.isTheorem then
        theorems := theorems + 1
        if let some userName := privateToUserName? name then
          if expectedPrivate.contains userName then
            seenPrivate := seenPrivate.push userName
      if let .axiomInfo _ := info then
        throwError "Unapproved project axiom: {name}"
      for axiomName in ← collectAxioms name do
        unless allowed.contains axiomName do
          throwError "Unapproved axiom {axiomName} in {name}"
  for name in expectedPrivate do
    unless seenPrivate.contains name do
      throwError "Missing private arithmetic proof: {name}"
  unless seenPrivate.size == expectedPrivate.size do
    throwError "Private arithmetic proof count mismatch"
  logInfo m!"PASS: {modules.size} project modules; {declarations} owned declarations; {theorems} owned theorems; {required.size} required endpoints; all {seenPrivate.size} private arithmetic chunks visible"
