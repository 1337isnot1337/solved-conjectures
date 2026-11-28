# Erdős's triangle-free bipartization conjecture

This is the research index for [Erdős Problem 23](https://www.erdosproblems.com/23) and [coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097). The task is the full all-order theorem: every triangle-free graph of order N admits a cut missing at most N²/25 edges. No full resolution is claimed. The [Vega partial theorem was independently reviewed and published on main](https://github.com/1337isnot1337/solved-conjectures/pull/1106). The remaining notes are research material, not an entry under solved conjectures.

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

- The [agreement-block theorem](OPTIMUM-CUT-OVERLAPS.md) says any two true optimum cuts decompose into independent optimum problems on agreement and disagreement blocks. The spans of the two blocks' optimum signs have zero cross adjacency pairing. This excludes a half-mass independent overlap with an arbitrary bipartite complement under the stationary maximum-degree cap.

- The [uniform near-half dictionary](HALF-INDEPENDENT-DICTIONARY.md) localizes the entire set of almost-half independent sets at a stationary maximizer to at most eight candidates on one common paired partition, not merely a finite sample of sets. The original graph's minimum degree, forced-to-cross edges, and the stationary monochromatic kernel all enter the proof. It applies to graphons and does not require that an almost-half independent set exists.

- The [covering theorem](HALF-INDEPENDENT-COVER.md) excludes any stationary extremizer whose half independent sets cover the space, by converting at most four such sets and a true optimum sign into a fractional 8/3-colouring. Its robust form quantifies the allowed coverage and independence deficits.
- The [complement phase theorem](HALF-INDEPENDENT-PHASES.md) also excludes any half independent set whose stationary law can be aligned to a fixed complementary colouring with little attachment-edge disagreement even if the complement is disconnected. Both new notes have [exact checks](verify_half_independent.py) for their scalar arithmetic.

- The [mixed independent-law cut](MIXED-INDEPENDENT-LAW-CUT.md) uses a common random threshold to turn any balanced independent-set law into a quantitative cut inequality. It does not assume a half independent set exists. An adjustable sampler gives a sharp-bound certificate when coverage is at least one third and mean independent mass is at least .4235; it retains two monochromatic-edge heterogeneity savings. A weighted-independence separation theorem characterizes exactly whether the required law exists.
- The [guarded split-and-trim perturbation](SPLIT-AND-TRIM.md) gives a second-order test for nontrivial trimmed neighborhoods, including graphons with infinitely many optimum cuts when the perturbed rows have compact closure.
- The [demand-lift theorem](GEODESIC-DEMAND-LIFTS.md) reduces strict violations of the auxiliary distance moment to rational class-cut data and transfers them to exact unweighted maximum cuts. No violation was found in path or cyclic-supply probes, and those probes do not constitute a proof.

- [One-sided trim obstruction](ONE-SIDED-TRIM-OBSTRUCTION.md): the common stationary law already crosses all additions that are made possible by trimming just one endpoint. For a two-sided proposal, the exact exchange inequality counts only conflicts contributed by oppositely signed additions. It applies to a measurable law and does not need a finite set of optimum cuts.
- [Matching between tight attachments](TIGHT-ATTACHMENT-MATCHING.md): original adjacent neighborhoods and disjoint guarded trimmed neighborhoods have a capacity matching lower bound (2B) plus the expected paired opposite-sign margin. This is a local constraint on rooted three-edge paths, not a lower bound on their density without additional information.

- The same [mixed-cut proof](MIXED-INDEPENDENT-LAW-CUT.md) can be applied to one fixed optimum cut with the independent-set mass measured by its missed degrees. Three overlapping independent sets give a separate five-cut certificate with core penalty `2 beta(core)/5` and an error bound for imperfect covers. At stationary middle-band graphs, overlap mass at least `797/3200` suffices. The test can optimize overlap within the flexible vertices of a fixed proper three-colouring.

## Remaining gap

The necessary conditions do not yet force a global maximizing graphon into any of the covered classes or yield an all-order bound directly. One specific next avenue is to find a nontrivial independent-attachment distribution whose payoff is exactly first-order optimal and whose disjointness edges create a useful second-order comparison. Ordinary copied neighborhoods cannot do that on a saturated graphon, and one-sided guarded trimming cannot force any missed addition in the common optimum law. A different avenue is to make the signed flag inequalities sufficiently strong in the medium density band. Neither possibility is stated as a completed proof.

No Lean verification work is included here.
