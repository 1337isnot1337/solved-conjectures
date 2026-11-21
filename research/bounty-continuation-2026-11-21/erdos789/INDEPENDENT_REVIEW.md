# Independent review of the Erdős 789 model attempt

21 November 2026. The coordinating agent independently reviewed the
[model-height and visibility note](model-height-and-visibility-gap.md),
SHA-256 `6f7d7817fd8242cd179744e01f9b8f91aabbb50097144db91df0c1a6c195d821`,
and its [target audit](target-and-prior-audit.md),
SHA-256 `2fd4fb8d2a81495a060784a68891cef0193bef8c5975aaed5d0d0c8e091393d9`.
The full square-root extraction problem remains unresolved.

## Scope and prior input

The live [paid target](https://conjectures.io/problems/erdos789-erdos-789-variants-sq) was checked directly: it asks for the all-host asymptotic square-root statement, with the listed source-type hash matching the audit. The proof obligation is not an interval extremum or an improvement of the current logarithmic factors.

I checked the short-relation setup and prime-block estimates in the
[pinned Korsky source](https://github.com/mo271/formal-conjectures/blob/57a0dc60e2cc245b69870647d122fb851f72d8e4/FormalConjectures/ErdosProblems/789.lean).
The source explicitly contains the block lower bound and Chebyshev upper
bound used by the new conditional argument. I did not rebuild this
reference Lean file. Its existing proof of the weaker lower bound is
prior work, and its unproved full-target declarations are not certificates.

The signed-admissibility condition used in the attempt is sufficient for
the official nonempty-subset property. It is equivalent on positive
hosts. The note correctly avoids claiming equivalence on arbitrary
signed hosts.

## Exponential-height implication

Maximality of a signed-admissible set gives a ternary representation of
every other host element: any violating relation must use that element,
and its coefficient is $`1`$ or $`-1`$. The resulting bound
$`|A|\le3^d`$ is valid.

Suppose the proposed nonzero integer model exists on a fixed positive
fraction of the host and preserves every original ternary zero relation
supported on at most $`k=d+1`$ elements. For $`p>k`$, a common valuation
and nonzero unit residue class cannot contain $`k`$ elements: division
by that valuation and reduction modulo $`p`$ would force the coefficient
sum of every short relation to be zero. This would give a forbidden
signed-admissible set of size $`k`$.

The capacity bound at each valuation level is therefore correct. I
checked the exact least-sum calculation with $`M=qc+r`$; its difference
from $`M^2/(2c)-M/2`$ is $`r(c-r)/(2c)\ge0`$. Multiplying by
$`\log p`$, summing over $`k\lt p\le16k`$, and applying the two cited
prime-block inequalities gives the displayed bound on $`M/k^2`$.

Hence a model with $`\log|b_a|=O(k)`$ on a positive fraction would
indeed prove the full target. The known $`O(k\log k)`$ height bound
does not satisfy that hypothesis. No step in the note removes this gap.

## Modular visibility

The saturated quotient is a finite-rank free abelian group. Original
integer evaluation annihilates the relation span and descends to it;
therefore the images of nonzero, distinct host elements remain nonzero
and distinct. The same short-relation argument bounds every nonzero
fiber of a homomorphism to $`\mathbb F_p`$ by $`d`$.

A vector is detected by a uniformly random homomorphism with probability
$`1-1/p`$ exactly when it does not lie in $`p\Lambda`$. Averaging gives
$`N_p\le dp`$. Positive-fraction visibility for some
$`k\lt p\le Kk`$ would consequently suffice for the target as well.

This is an alternative sufficient route. No equivalence between its
unproved visibility hypothesis and the unproved exponential-height
hypothesis is established. The published audit should use “alternative”
instead of its informal “equivalent” wording.

## The fixed-prime counterfamily

For $`A_p=[1,p]\cup p[1,m]`$ with $`m=\lfloor p^2/64\rfloor`$,
the terminal interval supplies the claimed lower bound for admissible
size. Applying [Deshouillers and Freiman's interval theorem](https://numdam.org/item/AST_1999__258__141_0.pdf), Theorem 1, to the two intersections supplies the upper bound. Counting their common element twice only weakens the upper bound, so it is harmless. Both interval lengths tend to infinity, meeting the theorem's sufficiently-large hypothesis. It follows that $`d_p/p\to1/4`$ and eventually $`p>d_p+1`$.

The four displayed relations among $`1,2,3,4,5`$ force
$`b_2=2b_1`$ in any abelian target group, without a torsion-free
assumption. The induction over the seed interval then works. For
$`p\ge7`$, the three summands in
$`2p=(p-1)+(p-2)+3`$ are distinct, and the subsequent three-term
relations extend the formula to all multiples. Every model preserving
those short relations therefore has $`b_a=ab_1`$.

Applying this inside the saturated quotient shows that it is cyclic;
integer evaluation sends its generator to one, so it is exactly
$`\mathbb Z`$. Precisely the $`p-1`$ seed elements outside the multiples
of $`p`$ are visible modulo $`p`$. Their proportion tends to zero.
Thus the counterfamily meets the target-specific assumptions and
refutes the fixed-prime rank shortcut as claimed.

It does not refute the existence of a different useful prime, and its
own small integer coordinates satisfy the proposed height bound. These
limitations are stated correctly.

## Review outcome

The conditional implication, modular bound and fixed-prime obstruction
pass review. Generic large determinants do not by themselves preclude
smaller primitive kernel vectors or a better target-specific model;
the note correctly preserves this distinction.

The work proves no new asymptotic extraction bound. Neither sufficient
hypothesis has been established for arbitrary hosts, so there is no
new completed bounty problem and no full Lean certificate.
