# Lieb's permanental dominance conjecture

Date: 20 November 2026, America/Chicago.

**Scope:** an auxiliary obstruction to a proposed counterexample transfer.
This note proves an inequality for rank at most two in order six and applies
it to the six exceptional $`S_5`$ sign characters. It does not resolve MINC
Conjecture 42 or Problem 2, and it is not counted as one of the user's requested
full resolutions. The root research task continues beyond this result.

## 1. Statements

Let $`A\succeq0`$ be a complex Hermitian matrix of order six and rank at
most two. Write

```math
P=\mathop{\mathrm{per}}A,\qquad h=\prod_{i=1}^6a_{ii},\qquad
\Lambda=\mathop{\mathrm{tr}}C_{(3,3)}(A).
```

The Fourier convention is
$`C_\lambda(A)=\sum_{g\in S_6}(\prod_i a_{i,g(i)})\rho_\lambda(g)`$.
The $`(3,3)`$ block has rank at most one at rank two, so $`\Lambda`$ is
its only possibly nonzero eigenvalue.

We prove

```math
\boxed{\Lambda\leq2P-9h.}\tag{1}
```

For each exceptional subgroup $`H\cong S_5\leq S_6`$, with character
$`\mathop{\mathrm{sgn}}|_H`$, we also prove

```math
\boxed{f_{H,\mathop{\mathrm{sgn}}}(A)
       \leq\frac{\Lambda}{2}
       \leq P-\frac92h.}\tag{2}
```

Thus this entire rank-two subgroup channel cannot provide a counterexample,
including configurations unrelated to the known permanent-on-top examples.
The first inequality in (2) is an alignment constraint coming from the Segre
cubic. It is stronger than simply using the $`5/6`$ coefficient from induced
characters.

If some $`a_{ii}=0`$, the corresponding row and column of $`A`$ are zero;
all degree-six functions in (1)--(2) vanish. Otherwise positive diagonal
scaling reduces the proof to $`a_{ii}=1`$. All three quantities $`P,h,\Lambda`$
and every subgroup function scale by the same factor.

## 2. Exact invariant coordinates and normalization

There are six conjugates of the exceptional subgroup. Its induced sign
character is $`[1^6]+[3,3]`$. In the tensor representation
$`(\mathbb C^2)^{\otimes6}`$, the alternating component vanishes and
the $`(3,3)`$ multiplicity space has dimension one.

Index the weight-three tensor basis by the twenty three-subsets $`I`$ of
$`\{1,\ldots,6\}`$. The sign projector for each exceptional subgroup is
$`s_i s_i^T/20`$, where all twenty entries of $`s_i`$ are $`\pm1`$.
The six signs can be chosen so that

```math
\langle s_i,s_j\rangle=
\begin{cases}20&i=j,\\-4&i\ne j,\end{cases}
\qquad \sum_{i=1}^6s_i=0.
\tag{3}
```

For Gram columns $`v_j=(x_j,y_j)^T`$, put

```math
p_i(v_1,\ldots,v_6)=\sum_{|I|=3}s_i(I)
                     \prod_{j\in I}y_j\prod_{j\notin I}x_j.
```

The projector normalization gives

```math
f_{H_i,\mathop{\mathrm{sgn}}}(A)=120\frac{|p_i|^2}{20}=6|p_i|^2,
\qquad \Lambda=6\sum_{i=1}^6|p_i|^2.
\tag{4}
```

The second identity follows either from the tight frame (3), or from Fourier
inversion and the six conjugate subgroup projections.

These coordinates obey the polynomial identities

```math
\sum_i p_i=0,\qquad \sum_i p_i^3=0.\tag{5}
```

They are the classical Segre-cubic coordinates for six ordered points on
$`\mathbb P^1`$; the permutation action on the coordinates is related to
the action on the points by the outer automorphism of $`S_6`$, with the
sign twist appropriate to $`(3,3)`$. Howard--Millson--Snowden--Vakil give
this description in their primary paper, Section 2.1. The checker here also
verifies (3)--(5) directly as integer projector and polynomial identities, so
the normalization does not depend on identifying coordinates by name.

