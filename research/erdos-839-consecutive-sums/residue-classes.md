# Every residue class contains a positive lower density of omitted integers

Let $A$ be an infinite increasing sequence of positive integers in which no term is a sum of two or more consecutive earlier terms. Fix a modulus $q\ge1$ and a residue $b$. For every sufficiently large real $X$, at least
```math
 \frac{X}{4qK},\qquad K=8q^2,
```
integers in $[X,2KX]$ are congruent to $b$ modulo $q$ and are outside $A$. In particular the omitted members of each individual class have lower natural density at least $1/(8qK^2)$ in the positive integers. This estimate holds without assuming that $A$ itself has a density.

[Erdős #839](https://www.erdosproblems.com/839) asks whether $A$ must have lower density zero, and even whether its logarithmic density is zero. The conclusion above excludes an almost-full progression in any admissible example. It does not give a bound tending to zero on the density of $A$. [Freud's construction](https://erdosproblems.ai/wiki/library/additive_combinatorics/freud_1993_adding_numbers_problem_p) gives positive upper density for some admissible sequences.

## Local estimate

Inspect the elements of $A$ in $I=[X,2X]$, in increasing order. If fewer than $X/(2q)$ of them are congruent to $b$, the omitted integers in $I$ already suffice for large $X$. Otherwise divide the full ordered list in $I$ into consecutive groups of at most $K$ elements, with only the last group possibly shorter. Consecutive elements of a group are consecutive in the original sequence.

Within a group, assign to each element the sum modulo $q$ of the preceding elements of that group. At most $q$ elements have a state that has not already occurred. There are at most $(X+1)/K+1$ groups, so at least
```math
 \frac{X}{2q}-q\left(\frac{X+1}{K}+1\right)\ge\frac{X}{4q}
```
elements congruent to $b$ have a repeated state, for sufficiently large $X$.

For each such endpoint $v$, choose an earlier position with the same state. The consecutive block from that earlier position through $v$ has sum $S$ congruent to $v$ modulo $q$. Its length $k$ belongs to $[2,K]$, and $S\in[kX,2kX]$. It exceeds its last term, so membership in $A$ would violate the rule. For fixed $k$ the block sums increase strictly with their endpoint, even across different groups. Thus at most $K$ chosen endpoints can yield the same omitted integer. This proves the local estimate. For the lower density through $T$ apply it with $X=T/(2K)$.

More locally, the same proof in $[X,X+H]$ works for $H$ sufficiently large in terms of $q$. Either that interval already has at least $H/(4q)$ missing members of the class, or for some $2\le k\le K$ the dilated interval $[kX,k(X+H)]$ has at least $H/(4qK)$ missing members of the same class. This uses one block length for at least a $1/K$ fraction of the repeated endpoints. It applies even when $H/X$ tends to zero.
