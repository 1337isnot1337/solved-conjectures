# A fixed central-degree quantum source with a nondegenerate slice

Research status: this note gives a fixed four-party source with an
explicit ordinary-rank budget and full one-party flattenings. A leading
quantum coefficient is independent of every characteristic-polynomial
parameter. These facts do not supply the missing six-index operator
identity or a matrix multiplication exponent bound.

The Schur and trace conventions agree with
[GRASSMANNIAN_FROBENIUS_SOURCE.md](GRASSMANNIAN_FROBENIUS_SOURCE.md),
Sections 1--3, and the cyclic multiplication convention agrees with
[QUANTUM_GRASSMANNIAN_COMPONENTS.md](QUANTUM_GRASSMANNIAN_COMPONENTS.md).
The required identities are proved again below. No new geometric
semisimplicity or priority claim is made.

## 1. A large set of labels of exactly one degree

Let $`k=2r`$ be a positive even integer, $`s=2k`$,
$`d=k(s-k)=k^2`$, and $`p={2k\choose k}`$.
A partition $`\lambda`$ in the $`k`$-by-$`k`$ rectangle has subset

```math
I_\lambda=\{\lambda_{k+1-a}+a-1:1\le a\le k\}
\subseteq\{0,\ldots,2k-1\},\qquad
|\lambda|=\sum_{i\in I_\lambda}i-\frac{k(k-1)}2.
\tag{1}
```

Let $`\mathcal V`$ consist of the labels satisfying

```math
|I\cap\{0,\ldots,k-1\}|=r,
\qquad \sum_{i\in I}i=\frac{k(2k-1)}2.
\tag{2}
```

Every label in $`\mathcal V`$ has Schur degree $`d/2`$. Write
$`t=|\mathcal V|`$. Then

```math
t\ge\frac{{k\choose r}^2}{r^2+1}
 \ge\frac{p}{(k+1)(r^2+1)}.
\tag{3}
```

For the first inequality, let $`a_j`$ count the $`r`$-subsets of
$`\{0,\ldots,k-1\}`$ with sum $`j`$. There are at most
$`r(k-r)+1=r^2+1`$ possible sums. Put $`H=k(k-1)/2`$.
Complementation within that $`k`$-element half gives
$`a_j=a_{H-j}`$. Writing a subset in (2) as
$`I=L\cup(J+k)`$, where $`|L|=|J|=r`$, its sum condition is
$`\sum L+\sum J=H`$. Consequently

```math
t=\sum_j a_j a_{H-j}=\sum_j a_j^2
\ge\frac{(\sum_j a_j)^2}{r^2+1}
=\frac{{k\choose r}^2}{r^2+1}.
```

Vandermonde's identity and the maximality of the central binomial
coefficient give
$`p=\sum_{j=0}^k{k\choose j}^2\le(k+1){k\choose r}^2`$,
proving the second inequality.

The rectangle $`R=(r)^k`$ belongs to $`\mathcal V`$: its subset is
$`\{r,r+1,\ldots,3r-1\}`$. The following two involutions preserve
$`\mathcal V`$:

```math
I\longmapsto I+k\pmod{2k},\qquad
I\longmapsto\{2k-1-i:i\in I\}.
\tag{4}
```

The first swaps the two equal-sized halves, changing the sum by
$`k r-k r=0`$. The second preserves the sum in (2) and swaps the
halves. The second map is the subset form of the complementary
partition $`\lambda^c=(k-\lambda_k,\ldots,k-\lambda_1)`$.
It is not set-theoretic complementation of a subset.

## 2. The trace and the fixed tensor

Put $`\epsilon=(-1)^{k(k-1)/2}`$ and
$`\Delta(x)=\prod_{a\lt b}(x_b-x_a)`$. Use the alternant definition

```math
s_\lambda(x)=
 \frac{\det(x_b^{\lambda_{k+1-a}+a-1})_{a,b=1}^k}{\Delta(x)}.
\tag{5}
```