For every $`i`$, the cubic relation implies

```math
|p_i|^3=\left|\sum_{j\ne i}p_j^3\right|
\leq\sum_{j\ne i}|p_j|^3
\leq\left(\sum_{j\ne i}|p_j|^2\right)^{3/2}.
```

Therefore $`|p_i|^2\leq\frac12\sum_j|p_j|^2`$. Together with (4), this
proves the first inequality in (2). The linear relation in (5) is not needed
for the inequality itself.

## 3. Bloch-vector formulas

Assume now that all Gram columns are unit vectors. Let
$`s_1,\ldots,s_6\in\mathbb R^3`$ be their unit Bloch vectors, so that

```math
|\langle v_i,v_j\rangle|^2=\frac{1+s_i\cdot s_j}{2},\qquad
|[v_i,v_j]|^2=\frac{1-s_i\cdot s_j}{2}.
```

Define $`S_1`$ as the sum of $`s_i\cdot s_j`$ over the fifteen pairs;
$`S_2`$ as the sum of products over the forty-five unordered pairs of
disjoint edges; and $`S_3`$ as the sum of products over the fifteen perfect
matchings. Then

```math
P=\frac34(105+35S_1+7S_2+S_3),\qquad
\Lambda=\frac34(15-3S_1+S_2-S_3).\tag{6}
```

For the first formula, use
$`P=7!\int_{\mathbb CP^1}\prod_i|\langle v_i,u\rangle|^2du`$, expand
the product, and use the spherical second, fourth and sixth moments, whose
pairing denominators are $`3,15,105`$.

For the second formula, let $`T_{ij}=|[v_i,v_j]|^2`$. The fifteen products
of three antisymmetric two-spinor tensors span the five-dimensional spin-zero
space. Their tensor squared norms are eight, and their orbit-frame operator
is consequently $`24`$ times the spin-zero projector. The trace of the
$`(3,3)`$ Fourier block is $`720/5=144`$ times the squared norm of that
projected tensor. Hence

```math
\Lambda=6\mathop{\mathrm{haf}}(T).
```

Expanding $`T_{ij}=(1-s_i\cdot s_j)/2`$ gives the second formula in (6).

Thus (1) is equivalent to

```math
E:=195+73S_1+13S_2+3S_3\geq12,\tag{7}
```

because $`2P-\Lambda=(3/4)E`$.

## 4. Moment tensors and a square completion

Put

```math
S=\sum_i s_i,\quad T=\sum_i s_i s_i^T,\quad
U=\sum_i s_i^{\otimes3},\quad L=\|S\|^2,
```

and abbreviate

```math
a=S^TTS,\quad b=S^TT^2S,\quad t_j=\mathop{\mathrm{tr}}T^j,
\quad c=\langle U,S^{\otimes3}\rangle,\quad
d=\langle U,\mathop{\mathrm{Sym}}(S\otimes T)\rangle,
\quad u=\|U\|^2.
```

Here $`\mathop{\mathrm{Sym}}(S\otimes T)`$ is the average of the three
placements of $`S`$; all tensor norms are Euclidean Frobenius norms. The
unit-vector assumptions give $`\mathop{\mathrm{tr}}T=6`$ and $`0\leq L\leq36`$.
Direct expansion gives

```math
S_1=\frac L2-3,\qquad
S_2=\frac{L^2}{8}-\frac L2+\frac{t_2}{4}-\frac a2.\tag{8}
```

The sixth-order matching sum is

```math
\begin{aligned}
S_3={}&-6+\frac L2+\frac{L^2}{8}+\frac{L^3}{48}
       -a-\frac{La}{4}+\frac{Lt_2}{8}
       +\frac{3t_2}{4}-\frac{t_3}{6}
     \\ &+\frac b2+\frac c3-d+\frac u3.
\end{aligned}\tag{9}
```

