# Signed curvature of the averaged cofactor gap

Date: 20 November 2026 (America/Chicago).

Status: exact identities and an all-order sign obstruction to a proposed
rank-reduction argument. Independently reviewed by the compound/face
worker and the coordinating worker; the review receipt is in issue 139.
The averaged cofactor lower bound remains unproved. No full Minc entry
is resolved.

This note follows the [cofactor bridge](../sign/chollet_cofactor_bridge.md)
and the [conditional diagonal extension](chollet_gram_order.md).
It does not repeat the older Laplacian calculation for
$`\operatorname{per}|A|^2/(\operatorname{per}A)^2`$.

## 1. The signed quadratic form

Let $`A=(v_i^*v_j)_{i,j=1}^n`$ be a complex Hermitian positive
semidefinite matrix with positive diagonal, and assume $`n\ge3`$.
For $`\sigma\in S_n`$, put

~~~math
f_\sigma=\prod_{i=1}^n a_{i,\sigma(i)},\qquad
P=\sum_\sigma f_\sigma=\operatorname{per}A,\qquad
Q=\sum_\sigma|f_\sigma|^2=\operatorname{per}|A|^2.
~~~

The vector space $`\mathbb C^{S_n}`$ has the unnormalized counting
inner product. In particular, no factor $`1/n!`$ is included in its
squared norm. Define

~~~math
(Lf)_{ij}=\sum_{\sigma:\,\sigma(i)=j}f_\sigma=\Gamma_{ij},
\qquad
C=L^*L,\qquad K=C-nI.
~~~

Then

~~~math
C_{\sigma,\tau}=\operatorname{fix}(\sigma^{-1}\tau),
\qquad
G=f^*Kf=\|\Gamma\|_F^2-nQ,\qquad F=\frac{G}{P^2}.             \tag{1}
~~~

Here $`P>0`$ by the permanent lower bound by the diagonal product.
Write $`[x,y]_K=x^*Ky`$. This is a Hermitian form, not a positive
semidefinite inner product.

Let $`R_\tau f`$ have coordinate $`f_{\sigma\tau}`$, and put

~~~math
N=\binom n2,\qquad
T=\sum_{\tau\text{ a transposition}}R_\tau.
~~~

Both $`C`$ and $`T`$ are central convolution operators and commute.

## 2. Gram-metric derivatives at the identity

Choose the vectors $`v_i`$ in $`\mathbb C^r`$ and a real orthonormal
basis $`H_1,\ldots,H_{r^2}`$ of the Hermitian $`r\times r`$ matrices,
with inner product $`\operatorname{tr}(H_aH_b)`$. Use the local metric

~~~math
A(x)_{ij}
=v_i^*\left(I+\sum_a x_aH_a\right)v_j .
~~~

All values and derivatives below are evaluated at $`x=0`$, namely at
the Gram metric $`I`$. The Laplacian is $`\Delta=\sum_a\partial_a^2`$.
This is a pointwise identity in a normalized metric chart; it is not
asserted to be the same constant-coefficient differential equation away
from that base point.

Completeness of the real Hermitian basis gives

~~~math
\sum_a(v_i^*H_av_j)(v_k^*H_av_l)=a_{il}a_{kj}.                \tag{2}
~~~

Indeed, in matrix entries the completeness relation is
$`\sum_a(H_a)_{pq}(H_a)_{st}=\delta_{pt}\delta_{qs}`$.
The imaginary Hermitian directions are included.

Differentiating a permutation product twice and applying (2) exchanges
the two selected images. Each unordered pair is differentiated in both
orders. Consequently,

~~~math
\Delta f=2Tf,\qquad
\Delta P=2NP.                                               \tag{3}
~~~

The proof is polynomial and does not divide by any entry of $`A`$.

Set

~~~math
\ell_a=\frac{\partial_aP}{P},\qquad
w_a=\partial_af-\ell_af,
\qquad
V_K=\sum_a[w_a,w_a]_K,
\qquad
E_K=\sum_{\tau\text{ a transposition}}
       [f-R_\tau f,f-R_\tau f]_K.                           \tag{4}
~~~

Both $`V_K`$ and $`E_K`$ are signed quantities. Since $`K`$ commutes
with the self-adjoint involutions $`R_\tau`$,

~~~math
E_K=2f^*K(NI-T)f.                                          \tag{5}
~~~

**Exact signed curvature identity.**

~~~math
\boxed{\quad
\Delta F+2\sum_a\ell_a\partial_aF
=\frac{2}{P^2}(V_K-E_K).
\quad}                                                       \tag{6}
~~~

To verify the quotient factors, put $`h=f/P`$. Then
$`\partial_ah=w_a/P`$, and (3) gives, at the base point,

~~~math
\Delta h+2\sum_a\ell_a\partial_ah=2(T-NI)h.
~~~

Applying the product rule to $`F=[h,h]_K`$ proves (6). No positivity
of $`K`$ is used.

## 3. The transposition contribution is negative when the gap is negative

Let $`f_0`$ be the trivial-isotypic projection of $`f`$,
$`f_1`$ its standard-isotypic projection, and let $`f_\lambda`$
denote the remaining isotypic projections. They are orthogonal.

The fixed-point character is the sum of the trivial and standard
characters. Character orthogonality therefore gives the eigenvalues

~~~math
K=
\begin{cases}
k_0=n!-n,&\text{on the trivial component},\\
k_1=n!/(n-1)-n,&\text{on the standard component},\\
-n,&\text{on every other component}.
\end{cases}                                                 \tag{7}
~~~

The counting normalization in Section 1 gives
$`\|f_0\|^2=P^2/n!`$. Both $`k_0>0`$ and $`k_1\ge0`$ for
$`n\ge3`$; $`k_1=0`$ when $`n=3`$.