For a symmetric polynomial $`f`$, define a polynomial trace by
formal expansion at infinity:

```math
\tau_\kappa(f)=\frac{\epsilon}{k!}
 [x_1^{-1}\cdots x_k^{-1}]
 \frac{f(x)\Delta(x)^2}{\prod_{a=1}^k(x_a^s-\kappa)}.
\tag{6}
```

If $`f`$ is homogeneous of degree $`D`$, every nonzero coefficient
in (6) has quantum degree $`\ell`$ with $`D=d+s\ell`$.
Indeed the total degree of $`f\Delta^2`$ is $`D+k(k-1)`$;
the denominator expansion contributes degree $`-ks-s\ell`$,
and the extracted monomial has degree $`-k`$.

In four copies of the $`t`$-dimensional vector space with basis
$`\{e_\lambda:\lambda\in\mathcal V\}`$, define

```math
S_{\lambda\mu\nu\rho}
=[\kappa^r]\tau_\kappa
              (s_\lambda s_\mu s_\nu s_\rho).
\tag{7}
```

All four degrees in (7) equal $`d/2`$, so their sum is $`2d`$,
and $`d=s r`$. It follows that, exactly,

```math
\tau_\kappa(s_\lambda s_\mu s_\nu s_\rho)
=\kappa^r S_{\lambda\mu\nu\rho}
\qquad(\lambda,\mu,\nu,\rho\in\mathcal V).
\tag{8}
```

There are no other quantum degrees on these four restricted spaces.

## 3. An ordinary-rank budget of p

For any $`\kappa\ne0`$, let $`Z_\kappa`$ be the $`s`$ distinct
roots of $`z^s=\kappa`$. Partial fractions in each variable of (6)
give

```math
\tau_\kappa(f)
=\sum_{J\subseteq Z_\kappa,\ |J|=k}
 w_J(\kappa) f(z_J),\qquad
w_J(\kappa)=\frac{\epsilon\Delta(z_J)^2}
                      {s^k\prod_{z\in J}z^{s-1}}.
\tag{9}
```

The terms with a repeated root vanish because of $`\Delta^2`$;
the $`k!`$ orders of a distinct subset cancel the factor $`k!`$
in (6). Every weight in (9) is nonzero.

At $`\kappa=1`$, put
$`v_J=\sum_{\lambda\in\mathcal V}s_\lambda(z_J)e_\lambda`$.
Equations (8)--(9) give the fixed complex decomposition

```math
S=\sum_{J\subseteq Z_1,\ |J|=k}
 w_J(1)\,v_J^A\otimes v_J^B\otimes v_J^C\otimes v_J^D.
\tag{10}
```

This is an ordinary four-party rank decomposition with $`p`$
terms. It explicitly realizes $`S`$ as a restriction of
$`U_{ABCD}(p)`$: use the vectors $`v_J`$ on the first three
parties and $`w_J(1)v_J`$ on the fourth.
By (3), $`p/t`$ is polynomial in $`k`$, so
$`p=t^{1+o(1)}`$ as $`k\to\infty`$ through even integers.
No interpolation factor or degeneration is needed for (10).

### 3.1. Combining cyclic root-subset orbits

There is a smaller exact rank budget. Let $`\zeta`$ be a primitive
$`2k`$-th root of unity. Replacing the root subset $`J`$ by
$`\zeta J`$ multiplies every selected Schur value by
$`\zeta^{d/2}=(-1)^r`$. It multiplies the weight in (9) by
$`\zeta^{-d}=1`$. Thus the fourfold rank-one summands in (10)
are identical throughout each cyclic root-subset orbit. One may use
one representative per orbit and multiply its weight by its orbit
size.

The number of these orbits is

```math
b_k=\frac1{2k}\sum_{a\mid k}\varphi(a)
                     {2k/a\choose k/a}.
\tag{10a}
```

