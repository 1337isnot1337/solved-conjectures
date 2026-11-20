# Pereira–Plosker's trumping conjecture: an exact multiplier criterion

Status: complete candidate arguments under independent review. The source's boundary-zero interpretation and prior-theorem status remain unresolved. This file is not a declaration that the named conjecture has been settled.

## 1. Statement being investigated

Pereira and Plosker, [arXiv:1405.2845](https://arxiv.org/pdf/1405.2845), Conjecture 1 on printed page 7, consider a generalized Dirichlet series

```math
\zeta(s)=\sum_{n\geq1} a_n e^{-\lambda_n s},
\qquad 0\lt\lambda_1\lt\lambda_2\lt\cdots,\qquad
\lambda_n\longrightarrow\infty,
\qquad \sum_n|a_n|e^{-\lambda_n}<\infty.
```

They assume a simple zero at $s=1$ and ask whether positivity on $(1,\infty)$ is equivalent to the existence of a nonzero positive-coefficient generalized Dirichlet series $\zeta_2$, also absolutely convergent on the closed half-plane $\mathop{\mathrm{Re}}s\geq1$, for which

```math
\frac{\zeta(s)\zeta_2(s)}{s(s-1)}
```

is completely monotone on $(1,\infty)$.

The source does not define multiplicity at this boundary point. The arguments below distinguish holomorphic extension across $1$ from the weaker condition of a finite nonzero right derivative. Nothing in this file identifies these two conditions.

We prove an exact criterion that applies whenever the right derivative is finite and positive. It gives a positive answer under the holomorphic reading and a counterexample under the weaker reading.

## 2. The convolution criterion

Let $\mu$ be a finite real signed measure on $[0,\infty)$, supported on a locally finite set, with total mass zero. Suppose its first support point is zero and $\mu(\{0\})>0$. Write

```math
g(z)=\int_{[0,\infty)}e^{-zt}\,d\mu(t),\qquad z>0,
```

and suppose

```math
g(z)>0\quad(z>0),\qquad
\lim_{z\downarrow0}\frac{g(z)}z=d\in(0,\infty).
\tag{1}
```

Extend all functions by zero to the negative half-line when appropriate, and put

```math
k(t)=(1-e^{-t})\mathbf1_{\{t\geq0\}},
\qquad h=k*\mu.
\tag{2}
```

**Theorem.** There is a nonzero finite positive measure $\nu$ on $[0,\infty)$ such that $h*\nu\geq0$ if and only if $h\in L^1(\mathbb R)$. When $h\in L^1$, the measure $\nu$ can be chosen to have positive weights at every point of a single arithmetic progression $\{n\delta:n\geq0\}$.

A positive translation of $\nu$ is allowed, so its first atom can be required to be strictly positive. The necessity part allows arbitrary finite positive measures, and therefore also applies to the more restricted Dirichlet multipliers.

Several elementary properties of $h$ will be used. If $V=\|\mu\|$ is the total variation, then $|h|\leq V$. The function $h$ is continuous, and

```math
h'=r*\mu\in L^1(\mathbb R),\qquad
r(t)=e^{-t}\mathbf1_{\{t\geq0\}},\qquad
\|h'\|_1\leq V.
\tag{3}
```

In distributions,

```math
D(D+1)h=\mu.
\tag{4}
```

Also $h(t)\to0$ as $t\to\infty$. Indeed,

```math
h(t)=\mu([0,t])-\int_{[0,t]}e^{-(t-u)}\,d\mu(u),
```

and both terms tend to zero: the first by the zero total mass and the second by dominated convergence against $|\mu|$. For $z>0$, Fubini gives

```math
\int_0^\infty e^{-zt}h(t)\,dt
=\frac{g(z)}{z(z+1)}.
\tag{5}
```

All uses of Fubini here are justified by boundedness of $h$, or directly by integrating $|k(t-u)|e^{-zt}$ against the finite measure $|\mu|$.

## 3. Positive multipliers for absolutely summable power series

Let $\mathcal A=\ell^1(\mathbb N_0,\mathbb R)$ with convolution multiplication and unit $1=(1,0,\ldots)$. For $a\in\mathcal A$, write $a(x)=\sum_{n\geq0}a_nx^n$ on $[0,1]$.

**Lemma.** If $a(x)>0$ for every $x\in[0,1]$, there exists $b\in\mathcal A$ with $b_n\geq0$, $b_0>0$, and $a*b$ coefficientwise nonnegative.

### 3.1. Closure and the Neumann estimate

Let $\mathcal P$ be the coefficientwise nonnegative cone, and define

```math
\mathcal S
=\{a\in\mathcal A:
\text{some }b\in\mathcal P,\ b_0>0,\text{ satisfies }a*b\in\mathcal P\}.
```

The set $\mathcal S$ contains $\mathcal P$, is a convex cone, and is closed under multiplication. For addition, if $ab\geq0$ and $cd\geq0$, then

```math
(a+c)bd=(ab)d+(cd)b\geq0.
```

The denominator $bd$ has positive constant coefficient. The product case follows from $(ac)(bd)=(ab)(cd)\geq0$.

For any $u\in\mathcal A$ and any real $M>\|u\|_1$, the series

```math
b=(M1-|u|)^{-1}
=\frac1M\sum_{j=0}^{\infty}\left(\frac{|u|}{M}\right)^{*j}
```

converges in $\ell^1$, has nonnegative coefficients, and has positive constant coefficient. Since

```math
(M1\pm u)b=1+(|u|\pm u)b\geq0,
\tag{6}
```

we have $M1\pm u\in\mathcal S$. In particular, the open unit ball around $1$ is contained in $\mathcal S$.

### 3.2. A constructive proof for polynomials

Suppose first that $P$ is a real polynomial positive on $[0,1]$. Factor it over the reals, normalizing each factor to have constant coefficient one and leaving the positive factor $P(0)$ outside the product.

A negative real root gives a factor $1+x/r$ with $r>0$, already coefficientwise positive. A positive real root must satisfy $r>1$. Its factor $1-x/r$ has the coefficientwise positive inverse $\sum_{j\geq0}(x/r)^j$ in $\ell^1$.

A conjugate pair of roots $re^{\pm i\theta}$, with $r>0$ and $0\lt\theta\lt\pi$, gives a factor $1-2\cos\theta\,u+u^2$, where $u=x/r$. Put $N=\lceil\pi/\theta\rceil$ and

```math
Q(u)=\sum_{j=0}^{N-2}
\frac{\sin((j+1)\theta)}{\sin\theta}\,u^j.
```

Every coefficient of $Q$ is positive. The sine recurrence gives the exact identity

```math
(1-2\cos\theta\,u+u^2)Q(u)
=1-\frac{\sin(N\theta)}{\sin\theta}u^{N-1}
+\frac{\sin((N-1)\theta)}{\sin\theta}u^N.
```

Since $(N-1)\theta\lt\pi\leq N\theta\lt\pi+\theta\lt2\pi$, the two displayed nonconstant coefficients are nonnegative. Thus every real factor belongs to $\mathcal S$, and so does $P$ by multiplicative closure. This finite polynomial construction is classical; see Filaseta's [1988 paper](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/A507ABBDF3D0A59A08A2C754BA7A7565/S0008414X00000134a.pdf/div-class-title-irreducibility-criteria-for-polynomials-with-non-negative-coefficients-div.pdf), the lemma and comment on printed pages 347–348. It is included to make the approximation step explicit.

### 3.3. Approximation in the summable-coefficient norm

Let $m=\min_{x\in[0,1]}a(x)>0$. Choose $0\lt\varepsilon\lt m/3$ and a polynomial $P$ with $\|a-P\|_1\lt\varepsilon$. Then $P-\varepsilon>0$ on $[0,1]$, so $P-\varepsilon\in\mathcal S$ by Section 3.2. Also

```math
\varepsilon+(a-P)\in\mathcal S
```

by the Neumann estimate (6), with $M=\varepsilon$ and $u=a-P$. Closure under addition now gives

```math
a=(P-\varepsilon)+(\varepsilon+a-P)\in\mathcal S.
```

This proves the lemma. Replacing its multiplier $b(x)$ by $b(x)/(1-x/2)$ makes every coefficient strictly positive while preserving absolute summability and nonnegativity of $ab$.

### 3.4. An independent separation proof

The following alternative proof records the original derivation. It is unnecessary for the constructive proof above.

#### Separation and extreme states

Suppose $a\notin\mathcal S$. Hahn–Banach separation of the open convex interior of $\mathcal S$ from $a$ gives a nonzero continuous real functional $L$ satisfying

```math
L(\mathcal S)\geq0,\qquad L(a)\leq0.
```

Here every element of $\mathcal S$ is a limit of interior elements, by adding $\varepsilon1$, so positivity extends from the interior to the whole cone. Also $L(1)>0$, since $1$ is an interior point and $L$ is nonzero. Normalize $L(1)=1$.

Let $\mathcal E$ be the set of continuous functionals positive on $\mathcal S$ and normalized at $1$. Equation (6) implies

```math
|L(u)|\leq\|u\|_1\qquad(L\in\mathcal E).
```

Thus $\mathcal E$ is a weak-* closed subset of the dual unit ball and is weak-* compact. It is nonempty, since evaluation at any $x\in[0,1]$ belongs to it: every admissible denominator has $b(x)>0$.

The face on which $L(a)$ attains its minimum is nonempty and compact. Choose an extreme point of that face by Krein–Milman. This point, still denoted $L$, is extreme in $\mathcal E$, and satisfies $L(a)\leq0$.

#### Extreme states are evaluations

Fix $s\in\mathcal S$, and choose $M>\|s\|_1$. Then $M1-s\in\mathcal S$. The functionals $u\mapsto L(su)$ and $u\mapsto L((M1-s)u)$ are positive on $\mathcal S$.

If $L(s)=0$, then for any $u$ and any $N>\|u\|_1$,

```math
0\leq L(s(N1+u))=L(su),\qquad
0\leq L(s(N1-u))=-L(su).
```

Consequently $L(su)=0=L(s)L(u)$.

If $L(s)>0$, then $0<L(s)<M$, and

```math
L
=\frac{L(s)}M\frac{L(s\,\cdot)}{L(s)}
+\frac{M-L(s)}M
\frac{L((M1-s)\,\cdot)}{M-L(s)}
```

is a convex decomposition into states in $\mathcal E$. Extremality gives

```math
L(su)=L(s)L(u).
```

Every element of $\mathcal A$ is a difference of elements of $\mathcal S$, by (6). Hence $L$ is multiplicative on all of $\mathcal A$.

Let $e=(0,1,0,\ldots)$ and set $x=L(e)$. Positivity gives $x\geq0$, and the norm bound gives $x\leq1$. Multiplicativity determines $L$ on polynomials as evaluation at $x$. Polynomial sequences are dense in $\ell^1$, so continuity gives $L(u)=u(x)$ for every $u\in\mathcal A$.

Thus $L(a)=a(x)>0$, contradicting the separating state. This proves the same lemma by a second route.

## 4. Sufficiency: round the atoms in a direction that decreases h

Assume $h\in L^1$. Write $\mu=\sum_j b_j\delta_{\lambda_j}$, with $\lambda_0=0$, $b_0>0$, and all other nonzero support points positive. Since $\mu$ has total mass zero, some coefficient is negative. Let $\eta>0$ be the first location with negative coefficient.

For a small mesh $\delta>0$, move each positive atom to the next grid point and each negative atom to the preceding grid point:

```math
\lambda_j^\delta=
\begin{cases}
\delta\lceil\lambda_j/\delta\rceil,&b_j>0,\\
\delta\lfloor\lambda_j/\delta\rfloor,&b_j<0.
\end{cases}
```

Let $\mu_\delta=\sum_jb_j\delta_{\lambda_j^\delta}$, combining weights at equal points, and let $h_\delta=k*\mu_\delta$. The total mass remains zero and $\|\mu_\delta\|\leq V$.

Because $k$ is nondecreasing,

```math
h_\delta(t)\leq h(t)\quad\text{for every }t.
\tag{7}
```

For $0\leq u\leq v$,

```math
\int_{\mathbb R}\bigl(k(t-u)-k(t-v)\bigr)\,dt=v-u.
```

One proof integrates $k'=r$, whose integral is one, over the interval $[u,v]$ and then uses Tonelli. Summing the nonnegative differences caused by rounding gives

```math
0\leq\|h-h_\delta\|_1
=\sum_j|b_j|\,|\lambda_j^\delta-\lambda_j|
\leq\delta V.
\tag{8}
```

Hence $h_\delta\in L^1$.

### 4.1. Positivity survives one sufficiently fine mesh

Let $g_\delta$ be the Laplace transform of $\mu_\delta$. For every $z>0$,

```math
|g_\delta(z)-g(z)|\leq\delta zV.
\tag{9}
```

This follows from the mean value bound for $e^{-zt}$ on $t\geq0$.

For $\delta<\eta/2$, every negative atom of $\mu_\delta$ is located at least $\eta/2$ from zero, while the weight $b_0$ at zero remains positive. If $V_-$ is the negative mass of $\mu$, then

```math
g_\delta(z)\geq b_0-V_-e^{-z\eta/2}.
```

Choose $Z$ large enough that the right side is positive for every $z\geq Z$. This choice is independent of $\delta<\eta/2$.

By (1), the function $g(z)/z$ extends continuously to $z=0$ with positive value $d$. Therefore

```math
m=\min_{0\leq z\leq Z}\frac{g(z)}z>0.
```

If also $\delta V<m/2$, equation (9) proves $g_\delta(z)>0$ for $0<z\leq Z$, hence for all $z>0$.

The difference quotient in (9) has a limit at zero by dominated convergence, because every displacement is at most $\delta$. Consequently

```math
d_\delta
:=\lim_{z\downarrow0}\frac{g_\delta(z)}z
=d-\sum_j b_j(\lambda_j^\delta-\lambda_j)>0.
\tag{10}
```

The last positivity follows from the same bound $\delta V<m/2\leq d/2$.

### 4.2. The grid cumulative sequence is absolutely summable

Write $\mu_\delta=\sum_{n\geq0}c_n\delta_{n\delta}$ and define

```math
a_n=\sum_{j=0}^n c_j.
```

For almost every $t\in[n\delta,(n+1)\delta)$,

```math
h_\delta(t)+h_\delta'(t)=a_n.
```

Since $h_\delta\in L^1$ and $\|h_\delta'\|_1\leq V$,

```math
\delta\sum_{n\geq0}|a_n|
\leq\|h_\delta\|_1+\|h_\delta'\|_1<\infty.
\tag{11}
```

Thus $A(w)=\sum_{n\geq0}a_nw^n$ is an absolutely summable power series. Since $c_0=b_0>0$, $A(0)>0$. For $w=e^{-\delta z}\in(0,1)$,

```math
g_\delta(z)=(1-w)A(w)>0.
```

At the other endpoint, (10) gives

```math
A(1)=\frac{d_\delta}{\delta}>0.
```

Apply the lemma in Section 3. Choose $B(w)=\sum_{n\geq0}B_nw^n$ absolutely summable, with every $B_n>0$, and with $A(w)B(w)$ coefficientwise nonnegative. Let

```math
\nu=\sum_{n\geq0}B_n\delta_{n\delta}.
```

It is a positive finite measure. Moreover,

```math
\int_0^\infty e^{-zt}(h_\delta*\nu)(t)\,dt
=\frac{1-e^{-\delta z}}{z(z+1)}
A(e^{-\delta z})B(e^{-\delta z}).
\tag{12}
```

The first factor is the Laplace transform of the nonnegative integrable function $k(t)-k(t-\delta)$. The second factor is the Laplace transform of a finite positive grid measure. Uniqueness of Laplace transforms therefore gives $h_\delta*\nu\geq0$. These convolutions are continuous, so the inequality holds everywhere. Equation (7) then yields $h*\nu\geq0$. This proves sufficiency.

## 5. Necessity: a finite multiplier forces integrability

Suppose $\nu$ is a nonzero finite positive measure on $[0,\infty)$ and $F=h*\nu\geq0$. Let $m=\nu([0,\infty))>0$. Equation (5) gives

```math
\int_0^\infty e^{-zt}F(t)\,dt
=\frac{g(z)}{z(z+1)}
\int_{[0,\infty)}e^{-zt}\,d\nu(t).
```

By (1) and monotone convergence,

```math
\|F\|_1=\int_0^\infty F(t)\,dt=dm<\infty.
\tag{13}
```

We recover the low frequencies of $h$ from $F$ by an explicit local inverse. This avoids any global inversion assertion for the measure algebra.

### 5.1. A local inverse for a finite positive measure

Use the Fourier convention $\widehat f(\omega)=\int_{\mathbb R}e^{-i\omega t}f(t)\,dt$. Choose a real even smooth compactly supported function $\chi$ equal to one near zero, and let $\rho$ be its inverse Fourier transform. Then $\rho$ is Schwartz and $\int\rho=1$. Put $\rho_\varepsilon(t)=\varepsilon\rho(\varepsilon t)$.

The integrable function

```math
a_\varepsilon=(\nu-m\delta_0)*\rho_\varepsilon
```

satisfies $\|a_\varepsilon\|_1\to0$. Indeed,

```math
\|a_\varepsilon\|_1
\leq\int
\|\rho(\,\cdot-\varepsilon u)-\rho\|_1\,d\nu(u)
\longrightarrow0
```

by translation continuity and dominated convergence, with majorant $2\|\rho\|_1$.

Choose $\varepsilon$ with $\|a_\varepsilon\|_1<m$. The finite signed measure

```math
\theta=m\delta_0+a_\varepsilon
```

has a convolution inverse

```math
\xi
=\frac1m\sum_{j=0}^\infty
\left(-\frac{a_\varepsilon}{m}\right)^{*j},
\tag{14}
```

convergent in the unitized $L^1$ algebra. On the interval where $\chi(\omega/\varepsilon)=1$, one has $\widehat\theta(\omega)=\widehat\nu(\omega)$.

Choose a smooth compactly supported $\psi$ that equals one near zero and is supported inside that interval. Let $p$ be its inverse Fourier transform, and set $f=p*\xi\in L^1$. Then

```math
\widehat{f*\nu}
=\psi\,\frac{\widehat\nu}{\widehat\theta}
=\psi.
```

Fourier uniqueness yields $f*\nu=p$. Since $h$ is bounded, associativity is justified by absolute Fubini, and

```math
h*p=h*(\nu*f)=(h*\nu)*f=F*f\in L^1.
\tag{15}
```

### 5.2. The remaining frequencies are integrable

The function

```math
M(\omega)=\frac{1-\psi(\omega)}{i\omega(1+i\omega)}
```

is smooth, with its apparent zero-frequency singularity removed. Both $M$ and $M''$ are integrable: away from a compact set they decay respectively as $O(|\omega|^{-2})$ and $O(|\omega|^{-4})$. Its inverse Fourier transform $q$ is bounded, and two integrations by parts give $q(t)=O(|t|^{-2})$. Thus $q\in L^1$.

Taking tempered distributions in (4) and multiplying by $M$ gives

```math
(1-\psi)\widehat h=M\widehat\mu.
```

Therefore $h-h*p=q*\mu\in L^1$. Together with (15), this proves $h\in L^1$, completing the convolution criterion.

## 6. Holomorphic simple zeros imply integrability

Suppose $g$ extends holomorphically to a complex neighborhood of zero and $g(0)=0$. This hypothesis alone implies $h\in L^1$.

Choose a smooth cutoff $\chi$ supported inside that neighborhood on the imaginary axis and equal to one near zero. The function

```math
U(\omega)=
\chi(\omega)\frac{g(i\omega)}{i\omega(1+i\omega)}
```

extends smoothly across zero and is compactly supported. Its inverse Fourier transform $u$ is Schwartz. The function $(1-\chi)/(i\omega(1+i\omega))$ has an integrable inverse $q$ by the preceding argument. Thus $v=u+q*\mu\in L^1$.

The boundary identity $\widehat\mu(\omega)=g(i\omega)$ follows from the finite total variation and dominated convergence from $\mathop{\mathrm{Re}}z>0$. Direct multiplication of Fourier transforms gives $D(D+1)v=\mu$. Therefore $h-v$ solves $D(D+1)(h-v)=0$ in tempered distributions. The only tempered solutions are constants: the second ordinary solution $e^{-t}$ is not tempered on the whole real line. Since $h(t)\to0$ at $+\infty$ and $v\in L^1$, that constant is zero. Consequently $h=v\in L^1$.

If the zero is simple and $g(z)>0$ for real $z>0$, then $g'(0)>0$. The theorem in Section 2 now gives the required positive multiplier.

## 7. Return to the Dirichlet formulation

Discard initial zero coefficients and let $\lambda_1$ be the first nonzero exponent. Positivity of $\zeta(s)$ for all large real $s$ forces $a_1>0$: the first term dominates by absolute convergence.

Put $z=s-1$, $b_n=a_ne^{-\lambda_n}$, and shift the support by $\lambda_1$:

```math
\mu=\sum_n b_n\delta_{\lambda_n-\lambda_1},
\qquad
g(z)=e^{\lambda_1z}\zeta(z+1).
```

Then $\mu$ has all the properties in Section 2 whenever $\zeta(1)=0$, $\zeta(s)>0$ for $s>1$, and the finite positive right derivative exists. The quotient corresponding to $\zeta$ is a positive delay of the density $h$.

Suppose the criterion gives $B(w)=\sum B_nw^n$ with every $B_n>0$ and $\sum B_n<\infty$. For any $\tau>0$, define

```math
\zeta_2(s)
=e^{-\tau s}B(e^{-\delta(s-1)})
=\sum_{n\geq0}B_ne^{n\delta}e^{-(\tau+n\delta)s}.
\tag{16}
```

This is a positive-coefficient generalized Dirichlet series with strictly increasing positive exponents tending to infinity. It converges absolutely on $\mathop{\mathrm{Re}}s\geq1$, since the absolute sum on the boundary is $e^{-\tau}\sum B_n$.

For $s=z+1$,

```math
\frac{\zeta(z+1)\zeta_2(z+1)}{z(z+1)}
=e^{-\tau}e^{-(\tau+\lambda_1)z}
\frac{g(z)B(e^{-\delta z})}{z(z+1)}.
```

The right side is the Laplace transform of a positive translate and rescaling of $h*\nu$, hence is completely monotone.

Conversely, any positive Dirichlet multiplier gives a finite positive atomic measure $\nu$ after shifting $s$ by one. If the quotient is completely monotone, uniqueness of Laplace transforms identifies its representing measure with the continuous density obtained from $h*\nu$, up to the positive delay. Thus $h*\nu\geq0$. The criterion then forces $h\in L^1$.

The implication from existence of a multiplier to $\zeta(s)>0$ is immediate from the positive Laplace representation and the strict positivity of $\zeta_2(s)$. The product cannot vanish identically because $\zeta$ has a nonzero first-order zero.

## 8. A counterexample for a merely right-simple boundary zero

This example is deliberately not asserted to refute a holomorphic reading of the source.

Let $T_k=k(k+1)/2$, set $a_0=1$, and define

```math
a_n=\frac{(-1)^{k-1}}{k^2}
\quad\text{when}\quad T_{k-1}<n\leq T_k,\qquad k\geq1.
\tag{17}
```

Thus the $k$th block has length $k$, constant magnitude $1/k^2$, and alternating sign. The sequence has bounded total variation, tends to zero, and

```math
\sum_{n\geq0}|a_n|
=1+\sum_{k\geq1}\frac1k=\infty,
\qquad
\sum_{n\geq0}a_n=1+\log2.
\tag{18}
```

The latter series converges because complete-block sums are alternating harmonic sums and the largest incomplete-block contribution tends to zero.

Every partial sum $S_N=\sum_{n=0}^Na_n$ is at least one. At the endpoints this is the usual alternating harmonic estimate; within a block the partial sums lie between its two endpoint values. For $0\leq w<1$,

```math
A(w):=\sum_{n\geq0}a_nw^n
=(1-w)\sum_{N\geq0}S_Nw^N\geq1.
\tag{19}
```

Let $c_0=a_0$, $c_n=a_n-a_{n-1}$ for $n\geq1$. Bounded variation gives $\sum|c_n|<\infty$, and telescoping gives $\sum c_n=0$. Put

```math
C(w)=\sum_{n\geq0}c_nw^n=(1-w)A(w)
```

for $|w|<1$, and define, for any $\lambda>0$,

```math
\zeta(s)=e^{-\lambda s}C(e^{-(s-1)})
=\sum_{n\geq0}c_ne^n e^{-(\lambda+n)s}.
\tag{20}
```

Zero coefficients may be retained or omitted. There are infinitely many nonzero coefficients. Equation (20) is absolutely convergent on $\mathop{\mathrm{Re}}s\geq1$ and satisfies $\zeta(1)=0$. Equation (19) proves $\zeta(s)>0$ for every real $s>1$.

By Abel's limit theorem applied to the convergent series in (18),

```math
\lim_{s\downarrow1}\frac{\zeta(s)}{s-1}
=e^{-\lambda}(1+\log2)>0.
\tag{21}
```

Thus $\zeta$ has a finite nonzero right derivative at the boundary.

For $\mu=\sum_{n\geq0}c_n\delta_n$, the density $h=k*\mu$ satisfies $h+h'=a_n$ on each interval $(n,n+1)$, while $h'\in L^1$. Equation (18) therefore implies $h\notin L^1$. The necessity theorem excludes every nonzero finite positive multiplier, including every allowed positive Dirichlet multiplier.

This also proves that $\zeta$ in (20) cannot extend holomorphically through a neighborhood of $s=1$, by Section 6. The example separates the two possible boundary interpretations rather than concealing the difference.

## 9. Remaining work and priority limit

Separate internal mathematical reviews have found no gap in either multiplier proof, the convolution criterion, the Dirichlet conversion, or the boundary counterexample. One full review is recorded in [AUDIT-ALGEBRA.md](AUDIT-ALGEBRA.md). The prior-theorem audit must inspect Diamond–Essén (1978), whose exact hypotheses remain inaccessible in the material retrieved so far; see [NOVELTY.md](NOVELTY.md).

Even if the proofs pass review, the named conjecture's interpretation must be reported honestly: the holomorphic statement is proved, the finite-right-derivative statement is disproved, and the source has not yet been checked to resolve this boundary convention. No finite diagnostic calculation is being used as a replacement for either general argument.

Coordination and receipts: [issue 96](https://github.com/1337isnot1337/solved-conjectures/issues/96).

