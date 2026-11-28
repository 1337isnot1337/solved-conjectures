# Mixed moduli must accumulate at one prime

Call a modulus *mixed* if it has at least two distinct prime factors greater than three. For a prime $q\ge5$ let $i(q)$ be the number of primes strictly between three and $q$. In every cover in [Erdős #273](https://www.erdosproblems.com/273) some prime satisfies
```math
 \sum_{\substack{m\text{ mixed}\\P^+(m)=q}}q^{1-v_q(m)}>i(q),
```
where $P^+(m)$ denotes its largest prime factor. In particular a cover cannot use just two auxiliary primes per mixed modulus with at most one modulus for each unordered pair. This excludes even complete graphs of distinct prime pairs, with unbounded exponents and arbitrary 3-smooth cofactors.

**Proof.** Keep the uniformly sampled 2- and 3-coordinates and the single-prime forbidden weights $W_q$ of the [base estimate](one-auxiliary-prime.md). There exists a base point avoiding the direct classes and satisfying
```math
 W_q<1-i(q)/q\qquad(q\ge5)
```
simultaneously. For $q\le200$ the same [rational certificate](verify_fibres.py) uses this new threshold in the denominator. The direct loss and all these small-prime bounds sum to less than $954/1000$. For $q>200$ the threshold is at least $2/3$, since every earlier auxiliary prime lies among the integers coprime to six and $i(q)\le q/3$ by counting their two residue classes. Use the rectangle from the base estimate, whose deterministic contribution is at most $1/2$. Its slack is at least $1/6$, and its parameter $A$ is now at least ten. The large-prime contribution is at most $3\sum_{A\ge10}(2^{-A}+3^{-A})$. Indeed the expected contribution outside the rectangle is at most $3(2^{-A}+3^{-A})/(2(q-1))$, and $3(4A+2)/(2A^2)\le1$. Total loss is less than $97/100$.

Suppose all the displayed load inequalities in the theorem failed. Starting from this base, choose the prime-power coordinates in ascending prime order. At step $q$, every mixed class ending at $q$ whose previously chosen coordinates match can remove at most fraction $q^{-v_q(m)}$ of its coordinate. Together they remove at most $i(q)/q$. Adding the unary weight $W_q$ still leaves a legal choice for $q$. The Chinese remainder theorem gives a surviving integer, proving the assertion. For the prime-pair consequence there are only $i(q)$ possible smaller partners and each contributes at most one to the load.
