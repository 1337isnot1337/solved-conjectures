#!/usr/bin/env bash
# Rebuild sources, audit every project theorem's axioms, then replay the kernel.
set -euo pipefail
export LEAN_NUM_THREADS=1
cd "$(dirname "${BASH_SOURCE[0]}")/../lean"
modules=(
  Solitaire.Counterexample
  Solitaire.Limits
  Solitaire.ProfileTransfer
  Solitaire.RankPeriod
  Solitaire.BirthRange
  Solitaire.ReturnTime
  Solitaire.RankCounts
  Solitaire.Moves
  Solitaire.Dynamics
  Solitaire.Recurrent
  Solitaire.Renewal
  Solitaire.StableCore
  Solitaire.StableBounds
  Solitaire.Interlacing
  Solitaire.Columns
  Solitaire.StableConfiguration
  Solitaire.StableClassification
  Solitaire.GeneralTheorem
  Conjectures.RectanglePacking
  Conjectures.RectanglePartitionCounts
  Conjectures.War
  Conjectures.Denominator
  Conjectures.DenominatorDynamics
  Conjectures.FiniteCertificate
  Conjectures.FiniteIntervalCertificate
  Conjectures.Egyptian
  Conjectures.EgyptianBounds
  Conjectures.EgyptianFinite
  Conjectures.EgyptianTheorem
  Conjectures.CutFamily
  Conjectures.CutFamilyBlocks
  Conjectures.CutFamilyBase
  Conjectures.CutFamilyCover
  Conjectures.CutFamilyGame
  Conjectures.CutFamilyTheorem
  Conjectures.BinaryAutomata
  Conjectures.BinaryArithmetic
  Conjectures.BinaryComposition
  Conjectures.BinaryFastComposition
  Conjectures.BinarySetCertificate
  Conjectures.BinaryDecision
  Conjectures.BinaryDeterminize
  Conjectures.BinaryZeroPrefix
  Conjectures.BinaryAffineGraph
  Conjectures.BinaryTailGraph
  Conjectures.BinaryTailArithmetic
  Conjectures.BinaryFiniteNFA
  Conjectures.BinaryGenericComposition
  Conjectures.BinaryGenericProjection
  Conjectures.BinaryRecognizers
  Conjectures.CutArithmeticTest
  Conjectures.CutArithmeticSearch
  Conjectures.CutMexDecision
  Conjectures.BinaryEncoding
  Conjectures.BinaryBoolean
  Conjectures.BinaryOrder
  Conjectures.BinaryProjection
  Conjectures.CutPeriodGraph
  Conjectures.CutPeriodGraphCertificate
  Conjectures.CutPeriodPiles
  Conjectures.CutPeriodPileSums
  Conjectures.CutPeriodLower
  Conjectures.CutPeriodLowerCertificate
  Conjectures.CutPeriodParameters
  Conjectures.CutPeriodMex
  Conjectures.CutPeriodParts2Certificate
  Conjectures.CutPeriodOptionData
  Conjectures.CutPeriodCollisionACertificate
  Conjectures.CutPeriodCollisionBCertificate
  Conjectures.CutPeriodMissingACertificate
  Conjectures.CutPeriodMissingBCertificate
  Conjectures.CutPeriodCertifiedMex
  Conjectures.PackingFourPoint
  Conjectures.PackingDensityBounds
  Conjectures.PackingDensity
  Conjectures.PackingConstructions
  Conjectures.PackingPeriodic
  Conjectures.PackingSharp
  Conjectures.PackingOppositeParity
  Conjectures.PackingAsymptotic
  Conjectures.PackingTheorem
  Conjectures.PackingLocalSharpness
  Conjectures.LonelinessMax
  Conjectures.LonelinessCertificate
  Conjectures.LonelinessExamples
  Conjectures.LonelinessPairBridge
  Conjectures.DistanceGraphPhase
  Conjectures.DistanceGraphArithmetic
  Conjectures.DistanceGraphBounds
  Conjectures.DistanceGraphCharacter
  Conjectures.DistanceGraphExceptional
  Conjectures.DistanceGraphFive
  Conjectures.DistanceGraphSeven
  Conjectures.DistanceGraphSmall
  Conjectures.DistanceGraphClassification
  Conjectures.DistanceGraphOddCycle
  Conjectures.CutGeneralDecision
  Conjectures.CutGeneralGraph
  Conjectures.CutGeneralSearch
  Conjectures.Loneliness
  Conjectures.LonelinessContinuity
  Conjectures.LonelinessRational
  Conjectures.LonelinessFiveFamily
  Conjectures.LonelinessFiveExamples
  Conjectures.LonelinessCriticalBase
  Conjectures.LonelinessCriticalSecond
  Conjectures.LonelinessCriticalFamilies
  Conjectures.LonelinessNormalization
  Conjectures.NonmixedGapDensity
  Conjectures.NonmixedGap
  Conjectures.NonmixedGapBounds
  Conjectures.NonmixedGapPeriodic
  Conjectures.NonmixedGapUpper
  Conjectures.NonmixedGapCharacter
  Conjectures.NonmixedGapCircle
  Conjectures.NonmixedGapTile
  Conjectures.NonmixedGapTheorem
  Conjectures.SymmetricFourPoint
  Conjectures.SymmetricFourPointCounting
  Conjectures.SymmetricFourPointConstructions
  Conjectures.SymmetricFourPointDensity
  Conjectures.SymmetricFourPointTheorem
  Conjectures.SymmetricFourPointSemantics
  Conjectures.SymmetricFourPointSharp
  Conjectures.SymmetricFourPointResult
  Conjectures.NonmixedGapResidues
  Conjectures.NonmixedGapScaling
  Conjectures.NonmixedGapGeneral
  Conjectures.SymmetricFourPointScaling
  Conjectures.SymmetricFourPointTranslated
  Conjectures.LonelinessSubspaceDensity
  Conjectures.LonelinessNormArithmetic
  Conjectures.LonelinessPacking
  Conjectures.HaralambisOrientation
  Conjectures.HaralambisFaces
  Conjectures.HaralambisDefects
  Conjectures.HaralambisPeriods
  Conjectures.HaralambisIntervals
  Conjectures.HaralambisCounting
  Conjectures.HaralambisDensity
  Conjectures.HaralambisPairSum
  Conjectures.HaralambisTheorem
  Conjectures.HaralambisExamples
  Conjectures.LonelinessPackingLower
  Conjectures.LonelinessCoalescence
  Conjectures.LonelinessCoordinateSubspace
  Conjectures.LonelinessCoordinateClasses
  Conjectures.LonelinessIntegerDirection
  Conjectures.LonelinessRationalSubspace
  Conjectures.LonelinessCoalescenceValue
  Conjectures.LonelinessSubspaceExtension
  Conjectures.LonelinessSmallRunner
)
# Build proof modules one at a time so independent certificate reductions do
# not compete for memory. The final package build checks root imports too.
# Optional arguments select only the sequential prebuilds. The root build,
# full axiom audit and full kernel replay below are always performed.
prebuilds=("${modules[@]}")
if (( $# > 0 )); then
  prebuilds=("$@")
  for requested in "${prebuilds[@]}"; do
    found=false
    for module in "${modules[@]}"; do
      if [[ "$module" == "$requested" ]]; then found=true; break; fi
    done
    if [[ "$found" != true ]]; then
      printf 'Unregistered prebuild target: %s\n' "$requested" >&2
      exit 2
    fi
  done
fi
for module in "${prebuilds[@]}"; do
  lake build "$module"
done
lake build
lake env lean -DwarningAsError=true ProofAudit.lean
# Stage exactly the accepted objects, then use the unchanged pinned checker
# on the two project namespaces. This avoids one full path scan per module.
lake env python3 ../scripts/replay_lean.py "${modules[@]}"
