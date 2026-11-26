# Large independent sets obstruct half-plane stability in random graphs

## Statements

Let $`G_n\sim G(n,p)`$ be the random **labelled** simple graph with independent edges of fixed probability $`0\lt p<1`$, put $q=1-p$, and write $`I_n(z)=\sum_j X_j z^j`$, where $`X_j`$ is the number of independent $j$-sets. Write $`H_n`$ for the event that $`I_n`$ has a zero with **strictly positive** real part and $`L_n`$ for the event that its coefficient sequence fails log-concavity. Then

```math
\limsup_{n\to\infty}\mathop{\mathrm{Pr}}(H_n)\ \ge 1-e^{-q^2},\qquad
\limsup_{n\to\infty}\mathop{\mathrm{Pr}}(L_n)\ \ge 1-e^{-q}.
```

In particular the answer to Brown and Cameron, *On the Stability of Independence Polynomials*, Electronic J. Combin. 25(1) (2018), P1.46, §5, **Problem 2** ([DOI 10.37236/7280](https://doi.org/10.37236/7280), [arXiv:1802.02478](https://arxiv.org/abs/1802.02478)), is **no for every fixed edge density** in their question. Their definition of stable includes the imaginary axis. For $p=1/2$ the two lower bounds are approximately 0.221199 and 0.393469.

This also disproves their **Conjecture 3.2** in the verified preprint [arXiv:1709.08236v1](https://arxiv.org/abs/1709.08236v1), *On the Unimodality of Independence Polynomials of Very Well-Covered Graphs*. The conjecture concerns ordinary graphs, despite the title: for almost every graph all independence roots should be in the sector of half-angle $`\pi/3`$ about the **negative** real axis, and hence its coefficients should be log-concave. The conjecture is also recorded as Conjecture 6.1.1 of [Ben Cameron's thesis](https://hdl.handle.net/10222/75412). A right-half-plane root is outside that sector. Even the stated log-concavity consequence fails with positive limiting upper probability. Neither result asserts that the failure probabilities have limits or that typical coefficient sequences fail to be unimodal.

## 1. Deterministic root obstruction

Suppose $P$ is real of degree $`k\ge3`$ and leading coefficient $`a_k>0`$. If every zero of $P$ has real part $`\le0`$, then

```math
a_{k-1}a_{k-2}\ \ge\ a_k a_{k-3}. \tag{1}
```

Indeed $`z^kP(1/z)/a_k`$ factors over the reals into factors $1+uz+vz^2$, $`u,v\ge0`$. Each real root $`r\le0`$ gives $(u,v)=(-r,0)$; conjugate roots $`r,\bar r`$ give $`(-2\Re r,|r|^2)`$. This includes roots on the boundary and repeated roots. The coefficient $`c_3`$ of the product is $`\sum_{i\ne j}u_iv_j+\sum_{i\lt j<\ell}u_iu_ju_\ell`$. Every summand is present, with at least the same multiplicity, in $`c_1c_2=(\sum u_i)(\sum v_i+\sum_{i\lt j}u_i u_j)`$. Multiply by $`a_k^2`$ to obtain (1). This is the second Hurwitz minor, but no stability criterion is needed beyond the displayed factorization.

## 2. Tune the graph order to the threshold

Put $`\mu_h(n)=\mathbb E X_h=\binom nh q^{\binom h2}`$. Fix **any** $`\lambda>0`$. For each integer $`k\to\infty`$, let $`n=n_k`$ be the least $`n\ge k`$ such that $`\mu_k(n)\ge\lambda`$. Such an $n$ exists. From $`(n/k)^k\le\binom nk\le(en/k)^k`$ (the lower bound follows by multiplying $`(n-i)/(k-i)\ge n/k`$),

```math
n=\Theta\big(kq^{-(k-1)/2}\big).\tag{2}
```

For the upper bound, for example, take the ceiling of $`k\lambda^{1/k}q^{-(k-1)/2}`$, eventually at least $k$. The lower bound uses $`\mu_k(n)\ge\lambda`$. Thus $`k/n\to0`$. Minimality and $`\mu_k(n)/\mu_k(n-1)=n/(n-k)\to1`$ give $`\mu_k(n)\to\lambda`$. All means below are at this same $n$.

Let $`R=\mu_{k-1}/\mu_k=k q^{-(k-1)}/(n-k+1)`$. By (2), $`R\to\infty`$. For each fixed $`t\ge0`$,

```math
\frac{\mu_{k-t-1}}{\mu_{k-t}}=R q^t\frac{k-t}{k}\frac{n-k+1}{n-k+t+1}=(1+o(1))Rq^t.
```

Consequently, for fixed $`j\ge1`$, $`\mu_{k-j}=(1+o(1))\mu_k R^j q^{\binom j2}\to\infty`$. Also $`\mu_{k+1}/\mu_k=(n-k)q^k/(k+1)\to0`$ by (2). In particular

```math
\frac{\mu_{k-1}\mu_{k-2}}{\mu_{k-3}}\to\frac{\lambda}{q^2},\qquad
\frac{\mu_{k-1}^2}{\mu_{k-2}}\to\frac{\lambda}{q}.\tag{3}
```

## 3. Fluctuations: the top count need not concentrate

We give details rather than assume a clique-count theorem at a moving threshold. For $h=k-j$, $`0\le j\le3`$, and independent uniform $h$-sets $S,T$ on $[n]$, define

```math
B_i=\frac{\binom hi\binom{n-h}{h-i}}{\binom nh}\,q^{-\binom i2}.
```

The joint probability that specified $S,T$ are independent is $`q^{2\binom h2-\binom{|S\cap T|}2}`$, so $`\mathbb E X_h^2/\mu_h^2=\sum_{i=0}^h B_i`$. We claim that $`\sum_{2\le i\lt h}B_i=o(1)`$, **excluding** the diagonal $i=h$.

For $`2\le i\le h/2`$, a union bound over $i$-subsets of $S$ gives $`\mathop{\mathrm{Pr}}(|S\cap T|=i)\le\binom hi(h/n)^i`$ (a specified $i$-subset lies in $T$ with probability $`(h)_i/(n)_i\le(h/n)^i`$). Thus $`B_i\le[(h^2/n)q^{-h/4}]^i`$. Its base tends to zero by (2).

For $`i=h-t>h/2`$ with $`t\ge1`$, rewrite exactly

```math
B_{h-t}=\mu_h^{-1}\binom ht\binom{n-h}t q^{th-t(t+1)/2}
\le \mu_h^{-1}[hnq^{3h/4-1/2}]^t.
```

Here $`\mu_h`$ stays bounded away from zero, the base tends to zero by (2), and $`q<1`$ gives the indicated direction. Summing the two geometric bounds proves the claim. Since $`B_h=1/\mu_h`$ and $`B_0+B_1\le1`$, we have $`\mathop{\mathrm{Var}}(X_h)/\mu_h^2\le1/\mu_h+o(1)`$. For $h=k-1,k-2,k-3$, Chebyshev implies $`X_h/\mu_h\to1`$ in probability, jointly by a union bound. By contrast the diagonal term at $h=k$ must not be dropped.

We next prove $`\mathop{\mathrm{Pr}}(X_k>0)\to1-e^{-\lambda}`$. Let $`E_1,\ldots,E_M`$ be the independence events for the $`M=\binom nk`$ possible $k$-sets, each of probability $`s=q^{\binom k2}`$. In an arbitrary ordering call prior indices $`j\lt i`$ neighbors if the underlying sets share at least two vertices. $`E_i`$ is independent of the **whole collection** of its prior nonneighbors: their edge variables together are disjoint from its internal edge variables. Write $A$ for avoidance of all prior events, $A'$ for avoidance only of prior nonneighbors. Since $`A'\setminus A\subseteq\bigcup_{j\sim i,j\lt i} E_j`$ and $`\mathop{\mathrm{Pr}}(E_i\cap A')=s\mathop{\mathrm{Pr}}(A')`$,

```math
|\mathop{\mathrm{Pr}}(E_i\cap A)-s\mathop{\mathrm{Pr}}(A)|\le\sum_{j\sim i,j\lt i}\big(\mathop{\mathrm{Pr}}(E_i\cap E_j)+s^2\big).
```

The avoidance recursion now differs from multiplication by $1-s$ by at most this error at step $i$. Starting at 1, telescoping gives a total absolute error at most the sum of these errors. For neighbors $`s^2\le\mathop{\mathrm{Pr}}(E_i\cap E_j)`$, so the total is at most the sum of joint probabilities over **ordered distinct** neighboring pairs, namely $`\mu_k^2\sum_{i=2}^{k-1} B_i=o(1)`$ using $h=k$. Thus $`\mathop{\mathrm{Pr}}(X_k=0)=(1-s)^M+o(1)\to e^{-\lambda}`$ since $`s\to0`$, $`Ms\to\lambda`$. This uses only the probability of zero, not a distributional independence assumption. Finally $`\mathop{\mathrm{Pr}}(X_{k+1}>0)\le\mu_{k+1}=o(1)`$. No $(k+1)$-set implies no larger independent set, by heredity.

## 4. Violate the inequalities

Fix $`0<\lambda\lt q^2`$. By the joint concentration and (3), $`X_{k-1}X_{k-2}\lt X_{k-3}`$ with probability $1-o(1)$: for example choose fixed $`\epsilon>0`$ so $`(1+\epsilon)^2(\lambda/q^2)/(1-\epsilon)<1`$, then use the three relative-error events and (3). On their intersection with $`X_k\ge1, X_{k+1}=0`$, the degree is exactly $k$, and

```math
X_{k-1}X_{k-2}< X_k X_{k-3}.
```

By (1) the graph has an independence root in the open right half-plane. A union bound gives $`\liminf_{k\to\infty}\mathop{\mathrm{Pr}}(H_{n_k})\ge1-e^{-\lambda}`$; no conditioning on the top count was used. Since $`n_k\to\infty`$, this is a lower bound on the full-sequence **limsup**. Taking the supremum over constants $`\lambda\lt q^2`$ proves the first assertion. It is not necessary to use the boundary value $`\lambda=q^2`$.

For the second assertion fix instead $`0<\lambda\lt q`$. By (3) and the two lower-count concentration statements, $`X_{k-1}^2\lt X_{k-2}`$ with probability $1-o(1)$. On $`X_k\ge1`$ this strictly violates log-concavity at $k-1$. The same union bound and then $`\lambda\uparrow q`$ give the second result. The optimizing sequences for the two conclusions can be different. ∎

**Counting convention.** For the uniform graph ($p=1/2$) the same lower bounds apply to isomorphism classes, if that is how “almost every” is read in the sector conjecture. A permutation moving $`m\ge2`$ vertices fixes at most $`\binom{n-m}2+m/2`$ unordered pairs, hence moves at least $m(n-m/2-1)$ of them. Each orbit of length $`d\ge2`$ contributes a factor $`2^{-(d-1)}\le2^{-d/2}`$ to the probability of preserving the graph. Thus the sum of the preservation probabilities over all nonidentity permutations is at most $`\sum_{m=2}^n (n2^{-(n-2)/4})^m=o(1)`$. By orbit counting, the number $`u_n`$ of unlabelled graphs therefore satisfies $`n!u_n=2^{\binom n2}(1+o(1))`$. Every class has at most $n!$ labelings, so a bad proportion $`b_n`$ labelled gives a bad proportion at least $`b_n2^{\binom n2}/(n!u_n)=(1-o(1))b_n`$ unlabelled. The labelled proportion that is both bad and connected is at least $`b_n-o(1)`$, since $G(n,p)$ is connected with probability tending to one for fixed $`p>0`$. At $p=1/2$, applying the same transfer to the intersection event and restricting the denominator to connected classes proves the bounds for uniform connected isomorphism classes as well.
