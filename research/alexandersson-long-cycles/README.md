# Alexandersson's long-cycle conjecture

Status: active research; neither assertion is proved or disproved here.

Issue: [#81](https://github.com/1337isnot1337/solved-conjectures/issues/81).
Research date: 2026-11-20.

## Exact targets

For $k\geq3$, let $\mathfrak S_n^{(k)}$ consist of permutations all of whose cycles have length at least $k$.
Write $E_{n,k}(t)$ for their excedance polynomial and $D_{n,k}(t)$ for their ordinary descent polynomial.

Alexandersson's current [open-problem page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm#permutations-with-long-cycles) states two separate conjectures:

1. For every $k\geq3$ and $n\geq k$, $E_{n,k}$ is real-rooted, and $E_{n,k}\preceq E_{n+1,k}$.
2. For every $k\geq3$ and $n\geq k$, $D_{n,k}$ is real-rooted.

The source does not conjecture consecutive interlacing for the descent polynomials. It gives explicit failures of that stronger statement.

These are all-parameter targets. Proving a fixed value of $k$, or extending a finite verification range, would not resolve them and will not be counted as a result.

## Status search

Read the author's page dated 2026-11-19 and [arXiv:2609.07325v2](https://arxiv.org/html/2609.07325v2), dated 2026-10-24. The paper proves the $k=2$ descent statement. Its larger deletion-stable family is defined by a different recurrence and does not immediately cover a minimum cycle length restriction.

Searched both web engines for the author's name with long cycles and real-rootedness; cycles of length at least $k$ with descent/excedance real-rootedness; associated Eulerian polynomials; restricted-cycle Eulerian polynomials; and cyclic-permutation descent real-rootedness. The search found no resolution of either full assertion. This is a bounded literature check, not a guarantee of novelty.

An adjacent known real-rootedness theorem for associated permutations counts their **number of cycles**. That variable is not the excedance or descent statistic here.

## Excedance recurrence and its gamma form

Let $A_m(t)$ be the ordinary Eulerian polynomial, $A_0=1$. A cycle of length $m$ has excedance polynomial $tA_{m-1}(t)$, so the exponential formula gives

```math
\sum_{n\geq0}E_{n,k}(t)\frac{u^n}{n!}
=\exp\left(\sum_{m\geq k}tA_{m-1}(t)\frac{u^m}{m!}\right).
```

Insertion of the largest element gives the source's recurrence

```math
E_{n,k}=(n-1)tE_{n-1,k}+t(1-t)E'_{n-1,k}
+\binom{n-1}{k-1}tA_{k-1}E_{n-k,k},
```

with $E_{0,k}=1$ and $E_{1,k}=\cdots=E_{k-1,k}=0$.

Put $z=t/(1+t)^2$ and write

```math
E_{n,k}(t)=(1+t)^n\Gamma_{n,k}(z),
\qquad
A_m(t)=(1+t)^{m-1}a_m(z).
```

The chain rule gives

```math
\Gamma_{n,k}
=2(n-1)z\Gamma_{n-1,k}
+z(1-4z)\Gamma'_{n-1,k}
+\binom{n-1}{k-1}z\,a_{k-1}(z)\Gamma_{n-k,k}.
```

This transformation is useful because a palindromic polynomial with nonnegative gamma coefficients is real-rooted exactly when its gamma polynomial is real-rooted with nonpositive roots, after accounting for forced factors.

For $k\leq n<2k$, only a single cycle occurs, so $E_{n,k}=tA_{n-1}$. At the first two-cycle row,

```math
E_{2k,k}=tA_{2k-1}+\frac12\binom{2k}{k}t^2A_{k-1}^2.
```

These identities are structural reductions, not solutions.

### A concrete obstruction to the simplest induction

The delayed gamma term cannot simply be assumed to interlace the previous gamma polynomial. At $k=4,n=8$, after removing their common factor $z$, the two relevant polynomials are

```math
a_6(z)=1+52z+136z^2,
\qquad
z\,a_3(z)^2=z(1+2z)^2.
```

The roots of the first are $(-52\pm\sqrt{2160})/272$, both strictly greater than $-1/2$. The second has a double root at $-1/2$ and a root at $0$. Their roots do not alternate. Therefore the usual derivative-plus-interlacing-lag proof needs a stronger invariant; merely copying the derangement proof is invalid.

This does not refute the conjecture: the complete recurrence includes the derivative term and a specific positive coefficient.

## Descent formula

The Gessel--Reutenauer necklace formula, as stated on the author's page, is

```math
\frac{D_{n,k}(t)}{(1-t)^{n+1}}
=\sum_{N\geq1}t^{N-1}[u^n]\prod_{j\geq k}(1-u^j)^{-M_j(N)},
\quad
M_j(N)=\frac1j\sum_{d\mid j}\mu(d)N^{j/d}.
```

In the single-cycle range $k\leq n<2k$, this specializes to

```math
D_{n,k}(t)=\frac1n\sum_{d\mid n}\mu(d)(1-t)^{n-n/d}A_{n/d}(t).
```

This identity offers a route through the Eulerian transform of necklace polynomials, but the signed Mobius sum does not preserve real-rootedness by itself.

For general rows, define

```math
C_{n,k}(N)=[u^n]\prod_{j\geq k}(1-u^j)^{-M_j(N)}.
```

Logarithmic differentiation yields the exact recurrence

```math
n C_{n,k}(N)=
\sum_{m=1}^{n}
\left(\sum_{\substack{d\mid m\\d\geq k}}dM_d(N)\right)
C_{n-m,k}(N).
```

Finite differences of $C_{n,k}(1),\ldots,C_{n,k}(n+1)$ recover every coefficient of $D_{n,k}$. This supplies an exact diagnostic independent of permutation enumeration.

## Bounded diagnostics

The companion probe uses integer coefficient arithmetic, with SymPy for exact squarefree Sturm counts. It checks the full target in varying parameters, solely to look for a counterexample; a passed check is not a proof.

On 2026-11-20:

- Excedance gamma coefficients were nonnegative and passed the necessary Newton inequalities for $3\leq k\leq50$, $k\leq n\leq100$: 3,576 pairs.
- Single-cycle descent polynomials passed Newton inequalities through $n=60$ and exact real-root counts through $n=32$.
- Repeated real roots are allowed. In particular, $D_{5,5}=6t(1+t)^2$. The final probe applies Sturm counts to the squarefree part, preventing a repeated root from being mistaken for a nonreal root.

These computations supply no resolution and are not listed under results.

## Next mathematical question

Can one find a refinement of the minimum-cycle-length condition whose ordered polynomial row is preserved by insertion? Alternatively, can the Eulerian transform of the necklace product be controlled by a uniform root-location theorem? Neither needed invariant has been established in this work.
