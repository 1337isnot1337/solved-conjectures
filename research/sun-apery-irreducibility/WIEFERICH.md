# Restricting the remaining Wieferich prime-power case

In the notation of [PARTIAL.md](PARTIAL.md), let $p$ be an odd Wieferich prime to base $2$, $N=p^a$, and $M=p^{a-1}$. Any rational factorization of $A_N$ has a factor of degree at least $N-M$. Thus all remaining factors together have degree at most $M$.

Indeed put $G(Y)=A_N((Y-1)/4)$. As in the main note, all intermediate $X$-coefficients of $A_N$ are divisible by $p^2$, and its leading coefficient is a unit. The constant coefficient of $G$ vanishes modulo $p^2$ since $q_p(4)\equiv0\pmod p$. For $1\le j<N$, the only contribution modulo $p^2$ to the coefficient of $Y^j$ is the leading $X^N$ term's binomial expansion. The identity
```math
v_p\binom{p^a}{j}=a-v_p(j)
```
follows from $\binom{p^a}j=(p^a/j)\binom{p^a-1}{j-1}$ and Lucas' theorem, which makes the last factor a unit. Consequently the coefficients at $1\le j<M$ are divisible by $p^2$, the coefficient at $j=M$ has valuation exactly one, and each coefficient at $M<j<N$ has valuation at least one. The Newton polygon therefore has a segment from $(M,1)$ to $(N,0)$, since all other points lie strictly above that segment's line. A root on this segment has valuation $1/(N-M)$, forcing local degree at least $N-M$. The rational factor containing it has at least that degree.

In particular, for a Wieferich prime **index** $N=p$ (not an arbitrary power of that prime), a rational factorization could only split off a rational linear factor. For example the indices $1093$ and $3511$ are also irreducible: reduction modulo $151$ and $103$, respectively, rules out a rational root of the monic reciprocal polynomial.

Here is the modular verification. For a prime $q$, Lucas' theorem gives
```math
A_N(X)\equiv \prod_i A_{d_i}(X^{q^i})\pmod q,\qquad
 N=\sum_i d_i q^i,\quad 0\le d_i\lt q.
```
Indeed $\binom{N}j$ factors digitwise, and $\binom{N+j}j$ is zero modulo $q$ exactly when some carry occurs in $N+j$; with no carry it too factors digitwise. These are exactly the per-digit coefficients on the right. At $N=1093$ the base-$`151`$ digits are $36,7$, and at $N=3511$ the base-$`103`$ digits are $9,34$. Each digit is less than half its base, so the leading coefficients are units and the reciprocal has no zero root on reduction. Evaluating the two digit polynomials over their corresponding finite fields, as in the accompanying exact script, shows no nonzero roots either. Any rational root of the monic integral reciprocal would be an integer, so it would reduce to a root, a contradiction. This does not settle arbitrary Wieferich prime indices or their higher powers.
