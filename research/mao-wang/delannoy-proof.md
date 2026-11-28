# Mao–Wang's conjecture: the Delannoy clause

Status: complete candidate argument, pending independent audit. The Eulerian clause of the source conjecture remains unresolved in this work. This file is research, not a claim that the full conjecture is solved.

Issue: [#83](https://github.com/1337isnot1337/solved-conjectures/issues/83).
Date: 2026-11-20.

## Statement and conventions

Let $D(n,j)$ count lattice paths from $(0,0)$ to $(n-j,j)$ using steps $(1,0)$, $(0,1)$ and $(1,1)$, and set $D(n,j)=0$ outside $0\leq j\leq n$. Define

```math
d_n(x)=\sum_{j=0}^{n}D(n,j)x^j,
\qquad
g_n(x)=\sum_{j=0}^{n}D(n,j)d_j(x).
```

Thus $g_n$ is the row-generating polynomial of the **ordinary matrix square** $D^2$.

The primary source is [Mao–Wang, arXiv:2607.01572v1](https://arxiv.org/pdf/2607.01572), Section 4, PDF pages 10–11. Its Conjecture 4.1 asks for real nonpositive roots of both the Eulerian and Delannoy matrix squares. The theorem below concerns the entire Delannoy clause, for every row.

**Theorem.** For every integer $n\geq0$, every zero of $g_n$ is real and strictly negative.

At $n=0$, $g_0=1$ and the claim is vacuous. The proof covers every $n\geq1$ without a finite verification cutoff.

## Prior work and the contribution claimed here

The ordinary Delannoy recurrence and its Chebyshev representation are classical. Mao and Wang derive the generating function of $D^2$ and its four-term recurrence.

The public [Omega source note](https://the-omega-institute.github.io/trureturing-mdbook/Library/Zeros/maowang2026narayana.html) and [problem note](https://the-omega-institute.github.io/trureturing-mdbook/Problems/mao-wang-2026-delannoy-square-negative-roots.html), last changed 2026-10-11, explicitly describe the same divided-difference reduction and circle-root-count strategy used below. They state that the complementary real-interval sample signs and root count remain obligations. They make no full-resolution claim.

This argument must therefore be read as a completion of that already public route. Its additional step is the amplitude domination inequality in Section 5. The circle argument is included in full for independent checking. No formal-verification claim is made.

Searches through both engines for Mao–Wang, Delannoy square roots, the exact paper and conjecture number, and the Eulerian matrix square found no earlier full resolution. This is a bounded status search, not proof of universal priority.

## 1. Ordinary Delannoy roots

The initial rows and recurrence are

```math
d_0(x)=1,\qquad d_1(x)=1+x,\qquad
d_n(x)=(1+x)d_{n-1}(x)+x\,d_{n-2}(x).
\tag{1}
```

In particular $d_n$ is monic of degree $n$, has positive coefficients, and is reciprocal:

```math
d_n(x)=x^n d_n(1/x).
\tag{2}
```

The recurrence proves the reciprocity by induction.

Let $U_n$ be the Chebyshev polynomial of the second kind, with

```math
U_0(c)=1,\quad U_1(c)=2c,\quad
U_n(c)=2cU_{n-1}(c)-U_{n-2}(c).
```

For $s>0$, comparison with (1) gives

```math
d_n(-s)=s^{n/2}
U_n\!\left(\frac{1-s}{2\sqrt{s}}\right).
\tag{3}
```

The function $c(s)=(1-s)/(2\sqrt{s})$ is strictly decreasing on $(0,\infty)$. Since

```math
U_n(\cos\theta)=\frac{\sin((n+1)\theta)}{\sin\theta},
\tag{4}
```

$d_n$ has $n$ simple negative zeros $-s_j$, where

```math
s_j=s\!\left(\frac{j\pi}{n+1}\right),\qquad
s(\theta)=\left(\sqrt{1+\cos^2\theta}-\cos\theta\right)^2,
\quad 1\leq j\leq n.
\tag{5}
```

The function $s(\theta)$ is strictly increasing for $0<\theta<\pi$.
Reciprocity also gives $s_{n+1-j}=1/s_j$.

Set

```math
a=\sqrt2-1,\qquad b=\sqrt2+1=\frac1a.
```

There is a unique $\theta_a\in(0,\pi/2)$ such that $s(\theta_a)=a$, and

```math
\cos^2\theta_a=\frac a2.
\tag{6}
```

We will use

```math
k=\#\{j:s_j\lt a\}.
\tag{7}
```

By reciprocity, this is also the number of roots of $d_n$ lying to the left of $-b$.
Because $a<1$, $0\leq k\leq\lfloor n/2\rfloor$.

## 2. Neither threshold is a root

We need $d_n(-a)\neq0$ and $d_n(-b)\neq0$. The second follows from the first by (2).

Write

```math
U_n(c)=c^\epsilon R_n(c^2),\qquad
\epsilon\in\{0,1\},\quad \epsilon\equiv n\pmod2,
```

where $R_n\in\mathbb Z[y]$. Every root of $R_n$ is strictly positive: its roots are the nonzero squared roots of $U_n$, all of which lie in $(-1,1)$.

If $d_n(-a)=0$, equations (3) and (6) would imply $R_n(a/2)=0$, since $\cos\theta_a>0$.
Applying the nontrivial automorphism of $\mathbb Q(\sqrt2)$ to this equality gives

```math
R_n\!\left(-\frac{\sqrt2+1}{2}\right)=0,
```

contradicting positivity of the roots of $R_n$. For $n=0,1$, the same argument has constant $R_n$, which has no roots.

Consequently no $s_j$ equals $a$, and (7) means precisely

```math
\frac{j\pi}{n+1}<\theta_a\quad(1\leq j\leq k),
\qquad
\frac{(k+1)\pi}{n+1}>\theta_a.
\tag{8}
```

The second inequality is needed only when $k<n$; that always holds here.

## 3. A divided-difference identity for the squared rows

If $\alpha,\beta$ are distinct complex numbers satisfying

```math
\alpha+\beta=1+x,\qquad \alpha\beta=-x,
```

the recurrence (1) gives

```math
d_j(x)=\frac{\alpha^{j+1}-\beta^{j+1}}{\alpha-\beta}.
```

Multiplying by $D(n,j)$ and summing yields the exact identity

```math
g_n(x)=
\frac{\alpha d_n(\alpha)-\beta d_n(\beta)}
{\alpha-\beta}.
\tag{9}
```

This identity follows directly from the ordinary matrix product, so it does not replace the target with a surrogate sequence.

Also, $g_n$ is monic of degree $n$: only $j=n$ contributes to its leading coefficient, and both relevant leading coefficients are one. Every coefficient of $g_n$ is positive, and in particular

```math
g_n(x)>0\quad\hbox{for all }x\geq0.
\tag{10}
```

## 4. At least $n-k$ roots in the central interval

For $0<\phi<\pi$, put

```math
\alpha(\phi)=-1+\sqrt2e^{i\phi},\qquad
\beta(\phi)=\overline{\alpha(\phi)},\qquad
x(\phi)=-|\alpha(\phi)|^2=-3+2\sqrt2\cos\phi.
\tag{11}
```

Then $\alpha+\beta=1+x$ and $\alpha\beta=-x$. Moreover, $x(\phi)$ is strictly decreasing and maps $(0,\pi)$ bijectively onto

```math
I=(-3-2\sqrt2,\,-3+2\sqrt2).
```

Let $`F(z)=z\,d_n(z)`$. All $n+1$ roots of $F$ are real and nonpositive, and neither endpoint $a$ or $-b$ of the arc is a root by Section 2.

For a root $r$ of $F$, $\alpha(\phi)-r$ has positive imaginary part on the open arc. Its argument can therefore be chosen continuously in $(0,\pi)$, starting at $0$ when $\phi=0$. At $\phi=\pi$, its limiting argument is $\pi$ if $r>-b$ and $0$ if $r<-b$.

Summing these arguments over all roots, with the leading coefficient of $F$ positive, gives a continuous argument $\Theta(\phi)$ of $F(\alpha(\phi))$, satisfying

```math
\Theta(0)=0,\qquad
\Theta(\pi)=(n-k+1)\pi.
\tag{12}
```

Here exactly $k$ of the $n$ roots of $d_n$ lie below $-b$, while the additional root $0$ lies above $-b$.

For each integer $j=1,\ldots,n-k$, the intermediate value theorem gives an interior parameter $\phi_j$ with $\Theta(\phi_j)=j\pi$.
These parameters are distinct because the argument values are distinct. Monotonicity of $\Theta$ is **not** required.
At each parameter, $F(\alpha(\phi_j))$ is real, so (9) gives $g_n(x(\phi_j))=0$.
Strict monotonicity of $x(\phi)$ makes these $n-k$ roots distinct.

Thus $g_n$ has at least $n-k$ distinct real roots in $I$.

## 5. At least $k-1$ roots in the exterior interval

This section is needed only when $k\geq1$.

For $s\in(0,a)$ define

```math
r=\frac{1-s}{1+s},\qquad
y=\frac1{sr}.
\tag{13}
```

Then $a<r<1$, $r>s$, and $s+r+sr=1$.
The product $sr=s(1-s)/(1+s)$ increases strictly on $(0,a)$, because

```math
\frac{d}{ds}(sr)=\frac{1-2s-s^2}{(1+s)^2}>0.
```

Consequently $x=-y$ increases strictly on this interval, with range

```math
J=(-\infty,\,-3-2\sqrt2).
\tag{14}
```

In (9), take $\alpha=-1/s$ and $\beta=-1/r$. Using reciprocity (2), define

```math
H(s)=\frac{d_n(-s)}{s^{n+1}}.
```

A direct substitution gives

```math
(-1)^n g_n(-y)
=\frac{sr}{r-s}\bigl(H(s)-H(r)\bigr).
\tag{15}
```

The prefactor is strictly positive.

For $j=1,\ldots,k$, take the sample angles and parameters

```math
\vartheta_j=\frac{(j-\tfrac12)\pi}{n+1},
\qquad
\sigma_j=s(\vartheta_j),
\qquad
\rho_j=\frac{1-\sigma_j}{1+\sigma_j}.
\tag{16}
```

By (8), $0<\vartheta_j<\theta_a$, hence $0<\sigma_j<a<\rho_j<1$.
Both $\sigma_j$ and $\rho_j$ are in the range of $s(\theta)$ for $0<\theta<\pi/2$.
Indeed, $\sigma_j>s(0)=3-2\sqrt2$, and $\rho_j>\sigma_j$ while $\rho_j<1=s(\pi/2)$.

Let $\eta_j\in(\vartheta_j,\pi/2)$ be the angle with $s(\eta_j)=\rho_j$. By (3)–(4),

```math
H(\sigma_j)
=\frac{\sigma_j^{-n/2-1}}{\sin\vartheta_j}
\,\sin((n+1)\vartheta_j)
=(-1)^{j-1}
\frac{\sigma_j^{-n/2-1}}{\sin\vartheta_j}.
\tag{17}
```

At the companion parameter,

```math
|H(\rho_j)|
\leq \frac{\rho_j^{-n/2-1}}{\sin\eta_j}
<
\frac{\sigma_j^{-n/2-1}}{\sin\vartheta_j}
=|H(\sigma_j)|.
\tag{18}
```

The strict inequality uses both $\rho_j>\sigma_j>0$ and
$0<\vartheta_j<\eta_j<\pi/2$. The exponent $n/2+1$ is positive and sine is strictly increasing on that angle interval.

It follows that $H(\sigma_j)-H(\rho_j)$ has sign $(-1)^{j-1}$. Equation (15) therefore gives alternating nonzero signs of $g_n$ at the $k$ real sample points

```math
x_j=-\frac1{\sigma_j\rho_j}\in J.
```

These points are strictly increasing with $j$. The intermediate value theorem gives one distinct real root between each consecutive pair, for at least $k-1$ distinct roots in $J$.

The intervals $I$ and $J$ are disjoint. All denominators used above are nonzero, since $0<\sigma_j<a<\rho_j$.

## 6. Completion of the root count

If $k=0$, Section 4 already gives $n$ distinct real roots. Since $\deg g_n=n$, these are all its roots.

If $k\geq1$, Sections 4–5 give at least

```math
(n-k)+(k-1)=n-1
```

distinct real roots. Divide $g_n$ by the product of the corresponding $n-1$ monic real linear factors. The quotient is a monic real polynomial of degree one, so its remaining root is real. That remaining root may coincide with an already counted root; multiplicity causes no problem.

Every real root is strictly negative by (10). This proves the theorem.

## Scope of the conclusion

The proof establishes the full Delannoy clause for all $n\geq0$, assuming no numerical root data or unproved recurrence property. It does not establish the Eulerian clause, any higher matrix power, or consecutive interlacing of the squared rows. The full Mao–Wang conjecture remains an active target.
