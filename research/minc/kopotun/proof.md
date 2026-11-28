# Kopotun's eventual subpermanent convexity conjecture

Date: 20 November 2026 (America/Chicago).

This draft proves global strict convexity of `sigma_k` on the doubly stochastic polytope once `n>=16k^2`. The publisher's abstract confirms that Kopotun's 1996 paper conjectured the weaker eventual radial chord statement. However, a prior August 2026 centered coefficient bound already implies eventual global convexity by polarization, as documented in `prior-bound-implication.md`. This draft is retained as a quantitative refinement, not counted as a new conjecture resolution. The original article's internal conjecture numbering has not been independently inspected. The proof does not resolve the full permanent version of the Lih–Wang conjecture, where the degree equals the matrix order.

## Statement

Let `Omega_n` be the nonnegative doubly stochastic matrices of order `n`, and put

```math
J=\frac1n\mathbf1\mathbf1^{\mathsf T},\qquad
S_{n,k}=k!\binom nk^2n^{-k}.
```

For a real square matrix `B`, let `sigma_k(B)` be the sum of the permanents of all its square submatrices of order `k`, and set `sigma_0(B)=1`. Write `(a)_j=a(a-1)...(a-j+1)` for a falling factorial, with `(a)_0=1`.

**Theorem.** Suppose `k>=3` and `n>=16k^2`. For every `A in Omega_n` and every real matrix `D` with zero row and column sums,

```math
D^2\sigma_k(A)[D,D]
\ge
S_{n,k}\frac{k(k-1)}{2(n-1)^2}\|D\|_F^2. \tag{1}
```

Consequently, for `A,B in Omega_n` and `0<=t<=1`,

```math
\begin{aligned}
\sigma_k((1-t)A+tB)
\le{}&(1-t)\sigma_k(A)+t\sigma_k(B)
\\ &-S_{n,k}\frac{k(k-1)}{4(n-1)^2}
t(1-t)\|A-B\|_F^2.
\end{aligned} \tag{2}
```

Taking `B=J` gives the conjectured chord inequality for every mixing parameter. Its inequality is strict when `A!=J` and `0<t<1`. In particular, `n_k=16k^2` is an admissible threshold simultaneously for every degree `k>=3`; no assertion of an optimal threshold is made.

The proof works directly at matrices with zero entries. It requires no reduction to a fixed support or an interior limit.

## 1. A mixed second-derivative estimate

Put `Q=I-J` and `H=1^perp`. For each `j`-element subset `S={i_1,...,i_j}` of `[n]`, define

```math
v_S=\frac1{\sqrt{j!}}\sum_{\pi\in S_j}
e_{i_{\pi(1)}}\otimes\cdots\otimes e_{i_{\pi(j)}},
\qquad
u_j=\sum_{|S|=j}v_S,
\qquad
w_j=Q^{\otimes j}u_j.
```

The tensor products use the Euclidean product inner product. Expansion of the inner product gives

```math
\langle v_S,Y^{\otimes j}v_T\rangle
=\mathop{\mathrm{per}}Y[S,T].
```

If `Y` has zero margins, then `Y=QYQ`. Hence

```math
\sigma_j(Y)=\langle w_j,Y^{\otimes j}w_j\rangle,
\qquad
\|w_j\|^2=\sigma_j(Q)=:q_{n,j}\ge0. \tag{3}
```

Every one-factor marginal of `w_j` is

```math
\rho_\ell=\frac{q_{n,j}}{n-1}I_H. \tag{4}
```

Here a one-factor marginal is defined by

```math
\mathop{\mathrm{tr}}(\rho_\ell R)
=\left\langle w_j,
I_H^{\otimes(\ell-1)}\otimes R\otimes
I_H^{\otimes(j-\ell)}w_j\right\rangle
```

for every self-adjoint operator `R` on `H`. To verify (4), simultaneous coordinate permutations fix `u_j`, commute with `Q`, and therefore fix `w_j`. Its marginal commutes with every permutation on `H`. Extend this marginal by zero on the span of the all-ones vector. The extended matrix commutes with all permutation matrices, so it has a constant diagonal and a constant off-diagonal. Its restriction to `H` is scalar. Its trace is `||w_j||^2`, which proves (4).

These tensor identities are the construction in the proof of Lavi's Lemma 3.1 [1]. The following mixed derivative consequence is the step needed here.

Suppose `X,D` have zero margins and `||X||_(2->2)<=1`. The tensor `w_j` is symmetric under permutations of its tensor positions. Differentiating (3) twice therefore yields

```math
D^2\sigma_j(X)[D,D]
=j(j-1)\left\langle w_j,
(D\otimes D\otimes X^{\otimes(j-2)})w_j\right\rangle. \tag{5}
```

In the inner product on the right, move the first `D` to the left. Cauchy–Schwarz gives

