# Ferreira–Simon's Wright log-concavity conjecture

Status: complete candidate disproof, under independent review and prior-resolution audit. This proof gives intervals of counterexamples. It does not infer a theorem from a finite numerical calculation.

## 1. Source and precise assertion

Ferreira and Simon define

```math
\phi(\rho,\beta,z)
=\sum_{n=0}^{\infty}\frac{z^n}{n!\Gamma(\beta+\rho n)},
\qquad \rho>-1.
```

The reciprocal gamma function is interpreted by its entire extension, including its zeros at the nonpositive integers. For $0\leq\alpha<1$ and $\beta\geq0$, their random variable $M_{\alpha,\beta}$ has density

```math
p_{\alpha,\beta}(x)
=\Gamma(\alpha+\beta)\phi(-\alpha,\beta,-x),
\qquad x>0.
```

For $0<\beta<1$, their Theorem D defines $\alpha_*(\beta)$ as the unique root in $(0,1)$ of

```math
\frac{1}{\Gamma(\beta-\alpha)^2}
-\frac{1}{\Gamma(\beta)\Gamma(\beta-2\alpha)}=0.
\tag{1}
```

Their proof in §5.1 shows that the left side is positive for $0<\alpha<\alpha_*(\beta)$ and negative for $\alpha_*(\beta)<\alpha<1$. They set $\alpha_*(0)=1$, and also set $\alpha_*(\beta)=1$ for $\beta\geq1$.

The unnumbered conjecture in §6.4 asserts, for all admissible parameters,

```math
\alpha\leq\alpha_*(\beta)
\quad\Longleftrightarrow\quad
M_{\alpha,\beta}\text{ has a log-concave density}
\quad\Longleftrightarrow\quad
t\longmapsto\frac{1}{E_{\alpha,\alpha+\beta}(-t)}
\text{ is convex on }\mathbb R_+.
\tag{2}
```

Here $E_{\alpha,\gamma}(z)=\sum_{n\geq0}z^n/\Gamma(\gamma+\alpha n)$.

