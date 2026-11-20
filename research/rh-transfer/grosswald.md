# Grosswald's conjecture

Research checkpoint: 20 November 2026. Discussion: [issue #91](https://github.com/1337isnot1337/solved-conjectures/issues/91). Campaign: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Statement

For a prime p, let g(p) be the least positive integer whose residue generates the cyclic group (Z/pZ)^*. The full conjecture is

~~~math
g(p)<\sqrt p-2\qquad\text{for every prime }p>409.
~~~

The exceptional cutoff is part of the named statement. This note does not replace it with a larger cutoff or a verified interval.

## Status

The full conclusion follows from the campaign's accepted RH/Dirichlet-GRH input by an existing published theorem. This is an inherited consequence, with no new-proof or priority claim.

The source input is the archive pinned at [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e), accepted at the owner's instruction. No Lean verification is performed.

## Proof from the accepted input

Let p>409 be any prime.

Every nonprincipal character modulo p is primitive. The accepted Dirichlet result therefore supplies GRH for every nonprincipal L(s,chi) used in the primitive-root character expansion at this p. The accepted zeta result supplies RH for the principal contribution. Equivalently, the principal character modulo p has L-function zeta(s)(1-p^(-s)); its extra Euler-factor zeros lie on Re s=0 and create no extra zero in the open critical strip.

McGown–Treviño–Trudgian's Theorem 1 then gives g(p)<sqrt(p)-2. Because p was arbitrary, the conclusion holds for every prime in the required range.

The dependency check is exact: Section 2, Lemma 1 of their paper uses smoothed von Mangoldt sums for zeta and nonprincipal Dirichlet characters modulo p. Their subsequent sieve and finite verification complete the full theorem. No GRH for Kummer fields, arbitrary Dedekind zeta functions, or nonabelian Artin L-functions is required.

This application invokes the published theorem including its finite verification. The computations have not been rerun here. A proof by invoking that theorem must not be described as a new computational proof.

## Primary references and prior-art check

1. **Kevin McGown, Enrique Treviño and Tim Trudgian**, *Resolving Grosswald's conjecture on GRH*, Functiones et Approximatio, Commentarii Mathematici **55** (2016), 215–225, [DOI 10.7169/facm/2016.55.2.5](https://doi.org/10.7169/facm/2016.55.2.5). Theorem 1 and the Dirichlet-character input were read in the [author-hosted paper](https://campus.lakeforest.edu/trevino/GrosswaldGRH.pdf) and [arXiv copy](https://arxiv.org/pdf/1508.05182). The [ANU publication record](https://researchportalplus.anu.edu.au/en/publications/resolving-grosswalds-conjecture-on-grh/) confirms journal publication. The full conditional proof belongs to these authors.

2. **Gustav Kjærbye Bagger**, *A note on least primitive roots*, [arXiv:2608.20431](https://arxiv.org/abs/2608.20431), August 2026. Its primary arXiv search record describes an unconditional result only above 1.77 times 10^54 and continues to state the full conjecture. Direct PDF/HTML retrieval failed, so the status check here uses the indexed abstract, not an asserted reading of the complete paper. The [author's university page](https://www.unsw.edu.au/hdr/gustav-bagger) independently lists this 2026 preprint.

3. The [2017 UNSW number-theory seminar announcement](https://www.unsw.edu.au/science/our-schools/maths/engage-with-us/seminars/2017/grosswalds-conjecture-primitive-roots) distinguishes the complete GRH-conditional proof from incomplete unconditional results. The [2019 UCI research talk](https://www.math.uci.edu/node/36417) likewise discusses an unconditional large-prime bound rather than a full resolution.

Searches on 20 November 2026 used both search engines, exact-name and exact-title queries, recent-year filters, and searches for unconditional resolution, corrections, and errata. No full unconditional resolution independent of GRH was identified. The positive evidence is the 2026 paper's continued partial status; absence of a search result alone would not establish openness.

## Attribution boundary

The full statement becomes available after accepting the archive's input. The mathematical implication from GRH was already proved in 2016. Consequently this belongs in the campaign's list of complete inherited consequences, alongside the Lindelöf and original Chebyshev implications, rather than in a count of newly discovered proof methods.

The harder Artin-density target is different: it needs analytic information about nonabelian Kummer extensions. The character-sum argument used here cannot silently be substituted for that missing input.
