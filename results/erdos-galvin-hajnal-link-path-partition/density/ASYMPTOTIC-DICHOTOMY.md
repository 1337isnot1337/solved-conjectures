# The two possible asymptotic constants

For positive integers $`n`$, let $`h(n)`$ be the minimum of $`e_H(n)`$ over triple systems $`H`$ on $`\omega_1`$ with no uncountable independent set, with the notation of the [rainbow characterization](RAINBOW-EQUIVALENCE.md). Then ZFC proves that the limit of $`h(n)/n^2`$ exists. It equals $`1/4`$ if the two-bounded pair-rainbow relation fails and $`1/2`$ if it holds.

Both values occur in models of ZFC, assuming ZFC is consistent. The estimate for the first case is exact at every $`n`$ by [EGH's lower bound and the rainbow construction](INDEPENDENCE.md). The lower bound in the second case is $`\tfrac12 n^2-O(n^{3/2})`$ by the successive common co-neighborhood argument in the rainbow characterization. It remains to give a ZFC upper bound matching the second case to leading order.

## ZFC upper bound via a strong pair coloring

By [Todorčević, *Partitioning pairs of countable ordinals* (1987)](https://doi.org/10.1007/BF02392561), there is a coloring $`c:[\omega_1]^2\to\omega`$ such that $`c[[A]^2]=\omega`$ for every uncountable $`A\subseteq\omega_1`$. This follows also by coarsening his coloring with $`\omega_1`$ colors.

For each countable ordinal $`\beta`$, fix an injective enumeration $`u_\beta:D_\beta\to\beta`$, where $`D_\beta\subseteq\omega`$ and the enumeration is onto. Put a triple $`\{\gamma,\alpha,\beta\}`$ with $`\gamma<\alpha<\beta`$ in $`H`$ when
```math
c(\{\alpha,\beta\})\in D_\beta
\quad\text{and}\quad
u_\beta(c(\{\alpha,\beta\}))=\gamma.
```
Each possible top pair $`\{\alpha,\beta\}`$ serves for at most one triple. On any set of $`n`$ increasing points the top pair must avoid the least point, so at most $`\binom{n-1}{2}`$ triples occur (zero when $`n=1,2`$). This is an upper bound simultaneously for all $`n`$.

To show there is no uncountable independent set, take uncountable $`A`$ and any $`\gamma\in A`$. There are uncountably many $`\beta\in A`$ above $`\gamma`$. For each, the unique index $`i_\beta`$ with $`u_\beta(i_\beta)=\gamma`$ is a natural number. Thin to uncountable $`B`$ on which this index is a fixed $`i`$. Choose $`\alpha<\beta`$ from $`B`$ with $`c(\{\alpha,\beta\})=i`$. Then $`\{\gamma,\alpha,\beta\}`$ is a triple in $`A`$.

Consequently, in the model of the positive relation one has
```math
\tfrac12 n^2-O(n^{3/2})\ \le\ h(n)\ \le\ \binom{n-1}{2}.
```
Along with the other case, this proves the limit dichotomy. The ZFC upper-bound construction is not a forcing construction.

## Credit and scope

The strong pair coloring is Todorčević's theorem; the application above uses an enumeration index for a fixed earlier vertex and counts each edge by its unique top pair. The lower-bound input in the negative-rainbow case is from Erdős–Galvin–Hajnal. No exact value of $`h(n)`$ for all $`n`$ in the positive-rainbow case is asserted.
