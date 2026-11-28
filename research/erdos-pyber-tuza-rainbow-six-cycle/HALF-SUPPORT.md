# The half-support graphon case

**Partial theorem.** Let $W_1,\dots,W_6$ be balanced six-color graphon kernels with zero rainbow six-cycle density. Suppose every color has support of measure at least $1/2$ in almost every row. Then one three-color union is disconnected, so the graphon is a parity-cut model. In particular this holds if every $W_i\le1/3$ almost everywhere. This theorem was developed in a research pass and independently checked against the active #870 graphon formulation.

## A constraint from overlapping colors

For an unordered pair of distinct colors $`p=\{i,j\}`$, put $U_p=\min(W_i,W_j)$ and write $d_p$ for its row integrals. If $p,q,r$ partition the six colors into three pairs, the rainbow density bounds below the squared Hilbert–Schmidt norm of the kernel product $U_pU_qU_r$: take two three-edge paths with common endpoints, using one color from each pair in each matching position and reverse the second path around the cycle. Their product is at least the corresponding product of minima. Thus the product kernel vanishes. Integrating its two endpoints gives
```math
\int d_p(x)U_q(x,y)d_r(y)\,dx\,dy=0.
```
All factors are nonnegative. Therefore for almost every pair $(x,y)$ there cannot be one pair of overlapping colors at row $x$, a disjoint pair both positive at $(x,y)$, and a third disjoint pair overlapping at row $y$, where overlap in a row means their positive sets intersect in positive measure.

Form a graph $H_x$ on the six colors whose edges are the overlapping pairs at row $x$. For almost every $(x,y)$ all colors positive at $(x,y)$ form a clique in both $H_x,H_y$. Indeed, for any fixed color pair, integrate its minimum over rows of overlap degree zero, and use symmetry for columns; the exceptional set is null.

## Three active colors force a common palette split

At a typical row, nonadjacent colors in $H_x$ have disjoint supports, so by the hypothesis their supports are exact complementary half-sets. Thus the complement of $H_x$ consists of isolated vertices and complete bipartite components, each bipartition side having at most three colors: four kernels supported on a single half-set would contribute degree $4/6$ within available mass $1/2$.

Fix a typical pair $(x,y)$ and three active colors $R$, and let $S$ be the remaining three. If an edge of $H_y[S]$ omits color $s\in S$, then $s$ is nonadjacent in $H_x$ to all of $R$: otherwise an $H_x$ edge joining it to $r\in R$, the other two active colors in the middle, and the given $H_y[S]$ edge contradict the overlap constraint. A color in $S$ nonadjacent to all three of $R$ must be adjacent to the other two of $S$, since the opposing side of its complement component already has all three available positions. There is an edge of $H_y[S]$ because its complement is triangle-free. It first yields a color adjacent to the other two of $S$ in $H_x$, then those two edges imply that the other two colors of $S$ miss all of $R$ in $H_y$. Now $H_y[S]$ is complete, so every $S$ color misses all of $R$ in $H_x$, and then the same holds in $H_y$. In both rows the complement is exactly the complete bipartite graph with sides $R,S$.

In particular there cannot be four active colors, since they would form a clique in a disjoint union of two triangles. The total support area summed over the six colors is at least three, so almost every pair has exactly three active colors. Their row splits agree at almost every pair, giving one fixed pair of palettes $A,B$. Almost every pair uses exactly one entire palette.

## A spectral equality finishes the proof

Let $Q$ be the indicator of palette $A$, and treat kernels as integral operators. Its row degree is $1/2$ by exact balance and $J-Q$ is the indicator of palette $B$. The integral for six consecutive kernels $Q,Q,Q,J-Q,J-Q,J-Q$ is zero: on its support a corresponding order of six distinct colors has strictly positive weights, so positive integral would contradict zero rainbow density. As $Q$ and $J-Q$ commute with the projection $J$ onto constants, the integral is
```math
\mathop{\mathrm{tr}}(Q^3(J-Q)^3)=1/64-\sum_{\lambda}\lambda^6,
```
where $\lambda$ ranges over the nonconstant eigenvalues of $Q$. Symmetry and row degree give operator norm at most $1/2$. As $Q$ is an indicator, its squared Hilbert–Schmidt norm is $1/2$, leaving $\sum\lambda^2=1/4$ after the constant eigenvalue. Thus equality in $\sum\lambda^6\le (1/2)^4\sum\lambda^2$ forces exactly one nonconstant eigenvalue, of absolute value $1/2$. Consequently $Q(x,y)=(1\pm\phi(x)\phi(y))/2$ almost everywhere for a real mean-zero unit eigenfunction $\phi$. The indicator values force $|\phi(x)\phi(y)|=1$ almost everywhere, hence $\phi$ takes the values $\pm1$ on two equal halves. One palette union is the indicator of edges within the two halves.