One derivation of (9) uses a standard real Gaussian $`g\in\mathbb R^3`$
and $`z_i=s_i\cdot g`$. Then $`S_3=\mathbb E\prod_i z_i`$. Expand
$`720e_6(z)`$ by Newton's identities and apply Wick's formula. The exact
checker includes all eleven resulting power-sum expectations, rather than
checking (9) only on selected configurations.

Define the symmetric cubic tensor

```math
Z=U-\frac32\mathop{\mathrm{Sym}}(S\otimes T)+\frac12S^{\otimes3}.
```

Using
$`\|\mathop{\mathrm{Sym}}(S\otimes T)\|^2=(Lt_2+2b)/3`$ and
$`\langle\mathop{\mathrm{Sym}}(S\otimes T),S^{\otimes3}\rangle=La`$,
substitution of (8)--(9) into (7) gives exactly

```math
\begin{aligned}
E={}&\|Z\|^2-42+\frac{63L}{2}+2L^2-\frac{3L^3}{16}
   \\ &+\left(-\frac{19}{2}+\frac{3L}{4}\right)a
    +\left(\frac{11}{2}-\frac{3L}{8}\right)t_2-\frac{t_3}{2}.
\end{aligned}\tag{10}
```

For a symmetric cubic tensor in $`\mathbb R^3`$, the trace map satisfies

```math
\|Z\|^2\geq\frac35\|\mathop{\mathrm{tr}}Z\|^2.
```

Indeed the adjoint of the trace map is
$`v\mapsto\mathop{\mathrm{Sym}}(v\otimes I)`$, whose trace is $`5v/3`$.
Here

```math
\mathop{\mathrm{tr}}Z=\left(\frac L2-2\right)S-TS.
```

Consequently (10) yields

```math
\begin{aligned}
E\geq R:={}&-42+\frac{339L}{10}+\frac{4L^2}{5}-\frac{3L^3}{80}
\\ &+\left(-\frac{71}{10}+\frac{3L}{20}\right)a
 +\left(\frac{11}{2}-\frac{3L}{8}\right)t_2
 -\frac{t_3}{2}+\frac{3b}{5}.
\end{aligned}\tag{11}
```

## 5. An elementary two-variable polynomial certificate

Diagonalize $`T`$. Its eigenvalues are nonnegative and sum to six. For
$`L>0`$, the terms involving $`a,b`$ in (11) are a convex combination of
their values $`a=Lx,b=Lx^2`$, where $`x`$ is one eigenvalue; call the
others $`y,z`$. The case $`L=0`$ follows by the same expression without
these terms. Thus it suffices to bound

```math
\begin{aligned}
R(L;x,y,z)={}&-42+\frac{339L}{10}+\frac{4L^2}{5}-\frac{3L^3}{80}
\\ &+L\left[\left(-\frac{71}{10}+\frac{3L}{20}\right)x+\frac{3x^2}{5}\right]
\\ &+\left(\frac{11}{2}-\frac{3L}{8}\right)(x^2+y^2+z^2)
 -\frac{x^3+y^3+z^3}{2}
\end{aligned}
```

for $`0\leq L\leq36`$, $`x,y,z\geq0`$, and $`x+y+z=6`$.
For fixed $`L,x`$, this is affine in $`yz`$. It therefore lies between
its values at $`yz=0`$ and $`y=z=(6-x)/2`$. Call these two polynomials
$`F_0(L,x)`$ and $`F_b(L,x)`$.

Both have the form

```math
F=a_0(x)+a_1(x)L+a_2(x)L^2-\frac3{80}L^3,
\qquad a_2=\frac45+\frac{3x}{20},
```

where

| Polynomial | $`a_0`$ | $`a_1`$ |
|---|---|---|
| $`F_0`$ | $`30+2(x-3)^2`$ | $`(1632-208x-12x^2)/80`$ |
| $`F_b`$ | $`12+\frac38(12-x)(x-2)^2`$ | $`(2172-388x+3x^2)/80`$ |

