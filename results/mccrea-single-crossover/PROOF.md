# McCrea's conjecture

Complete proposed proof, 21 November 2026. The complete written argument passed independent internal review. The [priority audit](NOVELTY.md) records the sources checked and access limits. This work remains unrefereed. Coordination: [issue 168](https://github.com/1337isnot1337/solved-conjectures/issues/168).

## 1. Statement

For a nonempty integer partition $`\pi`$, let its perimeter be its largest part plus its number of parts minus one. Let $`\mathrm{FD}_{j,k}(n)`$ count partitions of perimeter $`n`$ having exactly $`j`$ distinct part sizes of multiplicity at least $`k`$. Let $`\mathrm{FO}_{j,k}(n)`$ count partitions of perimeter $`n`$ having exactly $`j`$ distinct occurring part sizes divisible by $`k`$.

Marcus McCrea, *Fixed-Perimeter Franklin Statistics and an Eventual Inequality*, [arXiv:2609.12005v2](https://arxiv.org/abs/2609.12005v2), dated 5 November 2026, Section 9, Conjecture 9.2, proposes the following statement. The [full primary PDF](https://arxiv.cnoctave.top/pdf/2609.12005) was inspected.

**Theorem.** Fix an integer $`k\ge3`$, and put

```math
a_k=2^{-k-1},\qquad b_k=\frac1{4k}.
```

There exists a unique $`c_k\in(a_k,b_k)`$ such that, for every fixed $`x\in(a_k,b_k)\setminus\{c_k\}`$, the following inequalities hold for all sufficiently large integers $`n`$:

```math
\begin{cases}
\mathrm{FD}_{\lfloor xn\rfloor,k}(n)>
\mathrm{FO}_{\lfloor xn\rfloor,k}(n),&a_k<x<c_k,\\[2mm]
\mathrm{FD}_{\lfloor xn\rfloor,k}(n)<
\mathrm{FO}_{\lfloor xn\rfloor,k}(n),&c_k<x<b_k.
\end{cases}
```

This is the full conjecture. It does not prescribe the comparison at $`x=c_k`$ or outside the interval between the two means. The previously proved fixed-$`j`$ inequality is a different statement and is not counted here.

## 2. Positive generating functions

Fix $`k`$ throughout, and write

```math
S(q)=q+q^2+\cdots+q^k,
\qquad H(q)=1-2q+q^{k+1}=(1-q)(1-S(q)).
```

The source's Proposition 3.1, equation (7), gives, for $`j\ge1`$,

```math
\sum_{n\ge1}\mathrm{FD}_{j,k}(n)q^n
=\frac{q^{(k+1)j-1}(1-q)^2}{H(q)^{j+1}}
=A_D(q)F_D(q)^{j-1},                                  \tag{1}
```

where

```math
F_D(q)=\frac{q^{k+1}}{(1-q)(1-S(q))},
\qquad A_D(q)=\frac{q^k}{(1-S(q))^2}.                    \tag{2}
```

For the other statistic, put

```math
W(q)=\frac{q}{1-q},\quad
U(q)=\sum_{i=1}^{k-1}W(q)^i,\quad
V(q)=W(q)^k,\quad
T(q)=qV(q),
```

```math
g(q)=V(q)(1-q)=\frac{q^k}{(1-q)^{k-1}},
\qquad K(q)=1-g(q).
```

The source's Proposition 3.2, equation (9), gives

```math
\begin{aligned}
\sum_{n\ge1}\mathrm{FO}_{j,k}(n)q^n
&=\frac{U(q)T(q)^j}{K(q)^{j+1}}
 +\frac{V(q)T(q)^{j-1}}{K(q)^j}\\
&=A_O(q)F_O(q)^{j-1},                                  \tag{3}
\end{aligned}
```

where

```math
F_O(q)=\frac{T(q)}{K(q)},\qquad
A_O(q)=\frac{U(q)T(q)}{K(q)^2}+\frac{V(q)}{K(q)}.         \tag{4}
```

All four series $`A_D,F_D,A_O,F_O`$ have nonnegative coefficients. Both $`F`$ series have positive coefficients at every power $`q^\ell`$ with $`\ell\ge k+1`$, and no smaller powers. For $`F_D`$ this follows from the factor $`1/(1-q)`$ and the expansion of $`1/(1-S)`$. For $`F_O`$, the numerator $`T=q^{k+1}/(1-q)^k`$ already has this support, and $`1/K=\sum_{h\ge0}g^h`$ has nonnegative coefficients and constant term one.

There is a unique $`R_D\in(0,1)`$ with $`S(R_D)=1`$ and a unique $`R_O\in(0,1)`$ with $`g(R_O)=1`$. Positivity of $`S'`$ and $`g'`$ makes these zeros simple. Each $`F_i`$ is analytic on $`|q|<R_i`$ and has a simple pole at the positive real point $`R_i`$. Each $`A_i`$ is analytic on the same open disk. Indeed, for $`|q|<R_D`$ one has $`|S(q)|\le S(|q|)<1`$, and the analogous inequality holds for $`g`$ on $`|q|<R_O`$. Their remaining possible poles occur at one, beyond the stated radii.

## 3. A coefficient lemma, including the floor

We use an elementary large-power coefficient estimate and give its proof to make the local, rather than merely cumulative, comparison explicit.

**Lemma.** Let

```math
F(q)=\sum_{\ell\ge s}f_\ell q^\ell,
\qquad f_\ell>0\quad(\ell\ge s),
```

have positive radius of convergence $`R`$, and suppose $`F`$ has a simple pole at $`R`$. Let $`A`$ be a nonzero power series with nonnegative coefficients, analytic on $`|q|<R`$. For $`0<x<1/s`$, there exists a unique $`r=r(x)\in(0,R)`$ such that

```math
M(r):=\frac{rF'(r)}{F(r)}=\frac1x.                      \tag{5}
```

Set $`m_n=\lfloor xn\rfloor-1`$. Then, as $`n\to\infty`$,

```math
[q^n]A(q)F(q)^{m_n}
\sim\frac{A(r)F(r)^{m_n}r^{-n}}
{\sqrt{2\pi m_n\sigma(r)^2}},
\qquad \sigma(r)^2=rM'(r)>0.                            \tag{6}
```

In particular, these coefficients are positive for every sufficiently large $`n`$, and

```math
\lim_{n\to\infty}\frac1n\log([q^n]AF^{m_n})
=\Phi(x):=-\log r(x)+x\log F(r(x)).                    \tag{7}
```

**Proof.** For $`0<r<R`$, define a random integer $`X_r`$ by

```math
\mathbb P(X_r=\ell)=\frac{f_\ell r^\ell}{F(r)}.
```

Analyticity on a disk larger than $`r`$ gives finite exponential moments. Direct differentiation shows

```math
\mathbb E X_r=M(r),\qquad
\mathop{\mathrm{Var}}X_r=rM'(r).
```

The variance is strictly positive because the support contains consecutive integers. Thus $`M`$ is strictly increasing. Its limit at zero is $`s`$. Its limit as $`r\uparrow R`$ is infinity, because a simple positive pole gives

```math
M(r)=\frac{r}{R-r}+O(1).
```

This proves existence and uniqueness in (5), and positivity of $`\sigma(r)^2`$.

Fix that $`r`$. If $`A(q)=\sum a_\ell q^\ell`$, let $`Y`$ be an independent nonnegative integer with probabilities $`a_\ell r^\ell/A(r)`$. Multiplying the probability generating functions gives the exact identity

```math
[q^n]A(q)F(q)^m
=A(r)F(r)^m r^{-n}
\mathbb P\left(Y+X_1+\cdots+X_m=n\right),               \tag{8}
```

where the $`X_i`$ are independent copies of $`X_r`$.

Here is the local estimate needed for (8). Write $`\mu=1/x`$, $`\sigma^2=\sigma(r)^2`$, and let $`\varphi(\theta)=\mathbb E e^{i\theta X_r}`$, $`\psi(\theta)=\mathbb E e^{i\theta Y}`$. Fourier inversion for integer-valued random variables yields

```math
\mathbb P(Y+X_1+\cdots+X_m=n)
=\frac1{2\pi}\int_{-\pi}^{\pi}
e^{-in\theta}\varphi(\theta)^m\psi(\theta)\,d\theta.
                                                                    \tag{9}
```

The consecutive support implies $`|\varphi(\theta)|<1`$ for $`0<|\theta|\le\pi`$: equality in the triangle inequality would force $`e^{i\ell\theta}`$ to have the same value for all consecutive $`\ell`$, hence $`e^{i\theta}=1`$. Continuity then gives a uniform bound strictly below one on every compact region away from zero. At zero, finite exponential moments give

```math
\log\varphi(\theta)=i\mu\theta-\frac{\sigma^2\theta^2}{2}
+O(|\theta|^3).
```

In particular, $`|\varphi(\theta)|\le e^{-c\theta^2}`$ for some $`c>0`$ and sufficiently small $`|\theta|`$. Also $`|\psi|\le1`$ and $`\psi(\theta)\to1`$ as $`\theta\to0`$.

For $`m=m_n`$,

```math
n-m\mu=\frac{1+\{xn\}}x=O(1).                         \tag{10}
```

In the integral (9), put $`\theta=t/\sqrt m`$ near zero. The integrand becomes

```math
e^{-i(n-m\mu)t/\sqrt m}
e^{-\sigma^2t^2/2+O(|t|^3/\sqrt m)}\psi(t/\sqrt m),
```

which tends to $`e^{-\sigma^2t^2/2}`$ for each fixed $`t`$. The bound $`e^{-ct^2}`$ permits dominated convergence on the expanding neighborhood; the remaining part of (9) is exponentially small by the uniform bound away from zero. Thus

```math
\sqrt m\,\mathbb P(Y+X_1+\cdots+X_m=n)
\longrightarrow\frac1{2\pi}\int_{\mathbb R}e^{-\sigma^2t^2/2}\,dt
=\frac1{\sqrt{2\pi\sigma^2}}>0.
```

This proves (6). Taking logarithms, using $`m_n/n\to x`$, proves (7). ∎

## 4. The two rate functions

Apply the lemma to (1) and (3), with $`s=k+1`$. Both pairs satisfy all its assumptions. We obtain differentiable functions $`\Phi_D,\Phi_O`$ on $`0<x<1/(k+1)`$ such that

```math
\lim_{n\to\infty}\frac1n\log\mathrm{FD}_{\lfloor xn\rfloor,k}(n)
=\Phi_D(x),
\qquad
\lim_{n\to\infty}\frac1n\log\mathrm{FO}_{\lfloor xn\rfloor,k}(n)
=\Phi_O(x).                                             \tag{11}
```

For either function, differentiation of (7) and use of (5) cancel the terms containing $`r'(x)`$:

```math
\Phi'(x)=\log F(r(x)).                                  \tag{12}
```

Since $`M'(r)=\sigma(r)^2/r`$, differentiating $`M(r(x))=1/x`$ gives

```math
r'(x)=-\frac{r(x)}{x^2\sigma(r(x))^2}<0,
\qquad
\Phi''(x)=-\frac1{x^3\sigma(r(x))^2}<0.                 \tag{13}
```

Consequently each rate is strictly concave. Direct substitution gives

```math
F_D(1/2)=F_O(1/2)=1,
\qquad M_D(1/2)=2^{k+1},\quad M_O(1/2)=4k.              \tag{14}
```

For clarity, the first logarithmic derivative is

```math
M_D(q)=k+1-\frac{qH'(q)}{H(q)},
```

and $`H(1/2)=2^{-k-1}`$, $`H'(1/2)=-2+(k+1)2^{-k}`$ give the first mean in (14). On the other side, $`W(1/2)=1`$, $`W'(1/2)=4`$, $`T(1/2)=K(1/2)=1/2`$, and

```math
\frac{T'(1/2)}{T(1/2)}=4k+2,
\qquad \frac{K'(1/2)}{K(1/2)}=2-4k
```

give $`M_O(1/2)=4k`$.

By (12)–(14), $`\Phi_D`$ has its unique maximum at $`a_k`$, while $`\Phi_O`$ has its unique maximum at $`b_k`$. The two maximum values coincide:

```math
\Phi_D(a_k)=\Phi_O(b_k)=\log2.                          \tag{15}
```

Both means belong to the lemma's interval. Also $`a_k<b_k`$ for $`k\ge3`$: $`4k<2^{k+1}`$ holds at $`k=3`$ and persists by induction. Finally, $`b_k<1/(k+1)`$ because $`k+1<4k`$.

## 5. Existence and uniqueness of the crossover

On $`[a_k,b_k]`$, set $`\Delta_k(x)=\Phi_D(x)-\Phi_O(x)`$. Strict maximality and (15) imply

```math
\Delta_k(a_k)>0,\qquad \Delta_k(b_k)<0.                 \tag{16}
```

For $`a_k<x<b_k`$, equation (13) makes the $`D`$ saddle smaller than $`1/2`$ and the $`O`$ saddle larger than $`1/2`$. Each $`F`$ is strictly increasing, so (12) yields

```math
\Phi_D'(x)<0<\Phi_O'(x),
\qquad \Delta_k'(x)<0.                                 \tag{17}
```

Continuity, (16), and (17) give exactly one zero $`c_k\in(a_k,b_k)`$. This provides an implicit exact definition of the transition density, without a numerical approximation.

For fixed $`x\ne c_k`$ in that interval, (11) gives

```math
\lim_{n\to\infty}\frac1n
\log\frac{\mathrm{FD}_{\lfloor xn\rfloor,k}(n)}
{\mathrm{FO}_{\lfloor xn\rfloor,k}(n)}
=\Delta_k(x).                                          \tag{18}
```

Both counts are eventually positive by the coefficient lemma. If $`x<c_k`$, the limit is positive, so the ratio tends to infinity. If $`x>c_k`$, the limit is negative, so the ratio tends to zero. This proves the two eventual strict inequalities for every allowed $`k,x`$. Any other proposed transition density would give the opposite inequality at a point strictly between the two densities, so the density in the conjecture is unique. ∎

## Scope and verification

The proof covers every integer $`k\ge3`$ and every fixed real density in the exact interval specified by the conjecture, apart from its expressly excluded crossover. The convergence threshold may depend on $`k,x`$, as permitted by the source. It does not claim a single finite-$`n`$ sign change over all $`j`$ or a uniform threshold in $`x`$. No numerical root or finite screen is a premise of the proof.

The positive generating-function rewrites, support, pole, mean, and floor conditions are all explicit. The coefficient lemma is proved directly rather than inferred from a large-deviation bound on cumulative probabilities. Source status and the priority audit are recorded separately.
