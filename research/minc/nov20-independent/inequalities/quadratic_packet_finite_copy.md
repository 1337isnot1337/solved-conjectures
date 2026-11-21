# An exact finite-copy quadratic-packet comparison

Date: 20 November 2026 (America/Chicago).

Status: exact proof, independently reviewed by root and the compound
worker; [written independent review](../compound/quadratic_packet_review.md).
The result extends
the [leading-correction calculation](quadratic_clt_correction.md) to every
integer number of copies. The spectral coefficients are a specialization
of classical harmonic/Fischer identities; no historical priority is
claimed. This result concerns one quadratic Gaussian family. It does
not resolve Marcus's block-permanent inequality or any full Minc entry.

## 1. Family, normalization, and theorem

Let $`x,y`$ be independent standard proper complex Gaussian variables,
normalized by $`\mathbb E x^a\overline x^{\,b}=\mathbf1_{a=b}a!`$.
Put

~~~math
q(x,y)=\left(\frac{x^2-y^2}{2},
            \frac{i(x^2+y^2)}{2},xy\right),\qquad
W_N=N^{-1/2}\sum_{a=1}^N q^{(a)},                         \tag{1}
~~~

where the copies are independent and $`N\ge1`$ is an integer.
Expansion gives $`\mathbb E q_i\overline q_j=\delta_{ij}`$ and

~~~math
\rho(q)=0,\qquad \rho(z)=z_1^2+z_2^2+z_3^2.              \tag{2}
~~~

For a polynomial on $`\mathbb C^3`$, use the Fischer norm

~~~math
\|h\|_{\mathcal F}^2=\sum_\alpha \alpha!|h_\alpha|^2
                   =\mathbb E|h(Z)|^2,                  \tag{3}
~~~

where $`Z`$ is a standard proper complex Gaussian vector.
The inner product is conjugate-linear in its first argument.
Let $`\mathcal P_m`$ be the homogeneous degree-$`m`$ polynomials,
$`\Delta=\sum_{i=1}^3\partial_i^2`$, and
$`\mathcal H_\ell=\ker(\Delta|_{\mathcal P_\ell})`$.

**Theorem.** Write the orthogonal Fischer decomposition as

~~~math
h=\sum_{s=0}^{\lfloor m/2\rfloor}h_s,\qquad
h_s\in\rho^s\mathcal H_{m-2s},
\qquad \nu=\frac N2.
~~~

Then

~~~math
\boxed{\quad
\mathbb E|h(W_N)|^2
=\sum_{s=0}^{\lfloor m/2\rfloor}
  \lambda_{m,s}(N)\|h_s\|_{\mathcal F}^2,\qquad
\lambda_{m,s}(N)
=\nu^{-m}(\nu)_{m-s}\left(\nu-\frac12\right)_s.
\quad}                                                    \tag{4}
~~~

Here $`(a)_j=a(a+1)\cdots(a+j-1)`$, with $`(a)_0=1`$.

For every integer $`N\ge2`$:

- Every homogeneous polynomial of degree $`m\ge3`$ satisfies
  $`\mathbb E|h(W_N)|^2\ge\|h\|_{\mathcal F}^2`$.
- Every product $`h=L_1\cdots L_m`$ of linear forms satisfies
  the same inequality for every $`m\ge0`$.
- For a nonzero product and $`m\ge3`$, the inequality is strict.

The complete equality conditions and the $`N=1`$ limitation appear
below.

For the product statement, set
$`F_i=L_i(W_N)`$ and $`G_{ij}=\mathbb E\overline{F_i}F_j`$.
Covariance normalization in (1) gives

~~~math
\mathbb E\prod_{i=1}^m|F_i|^2
\ge \operatorname{per}G
=\|L_1\cdots L_m\|_{\mathcal F}^2.                         \tag{5}
~~~

The permanent identity follows by expanding the product and matching
each holomorphic Gaussian factor with an antiholomorphic factor.
Although each $`F_i`$ is a homogeneous quadratic in $`2N`$
variables, it need not factor into two linear forms. Thus (5) is
a comparison for a specified family in the broader homogeneous-product
problem, not a proof for all packets in Marcus's conjecture.

## 2. Exact moment-generating kernel

All generating series below can be read formally. They also converge
in a neighborhood of zero.

For independent formal vectors $`t,s\in\mathbb C^3`$, define

~~~math
T(t)=
\begin{pmatrix}
t_1+it_2&t_3\\
t_3&-t_1+it_2
\end{pmatrix},
\qquad
S(s)=
\begin{pmatrix}
s_1-is_2&s_3\\
s_3&-s_1-is_2
\end{pmatrix}.
~~~

With $`z=(x,y)^{\mathsf T}`$,

