# Orthogonal auxiliary padding for Marcus's conjecture

Date: 20 November 2026 (America/Chicago).

Status: an obstruction to a specified universal padding argument. It
does not resolve Marcus's block-permanent conjecture. The polynomial
norm identities used below are classical; no priority claim is made.

## 1. The source boundary

The current [Tubbenhauer preprint](https://arxiv.org/abs/2611.22058)
is version 1, submitted 17 November 2026. Its Theorem 1A.1 proves the
inequality for at most four blocks of every size, five blocks of size
at least three, and the general sufficient condition

```math
2^k-1\ge\frac{m(m-1)(2m-1)}{6\lfloor m/2\rfloor}.
```

Theorem 7C.1 obtains this condition by comparing matching-polynomial
coefficients. The introduction and Section 9 explicitly retain the
case (m,k)=(5,2) and further small block sizes. Theorem 1A.1 does not
state the unrestricted equality characterization. The full PDF was
opened; the statement, packet normalization, Sections 7A-7C and 9,
and the proof assembly were inspected. This is a scope check, not an
independent verification of every diagrammatic argument.

These source facts were already recorded in
[the Marcus route note](../../inequalities/marcus_gaussian_routes.md).
They are not new results of this checkpoint. No Lean verification was
performed. The live [C9 entry](https://yair-lavi.com/mincs-list/conjecture-9/index.html)
still asks for all block counts and sizes.

## 2. Exact effect of an orthogonal auxiliary system

Let A be a positive semidefinite Gram matrix with m blocks of size k,
and let G_ij=per A_ij. Fix an auxiliary positive semidefinite Gram
matrix B with the same number of blocks and block size d>=1. Place all
auxiliary vectors in a space orthogonal to the original Gram space.
Append the d auxiliary vectors in block i to original block i.

The enlarged matrix A^+ is a simultaneous row-column permutation of
A direct sum B, whereas each enlarged block is A_ij direct sum B_ij.
Writing C_ij=per B_ij and s=per B, we therefore have exactly

```math
\operatorname{per}A^+=s\operatorname{per}A,
\qquad G^+=G\circ C.                                      \tag{1}
```

If the block size k+d reaches a proved range, the available conclusion
is consequently

```math
s\operatorname{per}A\ge\operatorname{per}(G\circ C).       \tag{2}
```

The matrix C is positive semidefinite: it is the Gram matrix of the
degree-d auxiliary product forms, in the factorial inner product.
We restrict to s>0, since s=0 gives no bound after division. In that
case each diagonal entry of C is positive.

## 3. Preserving every smaller permanent forces rank one

Suppose that for a constant c>0 the auxiliary system satisfies

```math
\operatorname{per}(G\circ C)=c\operatorname{per}G
\quad\text{for every positive semidefinite }G.              \tag{3}
```

Taking G=I gives c=prod_i C_ii. Next take
G=I+t(E_ij+E_ji), with 0<t<=1. This is positive semidefinite and
has permanent 1+t^2. Comparing the two terms of its permanent in
(3) gives

```math
|C_{ij}|^2\prod_{\ell\ne i,j}C_{\ell\ell}=c,
\qquad |C_{ij}|^2=C_{ii}C_{jj}.                             \tag{4}
```

All Gram-vector pairs of C therefore attain equality in
Cauchy-Schwarz. The nonzero Gram vectors are proportional, so C has
rank one. Conversely, if C has rank one and positive diagonal, every
permutation product of C equals prod_i C_ii. Thus rank one is also
sufficient for (3).

This universal test covers every possible positive semidefinite G,
even when the original block size k is fixed. Given a Gram realization
G_ij=<u_i,u_j>, put u_i and k-1 common orthonormal vectors in each
block, with the common vectors orthogonal to every u_i. The resulting
block has permanent G_ij. Hence every such G is a block-permanent
Gram matrix of the required degree.

## 4. A classical factorial-norm power bound

For a polynomial Q(z)=sum_alpha q_alpha z^alpha, use

```math
\|Q\|_F^2=\sum_\alpha\alpha!|q_\alpha|^2.
```

Multiplication M_Q has adjoint M_Q^*=conjugate(Q)(partial), where
conjugation acts on coefficients. Leibniz's rule gives the normal-order
identity

```math
M_Q^*M_Q
=\sum_\alpha\frac1{\alpha!}
 M_{\partial^\alpha Q}M_{\partial^\alpha Q}^*.              \tag{5}
```

For clarity, expand conjugate(Q)(partial)(Qf). Choosing the derivative
multi-index alpha that lands on Q gives
(partial^alpha Q)(conjugate(partial^alpha Q))(partial)f/alpha!.
Summing gives (5). Taking its quadratic form yields the classical
sum-of-squares product identity associated with
[Reznick's polynomial norm formula](https://doi.org/10.1090/S0002-9939-1993-1119265-2).
The derivation here supplies the identity being used, without relying
on an uninspected formula normalization.

Let Q be nonzero and homogeneous of degree d>=1, and set
a_j=||Q^j||_F^2, with a_0=1. Apply (5) to f=Q^j. Its alpha=0 term
is ||M_Q^*Q^j||_F^2. Its terms of total order d sum to a_1 a_j.
These are distinct groups because d>=1, and all other terms are
nonnegative. Consequently

```math
a_{j+1}\ge a_1a_j+\|M_Q^*Q^j\|_F^2
\ge a_1a_j+\frac{a_j^2}{a_{j-1}}.                          \tag{6}
```

The second step is Cauchy-Schwarz against Q^(j-1), since
<M_Q^*Q^j,Q^(j-1)>=a_j. Every a_j is positive. Therefore the
successive ratios satisfy

```math
\frac{a_{j+1}}{a_j}\ge a_1+\frac{a_j}{a_{j-1}},
\qquad \frac{a_j}{a_{j-1}}\ge j a_1,
\qquad a_m\ge m!a_1^m.                                    \tag{7}
```

This lemma is used only for powers of a single homogeneous form.
It asserts no general replacement inequality for unrelated forms.

## 5. The unavoidable loss and the universal domination obstruction

Assume the preservation property (3). The auxiliary forms are
proportional, say f_i=c_i Q. The factorial Gram identity gives

```math
c=\prod_i C_{ii}
 =\left(\prod_i|c_i|^2\right)\|Q\|_F^{2m},
\qquad
s=\operatorname{per}B
 =\left(\prod_i|c_i|^2\right)\|Q^m\|_F^2.
```

By (7),

```math
\boxed{\quad s\ge m!c.\quad}                              \tag{8}
```

Thus (2) gives per A>= (c/s)per G, with c/s<=1/m!. It cannot give
the desired coefficient one when m>=2. A single common unit auxiliary
vector per block has B equal to the all-one matrix, C also all-one,
and s=m!, so the lower bound on this loss is attained at d=1.

There is a related obstruction that does not assume exact preservation.
No fixed auxiliary B with s>0 can satisfy

```math
\operatorname{per}(G\circ C)\ge s\operatorname{per}G
\quad\text{for every positive semidefinite }G.              \tag{9}
```

Indeed, at G=I, (9) gives prod_i C_ii>=s. The usual permanent
Fischer inequality gives the reverse inequality. It also follows
directly by repeatedly retaining the full-derivative terms in (5)
for the homogeneous block product forms. Hence s=prod_i C_ii.
Testing the same G=I+t(E_ij+E_ji) in (9) now forces
|C_ij|^2>=C_ii C_jj. Positive semidefiniteness gives the reverse
Cauchy-Schwarz bound, so all pairs satisfy equality and C has rank
one. Equation (8) then contradicts s=prod_i C_ii for m>=2.

This excludes exact preservation and a universal domination step for
fixed orthogonal auxiliary systems. It does not exclude padding chosen
using additional information about A, auxiliary vectors interacting
with the original Gram space, or arguments using information beyond
the single inequality (2). It supplies no unrestricted Marcus proof
and contributes zero full resolved entries.