See [the graphon criterion](GRAPHON-CRITERION.md) and [parity stability](PARITY-CUT.md) for the consequence that this cannot be a limit of an unbounded balanced finite counterexample sequence. The unrestricted structural statement remains open.

## An open neighborhood below one half

The exact rigidity conclusion still holds if the row support threshold is weakened to $1/2-10^{-20}$.

Let $0\le\delta\le10^{-20}$ denote the deficit. If two positive supports are disjoint at a row, each differs by at most $2\delta$ in measure from the complement of the other. Therefore the complement of the row overlap graph is bipartite: an odd cycle on these six color vertices has length at most five and would by alternation put a set within $10\delta$ in symmetric difference of its own complement. No side of a nontrivial component can contain four colors. Four supports on the same side have pairwise even-distance paths of length at most four; their union lies in a set of measure at most $1/2+\delta+3(8\delta)<2/3$, whereas their combined degree is $4/6$. These facts suffice in the preceding matching argument: each side of a bipartite component has size at most three, and its edges need not already form a complete bipartite graph. Whenever three colors are active, the complements of both row graphs are therefore the same complete bipartite graph with three colors per side. Four active colors remain impossible.

For almost every row, the expected number of active colors over its columns is at least $3-6\delta$. Since at most three are active, at least $1-6\delta$ of its columns have exactly three. Thus almost every row has a palette split of the indicated kind, and its split agrees with that of a set of other rows of measure at least $1-6\delta>1/2$. There are finitely many splits, so there can be only one split on a set of positive measure. The resulting palettes $A,B$ have disjoint supports almost everywhere, so $Q=\sum_{i\in A} W_i$ is again a balanced indicator of row degree $1/2$. An individual color misses at most $\delta$ measure within its palette in each row.

The integral with kernels $Q,Q,Q,J-Q,J-Q,J-Q$ is now at most $6\delta$: where the six corresponding distinct color kernels are all positive, the integrand can be one only on a null set; the union of the six possible missing-color events has measure at most $6\delta$. As before,
```math
1/64-\sum_{\lambda\ne\mathrm{const}}\lambda^6\le6\delta,
\qquad \sum_{\lambda\ne\mathrm{const}}\lambda^2=1/4.
```
For a nonconstant eigenvalue of largest absolute value $\mu$, this implies $\mu^4\ge(1-384\delta)/16$ and $\mu^2\ge1/4-96\delta$. Let $\phi$ be its real unit eigenfunction, $\lambda$ the signed eigenvalue, $K=1/2+\lambda\phi\otimes\phi$, and let
```math
P(x,y)=\bigl(1+\mathop{\mathrm{sgn}}(\lambda)\,\sigma(x)\sigma(y)\bigr)/2,
\qquad \sigma=\mathop{\mathrm{sgn}}(\phi),
```
choosing either sign wherever $\phi$ is zero. We have $`\|Q-K\|_2^2\le96\delta`$. Since $Q$ is an indicator, $|K-P|=\bigl||K-1/2|-1/2\bigr|\le |K-Q|$ pointwise. Hence $`\|Q-P\|_1=\|Q-P\|_2^2\le384\delta`$. Here $P$ describes which side of a two-part cut palette $A$ is supposed to occupy, with a swap of the palette names if needed. To finish, the following continuous repair lemma turns this closeness into an exact cut.

### Weighted graphon repair lemma

Write $t=1/6$ and $\epsilon=10^{-7}$. Suppose a balanced fractional graphon with zero rainbow six-cycle density has a measurable cut and two three-color palettes such that the **total ordered wrong weight** is at most $\epsilon^2t^2$: the weight of $A$ inside the sides plus that of $B$ across, integrated over all ordered pairs. Then it has an exact parity cut with the same palettes.

