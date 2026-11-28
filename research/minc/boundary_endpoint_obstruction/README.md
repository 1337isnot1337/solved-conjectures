# Problem 8: positive endpoint slope does not imply monotonicity

Research checkpoint: 20 November 2026. This is an exact, independently reproducible obstruction to a proposed **criterion** for Minc Problem 8. It is **not** a resolution of Problem 8 and is not counted toward the campaign's completed entries.

## The original question and the tempting characterization

The open [Friedland–Minc monotonicity-toward-the-boundary problem](https://yair-lavi.com/mincs-list/problem-8/index.html) asks for the boundary matrices `A` in the doubly stochastic polytope for which

```math
F_A(t)=\mathop{\mathrm{per}}((1-t)J_n+tA),\quad 0\le t\le1,
```

is increasing. A known necessary condition is

```math
\sigma_{n-1}(A)\le n^2\mathop{\mathrm{per}}(A),
```

equivalent to `F_A'(1)>=0`. Numerical experiments on ordinary convex combinations of permutation matrices suggested that this endpoint test might suffice, but **it does not**.

## Exact counterexample in order 113

Let `G=G_{3,6}` be the 3-regular bipartite graph used in Jerrum's construction and described explicitly by I. M. Wanless, [*The Holens–Đoković conjecture on permanents fails!*](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf), *Linear Algebra and its Applications* **286** (1999), 273–285, Example 1. Define its 55-by-55 biadjacency matrix `M` from these 55 left and 55 right vertices:

- Left: `s` and `u_(a,b,c)`; right: `t` and `v_(a,b,c)`, for `a,b∈{1,2,3}`, `c∈{1,...,6}`.
- Include `u_(a,b,c) — v_(a,β,c)` for all `β∈{1,2,3}` except `(b,β)=(1,1)`.
- Include `u_(a,1,c) — v_(a,1,c+1)` for `1<=c<6`.
- Include `s — v_(a,1,1)` and `u_(a,1,6) — t` for each `a`.

Every vertex has degree three. Thus `C=M/3` is doubly stochastic. Define the **boundary matrix**

```math
A=C\oplus C\oplus I_3\in\Omega_{113}.
```

It has many zero entries and is doubly stochastic. Its endpoint derivative is positive, but its derivative at the rational interior point `t=999/1000` is negative:

```math
\boxed{\frac{F'_A(1)}{113\mathop{\mathrm{per}}(A)}=\frac{421}{102152}>0},
```

while

```math
\boxed{-\frac1{500}<\frac{F'_A(999/1000)}{113\mathop{\mathrm{per}}(A)}<-\frac1{1000}<0.}
```

**Both signs are established by exact integer arithmetic**, not by floating-point optimization. Therefore positivity of the endpoint derivative is insufficient to characterize the monotone boundary directions in Problem 8. In fact, by continuity, the derivative has at least two zeros in `(0,1)`: at `999/1000` it is negative, while at the endpoint it is positive and near `t=0` it is positive (the standard positive second derivative at `J_n` for `A!=J_n`). This is reentrant monotonicity.

## Exact permanent and derivative reduction

For every square nonnegative integer matrix `B` define its matching polynomial `R_B(z)=sum_(k=0)^n sigma_k(B) z^k`. Let `R(z)=R_M(z)`. Wanless gives the base counts, independently reconstructed here by matching dynamic programming:

```math
\sigma_{55}(M)=3221225472,\qquad
\sigma_{54}(M)=6825441230848.
```

For `B=M\oplus M\oplus 3I_3`, matching independence across blocks gives

```math
R_B(z)=R(z)^2(1+3z)^3.
```

Exact convolution yields

```math
\begin{aligned}
\mathop{\mathrm{per}}(B)&=280159925619463815168,
\\ \sigma_{112}(B)&=1187539558049736390868992.
\end{aligned}
```

Notice `A=B/3` and `\operatorname{per}(A)=\operatorname{per}(B)/3^{113}`. The permanent's Bernstein expansion is

```math
F_A(t)=\sum_{k=0}^{113}
\frac{(113-k)!}{113^{113-k}\,3^k}
\sigma_k(B)\, t^k(1-t)^{113-k}.
\tag{1}
```

Differentiate (1). For `n=113`, `t=a/b`, put

```math
T_k=\sigma_k(B)(n-k)!n^k3^{n-k}
```

and the **integer**

```math
S(a,b)=\sum_{k=0}^n T_k\left[
k a^{k-1}(b-a)^{n-k}-(n-k)a^k(b-a)^{n-k-1}
\right],
\tag{2}
```

with the first summand zero for `k=0` and the second zero for `k=n`. Then

```math
\frac{F'_A(a/b)}{n\mathop{\mathrm{per}}(A)}
=\frac{S(a,b)}{n^{n+1}\mathop{\mathrm{per}}(B)b^{n-1}}.
\tag{3}
```

The denominator of (3) is positive. The companion `verify.py` constructs all `\sigma_k(M)` by an **integer-only frontier matching DP** on the 165 edges, convolves as above, and checks the strict inequalities at `a=999,b=1000` directly by cross multiplication. The proof requires no appeal to a numerical sign approximation or numerical optimization. It also checks the endpoint fraction exactly.

## Priority and scope

1. The underlying 3-regular graph `G_{3,6}`, its perfect and near-perfect matching counts, and the related examples of failures of Holens–Đoković are from Wanless (1999); they are **not** new here. Wanless's Example 3 already has an order-256 matrix for which a next-to-top Holens–Đoković inequality fails while the top-order inequality holds.
2. The particular **order-113 reentrant derivative** and endpoint-insufficiency certificate were derived in this investigation. A limited search did not identify this exact 113-order certificate in earlier literature. Novelty is provisional, not independently established.
3. The counterexample refutes **only** the proposed sufficiency of the known endpoint inequality. It does **not** solve the classification requested in Minc Problem 8; **completed unqualified MINCs entries remain zero**.
4. This document supersedes the numerical-only endpoint conjecture considered earlier in this research session. Any presentation of the endpoint condition as a full characterization would be wrong.

Other relevant historical source: John Goldwasser, [*Monotonicity of permanents of direct sums of doubly stochastic matrices*](https://doi.org/10.1080/03081089308818193), *Linear and Multilinear Algebra* **33** (1993), 185–188. Goldwasser's theorem assumes the component matrices already have the required monotonicity and therefore does not cover these Jerrum components.
