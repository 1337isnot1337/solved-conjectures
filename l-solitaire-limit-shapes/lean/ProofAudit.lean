import Solitaire
import Conjectures
import Lean.Util.CollectAxioms

/-! Fail the build if any project theorem uses an axiom beyond Lean's standard
logical axioms. In particular this rejects sorryAx, native_decide, and any
project-specific axiom, transitively through all imported proof dependencies. -/
open Lean Elab Command in
run_cmd do
  let required : Array Name := #[
    `SolitaireCounterexample.eriksson_jonsson_sjoestrand_conjecture1_counterexample,
    `War.three_standard_cycles, `War.standard_deal_witnesses,
    `War.rank_first_return, `War.seat_first_return, `War.clockwise_first_return,
    `Denominator.finite_coefficient_identity,
    `Denominator.primary_identity_of_representation, `Denominator.primary_coprime,
    `Denominator.dual_identity_of_representation, `Denominator.dual_coprime,
    `Egyptian.batista_greedy_exists, `Egyptian.triple_rational,
    `Egyptian.first_denominator_bound, `Egyptian.unique_maximum_from_pair_optimal,
    `Egyptian.batista_congruence, `Egyptian.batista_admissible_congruence,
    `CutFamily.large_cut_decreases, `CutFamily.family_b_threshold_of_base_formula,
    `BinaryAutomata.certified_list_refinement, `BinaryAutomata.adds_zero_iff,
    `BinaryAutomata.high_xor_iff, `BinaryAutomata.sum_accepts_iff,
    `BinaryAutomata.checked_list_rows, `BinaryAutomata.exists_encoding,
    `BinaryAutomata.DFA.product_accepts, `BinaryAutomata.projection_accepts_iff,
    `CutPeriod.sum_recognizes_successor,
    `CutPeriod.candidate_least_period, `CutPeriod.candidate_saltus,
    `CutPeriod.candidate_least_start,
    `CutPeriod.mex_of_error_languages,
    `CutPeriod.Parts2Certificate.recognizes_piles,
    `BinaryAutomata.fastSuccessors_eq,
    `CutPeriod.CollisionACertificate.rejects, `CutPeriod.CollisionBCertificate.rejects,
    `CutPeriod.MissingACertificate.rejects, `CutPeriod.MissingBCertificate.rejects,
    `CutPeriod.gameA_mex_of_options, `CutPeriod.gameB_mex_of_options,
    `BinaryAutomata.maskOfList_eq_of_normalized,
    `FiniteCertificate.checked_interval_rows,
    `CutPeriod.GraphCertificate.correct, `CutPeriod.LowerCertificate.correct]
  for name in required do
    let _ ← getConstInfo name
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let prefixes := #["SolitaireCounterexample.", "War.", "Denominator.", "Egyptian.", "CutFamily.", "BinaryAutomata.", "CutPeriod.", "FiniteCertificate."]
  let env ← getEnv
  let mut count : Nat := 0
  for (name, info) in env.constants.toList do
    if prefixes.any (fun p => name.toString.startsWith p) then
      if let .thmInfo _ := info then
        count := count + 1
        for axiomName in ← collectAxioms name do
          unless allowed.contains axiomName do
            throwError "Unapproved axiom {axiomName} in {name}"
  logInfo m!"PASS: {count} project theorems use only propext, Classical.choice, Quot.sound"
