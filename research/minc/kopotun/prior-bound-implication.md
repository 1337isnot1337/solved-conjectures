# Prior centered bounds and eventual global subpermanent convexity

Date: 20 November 2026 (America/Chicago).

This note records a priority limitation for the proposed Kopotun result. A dimension-independent centered coefficient bound already implies eventual global convexity by ordinary polarization. The separate explicit threshold `n>=16k^2` is a quantitative improvement, but the stronger word “global” does not by itself distinguish its existential conclusion from this implication.

The public August 2026 DCPRevere project states the bound

```math
|\sigma_j(X)|\le C_j\|X\|_F^j,
\qquad C_j=\frac{D_j^2}{j!}, \tag{1}
```

for every real zero-margin matrix `X`; `D_j` is the number of derangements of `j` objects. Its referenced `UNIFORM-G.md` note was not found, but the mathematical prose in the headers of `FinnerOne.lean` and `FinnerTwo.lean` supplies the proof. Those headers were read for source priority; no Lean verification was performed. Section 2 below gives a self-contained reconstruction of the same bound.

## 1. Full polarization implication

Assume more generally that, for every `j>=2`, there is a constant `C_j` independent of the matrix order such that (1) holds on the real vector space of zero-margin matrices. Denote the symmetric `j`-linear polarization of `sigma_j` by `T_j`; thus

```math
\sigma_j(X)=T_j(X,\ldots,X).
```

The real polarization identity is

```math
T_j(Y_1,\ldots,Y_j)
=\frac1{2^j j!}\sum_{\varepsilon\in\{-1,1\}^j}
\left(\prod_{i=1}^j\varepsilon_i\right)
\sigma_j\left(\sum_{i=1}^j\varepsilon_iY_i\right).
\tag{2}
```

If each `||Y_i||_F<=1`, the triangle inequality and (1) bound every summand in absolute value by `C_j j^j`. By multilinearity and rescaling, (2) yields

```math
|T_j(Y_1,\ldots,Y_j)|
\le \frac{C_jj^j}{j!}\prod_{i=1}^j\|Y_i\|_F.
\tag{3}
```

Consequently

```math
\begin{aligned}
|D^2\sigma_j(X)[D,D]|
&=j(j-1)|T_j(X,\ldots,X,D,D)|\\
&\le K_j\|X\|_F^{j-2}\|D\|_F^2,
\qquad K_j=\frac{C_jj^j}{(j-2)!}.
\tag{4}
\end{aligned}
```

Let `A in Omega_n`, let `J` have entries `1/n`, and write `X=A-J`. Since every row of `A` is a probability vector,

```math
\|X\|_F^2=\|A\|_F^2-1\le n-1. \tag{5}
```

Set `S_(n,k)=k! binom(n,k)^2 n^(-k)` and `f_(n,k)=sigma_k/S_(n,k)`. The exact centered expansion is

```math
f_{n,k}(J+X)
=\sum_{j=0}^k a_{n,k,j}\sigma_j(X),
\qquad a_{n,k,j}=\frac{n^j(k)_j}{(n)_j^2}.
\tag{6}
```

Here `(a)_j` is a falling factorial. On the zero-margin space,

```math
\sigma_1(X)=0,\qquad \sigma_2(X)=\frac12\|X\|_F^2,
\qquad a_{n,k,2}=\frac{k(k-1)}{(n-1)^2}. \tag{7}
```

Equations (4)–(7) give the following lower bound in every zero-margin direction `D`:

```math
D^2f_{n,k}(A)[D,D]
\ge a_{n,k,2}\bigl(1-R_{n,k}\bigr)\|D\|_F^2,
\tag{8}
```

where

```math
R_{n,k}
=\sum_{j=3}^k
K_j\frac{n^{j-2}(k-2)_{j-2}}{(n-2)_{j-2}^2}
(n-1)^{(j-2)/2}.
\tag{9}
```

The exact coefficient ratio used here is

```math
\frac{a_{n,k,j}}{a_{n,k,2}}
=\frac{n^{j-2}(k-2)_{j-2}}{(n-2)_{j-2}^2}.
```

For fixed `k`, the `j`th summand in (9) is `O_k(n^(-(j-2)/2))`, with no dependence on `A` or `D`. In particular,

```math
R_{n,k}=O_k(n^{-1/2})\longrightarrow0.
\tag{10}
```

An explicit threshold is also immediate. For `n>=2k` and `3<=j<=k`, every factor of `(n-2)_(j-2)` is at least `n/2`. Hence

```math
R_{n,k}\le
\sum_{j=3}^k 4^{j-2}(k-2)_{j-2}K_jn^{-(j-2)/2}
\le\frac{M_k}{\sqrt n},
\tag{11}
```

where the finite constant

```math
M_k=\sum_{j=3}^k4^{j-2}(k-2)_{j-2}
\frac{C_jj^j}{(j-2)!}
```

depends only on `k`. Thus every integer

```math
n\ge\max\{2k,\lceil4M_k^2\rceil\}
\tag{12}
```

satisfies

```math
D^2\sigma_k(A)[D,D]
\ge S_{n,k}\frac{k(k-1)}{2(n-1)^2}\|D\|_F^2.
\tag{13}
```

This proves global strict convexity on `Omega_n` for every sufficiently large order, uniformly over all matrices and directions. Integrating (13) along a segment gives the chord inequality, with a positive quadratic deficit for distinct endpoints. The historical eventual radial conjecture follows by taking one endpoint to be `J`.