```math
\begin{aligned}
\big|\langle w_j,(D\otimes D\otimes X^{\otimes(j-2)})w_j\rangle\big|
\le{}&\|(D^{\mathsf T}\otimes I_H^{\otimes(j-1)})w_j\|
\\ &\cdot\|(I_H\otimes D\otimes X^{\otimes(j-2)})w_j\|.
\end{aligned}
```

The operators `X` act on positions different from `D` and are contractions. Thus the second norm is at most

```math
\|(I_H\otimes D\otimes I_H^{\otimes(j-2)})w_j\|.
```

By (4), the squares of this norm and of the first norm are both

```math
\frac{q_{n,j}}{n-1}\|D\|_F^2.
```

The Frobenius norm on `H` is the full Frobenius norm because `D` vanishes on the all-ones vector and preserves `H`. We have proved

```math
\left|D^2\sigma_j(X)[D,D]\right|
\le j(j-1)\frac{q_{n,j}}{n-1}\|D\|_F^2.
\tag{6}
```

No symmetry, normality, or positive semidefiniteness of `X` or `D` is assumed.

For `A in Omega_n`, Jensen's inequality and the column sums show that `||A||_(2->2)<=1`. Since `X=A-J=QAQ`, this centered matrix satisfies the contraction hypothesis in (6).

## 2. The centered expansion

Selecting which entries in a subpermanent come from `X` gives

```math
\sigma_k(J+X)
=\sum_{j=0}^k
(k-j)!\binom{n-j}{k-j}^2n^{-(k-j)}\sigma_j(X).
\tag{7}
```

For example, after a `j`-matching from `X` is chosen, its rows and columns can each be extended to a `k`-set in `binom(n-j,k-j)` ways, and the remaining uniform entries have permanent `(k-j)!n^{-(k-j)}`.

Normalize by `S_(n,k)` and define `f_(n,k)(A)=sigma_k(A)/S_(n,k)`. Equation (7) becomes

```math
f_{n,k}(J+X)
=\sum_{j=0}^k a_{n,k,j}\sigma_j(X),
\qquad
a_{n,k,j}=\frac{n^j(k)_j}{(n)_j^2}.
\tag{8}
```

On the zero-margin space `sigma_1(X)=0` and

```math
\sigma_2(X)=\frac12\|X\|_F^2.
```

Therefore the second derivative of the quadratic term in (8) is exactly

```math
\frac{(k)_2}{(n-1)^2}\|D\|_F^2. \tag{9}
```

All higher terms can be bounded with (6).

## 3. A positive coefficient majorant

Set

```math
c_{n,j}=\frac{n^j q_{n,j}}{(n)_j}\qquad(0\le j\le n).
```

The full permanent instance of (7), applied to `X=tQ`, gives

```math
\frac{\mathop{\mathrm{per}}(J+tQ)}{n!/n^n}
=\sum_{j=0}^n c_{n,j}t^j.
\tag{10}
```

An independent expansion according to the entries selected from `tI` in `J+tQ=tI+(1-t)J` gives

```math
\frac{\mathop{\mathrm{per}}(J+tQ)}{n!/n^n}
=(1-t)^n\sum_{\ell=0}^n
\frac1{\ell!}\left(\frac{nt}{1-t}\right)^\ell.
\tag{11}
```

For coefficients of degree at most `n`, replacing the finite sum in (11) by the exponential changes nothing: every omitted summand has degree at least `n+1` at zero. Consequently

```math
c_{n,j}=[t^j]E_n(t)\quad(0\le j\le n),
\qquad
E_n(t)=\exp\bigl(ng(t)\bigr),
\tag{12}
```

where, for `|t|<1`,

```math
g(t)=\log(1-t)+\frac{t}{1-t}
=\sum_{m=2}^{\infty}\frac{m-1}{m}t^m.
\tag{13}
```

Every Taylor coefficient of `E_n` is nonnegative. In particular, `c_(n,0)=1`, `c_(n,1)=0`, and `c_(n,2)=n/2`.

Let `u=k/n`. Because `n>=k`,

```math
\frac{(k)_j}{(n)_j}
=\prod_{i=0}^{j-1}\frac{k-i}{n-i}
\le u^j.
\tag{14}
```

Using (6), (8), (9), and then the nonnegative coefficients in (12), we obtain for every zero-margin `D`

```math
\begin{aligned}
\frac{D^2f_{n,k}(A)[D,D]}{\|D\|_F^2}
&\ge \frac{(k)_2}{(n-1)^2}
-\frac1{n-1}\sum_{j=3}^k
j(j-1)c_{n,j}\frac{(k)_j}{(n)_j}
\\ &\ge \frac{(k)_2}{(n-1)^2}
-\frac{u^2}{n-1}\bigl(E_n''(u)-n\bigr).

\end{aligned} \tag{15}
```

