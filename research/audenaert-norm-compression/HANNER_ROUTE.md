# What the two-operator joint measure preserves

Research continuation toward Audenaert’s conjecture. This note identifies missing information in one proposed route; it is not a proof or counterexample to the conjecture.

## 1. Available primary theorem

Heinävaara, [*Tracial joint spectral measures*, arXiv:2310.03227v1](https://arxiv.org/html/2310.03227v1), Theorem 1.4 and Corollary 1.5, supplies a positive planar measure for each pair of Hermitian matrices. In particular,

```math
\mathop{\mathrm{Tr}}|xA+yB|^p
=p(p+1)\int_{\mathbb R^2}|ax+by|^p\,d\mu_{A,B}(a,b),
\qquad p>0.
```

Hermitian dilation gives an isometric representation of the real span of any two complex matrices in an `L_p` space. The resulting reduction proves Hanner’s inequality. The theorem controls norms of linear combinations of the chosen two operators. It does not assert compatibility with an additional family of column projections.

## 2. An exact loss of column information

Let `P_0,P_1` be the coordinate row projections and use the two operators

```math
R_i(T)=P_iT,
\qquad i=0,1.
```

The full row pencil contains the original matrix, since `T=R_0(T)+R_1(T)`. Consider the two scalar-block examples

```math
T_0=I_2,\qquad
T_1=\frac1{\sqrt2}\begin{pmatrix}1&1\\1&-1\end{pmatrix}.
```

For every real `x,y`, both row pencils have singular values `|x|,|y|`:

```math
xR_0(T_\ell)+yR_1(T_\ell)
=\mathop{\mathrm{diag}}(x,y)T_\ell,
\qquad \ell=0,1.
```

In fact `T_1=T_0V` for a unitary `V`. The Hermitian dilations of the two row operators are simultaneously conjugate by `diag(I,V*)`, so the joint-measure construction has identical pencil data. The uniqueness assertion in the primary source identifies the measures away from the origin; any ambiguity at the origin does not affect these power integrals.

Their prescribed scalar compression matrices, however, are

```math
C_p(T_0)=I_2,\qquad
C_p(T_1)=\frac1{\sqrt2}\begin{pmatrix}1&1\\1&1\end{pmatrix},
```

and hence

```math
\|C_p(T_0)\|_p=2^{1/p},\qquad
\|C_p(T_1)\|_p=\sqrt2.
```

These differ for `p != 2`. Both examples satisfy the conjecture; the example demonstrates only that the global two-row pencil does not determine its scalar comparison target.

## 3. The additional assertion a successful route needs

For the prescribed column projections `Q_j`, the data required by Audenaert are

```math
\|R_i(T)Q_j\|_p,
```

as well as the norm of `R_0(T)+R_1(T)`. Applying the two-operator theorem separately to each column gives separate measures, with no asserted relation to the global pair measure. Summing the column measures corresponds to a direct sum of column operators, which discards their common output-space coherence.

A successful joint-measure proof therefore needs a comparison or coupling that retains these column masses and controls the coherent sum. Merely replacing the two row operators by two scalar functions does not provide it. Requiring an isometry for every individual projected block at once would be a substantially stronger representation; the primary source explicitly warns that analogous representations of arbitrary spaces spanned by more than two operators fail in general. No such extra compatibility is assumed here.

This leaves a concrete research question: can the weaker comparison needed for a two-row compression inequality be derived from a joint measure together with the constraints imposed by the columns, without requiring a general multi-operator isometry? No answer is supplied in this checkpoint.
