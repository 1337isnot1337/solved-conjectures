# Gaussian bounty search and Justin Sun Prize audit, 2026-11-21

## Result status

No new solution, accepted award, or received payment is established by this work. All Gaussian identities found so far match earlier examples. Finite search bounds are recorded as research provenance; they do not settle a general conjecture and are not counted as completed bounties.

## Sponsor and scope

[Ed Pegg Jr.'s original reward page](https://mathpuzzle.com/Gaussians.html), inspected on 2026-11-21, still publicly offers $10 for each new example or new class of Gaussian Fermat–Catalan numbers. The bases must be pairwise relatively prime. We use the standard condition

`X^p + Y^q = Z^r`, with nonzero Gaussian integers `X,Y,Z`, integers `p,q,r>1`, and `1/p+1/q+1/r<1`.

The searches require all three bases to be nonunits. Rewriting a previous identity using units, conjugation, permutation, or a different exponent/base representation is excluded. The Python verifier canonicalizes the three signed **power values**, rather than just the base norms, to detect these repetitions.

This is an explicitly rewarded example-finding task. It is not a proof of the Gaussian Fermat–Catalan finiteness conjecture. The user's earlier prohibition on numeric cases means that an example, even if found and accepted for payment, must remain distinguished from a full open-conjecture solution. The public offer is evidence of the posted reward; it is not a current personal confirmation by the sponsor, an award decision, or proof that payment will occur. No sponsor email was sent.

The same page's $10 offer for a further Gaussian Beal example is a separate possible award, not automatically an additional payment for the same identity.

## Prior examples excluded

The exact list is executable in `verify_candidates.py`, including the ten ordinary integer examples (one unit-based family and nine nonunit triples).

| Source | Gaussian identity |
| --- | --- |
| Pegg original | `(8+5i)^2+(5+3i)^3=(1+2i)^7` |
| Pegg original | `(20+9i)^2+(1+8i)^3=(1+i)^15` |
| Helenius | `(5i)^3+(3i)^7=(34-34i)^2` |
| Helenius | `(49+306i)^2+(1+2i)^7=(27+37i)^3` |
| Helenius | `(44+83i)^2+(31+39i)^3=(5+2i)^7` |
| Helenius | `(19+36i)^2+(1-i)^13=(9+8i)^3` |
| Helenius | `(2+i)^4+(1+i)^9=(5+4i)^2` |
| Helenius, Beal paragraph on same page | `(-2+i)^3+(-2-i)^3=(1+i)^4` |
| Oleg567, 2012 | `(238+72i)^3+(7+6i)^8=(7347-1240i)^2` |
| Howe–Huffman–Kohlmeyer–Kruer, 2026 | `(2761+2761i)^2+(239i)^3=(3i)^13` |
| Howe–Huffman–Kohlmeyer–Kruer, 2026 | `(2797i)^3+(13i)^9=(75090-75090i)^2` |

Sources:

- [Pegg, original page](https://mathpuzzle.com/Gaussians.html).
- [Pegg, Gaussian Numbers, MAA column, 2004-03-15](https://mathpuzzle.com/MAA/15-Gaussian%20Numbers/mathgames_03_15_04.html).
- [Pegg's Math.SE question and Oleg567's answer, 2012-11-10](https://math.stackexchange.com/questions/69291/complex-solutions-for-fermat-catalan-conjecture). This is earlier than the March 2025 personal-communication date attached to the corresponding MathWorld update.
- [Howe et al., Two primitive Gaussian Fermat–Catalan identities, 2026-11-20](https://hexagonmath.org/pdf/2611.00682v1), manuscript dated 2026-11-19. Their second underlying integer relation already appears in Cazorla García's work. Neither identity is new here.
- [MathWorld Fermat–Catalan table](https://mathworld.wolfram.com/Fermat-CatalanConjecture.html). The sponsor page has the typo `3^5+11^3=122^2`; the correct ordinary identity uses `11^4`, as verified in the checker.

These sources are an exclusion table, not a claim to have exhaustively catalogued all prior results. Any unmatched candidate would require a new literature search before a novelty claim.

## Other Pegg offers excluded

The $100 first proper Gaussian perfect number is already resolved under the sponsor's exact positive-divisor convention. Current [MathWorld](https://mathworld.wolfram.com/PerfectGaussianInteger.html) credits A. Sanchez Solovieva (2026) with

`q=430089+665198i`, `-q=(1+2i)^3(5+2i)(38+17i)(316+5i)`.

An independent exact local calculation enumerated the 32 divisors, chose each associate with real part positive and imaginary part nonnegative, and obtained total `(860178,1330396)=2q`. Thus the sum of proper selected divisors is `q`. The sponsor explicitly includes perfect numbers as cycles of length one, so its first-aliquot-cycle $50 offer cannot safely be treated as still open either. Gaussian amicable pairs using Spira's multiplicative divisor function are a different convention and must not be substituted.

The $50 Chaos Tiles task also has a published [66-tile solution dated 2026-11-20](https://hexagonmath.org/2611.00680v1). It is excluded.

## Computation and verification

The C++ programs perform exact Gaussian multiplication, integer-corrected root tests, and exact Gaussian Euclidean gcd calculations. Floating-point root estimates are followed by exact equality checks. Every emitted identity is independently checked with Python arbitrary-precision integers by `verify_candidates.py`. Modular filters are accelerators, not the evidence for an identity.

Completed screens:

| Program | Bounds | Outcome |
| --- | --- | --- |
| `search_gaussian` | `x^2+y^3=z^r`, each coordinate of `y` in `[-600,600]`, each coordinate of `z` in `[0,10]`; `r=7,8,9,10,11,12,13,14,15,17,19` | 11 raw hits, all previous power triples |
| `search_gaussian` | `x^2+y^3=z^7`, `y` coordinates in `[-1800,1800]`, `z` coordinates in `[0,20]` | 5 raw hits, all previous power triples |
| `search_gaussian_generic` | `x^2+y^5=z^r`, `y` coordinates in `[-150,150]`, `z` coordinates in `[0,15]`; `r=5,6,7,8,9,10,11,12,13,14,15,17,19` | No primitive nonunit hits |
| `search_beal` | `x^3+y^3=z^r`, `y` coordinates in `[-300,300]`, `z` coordinates in `[0,20]`; `r=4,5,7,8,9,10,11,13,14,15,16,17,19` | Helenius's example and swapped duplicate only |

The Gaussian searches skip `z^r` when either coordinate exceeds `10^18` in absolute value, to keep the norm inside signed 128-bit range. The cube-root program tests nearby lattice points after an exact norm-cube test. These limits are part of the recorded screen, not global nonexistence conclusions.

The separate `search_twisted` program completed the search over odd `3<=a<=10^8`, odd `3<=b<=99`, `r=7,9,11,13,15,17,19`, both signs and both signs of the result, for `a^3 ± b^r = ±2c^2` with `gcd(a,b)=1`. A `b^r<=2^120` guard truncates the `r=19` search at `b=79`; it must not be described as covering `b<=99` in that exponent. Its only three hits are the prior Helenius and Howe et al. examples above. The first small preliminary run was superseded because the modular filter initially omitted negative right-hand sides; the checked-in source includes both signs.

Reproduction (from this directory):

```sh
g++ -O3 -std=c++20 search_gaussian.cpp -o /tmp/search_gaussian
/tmp/search_gaussian 600 10 0 3
/tmp/search_gaussian 1800 20 7 3
/tmp/search_gaussian 150 15 0 5
g++ -O3 -std=c++20 search_beal.cpp -o /tmp/search_beal
/tmp/search_beal 300 20
g++ -O3 -std=c++20 search_twisted.cpp -o /tmp/search_twisted
/tmp/search_twisted 100000000 99
python3 verify_candidates.py gaussian_candidates.jsonl gaussian_r7_extended.jsonl gaussian_q5_candidates.jsonl twisted_candidates.jsonl beal_candidates.jsonl
```

The root agent owns the disjoint `(2,4,r)` search and its structural factor-allocation extension; see the separate session files.

## Justin Sun Prize screening receipts

Rules checked: [official rules](https://www.hejustinsun.com/prize/rules), [FAQ](https://www.hejustinsun.com/prize/faq), [canonical award process](https://github.com/TheJustinSunPrize/awards/blob/main/docs/award-process.md), and [MathDB process](https://github.com/TheJustinSunPrize/awards/blob/main/docs/award-process-mathdb.md). The legacy solver/formalizer split is 70%/30%; MathDB allocates 50%/30%/20% to solution, formalization, and exposition. A new Lean formalization of older mathematics may be a separate award category. A catalog `No` Lean flag is not proof of an unclaimed opportunity; open submissions and source validity matter. Award amounts and eligibility require actual organizer decisions.

Seven fresh IDs beyond the earlier local audits were screened. Each has at least a prior full-scope submission claim or source. This does not independently certify the prior source or prove that a reward has already been paid.

| JSP | Actual target | Relevant prior full-scope claim |
| --- | --- | --- |
| 000248 | Erdős 292, density-one characterization of largest Egyptian denominator | [PR 781](https://github.com/TheJustinSunPrize/awards/pull/781); some other PRs mis-map it to 286 |
| 000264 | Erdős 318, zero-sum signed reciprocals, including square question | [PR 1593](https://github.com/TheJustinSunPrize/awards/pull/1593), [PR 105](https://github.com/TheJustinSunPrize/awards/pull/105) |
| 000281 | Erdős 339, lower and upper density clauses | [PR 681](https://github.com/TheJustinSunPrize/awards/pull/681), full conjunction and pinned build evidence |
| 000298 | Erdős 360, optimal-order coloring bound | [PR 1678](https://github.com/TheJustinSunPrize/awards/pull/1678); PR 353 only gives a weaker cubic-root bound |
| 000346 | Erdős 421, density-one distinct block products | [PR 1426](https://github.com/TheJustinSunPrize/awards/pull/1426); PR 470 explicitly marks its different partial bound ineligible |
| 000399 | Erdős 494, eventual unique recovery for every `k>2` | [PR 1466](https://github.com/TheJustinSunPrize/awards/pull/1466), including the Gordon–Fraenkel–Straus endpoint; several other submissions prove only easy negative cases |
| 000211 | Erdős 240, gaps for an arbitrary infinite prime set | [PR 1274](https://github.com/TheJustinSunPrize/awards/pull/1274); PR 938's one-prime special case is insufficient |

Further work must inspect the actual target definitions, axiom closure, build evidence, acceptance, and priority rather than count a PR title as either a valid proof or automatic disqualification.

## Direct inspection of earlier verification

The GitHub connector retrieved actual workflow job records and logs, beyond the submitters' descriptions:

| Prior proof | Actual job | Observed build and axiom evidence | Prize PR status |
| --- | --- | --- | --- |
| Erdős 494, complete GFS result | [run 35378577767, job 105709074105](https://github.com/hongjin-he/erdos-lean/actions/runs/35378577767/job/105709074105) | Job success; 9,116-job build completed 2026-09-18T18:13:17Z; both `Erdos494.erdos_494` and `Erdos494.gordon_fraenkel_straus` print only `propext`, `Classical.choice`, `Quot.sound` at 18:13:49Z | PR 1466 open, unmerged |
| Erdős 339, both density clauses | [run 35229071831, job 105228084769](https://github.com/x2515102083/erdos339-upper-density/actions/runs/35229071831/job/105228084769) | Job success; 1,572-job build completed 2026-09-17T13:47:25Z; lower-density, upper-density, quantitative and complete-conjunction targets print only the same three axioms at 13:47:27Z | PR 681 open, unmerged |

The logs are evidence of those contributor-controlled executions. This session did not rebuild those repositories or independently replay their kernels. Acceptance, priority and payment are different questions. These observations establish enough substantive earlier proof evidence to reject treating these as clean first-formalization opportunities.

Actual current `plby/lean-proofs` source endpoints for Erdős 240 and 421 were inspected as well. Their original quantifiers are preserved; `Erdos240.erdos_240` discharges its Baker interface through an unconditional final source assembly, and `Erdos421.erdos_421` uses a density-one theorem of its actual candidate. No target was replaced by an evident extra premise in those inspected files. Their large transitive developments were not locally rebuilt or fully audited.

Four additional metadata/source-scope investigations also found substantial previous complete formalizations: JSP 747 / Erdős 896 ([PR 1040](https://github.com/TheJustinSunPrize/awards/pull/1040)), JSP 759 / Erdős 915 ([PR 739](https://github.com/TheJustinSunPrize/awards/pull/739), explicitly acknowledging earlier complete proof), JSP 842 / Erdős 1012 ([PR 501](https://github.com/TheJustinSunPrize/awards/pull/501)), and JSP 912 / Erdős 1099 ([PR 691](https://github.com/TheJustinSunPrize/awards/pull/691)). These are prior-art leads; their entire proof closure is not certified here.
