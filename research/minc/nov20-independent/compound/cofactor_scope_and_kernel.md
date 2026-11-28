# Scope of the cofactor comparison for Chollet's conjecture

Date: 20 November 2026 (America/Chicago).

Status: a structural obstruction to a broader statement and a kernel
calculation. The cofactor inequality in Section 1 remains unproved.
No full Minc entry is resolved.

## 1. The exact comparison

For a Hermitian positive semidefinite matrix A, put

```math
H=A\circ\overline A,\qquad
R_{ij}=\mathop{\mathrm{per}}A(j\mid i),\qquad
L_{ij}=\mathop{\mathrm{per}}H(j\mid i).
```

The transposed-cofactor convention makes R Hermitian. L is real
symmetric. The matrix comparison under investigation is

```math
G:=R\circ\overline R\ \stackrel{?}{\succeq}\ L.       \tag{1}
```

This is the cofactor case of a more general compound expression, after
indexing an (n-1)-set by its omitted index. It is not a comparison
between arbitrary compounds.

If (1) holds, Schur multiplication by H preserves positive
semidefiniteness. Taking the quadratic form at the all-one vector then
gives

```math
\sum_{i,j}|a_{ij}|^2|\mathop{\mathrm{per}}A(i\mid j)|^2
\ge \sum_{i,j}|a_{ij}|^2\mathop{\mathrm{per}}H(i\mid j)
=n\mathop{\mathrm{per}}H.
```

Together with the published Pate upper bound, this would prove Chollet's
conjecture. The [cofactor bridge note](../sign/chollet_cofactor_bridge.md)
records that deduction and its source check.