Let $`t=L/36`$. The cubic Bernstein coefficients are

```math
B_0=a_0,\quad B_1=a_0+12a_1,\quad
B_2=a_0+24a_1+432a_2,\quad B_3=F(36,x).
```

For $`0\leq x\leq6`$, all four are at least twelve. Here are explicit
certificates for every required lower bound:

```math
\begin{array}{ll}
F_0:\quad
a_1+\frac35=\frac{(6-x)(3x+70)}{20},&
B_1-\frac{204}{5}=\frac{(6-x)(210-x)}5,\\[3pt]
\displaystyle
B_3-\frac{348}{5}=\frac{x[342+17(6-x)]}{5};&
\\[-2pt]
F_b:\quad
a_1+\frac35=\frac{(6-x)(370-3x)}{80},&
B_1-\frac{204}{5}
=\frac{(6-x)[15x^2+168(6-x)+1092]}{40},\\[3pt]
\displaystyle
B_3-\frac{1473}{5}
=x\left[\frac3{10}+x\left(\frac{51}{10}+\frac{3(6-x)}8\right)\right].&
\end{array}
```

Also $`a_0\geq12`$, $`a_1\geq-3/5`$, and $`a_2\geq4/5`$, so
$`B_2\geq12-72/5+1728/5=1716/5>12`$.

Since the Bernstein basis is nonnegative and sums to one for $`0\leq t\leq1`$,
both $`F_0`$ and $`F_b`$ are at least twelve. Their interpolation in
$`yz`$, and the earlier convex combination over the eigen-directions of
$`T`$, prove $`R\geq12`$. Equations (7) and (11) now prove (1).

The octahedral Bloch configuration $`\{\pm e_1,\pm e_2,\pm e_3\}`$
has $`S=0,T=2I,U=0`$, and gives $`P=15`$, $`\Lambda=21`$. Hence the
coefficient nine in (1) is attained. No assumption that arbitrary configurations
can be transformed to a balanced frame is used in the proof.

## 6. Verification and limits

```sh
python segre_coordinate_check.py
python verify_rank_two_six_bound.py
```

The first checker uses integer arithmetic to construct the six subgroup
projectors, their frame Gram matrix, and the two polynomial relations (5).
The second uses SymPy for the exact Newton, tensor-completion, spectral, and
Bernstein identities. It also independently checks (6) on exact Gram inputs,
including the equality configuration. The outputs are
`segre_coordinate_certificate.json` and `rank_two_six_bound_certificate.json`.

The result does not cover rank three or higher. In those ranks, the
$`(3,3)`$ Fourier block need not have rank one, and the six scalar Segre
coordinates do not describe the relevant generalized matrix functions.
Nor does (1) establish any bound for other orders or other Specht blocks.

## 7. Sources

- B. Howard, J. Millson, A. Snowden, R. Vakil, *A description of the outer
  automorphism of $`S_6`$, and the invariants of six points in projective
  space*, J. Combin. Theory Ser. A 115 (2008).
  [Author PDF, Section 2.1](https://math.stanford.edu/~vakil/files/sixjan2308.pdf);
  [DOI](https://doi.org/10.1016/j.jcta.2008.01.004).
- B. Howard, J. Millson, A. Snowden, R. Vakil, *The relations among invariants
  of points on the projective line*, C. R. Math. Acad. Sci. Paris 347 (2009),
  1177--1182.
  [Author PDF](https://math.umd.edu/~millson/papers/hmsvCRjune1309french.pdf).
- The open target and current scope are recorded at
  [MINC Conjecture 42](https://yair-lavi.com/mincs-list/conjecture-42/index.html)
  and [Problem 2](https://yair-lavi.com/mincs-list/problem-2/index.html).

The invariant identities are classical. No novelty claim is made for them.
The quantitative inequality (1) requires a separate literature check before
any claim of novelty; its proof and limited scope do not depend on such a claim.
