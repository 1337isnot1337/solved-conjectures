# Erdős 25: a counterexample to the finite zeta comparison

21 November 2026. This note disproves the sufficient finite comparison proposed in the [earlier route note](finite-zeta-route.md). It also disproves its stronger capacity version. It does **not** disprove Erdős 25: each counterexample here is a finite periodic system and therefore has a natural density. The full paid logarithmic-density problem remains unresolved.

The counterexamples use one residue per distinct modulus and preserve the exact activation rule. The proof is a symbolic construction with a classical asymptotic argument, not a numerical search. No novelty claim is made beyond recording the failure of the proposed auxiliary inequalities.

## 1. The statement that fails

For normalized classes $`0\le a_i\lt q_i`$ with distinct positive moduli, let

```math
B=\bigcup_i\{a_i+kq_i:k\ge1\},
\qquad
\mu=d\!\left(\bigcup_i(a_i+q_i\mathbb Z)\right).
```

The proposed finite bound was

```math
\frac1{\zeta(s)}\sum_{n\in B}n^{-s}\le\mu
\qquad(s>1).                                             \tag{1}
```

**Theorem.** There are finite singleton systems with distinct moduli for which (1) fails. More precisely, the family constructed below fails (1) for every $`s>1`$ sufficiently close to one once its prime cutoff is sufficiently large.

This falsifies the hypothesis in the earlier conditional proof of Erdős 25. The conditional limiting argument itself is unaffected; its sufficient finite hypothesis is false.

## 2. A finite system defined by prime products

Let $`P`$ be a finite set of primes congruent to $`5\pmod6`$. Use the classes

```math
(2,0),\qquad(3,2),\qquad(pp',0)
\quad(p,p'\in P,\ p\le p').                              \tag{2}
```

Products with $`p=p'`$ are included. Unique factorization makes all the product moduli distinct, and all exceed $`3`$. Thus (2) uses one residue per distinct modulus.

All congruences are jointly compatible. For example, the integer $`2\prod_{p\in P}p^2`$ satisfies them all. Pairwise coprimality of the moduli is neither asserted nor needed.

Write

```math
\Omega_P(n)=\sum_{p\in P}v_p(n).
```

Avoiding every product modulus in (2) is equivalent to $`\Omega_P(n)\le1`$. The square moduli exclude repeated occurrences of one prime; the mixed products exclude occurrences of two different primes.

The activated class modulo $`3`$ omits its first positive representative $`2`$, but $`2`$ is already in the even class. Every other class has residue zero. Consequently the activated union $`B_P`$ is exactly its completed positive periodic union. Its complement is

```math
A_P=\{n\ge1:n\text{ is odd},\ n\not\equiv2\pmod3,\
\Omega_P(n)\le1\}.                                       \tag{3}
```

Define, for $`s\ge1`$,

```math
W_s=\sum_{p\in P}p^{-s},
\qquad
V_s^-=\prod_{p\in P}(1-p^{-s}),
\qquad
V_s^+=\prod_{p\in P}(1+p^{-s}).                           \tag{4}
```

The natural density of (3), computed by finite CRT independence, is

```math
\delta_P=d(A_P)=\frac13V_1^-(1+W_1),
\qquad
\mu_P=d(B_P)=1-\delta_P.                                 \tag{5}
```

Indeed, oddness and the two allowed residues modulo $`3`$ contribute $`(1/2)(2/3)=1/3`$. At the primes in $`P`$, the probability of no occurrence is $`V_1^-`$, and the probability of exactly one occurrence is $`V_1^-W_1`$.

## 3. Exact Dirichlet formulas

Let $`\chi`$ be the real nonprincipal character modulo $`3`$:

```math
\chi(n)=
\begin{cases}
0,&3\mid n,\\
1,&n\equiv1\pmod3,\\
-1,&n\equiv2\pmod3.
\end{cases}
```

For $`s>1`$, write $`L(s)=L(s,\chi)`$. The convergent alternating series over integers coprime to $`3`$ gives $`0\lt L(s)<1`$. At one,

