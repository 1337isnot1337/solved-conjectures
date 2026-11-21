# Integrality of the minimum permanent: replacing a perfect matching

Research checkpoint, 20 November 2026 (America/Chicago). Conjecture 24 remains unresolved.

## Full target and source distinction

[Minc Conjecture 24](https://yair-lavi.com/mincs-list/conjecture-24/index.html) asserts that for every $`1\leq k\leq n`$, the minimum permanent over nonnegative integer matrices with all row and column sums $`k`$ is attained by a binary matrix. The integer hypothesis is essential. The current page marks the conjecture open, with exact small cases and a fixed-defect result on the dense line.

The fresh source pass inspected [Wanless's 2006 addendum](https://users.monash.edu.au/~iwanless/papers/Schrijminper.journalvers.pdf) in full. It establishes equality of exponential rates for the integer and binary minima and explicitly distinguishes that asymptotic result from the finite-order conjecture. The source's random-pairing argument does not provide a permanent-nonincreasing simplification of each individual multigraph. Searches for regular multigraph minima, parallel-edge elimination, and permutation addition found no general replacement theorem. No exhaustive priority claim is made for the elementary identities below.

## A sufficient universal replacement assertion

Write

```math
\mathcal C(A)=\sum_{i,j}\binom{a_{ij}}2.
```

Every nonnegative integer $`k`$-regular matrix is a sum of $`k`$ permutation matrices. Remove one supported permutation matrix $`P\leq A`$, and put $`B=A-P`$. For any permutation matrix $`Q`$, the matrix $`A'=B+Q`$ is again nonnegative integer and $`k`$-regular. The collision count satisfies the exact identity

```math
\mathcal C(B+Q)=\mathcal C(B)+\langle B,Q\rangle.
```

Thus the following universal assertion would prove Conjecture 24 by finite descent:

> For every nonbinary $`k`$-regular integer matrix $`A`$, with $`k\leq n`$, there exist permutation matrices $`P\leq A`$ and $`Q`$ such that
>
> 

```math
\mathop{\mathrm{per}}(A-P+Q)\leq\mathop{\mathrm{per}}A,
```

>
> 

```math
\langle A-P,Q\rangle<\langle A-P,P\rangle.
```

This is an **unproved stronger sufficient assertion**, not an equivalent reformulation of Conjecture 24. Its strict integer collision decrease would force termination at a binary matrix. It permits several alternating cycles to change simultaneously, so the existing four-cycle obstruction does not refute it. The assertion could fail even if Conjecture 24 is true.

There are two distinct ways to use replacements. A universal descent proof can order the pair $`(\mathop{\mathrm{per}}A,\mathcal C(A))`$ lexicographically. A replacement that strictly decreases the permanent is then useful even if its collision count increases. Only when the permanent is unchanged is a strict collision decrease needed. This weaker universal move condition also suffices, because both statistics take values in finite sets on the fixed regular integer class. Alternatively, one may start with a global permanent minimizer that has the least collision count among all permanent minimizers, and use its optimality rather than assert a descent theorem at arbitrary matrices. No useful replacement has been proved to exist in that restricted situation either. The simultaneous inequalities displayed above were chosen as a concrete stronger target; they must not be presented as necessary conditions for the conjecture to hold.

A perfect matching removed from $`A`$ cannot be assumed to cover an arbitrary prescribed matching of repeated entries. Such an extension need not exist in a regular bipartite support. This is an additional reason that a result only for one convenient decomposition would not establish the universal assertion.

## Exact permanent expression and averages

For a permutation $`\pi`$ and its matrix $`Q_\pi`$, choosing the rows that use entries from $`B`$ gives

```math
\mathop{\mathrm{per}}(B+Q_\pi)
=\sum_{S\subseteq[n]}\mathop{\mathrm{per}}B[S,\pi(S)].
```

The empty minor is one. Consequently a uniformly random permutation matrix satisfies

```math
\mathbb E_Q\mathop{\mathrm{per}}(B+Q)
=\sum_{j=0}^n\frac{\sigma_j(B)}{\binom nj}.
```

For each fixed row set $`S`$ of size $`j`$, its image $`\pi(S)`$ is uniform over the $`j`$-element column sets. This proves the displayed identity directly.

There is a useful weighted form. Let $`C\geq0`$ have positive permanent, and sample $`\pi`$ with probability

```math
\mathbb P(\pi)=\frac{\prod_i c_{i,\pi(i)}}{\mathop{\mathrm{per}}C}.
```

The weighted sum of permutations mapping $`S`$ onto $`T`$ is
$`\mathop{\mathrm{per}}C[S,T]\mathop{\mathrm{per}}C[S^c,T^c]`$. Therefore

```math
\boxed{\quad
\mathbb E\mathop{\mathrm{per}}(B+Q_\pi)
=\frac1{\mathop{\mathrm{per}}C}
\sum_{\substack{S,T\subseteq[n]\\|S|=|T|}}
\mathop{\mathrm{per}}B[S,T]\,
\mathop{\mathrm{per}}C[S,T]\,
\mathop{\mathrm{per}}C[S^c,T^c].\quad}
```

Taking $`C`$ to be the indicator matrix of the zero entries of $`B`$ restricts $`Q`$ to be disjoint from $`B`$, provided that support has a perfect matching. If $`B`$ is binary and $`d`$-regular with $`d<n`$, its complement is regular and this condition holds. For a general integer $`B`$ it can fail: a positive rectangular submatrix of size $`r\times s`$ with $`r+s>n`$ obstructs such a matching.

For a removable $`P`$ with $`\langle B,P\rangle>0`$, the inequality

```math
\sum_{|S|=|T|}
\mathop{\mathrm{per}}B[S,T]\mathop{\mathrm{per}}C[S,T]
\mathop{\mathrm{per}}C[S^c,T^c]
\leq\mathop{\mathrm{per}}(B+P)\mathop{\mathrm{per}}C
```

would guarantee a disjoint replacement with nonincreasing permanent. **No universal inequality of this kind has been proved here.** The exact triple-minor expression exposes what an averaging proof must control; it does not supply that control.

## Restricted probe and its limits

The narrower question considered first was whether, for every binary $`d`$-regular $`B`$, the minimum of $`\mathop{\mathrm{per}}(B+P)`$ over all permutations is attained at one disjoint from $`B`$. This is still an unproved auxiliary assertion. Even if proved, it would address only matrices admitting a removal that leaves a binary matrix, rather than all multiplicity patterns in Conjecture 24.

The standalone `matching_replacement_probe.cpp` computes all permutation additions for a bounded collection of sampled binary supports. It samples supports by unweighted random legal switches; it does not optimize their permanent or use hill-climbing acceptance. All permanent evaluations are exact integer subset recurrences. Unsigned 64-bit arithmetic suffices for these recorded orders, including the optional sum of all disjoint completions, since $`n!(d+1)^n<2^{64}`$ for each row below.

| Order $`n`$ | Degree $`d`$ of $`B`$ | Supports sampled | Permutation additions checked |
|---:|---:|---:|---:|
| 6 | 2 | 50 | 36,000 |
| 7 | 3 | 80 | 403,200 |
| 8 | 4 | 20 | 806,400 |

The logs `matching_replacement_6_2.log`, `matching_replacement_7_3.log`, and `matching_replacement_8_4.log` contain the outcomes. No counterexample was found to the restricted minimum statement or to its stronger uniform-average sufficient condition on the sampled supports. This supplies no proof and no new finite-order classification. No larger-order search was started after this diagnostic.

There is a useful measure of the restricted assertion's difficulty. If $`B`$ is binary and $`(n-2)`$-regular, every disjoint completion $`B+Q`$ is binary and $`(n-1)`$-regular, with permanent equal to the derangement number $`D_n`$. The restricted assertion would therefore prove $`\mathop{\mathrm{per}}(B+P)\geq D_n`$ for every permutation $`P`$, a nontrivial subclass of the still-open dense line of Conjecture 24. It should not be treated as an immediate consequence of the small probes.

## Exact residual

The chosen sufficient residual is the universal existence of a permanent-nonincreasing, collision-decreasing whole-matching replacement specified above. A lexicographic descent theorem, or a contradiction obtained only at a global minimizer with least collision count, would also suffice and would need less. Neither the unconditioned average nor the disjoint weighted average has been bounded sufficiently, and a disjoint replacement need not exist for every residual integer matrix. The argument currently yields identities and precise proof obligations, not a full theorem about the minimum permanent. No completed-entry count changes.

The root independently checked the uniform-permutation average, the weighted triple-minor identity and the collision formula. These checks confirm the reductions, not the missing universal inequality.
