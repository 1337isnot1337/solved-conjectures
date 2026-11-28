# Erdős’s sum-free avoidance conjecture

**Necessary condition on a counterexample.** Let $V$ be a rational vector space, let $S\subset V$ be sum-free, and let $A$ be inclusion-maximal subject to $(A\cup(A+A))\cap S=\varnothing$. If $H$ is a rational subspace containing $A$ with infinite cardinality $\kappa>|A|$, then every nonzero coset $C$ in $V/H$ satisfies
```math
|S\cap C|=|C\setminus S|=\kappa.
```
In particular, a counterexample to [Erdős Problem 949](https://www.erdosproblems.com/949) is fully mixed, in this cardinal sense, on every nonzero coset of every continuum-sized rational subspace containing the span of a maximal safe set. This is an obstruction, not a resolution.

## Proof

Call a coset small when $|C\cap S|<\kappa$, and call it almost full when $|C\setminus S|<\kappa$. These two types are disjoint because $|C|=\kappa$.

If a nonzero coset $C$ is small, then $C$ contains fewer than $\kappa$ points in
```math
S\ \cup\ \bigcup_{a\in A}(S-a):
```
each translate contributes at most $|S\cap C|$, since $a\in H$. Every other $x\in C$ is eligible to join $A$ except possibly for its diagonal sum $2x$. As $x\notin A$, maximality forces $2x\in S$. Doubling gives a bijection from $C$ to $2C$, so $2C$ is almost full.

The sum of any two almost-full cosets, restricted to their points in $S$, fills the whole sum coset. For each prescribed sum $z$, one may choose its first summand in the original first coset avoiding the two sets of excluded points of size below $\kappa$. By sum-freeness the sum coset must therefore be disjoint from $S$.

Now suppose that a nonzero coset $C$ is almost full. The quotient is a rational vector space, so all numbered cosets below are nonzero. Using the two implications just proved:
- $2C$ is empty of $S$, hence $4C$ is almost full.
- $C+4C=5C$ is empty of $S$, hence $10C$ is almost full.
- $4C+4C=8C$ is empty of $S$, hence $16C$ is almost full.
- If some $s\in S\cap 3C$ existed, the translate $s+(S\cap C)$ would be almost full in $4C$, so it would intersect $S\cap4C$. Thus $3C$ is empty of $S$, and $6C$ is almost full.
- But $6C+10C=16C$, forcing $16C$ to be empty of $S$, a contradiction.

Thus no nonzero coset is almost full. None is small either, since a small nonzero coset gives an almost-full nonzero doubled coset.

## Additional restriction from the positive-density theorem

For $V=\mathbb R$ and $\kappa=\mathfrak c$, the [relative positive-density argument](POSITIVE-BANACH-DENSITY.md) shows that in a counterexample each one of the full-size fibers $S\cap C$, after translation into $H$, has discrete upper Banach density zero in $H$. The maximality argument alone cannot turn full cardinality into positive density.
