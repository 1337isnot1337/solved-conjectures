# Independent review of the Erdős 677 local-realization diagnostic

21 November 2026. Reviewed source: [local-congruence-and-realization-gap.md](local-congruence-and-realization-gap.md), SHA-256 `874f77d27226f309caedfb363cbdbf9487e25abca9d34fd49d6b9645253164a2`.

## Verdict and scope

The finite-local construction is correct as stated. It produces infinitely many pairs that satisfy the listed finite valuation, carry, polynomial-congruence, and first-order real tests, while their block LCMs are unequal. This is consistent with Erdős 677. It does not construct a collision, prove that collisions are impossible, or satisfy the complete transport conditions in the prior paper.

The general CRT limitation is already recorded in the July working report. The source explicitly disclaims priority for that observation. No full bounty solution, Lean verification, submission, acceptance, or payment follows from this review.

## Primary-source check

I checked the extracted text of the [September 2026 Danesh–Bianchetti paper](https://ijmttjournal.org/public/assets/volume-72/issue-9/IJMTT-V72I9P101.pdf), with the PDF pinned to SHA-256 `99f3db586d45c66f87280a78466b191892a030ef4577309297acd6061aab5f3f`. In particular:

- Proposition 4, equations (58)–(62), gives the complete owner matrix, its row and column factorizations, and each factorial residual bound.
- Proposition 12, equations (133)–(142), charges the factorial factor once in the primitive packet extraction.
- Theorem 14, equations (154)–(162), proves a finite spectrum when exactly two primitive sites are active. It does not eliminate three or more active sites.
- Proposition 16, equations (174)–(179), gives both exact sliding-LCM reflection equivalences.

The [live bounty statement](https://conjectures.io/problems/erdos677-erdos-677), checked on the same date, quantifies over every positive block length and every pair of disjoint ordered blocks. Its displayed reward and absence of complete attempts are an eligibility snapshot, not proof of the mathematical status or a payment guarantee.

## Reflection and periodic carries

For a prime power dividing an upper entry $`m+j`$, divisibility of some lower entry is equivalent to divisibility of the corresponding difference $`d+j-i`$. Checking every maximal prime power gives the reflection equivalence. Checking every upper and lower entry then gives both LCM divisibilities. Thus the complete sliding system is equivalent to a collision; retaining only a selected finite collection of its prime tests is a genuine weakening.

For $`p^a\le k\lt p^{a+1}`$, a block of length $`k`$ contains a multiple of $`p^a`$, while at most one entry contains each higher power. Subtracting the maximum valuation from the sum of the valuations therefore gives

```math
v_p\!\left(\frac{P_k(x)}{M_k(x)}\right)
=\sum_{i=1}^k\min\{v_p(x+i),a\}-a.
```

This proves the displayed gcd formula and periodicity modulo $`\lambda_k`$. Primes greater than $`k`$ contribute zero defect.

When $`b=k+1`$ is not a prime power, each maximal prime-power divisor of $`b`$ occurs among $`1,\ldots,k`$. Therefore $`b\mid\lambda_k`$. The overlapping seed blocks at $`0`$ and $`1`$ have the same LCM, and their product ratio is exactly $`b`$. This gives the claimed carry coefficients $`1,b`$.

The congruences $`n\equiv0,m\equiv1`$ modulo a common multiple of $`N`$ and the chosen small-prime powers preserve every small-prime entry valuation. The selected exponents exceed every seed valuation, including those at $`k+1`$. This verifies both the carry claim and the congruence modulo $`N`$.

## Rough-prime lifting

At a chosen prime $`p>B\ge k+1`$, the derivative

```math
P_k'(-j)=(-1)^{j-1}(j-1)!(k-j)!
```

is a unit. The displayed digit-by-digit lifting argument gives a unique solution near $`-j`$ to the prescribed polynomial congruence. With $`n\equiv-i+p^e`$, reduction modulo $`p^{e+1}`$ gives

```math
m+j\equiv b\,P_k'(-i)\,P_k'(-j)^{-1}p^e
\pmod{p^{e+1}}.
```

The coefficient is a unit. Hence the two selected entries have valuation exactly $`e`$, and all other entries in their blocks are units at $`p`$. The assumption $`r\ge2e`$ implies $`r\ge e+1`$ for every $`e\ge1`$, so the prescribed precision contains the needed exact-valuation information. The prime exclusions make the CRT moduli coprime. No compatibility condition has been omitted.

## The unmatched prime and real corridor

A fresh prime $`\ell>k+1`$ with $`n\equiv0,m\equiv-1\pmod\ell`$ divides an upper entry and no lower entry. It also makes the normalized product difference congruent to $`-bk!`$, a nonzero residue. Thus neither exact product equality nor LCM equality can hold.

The fixed congruences leave $`n=u+Tt,m=v+Ts`$. The coefficient $`\alpha=(k+1)^{1/k}`$ is irrational: a rational root of the monic polynomial would be an integer, whereas $`1<\alpha<2`$. The real corridor is exactly

```math
\alpha-1\lt m-\alpha n\lt k(\alpha-1).
```

After division by $`T`$, the allowable errors form a nonempty open interval modulo one. Every tail of the irrational rotation is dense, so infinitely many arbitrarily large positive $`t`$ admit an integer $`s`$. On those pairs $`m/n\to\alpha>1`$, which eventually gives positivity and the required disjointness. This only proves a fixed-width approximation. The source correctly excludes the stronger shrinking approximation from its claim.

## Why the construction does not satisfy the global hypotheses

The chosen rough-prime packets are fixed while the integer pairs grow. Dividing an entry by its assigned packet therefore leaves an unbounded residual. It eventually exceeds the fixed factorial bound from Proposition 4. The deliberately unmatched prime is an additional explicit failure of complete factor coverage.

The obstruction to extending the two-site argument is also correctly calculated. If $`r`$ primitive sites are active, the exact packet identity and the linear upper bound on each $`\mu_i`$ yield

```math
\prod_{\mathcal J_i>1}x_i
<
\frac{\mathcal C b^{r-1}(k-1)^r}{a}\,d_0^{r-2}.
```

Only at $`r=2`$ does this bound remove dependence on the reduced gap. For $`r\ge3`$, it does not supply the finite list required by the prior spectrum argument. This does not prove that every different higher-site argument must fail.

The remaining mathematical obligation is full integer realization or exclusion with every prime factor represented and both residual budgets satisfied. The reviewed construction deliberately stops short of that obligation.
