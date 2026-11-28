# Lehmer’s totient conjecture: controlling the denominator of the local examples

**Status:** A strengthening of the finite-valuation obstruction, not a proof or disproof of the conjecture. All its examples fail Lehmer’s condition, and fail the Korselt test at their last prime.

In the [finite-valuation obstruction](local-obstruction.md), fix the target integer $`M`$, real tolerance, prime cutoff, and finite prime-adic targets of the main theorem. The construction fixes an odd squarefree integer $`A>1`$, denotes $`B=\varphi(A)`$, and puts the last prime $`q`$ in one fixed reduced residue class $`R\pmod Q`$. Here $`\gcd(A,B)=1`$, the prime divisors of $`Q`$ are exactly the prime divisors of $`AB`$, all the specified congruences hold, and every such large prime $`q`$ gives the required real and local approximations for $`n=Aq`$.

Fix any $`1/5<\theta<1/4`$. For all sufficiently large $`X`$, there are $`\gg X/(\log X)^2`$ such primes $`X/2<q\le X`$ for which the reduced denominator of the rational number $`(n-1)/\varphi(n)`$ has between one and four prime factors counted with multiplicity, all at least $`X^{\theta}`$, hence at least $`q^\theta`$. Implied constants and the lower endpoint on $`X`$ may depend on the fixed data and $`\theta`$.

## Proof

Let
```math
  d_* = \prod_{\ell\mid B} \ell^{v_\ell(A-1)}.
```
The fixed congruences ensure that $`v_\ell(q-1)=v_\ell(A-1)`$ for every $`\ell\mid B`$, and that $`q-1`$ is coprime to $`A`$. Thus $`d_*\mid Q`$, and for every integer $`q\equiv R\pmod Q`$ we have
```math
 q-1=d_*h,\qquad \gcd(h,Q)=1 .
```
The divisibility inequalities at primes dividing $`B`$ imply $`Bd_*\mid Aq-1`$. If all prime factors of $`h`$ exceed $`A-1`$, then $`\gcd(h,Aq-1)=1`$ because $`Aq-1\equiv A-1\pmod h`$. Since $`\varphi(Aq)=Bd_*h`$ for prime $`q>A`$, in this case $`h`$ is exactly the reduced denominator.

It remains to sieve the positive integers $`h=(q-1)/d_*`$ for prime $`q\in(X/2,X]`$ in the class $`R\pmod Q`$. Put $`z=X^\theta`$, and take a fixed $`\beta\in(2\theta,1/2)`$ and $`D=X^\beta`$. For every squarefree $`u\le D`$ coprime to $`Q`$, the condition $`u\mid h`$ is equivalent to $`q\equiv1\pmod u`$. The latter congruence combines with $`q\equiv R\pmod Q`$ into one reduced class mod $`Qu`$. The arithmetic-progression count therefore has a main term
```math
 g(u)X_0,\qquad
 g(u)=\frac1{\varphi(u)},\qquad
 X_0=\frac{\mathop{\mathrm{Li}}(X)-\mathop{\mathrm{Li}}(X/2)}{\varphi(Q)}.
```
The sum of the absolute remainders over these $`u`$ is $`O(X/(\log X)^3)`$ by the classical [Bombieri–Vinogradov mean value theorem](https://doi.org/10.1112/S0025579300005313). Indeed $`u\mapsto Qu`$ is injective; the moduli are at most $`QX^\beta`$, inside the theorem's range at both endpoints for all sufficiently large $`X`$, and the theorem takes a maximum over reduced residues.

The sifting primes are those not dividing $`Q`$, so 2 is omitted. The local factor is $`1-1/(\ell-1)`$; it equals
```math
  (1-1/\ell)(1-1/(\ell-1)^2).
```
The second product converges to a nonzero constant and Mertens' theorem gives the dimension-one product estimate and
```math
 V(z)=\prod_{\substack{\ell\lt z\\\ell\nmid Q}}
             \left(1-\frac1{\ell-1}\right)\asymp_Q(\log z)^{-1}.
```
The standard lower [linear sieve](https://doi.org/10.4064/aa-37-1-307-320) with $`s=\log D/\log z=\beta/\theta>2`$ has a strictly positive lower main-term factor $`f(s)`$, and its summed remainder is negligible here. Hence at least $`c_{Q,\theta}X/(\log X)^2`$ of these primes have no prime factor below $`z`$ in their corresponding $`h`$. No prime dividing $`Q`$ divides $`h`$ anyway, so $`h`$ is genuinely $`z`$-rough. For large $`X`$, $`h>1`$ and $`z>A-1`$; since $`h\le X`$ and $`z^5>X`$, it has at most four prime factors counted with multiplicity. This proves the exact denominator statement.

## Boundary

The unproved step remains eliminating the final prime's congruence failure for **actual** Lehmer candidates. The theorem only shows that the failure can be moved into at most four genuinely large primes without losing arbitrarily precise finite real and local tests. The sieve application uses established large-sieve and linear-sieve results; it does not establish a new result about almost primes in arbitrary progressions independently of the stated construction.
