# A cofactor Gram order and diagonal extension

Date: 20 November 2026 (America/Chicago).

Status: the Gram order is proved below from the classical Fischer
multiplication inequality. The diagonal-extension theorem is conditional
on the averaged cofactor comparison in all smaller orders. It reduces a
minimal-order counterexample to a singular correlation matrix; it does
not exclude that matrix. No full Minc entry is resolved, and no priority
claim is made.

## 1. Notation and statements

For a Hermitian positive semidefinite matrix $`A`$ indexed by a finite
set $`S`$, define

~~~math
P_S=\operatorname{per}A[S],\qquad
Q_S=\operatorname{per}|A[S]|^2,
\qquad
\Gamma_S(i,j)=a_{ij}\operatorname{per}A[S](i\mid j).
~~~

Here $`|A[S]|^2`$ denotes entrywise squared modulus. Empty permanents are
one, and $`\Gamma_\varnothing`$ is the empty matrix.

The proposed averaged cofactor inequality is

~~~math
G(A):=\|\Gamma(A)\|_F^2-|S|\operatorname{per}|A|^2
\stackrel{?}{\ge}0.                                        \tag{1}
~~~

The [cofactor bridge note](../sign/chollet_cofactor_bridge.md) records
why (1), together with Pate's established upper bound
$`\|\Gamma(A)\|_F^2\le |S|(\operatorname{per}A)^2`$, would prove Chollet's
conjecture.

**Theorem 1.** For every Hermitian positive semidefinite $`A`$ and every
$`R\subseteq S`$,

~~~math
\boxed{\quad
\Gamma_S[R,R]\succeq P_{S\setminus R}\Gamma_R.
\quad}                                                       \tag{2}
~~~

The order is the Hermitian positive semidefinite order.

**Conditional theorem 2.** Fix $`n`$ and assume (1) holds for every
Hermitian positive semidefinite matrix of order strictly less than
$`n`$. Then every positive semidefinite $`A`$ of order $`n`$ and every
nonnegative diagonal matrix $`D`$ satisfy

~~~math
\boxed{\quad G(A+D)\ge G(A).\quad}                           \tag{3}
~~~

Consequently, if (1) has any counterexample, one of least order can be
chosen to be a singular correlation matrix.

## 2. Fischer multiplication, with the normalization explicit

For complex polynomials in $`d`$ variables, use

~~~math
\langle f,g\rangle_{\mathcal F}
=\sum_\alpha\alpha!\,\overline{f_\alpha}g_\alpha,
\qquad
\|f\|_{\mathcal F}^2=\langle f,f\rangle_{\mathcal F}.
~~~

The inner product is conjugate linear in its first argument. Distinct
monomials are orthogonal. Let $`M_Q`$ denote multiplication by $`Q`$.
Its adjoint on polynomials is $`M_Q^*=\overline Q(\partial)`$, where the
bar conjugates coefficients.

The polynomial Leibniz rule gives the exact normal-order identity

~~~math
M_Q^*M_Q
=\sum_\alpha\frac1{\alpha!}
M_{\partial^\alpha Q}M_{\partial^\alpha Q}^*.                \tag{4}
~~~

This is a finite sum. To check (4), expand
$`Q(z)=\sum_\beta c_\beta z^\beta`$ and apply
$`\sum_\beta\overline{c_\beta}\partial^\beta`$ to $`Qf`$.
After choosing which $`\alpha`$ derivatives fall on $`Q`$, the remaining
operator is
$`(\partial^\alpha\overline Q)(\partial)/\alpha!`$.
This is precisely the term on the right in (4).

If $`Q`$ is homogeneous of degree $`b`$, then its derivatives of total
order $`b`$ are constants and

~~~math
\sum_{|\alpha|=b}\frac{|\partial^\alpha Q|^2}{\alpha!}
=\sum_{|\alpha|=b}\alpha!|c_\alpha|^2
=\|Q\|_{\mathcal F}^2.
~~~

All other terms in (4) are positive semidefinite quadratic forms.
Therefore

