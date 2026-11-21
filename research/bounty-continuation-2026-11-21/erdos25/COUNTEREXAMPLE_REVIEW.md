# Independent review: failure of the finite Haar-zeta comparison

21 November 2026. Reviewed [finite-zeta-counterexample.md](finite-zeta-counterexample.md), SHA256 `328bf04b0bdf579aab3c0f079e9728b393330c10b5e09168d8319946ddcd2595`.

The two finite counterexample claims and the uniform vanishing-excess bound in Section 7 pass this independent review. No correction is requested. The finite Haar-zeta inequality proposed earlier is false. This does not resolve Erdős 25, whose full assertion concerns one infinite system and existence of logarithmic density.

## 1. Moduli, compatibility, and activation

For a finite prime set $`P\subseteq\{p:p\equiv5\pmod6\}`$, the moduli $`pp'`$ with unordered pairs and repetitions are distinct by unique factorization and exceed three. Including squares is necessary: avoiding all product moduli is exactly $`\Omega_P(n)\le1`$, with prime multiplicity counted.

The integer $`2\prod_{p\in P}p^2`$ verifies joint congruence compatibility, including the residue two modulo three. The activated union coincides with its completed positive union: the only omitted positive initial representative is two for the class modulo three, and the even class already contains it. Thus the stated complement is exact even at small integers.

Finite CRT gives its density $`\delta_P=V_1^-(1+W_1)/3`$. At a prime $`p\in P`$, zero occurrences have probability $`1-1/p`$, and exactly one has probability $`(1-1/p)/p`$. This confirms both the density and the use of multiplicities.

## 2. Dirichlet formulas and the stronger counterexample

Let $`\chi`$ be the nonprincipal real character modulo three. Decomposing a surviving odd integer into its part with no primes in $`P`$ and either no selected prime or one selected prime gives independently

```math
S_P=(1-2^{-s})\zeta(s)V_s^-(1+W_s),\qquad
K_P=(1+2^{-s})L(s,\chi)V_s^+(1-W_s).
```

Multiplication by three preserves oddness and the selected-prime multiplicity. The positive mass at residue three modulo six is therefore $`3^{-s}S_P`$. The mass at residue five modulo six is $`((1-3^{-s})S_P-K_P)/2`$. This verifies both the normalized complement formula and the stronger-capacity deficit

```math
\Phi_s=\frac{K_P-(1-3^{1-s})S_P}{2}.
```

When $`W_s\ge1`$, the character sum $`K_P`$ is nonpositive and the second term is strictly negative. The reciprocal-prime divergence and continuity for a fixed finite set produce the required finite choice. Absolute convergence for $`s>1`$ justifies all rearrangements. The stronger inequality is consequently false.

## 3. Primary analytic inputs

I independently opened Sheng-Chi Liu's [*Lecture Notes in Analytic Number Theory*, notes by Jakob Streipel](https://bpb-us-w2.wpmucdn.com/faculty.umaine.edu/dist/1/19/files/2022/08/analyticnumbertheory.pdf), Theorem 12.1.1(ii)–(iii), printed p. 29, and its proof in Lectures 14–15, printed pp. 35–36. These give the two required weighted Mertens estimates at fixed modulus six. I also opened [Tao's *Mertens' theorems*](https://terrytao.wordpress.com/2013/12/11/mertens-theorems/), Theorem 1 and Proposition 2, for the ordinary product constant and zeta pole.

The source's passage to the prime-ordered product for $`L(1,\chi)`$ is justified. The difference of the two weighted progression estimates bounds $`\sum_{p\le x}\chi(p)\log p/p`$. Partial summation then makes $`\sum_p\chi(p)/p`$ converge. The higher Euler-log terms converge absolutely; taking the Abelian limit from $`s>1`$ identifies the product limit with $`L_1`$. There is no unsourced absolute convergence assertion at one. The integral evaluation $`L_1=\pi/(3\sqrt3)`$ also checks directly.

## 4. The derivative and its constant

For fixed finite cutoff $`Y`$, put $`W=W_1`$, $`T=\sum_{p\in P_Y}(\log p)/p`$, $`E=\sum_{p\in P_Y}(\log p)/(p(p-1))`$, and $`J=V_1^+/V_1^-`$. I rederived the first-product logarithmic derivative as

```math
\log2-\frac14\log3+E+\frac{WT}{1+W}.
```

The character term vanishes at one and has derivative $`(3/4)(1-W)L_1V_1^+`$. Division by $`\delta_P=V_1^-(1+W)/3`$ therefore gives exactly the source's factor $`9/4`$ and its sign.

The finite Euler-product ratio is $`Z_Y/L_Y=(9/2)J`$: two contributes three, three contributes $`3/2`$, primes congruent to one modulo three cancel, and the remaining primes are exactly $`P_Y`$. Hence

```math
J\sim\frac{2e^\gamma}{9L_1}\log Y,
\qquad
\frac{R_{P_Y}'(1)}{\delta_P\log Y}
\longrightarrow\frac{1-e^\gamma}{2}<0.
```

All constants therefore agree. The sign selects sufficiently large **finite** cutoffs. Differentiability is then applied with that cutoff fixed, producing a nonempty right neighborhood of one in which the normalized union mass exceeds Haar density. No derivative of an infinite-family limit is taken.

## 5. The uniform vanishing-excess estimate

The Section 7 addition also checks. For $`F_s=V_s^-(1+W_s)`$, the displayed partial derivative of $`\prod_i(1-x_i)(1+\sum_i x_i)`$ is nonpositive. Since $`p^{-s}\le p^{-1}`$, this gives $`F_s\ge F_1`$. The same expression is the probability of at most one total occurrence, so $`F_1\le1`$.

For $`a(s)=(1+3^{-s})(1-2^{-s})/2`$, one has $`a(1)=1/3`$, $`a(s)>0`$, and $`|a'(s)|\le1`$ on $`s\ge1`$. Thus the first complement term is at least $`\delta_P-\varepsilon`$, where $`\varepsilon=s-1`$.

The possible negative character term has magnitude at most $`(3/4)\varepsilon W_1e^{W_1}`$. This uses $`0\lt L(s)<1`$, $`\zeta(s)\ge1/\varepsilon`$, $`W_s\le W_1`$, and $`V_s^+\le e^{W_s}`$. When $`W_1>K`$, nonnegativity of the complement mass instead bounds the excess by $`\delta_P\le(1+K)e^{-K}/3`$. Choosing $`K=\tfrac12\log(1/\varepsilon)`$ proves the stated uniform upper bound. The argument permits every finite $`P`$ in the specified residue class, not just prime initial segments.

The estimate is specific to this construction. It prevents inferring a persistent logarithmic-density gap from its finite strict violations. The general vanishing-error inequality for arbitrary singleton systems remains unproved; neither an infinite counterexample nor a proof of Erdős 25 is supplied. No completed paid target is added by this review.
