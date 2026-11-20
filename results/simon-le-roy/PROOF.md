# Simon's Le Roy complete-monotonicity conjecture

## Result and attribution

Simon conjectured that, for all positive $\alpha,\beta,\gamma$,

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

This is the unnumbered conjecture in Section 3 of Thomas Simon, *Remark on a Mittag-Leffler function of Le Roy type*, [arXiv:2012.11018v2](https://arxiv.org/pdf/2012.11018), printed pages 5–6; *Integral Transforms and Special Functions* 33(2) (2022), 108–114, [DOI 10.1080/10652469.2021.1913138](https://doi.org/10.1080/10652469.2021.1913138). The source already proves sufficiency of the scalar inequality.

We disprove necessity by an explicit interval of parameters. Put

```math
\beta_* =\frac{13}{30},
\qquad
\beta_1=\frac13\left(1+\frac{\log(32/21)}{\log4}\right).
```

**Theorem.** The function $F_{1/3,\beta}^{(2)}(-x)$ is completely monotone on $(0,\infty)$ for every $\beta\geq\beta_*$. Moreover, $\beta_*\lt\beta_1\lt1/2$, and every

```math
\beta\in[\beta_*,\beta_1)
\tag{2}
```

violates the claimed necessary inequality in (1), already at $z=1/64$. Hence Simon's conjecture is false.

The probability construction used below is an application of **Dufresne's 2010 construction**, Theorem 6.3, including its converse, in *G distributions and the beta-gamma algebra*, *Electronic Journal of Probability* 15, no. 71, 2163–2199, printed pages 2187–2188. The [primary published PDF](https://emis.de/ft/42731) is freely available. We give the construction in full for these parameters. Neither that general construction nor the standard beta-gamma product rules are claimed as new. The contribution documented here is the exact specialization and its consequence for Simon's later conjecture.

An independent proof by density perturbation, using no Dufresne construction, is preserved in [ALTERNATIVE_PROOF.md](ALTERNATIVE_PROOF.md). The literature audit is separate from either mathematical argument.

## 1. An exact positive Laplace transform

Let $a=1/3$, $b=2/3$, and define, for $s\geq0$,

```math
R(s)=\frac{(s+\beta_*)^2(s+2)}{(s+a)(s+b)(s+1)}.
```

Its partial fractions are

```math
R(s)=1+\frac{A}{s+a}+\frac{B}{s+b}+\frac{C}{s+1},
\qquad
A=\frac3{40},\quad B=-\frac{49}{75},\quad C=\frac{289}{200}.
\tag{3}
```

Although $B$ is negative, the inverse Laplace density is strictly positive:

```math
r(t)=e^{-t/3}\bigl(A+B e^{-t/3}+C e^{-2t/3}\bigr),
\qquad t\gt0.
\tag{4}
```

Indeed, $C\gt0$ and

```math
B^2-4AC=-\frac{599}{90000}\lt0.
\tag{5}
```

The quadratic $A+Bu+Cu^2$ is therefore positive for every real $u$. In particular, (4) is positive. Equations (3) and (4) imply

```math
R(s)=1+\int_0^\infty e^{-st}r(t)\,dt,
\qquad
R(0)=\frac{169}{100}.
\tag{6}
```

Thus $R(s)/R(0)$ is a Laplace transform of a probability measure: its atom at zero has mass $100/169$, and its continuous part has density $100r(t)/169$.

## 2. Dufresne's tilted-product construction

For each integer $j\geq0$, let $T_j$ be an independent nonnegative random variable with law

```math
\mathbb P(T_j\in dt)
=\frac1{R(j)}\delta_0(dt)
+\frac{e^{-jt}r(t)}{R(j)}\,dt.
\tag{7}
```

Here the continuous term is on $(0,\infty)$. Equation (6) shows that (7) has total mass $1$, and its Laplace transform is $R(j+s)/R(j)$.

The means are summable. Since $R(j)\geq1$, (4) gives

```math
\mathbb E[T_j]
=\frac{\int_0^\infty t e^{-jt}r(t)\,dt}{R(j)}
\leq
\frac{|A|}{(j+a)^2}+\frac{|B|}{(j+b)^2}+\frac{|C|}{(j+1)^2}.
\tag{8}
```

All three series on the right converge. Tonelli's theorem therefore gives
$\mathbb E[\sum_{j\geq0}T_j]\lt\infty$, so

```math
S=\sum_{j=0}^{\infty}T_j\lt\infty\quad\hbox{almost surely},
\qquad U=e^{-S}\in(0,1].
```

Independence and bounded convergence give, for every real $s\geq0$,

```math
\mathbb E[U^s]=\prod_{j=0}^{\infty}\frac{R(j+s)}{R(j)}.
\tag{9}
```

To evaluate the product, use $(c)_s=\Gamma(c+s)/\Gamma(c)$. In a finite product through $j=N$, collect the three numerator and three denominator factors in $R$. The identities for products of consecutive factors, followed by
$\Gamma(N+c+s)/\Gamma(N+c)\sim N^s$, yield

```math
\mathbb E[U^s]
=\frac{(a)_s(b)_s(1)_s}{(\beta_*)_s^2(2)_s}.
\tag{10}
```

For completeness, the finite product before passage to the limit is

```math
\prod_{j=0}^{N}\frac{R(j+s)}{R(j)}
=
\prod_{c\in(\beta_*,\beta_*,2)}\frac{(c+s)_{N+1}}{(c)_{N+1}}
\prod_{d\in(a,b,1)}\frac{(d)_{N+1}}{(d+s)_{N+1}}.
\tag{11}
```

The factors involving $N$ cancel asymptotically because the two parameter lists have equal length. Their remaining gamma factors give (10). All parameters are positive, so the calculation uses no continuation across a gamma pole.

Let $Z$ be independent of $U$ with gamma density $z e^{-z}$ on $(0,\infty)$, and set $Y_*=UZ$. Its moments satisfy

```math
\mathbb E[Y_*^s]
=\frac{(a)_s(b)_s(1)_s}{(\beta_*)_s^2}
=\frac{G_{\beta_*}(s)}{G_{\beta_*}(0)},
\qquad
G_\beta(s)=\frac{\Gamma(s+a)\Gamma(s+b)\Gamma(s+1)}{\Gamma(s+\beta)^2}.
\tag{12}
```

The factor $(2)_s$ cancels because $\mathbb E[Z^s]=(2)_s$.

## 3. Extension in the parameter and complete monotonicity

For $\beta\gt\beta_*$, take two independent beta random variables $B_1,B_2$ with parameters $(\beta_*,\beta-\beta_*)$, also independent of $Y_*$. Their moments are

```math
\mathbb E[B_i^s]=\frac{(\beta_*)_s}{(\beta)_s}\qquad(s\geq0).
```

Set $Y_\beta=Y_*B_1B_2$. At $\beta=\beta_*$, use $Y_{\beta_*}=Y_*$. Equation (12) now gives, for every $\beta\geq\beta_*$,

```math
\mathbb E[Y_\beta^s]
=\frac{(a)_s(b)_s(1)_s}{(\beta)_s^2}
=\frac{G_\beta(s)}{G_\beta(0)}.
\tag{13}
```

Define $X_\beta=3Y_\beta^{1/3}$. Gauss's triplication formula gives

```math
\mathbb E[X_\beta^s]
=3^s\frac{G_\beta(s/3)}{G_\beta(0)}
=\Gamma(1+s)\frac{\Gamma(\beta)^2}{\Gamma(\beta+s/3)^2}
\qquad(s\geq0).
\tag{14}
```

For $t\geq0$, monotone convergence applied to the exponential series yields

```math
\mathbb E[e^{tX_\beta}]
=\Gamma(\beta)^2\sum_{n=0}^{\infty}
\frac{t^n}{\Gamma(\beta+n/3)^2}
=\Gamma(\beta)^2F_{1/3,\beta}^{(2)}(t)\lt\infty.
```

The series is entire by Stirling's formula. Its absolute convergence also justifies termwise expectation at $-x$, giving

```math
F_{1/3,\beta}^{(2)}(-x)
=\Gamma(\beta)^{-2}\mathbb E[e^{-xX_\beta}]
\qquad(x\gt0).
\tag{15}
```

This is a Laplace transform of a positive finite measure. Consequently it is completely monotone. Directly, for every integer $n\geq0$,

```math
(-1)^n\frac{d^n}{dx^n}F_{1/3,\beta}^{(2)}(-x)
=\Gamma(\beta)^{-2}\mathbb E[X_\beta^n e^{-xX_\beta}]\geq0.
```

The required differentiations follow from the finite positive exponential moments just established.

## 4. Failure of the proposed necessary condition

In (1), put $\alpha=1/3$, $\gamma=2$, and $z=w^3$. The scalar condition becomes

```math
w^3+2w^{3\beta-1}(1-w)\leq1
\quad\Longleftrightarrow\quad
2w^{3\beta-1}\leq1+w+w^2.
\tag{16}
```

At $w=1/4$, and hence $z=1/64$, this inequality fails exactly when

```math
2\,4^{1-3\beta}\gt\frac{21}{16}
\quad\Longleftrightarrow\quad
\beta\lt\frac13\left(1+\frac{\log(32/21)}{\log4}\right)=\beta_1.
\tag{17}
```

At $\beta=\beta_*=13/30$, raising the two positive sides of the left inequality in (17) to the tenth power reduces it to

```math
16^{11}-21^{10}=912305066215\gt0.
\tag{18}
```

Thus $\beta_*\lt\beta_1$. Since $32/21\lt2$, one also has $\beta_1\lt1/2$. Equations (15) and (17) prove the entire counterexample interval (2), and hence disprove (1).

## Scope

The theorem refutes a necessary condition in a universal characterization. It does not purport to classify every triple $(\alpha,\beta,\gamma)$, and it does not require numerical estimates of the Le Roy function or its derivatives.

The exact rational partial fractions, quadratic discriminant, normalization, and integer inequality can all be checked by rational arithmetic. The existence of the probability law and complete monotonicity are proved above for the full stated interval, not inferred from those finite checks.

The main proof is a fully credited application of Dufresne's general theorem. Separate internal reviews found no gap in the written argument. The bounded prior-resolution search located no earlier exact specialization or equivalent disproof; its inspected sources and access limits are recorded in [NOVELTY.md](NOVELTY.md). These are research-team reviews, not external peer review.
