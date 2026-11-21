# A finite-prime tangent reduction for Erdős 50

This note records one global route toward the [full paid target](target-and-prior-audit.md). It proves a necessary condition and an exact reformulation, then identifies the missing estimate. It does not resolve the conjecture or claim novelty for these elementary probability arguments.

## 1. Probability model and notation

Let the variables $`B_p`$ be independent, with $`\Pr(B_p=1)=1/p`$, and put

```math
X=\prod_p q_p^{B_p},\qquad q_p=1-1/p.
```

The limiting totient-ratio distribution is $`f(t)=\Pr(X\le t)`$. This is the standard CRT and truncation model: finite prime divisibility patterns have the stated independent limiting probabilities, while

```math
\mathbb E\sum_{p>P}(-\log q_p)B_p
\le\sum_{p>P}\frac1{p(p-1)}\longrightarrow0.
```

Schoenberg's continuity theorem removes endpoint distinctions in the distribution function. The same representation and its elementary derivation already appear in the [public working report](https://www.erdosproblemaday.com/report/50).

For a finite prime set $`A`$, define

```math
Q_A=\prod_{p\in A}p,\qquad
R_A=\prod_{p\in A}(p-1),\qquad
t_A=R_A/Q_A.
```

Different finite prime sets give different values of $`t_A`$. After cancelling common primes in two putatively equal products, the largest prime in the symmetric difference divides a denominator on one side and cannot divide any numerator factor or denominator on the other. This contradicts equality. The argument is only for finite products; it does not give unique infinite expansions.

We use the established endpoint bound

```math
H(u):=\Pr(X>1-u)\ge\frac{c_0}{\log(1/u)}
\qquad(0\lt u\lt u_0),                                      \tag{1}
```

for fixed constants $`c_0,u_0>0`$. It follows by forbidding every selected prime up to $`\lceil2/u\rceil`$, applying Markov's inequality to the remaining logarithmic tail, and using Mertens's prime-product theorem. The stronger asymptotic $`H(u)\sim e^{-\gamma}/\log(1/u)`$ is old; see the primary local-distribution sources in the target audit.

## 2. A finite derivative forces every nearby cylinder to be negligible

**Proposition.** Suppose $`x\in(0,1)`$ and $`f'(x)=d`$ exists and is finite. For every fixed $`C>0`$,

```math
\lim_{h\downarrow0}
\sup_{\substack{A\text{ finite prime set}\\|t_A-x|\le Ch}}
\frac1{Q_Ah\log(1/h)}=0.                              \tag{2}
```

The supremum is zero if its indexing set is empty. Since $`f`$ is increasing, $`d\ge0`$. The claim holds whether $`d=0`$ or $`d>0`$.

**Proof.** Fix $`\eta>0`$. Conditional on $`B_p=1`$ for every $`p\in A`$, an event of probability $`1/Q_A`$, the product is

```math
X=t_A X_{A^c},\qquad
X_{A^c}=\prod_{p\notin A}q_p^{B_p}.
```

Under the natural coupling $`X_{A^c}\ge X`$. Therefore, for all sufficiently small $`h`$ and every $`A`$ in the supremum,

```math
f(t_A)-f(t_A-\eta h)
\ge\frac1{Q_A}H(\eta h/t_A)
\ge\frac{c_0}{Q_A\log(t_A/(\eta h))}.                 \tag{3}
```

No factor is incorrectly treated as an independent extra copy of the whole product here: the remaining-prime product stochastically dominates the whole product, which is all the inequality needs.

Differentiability at $`x`$ implies, uniformly for these $`A`$,

```math
f(t_A)-f(t_A-\eta h)=d\eta h+o(h).                    \tag{4}
```

Indeed, write $`f(x+v)=f(x)+dv+r(v)`$, where $`r(v)=o(|v|)`$, and use $`|v|\le(C+\eta)h`$ at both endpoints. Also $`t_A`$ stays in a fixed compact subinterval of $`(0,1)`$, so

```math
\frac{\log(t_A/(\eta h))}{\log(1/h)}\longrightarrow1
```

uniformly over the same sets. Equations (3)–(4) give a limsup in (2) at most $`d\eta/c_0`$. Letting $`\eta\downarrow0`$ proves (2). $`\square`$

Thus no individual arithmetic spike can retain positive mass in a putative finite Lebesgue tangent. Merely bounding that spike by $`O(h)`$ would be insufficient; the proposition gives $`o(h)`$ at the endpoint scale.

### An exact limitation at rational points

If $`x=a/b\in(0,1)`$ is rational and is not any finite totient ratio $`t_A`$, then (2) holds automatically, independently of differentiability. In fact,

```math
|t_A-a/b|=\frac{|bR_A-aQ_A|}{bQ_A}
\ge\frac1{bQ_A}.
```

Whenever $`|t_A-x|\le Ch`$, it follows that

