# Coordinate and star inequalities for the interval proofs

Let $`n`$ be the order. Choose unit, mean-zero Fiedler vectors $`a,b`$ for the graph and its complement. Their energies on their respective edge sets are the algebraic connectivities $`x,y`$. Denote their coordinate ranges by $`R_a,R_b`$.

At a vertex with coordinate $`f`$ and degree $`k`$, the neighbor values of a unit mean-zero eigenvector sum to $`(k-\lambda)f`$. Its nonneighbor values sum to $`-(1+k-\lambda)f`$. Applying Cauchy–Schwarz to the first sum gives $`\lvert f\rvert\le\sqrt{k}/(k-\lambda)`$ for $`k>\lambda`$. At a vertex with $`k`$ missing edges, applying the same argument to nonneighbors gives $`\lvert f\rvert\le\sqrt{k}/(n-k-\lambda)`$ when the denominator is positive.

For any unit mean-zero vector with maximum absolute coordinate $`U`$, all edges of the complete star at a vertex of coordinate $`f`$ have total energy $`1+nf^2`$. Removing $`k`$ edges loses at most $`k(\lvert f\rvert+U)^2`$. Minimizing the resulting quadratic in $`\lvert f\rvert`$ gives the star-energy lower bound $`1-nkU^2/(n-k)`$ for $`k<n`$. Two such stars have disjoint edges when their centers are nonadjacent.

Finally, expansion using the zero sums and unit norms gives

```math
\sum_{i\lt j}(a_i-a_j)^2(b_i-b_j)^2
  =1+n\sum_i a_i^2b_i^2+2\left(\sum_i a_i b_i\right)^2 .
```

The sum over graph edges is at most $`x R_b^2`$ and the sum over complementary edges is at most $`y R_a^2`$. The right-hand side is at least one, giving the complete-pair inequality $`1\le xR_b^2+yR_a^2`$. In particular, if the maximum absolute coordinates are $`M,H`$, then $`1\le4(xH^2+yM^2)`$. [Finite interval proof](FINITE-INTERVAL.md) · [Uniform interval proof](INTERVAL-LEAF-THRESHOLD.md)
