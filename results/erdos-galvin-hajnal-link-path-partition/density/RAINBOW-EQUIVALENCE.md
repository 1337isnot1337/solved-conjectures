# A rainbow characterization and the asymptotic density gap

Let $`R_2`$ be the statement that every two-bounded coloring of $`[\omega_1]^2`$ has an uncountable rainbow set. For a triple system $`H`$ write $`e_H(n)`$ for the maximum number of triples spanned by an $`n`$-point set.

The following are equivalent in ZFC:

1. $`R_2`$ fails.
2. Some triple system on $`\omega_1`$ with no uncountable independent set satisfies $`e_H(n)\le\lfloor(n-1)^2/4\rfloor`$ for all $`n\ge1`$.
3. Some triple system on $`\omega_1`$ with no uncountable independent set satisfies $`e_H(6)\le6`$.

Thus the independence proof identifies the exact combinatorial principle, not just two unrelated models.

## From a non-rainbow coloring to a sharp-profile witness

Suppose $`c`$ is two-bounded and has no uncountable rainbow set. Map each pair to the union of the pairs of its own color; the output is a finite vertex set. Take a continuous cofinal sequence of countable ordinals closed under this map, and choose one point in each successive block, giving an uncountable $`S`$. If two distinct pairs in $`[S]^2`$ have equal color, they share their maximum: if one had smaller maximum, its two points would lie below the left endpoint of the block of the larger maximum, and closure would also put the larger maximum below that endpoint.

On $`S`$ let $`xyz`$, $`x<y<z`$, be a triple exactly when $`c(xz)=c(yz)`$. A subset is independent precisely when it is rainbow, by the normalization step. Every lower link is a matching by two-boundedness, so $`e_H(n)\le\sum_{j=0}^{n-1}\lfloor j/2\rfloor=\lfloor(n-1)^2/4\rfloor`$. Transport the system to $`\omega_1`$. This proves (1)$`\Rightarrow`$(2). The implication (2)$`\Rightarrow`$(3) is immediate. The closure and rainbow argument in [the proof](INDEPENDENCE.md) proves (3)$`\Rightarrow`$(1).

## Under the positive rainbow relation every such system is much denser

Assume $`R_2`$, and let $`H`$ have no uncountable independent set. For every positive integer $`k`$ there exist $`a,b_1,\dots,b_k`$ and an uncountable set $`Z`$ disjoint from them such that $`ab_i z`$ is a triple for every $`i`$ and every $`z\in Z`$.

Indeed, if no such collection exists, for each fixed tuple $`a,b_1,\dots,b_k`$ there are only countably many common extensions $`z`$. Close a club chain under these countable sets (take the finite union over the possible distinguished vertices on each input). On a one-point-per-block subset, all lower links have degree at most $`k-1`$, for otherwise the apex would belong to a common extension set for points all below the left endpoint of its block. If $`k=1`$ there are no edges. Otherwise greedily partition every lower link into at most $`2k-3`$ matchings: each edge meets at most $`2(k-2)`$ other edges, so this many colors suffice. In each matching layer, color the two apex pairs of each triple alike once, independently from all other pairs, giving a two-bounded pair coloring for every layer. Apply $`R_2`$ successively to the finite list of colorings, each time restricting to the preceding uncountable subset. The resulting subset is independent, a contradiction.

The assertion can be used inside any uncountable subset of the vertex set. In particular for any $`d,k\ge1`$ choose $`d`$ successive groups of the form $`\{a_i\}\cup B_i`$ with $`|B_i|=k`$, by working at each stage inside the preceding common extension set. All $`a_i b z`$ are triples for $`b\in B_i`$ and $`z`$ in any later group, and they are distinct. Consequently on $`d(k+1)`$ points there are at least
```math
k(k+1)\binom d2
```
triples. For $`n\to\infty`$ take $`k=\lfloor\sqrt n\rfloor`$, $`d=\lfloor n/(k+1)\rfloor`$ and pad the set to exactly $`n`$ points. This yields
```math
e_H(n)\ge \tfrac12 n^2-O(n^{3/2}).
```
The constant in the error is absolute. In a model where $`R_2`$ fails, the exact lower profile $`\lfloor(n-1)^2/4\rfloor`$ is attained instead. This note does not claim an upper bound with leading coefficient $`1/2`$ in a positive-rainbow model.
