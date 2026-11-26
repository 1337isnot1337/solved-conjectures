# Erdős–Hajnal local triangle conjecture

**Positive-fraction edge cleanup barrier.** At the published Mattheus–Verstraëte retention rate, the random Hermitian split graph has Ω(q⁵(log q)⁴) pairwise edge-disjoint Moser spindles with high probability. In particular, removing all spindles on the retained vertex set requires deleting a positive fraction of the edges, not just a positive fraction of vertices under induced cleanup. This is a statement about the random model; it does not settle Erdős #813.

## Completions of partly prescribed spindles

Use the [Θ(q¹⁷) geometric patterns](SPINDLE-SHARP-COUNT.md) with eleven distinct unital intersections and with u nonincident to both opposite tips v,w. Label the cores A,B for tips u,v and C,D for tips u,w. Call two lines incident here when their projective intersection belongs to the unital. We use the following bounds:
- A secant has O(q³) incident other secants.
- Two distinct secants have O(q²) common incident secants. If a common secant meets them at distinct unital points, those two points determine it, giving at most (q+1)² choices. Otherwise it is in their common unital pencil, which contains q² secants.
- A diamond with two prescribed geometrically nonincident tips has O(q³) ordered core pairs by the [projection argument](SPINDLE-COUNTING-SCALE.md). If one core is also prescribed, the other has at most q+1 choices: choose its intersection with one tip and use the unique possible intersection with the other.

We count completions when prescribed labels are distinct. Bounds are uniform in the labels and secants assigned to them; they are allowed to count invalid completions.

**Two labels forming a required edge: O(q¹⁰).** If the edge is vw, choose u and the two core pairs in O(q⁴q³q³) ways. If it is a core-core edge AB or CD, choose its two tips as common incident secants, then the other tip and its core pair, in O(q²q²q³q³) ways. If it is any core-tip edge, choose the still missing tip of that diamond incident to the known core, complete the other core, then pick the remaining tip and its full core pair, in O(q³ q q³ q³) ways. The narrow one-core bound applies because the opposite tips are geometrically nonincident.

**Three labels: O(q⁹).** The cases are listed below, up to exchanging the two diamonds and permuting the core labels inside either diamond.
- If u and one tip are fixed, complete their diamond, the missing tip if any, and the second diamond for a bound O(q³q³q³).
- If u but neither tip is fixed, the two other known labels are cores. If from one diamond, choose its tip incident to both, the other tip, and the second core pair for O(q²q³q³). If the cores are from different diamonds, choose the first tip incident to its known core, the second tip incident to both the first tip and its own known core, then the two missing core lines using common incidence. This gives O(q³q²q²q²).
- If none of u,v,w is fixed, the three fixed labels contain a full core pair and a third core. Choose u and the first tip incident to the full pair, the second tip incident to the first tip and the third core, and the missing core incident to its two tips. This is O(q²q²q²q²).
- If both v,w are fixed but u is not, choose u incident to the known core, complete the single missing core of that diamond, and choose the other core pair. This is O(q³q²q³).
- If v alone is fixed among u,v,w, and the known cores are A,B, choose u incident to both, then w incident to v and its full pair of cores, in O(q²q³q³). For known cores C,D, both u and w are incident to both, and the remaining diamond has O(q³) core pairs, giving O(q²q²q³). For mixed A,C, choose u incident to both, w incident to v,C, and each missing core incident to its two known tips, in O(q²q²q²q²).

**Four labels: O(q⁸).** Each of the three unassigned labels has at least one prescribed neighbor, since every spindle vertex has degree at least three. If any has two prescribed neighbors, then that label has O(q²) choices and each of the other two has O(q³). Otherwise the unassigned labels form a triangle whose three vertices each have degree three. The only possibilities are v,A,B and w,C,D. Then choose its tip incident to the opposite known tip and complete its diamond using the known apex u, for O(q³q³).

**Five, six or seven labels.** With five fixed labels each missing line has at least two prescribed neighbors, giving O(q⁴) total. With six fixed labels even choosing the last among all lines gives O(q⁴). Seven fixed labels leave O(1) possibilities.

Consequently the numbers of ordered pairs of potential copies sharing a required edge and exactly r vertices, for r=2,3,4,5,6,7, are at most constant multiples of q raised to powers 27,26,25,21,21,17 respectively. Choose the first copy in O(q¹⁷) ways, then one of constantly many label identifications and apply the uniform completion bound to the second.

## A mean-square bound for retained edges

Put L=log q and p=L²/q. The [sharp count](SPINDLE-SHARP-COUNT.md) gives at least c q¹⁰L¹⁴ actual copies from our family with high probability, for an absolute positive c. We upper bound their edge overlaps using retention only, independent of the colors of the pencils.

