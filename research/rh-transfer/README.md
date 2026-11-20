# Riemann hypothesis applications

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Accepted input and objective

At the owner's request, this research accepts the RH and Dirichlet-GRH result in Levent Alpöge's archive as correct. The source is pinned to [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). This is mathematical extraction and proof research; no Lean verification is being performed.

The objective is to settle full named open conjectures or identify and prove the missing mathematical steps that connect them to the archive. Finite numerical cases, parameter increments, renamed known theorems, and unsupported solution claims do not count.

The top-level accepted input says that the nontrivial zeros of the Riemann zeta function and of Dirichlet L-functions lie on the critical line. It does not, by itself, assert GRH for arbitrary number fields or Artin representations, simple zeros, central nonvanishing, or pair correlation. Individual internal theorems require their stated hypotheses.

## Work allocation

| Worker | Mathematical target | Reserved note |
|---|---|---|
| Root | Additional named analytic consequences, independent proof review and synthesis | `analytic-applications.md`, this index |
| `dirichlet_applications` | Lindelöf hypothesis and exact prior-art screening of direct consequences | `dirichlet-applications.md` |
| `arithmetic_extraction` | Vandiver's conjecture and the archive's cohomological bounds | `vandiver.md` |
| `nonabelian_transfer` | Artin's primitive-root density conjecture and transfer to Hecke/Artin L-functions | `artin-density.md` |

Notes are committed only when they contain a substantive source trace, derivation, obstruction, or proof. All workers use `main` and disjoint paths. Other active research lanes are preserved.

## Claim discipline

A previously known implication from RH or Dirichlet GRH is credited to its original authors. Under the accepted input it becomes available, but it is not an original proof discovered in this campaign. An unresolved bridge is stated explicitly. A claimed prior resolution is investigated before a target is selected; silence in a search is not proof of novelty.

The opening search found recent claims concerning Vinogradov's least-nonresidue conjecture and Artin infinitude. These are not being claimed as fresh solutions. The exact-density form of Artin's conjecture is a different statement and is being checked separately.

The source's polynomial weighted cohomology estimate is not yet a proof of Vandiver. The former direct ramification obstruction in one CM theta-lift application can be removed by auxiliary field extension; the character-specific arithmetic estimate and analytic transfer remain to be proved.

## Current status

No new complete conjecture solution is claimed at this checkpoint. Subsequent notes will record complete inherited consequences separately from original proof attempts. The research objective remains active.
