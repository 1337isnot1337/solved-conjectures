# A gap above one at diameter two

**Lemma.** Let $`B`$ be a finite simple graph of diameter two with connected complement and let $`y<2`$ be its algebraic connectivity. If $`n`$ is its order, then

```math
(y-1)(n-y)\ge1.
```

In particular $`y>1+1/(n-1)`$. The strict inequality follows from $`y>1`$ and $`n-y<n-1`$. The usual diameter-two estimate gives $`y\ge1`$. [Afshari, Theorem 1](https://arxiv.org/abs/2109.04568)

Normalize a Fiedler vector $`g`$ by a positive affine transformation to maximum one at $`c`$ and minimum zero at $`d`$. Its rows satisfy $`\sum_{j\sim i}(g_i-g_j)=y(g_i-m)`$, where $`m`$ is the mean. Adding the drops at the maximum and minimum counts two for an edge between them and one for each common neighbor. Since $`y<2`$ and the diameter is two, the two extrema are nonadjacent and have a unique common neighbor $`w`$. Write $`H=N(c)\setminus\{w\}`$ and $`L=N(d)\setminus\{w\}`$. The same row identity gives the total remaining deviations

```math
\delta=y-1=\sum_{h\in H}(1-g_h)+\sum_{l\in L}g_l.
```

Suppose first that some $`h\in H`$ is adjacent to $`l\in L`$. Put $`u=1-g_h`$ and $`v=g_l`$. The row sums of the nonnegative complementary coordinates at $`h`$ and the nonnegative coordinates at $`l`$ are

```math
(\deg h-y)u+y(1-m)=\sum_{z\sim h}(1-g_z),\qquad
(\deg l-y)v+ym=\sum_{z\sim l}g_z.
```

The indicated edge alone contributes at least $`(1-v)+(1-u)`$ to their sum. Consequently $`(\deg h+1-y)u+(\deg l+1-y)v\ge2-y`$.

Now suppose there are no edges between $`H`$ and $`L`$. Every $`h\in H`$ has a length-two path to $`d`$. Its intermediate vertex must be $`w`$, because all other neighbors of $`d`$ lie in $`L`$. The corresponding statement holds for each $`l\in L`$. Thus every vertex of $`H\cup L`$ is adjacent to $`w`$. The connected complement gives a vertex $`z\ne w`$ nonadjacent to $`w`$. It belongs to neither $`H\cup L`$ nor $`\{c,d\}`$. Its paths of length two to $`c`$ and $`d`$ give neighbors $`h\in H`$ and $`l\in L`$. Both $`w`$ and $`z`$ are common neighbors of these two vertices. Their total contribution to the two row sums displayed above is exactly two. Hence $`(\deg h-y)u+(\deg l-y)v\ge2-y`$.

In both cases the connected complement bounds each degree by $`n-2`$ and $`u+v\le\delta`$. Therefore $`(n-1-y)\delta\ge2-y`$, or $`(n-y)(y-1)\ge1`$, as claimed.
