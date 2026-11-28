# The paired color degree is deterministic

Use the [support permutation description](SUPPORT-PERMUTATIONS.md) of the balanced zero-rainbow-six-cycle [three-block model](PAIR-GRAPHONS.md). For each source part $`Y`$ it supplies a fixed pairing of one half-block of $`X`$ with one half-block of $`Z`$, and the corresponding fixed color pairing $`\pi_Y`$.

**Theorem.** For almost every vertex $`y\in Y`$, all its support permutations have the same sign relative to those two pairings. In particular there is a bit $`h_Y(y)`$ such that the cross-color pairing-bit into each of the four target half-blocks is a deterministic function of that half-block and $`h_Y(y)`$. No actual saturated vertex is required.

Normalize the colors by a reference permutation available at a positive measure of vertices of $`Y`$. Call them $`A_0,A_1,B_0,B_1`$, where the reference sees $`A_i`$ from $`X_i`$ and $`B_j`$ from $`Z_j`$. These letters denote the four cross colors, not the within-part colors. The target pairing and corresponding color pairing join slots of the same bit across the two parts, up to one fixed shift; thus the color pairing-bit may be taken as $`\pi_Y(A_i)=i,\ \pi_Y(B_j)=j+\kappa`$ for one fixed bit $`\kappa`$.

Consider a typical other vertex $`y`$. Suppose one of its possible colors from $`X_i`$ is $`A_a`$, and one from $`Z_j`$ is $`B_b`$. The reference center can use the complementary colors $`A_{1-a},B_{1-b}`$ from $`X_{1-a},Z_{1-b}`$. All four endpoint choices are independent positive neighborhoods. Thus the no-rainbow-cycle compatibility argument requires $`i+(1-a)=j+(1-b)`$, or $`a+i=b+j`$ in bit arithmetic. This constraint holds for **all pairs of individually possible colors**, whether or not they belong to one support permutation. It also holds if $`X`$ supplies $`B_b`$ and $`Z`$ supplies $`A_a`$.

At any fixed $`y`$, each of the hue groups $`\{A_0,A_1\},\{B_0,B_1\}`$ has total degree $`2t`$ over the two target parts, and each target part has total degree $`2t`$. Hence the two own-part channels $`X`$-$`A`$ and $`Z`$-$`B`$ have equal masses, as do the two swapped channels $`X`$-$`B`$ and $`Z`$-$`A`$.

If both types of channel have positive mass, applying the all-pairs constraint separately in each type gives well-defined bits $`r,s`$. The entire local color-degree matrix is supported on the union of two permutations:
```math
\begin{array}{ll}
\sigma_r: & X_i\mapsto A_{i+r},\quad Z_j\mapsto B_{j+r},
\\ \tau_s: & X_i\mapsto B_{i+s},\quad Z_j\mapsto A_{j+s}.
\end{array}
```
Indeed a possible own-part color in one part fixes its bit-shift and the bit-shift of every possible own-part color in the other, and similarly for the swapped channel. If only one type of channel is nonzero, the two colors into a target part are both saturated. The [two-type reduction](TWO-TYPES-ALL-PARTS.md) makes each of those colors occupy a whole half-block, so the vertex has just one support permutation and we are already done.

For the two-channel case, both displayed permutations individually preserve the reference position pairing as an unordered matching of positions. Their relative permutation exchanges the roles of $`X,Z`$ and is a double transposition, with two two-element orbits. Any candidate support permutation in their union chooses the first or second option uniformly on each orbit. If the signs of $`\sigma_r,\tau_s`$ relative to the fixed pairing differ, the relative double transposition switches the two pairs, so either individual transposition in it alone fails to preserve the pairing. The support theorem would therefore allow only the two uniform choices $`\sigma_r,\tau_s`$. As both channels actually have positive mass, the doubly stochastic decomposition would use both uniform choices with positive coefficients. Then each of their entries is positive, so the two nonuniform permutations are themselves support permutations. This contradicts the support theorem. Thus their signs agree, and all individual entries allowed by either permutation have the same pairing-bit assignment to each position.

Apply this in all source parts. In particular every interpart interface obeys two equations:
```math
\pi_i(\mathop{\mathrm{col}}(xy))=h_i(x)+p_j(y)+\eta_{ij},\qquad
\pi_j(\mathop{\mathrm{col}}(xy))=p_i(x)+h_j(y)+\eta_{ji}
```
for $`x\in X_i,y\in X_j`$, where $`p_i`$ denotes the known internal bit and the $`\eta`$'s are fixed shifts. If $`\pi_i=\pi_j`$ then comparison makes both $`h_i+p_i`$ and $`h_j+p_j`$ constant on their parts. If the pairings differ, the two bits determine the entire cross color, giving an exact table on the combined labels $`(p_i,h_i),(p_j,h_j)`$. The remaining problem is to align different source pairings and the shifts. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
