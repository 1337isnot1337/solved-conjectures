# Primitive sets with density at prescribed dyadic scales

**Theorem.** Let $E$ be an infinite set of positive integers. Suppose there are $K<\infty$ and $0<\sigma<1$ such that for every real $u\ge0$ and $H\ge1$,

```math
|E\cap[u,u+H]|\le K H^\sigma.
```

There is a primitive set $A$ and a constant $c_E>0$ such that $A(2^n)\ge c_E2^n$ for every $n\in E$. In particular one may prescribe $n_i=\lfloor i^\alpha\rfloor$ for **every** real $\alpha>1$. For these exponents the inverse function $t^{1/\alpha}$ is concave, giving at most $1+(H+1)^{1/\alpha}$ indices in any interval of length $H$. At $\alpha=1$ the necessary reciprocal sum diverges.

The theorem applies to irregular sets with the displayed uniform count. The unrestricted characterization is [Erdős’s question, p. 101](https://www.renyi.hu/~p_erdos/1980-03.pdf). The prime-factor regularity idea and the observation that quotients between regular integers are exceptional go back to [Erdős, Sárközy and Szemerédi, pp. 40–41](https://combinatorica.hu/~p_erdos/1970-09.pdf). We need a bound uniform in **both** the earlier block and the distance to the later block.

## Counts of small prime factors

Let $\Omega(t;w)=\sum_{p\le w} v_p(t)$ count prime factors with multiplicity. Write $L(w)=\log\log w$ for $w\ge3$. For fixed $z\in(0,2)$ and real $3\le w\le X$,

```math
\frac1X\sum_{t\le X} z^{\Omega(t;w)}\ll_z (\log w)^{z-1}. \tag{1}
```

For $1<z<2$, write the summand as $\sum_{d\mid t}g(d)$ with $g$ multiplicative and $g(p^k)=(z-1)z^{k-1}$ for $p\le w$, zero at all other prime powers with $k\ge1$. Summing over $t$ and using $\lfloor X/d\rfloor\le X/d$ bounds the average by $\prod_{p\le w}(1+(z-1)/(p-z))\ll_z(\log w)^{z-1}$ by Mertens’ prime reciprocal estimate.

For $0<z<1$, put $f(t)=z^{\Omega(t;w)}$. It is completely multiplicative and lies in $(0,1]$. Chebyshev’s bound $\sum_{p^k\le v}\log p\ll v$ gives

```math
\sum_{t\le X} f(t)\log t
=\sum_{b\le X} f(b)\sum_{p^k\le X/b}f(p)^k\log p
\ll X\sum_{b\le X}\frac{f(b)}b.
```

Also $\sum_{t\le X} f(t)\log(X/t)\ll X$, by comparison with the integral of $\log(X/t)$. Adding and bounding the last harmonic sum by $\prod_{p\le X}(1-f(p)/p)^{-1}\ll_z \log X\,(\log w)^{z-1}$ proves (1). At $z=1$ the bound follows by counting.

For each $0<\epsilon<1$ there is $D=D(\epsilon)$ for which, uniformly for $X\ge3$, at most $X/32$ integers $t\le X$ violate either inequality

```math
(1-\epsilon)L(w)-D\le\Omega(t;w)\le(1+\epsilon)L(w)+D
\qquad(3\le w\le t). \tag{2}
```

Here are details of the simultaneous estimate. Take fixed $z_+>1$ and $z_-<1$ sufficiently close to one that $z_\pm-1-(1\pm\epsilon)\log z_\pm<0$. Markov’s inequality and (1) at one fixed cutoff bound the fraction violating (2), with tolerance $D_0$, by $C e^{-\kappa L(w)}(z_+^{-D_0}+z_-^{D_0})$ for some $C,\kappa>0$. Test the cutoffs $3$, $X$, and $\exp(\exp k)\in[3,X]$ for integers $k\ge1$. The total of the exponential factors is bounded independently of $X$. Choose $D_0$ to make the fraction at most $1/32$. Monotonicity of $\Omega(t;w)$ between adjacent cutoffs, whose $L$ values differ by at most one, now gives (2) with $D=D_0+2$. Call integers satisfying (2) regular.

## Divisibility between two blocks

Fix any $\sigma<\beta<1$. Choose $0<z<1$ and then $\epsilon>0$ so that $1-z-2\epsilon\log(1/z)>\beta$. Use the same $\epsilon,D$ in all blocks. If $m<n$, put $s=\min(m,n-m)$. For $s\ge4$ the number of pairs of regular integers

```math
2^{m-1}<b\le2^m,\qquad 2^{n-1}<a\le2^n,\qquad b\mid a
```

is $\ll_{\beta} 2^n s^{-\beta}$, taking $z,\epsilon$ as fixed functions of $\beta$. Indeed $w=2^{s/2}$ is at most $b$ and $a$. Both estimates (2) applied at $w$ imply for $q=a/b$ that $\Omega(q;w)\le2\epsilon L(w)+2D$. Since $q\le Q=2^{n-m+1}$ and $w\le Q$, (1) shows that the number of choices of $q$ is at most

```math
z^{-2D} (\log w)^{2\epsilon\log(1/z)}
\sum_{q\le Q} z^{\Omega(q;w)}\ll_{\beta} Q s^{-\beta}.
```

Multiplying by the number of possible $b$, at most $2^m$, proves the bound. Its dependence on $n-m$ controls the case of two large exponents relatively close together.

## Construction

Choose a large integer $T\ge4$. Starting with the least member of $E$ at least $T$, form $F\subseteq E$ greedily by choosing each subsequent least member at distance at least $T$ from the last chosen one. For every $n\in F$ we have, uniformly,

```math
\sum_{m\in F,\ m<n}\min(m,n-m)^{-\beta}
\le\sum_{m\in F,\ m<n}\bigl(m^{-\beta}+(n-m)^{-\beta}\bigr)
\ll_{K,\sigma,\beta} T^{\sigma-\beta}. \tag{3}
```

All distances on the right are at least $T$. In a distance range $[2^kT,2^{k+1}T)$ each sum has at most $K(2^kT)^\sigma$ terms by the hypothesis on translated intervals (truncate at zero if necessary). Summing the resulting geometric series proves (3).

For $n\in F$, start with all regular odd integers in $(2^{n-1},2^n]$. There are at least $(1/4-1/32)2^n$. Discard an integer if it has a divisor among the regular odd candidates of any earlier chosen block. The pair estimate and (3) discard at most $C 2^n T^{\sigma-\beta}$ integers, even when counting a discarded integer repeatedly. Choose $T$ large enough to leave at least $2^n/8$ per block.

Let $A$ be the union of the retained blocks and $\{2\}$. Each dyadic block is primitive internally. The deletions prevent divisibility between blocks, and every retained element is odd and greater than two. Every exponent $e\in E$ at or after the first chosen exponent has some $n\in F$ with $n\le e<n+T$. Hence $A(2^e)\ge2^n/8\ge2^{-T}2^e/8$. The finitely many earlier exponents have $A(2^e)\ge1$, which supplies the required positive constant for all of $E$.