For an edge e of the unsplit incidence graph, let d_e count potential copies containing e as a required edge whose other five vertices are retained. Let m_e be its mean; the two-label bound gives m_e=O(q¹⁰p⁵)=O(q⁵L¹⁰), uniformly. The random variable d_e is independent of the indicator that both endpoints of e are retained. Conditionally on this indicator, two summands in d_e are independent if their patterns share only the endpoints of e. If they share r≥3 vertices, the unconditional probability of retaining the whole union of the two patterns is p^(14−r). Summing over retained e counts each pair at most eleven times. Thus
```math
\mathbf E\!\left[\sum_{e\,\mathrm{retained}}(d_e-m_e)^2\right]
\ll q^{26}p^{11}+q^{25}p^{10}+q^{21}p^9+q^{21}p^8+q^{17}p^7
=O(q^{15}L^{22})=o(q^{15}L^{24}).
```
The unsplit graph has Θ(q⁷) edges and maximum degree O(q³). The expected number of retained edges is Θ(q⁷p²)=Θ(q⁵L⁴); its variance is O(q⁷p²+q¹⁰p³)=o((q⁷p²)²) by counting edge pairs with a shared endpoint. Therefore the retained-edge count is O(q⁵L⁴) with high probability. Markov and the uniform bound on m_e give the following bound with high probability:
```math
\sum_{e\,\mathrm{retained}}d_e^2=O(q^{15}L^{24}).
```
Construct an auxiliary graph on the actual split-surviving copies from our family, with two copies joined if they share a required edge. Its number of edges is at most half the last display. The bound that a graph on Z vertices with E edges has an independent set of size at least Z²/(Z+2E) yields Ω(q⁵L⁴) pairwise edge-disjoint spindles. Every edge deletion destroying all spindles must hit each one, while the entire split graph has at most O(q⁵L⁴) edges. This proves the positive-fraction obstruction. No claim is made that deleting a positive fraction cannot preserve small independence.

## The entire square-root-beating range of independent thinning

In fact, allow independent vertex retention p and independent edge retention s in addition to the fair random pencil splits. These parameters may depend on q. If
```math
\rho=q^2ps^2\longrightarrow\infty,
```
there are Ω(q⁷p²s) edge-disjoint spindles with high probability. The denominator is the order of the expected number of retained unsplit edges, so the same positive-fraction obstruction holds throughout the range. In particular it covers every fixed pair of exponents p=q^(−a), s=q^(−b) with a+2b<2, which is the only range where this model could beat the square-root independence scale by a fixed power.

Here are tighter uniform completion bounds to prove this. Write c(S) for an exponent bound on the number of completions when the labels in S are prescribed. Enumerate the following choice moves:
1. A new line adjacent to k already prescribed lines can be chosen at cost exponent 4−min(2,k), by the total-line and common-incidence bounds.
2. If the two tips of a diamond are present, its not-yet-present core lines can be chosen together at cost exponent 3 when both are missing, or exponent 1 when only one is missing.

Set c(all seven labels)=0. For each smaller S, define c(S) as the minimum, over these moves, of the move cost plus c(the enlarged set). This is a valid uniform exponent bound by induction on the number of missing labels. For reproducibility, the short [exact subset recurrence](check_completion_exponents.py) computes the following table, over all choices of specified labels, without any finite-field experiment:
 
| Number r of prescribed labels | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Maximum completion exponent | 13 | 10 | 8 | 6 | 4 | 2 | 0 |
| Maximum required edges on those labels | 0 | 1 | 3 | 5 | 6 | 8 | 11 |

The second row follows by inspecting the same fixed label set and gives at most 2r−3 edges for r≥2. To see how to check the first row directly, the recurrence is over the 128 masks from 127 down to 0: for each unset bit take 4 minus its already-set neighbor count capped at two, plus the entry with that bit set; for each diamond with the tip bits set also try adding its remaining core bits for cost one or three. The minimum is the entry. Thus the table is purely a finite verification of uniform geometric proof steps, not evidence from particular field sizes.

Use the same Θ(q¹⁷) potential copies as above. Let Z count those surviving both retention steps and the splits. Its mean is Θ(q¹⁷p⁷s¹¹). For copies sharing r vertices and k required edges the joint survival probability is at most p^(14−r)s^(22−k); disjoint vertex sets give independent indicators. By the completion table, the relative variance contribution for r≥2 is at most a constant times
```math
q^{-3-2r}p^{-r}s^{-k}\le q^{-3}\rho^{-r},
```
since k≤2r−3 and s≤1. The r=1 term is O(q^(−4)/p)=o(1). Thus Z is at least a positive constant times its mean with high probability.

Now define d_e for each unsplit edge as before but require retention of the other ten edges as well as the other five vertices. It is independent of retention of the root edge and its two endpoints. Its mean is at most O(q¹⁰p⁵s¹⁰). The number of retained unsplit edges is O(q⁷p²s) with high probability: the variance bound is O(q⁷p²s+q¹⁰p³s²), while the expectation has order q⁷p²s≥q³ρ². For the sum over retained roots of the variance of d_e, pairs sharing no other vertex have conditional covariance zero. For r≥3, with k shared required edges including the root, its contribution relative to q²⁷p¹²s²¹ is bounded by
```math
q^{-2(r-2)}p^{-(r-2)}s^{-(k-1)}\le \rho^{-(r-2)}=o(1).
```
There are finitely many r and k, and a copy pair is counted for at most eleven roots. The relative bound follows using k−1≤2(r−2). Markov therefore gives that the sum of d_e² over retained edges is O(q²⁷p¹²s²¹) with high probability, using the uniform squared-mean bound for the other part of the sum. Apply the same elementary independent-set inequality to the edge-intersection graph of actual copies. The result is Ω(q⁷p²s) pairwise edge-disjoint copies, as asserted. This does not exclude carefully deleting a positive fraction of the edges while keeping the independence number small.
