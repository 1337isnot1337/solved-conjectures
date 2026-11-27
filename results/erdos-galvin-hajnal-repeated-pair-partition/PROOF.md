# Erdős–Galvin–Hajnal’s repeated-pair partition problem

**Theorem.** Problem 8/D is independent of ZFC, relative to the consistency of ZFC. [Independent internal review](REVIEW.md)

In [Erdős–Galvin–Hajnal (1975), Diagram 5 and Problem 8/D](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=49), the pattern $`\mathcal T_6`$ consists of the triples
```math
abc,\quad abd,\quad cde,\quad aef
```
on six distinct vertices. The question is whether $`\aleph_1\to(\aleph_1,\mathcal T_6)^3`$. A copy is not required to be induced.

## Positive direction in the rainbow model

Assume the rainbow relation that every two-bounded coloring of $`[\omega_1]^2`$ has an uncountable rainbow subset. We show that if $`H`$ is a triple system on $`\omega_1`$ with no uncountable independent set, then $`H`$ contains $`\mathcal T_6`$.

For distinct $`a,b,f`$, put
```math
Z(a;b,f)=\{z\notin\{a,b,f\}:abz,afz\in H\}.
```
If this set is uncountable, choose a triple $`cde`$ from it, which exists by the assumption on $`H`$. Then $`abc,abd,cde,aef`$ give the desired copy. Thus in a counterexample all the sets $`Z(a;b,f)`$ would be countable.

For each three-element set $`s`$, let $`F(s)`$ be the union of the three sets $`Z(a;b,f)`$ obtained by letting $`a`$ be each point of $`s`$. These unions are countable. Choose a continuous strictly increasing sequence $`(\gamma_\xi:\xi<\omega_1)`$ of countable ordinals with $`\gamma_0=0`$, cofinal in $`\omega_1`$, such that
```math
F(s)\subseteq\gamma_\xi
\quad\text{whenever }\xi>0\text{ and }s\subseteq\gamma_\xi.
```
To choose an appropriate successor value above any given bound, repeatedly enlarge the current countable ordinal to contain the outputs for all its triples and take the supremum after $`\omega`$ steps. At nonzero limit stages, take the supremum of the earlier chosen bounds; every finite input below it is contained in one earlier closed bound.

Partition each countable interval $`[\gamma_\xi,\gamma_{\xi+1})`$ into distinct slots indexed by natural numbers. One slot, collected across all intervals, has uncountable union $`S`$. Each interval contributes at most one point to $`S`$. The lower link of any vertex $`z\in S`$ within $`S`$ is a matching. Otherwise two lower edges share a vertex, giving triples $`abz,afz`$ for $`a,b,f\in S`$ below $`z`$. If $`z\in[\gamma_\xi,\gamma_{\xi+1})`$, all three lower points lie below $`\gamma_\xi`$, so closure would give $`z\in F(\{a,b,f\})\subseteq\gamma_\xi`$, a contradiction.

For each triple $`xyz`$ of $`H`$ in $`S`$ with $`x\lt y\lt z`$, give $`xz`$ and $`yz`$ their own common color. Within each apex these pairs do not conflict because the lower link is a matching. Between apices they do not conflict because the larger endpoint of each colored pair is its apex. Give all remaining pairs their own colors. This is a two-bounded coloring on $`[S]^2`$. Transfer the rainbow assumption along a bijection from $`\omega_1`$ to $`S`$. An uncountable rainbow subset of $`S`$ would be independent in $`H`$, a contradiction.

The required rainbow relation is consistent relative to ZFC: see [Abraham–Cummings–Smyth, Theorem 2 and Remark 4](https://www.math.cmu.edu/users/jcumming/papers/polyx_revised_dec2006.pdf), citing [Todorčević (1983)](https://doi.org/10.1090/S0002-9947-1983-0716846-0) for the large-cardinal-free mixed-support construction. It also follows from PFA.

## Negative direction

[The ccc amalgamation proof](NEGATIVE-MODEL.md) adds a canonical triple system on $`\omega_1`$ that has no uncountable independent set and simultaneously omits both $`\mathcal T_5`$ and $`\mathcal T_6`$. The forcing preserves $`\omega_1`$. Hence the negative arrow for $`\mathcal T_6`$ is also consistent relative to ZFC. The positive and negative sides yield independence of the exact Problem 8/D.

This does not resolve the positive consistency of 8/C (the Pasch system). The step converting the two common links into $`\mathcal T_6`$ explicitly uses that two of the four triples may share a pair. The Pasch system is linear.