For each row let its wrong weight be the analogous integral over the column. Let $D=\epsilon t$, and first remove the bad rows of wrong weight exceeding $D$, a set of measure $b\le\epsilon t$. Both sides contain good rows: an opposite side of measure at most $b$ could not hold the correctly crossing $A$ weight, at least $3t-D$, required by any good row. The size of each original side is within $D$ of $3t$, by the relation between its crossing measure, its exactly $3t$ total $A$ degree, and the total wrong row weight. The surviving sides are within $D+b$ of $3t$.

Here is the continuous version of the [robust three-path lemma](PARITY-CUT.md). Restrict to one good within-side block for $B$ or the good cross block for $A$, and normalize operators by $t$. Every restricted color degree is between $t-D-b$ and $t$. The sum of the three restricted kernels differs from the complete block by at most $D$ per row. In the maximum absolute row-integral norm the proof of the finite three-walk identity and its error estimate then gives the same error bound $250\eta$, now with $\eta=(D+b)/t\le 2\cdot 10^{-7}$; there are no missing diagonal atoms. In more detail, the normalized complete block kernel has value $1/(3t)$ inside the block and row norm at most two. The two products with each color differ from its square by at most $2\eta$ each by the row- and column-degree bounds. Expanding the three-walk identity, as in the finite proof, gives the stated $250\eta$ bound in the row norm.

For endpoint sets $U,V$ in the suitable part or opposite parts of measures between $t/3$ and $t$, at least $(1-3\eta)|U||V|/3$ weight on $U\times V$ is in a single correct color. The monochromatic three-walk count is at least the cube of that weight divided by $|U||V|$, by the same Hölder argument using the edge-weight measure on $U\times V$. Thus the lower bound $t^4/2500$ in the finite proof applies, and the rainbow three-walk count between the two sets is positive after the error $250\eta t^4$. We need only positivity here, and coincident vertices form a null set. If the endpoint sets are supports of other positive color weights, multiplying by those weights also preserves positivity of the relevant integral. Supports have measure at least their weight since each color weight is at most one; sets larger than $t$ may be trimmed to measure $t$.

For a typical bad row $z$, each color has weight at least $t-b$ into the good rows and hence support of measure at least $t/3$ on some good side. If two colors of the same palette have their large supports on opposite sides, or one has positive weight on the side opposite the other color's large support, a rainbow six-cycle has positive rooted density at $z$. To see this, take a positive-measure set of good neighbors $x$ in the first color on that side, then the good correct neighborhood of each such $x$ in the third color of their palette, and apply the preceding three-walk bound to that neighborhood and the large opposite support of the second color from $z$. For palette $A$, the two three-walk endpoint sets are in the same side and the three missing colors are $B$. For palette $B$, the endpoint sets are on opposite sides and the missing colors are $A$. The initial, intermediate, and final edges completing the walk have strictly positive weight on these endpoints. If the exceptional bad rows had positive measure, integrating gives positive rainbow density, a contradiction.

Consequently almost every bad row has all its good $A$ neighbors on one side and all its good $B$ neighbors on one side. The two sides must differ since both good sides have positive measure and the six colors sum to one. Assign each bad row to the side which puts its $B$ neighbors on its own side. This is measurable by the two row integrals into the good sides. Good-to-bad pairs are then all correct, and for almost every row the wrong weight is at most $\max(D,b)=D$. Apply the three-walk bound again on the two full parts. Any misplaced $A$ pair of positive weight inside a side can now be closed by edges in the two other $A$ colors to the opposite part and a three-walk in the $B$ colors; any misplaced $B$ pair across can be closed using the other two $B$ colors staying in their parts and a three-walk in the $A$ colors. For almost every such pair these endpoint supports have measure at least $t-D$. A positive total wrong weight would therefore give positive rainbow density. There is no wrong weight after reassignment, proving the repair lemma.

For the indicator $P$ found spectrally, the wrong weight is exactly $`\|Q-P\|_1`$. Since $384\cdot10^{-20}<\epsilon^2t^2$, the repair lemma applies and proves the strict below-half extension.
