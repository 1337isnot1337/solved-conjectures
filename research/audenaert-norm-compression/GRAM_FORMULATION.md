# Dimension-universal Gram formulation

Research for [Audenaert’s conjecture, issue 213](https://github.com/1337isnot1337/solved-conjectures/issues/213). This elementary reduction was independently checked in the algebra and combinatorics lanes. No priority claim or conjecture resolution is made.

[Audenaert’s original paper](https://arxiv.org/abs/math/0702186v2), Section 3, presents Conjecture 3 about positive matrices with prescribed diagonal-block norms as potentially stronger than its two-row Conjecture 1, and says that equivalence is unknown for more than two columns. The argument below concerns the interpretation in which Conjecture 1 is quantified over all compatible internal dimensions. It does not assert an equivalence with block dimensions fixed in advance.

## Positive-matrix statement

Let `q>=1` and let `Q,R` be positive semidefinite matrices on a common orthogonal sum of nonzero finite-dimensional spaces `H_j`. Prescribe

```math
\|Q_{jj}\|_q=u_j,\qquad \|R_{jj}\|_q=v_j,
\qquad u_j,v_j\ge0.
```

The proposed maximum of `||Q+R||_q` is

```math
\left\|
\begin{pmatrix}
\sum_j u_j&\sum_j\sqrt{u_jv_j}\\
\sum_j\sqrt{u_jv_j}&\sum_j v_j
\end{pmatrix}
\right\|_q. \tag{1}
```

For `1/2<=q<=1`, replace the maximum by the minimum. At `q=1` these quantities are simply the common trace. The same Gram identities cover the operator-norm endpoint by taking limits.

## From two block rows to positive matrices

Write `T=[A;D]` with block rows `A=[A_1 ... A_N]` and `D=[D_1 ... D_N]`. Put `Q=A*A`, `R=D*D` and `p=2q`. Then

```math
\|T\|_{2q}^2=\|Q+R\|_q,
\qquad
\|A_j\|_{2q}^2=\|Q_{jj}\|_q,
\qquad
\|D_j\|_{2q}^2=\|R_{jj}\|_q.
\tag{2}
```

The scalar matrix of block norms has squared Gram equal to the matrix in (1). Thus the positive-matrix inequality implies the corresponding norm-compression inequality, with the correct reversal when `q<=1`. This is the direction already displayed in the source.

## The converse when dimensions may enlarge

For arbitrary `Q,R` as above, take `A=Q^(1/2)` and `D=R^(1/2)` and split their columns according to the spaces `H_j`. Stacking these two factors gives a compatible two-row block matrix. Its blocks may be rectangular, but all identities in (2) still hold. Applying the dimension-universal norm-compression assertion proves the positive-matrix inequality.

Even a formulation allowing only equally sized square blocks gives this implication if that common size is universally quantified. Let `L=sum_j dim(H_j)`. The factor blocks have `L` rows and `dim(H_j)<=L` columns. Pad each with zero columns to width `L`. The stacked matrix and every block retain their nonzero singular values. Applying the assertion for square blocks of size `L` therefore gives exactly the same inequality. The padding can increase the block size, which is why a fixed-size extremal interpretation must be kept distinct.

## Attainment of the scalar value

Choose a unit vector `e_j` in each `H_j`, and form vectors

```math
x=\bigoplus_j\sqrt{u_j}\,e_j,
\qquad y=\bigoplus_j\sqrt{v_j}\,e_j.
```

Set `Q=xx*` and `R=yy*`. Their diagonal blocks have the prescribed norms because rank-one projectors have Schatten `q` norm one. The nonzero spectrum of `Q+R` equals the spectrum of the two-by-two Gram of `x,y`, which is precisely the matrix in (1). Hence the scalar expression is attained in every permitted block-dimension list; the proposed extremal statement and its inequality form coincide.

This reformulation retains the full difficulty. A solution must control the norm of `Q+R` using the designated diagonal-block norms. A two-operator tracial measure that forgets those projections does not provide this control.
