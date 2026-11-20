# Simon's Le Roy complete-monotonicity conjecture

## Status and source

This alternative proof establishes an interval of counterexamples analytically. Separate internal reviews of the full written argument found no gap. The shorter explicit construction is in [EXPLICIT_PROOF.md](EXPLICIT_PROOF.md); it uses Dufresne's earlier method. The argument below instead proves positivity by a density perturbation. No numerical evaluation enters either proof. The source and priority audit is recorded in [NOVELTY.md](NOVELTY.md), including its access limits.

The source is Thomas Simon, *Remark on a Mittag-Leffler function of Le Roy type*, arXiv:2012.11018v2, Section 3, printed pages 5–6; published in *Integral Transforms and Special Functions* 33(2) (2022), 108–114, DOI [10.1080/10652469.2021.1913138](https://doi.org/10.1080/10652469.2021.1913138). The [primary preprint](https://arxiv.org/pdf/2012.11018) states the conjecture for every positive $\alpha,\beta,\gamma$:

```math
F_{\alpha,\beta}^{(\gamma)}(-x)\text{ is completely monotone on }(0,\infty)
\quad\Longleftrightarrow\quad
z+\gamma(z^{\beta-\alpha}-z^\beta)\leq1\quad(0\lt z\lt1),
\tag{1}
```

where

```math
F_{\alpha,\beta}^{(\gamma)}(z)
=\sum_{n=0}^{\infty}\frac{z^n}{\Gamma(\beta+\alpha n)^\gamma}.
```

The sufficiency direction in (1) is already proved in the source. We disprove necessity. The separate question about convexity of the parameter threshold is not the subject of this proof.

## 1. The counterexample theorem

Put $a=1/3$, $b=2/3$, and define

```math
\beta_0=\inf\{\beta\gt a:
2w^{3\beta-1}\leq1+w+w^2\text{ for every }0\lt w\lt1\}.
\tag{2}
```

**Theorem.** One has $a\lt\beta_0\lt1/2$. There exists $\varepsilon\gt0$ such that, for every

```math
\beta_0-\varepsilon\lt\beta\lt\beta_0,
```

the function $F_{1/3,\beta}^{(2)}(-x)$ is completely monotone on $(0,\infty)$, but the right-hand condition in (1) fails. In particular, Simon's conjecture is false.

The theorem gives a parameter interval, not a single computed example. The threshold in (2) is defined by an explicit scalar inequality. The argument below proves existence of the interval without estimating its width.

### The threshold

For $\alpha=1/3$ and $\gamma=2$, the substitution $z=w^3$ changes the right-hand condition in (1) into

```math
w^3+2w^{3\beta-1}(1-w)\leq1
\quad\Longleftrightarrow\quad
2w^{3\beta-1}\leq1+w+w^2.
\tag{3}
```

For $\beta=a$, the inequality fails, for example at $w=1/4$. Continuity at this fixed $w$ gives a number $d\gt0$ for which it still fails when $a\leq\beta\leq a+d$. Thus $\beta_0\gt a$.

At $\beta=1/2$,

```math
1+w+w^2-2\sqrt w=(1-\sqrt w)^2+w^2\gt0
\qquad(0\leq w\leq1).
```

This continuous function has a positive minimum on $[0,1]$. The expression $w^{3\beta-1}$ is jointly continuous on $[0,1]$ times any compact parameter interval contained in $(a,\infty)$. Therefore the inequality also holds for some $\beta\lt1/2$.

For each fixed $w\in(0,1)$, its left-hand side decreases with $\beta$. The admissible set is an upper interval and is closed within $(a,\infty)$, being an intersection of closed sets. Consequently $a\lt\beta_0\lt1/2$, and $\beta_0$ itself is admissible. Every $\beta\in(a,\beta_0)$ violates (3).

## 2. A signed density with an exact Mellin transform

For $\beta\in(a,1/2)$, set

```math
G_\beta(s)=
\frac{\Gamma(s+a)\Gamma(s+b)\Gamma(s+1)}{\Gamma(s+\beta)^2},
\qquad
C_\beta=\frac1{\Gamma(\beta+1-a)\Gamma(\beta+1-b)},
```

and

```math
P_\beta(z)=z^2+(2\beta-3)z+(\beta-1)^2.
\tag{4}
```

For $y\gt0$, define the real, initially signed function

```math
f_\beta(y)=C_\beta\int_0^1\!\int_0^1
u^{a-2}v^{b-2}(1-u)^{\beta-a}(1-v)^{\beta-b}
e^{-y/(uv)}P_\beta\!\left(\frac{y}{uv}\right)\,du\,dv.
\tag{5}
```

The integral converges absolutely. At $u=1$ and $v=1$, the exponents exceed $-1$. At either zero endpoint, the exponential factor dominates all negative powers. This also proves joint continuity in $(\beta,y)$ on $(a,1/2)\times(0,\infty)$, by dominated convergence on compact subsets.

**Lemma 1.** For every complex $s$ with $\mathop{\mathrm{Re}}s\gt-a$,

```math
\int_0^\infty y^s f_\beta(y)\,dy=G_\beta(s).
\tag{6}
```

The corresponding integral with $y^{\mathop{\mathrm{Re}}s}|f_\beta(y)|$ is finite.

**Proof.** For $r\gt-a$, integrate the absolute value of the defining integrand against $y^r\,dy$. With $z=y/(uv)$, it is bounded by a constant times the product of the finite integrals

```math
\int_0^1 u^{a+r-1}(1-u)^{\beta-a}\,du,
\qquad
\int_0^1 v^{b+r-1}(1-v)^{\beta-b}\,dv,
\qquad
\int_0^\infty z^r e^{-z}(1+z^2)\,dz.
```

Thus Fubini applies. Direct calculation gives

```math
\begin{aligned}
\int_0^\infty z^s e^{-z}P_\beta(z)\,dz
&=\Gamma(s+3)+(2\beta-3)\Gamma(s+2)+(\beta-1)^2\Gamma(s+1)\\
&=\Gamma(s+1)(s+\beta)^2.
\end{aligned}
\tag{7}
```

The two remaining beta integrals are

```math
\frac{\Gamma(s+a)\Gamma(\beta+1-a)}{\Gamma(s+\beta+1)}
\quad\hbox{and}\quad
\frac{\Gamma(s+b)\Gamma(\beta+1-b)}{\Gamma(s+\beta+1)}.
```

Multiplying these expressions, (7), and $C_\beta$ proves (6), since
$\Gamma(s+\beta+1)=(s+\beta)\Gamma(s+\beta)$. All arguments have positive real part where the beta integrals are used. This proves the lemma.

Formula (5) can also be obtained from the ordinary positive beta-beta-exponential mixture for $G_{\beta+1}$ by applying $((\beta-1)-y\,d/dy)^2$. The direct proof above avoids any boundary assumptions in that differentiation argument.

## 3. Uniform positivity near zero and infinity

Fix a compact interval $K=[\beta_-,\beta_+]\subset(a,1/2)$ with $\beta_0$ in its interior.

**Lemma 2.** There exists $\delta\in(0,1)$ such that

```math
f_\beta(y)\gt0
\qquad\hbox{for every }\beta\in K
\hbox{ and every }y\in(0,\delta]\cup[4,\infty).
\tag{8}
```

**Proof at infinity.** For $\beta\gt0$ and $z\geq4$,

```math
P_\beta(z)=z(z-3)+2\beta z+(\beta-1)^2\gt0.
```

If $y\geq4$, then $y/(uv)\geq4$ throughout (5), and all its other factors are positive. Hence $f_\beta(y)\gt0$.

**Proof at zero.** In the inner integral in (5), set $u=y/(vz)$. This gives

```math
\begin{aligned}
y^{1-a}f_\beta(y)
=C_\beta\int_0^1 v^{b-a-1}(1-v)^{\beta-b}
\int_{y/v}^{\infty}
z^{-a}e^{-z}P_\beta(z)
\left(1-\frac{y}{vz}\right)^{\beta-a}\,dz\,dv.
\end{aligned}
\tag{9}
```

For $\beta\in K$, the last factor lies in $[0,1]$. Extend the inner integrand by zero when $vz\leq y$. Its absolute value is bounded uniformly in $\beta$ and $y$ by a constant times

```math
v^{b-a-1}(1-v)^{\beta_- -b}\,z^{-a}e^{-z}(1+z^2),
```

which is integrable on $(0,1)\times(0,\infty)$. For each fixed $v,z\gt0$, the factor with $y$ converges to $1$ uniformly for $\beta\in K$. Taking the supremum over $\beta$ in the dominated-convergence estimate proves that the convergence in (9) is uniform on $K$.

The limit factors into a beta integral and a gamma integral:

```math
\begin{aligned}
\lim_{y\downarrow0}y^{1-a}f_\beta(y)
&=C_\beta
\frac{\Gamma(b-a)\Gamma(\beta+1-b)}{\Gamma(\beta+1-a)}
\int_0^\infty z^{-a}e^{-z}P_\beta(z)\,dz\\
&=C_\beta
\frac{\Gamma(b-a)\Gamma(\beta+1-b)}{\Gamma(\beta+1-a)}
\Gamma(1-a)(\beta-a)^2\\
&=\frac{\Gamma(b-a)\Gamma(1-a)}{\Gamma(\beta-a)^2}.
\end{aligned}
\tag{10}
```

The second equality is (7) with $s=-a$. The final expression is continuous and strictly positive on $K$, so its minimum is positive. Uniform convergence proves the assertion near zero.

## 4. Strict positivity at the threshold

The source proves existence of the infinitely divisible Mellin law under its scalar inequality. We include the relevant construction and a strict-positivity argument, since mere nonnegativity would not suffice for the parameter perturbation.

For $t\gt0$, write

```math
R_\beta(t)=e^{-at}+e^{-bt}+e^{-t}-2e^{-\beta t}.
```

The standard gamma integral gives, for $\mathop{\mathrm{Re}}s\gt-a$,

```math
\log\frac{G_\beta(s)}{G_\beta(0)}
=\kappa_\beta s+
\int_0^\infty(e^{-st}-1+st)
\frac{R_\beta(t)}{t(1-e^{-t})}\,dt,
\tag{11}
```

where $\kappa_\beta=\psi(a)+\psi(b)+\psi(1)-2\psi(\beta)$ and $\psi=\Gamma'/\Gamma$. The integral converges because the numerator of the compensating expression is $O(t^2)$ at zero and $R_\beta(t)$ decays exponentially at infinity. The same gamma integral is the basis of Section 2 of Simon's paper.

If $w=e^{-t/3}$, then

```math
R_{\beta_0}(t)=w\bigl(1+w+w^2-2w^{3\beta_0-1}\bigr)\geq0.
```

Consequently (11), at $s=i\xi$, is a Lévy–Khintchine exponent: it defines an infinitely divisible probability law on the real line with characteristic function

```math
\Phi(\xi)=\frac{G_{\beta_0}(i\xi)}{G_{\beta_0}(0)}.
\tag{12}
```

The gamma asymptotic on vertical lines yields

```math
|\Phi(\xi)|
=O\!\left((1+|\xi|)^{3/2-2\beta_0}e^{-\pi|\xi|/2}\right).
\tag{13}
```

Thus the law has a continuous density, extending holomorphically to every strip $|\mathop{\mathrm{Im}}z|\lt c\lt\pi/2$ by Fourier inversion.

To identify this density, Lemma 1 shows that the finite signed measure

```math
\frac{e^x f_{\beta_0}(e^x)}{G_{\beta_0}(0)}\,dx
```

has the same characteristic function (12). Uniqueness of the Fourier transform for finite measures identifies it with the probability law. Its displayed density is continuous, so it is nonnegative at every point.

We now prove that it is strictly positive at every point. Let

```math
\nu(dt)=\frac{R_{\beta_0}(t)}{t(1-e^{-t})}\,dt,
\qquad t\gt0,
```

where the actual jumps in the real variable have size $-t$. Because $R_{\beta_0}(0)=1$ by continuity, choose an interval $J=[r,2r]\subset(0,\infty)$ on which $R_{\beta_0}$ is positive. Let $\eta$ be half the restriction of $\nu$ to $J$, and put $\lambda=\eta(J)\gt0$.

Subtracting $\eta$ from the Lévy measure, with the corresponding drift adjustment, produces a probability law with characteristic function

```math
\Phi_*(\xi)=\Phi(\xi)
\exp\left(-\int_J(e^{-i\xi t}-1)\,\eta(dt)\right).
```

Since $|\Phi_*(\xi)|\leq e^{2\lambda}|\Phi(\xi)|$, this remaining law has a nonnegative real-analytic density $g$, by (13). Its integral is $1$, so it is not identically zero.

The original law is the convolution of this remaining law with the compound-Poisson law whose jump intensity is $\eta$ and whose jump sizes are $-t$. Fourier inversion makes $g$ bounded and uniformly continuous. Its convolution with that probability measure is therefore continuous, so its equality with $p$ holds pointwise, not merely almost everywhere. The compound-Poisson expansion gives

```math
p(x)\geq e^{-\lambda}\int_J g(x+t)\,\eta(dt).
\tag{14}
```

All terms in the compound-Poisson expansion are nonnegative. If $p(x_0)=0$, then the integral in (14) is zero. The density of $\eta$ is strictly positive on the interior of $J$. Continuity and nonnegativity of $g$ imply that $g$ vanishes on the nonempty interval $x_0+\mathop{\mathrm{int}}J$. Real analyticity would force $g$ to be identically zero, a contradiction.

Hence $p(x)\gt0$ for every real $x$, and the identification above gives

```math
f_{\beta_0}(y)\gt0\qquad(y\gt0).
\tag{15}
```

## 5. Positivity persists below the threshold

Choose $K$ and $\delta$ as in Lemma 2. On the compact interval $[\delta,4]$, the continuous, strictly positive function $f_{\beta_0}$ has a positive minimum. Joint continuity of $f_\beta(y)$ on $K\times[\delta,4]$ therefore gives $\varepsilon\gt0$ such that

```math
f_\beta(y)\gt0
\quad\hbox{whenever}\quad
|\beta-\beta_0|\lt\varepsilon,
\quad \delta\leq y\leq4.
```

Shrink $\varepsilon$ so that this parameter interval lies in $K$. Lemma 2 supplies positivity on the rest of $(0,\infty)$. Thus

```math
f_\beta(y)\gt0\quad(y\gt0)
\qquad\hbox{for all }|\beta-\beta_0|\lt\varepsilon.
\tag{16}
```

For each such $\beta$, Lemma 1 at $s=0$ shows that
$f_\beta/G_\beta(0)$ is a probability density. Let $Y_\beta$ have this density and set

```math
X_\beta=3Y_\beta^{1/3}.
```

Gauss's triplication formula gives, for every real $s\geq0$,

```math
\mathbb E[X_\beta^s]
=3^s\frac{G_\beta(s/3)}{G_\beta(0)}
=\Gamma(1+s)\frac{\Gamma(\beta)^2}{\Gamma(\beta+s/3)^2}.
\tag{17}
```

In particular, for every $t\geq0$, monotone convergence applied to the exponential series and (17) gives

```math
\mathbb E[e^{tX_\beta}]
=\Gamma(\beta)^2\sum_{n=0}^\infty
\frac{t^n}{\Gamma(\beta+n/3)^2}
=\Gamma(\beta)^2F_{1/3,\beta}^{(2)}(t)\lt\infty.
```

The series is entire, as follows directly from Stirling's formula. Thus the exponential series at $-x$ can also be integrated absolutely, and

```math
F_{1/3,\beta}^{(2)}(-x)
=\frac1{\Gamma(\beta)^2}\mathbb E[e^{-xX_\beta}]
\qquad(x\gt0).
\tag{18}
```

This is a Laplace transform of a positive finite measure, and hence is completely monotone. Equivalently, differentiating under the expectation gives
$(-1)^n(d/dx)^n F_{1/3,\beta}^{(2)}(-x)
=\Gamma(\beta)^{-2}\mathbb E[X_\beta^n e^{-xX_\beta}]\geq0$ for every integer $n\geq0$.

For $\beta_0-\varepsilon\lt\beta\lt\beta_0$, the defining minimality of $\beta_0$ says that (3) fails at some $w\in(0,1)$. By the equivalence in (3), the original necessary condition in (1) fails at $z=w^3$. This proves the theorem.

## 6. What the proof establishes

The argument disproves the full universal equivalence stated in Simon's conjecture. It also supplies positive random variables with precisely the Mellin transform in Simon's source whose logarithms are not infinitely divisible: their unique signed Lévy expression (11) has a negative part because (3) fails. This last interpretation is not needed for the contradiction to (1).

The proof does not classify every admissible parameter triple. Such a classification is unnecessary for a disproof of the proposed characterization. It does not claim the already-known sufficiency direction, the gamma integral, Fourier uniqueness, or Gauss's multiplication formula as new.

The source and priority audit are recorded separately in [NOVELTY.md](NOVELTY.md). The bounded search found no earlier resolution of this exact conjecture. The internal reviews establish the reviewers' mathematical conclusion; they do not certify worldwide priority or constitute external peer review.
