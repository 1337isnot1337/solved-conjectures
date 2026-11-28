# Lehmer’s totient conjecture: a finite-valuation obstruction

**Status:** Partial result about a relaxation. The conjecture remains unresolved. The examples here intentionally fail full divisibility and are not claimed to be Carmichael numbers.

Lehmer asks whether $`\varphi(n)\mid n-1`$ implies primality for $`n>1`$. A hypothetical composite solution is odd and squarefree. Its prime support is independent in the graph that joins $`p<q`$ when $`p\mid q-1`$: for squarefree $`A`$, this independence is equivalent to $`\gcd(A,\varphi(A))=1`$. [Lehmer’s original paper](https://doi.org/10.1090/S0002-9904-1932-05521-5) and [Bhattacharjee’s current preprint](https://hexagonmath.org/2610.00454v2) provide the context. The latter uses the independence condition for lower bounds on the number of prime factors, but explicitly does not resolve the all-factor problem.

## Theorem

Fix integers $`M\ge2`$, $`K\ge1`$, a real $`\eta>0`$, a finite set of primes $`F`$, and positive integer precisions $`t_\ell`$ for $`\ell\in F`$. There are infinitely many odd squarefree composites $`n`$, all of whose prime divisors exceed $`K`$, such that
```math
  \gcd(n,\varphi(n))=1,\qquad
  M<\frac{n-1}{\varphi(n)}\lt M+\eta,\qquad
  v_\ell\left(\frac{n-1}{\varphi(n)}-M\right)\ge t_\ell
  \quad (\ell\in F).
```
Yet $`\varphi(n)\nmid n-1`$ for every constructed $`n`$. In fact each has the form $`Aq`$ for a fixed $`A>1`$ and arbitrarily large primes $`q>A`$. The divisibility inequality holds at every prime dividing $`\varphi(A)`$; all offending primes divide $`q-1`$, are outside $`F`$, and do not divide $`\varphi(A)`$.

Here $`v_\ell`$ is extended to nonzero rationals by subtraction of the valuations of numerator and denominator. In particular, the rational index is close to the **same** integer $`M`$ at the real place and all specified prime places, not merely integral at those prime places.

### Lemma: independent greedy primes have divergent reciprocal sum

Begin with any finite independent set of odd primes, allowing the empty set. Fix a cutoff $`Z`$ at least the largest seed prime. Scan all primes larger than $`Z`$ in increasing order; select $`p`$ exactly when no previously selected prime divides $`p-1`$. Let $`\mathcal S`$ consist of the seed and all selected primes. Then $`\sum_{s\in\mathcal S}s^{-1}=\infty`$.

Indeed, suppose the sum were finite. Then
```math
   \delta_0=\prod_{s\in\mathcal S}\left(1-\frac{1}{s-1}\right)>0.
```
This uses $`s\ge3`$ and convergence of $`\sum 1/(s-1)`$. For any fixed $`T`$ larger than $`Z`$, the prime number theorem for arithmetic progressions and the Chinese remainder theorem show that the number of primes $`p\le X`$ avoiding $`p\equiv1\pmod s`$ for every $`s\in\mathcal S`$ with $`s\le T`$ is
```math
  \left[\prod_{\substack{s\in\mathcal S\\s\le T}}
    \left(1-\frac{1}{s-1}\right)+o_T(1)\right]\frac{X}{\log X}
  \ge (\delta_0+o_T(1))\frac{X}{\log X}.
```
The finitely many primes dividing the combined modulus change the count only by a bounded term.

Fix $`0<\epsilon<1/2`$. The number of primes $`p\le X`$ with $`p\equiv1\pmod s`$ for some $`s\in\mathcal S`$ with $`T<s\le X^{1-\epsilon}`$ is bounded by
```math
   \frac{2X}{\epsilon\log X}\sum_{\substack{s\in\mathcal S\\s>T}}\frac{1}{s-1}
```
by the Brun–Titchmarsh inequality and a union bound.

For the remaining potential exclusions, $`s>X^{1-\epsilon}`$ and $`p=ks+1\le X`$ for an integer $`1\le k<X^\epsilon`$. Drop membership in $`\mathcal S`$ and count all such pairs of primes. The uniform two-prime upper sieve in [Luca and Pomerance, *On the range of Carmichael’s universal-exponent function*, Lemma 3.1](https://math.dartmouth.edu/~carlp/rangeoflambda13.pdf), with $`a=k`$ and $`t=X/k`$, bounds this number by
```math
  \ll \frac{X}{(1-\epsilon)^2(\log X)^2}
     \sum_{k\le X^\epsilon}\frac1{\varphi(k)}
   \ll \frac{X(1+\epsilon\log X)}{(\log X)^2}.
```
The implied constants are absolute for $`\epsilon<1/2`$. The last estimate follows from
```math
   \sum_{k\le U}\frac1{\varphi(k)}
    =\sum_{d\le U}\frac{\mu^2(d)}{d\varphi(d)}
        \sum_{j\le U/d}\frac1j
    \ll 1+\log U,
```
since the sum of the outer coefficients has Euler product
$`\prod_p(1+1/[p(p-1)])<\infty`$.

Choose $`\epsilon`$ so small that the last exclusion bound is below $`(\delta_0/4)X/\log X`$ for sufficiently large $`X`$. Then choose the fixed $`T`$ so large that the middle exclusion bound is less than $`(\delta_0/4)X/\log X`$. For all sufficiently large $`X`$, at least $`(\delta_0/4)X/\log X`$ primes up to $`X`$ exceed $`Z`$ and avoid all forbidden residue classes. They are in $`\mathcal S`$ by the greedy rule. Partial summation contradicts convergence of the reciprocal sum.

### Proof of the theorem

By Dirichlet’s theorem choose an odd prime $`p_0>K`$, as large as needed, with $`p_0\equiv1\pmod{\prod_{\ell\in F}\ell}`$. For empty $`F`$ this congruence imposes no condition. Take $`p_0`$ also larger than every prime in $`F`$, and so large that $`M/(p_0-1)<\eta/2`$. Begin the greedy independent construction with seed $`\{p_0\}`$ and cutoff $`p_0`$. The product of $`p/(p-1)`$ over the selected primes tends to infinity by the lemma, since $`\log(p/(p-1))\ge1/p`$. Hence there is a first finite prefix with product greater than $`M`$. Let $`A`$ be the product of the primes in that prefix and $`B=\varphi(A)`$. The crossing factor is at most $`1+1/(p_0-1)`$, so
```math
  M< A/B < M+\eta/2.
```
Independence gives $`\gcd(A,B)=1`$, and the choice of $`p_0`$ gives $`\ell\mid B`$ for every $`\ell\in F`$.

For each prime $`\ell\mid B`$, put $`a=v_\ell(B)\ge1`$, $`b=v_\ell(A-1)`$, and use $`t=t_\ell`$ if $`\ell\in F`$ and $`t=1`$ otherwise. Require the final prime to lie in the residue class
```math
  q\equiv (1-MB)(A-MB)^{-1}\pmod{\ell^{a+b+t}} .
```
Both numerator and denominator in this residue are units modulo $`\ell`$. The residue minus 1 equals $`(1-A)(A-MB)^{-1}`$, and the modulus exponent is greater than $`b`$. Hence $`v_\ell(q-1)=b`$ and
```math
  v_\ell\bigl(Aq-1-MB(q-1)\bigr)\ge a+b+t .
```
Thus the rational index minus $`M`$ has valuation at least $`t`$ at every such $`\ell`$; in particular the integer divisibility inequality holds at $`\ell`$.

For every prime $`r\mid A`$, also require $`q\equiv-1\pmod r`$. Since $`A`$ is odd, these residues prevent $`r\mid q-1`$. They do not conflict with the residue classes at primes dividing $`B`$, since $`\gcd(A,B)=1`$. The Chinese remainder theorem delivers one reduced class, and Dirichlet gives infinitely many primes in it. Choose $`q>A`$ and large enough that
```math
  \frac{Aq-1}{\varphi(Aq)}
    =\frac{A}{B}+\frac{A-1}{B(q-1)}\lt M+\eta .
```
Each $`n=Aq`$ is odd and squarefree, and $`\gcd(n,\varphi(n))=1`$: old prime factors do not divide $`B(q-1)`$, and $`q>B`$. Finally, $`q-1\nmid Aq-1`$ since the residue is $`A-1\in(0,q-1)`$. This is a failure of the full Lehmer condition as $`q-1\mid\varphi(n)`$. Every deficient prime lies outside the prime divisors of $`B`$, hence divides $`q-1`$ and is outside $`F`$.

## Corollary: independent targets at the tested places

The same construction works with an arbitrary real target $`x>1`$ in place of $`M`$ and arbitrary $`z_\ell\in\mathbb Q_\ell`$ as the target at each $`\ell\in F`$. To see this, require $`p_0\equiv1\pmod{\ell^{1+\max(0,-v_\ell(z_\ell))}}`$ for each nonzero $`z_\ell`$, with exponent 1 when $`z_\ell=0`$, choose $`p_0`$ large enough for the desired real precision, and cross $`x`$ rather than $`M`$ with the greedy prefix. In the final congruence use $`z_\ell`$ instead of $`M`$ at a tested prime and zero at other primes dividing $`B`$. The product $`z_\ell B`$ lies in $`\ell\mathbb Z_\ell`$; therefore both numerator and denominator of the new residue class are units and the argument applies in $`\mathbb Z_\ell/\ell^{a+b+t}\mathbb Z_\ell`$ as before. The conclusion is simultaneous density in $`(1,\infty)\times\prod_\ell\mathbb Q_\ell`$ with the **ordinary product topology**, not the restricted-product adelic topology. It does not control the infinitely many places outside a given finite test set.

## Consequences and limitations

* Finite valuation windows cannot certify that an odd squarefree independent support with a rational index near a specified integer is impossible. The result permits simultaneously increasing the prime cutoff of $`n`$, tightening the real error, and specifying ever more prime places and higher local precisions.
* The constructed numbers fail even the Korselt condition at the final prime. An argument using the **full** Korselt condition cannot be excluded by this construction. Likewise the theorem leaves open uniform real error on the scale $`1/\varphi(n)`$ or control of primes dividing the changing last shifted prime.
* The analytic avoidance argument has a close predecessor. [Elliott, *A conjecture of Kátai*, Acta Arith. 26 (1974), 11–20](https://doi.org/10.4064/aa-26-1-11-20), proof of Theorem 2, printed pp. 17–19, uses a fixed-prime truncation and a switched-cofactor sieve for the large-prime tail to find shifted primes $`p+1`$ avoiding a set of odd primes with convergent reciprocal sum, with additional fixed-multiplier conditions. [Berrizbeitia and Elliott, *On products of shifted primes*, Ramanujan J. 2 (1998), 219–223](https://doi.org/10.1023/A%3A1009778428696), Lemma 7, points out this consequence. The $`p-1`$ version needed here is proved above using the modern Luca–Pomerance formulation. The avoidance input should be understood as an adaptation/rediscovery of established sieve ideas.
* Bhattacharjee's preprint studies greedily chosen independent prime sets and finite-rank ratio growth; ordinary primitive-set results instead forbid divisibility between integers themselves, not divisibility of one prime into another prime minus 1. Searches for the simultaneous prescribed real/prime-adic approximation statement did not locate an exact prior result, but no exclusive priority claim is intended.
