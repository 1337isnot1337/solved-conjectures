# Hwang's radial convexity conjecture

Research checkpoint, 20 November 2026 (America/Chicago). No proof or counterexample to the conjecture is claimed.

## Exact target and status check

For `A in Omega_n`, `A!=J_n`, define

```math
p_A(t)=\mathop{\mathrm{per}}((1-t)J_n+tA).
```

Hwang conjectured that `p_A` is strictly convex on `[0,1/2]`. This is the straight segment from `J_n` to `(J_n+A)/2`, with the parameter measured from `J_n`.

The exact statement is confirmed in the primary publisher abstract of S.-G. Hwang, *Convexity of the permanent for doubly stochastic matrices*, Linear and Multilinear Algebra **30** (1991), 129–134, [DOI 10.1080/03081089108818095](https://doi.org/10.1080/03081089108818095). That abstract states the result only for order three. [Troanca's 2008 institutional thesis](https://mspace.lib.umanitoba.ca/server/api/core/bitstreams/5f1b99a6-487f-4308-91e8-0ff0c3b4e7b1/content), printed page 36, repeats the conjecture in its discussion of Conjecture 34 and reports Hwang's question about equivalence to Lih–Wang.

The current [Minc Conjecture 34 page](https://yair-lavi.com/mincs-list/conjecture-34/index.html) keeps the full Lih–Wang inequality open but does not state Hwang's conjecture separately. Exact-title, DOI, author, counterexample, proof, and recent-2026 searches found no full resolution of Hwang's statement. The original full 1991 paper was not retrieved; its exact conjecture statement is available in its primary abstract. This is a bounded status audit, not a certification that no unindexed result exists.

The conjecture is about one radial direction at each matrix. It does not assert that the permanent is convex on the whole region `{(J_n+A)/2:A in Omega_n}`. The counterexample in the next section makes that distinction necessary.

## A full Hessian argument on the half region is false

Let `P` be a cyclic permutation matrix of order three and put

```math
B_s=(1-s)J_3+sP^2,
\qquad D=I_3-P.
```

The matrix `D` has zero margins. Write

```math
a=\frac{1-s}{3},\qquad c=\frac{1+2s}{3}.
```

The three circulant coefficients of `B_s+hD` are `a+h,a-h,c`. Its permanent is therefore

```math
\begin{aligned}
\mathop{\mathrm{per}}(B_s+hD)
&=(a+h)^3+(a-h)^3+c^3+3(a+h)(a-h)c\\
&=\mathop{\mathrm{per}}B_s+(1-4s)h^2.
\end{aligned}
\tag{1}
```

In particular, at `s=1/3`,

```math
\mathop{\mathrm{per}}(B_{1/3}+hD)=\frac{67}{243}-\frac{h^2}{3}.
\tag{2}
```

Every entry of `B_(1/3)` is at least `2/9`, and for `|h|<1/18` every entry of `B_(1/3)+hD` is greater than `1/6`. Thus this entire short segment lies in the interior of the region with entrywise lower bound `J_3/2`, while the permanent is strictly concave on it.

This is not a counterexample to Hwang: `D` is not the radial direction `P^2-J_3`. It blocks a proof that tries to establish positive semidefiniteness of the full tangent Hessian throughout the half region. The fixed-degree global convexity estimate in [the quantitative Kopotun note](../kopotun/proof.md) also does not apply to the full permanent: its condition `n>=16k^2` excludes `k=n`.

## Exact radial moment formulations

Set

```math
q_k(A)=\frac{\sigma_k(A)}{k!\binom nk^2n^{-k}},
\qquad d_n=\frac{n!}{n^n}.
```

The exact Bernstein expansion is

```math
\frac{p_A(t)}{d_n}
=\sum_{k=0}^n\binom nk q_k(A)t^k(1-t)^{n-k}.
\tag{3}
```

It gives

```math
\frac{p_A''(t)}{d_n}
=n(n-1)\sum_{k=0}^{n-2}\binom{n-2}{k}
t^k(1-t)^{n-2-k}\Delta^2q_k(A).
\tag{4}
```

The full second-difference sequence need not be nonnegative. A proof of (4)'s nonnegativity must exploit its average and the doubly stochastic hypotheses, not assume coefficientwise convexity.

Another useful form uses the probability distribution

```math
\mathbb P_t(K=k)
=\frac{\binom nk q_k(A)t^k(1-t)^{n-k}}{p_A(t)/d_n}
\qquad(0<t<1).
```

Twice differentiating the individual Bernstein terms gives

```math
\frac{p_A''(t)}{p_A(t)}
=\frac{
\mathbb E_t[(K-nt)^2]
-(1-2t)\mathbb E_tK-nt^2
}{t^2(1-t)^2}.
\tag{5}
```

At `t=1/2`, this is particularly simple:

```math
\frac{p_A''(1/2)}{p_A(1/2)}
=4\left(\mathbb E_{1/2}(2K-n)^2-n\right).
\tag{6}
```

Thus a full proof would in particular imply the endpoint moment inequality `E(2K-n)^2>=n` for this matching-derived distribution. No proof of that inequality is supplied here. The factorial weighting in (3) is essential: the real-rootedness of the ordinary rook polynomial does not establish it.

## Uniform-block padding gives an exact counterexample transfer test

Fix a doubly stochastic core `A` of order `m`, and let

```math
B_M=A\oplus J_M,\qquad N=m+M,
\qquad p_M(t)=\mathop{\mathrm{per}}((1-t)J_N+tB_M).
```

For `M>=m`, put

```math
a=\frac{1-t}{N},\qquad b=a+\frac{t}{M},\qquad
C=tA+a\mathbf1_m\mathbf1_m^{\mathsf T}.
```

Count a permutation by the number `k` of its edges inside the core. The remaining `r=m-k` core rows and core columns must each match to distinct tail vertices. The residual tail block is uniform. This gives the exact formula

```math
p_M(t)=\sum_{k=0}^m
\sigma_k(C)\frac{(M!)^2}{(M-m+k)!}
a^{2(m-k)}b^{M-m+k}.
\tag{7}
```

Equivalently,

```math
\frac{p_M(t)}{d_N}
=\frac{M!b^M}{d_N}
\sum_{k=0}^m\sigma_k(C)(M)_{m-k}
\left(\frac{a^2}{b}\right)^{m-k}.
\tag{8}
```

For fixed `m`, as `M` tends to infinity,

```math
\frac{M!b^M}{d_N}\longrightarrow e^{mt},\qquad
(M)_r\left(\frac{a^2}{b}\right)^r\longrightarrow(1-t)^{2r},
\qquad
\sigma_k(C)\longrightarrow t^k\sigma_k(A).
```

These limits, and their first two derivatives, are uniform on `[0,1/2]`. To see this directly for the only nonpolynomial factor, write

```math
\frac{M!b^M}{d_N}
=\frac{d_M}{d_N}
\left(1-\frac{m(1-t)}{N}\right)^M;
```

the first factor is independent of `t` and tends to `e^m`, while the logarithm of the second factor and its first two derivatives converge uniformly to `-m(1-t)`, `m`, and `0`. The other finitely many factors in (8) are rational functions with denominators uniformly separated from zero after cancelling their powers of `M`.

It follows that

```math
\frac{p_M(t)}{d_N}\longrightarrow
F_A(t):=e^{mt}\sum_{k=0}^m\sigma_k(A)t^k(1-t)^{2(m-k)}
\quad\text{in }C^2([0,1/2]).
\tag{9}
```

Writing the rook polynomial as `R_A(z)=sum_k sigma_k(A)z^k`, this is

```math
F_A(t)=e^{mt}(1-t)^{2m}
R_A\left(\frac{t}{(1-t)^2}\right).
\tag{10}
```

**Counterexample transfer criterion.** If one finds a doubly stochastic core `A` and a point `t_0 in (0,1/2]` for which `F_A''(t_0)<0`, then `B_M=A op J_M` disproves Hwang's full conjecture for every sufficiently large `M`. If `t_0=1/2`, continuity also gives negative curvature at an interior point just below it.

No such core has been established here. In particular, the known large endpoint cofactor ratios used in Holens–Đoković counterexamples do not automatically pass through this criterion. The relevant matching fugacity is `z=t/(1-t)^2<=2`; the ratio of top coefficients describes instead the `z->infinity` regime.

## A Poisson representation of the limiting function

For `0<=t<=1`, take mutually independent random variables

```math
Z_{ij}\sim\mathop{\mathrm{Poisson}}(ta_{ij}),\qquad
U_i,V_j\sim\mathop{\mathrm{Poisson}}(1-t).
```

Define

```math
X_i=U_i+\sum_j Z_{ij},\qquad
Y_j=V_j+\sum_i Z_{ij}.
```

Within each of the vectors `X` and `Y`, the coordinates are independent Poisson random variables of mean one, because `A` is doubly stochastic. Their dependence across the two vectors comes only from the shared edge variables `Z_(i,j)`.

On the event that every `X_i` and every `Y_j` equals one, the nonzero shared variables form a matching, and each equals one. A matching of size `k` contributes its edge-weight product times `t^k(1-t)^(2(m-k))`. The exponential factors from all independent Poisson variables multiply to `exp(-2m+mt)`. Therefore

```math
F_A(t)=e^{2m}\,
\mathbb P(X_1=\cdots=X_m=Y_1=\cdots=Y_m=1).
\tag{11}
```

This is an exact probability interpretation of the transfer function, not a convexity theorem. Nonnegativity of a probability does not control its second derivative in the dependence parameter. A useful additional result would have to prove convexity of this balanced Poisson occupancy correlation, or provide an actual doubly stochastic counterexample.

### Nonnegative Taylor coefficients are not available

An independent team check supplied the doubly stochastic core `C=(I_4+P_4)/2`, with `P_4` a cyclic permutation. Its rook coefficients are

```math
(\sigma_0(C),\ldots,\sigma_4(C))=(1,4,5,2,1/8).
```

Writing `F_C(t)=e^(4t)P(t)`, direct expansion gives

```math
P(t)=1-4t+9t^2-14t^3+\frac{129}{8}t^4
-14t^5+9t^6-4t^7+t^8.
```

Multiplication by the exponential series gives

```math
F_C(t)=1+t^2+\frac23t^3+\frac18t^4
+\frac{11}{30}t^5+\frac29t^6-\frac4{105}t^7+O(t^8).
\tag{12}
```

In particular, the degree-seven coefficient is negative. This exact example rules out proving convexity by asserting nonnegative coefficients for the entire Poisson correlation series. It does not establish negative second derivative on `[0,1/2]` and is not a counterexample to Hwang.

## Remaining gap

The all-direction Hessian shortcut is ruled out by (2). The known fixed-degree coefficient bounds give an interval that shrinks with the matrix order when applied to the full permanent, not the required half interval. The uniform-block construction provides a concrete transfer test (9)–(11), but its required curvature sign has not been determined in general. Hwang's conjecture and Lih–Wang Conjecture 34 remain unresolved by this work.

## Independent check

The root reviewer checked the Bernstein moment numerator, the exact block-matching multiplicity, the uniform convergence through two derivatives, and the total Poisson intensity in the occupancy formula. The transverse Hessian and negative Taylor coefficient were also independently expanded. The companion [exact checker](hwang_radial_certificates.py) verifies the general derivative identity and a nonsymmetric rational core's block identity, alongside the two auxiliary obstructions. It passed. It requires SymPy and performs no numerical search or conjecture verification at a selected order.