This deduction uses only (1), polynomial polarization, and the exact centered expansion. It does not require the newer one-factor isotropic tensor estimate.

## 2. Reconstruction of the advertised derangement bound

We give a proof valid in every order `n>=j`. Write `P_j` for the set of partitions of `[j]`, and put

```math
\mu(\pi)=\prod_{B\in\pi}(-1)^{|B|-1}(|B|-1)!.
```

Inclusion–exclusion for distinct indices gives

```math
\sigma_j(X)=\frac1{j!}
\sum_{\pi,\rho\in P_j}\mu(\pi)\mu(\rho)\,
H_{\pi,\rho}(X),
\tag{14}
```

where `H_(pi,rho)` sums `prod_(ell=1)^j x_(i_ell,t_ell)` over assignments for which row labels are constant on blocks of `pi` and column labels are constant on blocks of `rho`. Labels on different blocks are unrestricted and may coincide. Formula (14) can be verified by expanding both distinctness indicators. The coefficient `mu(pi)` is the sum of the signs of permutations whose cycle supports are the blocks of `pi`.

If `pi` has a singleton block, summing the row label attached to that block makes the term zero by the column-margin condition. Similarly, a singleton block of `rho` makes the term zero by the row-margin condition. Thus only partitions without singleton blocks survive.

For any surviving pair, form the bipartite multigraph whose left vertices are the blocks of `pi`, whose right vertices are the blocks of `rho`, and whose edge `ell` joins the two blocks containing `ell`. It has `j` edges, and every vertex has degree at least two. We claim

```math
|H_{\pi,\rho}(X)|\le\|X\|_F^j. \tag{15}
```

Here is an entropy proof of the required finite-sum inequality, included to specify its hypotheses. If `||X||_F=0`, there is nothing to prove. Otherwise put `Y=|X|/||X||_F`, so `sum_(a,b)Y_(a,b)^2=1`. Let

```math
Z=\sum_{\text{vertex labels}}\prod_{e=vw}Y_{i_v,i_w}.
```

If `Z=0`, again there is nothing to prove. For `Z>0`, use the product inside this sum divided by `Z` as a probability distribution `P` on all vertex labels. Let `P_e` denote its marginal on the two endpoints of edge `e`, and write `H` for discrete Shannon entropy.

The chain rule for entropy and the fact that conditioning reduces entropy imply

```math
2H(P)\le\sum_e H(P_e). \tag{16}
```

Indeed, order the vertices. Each `H(P_e)` is at least the sum, over its two endpoints, of the conditional entropy of that vertex given all preceding vertices. Every vertex occurs in at least two edges, and those conditional entropies are nonnegative. Summing gives (16), including parallel edges.

The definition of `P` yields

```math
\log Z=H(P)+\sum_e\mathbb E_{P_e}\log Y.
```

Using (16) and then nonnegativity of relative entropy gives

```math
\begin{aligned}
\log Z
&\le\frac12\sum_e
\left(H(P_e)+\mathbb E_{P_e}\log Y^2\right)\\
&=-\frac12\sum_e\mathop{\mathrm{KL}}(P_e\,\|\,Y^2)
\le0.
\end{aligned}
\tag{17}
```

Every marginal is supported where `Y` is positive, so the displayed logarithms cause no support problem. It follows that `Z<=1`, proving (15) after rescaling.

Finally, the sum of `|mu(pi)|` over partitions without singleton blocks is `D_j`: for a block `B`, the factor `(|B|-1)!` counts cycles on that block, and the assembled permutations have no fixed points. Taking absolute values in (14) and applying (15) therefore gives

```math
|\sigma_j(X)|
\le\frac1{j!}
\left(\sum_{\pi\text{ without singletons}}|\mu(\pi)|\right)^2
\|X\|_F^j
=\frac{D_j^2}{j!}\|X\|_F^j.
```

This is exactly (1).

## 3. Source distinction and consequence for counting

The pre-existing repository statement is in
[DCPRevere/maths-pub, general-layer verifier](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/sub-dittert/graded_verify_universal.py),
in a commit dated 12 August 2026. The companion ratio/GAP code and manuscript were audited separately in `source-audit.md`.

The mathematical exposition before the imports in
[FinnerOne.lean](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/leanproj/FinnerOne.lean)
gives the signed-permutation expansion, fixed-point cancellation, derangement count, and graph reduction. The corresponding prose in
[FinnerTwo.lean](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/leanproj/FinnerTwo.lean)
proves the summation bound by weighted arithmetic–geometric mean and superadditivity. The statement in the sibling
[UniformLayer.lean](https://github.com/DCPRevere/maths-pub/blob/0a1cb0a14fefe85668365d448f9bbaf4dd89d458/combinatorics/permanents/cheon-hwang/leanproj/UniformLayer.lean)
confirms arbitrary real matrices with zero row and column sums. This audit used the mathematical statements and exposition as prior sources; it did not inspect or run formal verification. The missing `UNIFORM-G.md` file is therefore not a missing mathematical input.

The primary Kopotun abstract explicitly posed eventual radial convexity. We found no earlier source explicitly stating its complete resolution, but the prior proved general bound has the direct implication in Section 1. The campaign therefore keeps the Kopotun result uncounted as a new conjecture resolution. The separate proof of the uniform threshold `16k^2` remains valid quantitative research, with its prior tensor input credited.
