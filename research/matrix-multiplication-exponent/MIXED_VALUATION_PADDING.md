# A concrete deformation with nonuniform trivial padding

Status: an exact control construction and a remaining construction
problem. This note constructs a simultaneous diagonal smoothing of
$`N_{2,2}\oplus0_3`$ on an eleven-dimensional space. It uses the
seven-product Strassen identity as an input, so it supplies no new
matrix multiplication rank bound. It demonstrates the kind of mixed
valuation that the unpadded obstruction leaves open.

## 1. A general formula

Suppose a linear matrix tuple $`L_X:\mathbb C^c\to\mathbb C^b`$
has an exact factorization

```math
L_X=U\mathop{\mathrm{diag}}(a_1(X),\ldots,a_r(X))B,
\quad U\in\mathbb C^{b\times r},\quad
B\in\mathbb C^{r\times c},\quad\mathop{\mathrm{rank}}B=c.
                                                               \tag{1}
```

The $`a_s`$ are linear functionals. Complete the columns of
$`B`$ to an invertible matrix $`H=[B\ K]\in\mathbb C^{r\times r}`$,
and write

```math
D(t)=\mathop{\mathrm{diag}}(I_c,tI_{r-c}),
\qquad J(t)=H D(t),\qquad
\Lambda_X=\mathop{\mathrm{diag}}(a_1(X),\ldots,a_r(X)).
```

On $`\mathbb C^b\oplus\mathbb C^r`$, define

```math
M_X(t)=
\begin{pmatrix}
0&U\Lambda_XJ(t)
\\ 0&t^2J(t)^{-1}\Lambda_XJ(t)
\end{pmatrix}.                                  \tag{2}
```

Every entry in (2) is polynomial in $`t`$. The lower-right
entries have powers $`t,t^2,t^3`$, according to the two column
groups of $`D(t)`$. The upper-right block is
$`[L_X\ tU\Lambda_XK]`$. Consequently the special tuple is

```math
M_X(0)=
\begin{pmatrix}0&L_X&0\\0&0&0\\0&0&0\end{pmatrix}
```

in the block order $`\mathbb C^b,\mathbb C^c,
\mathbb C^{r-c}`$. The last $`r-c`$ directions are trivial
at the special fibre.

For $`t\ne0`$, all the matrices (2) are diagonalized by the
same Laurent matrix:

```math
G(t)=\begin{pmatrix}I_b&t^{-2}U\\0&J(t)^{-1}\end{pmatrix},
\qquad
M_X(t)=G(t)
\mathop{\mathrm{diag}}(0_b,t^2\Lambda_X)G(t)^{-1}. \tag{3}
```

Thus commutativity and simultaneous diagonalizability are exact,
not consequences of checking only finitely many coefficients.
Adjoining the identity slice gives a tensor of Laurent border rank
$`b+r`$: (3) supplies the upper bound and the identity slice supplies
the matching flattening bound.

This is an explicit matrix version of the completion mechanism in
Flavi--Jelisiejew--Michałek,
*Symmetric powers: structure, smoothability, and applications*,
arXiv:2408.02754v2, Proposition 5.14, printed page 26:

<https://arxiv.org/pdf/2408.02754v2>.

Equation (1) is an input assumption. Using it with a presumed
quadratic number of rank-one terms would assume the matrix
multiplication upper bound that the construction is meant to prove.

## 2. A fully specified example

Let $`X=\left(\begin{smallmatrix}a&b\\c&d\end{smallmatrix}\right)`$,
and order the entries of the second matrix row by row. Put

```math
A=\begin{pmatrix}
1&0&0&1\\0&0&1&1\\1&0&0&0\\0&0&0&1
\\ 1&1&0&0\\-1&0&1&0\\0&1&0&-1
\end{pmatrix},\qquad
B=\begin{pmatrix}
1&0&0&1\\1&0&0&0\\0&1&0&-1\\-1&0&1&0
\\ 0&0&0&1\\1&1&0&0\\0&0&1&1
\end{pmatrix},
```

and

```math
U=\begin{pmatrix}
1&0&0&1&-1&0&1
\\ 0&0&1&0&1&0&0
\\ 0&1&0&1&0&0&0
\\ 1&-1&1&0&0&1&0
\end{pmatrix}.
```

The seven linear forms $`a_s(X)`$ are the entries of
$`A(a,b,c,d)^{\mathsf T}`$. The seven-product Strassen identity
is the explicit polynomial identity

```math
U\mathop{\mathrm{diag}}(A(a,b,c,d)^{\mathsf T})B
=X\otimes I_2.                                  \tag{4}
```

It can be verified on the four matrix units. Take
$`H=[B\ e_1\ e_2\ e_3]`$, where the $`e_i`$ are the first
three standard basis vectors of $`\mathbb C^7`$.
Then $`\det H=-1`$. Equations (2)--(3), with
$`b=c=4,r=7`$, give the claimed smoothing of
$`N_{2,2}\oplus0_3`$ in dimension eleven.

The checker `check_mixed_valuation_padding.py` verifies (4), the
invertibility of $`H`$, integrality and the special fibre of each
of the four generators, all six pairwise commutators, and the
common diagonalization (3). It uses exact rational polynomial
arithmetic.

## 3. The new term permitted by padding

For the general matrix multiplication module, reorder the special
space as $`U\oplus W\oplus V`$, where
$`U=V=\mathbb C^n\otimes\mathbb C^n`$ and $`W`$ is trivial.
The special tuple has only the $`U\leftarrow V`$ block
$`L_X=X\otimes I_n`$.

A mixed-valuation family can begin with blocks

```math
\begin{pmatrix}
t^2A_X+O(t^3)&tB_X+O(t^2)&L_X+O(t)
\\ O(t^3)&t^2D_X+O(t^3)&tE_X+O(t^2)
\\ O(t^4)&O(t^3)&t^2H_X+O(t^3)
\end{pmatrix}.                                  \tag{5}
```

The degree-two upper-right commutativity equation is

```math
L_XH_Y-L_YH_X+A_XL_Y-A_YL_X
+B_XE_Y-B_YE_X=0.                               \tag{6}
```

The additional alternating product through $`W`$ is absent from
the unpadded problem. In (2), it cancels the corresponding
diagonal-block terms exactly. Thus the already proved unpadded
classification cannot simply be reused after adding trivial
directions.

Equation (6) alone is not a construction. The remaining block
commutators and generic simultaneous diagonalization must also be
established. The open constructive target is to realize a family
of the form (5), or a more general integral family, with
$`\dim W=n^{2+o(1)}`$ without using a matrix multiplication
rank bound of that order as an input. The eleven-dimensional
example is a verified control for this search, not evidence that
the required asymptotic family exists.