~~~math
t\cdot q=\frac12z^{\mathsf T}T(t)z,\qquad
s\cdot\overline q=\frac12\overline z^{\mathsf T}S(s)\overline z.
~~~

The Gaussian integral gives

~~~math
\mathbb E e^{t\cdot q+s\cdot\overline q}
=\det(I_2-T(t)S(s))^{-1/2}.                               \tag{6}
~~~

For completeness, write $`z=(u+iv)/\sqrt2`$, where the four entries
of $`(u,v)`$ are independent real standard Gaussians, and put

~~~math
R=\frac1{\sqrt2}
\begin{pmatrix}I_2&iI_2\\I_2&-iI_2\end{pmatrix},
\qquad
RR^{\mathsf T}=
\begin{pmatrix}0&I_2\\I_2&0\end{pmatrix}.
~~~

The exponent in (6) is $`\frac12\xi^{\mathsf T}M\xi`$ with
$`M=R^{\mathsf T}\operatorname{diag}(T,S)R`$.
The real Gaussian quadratic integral is
$`\det(I_4-M)^{-1/2}`$. For real symmetric $`M`$ near zero,
orthogonal diagonalization and four one-dimensional integrals prove
this formula. Analytic continuation near zero gives the complex
symmetric case. The determinant identity
$`\det(I-AB)=\det(I-BA)`$ gives

~~~math
\det(I_4-M)
=\det\begin{pmatrix}I_2&-T\\-S&I_2\end{pmatrix}
=\det(I_2-TS),
~~~

which proves (6), with the square root chosen to equal one at zero.

Direct multiplication gives

~~~math
\operatorname{tr}(TS)=2t\cdot s,\qquad
\det T=-\rho(t),\qquad \det S=-\rho(s).
~~~

Independence of the $`N`$ copies in (1) therefore yields

~~~math
\boxed{\quad
K_N(t,s):=\mathbb E e^{t\cdot W_N+s\cdot\overline W_N}
=\left(1-\frac{2t\cdot s}{N}
          +\frac{\rho(t)\rho(s)}{N^2}\right)^{-N/2}.
\quad}                                                    \tag{7}
~~~

This uses a transpose quadratic form, not the usual Hermitian
sample-covariance matrix in the complex Wishart distribution.

## 3. The moment operator

Let $`\mathcal T_m`$ be the operator on $`\mathcal P_m`$
defined by

~~~math
\langle h,\mathcal T_m g\rangle_{\mathcal F}
=\mathbb E\overline{h(W_N)}g(W_N).
~~~

The component of bidegree $`(m,m)`$ in (7) is

~~~math
N^{-m}
\sum_{j=0}^{\lfloor m/2\rfloor}
\frac{(-1)^j2^{m-2j}(\nu)_{m-j}}{j!(m-2j)!}
(t\cdot s)^{m-2j}\rho(t)^j\rho(s)^j.                      \tag{8}
~~~

Indeed, in the binomial expansion choose $`j`$ factors
$`-\rho(t)\rho(s)/N^2`$ and $`m-2j`$ factors
$`2t\cdot s/N`$.

The Fischer reproducing kernel in degree $`d`$ is
$`(t\cdot s)^d/d!`$. Also $`\Delta^*=M_\rho`$, where
$`M_\rho`$ denotes multiplication by $`\rho`$.
Thus multiplying this degree-$`m-2j`$ kernel by
$`\rho(t)^j\rho(s)^j`$ gives the kernel of
$`M_\rho^j\Delta^j`$ on $`\mathcal P_m`$.
Consequently,

~~~math
\boxed{\quad
\mathcal T_m
=N^{-m}\sum_{j=0}^{\lfloor m/2\rfloor}
\frac{(-1)^j2^{m-2j}(\nu)_{m-j}}{j!}
M_\rho^j\Delta^j.
\quad}                                                    \tag{9}
~~~

Equivalently, its quadratic form is the same coefficient sum with
$`\|\Delta^j h\|_{\mathcal F}^2`$ in place of
$`M_\rho^j\Delta^j`$. This also verifies the factorial
normalization in (9).

## 4. Harmonic decomposition and eigenvalues

Let $`E=\sum_i z_i\partial_i`$. Direct differentiation gives

~~~math
[\Delta,M_\rho]=4E+6I.                                   \tag{10}
~~~

Since $`M_\rho`$ is injective and $`M_\rho^*=\Delta`$,

~~~math
\mathcal P_m=\mathcal H_m\ \mathbin{\perp}\ \rho\mathcal P_{m-2}.
~~~

Iterating gives a direct sum of the spaces
$`\rho^s\mathcal H_{m-2s}`$. For $`H_\ell\in\mathcal H_\ell`$,
(10) gives, by induction,

