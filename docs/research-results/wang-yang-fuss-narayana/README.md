# Wang–Yang's Fuss–Narayana conjecture

On 26 November 2026 the [reviewed proof of all six matrices](../../../results/wang-yang-fuss-narayana/README.md) was published on `main`. The argument uses the square's column ratios, a rational product determinant and two triangular criteria. The 20 November checkpoint below records the earlier approach. [Independent review](https://github.com/1337isnot1337/solved-conjectures/issues/98#issuecomment-7188223846) · [Publication PR](https://github.com/1337isnot1337/solved-conjectures/pull/789)

Status (20 November 2026): unresolved in this research lane. No proof or counterexample is claimed. This is a checkpoint of exact reductions and failed sufficient methods, not a finite extension of the conjecture.

Coordination: [issue #98](https://github.com/1337isnot1337/solved-conjectures/issues/98).

## Full target

Yi Wang and Arthur L. B. Yang, *Total positivity of Narayana matrices*, Discrete Mathematics 341 (2018), 1264–1269, [DOI 10.1016/j.disc.2018.01.012](https://doi.org/10.1016/j.disc.2018.01.012), Conjecture 4.1. The [author PDF](https://cfc.nankai.edu.cn/_upload/article/files/ca/07/264e89bc4d9bb418a6d91d482b90/ef62459f-bec2-470d-8199-b57a790de20a.pdf) was read through the statement and its preceding definitions.

For each integer $m\ge 2$, put
```math
 A_m(n,k)=\frac1{n+1}\binom{n+1}{k}\binom{m(n+1)}{n-k},
 \qquad
 B_m(n,k)=\binom nk\binom{mn}{n-k}
 \quad(0\le k\le n).
```
Extend the triangles by zero for $k>n$. The conjecture asserts:

- All minors of the four triangles $A_m(n,k)$, $B_m(n,k)$, $A_m(n,n-k)$, and $B_m(n,n-k)$ are nonnegative.
- Every minor of each infinite square $A_m(n+k,k)$ and $B_m(n+k,k)$, with $n,k\ge0$, is strictly positive.

The paper calls these properties TP and STP, respectively. Its $m=1$ case is already a theorem. The target here includes every integer $m\ge2$ and minors of arbitrary order.

## Exact triangle reductions

Expanding factorials gives
```math
 B_m(n,k)=
 \frac{n!(mn)!}{k!(n-k)!^2((m-1)n+k)!},
```
and
```math
 A_m(n,k)=
 \frac{n!\,[m(n+1)]!}
 {k!(n-k)!(n-k+1)!((m-1)n+m+k)!}.
```
Positive row and column factors do not affect the signs of minors. Thus the ordinary type-B triangle is equivalent to
```math
 \left[\frac1{(n-k)!^2((m-1)n+k)!}\right]_{n,k\ge0}.
```
For $m=1$ the extra factorial depends only on the column; this is the reciprocal-factorial Toeplitz mechanism in the published proof. For $m>1$ it depends on both indices, so the same normalization is not Toeplitz.

A second normalization of type B is
```math
 R_m(n,k)=\frac{\binom{mn}{n-k}}{(n-k)!}
        =[x^{\,n-k}]L_{mn}(-x),
```
where $L_N(-x)=\sum_j\binom Nj x^j/j!$ is the ordinary unsigned Laguerre polynomial.

For $0\le k\le n$,
```math
 \frac{B_m(n,k)}{B_m(n,0)}
 =\frac{n_{\underline{k}}^2}
 {k!\,((m-1)n+1)_k}.
```
This is a rational collocation kernel with nested zero sets. No all-minor positivity theorem for this specific kernel has been established here.

The reversed type-B triangle similarly satisfies
```math
 B_m(n,n-k)=
 \frac{n!(mn)!}{k!^2(n-k)!(mn-k)!}.
```
A positive entrywise product of TP arrays is not automatically TP. None of these formulas is by itself a proof.

## Exact square reduction

Let $(x)_n=x(x+1)\cdots(x+n-1)$ and
$x_{\underline n}=x(x-1)\cdots(x-n+1)$. Define
```math
 p_n^{(s)}(x)=(x+1)_n\,\bigl(m(x+n+s)\bigr)_{\underline n},
 \qquad s\in\{0,1\}.
```
Direct factorial cancellation yields
```math
 B_m(n+k,k)=\frac{p_n^{(0)}(k)}{(n!)^2},\qquad
 A_m(n+k,k)=\frac{p_n^{(1)}(k)}{n!(n+1)!}.
```
These formulas include $n=0$, when both sides are 1.

Canceling the shared factors of $p_{n+1}^{(s)}(x)$ and
$p_n^{(s)}(x+1)$ gives the exact recurrence
```math
 p_{n+1}^{(s)}(x)
 =(x+1)\bigl(mx+(m-1)n+m(s+1)\bigr)p_n^{(s)}(x+1).
```
Each individual $p_n^{(s)}$ has only negative real zeros. Total positivity of the evaluation matrix $[p_n^{(s)}(k)]$ is a stronger assertion; individual row real-rootedness does not establish it.

If the coefficient array $([x^j]p_n^{(s)}(x))_{n,j\ge0}$ were TP, its product with the monomial evaluation matrix would provide a route to the squares. No proof of that sufficient coefficient-array property is known in this lane.

## A sufficient method that fails

For a lower triangular array $M$, one common sufficient method is to prove TP of its production matrix $P=M^{-1}\overline M$, where $\overline M(n,k)=M(n+1,k)$.

That method cannot be applied directly to the arrays above. For example, at $m=2$ the normalized array $R_m$ gives
```math
 P_{0:4,\,0:5}=
 \begin{pmatrix}
 2&1&0&0&0\\
 -1&2&1&0&0\\
 4/3&-7/2&2&1&0\\
 -17/4&12&-11/2&2&1
 \end{pmatrix}.
```
The ordinary type-B triangle itself has $P(2,0)=-8$ and $P(2,1)=-9$ at $m=2$. Negative production entries also occur at $m=1$, for which the triangle is already known to be TP. Consequently these negative entries refute only the proposed sufficient method, not Wang–Yang's conjecture.

Small exact coefficient-array and square-minor checks did not provide a counterexample. They are diagnostics only, and no finite verification is counted as progress toward resolving the whole statement.

## Prior-resolution audit and remaining access limits

Searches used both web engines with the author names, Fuss–Narayana names, total positivity, proof, resolution, factorial kernels, Riordan arrays, and recent publication dates. Repository issue searches found no earlier active lane for this exact statement. A current [MathDB entry](https://mathdb.com/p/335387/total-positivity-of-fuss-narayana-triangles-and-strict-posit) still lists it; that is only a lead, not proof that the problem remains open.

Two recent primary records need full-theorem comparison before any new result can be claimed:

1. Bao-Xuan Zhu, *Coefficientwise total positivity and Stieltjes moment properties from Riordan arrays*, Journal of the London Mathematical Society 113 (2026), e70450, [DOI 10.1112/jlms.70450](https://doi.org/10.1112/jlms.70450). First published 10 February 2026. The abstract proves TP of Fuss–Catalan Riordan arrays and coefficientwise Hankel TP of multivariate Fuss–Narayana–Riordan polynomials. Those properties are not automatically the six-matrix assertion above. The accessible publisher/ResearchGate record gives an abstract and one-page preview; the relevant full theorems were not obtained.

2. Jiang Zeng, *Two q-Deformations of Narayana Polynomials: Rogers Moments, Hankel Positivity, and q-Narayana Kernels*, [arXiv:2610.28691](https://arxiv.org/abs/2610.28691), first posted 20 October 2026, with a November revision. Its abstract describes a continuous-parameter q-extension of the type-A/type-B triangle and square theorems. The full parameter specialization must be checked before excluding overlap with the Fuss parameter. HTML retrieval failed in this audit.

The 2025 paper by Angarone, Kim, Oh and Soskin, [*Hadamard Products of dual Jacobi–Trudi matrices*](https://arxiv.org/abs/2511.08969), concerns ribbon-like skew shapes and says its broader Hadamard-positivity conjectures remain open. Its abstract does not provide a closure theorem that resolves the kernels here.

This lane is paused after a bounded structural attempt. A future continuation should first obtain the two recent full papers, then prove a valid network, determinant, or rational-collocation theorem. Merely increasing the range of checked minors will not meet the research target.