```math
\frac1{Q_Ah\log(1/h)}\le\frac{bC}{\log(1/h)}
\longrightarrow0.                                   \tag{5}
```

For example, $`1/4`$ is not a finite totient ratio. If $`t_A=1/4`$, the largest prime in $`A`$ must divide 4, since it cannot cancel against any numerator factor. Hence $`A\subseteq\{2\}`$, giving only 1 or $`1/2`$, a contradiction. The necessary condition alone therefore says nothing about a possible positive finite derivative at $`1/4`$. This is a limitation of the attempted criterion, not a claim about that derivative.

## 3. An exact transfer to weighted finite products

Set, for $`0\lt h<1`$,

```math
P(h)=\lceil h^{-4}\rceil,\qquad
X_h=\prod_{p\le P(h)}q_p^{B_p},\qquad
F_h(t)=\Pr(X_h\le t).
```

The exponent 4 is only a convenient uniform truncation choice. It has no relation to a finite numerical verification.

Let $`Z_h=\sum_{p>P(h)}(-\log q_p)B_p`$. Since $`0\lt X\le X_h\le1`$,

```math
0\le X_h-X=X_h(1-e^{-Z_h})\le Z_h,
\qquad
\mathbb E Z_h\le\sum_{n>P(h)}\frac1{n(n-1)}
=\frac1{P(h)}\le h^4.
```

Consequently

```math
\Pr(X_h-X>h^2)\le h^2.                              \tag{6}
```

For every real $`t`$ this gives the two distribution inequalities

```math
f(t-h^2)-h^2\le F_h(t)\le f(t),\qquad
F_h(t)\le f(t)\le F_h(t+h^2)+h^2.                    \tag{7}
```

The probability error is $`o(h)`$, and the spatial error is also $`o(h)`$. A mere tail error tending to zero would not suffice for this tangent argument.

Write

```math
M(P)=\prod_{p\le P}(1-1/p).
```

The finite product distribution has the exact atom formula

```math
\Pr(X_h=t_A)=\frac{M(P(h))}{R_A}
\quad\text{for }A\subseteq\{p:p\le P(h)\}.            \tag{8}
```

**Proposition.** For $`x\in(0,1)`$ and a finite $`d\ge0`$, the following are equivalent:

1. $`f'(x)=d`$.
2. For every fixed real $`a\lt b`$,

```math
\frac{M(P(h))}{h}
\sum_{\substack{A\subseteq\{p:p\le P(h)\}\\
                 a<(t_A-x)/h\le b}}
\frac1{R_A}
\longrightarrow d(b-a)
\qquad(h\downarrow0).                               \tag{9}
```

**Proof.** If the derivative exists, its first-order expansion is uniform for $`t=x+zh`$ with $`z`$ in a fixed bounded interval. Thus (7) yields

```math
F_h(x+zh)=f(x)+dzh+o(h)
```

uniformly for bounded $`z`$. Taking differences and using (8) proves (9).

Conversely, fix $`a\lt b`$ and $`\varepsilon>0`$. For small enough $`h`$ we have $`h^2<\varepsilon h`$. By (7), monotonicity, and $`2h^2=o(h)`$, the $`f`$-mass of $`(x+ah,x+bh]`$ is bounded above by the $`F_h`$-mass of

```math
(x+(a-\varepsilon)h,\ x+(b+\varepsilon)h]
```

plus $`2h^2`$, and bounded below by the $`F_h`$-mass of

```math
(x+(a+\varepsilon)h,\ x+(b-\varepsilon)h]
```

minus $`2h^2`$, provided $`2\varepsilon\lt b-a`$. Apply (9), divide by $`h`$, and then let $`\varepsilon\downarrow0`$. This gives the corresponding mass limit for $`f`$. The choices $`(a,b)=(0,1)`$ and $`(-1,0)`$ prove the derivative assertion. $`\square`$

## 4. What the route has not proved

The desired conclusion is that (9) cannot hold for any $`x\in(0,1)`$ with $`d>0`$. Proposition (2) excludes a surviving single-cylinder atom. It does not exclude the sum of very many cylinders whose individual contributions are all $`o(h)`$.

The cutoff in (9) includes all prime patterns up to $`P(h)`$, with no unique nested representation of $`x`$ assumed. Discarding all but a nearest or heaviest product is unjustified. The known dense set of points with infinite upper Dini derivative and the known countable set of finite-product poles do not control the remaining points. The rational calculation (5) is a specific reason that the one-cylinder criterion cannot be the missing universal argument.

Toulmonde's existing uniform bound has a remainder of the form

```math
\exp\!\left(-c\sqrt{\log(1/h)\log\log(1/h)}\right),
```

which is much larger than $`h`$ as $`h\downarrow0`$. It cannot be divided by $`h`$ and silently dropped in (9). The possible positive tangent can lie entirely below that theorem's error scale.

No bound on the aggregate in (9) that excludes a positive flat limit has been established here. The full bounty remains unresolved.