~~~math
\Delta(\rho^sH_\ell)
=4s\left(\ell+s+\frac12\right)\rho^{s-1}H_\ell.            \tag{11}
~~~

On degree $`m=\ell+2s`$, the operator
$`M_\rho\Delta=\Delta^*\Delta`$ therefore has eigenvalue
$`4s(m-s+1/2)`$. These eigenvalues are distinct over
$`0\le s\le\lfloor m/2\rfloor`$, proving that the full
decomposition is orthogonal.

Use $`a^{\underline j}=a(a-1)\cdots(a-j+1)`$ for a falling
factorial. Repeated use of (11) shows that
$`M_\rho^j\Delta^j`$ acts on $`\rho^sH_{m-2s}`$ as

~~~math
4^j s^{\underline j}
      \left(m-s+\frac12\right)^{\underline j}.            \tag{12}
~~~

The scalar is zero for $`j>s`$. Inserting (12) into (9) gives

~~~math
\lambda_{m,s}
=\left(\frac2N\right)^m
\sum_{j=0}^s
\frac{(-1)^j(\nu)_{m-j}}{j!}
s^{\underline j}
\left(m-s+\frac12\right)^{\underline j}.                  \tag{13}
~~~

Here is a finite coefficient proof of the required summation.
Set $`A=m-s+1/2`$ and $`B=\nu+m-s`$.
Factor $`(\nu)_{m-s}`$ out of (13). The remaining sum is

~~~math
\begin{aligned}
&\sum_{j=0}^s(-1)^j\binom sj
 A^{\underline j}(B)_{s-j}\\
&\quad=s!\,[x^s](1-x)^A(1-x)^{-B}\\
&\quad=s!\,[x^s](1-x)^{1/2-\nu}
       =\left(\nu-\frac12\right)_s.                       \tag{14}
\end{aligned}
~~~

The first equality is the formal binomial theorem, and only finitely
many coefficients are used. It is valid at $`\nu=1/2`$ as well;
no exceptional hypergeometric denominator is introduced.
Equations (13) and (14) prove (4).

## 5. Comparison for every number of copies at least two

Assume $`N\ge2`$, so $`\nu\ge1`$. Consecutive sector
eigenvalues have ratio

~~~math
\frac{\lambda_{m,s+1}}{\lambda_{m,s}}
=\frac{\nu-1/2+s}{\nu+m-s-1}<1
\qquad
\left(0\le s<\left\lfloor\frac m2\right\rfloor\right).
                                                               \tag{15}
~~~

Thus the smallest eigenvalue is at the largest possible $`s`$.
Write

~~~math
a_r=\lambda_{2r,r}
=\nu^{-2r}(\nu)_r\left(\nu-\frac12\right)_r,
\qquad
b_r=\lambda_{2r+1,r}.
~~~

The exact successive-degree relations are

~~~math
b_r=a_r\left(1+\frac r\nu\right),\qquad
a_{r+1}=b_r\left(1+\frac{r-1/2}{\nu}\right).               \tag{16}
~~~

The degree-three base case is

~~~math
b_1=\left(1+\frac1\nu\right)
    \left(1-\frac1{2\nu}\right)
=1+\frac{\nu-1}{2\nu^2}\ge1.                              \tag{17}
~~~

For every $`r\ge1`$, the second factor in the second relation
of (16) exceeds one. The factors used subsequently in the first
relation also exceed one. Therefore

~~~math
\lambda_{\min}(m,N)\ge1\quad(m\ge3,N\ge2),                 \tag{18}
~~~

and the inequality is strict for $`m\ge4`$.
At $`m=3`$, equality in the minimum occurs only at $`N=2`$.
Equation (4) now proves the homogeneous-polynomial comparison.

For a nonzero homogeneous polynomial of degree at least three,
equality occurs precisely when $`N=2`$, $`m=3`$, and
$`h\in\rho\mathcal H_1`$.
The quadratic $`\rho`$ is irreducible over $`\mathbb C`$:
a product of two linear forms has a symmetric coefficient matrix of
rank at most two, whereas $`\rho`$ has rank three.
Unique factorization in $`\mathbb C[z_1,z_2,z_3]`$ then
shows that a nonzero product of three linear forms cannot belong to
$`\rho\mathcal H_1`$. This proves strictness for all nonzero
product tests with $`m\ge3`$ and $`N\ge2`$.

The argument is monotonic in the degree along the sequence in (16),
not in the number of copies. For example,
$`\lambda_{3,1}(N)=1+1/N-2/N^2`$ is not monotone in $`N`$.

## 6. The degree-two product condition

In degree two the two eigenvalues are

