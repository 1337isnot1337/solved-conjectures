# Matching susceptibility and the Hwang padding limit

Research date: 20 November 2026 (America/Chicago).

This note proves a conditional curvature implication and an infinite-family
obstruction to its unrestricted-activity hypothesis. It does not prove
Hwang's conjecture, the Lih–Wang inequality, or any other full Minc entry.
The completed-entry count does not change.

## A weaker sufficient variance bound

For an order-$`m`$ doubly stochastic matrix $`A`$, write

```math
R_A(z)=\sum_{k=0}^m\sigma_k(A)z^k,
\qquad
F_A(t)=e^{mt}(1-t)^{2m}R_A\left(\frac{t}{(1-t)^2}\right).
```

At activity $`z=t/(1-t)^2`$, let $`K`$ be the matching size under the
probability proportional to its edge-weight product times $`z^{|M|}`$.
Put $`\mu=\mathbb E K`$, $`V=\mathop{\mathrm{Var}}K`$, and
$`q=\mu/m`$. The previous
[padding-limit note](../../inequalities/hwang_matching_monotonicity.md)
proves

```math
(\log F_A)'=
\frac{m(1+t)(q-t)}{t(1-t)},
```

```math
(\log F_A)''=
\frac{-2mt^2+(-1+2t+t^2)mq+(1+t)^2V}{t^2(1-t)^2}.
```

Consider the following unproved susceptibility comparison, restricted to
$`0<z\le2`$:

```math
V\ \ge\ \frac{\mu(m-\mu)}{m+\mu}
=\frac{mq(1-q)}{1+q}.                           \tag{1}
```

**Conditional implication.** If (1) holds at the indicated activity and
$`m\ge2`$, then $`F_A''(t)\ge0`$. Indeed, the exact identity

```math
-2t^2+(-1+2t+t^2)q+
\frac{(1+t)^2q(1-q)}{1+q}
=-\frac{2(q-t)^2}{1+q}
```

gives

```math
\frac{F_A''(t)}{F_A(t)}
\ge
\frac{m(q-t)^2}{t^2(1-t)^2}
\left(m(1+t)^2-\frac{2}{1+q}\right)\ge0.        \tag{2}
```

Here $`0<q<1`$ at finite positive activity. The bracket is positive for
$`m\ge2`$. For $`m=1`$, direct calculation gives
$`F_A(t)=e^t(1-t+t^2)`$ and
$`F_A''(t)=e^t(1+3t+t^2)>0`$.

Thus (1) on $`0<z\le2`$ would prove convexity of every doubly stochastic
padding limit on $`0<t\le1/2`$. No lower bound for $`q-t`$ is needed for
this implication. A lower bound for $`V`$ that proves log-convexity is
unnecessary: the positive square $`((\log F_A)')^2`$ supplies the missing
term in (2).

This implication concerns the limiting function. Even a proof of (1)
would not automatically establish convexity of every original finite
permanent path, nor the unrestricted C34 chord inequality.

## The activity restriction is necessary

We next prove that (1) is false without an activity restriction, even for
an infinite family of doubly stochastic matrices. The construction is the
weighted Jerrum family from the earlier
[full rook transfer](../../continuation-2026-11-20/regular/jerrum_lihw_transfer.md).
Its parameters here are block size two and three parallel branches.

Each branch contains $`f`$ blocks. A block has one marked vertex in each
bipartition class. The marked-to-marked edge is absent. Both
marked-to-unmarked edges have weight $`2/3`$, and the
unmarked-to-unmarked edge has weight $`1/3`$. Linking edges also have
weight $`1/3`$. They run from one common left endpoint to the first
marked right vertex, between successive blocks, and from the last marked
left vertex to one common right endpoint. There are three branches.

Every row and column has weight sum one. The resulting matrix $`A_f`$
has order $`n=6f+1`$.

Its block transfer matrix is

```math
T(z)=
\begin{pmatrix}
1+5z/3+4z^2/9&z/3+z^2/3\\
1+z&z/3+z^2/9
\end{pmatrix}.
```

Write $`D=T(z)^f`$ and

```math
B_{00}=D_{00},\quad B_{01}=D_{01},\quad
B_{10}=zD_{10}/3,\quad B_{11}=zD_{11}/3.
```

The exact rook partition function is

```math
R_f(z)=B_{00}^3+
3(B_{10}+B_{01}+B_{11})B_{00}^2+
6B_{10}B_{01}B_{00}.                            \tag{3}
```

The transfer records whether an incoming and an outgoing linking edge
occupy the marked vertices. In (3), at most one branch uses each endpoint.
The last term assigns the two endpoints to different branches.

### Reciprocal polynomial

Put $`w=1/z`$ and

```math
M(w)=w^2T(1/w)=
\begin{pmatrix}
4/9+5w/3+w^2&1/3+w/3\\
w+w^2&1/9+w/3
\end{pmatrix},\qquad E=M(w)^f.
```

For $`Q_f(w)=w^{6f+1}R_f(1/w)`$, equation (3) gives