```math
L_1:=L(1)
=\sum_{k\ge0}\left(\frac1{3k+1}-\frac1{3k+2}\right)
=\int_0^1\frac{dx}{1+x+x^2}
=\frac{\pi}{3\sqrt3}>0.                                 \tag{6}
```

Let

```math
S_P(s)=\sum_{\substack{n\ge1,\ n\text{ odd}\\
\Omega_P(n)\le1}}n^{-s},
\qquad
K_P(s)=\sum_{\substack{n\ge1,\ n\text{ odd}\\
\Omega_P(n)\le1}}\chi(n)n^{-s}.
```

Every permitted integer has either no prime factor in $`P`$, or exactly one such prime to the first power. Absolute convergence and the Euler products therefore give

```math
S_P(s)=(1-2^{-s})\zeta(s)V_s^-(1+W_s),                    \tag{7}
```

```math
K_P(s)=(1+2^{-s})L(s)V_s^+(1-W_s).                       \tag{8}
```

The minus sign in (8) uses $`\chi(p)=-1`$ for every $`p\in P`$.

Within the sum defining $`S_P`$, the mass divisible by $`3`$ is $`3^{-s}S_P`$. Multiplication by $`3`$ preserves oddness and $`\Omega_P`$. The remaining two residue classes have total mass $`(1-3^{-s})S_P`$ and difference $`K_P`$. Hence the normalized Dirichlet mass of the retained set (3) is exactly

```math
\begin{aligned}
R_P(s)
&:=\frac1{\zeta(s)}\sum_{n\in A_P}n^{-s}\\
&=\frac{(1+3^{-s})S_P(s)+K_P(s)}{2\zeta(s)}\\
&=\frac12(1+3^{-s})(1-2^{-s})V_s^-(1+W_s)\\
&\quad+\frac12(1-W_s)(1+2^{-s})
\frac{L(s)}{\zeta(s)}V_s^+.
\end{aligned}                                           \tag{9}
```

For each fixed finite $`P`$, this expression extends differentiably through $`s=1`$. In particular,

```math
R_P(1)=\delta_P,                                         \tag{10}
```

because $`1/\zeta(s)=(s-1)+O((s-1)^2)`$. The original proposed inequality (1) is equivalent, for this family, to $`R_P(s)\ge\delta_P`$.

## 4. The stronger capacity comparison already fails

Let $`Z_P`$ be the union of positive multiples of the moduli in (2). Because all congruences are compatible, inclusion-exclusion gives

```math
\sum_{n\in Z_P}n^{-s}=\zeta(s)\mu_s,
```

where $`\mu_s`$ is the LCM capacity defined in the [intersection note](intersection-loss-allocation.md).

The difference between the indicators of $`Z_P`$ and $`B_P`$ is $`+1`$ on the odd numbers divisible by $`3`$, $`-1`$ on the odd numbers congruent to $`2\pmod3`$, and zero elsewhere, in each case restricted to $`\Omega_P\le1`$. Thus

```math
\zeta(s)\mu_s-\sum_{n\in B_P}n^{-s}
=\frac{K_P(s)-(1-3^{1-s})S_P(s)}2.                       \tag{11}
```

If $`W_s\ge1`$, equation (8) gives $`K_P(s)\le0`$. Since $`s>1`$, the second term in (11) is strictly negative. Therefore

```math
\sum_{n\in B_P}n^{-s}>\zeta(s)\mu_s.                     \tag{12}
```

Finite choices with $`W_s\ge1`$ exist: the reciprocal sum of primes $`5\pmod6`$ diverges, so choose finite $`P`$ with $`W_1>1`$ and then take $`s>1`$ sufficiently close to one. The next sections prove the stronger conclusion that even the larger Haar bound $`\zeta(s)\mu_P`$ can fail.

## 5. Classical inputs and the required product constant

Take

```math
P_Y=\{p\le Y:p\text{ prime},\ p\equiv5\pmod6\}.
```

In this section, $`W=W_1`$ and $`V^\pm=V_1^\pm`$ are formed from $`P_Y`$. Also put

```math
T_Y=\sum_{p\in P_Y}\frac{\log p}{p},
\qquad
E_Y=\sum_{p\in P_Y}\frac{\log p}{p(p-1)},
\qquad
J_Y=\frac{V^+}{V^-}.                                    \tag{13}
```

