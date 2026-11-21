# Review of the complement matching checkpoint

Independent mathematical review, 20 November 2026 (America/Chicago).

Reviewed: [the frozen complement-matching checkpoint](c6_complement_average_checkpoint.md).

**Verdict:** The identities, switching bound, and positive initial derivative proposition are correct. The note proves no endpoint averaging inequality and makes no such claim. It does not resolve Conjecture 6 or establish the obstruction at a global minimizer.

## Exact averaging count

Fix a complement permutation $`\pi`$. Expanding the permanent by the rows $`S`$ that use entries of $`A`$ gives


```math
\mathop{\mathrm{per}}(A+P_\pi)
=\sum_{S\subseteq[n]}\mathop{\mathrm{per}}A[S,\pi(S)].
```


The remaining rows use their prescribed permutation edges, so their columns are exactly the complement of $`\pi(S)`$. For fixed $`S,T`$, the number of complement permutations with $`\pi(S)=T`$ is


```math
\mathop{\mathrm{per}}C[S,T]\mathop{\mathrm{per}}C[S^c,T^c].
```


Division by $`\mathop{\mathrm{per}}C`$ therefore gives equation (2), without any factorial or binomial factor. The terms with $`S=\varnothing`$ and $`S=[n]`$ are respectively $`1`$ and $`\mathop{\mathrm{per}}A`$. The terms with $`|S|=n-1`$ sum to


```math
\sum_{c_{ij}=1}\mathop{\mathrm{per}}A(i\mid j)
             \Pr(P_{ij}=1),
```


which is consistent with the linear coefficient in the interpolation.

The proposed upper bound on this sum remains unproved. Existence of one suitable completion at a global minimizer would suffice for the corresponding degree step; neither a universal completion bound nor a universal average bound is asserted to be necessary for Conjecture 6.

## Switching multiplicities

For a matching avoiding $`(i,j)`$, the rows $`i'`$ and $`\ell`$ in the proof are distinct from $`i`$ and from each other. Their three old image columns are distinct. Hence the described three-edge change is a permutation and all its new edges lie in $`C`$.

For a resulting matching $`\tau`$ and an ordered pair $`(i',\ell)`$, the unique possible preimage is


```math
\pi(i)=\tau(\ell),\qquad
\pi(i')=\tau(i)=j,\qquad
\pi(\ell)=\tau(i'),
```


with all other images unchanged. There are at most $`(n-1)(n-2)`$ ordered pairs, as used in the upper count. The lower count $`n-2k-2`$ follows by excluding the two named rows and at most $`k`$ failures for each new-edge condition. Overlap between excluded sets can only improve that bound.

Thus (3) follows from the stated double count. Its denominator simplifies to $`n^2-2n-2k`$. When $`n\ge4k+4`$, its numerator is at least $`n/2`$ and its denominator is strictly below $`n^2`$, proving (4).

## Jerrum construction and derivative

The graph has $`k`$ chains, $`f`$ blocks per chain, and $`k`$ vertices on each side of each block, together with $`s,t`$. Its side size is therefore $`n=k^2f+1`$. The deleted corner in every block is compensated by the incoming or outgoing chain edge at the relevant distinguished vertex. This verifies binary $`k`$-regularity; the graph is connected for the stated $`k\ge3`$.

Let $`b=(k-1)!`$ and $`a=(k-1)b`$. If neither chain edge of a block is used, the block has $`k!-(k-1)!=a`$ matchings. If both are used, it has $`b`$. Using exactly one is impossible because the unmatched left and right vertex counts would differ. The state therefore propagates along each chain.

Exactly one chain is active in a whole perfect matching, giving $`k b^f a^{(k-1)f}`$. Deleting $`s,t`$ forces all chains inactive, giving cofactor $`a^{kf}`$. Their ratio is exactly $`(k-1)^f/k`$.

Differentiation of the fixed-distribution expectation gives equation (6). Retaining the exceptional nonnegative cofactor contribution and using (4) gives (9). For each fixed $`k\ge3`$, exponential growth in $`f`$ eventually exceeds the required quadratic $`2(k^2f+1)^2`$. The positive derivative proposition follows.

Equation (10) also checks: Euler's permanent identity gives $`\sum a_{ij}G_{ij}=n\mathop{\mathrm{per}}A`$, so the complement cofactor sum is $`\sigma_{n-1}(A)-n\mathop{\mathrm{per}}A`$. Combining it with differentiation of $`(k+t)^{-n}`$ produces the displayed coefficient $`n^2/k`$. The note correctly distinguishes a one-factorization law with uniform edge marginals from the uniform law on all perfect matchings.

## Attribution and scope

I independently retrieved [Wanless's 2007 primary paper](https://users.monash.edu.au/~iwanless/papers/mincconj6LAMA.pdf) through its author-hosted abstract page. The passage after Corollary 3.3, on journal page 62, explicitly gives $`A=I+S`$, $`B=I+S+S^2`$, and the normalized reverse inequality for $`n\ge9`$. The note credits this pointwise obstruction to the source and correctly separates it from a uniform average.

The 1999 PDF text extraction is damaged. The mathematical counts above were independently verified from the checkpoint's explicit graph, rather than inferred from that extraction. The checkpoint documents its separate page rendering and credits the construction and counts to the published Jerrum family.

A positive initial derivative does not compare $`H_A(1)`$ with $`H_A(0)`$. No minimizer hypothesis was proved for these matrices. The final paragraph preserves both limitations and gives no additional completed conjecture. No finite case range or numerical search was run for this review.
