# Prime filtering and runner consequences

This development formalizes Lemma 2 and the arithmetic content of Corollary 3
in J. Barajas and O. Serra, [The lonely runner with seven runners](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v15i1r48/pdf/),
Electronic Journal of Combinatorics 15 (2008), R48, DOI 10.37236/772.
The work supplies a published dependency for existing repository results.
Coordination is recorded in [issue #42](https://github.com/1337isnot1337/solved-conjectures/issues/42).

## Exact scope

The prime-filtering theorem handles a finite indexed family with exact
power-divisibility levels and arbitrary forbidden residues. It proves the
level budgets `p - 1` below the chosen maximum and `p - 2` at the top suffice.
The output is available as a natural multiplier coprime to the prime-power
modulus and as an actual unit of that residue ring. Canonical `padicValNat`
levels and their finite maximum remove auxiliary divisibility witnesses.

Partial filtering starts from an arbitrary coprime seed and preserves the
full residue of every higher-divisibility input. The distance corollary uses
this preservation to retain sufficient higher distances while treating lower
levels. Its hypotheses and conclusion use actual folded natural residues.

The runner adapters conclude a genuine `Loneliness.Modular.Witness` and a
bound for `Loneliness.value`, the real supremum of the clearance function.
For positive speeds, let `m` be the maximum 7-adic valuation. If each level
strictly below `m` contains at most three distinct speeds, the value is at
least `1/7`. The highest level is unrestricted. Repeated speeds are allowed.
The separate uniform-level theorem permits any base at least two and any
number of inputs at that exact power-divisibility level.

The unrestricted six-speed runner theorem is still pending. In particular,
the remaining exceptional lower levels with four or five speeds are not
discharged by these statements.

## Verification

The dedicated gate checks exactly 18 modules: twelve new prime-filtering
modules and the six existing dependencies of the modular runner witness.
It requires 68 theorem endpoints and 33 literal contracts. Every source is
compiled in a fresh project-object directory under the pinned compiler,
with warnings treated as errors and no linter override. Every owned
declaration, including private declarations, is audited. Each module is then
replayed as an exact singleton target by the stock kernel checker. The only
permitted transitive axioms are `propext`, `Classical.choice`, and `Quot.sound`.

The complete local run passed all 18 fresh sources, all 33 contracts, the
299-declaration audit, and all 18 stock replays. Its raw receipt SHA-256 is
`2b9cb941c6e2b316e460437856cb6e08027fb55995c97db90086f7da550264c6`.
The audit contains 243 theorems and 10 private declarations. Controller and
statement reviews passed independently. The complete hosted gate also passed
at `e6d53ced9fd3b6ad4a311c3eecbe1fcbd0cdd491`, run `44591941338`.
The twelve new modules are registered after authentication of that original
artifact. [Preserved evidence and scope](verification/prime-filtering-exact-44591941338/README.md)
record the exact source and process bindings. The complete merged-package
gate remains a separate obligation.

The source manifest is `docs/prime-filtering-exact-sources.json`; the verifier
is `scripts/verify_prime_filtering_exact.py`; the workflow is
`.github/workflows/lean-prime-filtering-exact.yml`.