Mertens' theorem for a fixed arithmetic progression gives

```math
T_Y=\frac12\log Y+O(1),
\qquad
W=\frac12\log\log Y+O(1).                               \tag{14}
```

A primary exposition with these exact weighted statements is Sheng-Chi Liu's *Lecture Notes in Analytic Number Theory*, notes by Jakob Streipel, [Theorem 12.1.1(ii)–(iii), printed p. 29](https://bpb-us-w2.wpmucdn.com/faculty.umaine.edu/dist/1/19/files/2022/08/analyticnumbertheory.pdf#page=33); Lectures 14–15 give the proof. Also $`E_Y=O(1)`$ by convergence of $`\sum_{n\ge2}(\log n)/(n(n-1))`$.

For clarity, the constant in $`J_Y`$ can be obtained without assuming an unsourced Euler product identity at the boundary. Applying the same weighted Mertens statement to the two nonzero residues modulo $`3`$ gives

```math
\sum_{p\le x}\frac{\chi(p)\log p}{p}=O(1).
```

Partial summation then proves convergence of $`\sum_p\chi(p)/p`$. The difference between this series and the logarithm of the prime-ordered Euler product is absolutely convergent. Abelian passage from $`s>1`$, where the Euler product is absolutely convergent, identifies its limit as $`L_1`$. Consequently

```math
L_Y:=\prod_{p\le Y}\left(1-\frac{\chi(p)}p\right)^{-1}
\longrightarrow L_1.                                   \tag{15}
```

