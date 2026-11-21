# Independent review of the prefix-cutoff obstruction

21 November 2026. Reviewed [the prefix-only obstruction](prefix-cutoff-obstruction.md), SHA-256 `c7b337ddfd70fafe9ecbfc6d3986110c7360e3848abcd840fb249d8d890dbd66`, using the [independently checked tail-test lemma](TAIL_REVIEW.md).

The obstruction passes as stated. It concerns one specified upper expression with a prefix head and the specified Valiant–Valiant coarse bound. It is not a statistical lower bound for the testing problem and is not a solution to the paid arbitrary-null characterization.

## 1. The better test covers all alternatives

Collapsing a set of coordinates loses total variation equal to the smaller of the positive and negative discrepancy within that set. The negative discrepancy cannot exceed its null mass. Collapsing the light block therefore loses at most $`t`$, including when the alternative changes the block's total mass. An original alternative at distance greater than $`r`$ remains farther than $`r-t`$ after coarsening.

The three-cell coarse test has the claimed $`O(\Delta^{-2})`$ cost. On the remaining case, both signs of the middle-block discrepancy exceed $`r_1-\Delta`$. Since each negative coordinate supplies at most $`r_1/K`$, fewer than $`K\Delta/r_1`$ coordinates remain available for positive discrepancy. Cauchy–Schwarz gives

```math
A\ge\frac{r_1^3}{4K\Delta}
   =\frac{r_1^2}{4K^{4/5}},
\qquad Q=\frac{r_1^2}{K}.
```

Both terms in the previously proved quadratic-test cost are $`O(K^{2/5})`$ because $`r_1`$ stays between absolute positive constants. Splitting the fixed testing error between the coarse and fine tests gives one test for every alternative. The proof never assumes the alternative's block masses equal the null masses.

## 2. All prefix cases are covered

Every nonempty prefix contains the largest atom. Its removal in the coarse expression therefore leaves all retained middle atoms except those discarded by the light-tail truncation. The truncation removes at most $`\delta/16`$ mass.

If at least $`K/4`$ middle atoms are retained, $`a\ge1/(8K)`$ implies that at most $`K/8`$ can be truncated. The two-thirds quasinorm of the remaining $`K/8`$ equal atoms is $`a(K/8)^{3/2}=\Omega(\sqrt K)`$. This includes prefixes extending into the light block, and the full head.

If $`1\le j\lt K/4`$ and $`\delta\le ja+\mu`$, the inequality $`\mu\le ja`$ gives $`\delta\le2ja`$. At most $`j/8`$ middle atoms disappear. The coarse cost is at least a constant multiple of

```math
\frac{a j^{3/2}}{(ja)^2}
=\frac1{a\sqrt j}
\ge c\sqrt K.
```

For $`j=0`$ and $`\delta\le\mu`$, the explicit $`1/\delta`$ term is already sufficient.

In the remaining case $`\delta>ja+\mu`$, the proposed signed vector is feasible: the unchosen tail coordinates have mass $`r-ja-\mu>r-\delta=d`$, so the proportional negative coefficient is less than one. Its positive and negative totals are both exactly $`d`$. It therefore upper-bounds the deterministic minimum $`\Psi`$ by $`Q+d^2/K=O(1/K)`$. At least $`3K/4`$ middle atoms remain, giving $`Q=\Omega(1/K)`$. The tail cost is consequently $`\Omega(\sqrt K)`$.

This use of a small feasible squared norm is in the correct direction: the proposed cost contains its reciprocal. The vector is not being presented as an indistinguishable statistical alternative.

For the empty head, removing $`t`$ from the largest atom and all middle mass, then adding $`r/K`$ to $`K`$ light atoms, is feasible. Its squared norm is $`O(1/K)`$, while the full null second moment is bounded below by $`9/16`$. The resulting cost is $`\Omega(K)`$ and covers the final case.

## 3. The stated scope limitation is essential

For $`K\ge32`$, the nonprefix repair has $`t\le\delta/16`$: indeed $`15K^{-2}\le(r-K^{-2})K^{-1/5}`$ at $`K=32`$, and the inequality strengthens thereafter. Thus all light atoms can be removed by the stated coarse truncation. Only the middle aggregate remains after the largest atom is removed, giving an $`O(K^{2/5})`$ coarse cost. The signed tail budget is exactly the same one handled by the better test.

An arbitrary head or a recursive coarse test therefore repairs this family. The note correctly does not claim that two cutoffs suffice in general, that the unrestricted expression is optimal, or that a matching lower-bound prior is known. The efficient arbitrary-null, exact-radius, countable-domain problem remains open within this work. This is a written review, not a Lean verification or an additional completed bounty.