~~~math
M_Q^*M_Q\succeq \|Q\|_{\mathcal F}^2 I,
\qquad
\|Qf\|_{\mathcal F}^2
\ge \|Q\|_{\mathcal F}^2\|f\|_{\mathcal F}^2.                \tag{5}
~~~

This is the Fischer normalization of the classical Bombieri product
inequality. In particular, it applies to an arbitrary linear combination
of homogeneous products, not only to a single product of linear forms.

More explicitly, the positive remainder in (5) is

~~~math
\langle f,(M_Q^*M_Q-\|Q\|_{\mathcal F}^2I)g\rangle_{\mathcal F}
=
\sum_{|\alpha|<b}\frac1{\alpha!}
\left\langle
\overline{\partial^\alpha Q}(\partial)f,\,
\overline{\partial^\alpha Q}(\partial)g
\right\rangle_{\mathcal F}.                                \tag{6}
~~~

The formula also covers $`b=0`$, with zero remainder.

## 3. Proof of the cofactor Gram order

Choose complex linear forms $`\ell_i`$ with Gram matrix $`A`$, so that

~~~math
\langle\ell_i,\ell_j\rangle_{\mathcal F}=a_{ij}.
~~~

Products of linear forms satisfy the Gaussian/Fischer identity

~~~math
\left\langle
\prod_{i\in I}\ell_i,\,
\prod_{j\in J}\ell_j
\right\rangle_{\mathcal F}
=\operatorname{per}A[I,J]                                  \tag{7}
~~~

when $`|I|=|J|`$. It follows either by coefficient expansion or by
pairing complex Gaussian factors. In particular, the matrix
$`C_S(i,j)=\operatorname{per}A[S](i\mid j)`$ is the Gram matrix of the
products with one index omitted.

Put $`T=S\setminus R`$ and

~~~math
Q=\prod_{k\in T}\ell_k,\qquad
f_i=\prod_{k\in R\setminus\{i\}}\ell_k\quad(i\in R).
~~~

Then $`\|Q\|_{\mathcal F}^2=P_T`$, and (5), applied to every linear
combination of the $`f_i`$, proves

~~~math
C_S[R,R]\succeq P_T C_R.
~~~

The matrix $`A[R]`$ is positive semidefinite. Taking the entrywise product
with it preserves positive semidefiniteness by the Schur product theorem.
Since $`\Gamma_S=A[S]\circ C_S`$, this proves (2).

Equation (6) supplies a sum of Gram matrices for the difference, so the
proof covers singular $`A`$ directly. No positive-definite approximation
is needed.

Two standard consequences of (5) will be used below:

~~~math
P_{R\cup T}\ge P_RP_T\qquad(R\cap T=\varnothing),             \tag{8}
~~~

and, by multiplying linear forms successively,

~~~math
P_R\ge\prod_{i\in R}a_{ii}.                                 \tag{9}
~~~

For a correlation matrix these permanents are all at least one.

## 4. Exact random-subset identities for diagonal noise

Suppose $`A`$ is a correlation matrix of order $`n`$. Fix numbers
$`0\le t_i\le1`$ and define

~~~math
B=T^{1/2}AT^{1/2}+I-T,\qquad
T=\operatorname{diag}(t_1,\ldots,t_n).
~~~

For a subset $`S\subseteq[n]`$, define a matrix $`X_S`$ on all $`n`$
indices by

~~~math
X_S=\Gamma_S\oplus P_S I_{S^c}.                             \tag{10}
~~~

Off-diagonal blocks are zero. Let $`S`$ be the random subset in which
indices are included independently with probabilities $`t_i`$. Then

~~~math
\boxed{\quad
\Gamma(B)=\mathbb E X_S.
\quad}                                                       \tag{11}
~~~

For an off-diagonal entry $`i\ne j`$, expand its cofactor by the
diagonal terms $`1-t_k`$ outside $`\{i,j\}`$. Every surviving term
uses both indices $`i,j`$ from the $`A`$ part. The two congruence factors
from the entry and cofactor supply $`t_i t_j`$, and all other used
indices supply $`t_k`$. This is exactly the corresponding entry of
$`\mathbb E X_S`$.

