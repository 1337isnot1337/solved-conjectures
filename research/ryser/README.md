# Ryser’s conjecture

Tracking issue: [#334](https://github.com/1337isnot1337/solved-conjectures/issues/334).

**Partial result; no full resolution or claim of priority.** A range condition on the positive degrees in the parts proves Ryser’s bound by showing that an entire part is small enough to cover. It applies in every rank, handles nonlinear intersecting hypergraphs, and gives a matching-number-dependent condition for general hypergraphs.

## Exact target and priority screen

Ryser’s conjecture says that the vertex-cover number of an $`r`$-partite, $`r`$-uniform hypergraph is at most $`(r-1)\nu`$, where $`\nu`$ is the matching number. See [DeBiasio, Kamel, McCourt and Sheats, *On the structure of small Ryser hypergraphs*](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v28i4p37) for the statement, background, and the fractional result of Füredi. [White's September 2026 preprint](https://arxiv.org/abs/2609.14281) supplies $`(r,\nu)=(4,2)`$, not the general statement. [Francetić, Herke, McKay and Wanless](https://arxiv.org/abs/1508.00951) give substantial results for *linear intersecting* families; the argument here does not require linearity. [Bishnoi et al., *Ryser’s Conjecture for t-intersecting hypergraphs*](https://pure.tudelft.nl/ws/portalfiles/portal/86509820/1_s2.0_S0097316520301588_main.pdf) distinguish the intersecting conjecture from more strongly intersecting variants; see the degree-counting discussion there for related regular-family bounds. The regular case of ordinary Ryser already follows from Füredi's fractional bound and is not a contribution here. Searches for the range criterion in primary results did not identify the exact statement; this elementary argument could be known.

## Degree range criterion

Let $`m>0`$ be the edge count and let $`1\le a_i\le b_i`$ be the minimum and maximum positive degrees in part $`i`$, after removing isolated vertices. If every part has more than $`(r-1)\nu`$ vertices, necessarily
```math
\frac{m^2}{\nu}-\left(\sum_{i=1}^r(a_i+b_i)-r+1\right)m
   +\bigl((r-1)\nu+1\bigr)\sum_{i=1}^r a_i b_i \le0. \tag{1}
```
Thus a nonnegative discriminant is necessary. A strictly negative discriminant proves the conjectured cover bound. The exact integer criterion can also exclude ranges where no possible integer edge count lies between the roots.

**Proof.** Apply Turán's theorem to the graph on the hyperedges, joining disjoint pairs. Its clique number is $`\nu`$, so there are at least $`m(m-\nu)/(2\nu)`$ intersecting pairs. Each is counted at least once by $`\sum_v\binom{d(v)}2`$. Each part has total degree $`m`$, so
```math
 \sum_v d(v)^2 \ge m^2/\nu+(r-1)m.
```
On the other hand, for a degree $`d`$ in part $`i`$ the elementary inequality $`(d-a_i)(b_i-d)\ge0`$ gives $`d^2\le (a_i+b_i)d-a_i b_i`$. Summing this and using the assumed lower bound on every part size yields (1). A part is a vertex cover, which concludes the claim. No equality in pair counting or regularity assumption was used.

## Intersecting corollary

Suppose $`\nu=1`$, and assume
```math
\frac1r\sum_{i=1}^r\bigl(\sqrt{b_i}-\sqrt{a_i}\bigr)^2 < 1-\frac1r. \tag{2}
```
Then an entire part has at most $`r-1`$ vertices. Indeed, set $`W=\sum_i\sqrt{a_i b_i}`$ and $`B=\sum_i a_i b_i`$. Condition (2) gives
```math
 0<\sum_i(a_i+b_i)-r+1 < 2W\le 2\sqrt{rB}.
```
Hence the discriminant of (1) is negative. In particular any intersecting $`r`$-partite hypergraph with positive degrees globally in $`[a,b]`$ is covered by one part of size at most $`r-1`$ whenever
```math
 b-a<2\sqrt{a(1-1/r)}+1-1/r.
```
For $`r\ge3`$ this includes every intersecting family whose positive degrees differ globally by at most two. It also permits a spread on the order of the square root of the minimum degree, and (2) allows different scales and non-uniform spreads across the parts. The proof works equally for linear and non-linear families; if pairs intersect in multiple vertices, this strengthens the lower bound used in (1).

**Boundary.** This is a sufficient degree condition, not a structure theorem for all intersecting $`r`$-partite hypergraphs. If a few degrees are much larger than the bulk, the quadratic can be inconclusive even when there is a small cover mixing different parts. In particular this proof does not yield the full coefficient for arbitrary $`\nu`$ or even for all intersecting families.