Let $`Z_Y=\prod_{p\le Y}(1-1/p)^{-1}`$. The ordinary Mertens product theorem gives $`Z_Y\sim e^\gamma\log Y`$; see [Tao, *Mertens' theorems*, Theorem 1, equation (3)](https://terrytao.wordpress.com/2013/12/11/mertens-theorems/). The same source's Proposition 2 gives the zeta pole used in (10).

For $`Y\ge3`$, the following finite-product identity is exact:

```math
\frac{Z_Y}{L_Y}=\frac92J_Y.                              \tag{16}
```

Primes $`1\pmod3`$ cancel from the ratio. The prime $`2`$ contributes $`3`$; the prime $`3`$ contributes $`3/2`$; the remaining primes $`2\pmod3`$ are exactly $`P_Y`$ and contribute $`J_Y`$. Equations (15)–(16) therefore give

```math
J_Y\sim \frac{2e^\gamma}{9L_1}\log Y.                    \tag{17}
```

These are classical inputs to the counterexample, not new claims about the distribution of primes.

## 6. The Haar comparison has the wrong derivative

Keep $`Y`$ finite while differentiating (9) at $`s=1`$. Write $`\delta_Y=\delta_{P_Y}`$ and

```math
c_0=\log2-\frac14\log3.
```

For the first product in (9), logarithmic differentiation gives

```math
c_0+\sum_{p\in P_Y}\frac{\log p}{p-1}
-\frac{T_Y}{1+W}
=c_0+E_Y+\frac{WT_Y}{1+W}.                              \tag{18}
```

Its value at one is $`\delta_Y`$. The second term in (9) vanishes at one, and its derivative there is

```math
\frac34(1-W)L_1V^+.
```

Dividing by $`\delta_Y=V^-(1+W)/3`$ gives the exact formula

```math
\frac{R_{P_Y}'(1)}{\delta_Y}
=c_0+E_Y+
\frac{WT_Y-\frac94L_1(W-1)J_Y}{1+W}.                    \tag{19}
```

Now let $`Y\to\infty`$ in (19), using (14) and (17). Since $`W\to\infty`$ and $`E_Y=O(1)`$,

```math
\frac{R_{P_Y}'(1)}{\delta_Y\log Y}
\longrightarrow \frac{1-e^\gamma}{2}<0.                 \tag{20}
```

The strict sign uses $`\gamma>0`$. For example, the integral comparison for harmonic numbers gives $`\gamma\ge1-\log2>0`$.

Thus every sufficiently large finite cutoff $`Y`$ has $`R_{P_Y}'(1)<0`$. Fix any one such cutoff. Differentiability, (10), and the negative derivative then give an $`\varepsilon_Y>0`$ such that

```math
R_{P_Y}(s)<\delta_Y
\qquad(1\lt s<1+\varepsilon_Y).
```

Taking complements proves

```math
\frac1{\zeta(s)}\sum_{n\in B_{P_Y}}n^{-s}
>\mu_{P_Y}
\qquad(1\lt s<1+\varepsilon_Y),                            \tag{21}
```

as claimed.

The order of the argument is explicit: derive (19) for each finite family; use $`Y\to\infty`$ only to guarantee a negative derivative for some finite families; then hold one such family fixed while taking $`s\downarrow1`$. No interchange of an infinite-family derivative and a limit is used.

## 7. This construction does not provide a persistent excess

The positive finite excess in (21) need not stay bounded away from zero when $`s\downarrow1`$ and the family changes. For this construction, it cannot do so, even if $`P`$ is any finite set of primes $`5\pmod6`$, rather than an initial segment.

**Proposition.** For $`0<\varepsilon=s-1\le e^{-2}`$, every such finite $`P`$ satisfies

```math
\left(
\frac1{\zeta(s)}\sum_{n\in B_P}n^{-s}-\mu_P
\right)_+
\le
\varepsilon+\sqrt{\varepsilon}
\left(1+\frac12\log\frac1\varepsilon\right).             \tag{22}
```

Here $`x_+=\max\{x,0\}`$. The right side tends to zero independently of $`P`$.

**Proof.** Put $`F_s=V_s^-(1+W_s)`$. The function

```math
\prod_i(1-x_i)\left(1+\sum_i x_i\right)
```

is nonincreasing in each $`x_i\in[0,1)`$, since its $`i`$th partial derivative is

```math
-\prod_j(1-x_j)\,
\frac{\sum_jx_j+x_i}{1-x_i}\le0.
```

Consequently $`F_s\ge F_1`$. Also $`F_1\le1`$, as is clear from its probability interpretation as the event of at most one total prime occurrence.

Let $`a(s)=\frac12(1+3^{-s})(1-2^{-s})`$. On $`s\ge1`$, $`|a'(s)|\le1`$, by direct differentiation, and $`a(1)=1/3`$. The first term of (9) is therefore at least

```math
a(s)F_s\ge a(s)F_1\ge\delta_P-\varepsilon.               \tag{23}
```

The factor $`L(s)/\zeta(s)`$ in the second term of (9) is positive. Since $`0\lt L(s)<1`$ and $`\zeta(s)\ge1/(s-1)`$, its possibly negative part has magnitude at most

```math
\frac34\varepsilon W_sV_s^+
\le\frac34\varepsilon W_1e^{W_1}.                       \tag{24}
```

If $`W_1\le K`$, equations (23)–(24) bound the positive excess $`(\delta_P-R_P(s))_+`$ by

```math
\varepsilon+\frac34\varepsilon K e^K.                   \tag{25}
```

If $`W_1>K`$, use nonnegativity of $`R_P(s)`$ and $`V_1^-\le e^{-W_1}`$ instead:

```math
(\delta_P-R_P(s))_+
\le\delta_P
\le\frac13(1+W_1)e^{-W_1}
\le\frac13(1+K)e^{-K}.                                  \tag{26}
```

Take $`K=\frac12\log(1/\varepsilon)\ge1`$. Both (25) and (26) are bounded by the right side of (22). $`\square`$

Equation (22) is specific to the prime-product family (2). It is not a uniform estimate over arbitrary singleton systems.

## 8. What is closed, and what remains open

The exact finite Haar comparison (1) is false, as is the stronger LCM-capacity comparison. The earlier [geometric-weight condition](geometric-weight-obstruction.md) was also false, by a different explicit family. These conclusions close those exact sufficient routes.

A uniform vanishing-error version over **all** finite singleton systems would still suffice for the earlier limiting argument. Equation (22) proves such a bound only for the family in this note. No corresponding result for arbitrary systems, and no infinite system without logarithmic density, has been obtained.

The actual Erdős 25 bounty remains unresolved. The finite comparison counterexample is an auxiliary mathematical result and adds no completed paid target.