The central transposition operator has eigenvalue

~~~math
c_\lambda=\sum_{(i,j)\in\lambda}(j-i)
=\frac12\sum_i\lambda_i(\lambda_i-2i+1)                       \tag{8}
~~~

on the component indexed by a partition $`\lambda\vdash n`$.
Thus $`c_{(n)}=N`$ and $`c_{(n-1,1)}=N-n`$. Every other component
satisfies

~~~math
N-c_\lambda\ge2(n-1).                                      \tag{9}
~~~

Here is an elementary verification of this last content bound. For
$`n\ge4`$, a partition other than $`(n)`$ and $`(n-1,1)`$ has
first row at most $`n-2`$. Move boxes from the last nonempty row to
the first until its length is $`n-2`$. Two boxes remain below it;
if they lie in separate rows, move the last box into the second row.
The resulting partition is $`(n-2,2)`$. All intermediate diagrams
are partitions. Moving a terminal box from row $`b`$ to the end
of row $`a<b`$ increases the content sum by

~~~math
(\lambda_a+1-a)-(\lambda_b-b)
=\lambda_a-\lambda_b+b-a+1>0.
~~~

Therefore $`c_\lambda\le c_{(n-2,2)}=N-2(n-1)`$.
For $`n=3`$, the only remaining partition is $`(1,1,1)`$;
its gap is six, which is at least four.

The classical eigenvalue formula (8) is Frobenius' transposition
character formula. It appears explicitly as Lemma 7, equation (2.8),
of Diaconis and Shahshahani's primary paper
[*Generating a Random Permutation with Random Transpositions*,
1981, pp. 163–166](https://www.imo.universite-paris-saclay.fr/~pierre-loic.meliot/symmetric/texts/Diaconis%2C%20Shahshahani%20-%20Generating%20a%20random%20permutation%20with%20random%20transpositions.pdf).
Their Lemma 5 gives the corresponding central-convolution scalar.
Those pages were read directly on 20 November 2026.

Write $`a=\|f_0\|^2`$, $`b=\|f_1\|^2`$, and
$`c=\sum_{\lambda\ne(n),(n-1,1)}\|f_\lambda\|^2`$.
Equations (1), (5), and (7) give

~~~math
G=k_0a+k_1b-nc
~~~

and

~~~math
\begin{aligned}
E_K
&=2nk_1b
 -2n\sum_{\lambda\ne(n),(n-1,1)}
       (N-c_\lambda)\|f_\lambda\|^2\\
&\le2nk_1b-4n(n-1)c\\
&=4(n-1)G-4(n-1)k_0a-2(n-2)k_1b.                           \tag{10}
\end{aligned}
~~~

In particular,

~~~math
\boxed{\quad G<0\ \Longrightarrow\ E_K<0.\quad}             \tag{11}
~~~

This implication is an exact spectral statement. It does not assume
that a matrix with $`G<0`$ exists.

There is also an identity using the ordinary transposition energy

~~~math
E_0=\sum_\tau\|f-R_\tau f\|^2\ge0:
\qquad
E_K=2n\bigl(\|\Gamma\|_F^2-P^2\bigr)-nE_0.                 \tag{12}
~~~

For (12), on the range of $`C`$ the operator $`NI-T`$ is zero on
the trivial component and $`nI`$ on the standard component. Hence
$`C(NI-T)=n(C-n!\Pi_0)`$, which substituted in (5) proves the formula.

## 4. The precise rank-reduction gap

The quotient $`F`$ is unchanged by positive diagonal congruence.
A local minimum on correlation matrices is therefore stationary under
every small Gram-metric perturbation after diagonal normalization.
At such a minimum, (6) becomes

~~~math
\Delta F=\frac{2}{P^2}(V_K-E_K).                            \tag{13}
~~~

To exclude a negative minimum by this trace argument one would need

~~~math
V_K<E_K                                                     \tag{14}
~~~

at that point. The proved implication (11) makes the required right
side strictly negative. In particular, the transposition term
$`-E_K`$ contributes positive curvature at a hypothetical negative
minimum. It does not by itself contradict the necessary condition
$`\Delta F\ge0`$. Neither the positive semidefiniteness of $`A`$ nor
the cofactor Gram order proves (14).

For a fixed Gram face with diagonal held constant, the available
linear space is

~~~math
\mathcal T=\{H=H^*:v_i^*Hv_i=0\text{ for every }i\}.
~~~

Its real dimension is at least $`r^2-n`$. Let $`D_b`$ be derivatives
along an orthonormal basis of this space, put
$`\Delta_{\mathcal T}=\sum_bD_b^2`$, and define
$`V_{K,\mathcal T}`$ by the corresponding restricted sum in (4).
At a stationary point, the exact restricted formula is

~~~math
\frac{P^2}{2}\Delta_{\mathcal T}F
=
V_{K,\mathcal T}
+\operatorname{Re}\bigl(f^*K\Delta_{\mathcal T}f\bigr)
-\frac{G}{P}\Delta_{\mathcal T}P.                           \tag{15}
~~~

The full-basis completeness relation (2) no longer applies to this
restricted basis. Therefore
$`\Delta_{\mathcal T}f=2Tf`$ cannot be substituted in (15).
To obtain rank reduction from $`r^2>n`$, one still needs a negative
Hessian direction in $`\mathcal T`$, or, more strongly, a proof that
the right side of (15) is negative at every relevant negative minimum.

Equations (10)–(15) identify the missing sign; they do not prove that
rank reduction is impossible by another argument. The diagonal-extension
result remains a reduction to singular matrices, with no deduction of
$`r^2\le n`$.