To verify this count, a cyclic rotation whose cycles have length
$`a`$ fixes a k-subset exactly when $`a\mid k`$, in which case
one chooses $`k/a`$ of its $`2k/a`$ cycles. There are
$`\varphi(a)`$ rotations of that cycle length. Averaging the
fixed-subset counts proves (10a). Consequently

```math
\mathop{\mathrm{rank}}S\le b_k\le p.
\tag{10b}
```

For $`k=2`$, $`t=b_2=2`$, so the nondegenerate slice below
already proves ordinary and border rank two. For $`k=4`$, the
source has local dimension eight and $`b_4=10`$. Section 7 gives
an exact determinant-one flattening minor, proving that its ordinary
and border ranks are both exactly ten.

## 4. A signed permutation slice and full flattenings

For all rectangle partitions $`\lambda,\mu`$, the trace pairing is

```math
\tau_\kappa(s_\lambda s_\mu)=\delta_{\mu,\lambda^c}.
\tag{11}
```

For a direct proof, multiply the two alternants in (5). In each
variable the degree is at most $`2s-2`$, so the only allowed
coefficient in (6) is exponent $`s-1`$ in every variable. It
vanishes unless the exponent subsets are related by reflection
$`a\mapsto s-1-a`$. In that case there are $`k!`$ terms with
sign $`\epsilon`$, giving (11).

The rectangle polynomial is $`s_R=e_k^r`$, where
$`e_k=x_1\cdots x_k`$. Therefore $`s_R^2=e_k^k`$.
For $`\lambda\in\mathcal V`$, multiplication of its alternant
by $`e_k^k`$ adds $`k`$ to every exponent. Exactly $`r`$
exponents then wrap modulo $`s=2k`$. Evaluation at roots of
$`z^s=\kappa`$ gives one factor $`\kappa`$ for each wrap,
and reordering the two equal-sized blocks gives sign
$`(-1)^{r^2}=(-1)^r`$. If $`\mathop{\mathrm{sh}}\lambda`$
has subset $`I_\lambda+k\pmod{2k}`$, then

```math
e_k^k s_\lambda(z_J)
=(-1)^r\kappa^r s_{\mathop{\mathrm{sh}}\lambda}(z_J).
\tag{12}
```

Use (9), then (11), in (12). Comparing the coefficient in (8)
gives

```math
S_{\lambda\mu R R}
=(-1)^r\delta_{\mu,(\mathop{\mathrm{sh}}\lambda)^c}.
\tag{13}
```

Both maps in (4) preserve $`\mathcal V`$, so (13) is a signed
permutation matrix of order $`t`$. Contracting the C and D legs
of $`S`$ with the R basis covectors therefore gives an AB matrix
of rank $`t`$. The A and B flattening ranks of $`S`$ are at
least $`t`$, and equal $`t`$ by their local dimensions.
The tensor is symmetric in its four factors, giving the same
conclusion for C and D.

These are conciseness statements. They do not give a two-party
flattening of order $`t^2`$ or the required target conversion.

## 5. Independence of all characteristic-polynomial parameters

Let $`c_1,\ldots,c_s,\kappa`$ be independent central parameters.
Define

```math
P_{c,\kappa}(x)=x^s+\sum_{j=1}^s c_j x^{s-j}-\kappa,
\qquad
\tau_{c,\kappa}(f)=\frac{\epsilon}{k!}
 [x_1^{-1}\cdots x_k^{-1}]
       \frac{f(x)\Delta(x)^2}{\prod_a P_{c,\kappa}(x_a)}.
\tag{14}
```

Expand each reciprocal as

```math
\frac1{P_{c,\kappa}(x)}
=x^{-s}\sum_{m\ge0}
 \left(\kappa x^{-s}-\sum_{j=1}^s c_j x^{-j}\right)^m.
\tag{15}
```

For polynomial $`f`$, only finitely many terms contribute to
the selected coefficient. The result is a polynomial in all the
parameters. Assign positive weights $`\mathop{\mathrm{wt}}(c_j)=j`$
and $`\mathop{\mathrm{wt}}(\kappa)=s`$. The same degree count
used after (6) shows that for homogeneous $`f`$ the trace is
homogeneous of weight $`\deg f-d`$.

