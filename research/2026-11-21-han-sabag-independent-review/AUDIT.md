# Independent mathematical audit: Han–Sabag–Kostina–Hassibi's conjecture

Audit date: 21 November 2026. Result: **PASS** for the complete mathematical
refutation of the explicit matrix conjecture and for the stated open
family. This review is independent of the authors of the result package.
It does not certify priority or peer review. Priority is assessed separately.

The reviewed manuscript is
[PROOF.md](../../results/han-sabag-kostina-hassibi/PROOF.md), whose Git blob
at review was `6ad5c694761471f986f5f2080a0042ec797cd26c`. The package verifier
was neither imported nor used as independent evidence. The calculations
below were rederived from the source equation. A new
[independent checker](verify_independent.py) assembles and solves the
four-variable Lyapunov linear system in exact rational arithmetic and
checks the symbolic identities. Its [recorded output](verification.json)
passed.

## 1. Original source and scope

The primary source is Han, Sabag, Kostina and Hassibi,
[*Coded Kalman Filtering over MIMO Gaussian Channels with Feedback*,
arXiv:2406.17196v2](https://arxiv.org/pdf/2406.17196v2), 5 August 2025.
I read Conjecture 1 and equations (23)–(24) in the
[HTML](https://arxiv.org/html/2406.17196v2) and inspected the PDF pages
containing the statement: its heading begins on page 5 and its equation,
optimization, and conclusion continue on page 6. I also read the
Appendix A discussion, particularly equations (63)–(76) and the
partition-of-support argument.

The displayed problem minimizes the trace of a diagonal positive
semidefinite power matrix. The other variables are an arbitrary real
encoder matrix and a positive definite solution of the stated Lyapunov
equation. It does not impose an extra equality connecting the encoder
matrix to the power matrix. The proposed optimizer has one nonzero entry
per column.

The example uses distinct positive diagonal entries of B strictly below
one, positive channel gains, and a strictly positive power matrix. It
therefore satisfies the source restrictions without using a negative
unstable eigenvalue, a singular channel, or a singular power matrix.
The conclusion concerns this matrix-algebraic conjecture. A claim about
implementable communication codes or the separate stabilization theorem
would require additional argument and is not included.

## 2. Feasibility and uniqueness

For diagonal B with entries b₁,b₂ and diagonal D with entries d₁,d₂, the
source equation gives

```math
(1-b_i b_j)J_{ij}
 =\sum_{\ell=1}^2\gamma_{\ell i}\gamma_{\ell j}
   (b_i b_j-d_\ell).
```

Every coefficient on the left is nonzero for the chosen B. Thus the
solution is unique, and its entries are determined without a stability
approximation.

I independently substituted

```math
B=\mathop{\mathrm{diag}}(4/5,3/5),\qquad
H=\mathop{\mathrm{diag}}(7/4,1),\qquad
\Pi=\mathop{\mathrm{diag}}(1168/1323,3/17),
```

```math
\Gamma=\begin{pmatrix}1&1\\53/40&840/1961\end{pmatrix}.
```

Exact inversion gives

```math
(I+H\Pi H)^{-1}=\mathop{\mathrm{diag}}(27/100,17/20).
```

The second row's column-product is 21/37. The two contributions to the
off-diagonal entry therefore cancel, since

```math
\frac{12}{25}-\frac{27}{100}=\frac{21}{100},
\qquad
\frac{12}{25}-\frac{17}{20}=-\frac{37}{100}.
```

The independent rational linear-system solution is

```math
J=\mathop{\mathrm{diag}}\left(\frac{211}{57600},
                          \frac{35289}{246113344}\right).
```

Both entries are strictly positive. Direct matrix multiplication in the
original equation gives a zero residual in all four entries. The feasible
power is exactly 23825/22491.

## 3. Exhaustion of every sparse assignment

In dimension two, an encoder with exactly one nonzero entry per column
has one of four support assignments. The following argument keeps both
nonzero encoder coefficients arbitrary, including their signs and
magnitudes.

If the two columns use different channels, J is diagonal. Positivity
of the entry for source coordinate j is equivalent to

```math
d\lt b_j^2,
\qquad\text{or equivalently}\qquad
\pi>\frac{b_j^{-2}-1}{h^2}.
```

These two conditions are necessary and sufficient. No choice of a large
or small encoder coefficient changes either condition, because that
coefficient enters as a strictly positive square.

If both columns use the same channel, J is an invertible diagonal
congruence of the symmetric matrix

```math
M(d)_{ij}=\frac{b_i b_j-d}{1-b_i b_j}.
```

I expanded its determinant independently and obtained

```math
\det M(d)=
\frac{(b_1-b_2)^2(1-d)(b_1^2b_2^2-d)}
 {(1-b_1^2)(1-b_2^2)(1-b_1b_2)^2}.
```

Since d lies in (0,1] and the b entries are distinct and lie between zero and one,
positive definiteness forces d less than b₁²b₂². Conversely, this inequality makes
both diagonal entries positive and makes the determinant positive. It is
therefore equivalent to positive definiteness. Negative encoder
coefficients cannot evade the condition: a real invertible congruence
preserves positive definiteness regardless of its diagonal signs.

The resulting exact power infimum for two columns in one channel is

```math
\frac{(b_1b_2)^{-2}-1}{h^2}.
```

An unused channel can be given zero power. Giving it positive power does
not change J because the corresponding row of the encoder is zero, and
can only increase the objective.

The four independently recalculated thresholds are

| Channels for columns 1 and 2 | Infimal power |
| --- | --- |
| (1,1) | 481/441 |
| (2,2) | 481/144 |
| (1,2) | 865/441 |
| (2,1) | 8065/7056 |

Every threshold can be approached from above with the same support.
Because there are only four supports, the infimum over the entire sparse
class is their minimum, 481/441. Consequently

```math
P_{\mathrm{unrestricted}}\le\frac{23825}{22491}
 <\frac{481}{441}=P_{\mathrm{sparse}},
\qquad
P_{\mathrm{sparse}}-\frac{23825}{22491}
 =\frac{706}{22491}>0.
```

This strict separation addresses even minimizing sequences. It cannot
be explained by the possible failure to attain an infimum under a strict
positive-definiteness constraint. A single exact violating instance
refutes the original universal sparse-optimality assertion.

## 4. The entire claimed open family

Let x=h² and keep B and the encoder fixed. Taking

```math
H=\mathop{\mathrm{diag}}(h,1),\qquad
\Pi=\mathop{\mathrm{diag}}\left(\frac{73}{27x},\frac3{17}\right)
```

keeps D and the strictly positive J exactly unchanged. Its power is

```math
P_0(x)=\frac{73}{27x}+\frac3{17}.
```

For x>1, the same-channel-2 threshold exceeds the same-channel-1
threshold. The (1,2) threshold exceeds the (2,1) threshold by

```math
\frac{175}{144}\left(1-\frac1x\right)>0.
```

Thus only the (1,1) and (2,1) thresholds can be minimal. Their gaps over
the feasible point simplify exactly to

```math
\frac{275}{432x}-\frac3{17},
\qquad
\frac{105}{272}-\frac{25}{27x}.
```

Both are positive precisely when

```math
\frac{1360}{567}\lt x\lt \frac{4675}{1296}.
```

The whole interval lies above one, so the reduction to two thresholds
applies throughout it. Also 49/16 lies strictly between its endpoints,
recovering the rational example. This proves the continuous family by
exact inequalities; it is not an inference from sampled parameter values.

## 5. Review conclusion

No mathematical gap was found in the feasible point, uniqueness,
positive definiteness, exhaustive sparse lower bound, strict rational
gap, or open-family argument. The source statement was checked directly
and matches the refuted optimization problem. The accompanying exact
checker independently reproduces the stated identities without importing
the result package. Priority is assessed separately; this mathematical
review alone does not add the package to any campaign tally.
