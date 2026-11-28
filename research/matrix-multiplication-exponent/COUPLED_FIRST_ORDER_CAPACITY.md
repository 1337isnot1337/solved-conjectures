# Capacity of a first-order shear with a coupled source

Research status: the theorem below excludes the required asymptotic
parameters for the stated first-order commutator construction. It
allows an arbitrary low-border-rank coupled four-party source,
arbitrary fixed C maps, deficient incident coefficient spans, and an
independent middle choice for every target column. It does not cover
higher-order coefficients or projections that turn a noncentral flag
operator into a scalar on a retained output channel.

## 1. Base sources and the complete first-order condition

Let P,Q be disjoint, nonempty subsets of [q], with |P|=m and |Q|=n.
For z=1,...,r, let S_z be a four-party tensor of complex border rank
at most R_z. Append a C-D wire of dimension w. Fix local A,B,C maps,
with A and B outputs in C^q and C output in a common space W. A
covector d_z on the remaining D input then gives a matrix

```math
M_z(d_z)\in\mathop{\mathrm{Mat}}_q(\mathbb C)\otimes W.       \tag{1}
```

All maps except d_z are fixed. They may depend on z and may be dense.
The append-and-restrict operation has border rank at most R_z w.

Fix arbitrary complex coefficients kappa_(ab)^z for a in P,b in Q.
Use independent Weyl coordinates x_(ab) with derivatives partial_(ab)
and put

```math
N_z=\sum_{a\in P,b\in Q}\kappa_{ab}^zE_{ab}\partial_{ab}.
```

For a target label (i,j), the first-order source construction uses
outside matrices I+epsilon N_z and I-epsilon N_z and the middle
x_(ij) M_z(d_z)/epsilon, together with a second source copy canceling
the epsilon^(-1) term. Its regular leading coefficient is exactly

```math
x_{ij}\sum_{a,b}\partial_{ab}
          [E_{ab},\sum_z\kappa_{ab}^zM_z(d_z)]
       + E_{ij}\sum_z\kappa_{ij}^zM_z(d_z).             \tag{2}
```

This follows by expanding the two outside factors and using
partial_(ab)x_(ij)=x_(ij)partial_(ab)+delta_ai delta_bj.
The remaining term is divisible by epsilon. Matrix entries of M_z
are W-valued complex constants, so no flag-dependent coefficient is
commuted through an operator in (2).

To obtain a central copied target, impose the complete bulk equations

```math
[E_{ab},\sum_z\kappa_{ab}^zM_z(d_z)]=0
              \quad(a\in P,b\in Q).                   \tag{3}
```

Commutation with E_(ab) forces column a to vanish outside row a,
row b to vanish outside column b, and the two diagonal entries
(a,a) and (b,b) to agree. Therefore the second term of (2) is
E_(ij) l_(ij), where

```math
l_{ij}=\sum_z\kappa_{ij}^z(M_z(d_z))_{jj}
       =\sum_z\kappa_{ij}^z(M_z(d_z))_{ii}\in W.         \tag{4}
```

Each output column (i,j) may choose a different tuple of d_z satisfying
(3). Let L be the matrix of the resulting C columns l_(ij). The
quantity to be bounded is its rank; no common tuple d_z is assumed
across target columns.

## 2. The capacity theorem

For a in P and b in Q define the incident coefficient spaces

```math
K_a=\mathop{\mathrm{span}}_{b\in Q}\{\kappa_{ab}\}
       \subseteq\mathbb C^r,\qquad
K_b=\mathop{\mathrm{span}}_{a\in P}\{\kappa_{ab}\}.
```

Then, for every nonnegative integer t,

```math
\mathop{\mathrm{rank}}L
 \le \frac{tw}{m}\sum_z R_z
       +\frac{m}{t+1}\sum_{b\in Q}\dim K_b.             \tag{5}
```

In particular, if R_z<=R, then

```math
\mathop{\mathrm{rank}}L
 \le 2\sqrt{w(\sum_zR_z)(\sum_{b\in Q}\dim K_b)}
 \le 2r\sqrt{nwR}.                                    \tag{6}
```

The trivial zero case is understood if either factor in the square
root vanishes. At w=q, n<=q, R=q^(1+o(1)), r=q^(o(1)), this gives

```math
\mathop{\mathrm{rank}}L\le q^{3/2+o(1)}.                    \tag{7}
```

Thus no such construction gives the required rank q^(2-o(1)). Neither
genericity nor full rank of any incident coefficient space is a
hypothesis. No individual matrix M_z is required to be diagonal or
triangular.

## 3. A universal D output and one column-diagonalizing restriction

Let Y be the finite-dimensional vector space of all tuples
(d_1,...,d_r) satisfying (3). For y in Y write M_z(y) for the z-th
coefficient matrix. Choose a basis y_lambda of Y and form

