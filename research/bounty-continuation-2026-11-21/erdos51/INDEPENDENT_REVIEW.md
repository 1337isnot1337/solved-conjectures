# Independent review of the bounded prime-marker obstruction

21 November 2026. Source: [private-prime-marker-obstruction.md](private-prime-marker-obstruction.md), SHA-256 `683e79613b11ff0e623232f6f8146a9c827e150c4c044407788e043ccfddb94e`.

## Verdict

The proposition and its quantitative counting bound are correct. A set of primes admitting an assignment of a prime divisor of each predecessor, with a fixed bound on reuse of every assigned prime, has convergent reciprocal sum. This is an obstruction to one proposed Euler-product construction. It does not prove or disprove the full least-totient-preimage conjecture.

## Uniformity of the sieve input

I read Theorem 2.5 and its proof in Kevin Ford's [2023 sieve notes](https://ford126.web.illinois.edu/sieve2023.pdf), printed pages 19–21. The implied constant in the middle displayed bound depends only on the number of forms. This is the required uniformity; a result with an unspecified coefficient-dependent constant would not justify summing over growing cofactors.

For the two forms $`t`$ and $`mt+1`$, the determinant parameter is $`m`$. If $`m`$ is even, the number of excluded residues at a prime is one when the prime divides $`m`$ and two otherwise. The forms are primitive, distinct and admissible. The middle bound therefore gives exactly the factor

```math
\prod_{\ell\mid m}(1-1/\ell)^{-1}
=\frac{m}{\varphi(m)},
```

with an absolute implied constant. The note correctly uses this sharper factor rather than the coarser squared factor in the theorem's final bound.

If $`m`$ is odd, an odd prime marker would make $`mr+1`$ an even integer larger than two. The only possible prime marker is then two. It lies in the small-marker part for all sufficiently large cutoffs.

## Counting and summation

The threshold $`R=x/(\log x)^2`$ separates two valid estimates.

For markers at most $`R`$, bounded reuse gives at most $`K\pi(R)`$ selected primes. The elementary prime-count upper bound, also stated immediately before Ford's Theorem 2.5, gives $`O(Kx/(\log x)^3)`$.

For larger markers, writing $`p=mr+1\le x`$ gives $`m<(\log x)^2`$. The logarithm in the sieve denominator satisfies

```math
\log(x/m)\ge\log x-2\log\log x\ge\tfrac12\log x
```

once $`x`$ exceeds an absolute threshold. Counting every simultaneous prime pair for each such $`m`$ only increases the count. Thus this part is at most

```math
\frac{C x}{(\log x)^2}
\sum_{m\le(\log x)^2}\frac1{\varphi(m)}.
```

The elementary divisor identity used for the last sum is correct. Interchanging its finite sums gives the harmonic factor and a nonnegative sum of $`\mu^2(d)/(d\varphi(d))`$. Its Euler product is bounded by $`e`$, since $`\sum_{\ell}1/(\ell(\ell-1))\le1`$. This proves the stated $`O(\log M)`$ average with no coefficient-dependent constant.

Partial summation then reduces reciprocal convergence to the two displayed convergent integrals. In particular, substituting $`u=\log t`$ makes the second integral proportional to $`\int^\infty(\log u)/u^2\,du`$. This checks the endpoint needed for an infinite Euler product, rather than merely a zero-density conclusion.

## Relevance and limit

Convergence of $`\sum_{p\in\mathcal P}1/p`$ implies convergence of the product $`\prod_{p\in\mathcal P}(1-1/p)^{-1}`$. Therefore repeatedly accumulating primes from one such set cannot make $`n/\varphi(n)`$ unbounded by that mechanism.

The bounded-reuse hypothesis has not been derived from arbitrary full inverse-totient fibers. Reusing small prime markers without a fixed bound is outside the theorem, as are other constructions. The source states this gap explicitly and makes no novelty claim for the elementary sieve consequence.

This review checks a written proof and its cited sieve theorem. It is not a Lean replay or a completed bounty submission.
