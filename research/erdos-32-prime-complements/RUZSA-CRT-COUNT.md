# The residue-counting step in Ruzsa's proof

This note supplies a proof of the CRT-counting step needed for Ruzsa's [*On the additive completion of primes*, Theorem 2, p. 275](https://matwbn.icm.edu.pl/ksiazki/aa/aa86/aa8638.pdf#page=7). It does not dispute the theorem. See the [companion note](MANY-OMISSIONS.md) for a stronger count by a different sieve argument.

Ruzsa first chooses a residue class modulo $m$ leaving $l$ shifts $b_1,\ldots,b_l$ unhit by the primes dividing $m$. He uses $l$ further distinct primes $p_1,\ldots,p_l$, assigning one to each shift, and counts $l!$ assignments. Different assignments need not give distinct residue classes modulo $m\prod_jp_j$: two shifts can coincide modulo two of the chosen primes, in which case exchanging their assignments need not change the class. Here is a collision-safe replacement.

For each $j$ regard the residues modulo $p_j$ as an alphabet of size $p_j$. Row $i$ is hit in column $j$ if the selected symbol in that alphabet is the residue of $b_i$. A uniform independent choice of the column symbols defines an auxiliary residue modulo $\prod_jp_j$ by CRT. Enlarge one column at a time to an alphabet of size $q_j=\max(p_j,l)$ and replace all its $l$ row symbols by distinct values. This can only decrease the probability that all rows are hit. To see it, condition on all other columns. If no row is left unhit, that conditional probability is one. If one is left, it changes from $1/p_j$ to $1/q_j$. If at least two are left, the new conditional probability is zero, irrespective of their original residues.

After all replacements, covering all rows is possible only by assigning the $l$ columns bijectively to the $l$ rows. This gives exactly $l!$ favorable equally likely choices. Thus the original cover probability is at least
```math
\frac{l!}{\prod_jq_j}.
```
Equivalently, there are at least $l!\prod_j (p_j/q_j)$ distinct auxiliary residue classes in which all shifts are hit by at least one auxiliary prime; we do not require these prime hits to be an injective assignment in the original residue system. When $l=0$ the empty product gives the single class modulo $m$.

The normalization loses at most $\exp(O(l))$: indeed
```math
\log\prod_j\frac{q_j}{p_j}
 \le \sum_{p\lt l}\log(l/p)\le \pi(l)\log l=O(l).
```
In Ruzsa's argument $l=O(\log x/\log\log x)$, so this is negligible compared to the exponent $\log x\log\log\log x/\log\log x$ in his missing-point bound. Each favorable residue class still gives at least the same number of integers up to $x$, and the same prime exceptions—possible only when the represented prime is one of the sieve primes—are removed. The stated Theorem 2 therefore follows by the original estimates, with no assumption about whether the auxiliary shift residues collide.
