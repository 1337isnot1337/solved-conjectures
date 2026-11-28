# Fixed-gap summands in Sárközy’s smooth-number conjecture

**Partial, not the general conjecture.** Fix $`0<\epsilon<1`$ and put $`S=\{n\ge1:P^+(n)\le n^\epsilon\}`$, with $`P^+(1)=1`$. For each fixed integer $`d>0`$, the pattern $`010`$ across $`n,n+d,n+2d`$ in the indicator of $`S`$ has positive lower natural density. Consequently, if every element $`a`$ of $`A`$ has another element $`a\pm d`$ in $`A`$, the symmetric difference $`S\triangle(A+B)`$ has positive lower natural density, for every $`B`$. This rules out a two-element summand, a nontrivial arithmetic-progression summand, or any union of fixed-distance pairs, throughout the fixed-exponent range.

## Weighted analytic input

Put $`\delta=\rho(1/\epsilon)\in(0,1)`$ where $`\rho`$ is the Dickman function; let $`s`$ be the indicator of $`S`$. For arbitrary $`\omega=\omega(X)\to\infty`$ with $`\omega\le\log(3X)`$, let $`\mathbb E_X`$ denote the normalized sum with weight $`1/(n\log\omega)`$ over $`X/\omega\le n\le X`$. Its total mass is $`1+o(1)`$. For each fixed $`i,j`$ with $`i\ne j`$,
```math
 \mathbb E_X s(n+i)=\delta+o(1),\qquad
 \mathbb E_X s(n+i)s(n+j)=\delta^2+o(1).
```
This is a two-point weighted assertion, not a three-point independence assumption.

A fixed shift of a bounded function changes its weighted average by $`o(1)`$, from the endpoint weights and the sum of harmonic weight differences. The marginal follows by partial summation from $`|S\cap[1,Y]|=\delta Y+o(Y)`$; that last estimate follows by sandwiching on each fixed interval $`[aY,Y]`$ between cutoffs $`(aY)^\epsilon,Y^\epsilon`$ and then letting $`a\downarrow0`$.

For the pair use [Teräväinen, Theorem 1.4 and §4](https://arxiv.org/pdf/1710.01195) with the frozen multiplicative indicator $`f_X(m)=1_{\{P^+(m)\le X^\epsilon\}}`$ and fixed nonzero shift $`j-i`$. Its dyadic mean tends to $`\delta`$ by Dickman. The fixed-modulus uniformity hypothesis follows also from inclusion–exclusion on the $`O_\epsilon(1)`$ primes exceeding $`X^\epsilon`$ in any $`m\le2X`$. Each nonunit squarefree product $`u\le2X`$ of these primes is coprime to any bounded fixed modulus for large $`X`$; the discrepancy between counts of its multiples in a residue class and its proportional share of the total is $`O(1)`$. There are $`O_\epsilon(X/\log X)`$ such nonunit products: fix all but one prime and apply the prime count $`O_\epsilon(X/(v\log X))`$ for remaining product factor at most $`2X/v`$ and exceeding $`X^\epsilon`$; the sum of reciprocal products $`1/v`$ is bounded by the bounded number of factors and Mertens' estimate. Hence the total discrepancy is $`o(X)`$.

Changing from $`f_X(n+j)`$ to $`s(n+j)`$ for fixed $`j`$ can only matter for a multiple of some prime in $`[(X/\omega-O(1))^\epsilon,(X+O(1))^\epsilon]`$. Each such progression has weighted sum before normalization $`O(\log(\omega)/p+\omega/X)`$. Mertens gives $`o(1)`$ for the sum of reciprocal primes in the band, and the other error summed over primes is $`O_\epsilon(X^{\epsilon-1}\omega)=o(1)`$. This proves the weighted claim.

## The isolated pattern

Write $`p_{001}(X)`$, $`p_{010}(X)`$ for the indicated weighted frequencies at consecutive steps of $`d`$. Expanding the indicators shows that both are
```math
 \delta-2\delta^2+\mathbb E_X[s(n)s(n+d)s(n+2d)]+o(1).
```
Thus their difference tends to zero without requiring a limit for the triple correlation. The initial pair $`00`$ has weight $`(1-\delta)^2+o(1)`$. By the binary laws, the number of ones in the length-$`H`$ word has second centered moment $`H\delta(1-\delta)+o(1)`$, so the all-zero probability is at most $`(1-\delta)/(H\delta)+o(1)`$. Every word beginning $`00`$ either is all zero or contains $`001`$ at its first one. Fixed translation does not change weighted frequencies asymptotically. Therefore for each integer $`H\ge3`$,
```math
 (1-\delta)^2\le \frac{1-\delta}{H\delta}+(H-2)p_{001}(X)+o(1).
```
Choose $`H>1/[\delta(1-\delta)]`$. This yields a positive lower bound for $`\liminf p_{010}(X)`$, uniform in the choice of admissible $`\omega`$. If the natural density had lower limit zero, take a sequence $`X_i\to\infty`$ on which the unweighted density $`D_i\to0`$; choose $`\omega(X_i)\to\infty`$ so slowly that $`\omega(X_i)D_i\to0`$, and extend to an admissible function elsewhere. The weighted pattern frequency at $`X_i`$ would be at most $`\omega(X_i)D_i/\log\omega(X_i)\to0`$, contradiction.

Any element of $`A+B`$ has a neighbor $`d`$ away if its $`A`$-coordinate has one. Thus $`010`$ is forbidden. Each isolated pattern of $`S`$ then forces at least one disagreement, and a disagreement can hit at most three windows. This proves the asserted robustness.

## Conditional finite-factor extension

Under Schinzel’s hypothesis H one can exclude every finite nontrivial factor. For a finite set of nonzero integer shifts $`D`$, choose $`L`$ divisible by all $`|h|,\ h\in D`$, a prime $`P\nmid L`$ and an integer $`k\ge1/\epsilon`$. Then $`n=P(Lt)^k`$ is smooth for every large $`t`$. For $`h\in D`$, the polynomial $`(PL^k/|h|)t^k+\mathop{\mathrm{sgn}}(h)=(n+h)/|h|`$ is irreducible by applying Eisenstein at $`P`$ to its reciprocal, and the product at zero is $`\pm1`$, so there is no fixed prime divisor. Hypothesis H makes every such value prime for infinitely many $`t`$. Their orders of magnitude are $`n`$, hence none of the $`n+h`$ is smooth. For a finite nontrivial factor $`A`$, take $`D=(A-A)\setminus\{0\}`$. This contradicts eventual equality with $`A+B`$, where every element has a companion at one of these shifts.

## Scope and antecedents

[Sárközy and coauthors, Part I, Conjecture A](https://arxiv.org/pdf/2006.15307#page=3) states the fixed-exponent question. [Elsholtz–Harper](https://arxiv.org/abs/1309.0593) already imply finite summands are impossible for sufficiently small fixed exponents; they handle the separate ternary conjecture in their range. Part I’s Theorem 1.1 treats much smaller increasing cutoffs eventually below $`2^{-32}\log n`$. [Part II](https://arxiv.org/abs/2011.13008) treats near-linear cutoffs. Teräväinen supplies the binary weighted estimate and the slow-window transfer technique. The new result is the uniform fixed-gap exclusion for all fixed exponents, not an unconditional arbitrary finite- or infinite-factor exclusion. The exact priority searches performed did not locate this fixed-gap statement earlier.