For a product of four selected Schur polynomials, that weight is
$`d=s r`$. Consequently its coefficient of $`\kappa^r`$
has parameter weight zero. Since every $`c_j`$ has positive
weight, this coefficient is independent of every $`c_j`$.
Setting them all to zero identifies it with (7):

```math
[\kappa^r]\tau_{c,\kappa}
       (s_\lambda s_\mu s_\nu s_\rho)
=S_{\lambda\mu\nu\rho}.
\tag{16}
```

At parameters where $`P_{c,\kappa}`$ has distinct roots, ordinary
partial fractions give the corresponding exact root-subset trace
formula with weight
$`\epsilon\Delta(z_J)^2/\prod_{z\in J}P'_{c,\kappa}(z)`$.
This statement and (16) follow from (14)--(15); no identification
with geometric equivariant quantum cohomology is assumed.

## 6. What is still required for an operator construction

The four-party tensor (7) is fixed, has the legal unit budget (10),
and has the exact slice (13). Formula (16) can be used as a
coefficient identity in commuting parameter variables.

It does not authorize a flag-dependent change of source basis.
If the local operators shift or differentiate $`q`$, factors in
a root-evaluation decomposition depending on $`q`$ cannot be
moved through those operators without the corresponding translated
or differentiated coefficients. Likewise, coefficient extraction
from an incomplete operator expression is not an additional local
tensor map. A positive use still needs the complete four-party
source contraction with every local index and operator order
specified, followed by a proved finite-flag realization.

## 7. Exact rank ten for the first nontrivial central source

For $`k=4`$, order the eight selected subset labels as

```math
\begin{split}
I_0&=(0,1,6,7),& I_1&=(0,2,5,7),\\
I_2&=(0,3,4,7),& I_3&=(0,3,5,6),\\
I_4&=(1,2,4,7),& I_5&=(1,2,5,6),\\
I_6&=(1,3,4,6),& I_7&=(2,3,4,5).
\end{split}
```

In the $`AB\mid CD`$ flattening, select the same ten ordered
row and column pairs

```math
(0,0),(0,1),\ldots,(0,7),(1,3),(1,4).
```

Formula (9), evaluated exactly in $`\mathbb Q[\zeta]/(\zeta^4+1)`$,
gives the following integer block matrix:

```math
\begin{pmatrix}P&B\\B^{\mathsf T}&D\end{pmatrix},\qquad
B=\begin{pmatrix}
0&0\\1&1\\1&1\\2&0\\0&2\\1&1\\1&1\\0&0
\end{pmatrix},\qquad
D=\begin{pmatrix}9&4\\4&9\end{pmatrix}.
\tag{17}
```

Here $`P`$ is the eight-by-eight permutation matrix which swaps
0 with 7 and 1 with 6 and fixes the other four labels. Thus
$`P^{-1}=P`$, $`\det P=1`$, and direct multiplication gives

```math
B^{\mathsf T}PB=\begin{pmatrix}8&4\\4&8\end{pmatrix},
\qquad D-B^{\mathsf T}PB=I_2.
```

The determinant of (17) is one. Hence the flattening rank is at
least ten. The ten-orbit decomposition in Section 3.1 bounds both
ordinary and border rank by ten. Matrix rank bounds tensor border
rank from below, proving

```math
\mathop{\mathrm{rank}}S
=\underline{\mathop{\mathrm{rank}}}S=10
\qquad(k=4,t=8).
\tag{18}
```

The checker `check_central_quantum_orbits.py` reconstructs every
entry in (17) by exact cyclotomic arithmetic, verifies that each
entry is an integer, and evaluates its determinant over the
rationals. A finite-field computation only selects the displayed
minor; it is not the final rank certificate. This supplies a
ten-term coupled source for subsequent tests, rather than an
uncoupled replacement of its four source indices.