```math
\mathcal M_z=\sum_\lambda M_z(y_\lambda)\otimes D_\lambda.
```

This tensor is a local D image of the fixed z-th base source with its
wire. Indeed the D map has coordinates given by the z-th covectors
of the basis tuples y_lambda. Hence border-rank(M_z)<=R_z w also
for this universal output. Making Y large does not create another
source copy for each parameter value.

For each a in P choose a basis eta_(a,l), l=1,...,dim K_a, of K_a.
Equation (3) implies that column a of
sum_z eta_(a,l),z M_z(y) is supported only in row a. To see this,
eta_(a,l) is a linear combination of outgoing kappa_(ab), and each
corresponding combination has this column support by (3).
Define its diagonal C vector by

```math
R_{a,l}(y)=\sum_z\eta_{(a,l),z}(M_z(y))_{aa}.            \tag{8}
```

Take the full direct sum of the r tensors M_z. At A use the local map
(z,x) to A_x. At B use

```math
(z,y)\longmapsto
 \begin{cases}
   \sum_l\eta_{(y,l),z}B_{(y,l)},&y\in P,
   \\ 0,&y\notin P.
 \end{cases}
```

Merge the corresponding C and D output spaces. By the preceding
column support, the resulting tensor is exactly

```math
\mathcal T'
 =\sum_{a\in P,l,\lambda}
     A_a\otimes B_{(a,l)}\otimes R_{a,l}(y_\lambda)
                                      \otimes D_\lambda.\tag{9}
```

It has border rank at most w sum_z R_z, by the specified local maps
from the full direct sum.

Put

```math
U_a=\mathop{\mathrm{span}}_{l,y\in Y}\{R_{a,l}(y)\}\subseteq W.
```

The AC|BD flattening of (9) is block diagonal by a. In block a, its
rows have index C and its columns have index (l,lambda). Its rank is
exactly dim U_a. Since flattening rank is at most border rank,

```math
\sum_{a\in P}\dim U_a\le w\sum_zR_z.                  \tag{10}
```

This cut is important: there is no extra factor r from summing the
individual l images. They are already in the same C-row block.

## 4. The scalar dual arrangement and sampling

Let K_0 be the scalar solution space of r-tuples of q by q matrices
satisfying (3), without any source-realizability restriction. Work in
E=K_0^*. For a in P let E_a be the span of the functionals

```math
\epsilon_a(\eta):(M_z)_z\longmapsto
                             \sum_z\eta_z(M_z)_{aa},
                     \qquad\eta\in K_a.
```

Define E_b for b in Q using incoming K_b and diagonal (b,b).
Then dim E_h<=dim K_h<=r. For every edge the scalar functional

```math
\ell_{ab}=\epsilon_a(\kappa_{ab})
          =\epsilon_b(\kappa_{ab})                     \tag{11}
```

belongs to E_a intersect E_b. The equality follows from (3).

For each y in Y, the W-valued matrices M_z(y) satisfy the scalar
equations coefficientwise, so they determine a linear map
T_y:K_0^* to W by evaluation on their coordinate coefficients.
Definition (8) implies T_y(E_a) is contained in U_a for every a.
Each selected target column is T_(y_ij)(ell_(ij)); its choice of
y_(ij) is unrestricted within Y and independent of every other
target column.

Apply the weighted subspace-arrangement theorem from
[MOTION_SUBSPACE_SAMPLING_CAPACITY.md](MOTION_SUBSPACE_SAMPLING_CAPACITY.md), Section 1, with dimensions
dim U_a and dim E_b. That theorem explicitly allows different maps
for different columns. Together with (10) and dim E_b<=dim K_b, it
gives (5).

For completeness, if A=(w/m)sum_zR_z and
B=m sum_b dim K_b are positive, choose t=ceil(sqrt(B/A))-1.
Then tA+B/(t+1)<=2sqrt(AB), which gives the first inequality of (6).
The second uses sum_zR_z<=rR and sum_bdim K_b<=rn.

## 5. Scope and remaining escape

The theorem concerns the full unprojected central identity coefficient
in (2). A construction that retains an Euler or Casimir operator and
projects to an output eigenspace need not satisfy (3). It is not
covered merely because it starts from a first-order shear.

Likewise, a second or higher Laurent coefficient, products of several
non-square-zero outside maps, flag-dependent coefficients in M_z, or
a different middle operator require a fresh coefficient equation.
The current theorem must not be extended to them without proving the
corresponding arrangement and source-rank bounds.

The exact coupled-source commutator candidate was derived by the
operator worker. The universal-column reduction was derived
independently by the root and constructive workers. The AC|BD
flattening giving (10) was identified by the constructive worker and
independently checked by the root and operator workers. The sampling
theorem was established in the separate note cited above.