Source: R. A. C. Ferreira and T. Simon, *On the log-concavity of the Wright function*, Constructive Approximation **60** (2024), 309–338, [DOI](https://doi.org/10.1007/s00365-023-09666-w). The accessible primary [arXiv v2](https://arxiv.org/pdf/2212.07974) has Theorem D on printed page 5, its relevant proof on pages 15–16, and the conjecture on pages 23–24.

## 2. Counterexample families

**Theorem.** Both of the following statements hold.

1. For every sufficiently small $t>0$, the parameters

   ```math
   \alpha=1-t,\qquad\beta=0
   \tag{3}
   ```

   satisfy $\alpha<\alpha_*(0)=1$, but $p_{\alpha,0}$ is not log concave.

2. For every sufficiently small $t>0$, the parameters

   ```math
   \alpha=1-3t,\qquad\beta=t
   \tag{4}
   ```

   satisfy $\alpha<\alpha_*(\beta)$, but $p_{\alpha,\beta}$ is not log concave.

In both cases the log-concavity inequality fails at $x=1/2$. Thus the first implication in (2) is false, including at interior parameters with $\beta>0$.

## 3. A locally uniform limit

Fix $a>0$ and $b\geq0$. For $t>0$ sufficiently small, put

```math
f_t(x)=\phi(-(1-at),bt,-x)
=\sum_{n=0}^{\infty}
\frac{(-1)^n x^n}{n!\Gamma(-n+(an+b)t)}.
\tag{5}
```

We prove that, on every closed disk $|x|\leq r<1$, $f_t/t$ and each of its fixed-order derivatives converge uniformly to those of

```math
h_{a,b}(x)=\sum_{n=0}^{\infty}(an+b)x^n
=\frac{b+(a-b)x}{(1-x)^2}.
\tag{6}
```

Write $u_n=(an+b)t$. For $n\geq1$, the reflection formula gives

```math
\frac{(-1)^n}{t\,n!\Gamma(-n+u_n)}
=\frac{\Gamma(n+1-u_n)}{n!}
  \frac{\sin(\pi u_n)}{\pi t}.
\tag{7}
```

This formula also holds when $-n+u_n$ is an integer, by continuity of $1/\Gamma$. Choose $0<t<1/(a+b)$. Since $n\geq1$,

```math
0<u_n<n,\qquad 1<n+1-u_n<n+1.
```

Gamma is positive and log convex on the positive half-line. Its values at the endpoints of $[1,n+1]$ are $1$ and $n!$. Hence

```math
0<\Gamma(n+1-u_n)\leq n!.
```

Using $|\sin v|\leq|v|$ in (7), we obtain the bound

```math
\left|\frac{(-1)^n}{t\,n!\Gamma(-n+(an+b)t)}\right|
\leq an+b,
\qquad n\geq1.
\tag{8}
```

For each fixed $n\geq1$, the right side of (7) tends to $an+b$ as $t\downarrow0$. At $n=0$, the coefficient equals

```math
\frac{1}{t\Gamma(bt)}=\frac{b}{\Gamma(1+bt)}
\quad (b>0),
```

which tends to $b$ and stays bounded near $t=0$. It is identically zero if $b=0$.

For any fixed derivative order $j$, the differentiated terms with $n\geq\max(1,j)$ are dominated on $|x|\leq r$ by

```math
(an+b)n(n-1)\cdots(n-j+1)r^{n-j}.
```

The sum of these bounds is finite for every $0<r<1$. Dominated convergence for the power series proves the assertion, in particular convergence of the first two derivatives. No expansion uniform in $n$ is assumed; inequality (8) supplies the required uniform domination.

## 4. The curvature calculation

For a positive twice differentiable function $f$, log concavity requires

```math
\Psi_f(x):=f'(x)^2-f(x)f''(x)\geq0,
```

because $(\log f)''=-\Psi_f/f^2$. By the limit just proved,

```math
\frac{\Psi_{f_t}(x)}{t^2}
\longrightarrow
\Psi_{h_{a,b}}(x)
```

locally uniformly for $|x|<1$. Direct differentiation of (6) gives

```math
\Psi_{h_{a,b}}(x)
=\frac{a^2-2ab-b^2-2(a^2-b^2)x-(a-b)^2x^2}{(1-x)^6}.
\tag{9}
```

In particular,

```math
\Psi_{h_{a,b}}(0)=a^2-2ab-b^2,
\qquad
\Psi_{h_{a,b}}(1/2)=-16(a^2+6ab+b^2)<0.
\tag{10}
```

For the boundary family (3), take $a=1,b=0$. Then

```math
h_{1,0}(x)=\frac{x}{(1-x)^2},
\qquad
(h_{1,0},h_{1,0}',h_{1,0}'')(1/2)=(2,12,80),
```

so $\Psi_{f_t}(1/2)/t^2\to-16$. It follows that $\Psi_{f_t}(1/2)<0$ for all sufficiently small positive $t$. The source's extension $\alpha_*(0)=1$ makes the threshold condition automatic.

For the interior family (4), take $a=3,b=1$. Then

```math
h_{3,1}(x)=\frac{1+2x}{(1-x)^2},
\qquad
(h_{3,1},h_{3,1}',h_{3,1}'')(0)=(1,4,14),
```

and

```math
(h_{3,1},h_{3,1}',h_{3,1}'')(1/2)=(8,40,256).
```

Consequently,

```math
\frac{\Psi_{f_t}(0)}{t^2}\longrightarrow2>0,
\qquad
\frac{\Psi_{f_t}(1/2)}{t^2}\longrightarrow-448<0.
\tag{11}
```

The first expression is exactly

```math
\Psi_{f_t}(0)
=\frac{1}{\Gamma(\beta-\alpha)^2}
-\frac{1}{\Gamma(\beta)\Gamma(\beta-2\alpha)}.
\tag{12}
```

For sufficiently small $t>0$, we have $0<\beta<1$, $0<\alpha<1$, and (12) is strictly positive. By the source's unique-threshold characterization, $\alpha<\alpha_*(\beta)$. The second limit in (11) gives the failure of log concavity at $1/2$.

Finally, $p_{\alpha,\beta}=\Gamma(\alpha+\beta)f_t$ multiplies $\Psi_{f_t}$ by the positive number $\Gamma(\alpha+\beta)^2$. Both sign conclusions therefore hold for the normalized probability density. This proves the theorem.

## 5. Scope

More generally, every fixed $a>0,b\geq0$ satisfying $a^2>2ab+b^2$ gives the same counterexample family $\alpha=1-at,\beta=bt$ for all sufficiently small $t>0$. If $b>0$, this condition is $a/b>1+\sqrt2$; if $b=0$, it always holds. Equations (8)–(12) prove this statement without further estimates.

The proof disproves the complete conjectured equivalence by disproving its threshold-to-density implication. It makes no claim about the remaining equivalence between density log concavity and reciprocal Mittag–Leffler convexity at parameters outside the theorem. No explicit numerical value of a small parameter is needed: the strict limiting signs prove an interval of admissible counterexamples.