For a diagonal entry, $`b_{ii}=1`$ and the cofactor expansion is over
subsets outside $`i`$. In (10), both cases $`i\in S`$ and $`i\notin S`$
produce the same permanent with index $`i`$ absent. Their probabilities
add by $`t_i+(1-t_i)=1`$. Thus (11) holds on the diagonal as well.

The squared-modulus matrix has off-diagonal entries
$`t_i t_j|a_{ij}|^2`$ and diagonal entries one. Expanding its permanent
by diagonal choices gives

~~~math
Q(B)=\mathbb E Q_R,                                        \tag{12}
~~~

where $`R`$ includes indices independently with probabilities $`t_i^2`$.
If $`S,T'`$ are independent copies of the subset in (11), their
intersection has exactly this law. Therefore

~~~math
\|\Gamma(B)\|_F^2
=\mathbb E\,\operatorname{tr}(X_SX_{T'}),
\qquad
Q(B)=\mathbb E Q_{S\cap T'}.                               \tag{13}
~~~

The first equality uses Hermitian matrices and independence.

## 5. Conditional comparison for each pair of subsets

For fixed $`S,T'`$, put

~~~math
R=S\cap T',\quad U=S\setminus T',\quad
V=T'\setminus S,\quad W=[n]\setminus(S\cup T').
~~~

Direct multiplication of the blocks in (10) gives

~~~math
\begin{aligned}
\operatorname{tr}(X_SX_{T'})
={}&\operatorname{tr}\bigl(\Gamma_S[R,R]\Gamma_{T'}[R,R]\bigr)\\
&+P_{T'}\sum_{i\in U}\Gamma_S(i,i)
 +P_S\sum_{i\in V}\Gamma_{T'}(i,i)
 +|W|P_SP_{T'}.                                           \tag{14}
\end{aligned}
~~~

Theorem 1 implies

~~~math
\operatorname{tr}\bigl(\Gamma_S[R,R]\Gamma_{T'}[R,R]\bigr)
\ge P_UP_V\|\Gamma_R\|_F^2
\ge\|\Gamma_R\|_F^2.                                      \tag{15}
~~~

Indeed, expand the two positive semidefinite remainders in (2);
the trace of a product of positive semidefinite matrices is nonnegative.
The last inequality uses (9).

For $`i\in U`$, correlation normalization and (8)-(9) give

~~~math
\Gamma_S(i,i)=P_{S\setminus\{i\}}\ge P_R,\qquad
P_{T'}\ge P_R.
~~~

The analogous estimates hold for $`i\in V`$, and
$`P_SP_{T'}\ge P_R^2`$ for the $`W`$ terms. Thus every one of the
$`n-|R|`$ diagonal terms outside the first term is at least $`P_R^2`$.

Assume now the hypothesis of Theorem 2. If $`R\ne[n]`$, the
smaller-order averaged comparison and Pate's upper bound give

~~~math
\|\Gamma_R\|_F^2\ge |R|Q_R,\qquad P_R^2\ge Q_R.
~~~

These statements include the empty-set conventions. Equations (14)-(15)
therefore imply

~~~math
\operatorname{tr}(X_SX_{T'})\ge nQ_R
\qquad(R\ne[n]).                                          \tag{16}
~~~

The only omitted pair is $`S=T'=[n]`$. Its probability is
$`\prod_i t_i^2`$, and its gap is exactly $`G(A)`$. Taking expectations
in (13) proves

~~~math
\boxed{\quad
G\!\left(T^{1/2}AT^{1/2}+I-T\right)
\ge\left(\prod_i t_i^2\right)G(A).
\quad}                                                       \tag{17}
~~~

No sign is assumed for $`G(A)`$ itself.

## 6. Diagonal additions and the singular reduction

For a positive diagonal matrix $`D_0=\operatorname{diag}(d_i)`$, put
$`c=\prod_i d_i^2`$. Entry and cofactor scaling cancel their omitted
factors, giving

~~~math
\Gamma(D_0AD_0)=c\Gamma(A),\qquad
Q(D_0AD_0)=c^2Q(A),\qquad
G(D_0AD_0)=c^2G(A).                                       \tag{18}
~~~

Suppose first $`A`$ has positive diagonal $`a_{ii}`$. Normalize it to a
correlation matrix $`C`$. For $`D=\operatorname{diag}(\delta_i)\succeq0`$,
the correlation normalization of $`A+D`$ is the matrix in (17) with

~~~math
t_i=\frac{a_{ii}}{a_{ii}+\delta_i}.
~~~

After (18), the product factor in (17) cancels exactly:

~~~math
\begin{aligned}
G(A+D)
&\ge\left(\prod_i(a_{ii}+\delta_i)^2\right)
      \left(\prod_i t_i^2\right)G(C)\\
&=\left(\prod_i a_{ii}^2\right)G(C)=G(A).
\end{aligned}
~~~

If some diagonal entry is zero, apply this result to $`A+\eta I`$ and
let $`\eta\downarrow0`$. All expressions are polynomials and continuous.
This proves Theorem 2.

Finally, suppose a counterexample exists and choose its least order.
A zero diagonal entry in a positive semidefinite matrix forces a zero
row and column and makes $`G=0`$. Thus the matrix can be normalized to
a correlation matrix $`A`$. If it is positive definite, let
$`\lambda=\lambda_{\min}(A)>0`$. It has $`\lambda<1`$, since otherwise
trace $`n`$ forces $`A=I`$, which has zero gap. Put

~~~math
C=\frac{A-\lambda I}{1-\lambda}.
~~~

This is a singular correlation matrix and

~~~math
A=(1-t)I+tC,\qquad t=1-\lambda\in(0,1).
~~~

The smaller-order hypothesis holds by minimality, so (17) gives

~~~math
G(A)\ge t^{2n}G(C).
~~~

Since $`G(A)<0`$, one obtains $`G(C)<0`$. This proves the stated
singular reduction. It supplies no reason that a singular correlation
matrix cannot violate (1).

## 7. Sources and the remaining mathematical obligation

The multiplication inequality and normal-order identity are classical:

- B. Beauzamy, E. Bombieri, P. Enflo, and H. L. Montgomery,
  *Products of polynomials in many variables*, Journal of Number Theory
  36 (1990), 219-245.
- B. Reznick, *An inequality for products of polynomials*, Proceedings
  of the American Mathematical Society 117 (1993), 1063-1073,
  [author's institutional record](https://experts.illinois.edu/en/publications/an-inequality-for-products-of-polynomials/).
  This record states the complex homogeneous setting and the Fischer
  normalization. The full linked reprint was not retrievable here.
- B. Beauzamy and J. Dégot, *Differential identities*,
  [author-hosted primary manuscript](https://www.scmsa.eu/BB_Publications/BB_Degot_Differential_Identities.pdf).
  The complete manuscript was opened; it works with complex coefficients
  and gives the underlying differential identities.
- D. Zeilberger, *Chu's 1303 identity implies Bombieri's 1990
  norm-inequality*, American Mathematical Monthly 101 (1994), 894-896,
  [primary preprint](https://arxiv.org/pdf/math/9307202).
  Its complete two-page derivation records the product identity and
  extraction of the top-derivative terms.

Pate's upper bound and its exact application are sourced in the linked
cofactor bridge note, including the
[primary publisher abstract](https://doi.org/10.1016/j.laa.2007.05.019).

This note supplies a complete proof of the needed Gram-order consequence
and of the conditional extension. It does not claim these consequences
are historically new. The unresolved step remains

~~~math
\|\Gamma(A)\|_F^2\ge n\operatorname{per}|A|^2
~~~

for arbitrary singular correlation matrices in an unbounded order.
The conditional extension cannot be used as its own induction base.
Completed full Minc entries: zero.

