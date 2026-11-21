# Review of the cofactor reductions

Date: 20 November 2026 (America/Chicago).

Reviewed notes:

- [Averaged cofactor bridge](../sign/chollet_cofactor_bridge.md).
- [Fischer Gram order and diagonal extension](../inequalities/chollet_gram_order.md).
- [Compound scope and common kernel](../compound/cofactor_scope_and_kernel.md).

Outcome: the proved identities, the Gram-order consequence, the conditional
diagonal extension, and the common-kernel calculation are correct. The
averaged lower bound and the stronger cofactor matrix inequality remain
unproved. Neither the exact witness nor these structural deductions
resolve Chollet's conjecture or another full Minc entry.

## 1. The sufficient bridge and its established upper side

Write

```math
\Gamma_{ij}=a_{ij}\operatorname{per}A(i\mid j),\qquad
P=\operatorname{per}A,\qquad Q=\operatorname{per}|A|^2.
```

The proposed lower bound is $`\|\Gamma\|_F^2\ge nQ`$. Pate's
published indicator theorem gives the opposite-side bound
$`\|\Gamma\|_F^2\le nP^2`$ by applying it to
$`A\oplus\overline A`$ and the indicator of the two-element sets
$`\{i,n+i\}`$. Each selected matrix entry is exactly
$`|a_{ij}\operatorname{per}A(i\mid j)|^2`$. The selector has squared
norm $`n`$, so there is no missing factor of $`n`$, $`2`$, or a binomial
coefficient.

