# Sun–Zhao's conjecture

Status: proposed complete disproof of Conjecture 5.2 of arXiv:1602.04359v4. An independent mathematical and primary-source review has passed. The prior-resolution audit is recorded in `NOVELTY.md`; it found no earlier settlement in the sources examined and explicitly records its access limits. The conjectures numbered 5.1 and 5.3 in that source are different assertions and are not settled here.

## Source statement and indexing

Brian Y. Sun and James J. Y. Zhao, *Log-behavior of two sequences related to the elliptic integrals*, [arXiv:1602.04359v4](https://arxiv.org/pdf/1602.04359), printed page 14, define

```math
\mathcal R(a)_n=\frac{a_{n+1}}{a_n}
```

and conjecture that for every integer $`k\ge1`$, the sequence $`\mathcal R^k(P)`$, after its first $`k`$ terms are omitted, is log-concave when $`k`$ is odd and log-convex when $`k`$ is even. A rendered image of that page has been inspected. The Catalan–Larcombe–French numbers are defined in equation (1.1) by

```math
P_0=1,\quad P_1=8,\qquad
 n^2P_n=8(3n^2-3n+1)P_{n-1}-128(n-1)^2P_{n-2}.
 \tag{1}
```

The assertion after deleting the first $`k`$ terms concerns indices $`n\ge k`$. In particular, its inequality at center $`k+1`$ uses three retained entries at $`k,k+1,k+2`$.

Let $`\Delta f(n)=f(n+1)-f(n)`$. Since all relevant numbers are positive,

```math
\log \mathcal R^k(P)_n=\Delta^k\log P_n.
```

Thus at center $`n+1`$, log-convexity of $`\mathcal R^k(P)`$ is equivalent to
$`\Delta^{k+2}\log P_n\ge0`$, and log-concavity to the reverse inequality. The entire conjecture would imply

```math
(-1)^k\Delta^{k+2}\log P_n\ge0
 \qquad(k\ge1,\ n\ge k).
 \tag{2}
```

We disprove (2) at $`k=12,n=12`$. This is a counterexample to the universally quantified conjecture, not a claim that a single positive parameter case proves it.

## An exact certificate

Define

```math
D=\Delta^{14}\log P_{12}
 =\sum_{j=0}^{14}(-1)^j\binom{14}{j}\log P_{12+j}.
 \tag{3}
```

The recurrence (1) gives the following exact integers.

| $`n`$ | $`P_n`$ |
| ---: | ---: |
| 12 | 15008466534400 |
| 13 | 221460239482880 |
| 14 | 3287994183188480 |
| 15 | 49074667327062016 |
| 16 | 735814252604162048 |
| 17 | 11076827875597352960 |
| 18 | 167338264534131408896 |
| 19 | 2535936220929779040256 |
| 20 | 38539148242634697342976 |
| 21 | 587172319637401677856768 |
| 22 | 8966541774166044673310720 |
| 23 | 137211561613401637284478976 |
| 24 | 2103704833567570984242774016 |
| 25 | 32310152363853898923615715328 |
| 26 | 497042117469860910740195508224 |

An integer-only form of the certificate is

```math
\prod_{\substack{0\le j\le14\\j\text{ even}}}
 P_{12+j}^{\binom{14}{j}}
 <
 \prod_{\substack{0\le j\le14\\j\text{ odd}}}
 P_{12+j}^{\binom{14}{j}}.
 \tag{4}
```

The two products both have 582,535 binary digits. The checker constructs and compares them exactly. To make the sign independently checkable without displaying hundreds of thousands of digits, the following rational certificate establishes the stronger bound

```math
-\frac{185605}{10^{15}}\lt D<-\frac{185604}{10^{15}}<0.
 \tag{5}
```

## Rational proof of the sign

Put

```math
x_j=\frac{32P_{12+j}}{16^{12+j}},
 \qquad u_j=\frac{x_j-1}{x_j+1}.
```

The table gives $`|u_j|\le1/3`$ for each $`j`$. Constants and linear functions disappear under the fourteenth difference, so replacing $`\log P_{12+j}`$ in (3) by $`\log x_j`$ leaves $`D`$ unchanged.

For a rational $`u`$ with $`|u|<1`$,

```math
\log\frac{1+u}{1-u}
 =2\sum_{r=0}^{23}\frac{u^{2r+1}}{2r+1}+\epsilon(u),
 \qquad
 |\epsilon(u)|\le
 \frac{2|u|^{49}}{49(1-u^2)}.
```

Define the explicit rational numbers

```math
S=2\sum_{j=0}^{14}(-1)^j\binom{14}{j}
       \sum_{r=0}^{23}\frac{u_j^{2r+1}}{2r+1},
 \qquad
 E=\frac{2^{15}}{49(1-1/9)3^{49}}.
```

The triangle inequality and $`\sum_j\binom{14}{j}=2^{14}`$ give $`|D-S|\le E`$. Rational arithmetic using the displayed integers gives

```math
-\frac{185605}{10^{15}}\lt S-E,
 \qquad S+E<-\frac{185604}{10^{15}}.
```

These last comparisons are exact comparisons of integers after multiplication by positive denominators. The accompanying standard-library script implements precisely these formulas with `Fraction` and checks both strict inequalities. This proves (5), independently of any floating-point logarithm.

For $`k=12`$, the conjecture requires log-convexity. But (5) implies

```math
\mathcal R^{12}(P)_{13}^{\,2}
 >\mathcal R^{12}(P)_{12}\mathcal R^{12}(P)_{14}.
```

All three entries remain after the first twelve terms are omitted. The required log-convexity inequality is reversed. Therefore Conjecture 5.2 is false.

## Scope

The proof uses the exact positive source sequence and the stated truncation. It has no sign-convention issue and no undefined denominator. It does not assert that every iteration order at least twelve fails, though a separate exploratory calculation suggests that pattern. No such empirical extension is needed or counted.

The published version is *Acta Mathematicae Applicatae Sinica, English Series* 36 (2020), 590–602, DOI [10.1007/s10255-020-0952-1](https://doi.org/10.1007/s10255-020-0952-1). Its publisher metadata is accessible, but the full journal text was not available in this audit. The exact statement resolved here is the fully inspected latest arXiv version, Conjecture 5.2. Publication-stage wording is not presumed identical.
