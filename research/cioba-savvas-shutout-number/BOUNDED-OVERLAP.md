# A bounded-overlap shutout theorem

The [graph-case proof](PROOF.md) is an application of a more general local strategy. This note is a consequence, not a second conjecture claim.

Let a finite board have a family of winning lines. Maker wins immediately upon claiming $`s\ge2`$ points of a line untouched by Breaker. Discard lines of size less than $`s`$. Let $`r\ge2`$ be an upper bound on the number of surviving lines containing any one board point, and let $`D\ge1`$ bound the maximum degree of the intersection graph of the surviving lines. Then Breaker wins whenever
```math
\left(\frac{r-1}{r}\right)^{s-1}
\le \frac{D^D}{(D+1)^{D+1}}.
```
Thus for every fixed board overlap $`r`$, the obstruction grows exponentially in $`s`$ with no bound on the number of lines or board size. The case of disjoint lines is immediate by replying on the same active line.

Use the same Shearer region on the intersection graph, with risk $`z_L=(r/(r-1))^{a_L-(s-1)}`$ for a line that is still untouched by Breaker and has $`a_L`$ Maker points; set risk zero after its first Breaker touch. The initial activity satisfies the degree criterion. After each response every still-live line has at most $`s-2`$ Maker points, so the next Maker move cannot already win. Any active line that it touches still has a free point because its size is at least $`s`$.

The live lines touched by a single Maker point form a clique $`C`$, of order $`k\le r`$. If $`k=0`$ there is nothing to repair. If $`k\ge1`$, use a virtual response that kills one uniformly chosen line of $`C`$, with the actual new risk multiplier $`r/(r-1)`$ on all the others. For each line in $`C`$ its expected new risk is
```math
\frac{r}{r-1}\cdot\frac{k-1}{k}z_L\le z_L .
```
With outside coordinates fixed, the clique feasibility test is a single positive-coefficient strict linear inequality. Thus at least one virtual response is feasible. Claim a free point of its killed line. Any additional lines killed by that real move only lower coordinates, preserving the region. The process proves the bound, even under the immediate-win convention.

For the star lines on a graph, each board point is an edge lying in at most two lines, and the intersection graph is the underlying graph after discarding low-degree vertices. This recovers the main theorem. Older global shutout criteria (e.g. [Leader, Hypergraph Games, Lemma 13](https://tartarus.org/gareth/maths/notes/iii/Hypergraph_Games.pdf)) are phrased in terms of the total number of lines; the local feasibility method here is adapted from [Chen–Chen–Yang's degree-game paper](https://arxiv.org/html/2608.20644v1).