I retrieved the [primary publisher abstract](https://www.sciencedirect.com/science/article/pii/S0024379507002273)
through search and checked its exact indicator hypothesis. Direct access
to the full 2008 article was unavailable. The statement is also reproduced
in Section 5 of the [Aouichaoui--Zhang primary preprint](https://www.preprints.org/manuscript/202609.2464).
The use of Pate is an imported published result, not a new theorem.
It does not invoke the false largest-eigenvalue assertion.

If the lower bound were proved, the two bounds would give
$`Q\le P^2`$. Cauchy--Schwarz on permutation products for two positive
semidefinite inputs would then give the full two-input Chollet inequality.
The deletion matrices with unequal omitted row and column need not be
Hermitian; applying smaller-order Chollet to them would be invalid.

The exact row-wise obstruction, the order-three aggregate identity,
and the negative three-cycle correlation all check. In particular,
the pair-counting expression weights each relative permutation by
its number of fixed points. The natural permutation representation
splits into the trivial and standard representations, giving the stated
Fourier formula without an extra dimension multiplier. Plancherel has
the distinct factor $`d_\lambda/n!`$ in the formula for $`Q`$.

I reran the companion exact checker. It reproduced the negative row
contribution, the negative relative-cycle correlation, and both positive
Bernstein certificates for the specified published examples. These
checks establish no all-order sign claim.

## 2. Fischer multiplication and the principal-submatrix order

In the factorial inner product, multiplication by $`z^\alpha`$ is
adjoint to $`\partial^\alpha`$. The Leibniz rule therefore gives

```math
M_Q^*M_Q=
\sum_\alpha\frac1{\alpha!}
M_{\partial^\alpha Q}M_{\partial^\alpha Q}^*.
```

For homogeneous $`Q`$ of degree $`b`$, the terms with
$`|\alpha|=b`$ sum to $`\|Q\|_{\mathcal F}^2 I`$.
Every remaining term is positive semidefinite. The factorial norm,
rather than the degree-normalized symmetric tensor norm, is essential
for the constant one. I checked the two-page
[Zeilberger derivation](https://arxiv.org/pdf/math/9307202), which credits
the classical identities, and the complex-coefficient convention in
[Beauzamy--Degot](https://www.scmsa.eu/BB_Publications/BB_Degot_Differential_Identities.pdf).
The note also proves the exact complex normal-order identity directly.

Let $`C_S(i,j)=\operatorname{per}A[S](i\mid j)`$. With
$`a_{ij}=\langle\ell_i,\ell_j\rangle`$, this is precisely the Gram
matrix of the products omitting index $`i`$. Multiplication by the common
product on $`S\setminus R`$ gives
$`C_S[R,R]\succeq P_{S\setminus R}C_R`$. Schur multiplication by
$`A[R]`$ proves the displayed $`\Gamma`$ order. The proof remains valid
when the forms are dependent or zero.

## 3. What diagonal extension proves

For a correlation matrix and independent Bernoulli subsets $`S,T`$,
the noise identity is

```math
\Gamma(B)=\mathbb E X_S,
\qquad Q(B)=\mathbb E Q_{S\cap T}.
```

I checked the diagonal and off-diagonal entries separately. The
intersection probabilities are $`t_i^2`$, not $`t_i`$.
In the trace of $`X_SX_T`$, the common principal block is bounded by
the Gram-order theorem. Every other diagonal contribution is at least
$`P_{S\cap T}^2`$, by the permanent Fischer inequality and unit diagonal.
The trace of a product of two positive semidefinite remainders is
nonnegative; no entrywise sign assumption is used.

Under the averaged lower bound in smaller orders, Pate's upper bound
also supplies $`P_R^2\ge Q_R`$ for every proper intersection $`R`$.
Only $`S=T=[n]`$ remains, with probability $`\prod_i t_i^2`$.
This proves the stated conditional inequality, even when $`G(A)<0`$.

The diagonal-congruence factors then cancel exactly to give
$`G(A+D)\ge G(A)`$. Positive diagonal normalization followed by
continuity handles zero entries. Subtracting the smallest eigenvalue
of a positive definite correlation counterexample produces a singular
correlation counterexample of the same order. It does not lower the
order or bound its rank by a fixed constant. This conditional result
cannot close its own induction.

## 4. Scope and kernels

The Gram matrix of $`e_1,e_2,e_1+e_2,e_1-e_2`$ is an exact witness
against the arbitrary-compound extension. At degree two, the pair
indices $`12`$ and $`34`$ give the principal block
$`\left(\begin{smallmatrix}0&-2\\-2&0\end{smallmatrix}\right)`$.
Its value at $`(1,1)`$ is $`-4`$. I independently checked the entire
six-by-six difference with integer arithmetic. This degree is not
the cofactor degree for order four.

For the true cofactor matrices, deleted products of distinct linear
forms are independent. After division by the common multiplicity
factor, restriction to one factor's zero hyperplane isolates its
coefficient. Over the complex numbers, the finite product of the other
nonproportional factors does not vanish identically on that hyperplane.
The one-class case is separate and immediate.

Dual functionals show that tensoring each such independent product
with its complex conjugate retains independence. Rank-one outer
products from different projective classes are likewise nonproportional,
so the same argument applies on the other side. Both kernels are
therefore exactly the weighted class-sum kernel stated in the note.
The factors $`|c_i|^{-2}`$ are correct. One or more zero Gram vectors
give the separate ranks and kernels recorded there.

Consequently the map between the omitted-product spans is well defined,
but its norm is not bounded by the kernel calculation. Equality of
kernels alone cannot imply the proposed positive semidefinite order.

I also opened the complete four-page
[Schubr cofactor-limitations paper](https://research.luminaryoddities.org/sharp-limitations-two-permanental-cofactor-comparisons/v/2/files/Sharp_Cofactor_Comparisons.pdf).
Its last section explicitly leaves this separate matrix comparison
undecided. The note correctly keeps the two disproved scalar comparisons
separate from it. This review makes no historical-priority claim.

## 5. Remaining obligation

A complete result still requires a proof of the averaged lower bound
for all positive semidefinite matrices, or an exact witness against the
actual Chollet inequality. The broader-compound witness only excludes
one stronger method. The common kernel and singular reduction remove
neither the norm bound nor the unbounded-order singular case.

## 6. Further exact boundaries

The projection formulation added to the common-kernel note has the
correct normalization. With $`m=n-1`$, simultaneous symmetrization gives
the paired permanent divided by $`m!`$; separate symmetrizations give
the squared cofactor modulus divided by $`(m!)^2`$. Since the separate
projection lies below the simultaneous one, their orthogonal difference
gives exactly

```math
z^*(G-L)z=m!\left((m!-1)\|P_{\rm sep}W\|^2
 -\|(P_{\rm diag}-P_{\rm sep})W\|^2\right).
```

The common kernel proves injectivity on the span of the simultaneously
projected omitted products. It need not prove injectivity on their raw
tensor span. The revised note makes that restriction explicit.

The [derivative-remainder obstruction](../sign/cofactor_derivative_obstruction.md)
uses actual omitted-product derivatives. I checked its Gram realization
and directly computed the $`t=2`$ cofactors: the first cofactor rises
from $`34`$ to $`38`$, while the corresponding squared-entry cofactor
rises from $`706`$ to $`774`$. Thus the residual is
$`4^2-68=-52`$. For general $`t`$, its first entry is
$`4(3-t^4)`$. The base and cross terms are retained in the note;
their sum with this residual is positive. I reran its symbolic checker,
which verifies the full positive semidefinite decomposition and the
positive averaged gap as identities in $`t`$. This is a failed
separate-positivity argument, not a cofactor counterexample.

The [signed-curvature note](../inequalities/chollet_signed_curvature.md)
uses the counting inner product on the symmetric group. I checked the
complex Hermitian completeness relation, the factor two in
$`\Delta f=2Tf`$, and the quotient drift term. These are identities at
the identity Gram metric, not a constant-coefficient differential
equation at every metric. The operator $`K=C-nI`$ has eigenvalues
$`n!-n`$, $`n!/(n-1)-n`$, and $`-n`$ on the stated isotypic parts.
The content bound outside the first two parts follows from the explicit
box-moving argument, including the separate case $`n=3`$.

The resulting energy estimate is

```math
E_K\le4(n-1)G-4(n-1)k_0\|f_0\|^2
 -2(n-2)k_1\|f_1\|^2.
```

Thus $`G<0`$ implies $`E_K<0`$. The term $`-E_K`$ supplies positive
curvature in the quotient-Laplacian identity, so it cannot alone
contradict a negative minimum. The remaining gradient form is signed.
Restricting to diagonal-preserving Gram directions also invalidates
substitution of the full-basis completeness relation. The note correctly
leaves a new tangent Hessian comparison as the missing rank-reduction
step. No unconditional positivity, rank bound, or full resolution
follows from these identities.

A second internal reviewer independently checked the signed-curvature
normalizations, spectral bound, restricted tangent formula, and primary
transposition source. The same reviewer independently checked the
border residual family. No correction was required. These are internal
mathematical reviews, not external peer review or historical-priority
certification.
