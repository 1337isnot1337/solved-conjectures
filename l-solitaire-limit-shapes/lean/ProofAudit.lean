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
    `CutFamily.large_cut_decreases, `CutFamily.family_b_threshold_of_base_formula]
  for name in required do
    let _ ← getConstInfo name
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let prefixes := #["SolitaireCounterexample.", "War.", "Denominator.", "Egyptian.", "CutFamily."]
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
