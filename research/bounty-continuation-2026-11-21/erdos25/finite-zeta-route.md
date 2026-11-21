# Erdős 25: a finite zeta comparison and its unresolved extension

21 November 2026. This note concerns the [full paid singleton-residue target](target-and-prior-audit.md). It proves a conditional passage to that target and checks the proposed finite inequality for at most two residue classes. The general finite inequality remains unproved. These statements do not add a completed bounty problem.

## 1. The proposed finite comparison

Let $`q_1<\cdots\lt q_m`$ be positive integers and choose $`0\le a_i\lt q_i`$. Put

```math
B_i=\{a_i+kq_i:k\ge1\},\qquad B=\bigcup_{i=1}^m B_i.
```

Let $`\mu`$ be the natural density of the completed periodic union $`\bigcup_i(a_i+q_i\mathbb Z)`$. The candidate inequality is

```math
\sum_{n\in B}\frac1{n^s}\le\mu\,\zeta(s)
\qquad(s>1).                                      \tag{1}
```

Equation (1) is a hypothesis to be proved or refuted for arbitrary finite singleton systems. It is not a consequence established in this note. The activation threshold is essential: the first allowed point is $`q_i+a_i`$, including $`q_i`$ when $`a_i=0`$.

The finite statement is stronger than the limiting assertion required by Erdős 25. In particular, failing (1) for one finite system would defeat this proposed route and would not by itself refute the infinite logarithmic-density conjecture.

## 2. Why the full finite comparison would solve the target

Suppose (1) holds for every finite singleton system. Now take an arbitrary infinite increasing sequence of moduli and its activated union $`B_\infty`$. Let $`B^{(m)}`$ be the first $`m`$ activated classes, and let $`\mu_m`$ be the corresponding periodic density. These densities increase to some $`\mu\in[0,1]`$.

For each fixed $`s>1`$, monotone convergence of nonnegative series and (1) give

```math
\frac1{\zeta(s)}\sum_{n\in B_\infty}n^{-s}
=\lim_{m\to\infty}\frac1{\zeta(s)}\sum_{n\in B^{(m)}}n^{-s}
\le\lim_m\mu_m=\mu.                              \tag{2}
```

Every fixed $`B^{(m)}`$ differs by a finite set from a periodic set of density $`\mu_m`$. Its normalized Dirichlet series tends to $`\mu_m`$ as $`s\downarrow1`$. For example, each residue modulo a period $`L`$ has series $`L^{-s}\zeta(s,r/L)`$ up to finitely many terms; multiplying by $`s-1`$ gives $`1/L`$. Since $`B^{(m)}\subseteq B_\infty`$, equation (2) yields

```math
\lim_{s\downarrow1}\frac1{\zeta(s)}
\sum_{n\in B_\infty}n^{-s}=\mu.                 \tag{3}
```

For completeness, the positive-measure Tauberian step can be justified directly. Define

```math
H(T)=\sum_{\substack{n\in B_\infty\\\log n\le T}}\frac1n,
\qquad \sigma_T=\frac1T\sum_{n\in B_\infty}\frac1n\,\delta_{(\log n)/T}.
```

Equation (3), with $`s=1+u/T`$, gives for every $`u>0`$

```math
\int_0^\infty e^{-ux}\,d\sigma_T(x)
=\frac1T\sum_{n\in B_\infty}n^{-1-u/T}
\longrightarrow\frac\mu u.                    \tag{4}
```

The case $`u=1`$ bounds the mass on each fixed compact interval. Every subsequence therefore has a vaguely convergent further subsequence of positive locally finite measures. For a fixed $`u>0`$, the tails of its Laplace integral are uniformly negligible because

```math
\int_R^\infty e^{-ux}\,d\sigma_T(x)
\le e^{-uR/2}\int_0^\infty e^{-ux/2}\,d\sigma_T(x).
```

Thus any subsequential limit has Laplace transform $`\mu/u`$. Uniqueness gives the measure $`\mu\,dx`$. One elementary uniqueness argument weights by $`e^{-x}`$ and maps $`x\mapsto e^{-x}`$: the resulting finite measures on $`[0,1]`$ have equal moments of every nonnegative integer order, and polynomial approximation determines them. No mass at the new endpoint zero is present, and their total masses are already fixed by the zeroth moment. Since $`[0,1]`$ has boundary of zero measure for $`\mu\,dx`$, it follows that

