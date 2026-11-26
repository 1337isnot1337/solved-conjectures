# The half-support graphon case

**Partial theorem.** Let $W_1,\dots,W_6$ be balanced six-color graphon kernels with zero rainbow six-cycle density. Suppose every color has support of measure at least $1/2$ in almost every row. Then one three-color union is disconnected, so the graphon is a parity-cut model. In particular this holds if every $W_i\le1/3$ almost everywhere. This theorem was developed in a research pass and independently checked against the active #870 graphon formulation.

## A constraint from overlapping colors

For an unordered pair of distinct colors $p=\{i,j\}$, put $U_p=\min(W_i,W_j)$ and write $d_p$ for its row integrals. If $p,q,r$ partition the six colors into three pairs, the rainbow density bounds below the squared Hilbert–Schmidt norm of the kernel product $U_pU_qU_r$: take two three-edge paths with common endpoints, using one color from each pair in each matching position and reverse the second path around the cycle. Their product is at least the corresponding product of minima. Thus the product kernel vanishes. Integrating its two endpoints gives
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
\operatorname{tr}(Q^3(J-Q)^3)=1/64-\sum_{\lambda}\lambda^6,
```
where $\lambda$ ranges over the nonconstant eigenvalues of $Q$. Symmetry and row degree give operator norm at most $1/2$. As $Q$ is an indicator, its squared Hilbert–Schmidt norm is $1/2$, leaving $\sum\lambda^2=1/4$ after the constant eigenvalue. Thus equality in $\sum\lambda^6\le (1/2)^4\sum\lambda^2$ forces exactly one nonconstant eigenvalue, of absolute value $1/2$. Consequently $Q(x,y)=(1\pm\phi(x)\phi(y))/2$ almost everywhere for a real mean-zero unit eigenfunction $\phi$. The indicator values force $|\phi(x)\phi(y)|=1$ almost everywhere, hence $\phi$ takes the values $\pm1$ on two equal halves. One palette union is the indicator of edges within the two halves.

See [the graphon criterion](GRAPHON-CRITERION.md) and [parity stability](PARITY-CUT.md) for the consequence that this cannot be a limit of an unbounded balanced finite counterexample sequence. The unrestricted structural statement remains open.
