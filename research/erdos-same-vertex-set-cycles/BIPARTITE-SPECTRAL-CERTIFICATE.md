# A robust bipartite spectral criterion

This is a sufficient certificate for [Erdős #585](https://www.erdosproblems.com/585), not a guarantee that the certificate can be extracted from an arbitrary dense graph. It uses [Theorem 4.1 of Hamilton cycles in pseudorandom graphs: resilience and approximate decompositions (v3)](https://arxiv.org/html/2507.22807v3), the bipartite Hamilton-path theorem for opposite-side endpoints. The theorem for ordinary $`C`$-expanders does not directly apply to a bipartite graph.

Fix an integer $`C\ge2`$ large enough for that theorem. Let $`G`$ be a positive-degree balanced simple $`d`$-regular bipartite graph, with sides of size $`m`$. Let $`\lambda`$ be the norm of the biadjacency matrix on the orthogonal complements of the constant vectors (thus excluding the trivial singular direction, not requiring all adjacency eigenvalues other than $`d`$ to be small). Assume

```math
\lambda+\Delta(F)\ \le\ d/(4C)
```

for some edge set $`F`$. Then $`G-F`$ has a Hamilton path between **any** specified pair of opposite-side vertices. If $`m\ge2`$, it also has a Hamilton cycle.

Indeed, write $`H=G-F`$ and $`t=\Delta(F)`$. The rectangular mixing inequality is

```math
 \big|e_G(A,B)-d|A||B|/m\big|\le\lambda\sqrt{|A||B|}.
```

It follows by decomposing the two set indicators into their constant and mean-zero parts and applying the norm bound to the latter. For a nonempty set $`A`$ on one side, with $`|A|\le m/(2C)`$, put $`B=N_H(A)`$. If $`|B|<C|A|`$, then

```math
 (d-t)|A|\le e_G(A,B)
 \le (d/2+\lambda\sqrt C)|A|.
```

This is impossible because $`t+\lambda\sqrt C\le \sqrt C(t+\lambda)\le d/(4\sqrt C)<d/2`$. For sets $`A,B`$ on opposite sides with both sizes at least $`m/(2C)`$, at most $`t\min(|A|,|B|)`$ edges between them were deleted, and

```math
 e_H(A,B)\ \ge\ \sqrt{|A||B|}\big(d/(2C)-\lambda-t\big)>0.
```

Thus $`H`$ is a bipartite $`C`$-expander in the theorem's sense. Fixing any edge of $`H`$, find a Hamilton path with its ends as endpoints. The path cannot itself contain that edge, since then it would consist only of that edge, whereas $`m\ge2`$ gives at least four vertices. The Hamilton-path assertion alone applies trivially at $`m=1`$.

In particular, with $`\lambda\le d/(8C)`$ and $`d\ge16C`$, the condition survives the removal of one Hamilton cycle ($`t=2`$); one gets a second spanning Hamilton cycle with disjoint edges. More generally it survives removal of $`j`$ cycles whenever $`\lambda+2j\le d/(4C)`$, giving at least $`\lfloor(d/(4C)-\lambda)/2\rfloor+1`$ cycles when $`\lambda\le d/(4C)`$ and $`m\ge2`$.

The same proof certifies **both** signatures of a balanced four-edge interface: if the shore is obtained from a balanced simple $`d`$-regular graph satisfying $`\lambda+4\le d/(4C)`$ by deleting at most two edges, find the first specified Hamilton path in the remaining graph. For the other specified opposite-side pair, delete that path as well. The union of the deleted edges has maximum degree at most four. Apply the criterion again. The paths need not have the same endpoints, but both span the shore. Thus two such shores can be joined using either signature in [FOUR-EDGE-CUTS.md](FOUR-EDGE-CUTS.md), without expansion across the whole host.

**Remaining extraction gap.** The high-girth exact-regularity reduction in [README.md](README.md) gives no bound on $`\lambda/d`$. Showing that a sufficiently high even regular degree and fixed girth force this spectral certificate on a subgraph, rather than merely on a graph after adding edges, would suffice for the sharp asymptotic bound. Neither the reduction nor the sparse-expander Hamilton-path theorem supplies that assertion.
