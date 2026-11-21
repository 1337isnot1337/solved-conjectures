# Gyires's ratio inequality: an exact substochastic-core transfer

Research checkpoint, 20 November 2026 (America/Chicago). This is a reduction for the full
Gyires conjecture, not a proof or disproof. No negative core has been obtained.
The completion identity and limiting argument are checked in the
[independent review](gyires_transfer_review.md).

## The target and the remaining test

Write $`d_N=N!/N^N`$. Gyires's conjecture states that every doubly stochastic
matrix $`A`$ satisfies

```math
4(\mathop{\mathrm{per}}A)^2
\ge d_N\{\mathop{\mathrm{per}}(AA^T)+\mathop{\mathrm{per}}(A^TA)
                   +2\mathop{\mathrm{per}}(A^2)\},
```

with equality only at the uniform matrix. The current
[Minc C20 page](https://yair-lavi.com/mincs-list/conjecture-20/index.html)
still lists the unrestricted conjecture as open.

For a nonnegative $`m\times m`$ matrix $`B`$ with row and column sums at most
one, put

```math
r=B\mathbf1,\quad c=B^T\mathbf1,\quad
u=\mathbf1-r,\quad v=\mathbf1-c,\quad
s=\sum_{ij}b_{ij},\quad q=m-s.
```

Define the finite matching sum

```math
Z(B)=\sum_{\mathcal M}
 \left(\prod_{(i,j)\in\mathcal M}b_{ij}\right)
 \left(\prod_{i\text{ unmatched}}u_i\right)
 \left(\prod_{j\text{ unmatched}}v_j\right),
 \qquad F(B)=e^sZ(B).
```

The sum is over all matchings of the complete bipartite graph on the core
row and column sets; zero edge weights simply remove terms.

The exact sufficient counterexample criterion obtained below is

```math
\boxed{\quad
4F(B)^2<
F(BB^T)+F(B^TB)+2F(B^2).
\quad} \tag{1}
```

Any one core satisfying (1) would disprove the full conjecture, through an
unbounded family of genuine doubly stochastic matrices. This note does
not assert (1) for any core. A failure of only
$`F(B)^2\ge F(BB^T)`$ is insufficient for (1).

## Completion and composition

For every integer $`M\ge m`$, set

```math
C_M(B)=
\begin{pmatrix}
B & u\mathbf1_M^T/M\\
\mathbf1_Mv^T/M & (M-q)\mathbf1_M\mathbf1_M^T/M^2
\end{pmatrix}.
\tag{2}
```

This is nonnegative and doubly stochastic. Its tail rows are identical,
and its tail columns are identical.

If $`B,C`$ are two substochastic cores of the same order, then

```math
\boxed{\quad
C_M(B)C_M(C)=C_M\!\left(BC+\frac{u_Bv_C^T}{M}\right).
\quad} \tag{3}
```

Indeed, block multiplication gives the displayed top-left core $`D_M`$.
The product is doubly stochastic and has identical tail rows and identical
tail columns. Those properties uniquely specify all other blocks from
$`D_M`$: the top-right block must be
$`(\mathbf1-D_M\mathbf1)\mathbf1_M^T/M`$, the bottom-left block is the
transpose analogue, and the bottom-right entries follow from the tail row
sum. Thus the product is exactly (2) for $`D_M`$. In particular $`D_M`$ is
substochastic, as is also clear from its occurrence inside a nonnegative
doubly stochastic matrix.

Transposition commutes with the completion:
$`C_M(B)^T=C_M(B^T)`$. Consequently the three cores for the Gram matrices
and the square are exactly

```math
BB^T+\frac{uu^T}{M},\qquad
B^TB+\frac{vv^T}{M},\qquad
B^2+\frac{uv^T}{M}. \tag{4}
```

No approximate identification of the tail blocks is needed.

## Uniform normalized-permanent limit

For $`M>m`$, let

```math
b=\frac{M-q}{M^2}>0.
```

Choose core row and column sets $`S,T`$ of equal size $`k`$, and write
$`h=m-k`$. The permanent terms whose core-to-core edges cover exactly
$`S,T`$ contribute

```math
\mathop{\mathrm{per}}B[S,T]\,
\frac{(M!)^2}{(M-h)!}\,
b^{M-h}M^{-2h}
\prod_{i\notin S}u_i\prod_{j\notin T}v_j.
\tag{5}
```

The two factors $`(M)_h`$ assign distinct tail columns and rows to the
unmatched core vertices. The remaining $`(M-h)\times(M-h)`$ constant tail
block contributes $`(M-h)!b^{M-h}`$, giving (5).

Factoring $`M!b^M`$ from the sum gives

```math
\frac{\mathop{\mathrm{per}}C_M(B)}{d_{M+m}}
=
\frac{d_M}{d_{M+m}}(1-q/M)^M
\sum_{\substack{S,T\subseteq[m]\\|S|=|T|}}
\mathop{\mathrm{per}}B[S,T]\,
\frac{(M)_{m-|S|}}{M^{m-|S|}}
(1-q/M)^{-(m-|S|)}
\prod_{i\notin S}u_i\prod_{j\notin T}v_j .
\tag{6}
```

Here the permanent of the empty submatrix equals one. Stirling's formula
gives $`d_M/d_{M+m}\to e^m`$. Since $`0\le q\le m`$, all the other scalar
factors converge uniformly over the compact space of substochastic cores:

```math
(1-q/M)^M\to e^{-q},\qquad
\frac{(M)_h}{M^h}(1-q/M)^{-h}\to1
\quad(0\le h\le m).
```

The sum in (6) has finitely many terms, with bounded polynomial factors.
Therefore

```math
\boxed{\quad
\frac{\mathop{\mathrm{per}}C_M(B)}{d_{M+m}}\longrightarrow F(B)
\quad} \tag{7}
```

uniformly over all substochastic $`m\times m`$ cores.

The matching sum is a polynomial in the entries of $`B`$, $`u`$, and $`v`$.
Thus it remains valid and continuous when a row or column sum is exactly
one. Nothing in (5)-(7) divides by an individual monomer weight.

For completeness, van der Waerden's inequality applied to (2) and then
(7) yields $`F(B)\ge1`$. This is a deduction from the classical theorem,
not an independent new correlation theorem.

Applying (7) to the cores in (4), which converge to $`BB^T,B^TB,B^2`$,
proves

```math
\begin{aligned}
\frac{\mathop{\mathrm{per}}(C_M(B)C_M(B)^T)}{d_{M+m}}&\to F(BB^T),\\
\frac{\mathop{\mathrm{per}}(C_M(B)^TC_M(B))}{d_{M+m}}&\to F(B^TB),\\
\frac{\mathop{\mathrm{per}}(C_M(B)^2)}{d_{M+m}}&\to F(B^2).
\end{aligned}
\tag{8}
```

The normalized Gyires polynomial therefore converges to the difference
between the two sides of (1). A strictly negative limiting difference
remains negative for every sufficiently large $`M`$. This proves the
counterexample transfer.

The converse is not asserted. Establishing the limiting inequality for
all cores would not, by this argument, prove finite-order Gyires.

## A symmetric criterion

If $`B=B^T`$, then the right side of (1) is $`4F(B^2)`$.
Thus $`F(B)^2\lt F(B^2)`$ is sufficient.

There is also a symmetric lift of an arbitrary core. Set

```math
D=\begin{pmatrix}0&B\\B^T&0\end{pmatrix}.
```

This is symmetric and substochastic. Independent row and column
permutations do not change $`F`$, and $`F`$ is multiplicative on block
direct sums. Hence

```math
F(D)=F(B)^2,\qquad
F(D^2)=F(BB^T)F(B^TB).
```

Therefore

```math
\boxed{\quad F(B)^4\lt F(BB^T)F(B^TB)\quad} \tag{9}
```

would also give a full Gyires counterexample, through the symmetric
completions $`C_M(D)`$.

## Poisson interpretation and its limitation

Let $`Z_{ij}`$, $`U_i`$, and $`V_j`$ be independent Poisson variables with
means $`b_{ij}`$, $`u_i`$, and $`v_j`$, respectively. Put

```math
Y_i=U_i+\sum_jZ_{ij},\qquad X_j=V_j+\sum_iZ_{ij}.
```

Each margin is Poisson with mean one. Within the $`X`$ family, and within
the $`Y`$ family, coordinates are independent. On the event that all
$`X_j,Y_i`$ equal one, the nonzero $`Z_{ij}`$ form a matching. The sum of
the means of all independent variables is $`2m-s`$, so

```math
F(B)=e^{2m}\Pr(X_1=\cdots=X_m=Y_1=\cdots=Y_m=1). \tag{10}
```


Equivalently, one can generate $`Y`$ by independently moving particles
from input coordinate $`j`$ to output coordinate $`i`$ with probability
$`b_{ij}`$, discarding the residual probability $`1-c_j`$, and adding
independent Poisson immigrants with means $`u_i`$. This gives a
stationary Poisson channel; its adjoint is the channel for $`B^T`$.
The multiplication law is ordinary multiplication of the intensity
matrices. Formula (10) makes (1) a specific correlation comparison for
these channels. Stationarity or Cauchy--Schwarz alone does not prove that
comparison.

## An additive shortcut fails

A tempting sufficient bound is

```math
\mathop{\mathrm{per}}(AA^T)\le 2\mathop{\mathrm{per}}A-d_n. \tag{11}
```

It would imply the stronger Gram inequality because

```math
(\mathop{\mathrm{per}}A)^2-d_n\mathop{\mathrm{per}}(AA^T)
\ge(\mathop{\mathrm{per}}A-d_n)^2.
```

But (11) is false.

For $`n\ge3`$, let $`A=(I_n+P_n)/2`$, where $`P_n`$ is one $`n`$-cycle.
Then

```math
\mathop{\mathrm{per}}A=2^{1-n},\qquad
\mathop{\mathrm{per}}(AA^T)=
\frac{(1+\sqrt2)^n+(1-\sqrt2)^n+2}{4^n}. \tag{12}
```

To obtain the second formula, expand the permanent of
$`2I_n+P_n+P_n^T`$. A permutation consists either of disjoint adjacent
transpositions and fixed points, or of one of the two directed full
cycles. The former sum is the monomer-dimer partition function of a
cycle with monomer weight two and edge weight one. Its transfer matrix
has eigenvalues $`1+\sqrt2`$ and $`1-\sqrt2`$.

Already at $`n=6`$,

```math
\mathop{\mathrm{per}}A=\frac1{32},\qquad
\mathop{\mathrm{per}}(AA^T)=\frac{25}{512},\qquad d_6=\frac5{324},
```

and the left side of (11) minus its right side is $`73/41472>0`$.
Moreover $`\mathop{\mathrm{per}}(AA^T)/\mathop{\mathrm{per}}A`$ grows
asymptotically like $`\tfrac12((1+\sqrt2)/2)^n`$; hence (11) fails for
all sufficiently large cycles.

This does not contradict Gyires: the stronger Gram ratio in the
displayed order-six example is $`1/50>5/324`$, and the entire
two-permutation family is already covered by prior results on the live
C20 page. The calculation only removes the additive proof shortcut.

## Checks and sources

The companion script checks the exact composition identity, finite
counting formula, transposition and symmetric-lift identities, and the
order-six obstruction, using rational arithmetic and an independent
permanent expansion. These checks support the displayed algebra; they
are not a replacement for the limiting proof or a numerical resolution.

The completion permanent formula at general radial parameter was
recorded earlier in
[hwang_substochastic_padding.md](hwang_substochastic_padding.md).
The new point used here is exact closure of these completions under
matrix multiplication and its application to all four terms in C20.

Primary context:
B. Gyires, *On permanent inequalities*, Colloq. Math. Soc. János Bolyai 18
(1978), 471–484; D. K. Chang, *On two permanental conjectures*, Linear and
Multilinear Algebra 26 (1990), 207–213,
[DOI](https://doi.org/10.1080/03081089008817977).
The original Gyires paper was not retrieved in full in this pass.
The live statement and status are taken from the linked Minc C20 page.
No historical-priority claim is made for this reduction.