~~~math
\lambda_{2,0}=1+\frac2N,\qquad
\lambda_{2,1}=1-\frac1N.                                 \tag{19}
~~~

Write $`h(z)=\frac12z^{\mathsf T}Hz`$ with $`H`$
complex symmetric. Its radial projection is
$`h_{\mathrm{rad}}=(\operatorname{tr}H)\rho/6`$, and

~~~math
\|h\|_{\mathcal F}^2=\frac12\|H\|_F^2,\qquad
\|h_{\mathrm{rad}}\|_{\mathcal F}^2
=\frac{|\operatorname{tr}H|^2}{6}.
~~~

Using (19),

~~~math
\mathbb E|h(W_N)|^2-\|h\|_{\mathcal F}^2
=\frac1N\left(2\|h\|_{\mathcal F}^2
             -3\|h_{\mathrm{rad}}\|_{\mathcal F}^2\right)
=\frac1N\left(\|H\|_F^2
             -\frac12|\operatorname{tr}H|^2\right).       \tag{20}
~~~

If $`h=L_1L_2`$, then $`\operatorname{rank}H\le2`$.
The singular-value decomposition gives
$`|\operatorname{tr}H|\le\sum_j s_j(H)
 \le\sqrt2\,\|H\|_F`$.
Thus (20) is nonnegative. Equality holds exactly when

~~~math
|\operatorname{tr}H|^2=2\|H\|_F^2.                        \tag{21}
~~~

The product hypothesis cannot be removed at degree two:
for $`h=\rho`$, (20) equals $`-6/N`$.
In degrees zero and one, (4) gives equality for all polynomials.
These facts complete the product comparison in (5).

## 7. What happens at one copy

For $`N=1`$, formula (4) becomes

~~~math
\lambda_{m,0}=2^m(1/2)_m=(2m-1)!!,\qquad
\lambda_{m,s}=0\quad(s\ge1).                              \tag{22}
~~~

Here $`(-1)!!=1`$ when $`m=0`$.
If $`H_m`$ is the projection of $`h`$ onto
$`\mathcal H_m`$, then

~~~math
\mathbb E|h(q)|^2=(2m-1)!!\,\|H_m\|_{\mathcal F}^2.         \tag{23}
~~~

Consequently, the one-copy product comparison in degrees at least
three is exactly the separate assertion

~~~math
\|H_m\|_{\mathcal F}^2
\ge\frac{\|L_1\cdots L_m\|_{\mathcal F}^2}{(2m-1)!!},
\qquad h=L_1\cdots L_m.                                  \tag{24}
~~~

This note does not prove (24). The nonproduct test $`h=\rho`$
has zero left side in (23) and positive Fischer norm.
Therefore the all-polynomial proof for $`N\ge2`$ does not
extend to $`N=1`$.

## 8. Classical sources and scope

The following sources were opened on 20 November 2026
(America/Chicago).

- Harald Upmeier,
  [“Eigenvalues of K-invariant Toeplitz Operators on Bounded Symmetric Domains”](https://link.springer.com/article/10.1007/s00020-021-02639-3),
  *Integral Equations and Operator Theory* 93, article 27 (2021),
  Section 2. It gives spin-factor parameters $`r=2`$,
  $`a=d-2`$, $`b=0`$; the generalized Pochhammer symbol
  in (2.4); the Faraut–Korányi kernel expansion in (2.7); and
  its relation to the Fischer norm in (2.8). For $`d=3`$
  and partition $`(m-s,s)`$, the coefficient is
  $`(\nu)_{m-s}(\nu-1/2)_s`$. Our standard Gaussian
  normalization gives the additional factor $`\nu^{-m}`$.
- NIST DLMF,
  [18.12.4](https://dlmf.nist.gov/18.12.E4) and
  [18.18.16](https://dlmf.nist.gov/18.18.E16).
  The Gegenbauer generating function and its connection formula
  with harmonic parameter $`1/2`$ give another classical
  form of the same coefficient calculation.
- The repository's
  [Gaussian route audit](../../inequalities/marcus_gaussian_routes.md)
  distinguishes arbitrary homogeneous tests from products of
  packet linear forms. That distinction remains necessary in
  Sections 6 and 7 and in interpreting (5).

The determinant integral, harmonic decomposition, and finite
coefficient identity have all been derived above with the normalization
used here. The sources identify the classical coefficient formula;
they are not evidence of a new general permanent inequality.

The completed deduction excludes this finite-copy family, with
$`N\ge2`$, as a source of counterexamples to the indicated
homogeneous-product comparison. It does not establish that comparison
for general homogeneous quadratic packets, and it does not complete
Marcus's conjecture. The full-entry completion count remains zero.

