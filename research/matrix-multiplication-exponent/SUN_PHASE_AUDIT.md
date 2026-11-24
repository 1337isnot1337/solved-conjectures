# A phase-factorization obstruction in the Sun audit

Status: a proved obstruction to one interpretation of a scalar phase identity.
This note does not disprove the existence of the richer source-resolved maps
claimed in the paper, and does not disprove the asserted matrix multiplication
bound independently of those maps.

The source under audit is Zhi-Wei Sun, *Tensor Degenerations for Matrix
Multiplication*, [arXiv:2610.13971v1](https://arxiv.org/pdf/2610.13971v1),
especially Section 8, equations (8.2)--(8.6), Theorem 8.1, and Appendix A.11.
All calculations below take place over a field of characteristic different
from two; in particular they apply over the complex numbers.

## What the scalar identity establishes

For binary vectors with `gamma = alpha + beta` and `s = q + r`, equation
(8.3) is the valid scalar identity

```math
\langle\alpha,q\rangle+\langle\beta,r\rangle
+\langle\beta,q+r\rangle+\langle\gamma,q+r\rangle
=\langle\gamma,r\rangle\pmod 2.
```

Its natural three closed-label tensor coordinates are

```math
X=(\alpha,q),\qquad Y=(\beta,r),\qquad Z=(\gamma,s),
\qquad \gamma=\alpha+\beta,\quad s=q+r.
```

Three terms on the left depend on one of these coordinates individually.
The term `beta dot (q+r) = beta dot s` depends on the character in the
second coordinate and the displacement in the third coordinate. Its scalar
notation therefore does not itself specify a map on one tensor factor.

The issue cannot be repaired merely by choosing different scalar functions
on the three closed-label factors. The following proposition makes this
precise.

## Proposition: the required phase does not factor locally

Put `G = F_2 x F_2`. For `x=(alpha,q)` and `y=(beta,r)` define

```math
\theta(x,y)=(-1)^{(\alpha+\beta)r}.
```

There are no functions `a,b,c : G -> K` satisfying

```math
\theta(x,y)=a(x)b(y)c(x+y)
\qquad\text{for every }x,y\in G.
```

### Proof

Every factor in any such equality must be nonzero, since the left side is
always either one or minus one. Factorization would imply

```math
\theta(x,y)\theta(y,0)\theta(0,x)
=\theta(y,x)\theta(x,0)\theta(0,y).
```

Indeed, the two sides after substitution each equal the product

```math
a(x)a(y)a(0)b(x)b(y)b(0)c(x+y)c(x)c(y).
```

Take `x=(0,1)` and `y=(1,0)`. The six factors are

| Factor | Value |
| --- | ---: |
| `theta(x,y)` | 1 |
| `theta(y,0)` | 1 |
| `theta(0,x)` | 1 |
| `theta(y,x)` | -1 |
| `theta(x,0)` | 1 |
| `theta(0,y)` | 1 |

The asserted product equality would be `1 = -1`, which is false in the
stated characteristics. This proves the proposition.

The same obstruction holds in `F_2^k` for any positive `k`, by setting all
but one coordinate to zero.

## Stronger obstruction for the collapsed convolution tensor

Let the closed-label convolution tensor be

```math
C_G=\sum_{x,y\in G}X_xY_yZ_{x+y}.
```

Applying diagonal linear maps separately to the three legs changes its
coefficient at `(x,y,x+y)` to `a(x)b(y)c(x+y)`. The proposition therefore
proves that this operation cannot convert `C_G` to

```math
C_G^{\theta}=\sum_{x,y\in G}\theta(x,y)X_xY_yZ_{x+y}.
```

In fact, for this collapsed convolution tensor even arbitrary local maps
or degenerations cannot supply the required phase. Here is a proof that
does not import the exact rank or border rank of two-by-two matrix
multiplication.

### Lemma: a necessary commutativity condition at minimal border rank

Let a tensor have two factor dimensions `n`, and let its slices on those
factors be square matrices `M(a)`, linear in the coordinate `a` on the
remaining dual factor. Suppose one slice `M(a_0)` is invertible. If its
border rank is at most `n`, then

```math
M(a)M(a_0)^{-1}M(b)=M(b)M(a_0)^{-1}M(a)
\qquad\text{for every }a,b.
```

To prove this first at rank at most `n`, write a rank decomposition with
exactly `n` terms; fewer terms could not yield the invertible slice. Its
two factor matrices `B,C` are invertible and

```math
M(a)=B\,\mathop{\mathrm{diag}}(\lambda_1(a),\ldots,\lambda_n(a))C^{\mathsf T}.
```

All `lambda_i(a_0)` are nonzero. Substitution proves the displayed identity,
since the diagonal matrices commute. After multiplication by
`det M(a_0)`, this is a polynomial identity, with `adj M(a_0)` in place of
the inverse. Work in the open set where `M(a_0)` is invertible: the
polynomial identity holds on its rank-at-most-`n` locus and therefore on
that locus's relative Zariski closure. Every border-rank-at-most-`n`
tensor in this open set lies in that relative closure. This proves the
border-rank statement without imposing any condition on singular slices
outside the open set.

### Corollary: the phase-twisted tensor cannot degenerate from `C_G`

Walsh orthogonality gives

```math
C_G=\frac14\sum_{\chi\in\widehat G}
  \left(\sum_x\chi(x)X_x\right)
  \left(\sum_y\chi(y)Y_y\right)
  \left(\sum_z\chi(z)Z_z\right).
```

Its flattening rank is four, so its rank and border rank are both four.
Rescaling the `Y_(beta,r)` coordinate by `(-1)^(beta r)` converts the
coefficient `theta(x,y)` to `(-1)^(alpha r)`. These are exactly the
structure constants of the two-by-two Weyl matrices:

```math
(W_{\alpha,q})_{u,v}=(-1)^{\alpha v}\mathbf1_{u=v+q},
\qquad
W_{\alpha,q}W_{\beta,r}=(-1)^{\alpha r}W_{\alpha+\beta,q+r}.
```

The four Weyl matrices are a basis of `Mat_2(K)`. Thus `C_G^theta` is
equivalent by invertible changes of basis to the multiplication tensor of
`Mat_2(K)`, hence to `M_2`.

The slices of matrix multiplication, after identifying the output dual
with the matrix space, are the linear maps `L_A : B -> AB`. The slice
`L_I` is the four-by-four identity. But

```math
L_{E_{12}}L_{E_{21}}=L_{E_{11}}
\neq L_{E_{22}}=L_{E_{21}}L_{E_{12}}.
```

The lemma therefore implies `border rank(M_2) > 4`. Since border rank
cannot increase under local maps or degeneration, `C_G^theta` cannot be
obtained from `C_G` by either operation.

The same proof works for `G=F_2^k x F_2^k`: the untwisted tensor has border
rank `4^k`, while the twisted tensor is `M_(2^k)` and its invertible slice
has noncommuting normalized slices, forcing border rank strictly greater
than `4^k`.

## Exact scope of the result

These results concern the already collapsed convolution tensor. They do
not prohibit arbitrary linear maps from a different, larger,
source-resolved tensor, additional summands or indices, or a degeneration
using those resources.
The Sun paper expressly says that its construction retains source records
before the final closures. Consequently this proposition alone is not a
counterexample to Theorem 8.1.

To verify the claimed globalization, one must additionally give the three
maps from the original source coordinates and check their joint tensor
coefficient, including the mixed phase. Equations (8.3)--(8.6) verify scalar
and Weyl identities, and the zero-defect incidence calculation correctly
identifies the proposed output with matrix multiplication. Neither step,
by itself, proves that the original source produces that output.

Appendix A.11 describes its assembled maps by named dense, completion and
row/Weyl transformations, and equation (A.11's displayed assembly, rendered
as (1.9) in the HTML) gives their formal composition. A complete verification
of the claimed source-resolved implementation still requires their entries
on each original source coordinate, or another proof that the coefficient
identities arise from three separate linear maps. This audit has not
established that implication.

## Independently established statements

1. Equation (8.3) is correct as an identity of binary scalar phases.
2. The one-bit phase above does not factor as three functions of the closed
   tensor labels.
3. The same diagonal-rescaling obstruction holds for every positive number
   of binary coordinates.
4. The twisted convolution tensor cannot be obtained from the untwisted
   convolution tensor by any local linear maps or degeneration: the latter
   has minimal border rank, and the former violates the necessary slice
   commutativity identity at that rank.
5. The output orbit identification in Propositions 3.1 and 4.1 is a valid
   bijection with matrix multiplication cycles.

The source-to-output globalization in Theorems 3.1 and 8.1 has not been
independently verified by these checks.