```math
Q_f(w)=wE_{00}^3+3wE_{01}E_{00}^2
 +(E_{10}+E_{11})E_{00}^2+2E_{10}E_{01}E_{00}.   \tag{4}
```

Let $`a=4/9`$ and $`\varepsilon_f=4^{-f}`$. Direct evaluation and
differentiation at zero give

```math
Q_f(0)=a^{3f}\varepsilon_f,
```

```math
Q_f'(0)=a^{3f}
\left(16+(6f-27)\varepsilon_f+12\varepsilon_f^2\right).           \tag{5}
```

For example, divide $`E`$ by $`a^f`$. Its value and derivative at zero are

```math
\frac{E(0)}{a^f}=
\begin{pmatrix}1&1-\varepsilon_f\\0&\varepsilon_f\end{pmatrix},
```

```math
\frac{E'(0)}{a^f}=
\begin{pmatrix}
6f-3+3\varepsilon_f&6f-9+(6f+9)\varepsilon_f\\
3(1-\varepsilon_f)&3-(6f+3)\varepsilon_f
\end{pmatrix}.
```

Substitution into (4) proves (5).

There are constants $`c,C>0`$, independent of $`f`$, such that

```math
\left|Q_f''(w)\right|\le C f^2 a^{3f}
\qquad (|w|\le c/(2f)).                         \tag{6}
```

To justify the uniform estimate, the two eigenvalues of $`M(0)`$ are the
distinct positive numbers $`a=4/9`$ and $`d=1/9`$. On a fixed complex
disc around zero, their analytic branches $`\lambda_\pm(w)`$ and spectral
projectors $`P_\pm(w)`$ exist and remain bounded. Also
$`|\lambda_+(w)/a|\le1+C_0|w|`$ and
$`|\lambda_-(w)/a|\le1/2`$ after reducing that disc. Therefore

```math
a^{-f}M(w)^f=
(\lambda_+(w)/a)^fP_+(w)+
(\lambda_-(w)/a)^fP_-(w)
```

is uniformly bounded on $`|w|\le c/f`$. Equation (4) makes
$`a^{-3f}Q_f(w)`$ uniformly bounded there. Cauchy's derivative estimate
on concentric discs gives (6).

### Concentration one edge below a perfect matching

Choose activity $`z_f=2^f`$, so $`w_f=2^{-f}`$ and
$`\varepsilon_f=w_f^2`$. Equations (5)–(6) imply

```math
\frac{Q_f(w_f)}{a^{3f}}=16w_f+O(f^2w_f^2),
\qquad
\frac{Q_f'(w_f)}{a^{3f}}=16+O(f^2w_f).
```

The coefficients of $`Q_f`$ are the weighted matching counts indexed by
the defect $`L=n-K`$. Thus at $`w_f`$,

```math
\mathbb E L=\frac{w_fQ_f'(w_f)}{Q_f(w_f)}
=1+O(f^2 2^{-f}),
```

```math
\mathop{\mathrm{Var}}L=
\frac{w_fQ_f'(w_f)+w_f^2Q_f''(w_f)}{Q_f(w_f)}
-\left(\frac{w_fQ_f'(w_f)}{Q_f(w_f)}\right)^2
=O(f^2 2^{-f}).                                 \tag{7}
```

Consequently

```math
V_f\longrightarrow0,
\qquad
\frac{\mu_f(n-\mu_f)}{n+\mu_f}\longrightarrow\frac12.
```

Inequality (1) therefore fails for every sufficiently large $`f`$ at
$`z_f=2^f`$. This proves an infinite-family obstruction. It leaves the
restricted question $`0<z\le2`$ untouched.

## Checks, sources, and remaining gap

The companion checker verifies (3) against independent subset enumeration
for the first two matrices. It checks (5) by exact polynomial transfer,
and confirms an exact rational violation of the unrestricted auxiliary
bound. These checks concern the displayed algebra. The proof of the
infinite-family statement is the analytic estimate above.

The Jerrum construction and its role in disproving coefficient-ratio
shortcuts are prior work. A primary source is I. M. Wanless,
*The Holens–Đoković conjecture on permanents fails!*, Linear Algebra
and its Applications 295 (1999), 275–285,
[author PDF](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf).
The weighted transfer is already in this repository; no new claim is made
for that construction.

The ordinary matching-size distribution is a sum of independent Bernoulli
variables by the Heilmann–Lieb real-root theorem. This fact, and the
coefficient/pressure lower bounds in P. Csikvári,
*Lower matching conjecture, and a new proof of Schrijver's and Gurvits's
theorems*, J. Eur. Math. Soc. 19 (2017), 1811–1844,
[primary text](https://ems.press/content/serial-article-files/32217), do not
themselves prove (1). A pressure inequality cannot be differentiated twice
without further information.

The remaining mathematical target is a proof or counterexample to (1)
on $`0<z\le2`$, or a direct curvature inequality that avoids (1).
No solution to that target was obtained in this checkpoint.