For `D=0`, the desired inequality is immediate, so division by its squared norm in (15) is harmless. The term `n` subtracted from `E_n''` is exactly its constant term, originating from the centered quadratic coefficient. No signs are assumed for the centered coefficients of the arbitrary matrix `X`.

## 4. The uniform bound when `n>=16k^2`

For `k>=3` and `n>=16k^2`,

```math
0\lt u\le\frac1{48},\qquad nu^2\le\frac1{16}.
\tag{16}
```

Differentiation of (13) gives

```math
g'(u)=\frac{u}{(1-u)^2},\qquad
g''(u)=\frac{1+u}{(1-u)^3},\qquad
\frac{E_n''(u)}n=E_n(u)\bigl(g''(u)+n(g'(u))^2\bigr).
\tag{17}
```

Since `g(u)=integral_0^u t/(1-t)^2 dt`, (16) implies

```math
ng(u)\le\frac{nu^2}{2(1-u)^2}
\le\frac1{32}\left(\frac{48}{47}\right)^2
<\frac1{16}.
```

The elementary coefficientwise estimate `exp(x)<=1/(1-x)` for `0<=x<1` therefore gives

```math
E_n(u)<\frac{16}{15}. \tag{18}
```

The remaining two terms in (17) obey

```math
g''(u)
\le\frac{49\cdot48^2}{47^3}
=\frac{112896}{103823}<\frac98,
\tag{19}
```

and

```math
n(g'(u))^2
\le\frac1{16}\left(\frac{48}{47}\right)^4
<\frac18.
\tag{20}
```

All comparisons in (18)–(20) are rational apart from the elementary exponential bound. Combining them gives

```math
\frac{E_n''(u)}n
<\frac{16}{15}\left(\frac98+\frac18\right)
=\frac43.
\tag{21}
```

Substitute (21) in (15). The result is

```math
D^2f_{n,k}(A)[D,D]
\ge\left[
\frac{k(k-1)}{(n-1)^2}-\frac{k^2}{3n(n-1)}
\right]\|D\|_F^2
\ge\frac{k(k-1)}{2(n-1)^2}\|D\|_F^2.
\tag{22}
```

The last step follows from

```math
3n(k-1)-2k(n-1)=(k-3)n+2k\ge0.
```

Multiplying by `S_(n,k)` proves (1).

## 5. Convexity, boundary matrices, and the conjectured quantifiers

For any `A,B in Omega_n`, their difference `D=B-A` has zero margins, and every point of the segment between them is doubly stochastic. Apply (1) along this segment. Subtracting the quadratic with constant second derivative equal to the right side of (1) leaves a convex one-variable function. Its chord inequality is precisely (2).

This argument includes endpoints and segments contained in boundary faces, because the contraction estimate and the polynomial Hessian formulas hold for every nonnegative doubly stochastic matrix. No equality characterization needs to pass through a limiting argument: the explicit positive quadratic deficit in (2) proves strictness for distinct endpoints and interior mixing parameters.

The quantifiers are uniform: one threshold `16k^2` works for all orders above it, all matrices of each such order, and all mixing parameters. Thus the argument proves the eventual statement for every fixed degree with an explicit quadratic threshold. The existential conclusion is already a consequence of the prior general centered bound, so this result is not counted as a new resolution. It supplies no assertion about the case `k=n`; the condition `n>=16k^2` excludes that regime.

## Sources and attribution

1. Y. Lavi, *The Marcus–Minc Transform Inequality*, [arXiv:2609.29262v1](https://arxiv.org/html/2609.29262v1), 24 September 2026. Lemma 3.1 supplies the tensor construction and its one-factor isotropy. Equations (3)–(4) above reproduce that ingredient with its proof. Equation (6) is the mixed Hessian extension used here.
2. K. A. Kopotun, *A note on the convexity of the sum of subpermanents*, Linear Algebra and its Applications 245 (1996), 157–169, [doi:10.1016/0024-3795(94)00228-2](https://doi.org/10.1016/0024-3795(94)00228-2). The publisher's abstract states the exact eventual chord conjecture and reports only degrees at most four as proved there. The full original article was not obtained for this review, so its internal conjecture number is not asserted.
3. [Lavi's current Conjecture 34 page](https://yair-lavi.com/mincs-list/conjecture-34/index.html) links the Kopotun paper as prior work on Lih–Wang convexity. The full Lih–Wang permanent conjecture remains distinct from the fixed-degree eventual statement above.
4. [DCPRevere/maths-pub](https://github.com/DCPRevere/maths-pub/tree/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang), August 2026. The general centered coefficient bound in that project and its implication for eventual convexity are documented in `prior-bound-implication.md`. That overlap prevents treating the present existential conclusion as a new conjecture resolution.