The primary paper [Sharp limitations of two permanental cofactor
comparisons](https://research.luminaryoddities.org/sharp-limitations-two-permanental-cofactor-comparisons/v/2/files/Sharp_Cofactor_Comparisons.pdf),
printed page 4, explicitly leaves (1) undecided. Its counterexamples
instead concern bounds on z^T L z and z^T G z by a common quantity
(per B)(x^*B^{-1}x)(x^*Rx), with z_i=|x_i|^2. Those failures do not
decide (1). The complete four-page paper was read for this distinction.

## 2. The arbitrary-compound extension is false

Let P_k(A) be the matrix of k-by-k subpermanents. It is false that

```math
P_k(A)\circ\overline{P_k(A)}\succeq P_k(A\circ\overline A)
                                                        \tag{2}
```

holds for every k and every positive semidefinite A.

Take the real Gram vectors

```math
v_1=e_1,\quad v_2=e_2,\quad
v_3=e_1+e_2,\quad v_4=e_1-e_2.
```

Their Gram matrix is

```math
A=\begin{pmatrix}
1&0&1&1
\\ 0&1&1&-1
\\ 1&1&2&0
\\ 1&-1&0&2
\end{pmatrix}\succeq0.
```

For real A and pair indices I={i,j}, J={k,l}, the difference in (2)
at k=2 has entry

```math
\Delta_{I,J}=2a_{ik}a_{jl}a_{il}a_{jk}.                    \tag{3}
```

In particular its principal submatrix on the two indices {1,2} and
{3,4} is

```math
\begin{pmatrix}0&-2\\-2&0\end{pmatrix}.
```

Thus the vector supported equally on those two indices has quadratic
form -4. In the order (12,13,14,23,24,34), the full difference is

```math
\Delta=\begin{pmatrix}
0&0&0&0&0&-2
\\ 0&4&0&0&0&0
\\ 0&0&4&0&0&0
\\ 0&0&0&4&0&0
\\ 0&0&0&0&4&0
\\ -2&0&0&0&0&0
\end{pmatrix}.
```

This example is an exact Gram construction, not a numerical search.
It does not disprove (1): for order four, the cofactor degree is three,
whereas this construction uses degree two. The two offending pair
indices are disjoint. Two omitted-index sets have intersection of size
n-2, so that indexing restriction cannot be discarded.

## 3. The two cofactor Gram matrices have the same kernel

There is a further distinction between (1) and a comparison on an
unrestricted polynomial space. Assume first that every Gram vector
v_i is nonzero. Partition their indices into projective classes I_a:
choose pairwise nonproportional vectors u_a and write

```math
v_i=c_i u_a\quad(i\in I_a),\qquad c_i\ne0.
```

Then both G and L have rank equal to the number r of projective classes,
and they have the same kernel:

```math
\ker G=\ker L
=\left\{x\in\mathbb C^n:
       \sum_{i\in I_a}\frac{x_i}{|c_i|^2}=0
       \text{ for every }a\right\}.                      \tag{4}
```

To prove this, identify a Gram vector with its linear form. Give
polynomials the factorial inner product, so the inner product of two
products of linear forms is the permanent of their Gram matrix. Put

```math
f_i=\prod_{j\ne i}v_j,\qquad
g_i=\prod_{j\ne i}(v_j\otimes\overline{v_j}).
```

Up to a common conjugation convention, G is the Gram matrix of
f_i tensor conjugate(f_i), and L is the Gram matrix of g_i. Common
conjugation does not alter these real matrices.

Let m_a=|I_a| and C=prod_i c_i. For i in I_a,

```math
f_i=\frac{C}{c_i}\,q_a,\qquad
q_a=u_a^{m_a-1}\prod_{b\ne a}u_b^{m_b}.
```

The q_a are linearly independent. Divide by the nonzero common
polynomial prod_b u_b^(m_b-1). A resulting relation would be a relation
among prod_(b!=a) u_b. Restricting to the hyperplane u_a=0 kills every
term except the a-th. On that hyperplane the other, nonproportional
linear forms do not have identically zero product. Hence its
coefficient vanishes. The single-class case is immediate.

The tensors q_a tensor conjugate(q_a) are also independent: apply a
linear functional dual to q_a in the first tensor factor. Therefore

```math
f_i\otimes\overline{f_i}
=\frac{|C|^2}{|c_i|^2}
  q_a\otimes\overline{q_a}
```

gives exactly the first kernel in (4).

The rank-one vectors u_a tensor conjugate(u_a) are pairwise
nonproportional, because proportional rank-one outer products imply
proportional original vectors. Applying the same deleted-product
independence argument to those linear forms gives independence of

```math
r_a=(u_a\otimes\overline{u_a})^{m_a-1}
       \prod_{b\ne a}(u_b\otimes\overline{u_b})^{m_b}.
```

Since g_i=|C|^2 r_a/|c_i|^2, it gives exactly the second kernel in (4).

If exactly one Gram vector is zero, both Gram families have only one
nonzero member, at that omitted index. Both matrices have rank one and
the same kernel. If at least two Gram vectors are zero, both families
vanish and both matrices are zero. This covers all positive
semidefinite inputs, including singular matrices.

## 4. What this leaves open

There is consequently a well-defined invertible linear map between the
r-dimensional spans sending f_i tensor conjugate(f_i) to g_i. For a
matrix with no zero Gram vector, (1) is exactly the assertion that this
map is a contraction in the two factorial inner products. Equation (4)
removes a possible obstruction from mismatched kernels, but gives no
bound on the norm of this map.

The failed general-compound statement acts on a different span and
does not settle the contraction on the omitted-index family. No
positivity proof for that contraction is supplied here, and no
historical-priority claim is made for the witness or kernel calculation.

## 5. Exact projection and angle formulation

The factorial constants can be made explicit in ordinary tensor
products. Put m=n-1. For each omitted index i, choose an ordering of
the remaining vectors and form

```math
W_i=\bigotimes_{j\ne i}(v_j\otimes\overline{v_j}).
```

Regroup the factors into V^tensor m tensor conjugate(V)^tensor m.
Let P_diag average simultaneous permutations of the two groups of
factors, and let P_sep average their permutations independently:

```math
P_{\rm diag}=\frac1{m!}\sum_{\sigma\in S_m}
 U_\sigma\otimes\overline{U_\sigma},\qquad
P_{\rm sep}=\left(\frac1{m!}\sum_{\sigma\in S_m}U_\sigma\right)
 \otimes
 \left(\frac1{m!}\sum_{\tau\in S_m}\overline{U_\tau}\right).
```

Both are orthogonal projections and P_sep P_diag=P_sep, so
P_sep<=P_diag. The two symmetrized Gram identities are

```math
G_{ij}=(m!)^2\langle P_{\rm sep}W_i,P_{\rm sep}W_j\rangle,
\qquad
L_{ij}=m!\langle P_{\rm diag}W_i,P_{\rm diag}W_j\rangle.
                                                               \tag{5}
```

Indeed, simultaneous symmetrization has m! terms and gives a
permanent divided by m!. Independent symmetrizations give two such
factors, hence the squared modulus divided by (m!)^2. Changing an
ordering of W_i leaves both projected vectors unchanged.

For W=sum_i z_i W_i, equation (5) gives the exact identity

```math
z^*(G-L)z
=m!\left((m!-1)\|P_{\rm sep}W\|^2
          -\|(P_{\rm diag}-P_{\rm sep})W\|^2\right).       \tag{6}
```

Thus (1) is equivalent to the angle bound

```math
\|(P_{\rm diag}-P_{\rm sep})Y\|^2
\le(m!-1)\|P_{\rm sep}Y\|^2
\quad\text{for every }Y\in
\mathcal E:=\mathop{\mathrm{span}}\{P_{\rm diag}W_i\}.         \tag{7}
```

Equivalently, the minimum singular value of P_sep restricted to E
would have to be at least 1/sqrt(m!). The common-kernel result proves
that this restriction is injective. It does not prove the lower bound
on its singular values. Injectivity is asserted on E, not on the
unprojected span of the W_i, which can contain vectors killed by both
projections.

Equation (7) is a reformulation, not an estimate. On the full tensor
space, P_diag-P_sep has a residual sector with the wrong sign for
unrestricted positivity in (6). The special omitted-index space E is
therefore essential. The exact arbitrary-compound witness in Section 2
already shows that replacing E by arbitrary paired-product spans is
invalid.
