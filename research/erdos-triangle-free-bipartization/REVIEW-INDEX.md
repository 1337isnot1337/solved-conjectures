# Erdős's triangle-free bipartization conjecture

This is the research index for [Erdős Problem 23](https://www.erdosproblems.com/23) and [coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097). The task is the full all-order theorem: every triangle-free graph of order N admits a cut missing at most N²/25 edges. No full resolution is claimed. These notes are on the research branch for independent written-proof review, not an entry under solved conjectures.

## Prior-resolution check

- [Erdős–Faudree–Pach–Spencer](https://combinatorica.hu/~p_erdos/1988-12.pdf) explicitly set out the sharp open statement and the classical density cuts.
- [Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179) prove the two density tails and the 2N²/47 general upper bound. For unit total vertex mass, the unresolved ordered density band is .2486 to .3197.
- [Ferudun](https://arxiv.org/abs/2606.28041) gives the near-sharp bound in this band with an explicit positive error and an integrality argument for multiples of five through order 200. Neither conclusion is the all-order theorem.
- The [2026 Caro–Wei localization paper](https://arxiv.org/html/2609.00210v1) still states this exact case as open. The [Brandt spectral bound](https://arxiv.org/abs/2204.00093) is established, but bounds a spectral relaxation and does not imply a sharp integral cut without an additional rounding argument.
- Related [Erdős Problems wiki proof notes](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch) are leads and certificate targets, not an accepted all-order resolution. Checks distinguished the sparse-half conjecture (a balance-constrained induced-subgraph problem) and the solved maximum-pentagon-count problem from the bipartization conjecture.

The product-weighted formulation is equivalent to the full finite statement by rational independent blow-ups and continuity. In these notes beta is always the minimum *unordered* missed edge mass, and p=2e is ordered edge density.

## Strongest structural packages for review

| Scope | Proof | What to check |
| --- | --- | --- |
| All circular chromatic number below three, including unbounded Andrásfai templates and preimages | [CIRCULAR-THREE.md](CIRCULAR-THREE.md) | Median split of an acyclic cyclic orientation, the sign rotation, and the density normalization. |
| All four Vega families and their arbitrary edge-deleted preimages, even with an acyclic three-colour core more general than the classical templates | [VEGA-TEMPLATES.md](VEGA-TEMPLATES.md) | Edge-weight capacity bounds, the two mirrored crown cuts, and the strict .0399 middle-band margin. |
| All triangle-free induced-six-path-free graphs and their homomorphic preimages | [INDUCED-PATH-FREE.md](INDUCED-PATH-FREE.md) | The published structural theorem, homogeneous-pair folding, and the weight-stationarity reduction uniform in the size of the climbable template. |
| Proper three-colourings with six directional degree RMS errors at most 1/90, allowing unequal class masses and link densities | [EQUITABLE-THREE.md](EQUITABLE-THREE.md) | Rooted second moment, the inverse-degree mixed term, and exact continuous parameter cover by [the Python checker](verify_biregular_cut.py). |
| Normal Cayley graphs of exponent dividing four with near-uniform weights, and arbitrary product weights for dense additive template preimages | [FLAT-SPECTRAL-CUTS.md](FLAT-SPECTRAL-CUTS.md), [DENSE-ADDITIVE-TEMPLATES.md](DENSE-ADDITIVE-TEMPLATES.md) | Flat signs from monomial representations, quadratic weight error, the binary cap quotient, and the explicit affine-sign laws. These use established spectral or additive structure theorems. |

## What is known about a hypothetical counterexample

- The [graphon maximizer](SATURATED-GRAPHON-EXTREMIZER.md) can be chosen saturated almost everywhere and has a common optimal-cut law that is stationary and passes every independent-neighbourhood attachment test. The local flip defect is linear in the optimality gap. The [finite attachment argument](INDEPENDENT-ATTACHMENT-LAW.md) gives a quantitative near-maximizer version and a second-order layer condition.
- [Pentagon scarcity](TWO-HOP-PENTAGON-CUT.md) and their [root profiles](PENTAGON-PROFILE-CUT.md) constrain both the total pentagon density and the fraction of two-root attachment profiles. [Signed four-path rows](SIGNED-FOUR-PATH.md) incorporate true optimal-cut constraints and are tight at the balanced pentagon. An exploratory signed relaxation did not close the band.
- A [proper-three-colour obstruction](RAINBOW-INDEPENDENT-TRIPLES.md) gives a measurable independent-transversal floor and an incompatible rooted separator test. The [directed six-cycle](DIRECTED-SIX-CYCLE.md) and [Petersen-root profiles](PETERSEN-ROOT.md) give complementary local tests.
- A [half-mass independent set](HALF-INDEPENDENT-CORE.md) cannot have a connected complement at a stationary counterexample; the conclusion is stable near half mass under a fixed lower expansion bound on the complement.
- The [Mycielski control](TEMPLATE-REDUCTION-OBSTRUCTION.md) shows that density, saturation, degree caps and a few local-pattern conditions alone do not force proximity to circular or Vega templates. It has a cheap cut and is not a counterexample.

## Remaining gap

The necessary conditions do not yet force a global maximizing graphon into any of the covered classes or yield an all-order bound directly. One specific next avenue is to find a nontrivial independent-attachment distribution whose payoff is exactly first-order optimal and whose disjointness edges create a useful second-order comparison. Ordinary copied neighborhoods cannot do that on a saturated graphon. A different avenue is to make the signed flag inequalities sufficiently strong in the medium density band. Neither possibility is stated as a completed proof.

No Lean verification work is included here.