```math
\frac{H(T)}T=\sigma_T([0,1])\longrightarrow\mu.
```

Equivalently, $`B_\infty`$ has logarithmic density $`\mu`$. Its complement is the set in Erdős 25 and has logarithmic density $`1-\mu`$. This argument covers $`\mu=0`$ as well. The unresolved input is the general finite inequality (1), not an exchange of the two limits.

## 3. The zero-residue comparison

For a finite family of moduli, let $`Z`$ be their union of positive multiples. A random positive integer with probability mass $`n^{-s}/\zeta(s)`$ has independent prime valuations with

```math
\mathbb P(v_p\ge j)=p^{-sj}.
```

Only the finitely many primes dividing the moduli matter. Under uniform measure modulo their LCM, the same valuation thresholds have tails $`p^{-j}`$ and are independent between primes. For $`s>1`$, coordinatewise coupling makes every zeta valuation at most its uniform counterpart. The event of being divisible by some chosen modulus is increasing in these valuations. Therefore

```math
\frac1{\zeta(s)}\sum_{n\in Z}n^{-s}\le d(Z).    \tag{5}
```

This is the usual elementary multiplicative comparison underlying the zero-residue setting. No priority is claimed for it. It applies to any finite family, with no numerical bound on its size.

## 4. A complete check for two classes

For one class, termwise comparison gives

```math
\sum_{k\ge1}(kq+a)^{-s}\le q^{-s}\zeta(s)
\le q^{-1}\zeta(s).
```

Now take two classes with $`q_1\lt q_2`$. If their congruences are incompatible, the periodic density is $`1/q_1+1/q_2`$, and the two one-class bounds prove (1). Suppose they are compatible. Let $`L=\mathop{\mathrm{lcm}}(q_1,q_2)`$, and let $`c\in\{0,\ldots,L-1\}`$ be their common CRT residue.

For $`q\ge1`$ and $`b\ge0`$, define the convergent nonnegative loss

```math
D_q(b)=\sum_{k\ge1}\bigl((kq)^{-s}-(kq+b)^{-s}\bigr).
```

The two single-class series are $`q_i^{-s}\zeta(s)-D_{q_i}(a_i)`$. Their activated intersection consists of the common CRT class starting at its first point at least $`q_2`$.

If $`c\ge q_2`$, that first point is $`c\le L`$. Hence the intersection series is at least $`L^{-s}\zeta(s)`$. Inclusion-exclusion gives

```math
\sum_{n\in B_1\cup B_2}n^{-s}
\le\zeta(s)(q_1^{-s}+q_2^{-s}-L^{-s}).          \tag{6}
```

If $`c\lt q_2`$, then $`a_2=c`$, and the intersection starts at $`L+c`$. Its series is $`L^{-s}\zeta(s)-D_L(c)`$. For each $`k\ge1`$,

```math
(kq_2)^{-s}-(kq_2+c)^{-s}
=s\int_0^c(kq_2+t)^{-s-1}\,dt
\ge s\int_0^c(kL+t)^{-s-1}\,dt.
```

Thus $`D_{q_2}(c)\ge D_L(c)`$. The loss from the second single class pays for the entire intersection loss, and (6) follows again. This includes $`c=0`$ and the case $`L=q_2`$.

The right side of (6) is the Dirichlet series of the union of multiples of $`q_1,q_2`$. Its periodic density is $`1/q_1+1/q_2-1/L`$, which is also the density of the two compatible shifted classes. Equation (5) now proves (1) for two classes for every real $`s>1`$.

## 5. What is missing

For three or more classes, intersection corrections have alternating signs and reuse the losses of individual classes. The two-class payment cannot simply be applied once to every pair: it may spend the same loss repeatedly, and higher intersections need separate accounting. No valid general loss allocation has been obtained.

The published [Chojecki reduction](https://www.ulam.ai/research/erdos25.pdf), Sections 4–7, already shows why an estimate on each first-kill set can have large transient error. Our proposed inequality concerns the whole finite union and would have to pay those errors globally. The [team's construction obstruction](capacity-and-footprint-obstructions.md) leaves that positive route explicitly open. The prime-coordinate compression and all-membership coupling attempts have their own obstructions, documented separately; they do not refute (1).

No finite numerical success is used in the two-class proof or in the conditional limiting argument. Neither argument proves (1) for arbitrarily many classes. The full bounty remains unresolved.
