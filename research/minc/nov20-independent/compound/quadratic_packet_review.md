# Independent review of the finite-copy quadratic comparison

Date: 20 November 2026 (America/Chicago).

Reviewed: [quadratic_packet_finite_copy.md](../inequalities/quadratic_packet_finite_copy.md).

Status: the proof passes this independent review. The exact comparison
holds for the specified quadratic family. The harmonic spectrum is a
classical specialization, and the result resolves no full Minc entry.

## 1. Direct checks of the written proof

For the normalization in the note, write
$`z=(u+iv)/\sqrt2`$ with real standard Gaussian vectors $`u,v`$.
The quadratic Gaussian integral is

~~~math
\mathbb E\exp\left(\frac12z^{\mathsf T}Tz+
                        \frac12\overline z^{\mathsf T}S\overline z\right)
=\det(I-TS)^{-1/2}.
~~~

The block determinant in Section 2 has the correct factors of two.
For the displayed $`T,S`$, their trace product is $`2t\cdot s`$,
and their determinant product is $`\rho(t)\rho(s)`$.
Scaling both arguments by $`N^{-1/2}`$ and multiplying the independent
copy kernels therefore gives exactly (7). The quadratic form uses a
transpose, so identifying its law with ordinary complex Hermitian
Wishart would be incorrect; the note expressly avoids this identification.

The coefficient of bidegree $`(m,m)`$ has $`m-2j`$ bilinear
factors and $`j`$ quadratic pairs. Their combined scaling is
$`N^{-m}`$, and the coefficient is

~~~math
\frac{(-1)^j2^{m-2j}(\nu)_{m-j}}{j!(m-2j)!N^m}.
~~~

The degree-$`d`$ Fischer identity kernel is
$`(t\cdot s)^d/d!`$. Thus the factor $`(m-2j)!`$
disappears when the kernel is converted to $`M_\rho^j\Delta^j`$,
as in (9). It must not appear a second time in that operator.

The commutator $`[\Delta,M_\rho]=4E+6I`$ gives
$`\Delta(\rho^sH_\ell)=4s(\ell+s+1/2)\rho^{s-1}H_\ell`$.
Both falling factorials in (12) follow. In (14), the identity

~~~math
(1-x)^{m-s+1/2}(1-x)^{-\nu-m+s}=(1-x)^{1/2-\nu}
~~~

proves the finite sum directly, including $`N=1`$. There is no
division by a possibly vanishing hypergeometric parameter.

## 2. Independent Gegenbauer derivation

This derivation checks the spectral normalization without using the
operator summation in the reviewed proof. Let

~~~math
v=\rho(t)\rho(u),\qquad
x=\frac{t\cdot u}{\sqrt v},\qquad
\ell=m-2s.
~~~

All formulas containing square roots below are polynomial identities
after cancellation, so they extend to $`v=0`$.
The Gegenbauer generating function gives the bidegree-$`(m,m)`$
part of the moment kernel as

~~~math
N^{-m}v^{m/2}C_m^{(\nu)}(x).                              \tag{R1}
~~~

For the standard Fischer norm in three variables, the reproducing
kernel of $`\mathcal H_\ell`$ is

~~~math
K_{\mathcal H_\ell}(t,u)
=\frac{v^{\ell/2}C_\ell^{(1/2)}(x)}
       {2^\ell(1/2)_\ell}.                               \tag{R2}
~~~

Its coefficient of $`(t\cdot u)^\ell`$ is $`1/\ell!`$,
as required by projection of the Fischer identity kernel.
Repeated use of $`M_\rho^*=\Delta`$ gives

~~~math
\|\rho^sH_\ell\|_{\mathcal F}^2
=4^s s!(\ell+3/2)_s\|H_\ell\|_{\mathcal F}^2.
~~~

Consequently, the projection kernel of the sector
$`\rho^s\mathcal H_\ell`$ is

~~~math
K_{m,s}(t,u)
=\frac{v^{m/2}C_\ell^{(1/2)}(x)}
 {2^\ell(1/2)_\ell\,4^s s!(\ell+3/2)_s}.               \tag{R3}
~~~

The classical Gegenbauer connection formula, with target parameter
$`1/2`$, is

~~~math
C_m^{(\nu)}(x)
=\sum_{s=0}^{\lfloor m/2\rfloor}
(2\ell+1)\frac{(\nu)_{m-s}}{(3/2)_{m-s}}
\frac{(\nu-1/2)_s}{s!}\,C_\ell^{(1/2)}(x),
\qquad \ell=m-2s.                                        \tag{R4}
~~~

Comparing (R1) with (R3) and (R4), use

~~~math
(3/2)_{m-s}=(3/2)_\ell(\ell+3/2)_s,\qquad
\frac{(1/2)_\ell}{(3/2)_\ell}=\frac1{2\ell+1},\qquad
2^\ell4^s=2^m.
~~~

The sector coefficient is therefore

~~~math
\lambda_{m,s}
=\left(\frac2N\right)^m(\nu)_{m-s}(\nu-1/2)_s,
~~~

which agrees with (4), including its factor $`\nu^{-m}`$.

## 3. Inequality and equality audit

The ratio in (15) is strictly less than one throughout its stated
range. The smallest eigenvalue thus lies at $`s=\lfloor m/2\rfloor`$.
The degree-three minimum is $`1+(\nu-1)/(2\nu^2)`$.
The two successive-degree factors in (16) exceed one whenever they
are used after that base case. Hence the asserted comparison holds
for all homogeneous $`h`$ of degree at least three and $`N\ge2`$.
The only nonzero equality space there is
$`N=2,m=3,h\in\rho\mathcal H_1`$.

The rank-three quadratic $`\rho`$ is irreducible over
$`\mathbb C`$. Unique factorization excludes nonzero products of
three linear forms from this equality space. All higher degrees are
strict for every nonzero polynomial, establishing the claimed strict
product inequality.

For degree two, the radial norm and Hessian normalization in (20)
are correct. A product has Hessian rank at most two, and
$`|\operatorname{tr}H|\le\sqrt2\|H\|_F`$ proves the comparison.
Condition (21) is an exact equality condition, including the zero
polynomial. The product $`z_1^2+z_2^2`$ attains equality. The
nonproduct $`\rho`$ has difference $`-6/N`$, so the restriction in
degree two is necessary. Degrees zero and one give equality.

The sector eigenvalues need not be monotone in $`N`$; the draft's
explicit caution about $`\lambda_{3,1}`$ is necessary. At $`N=1`$,
every radial sector vanishes, leaving exactly (23). The product
harmonic-projection inequality (24) is an outstanding obligation of
this approach, not a consequence of the finite-copy theorem.

As an independent normalization check, direct expansion in the four
underlying complex Gaussian variables at $`N=2`$ gives the following
pairs $`(\|h\|_{\mathcal F}^2,\mathbb E|h(W_2)|^2)`$:
$`\rho:(6,3)`$, $`\rho z_1:(10,10)`$,
$`z_1^3:(6,18)`$, $`\rho^2:(120,180)`$, and
$`z_1^2+z_2^2:(4,4)`$. These finite checks support the conventions;
the proof above supplies the all-degree conclusion.

## 4. Source and scope boundaries

The following primary or official sources were inspected:

- H. De Bie, F. Sommen, and M. Wutzig,
  [*Plane wave formulas for spherical, complex and symplectic harmonics*](https://backoffice.biblio.ugent.be/download/8530997/8530998),
  Section 2.1, Theorems 1--3 and Lemma 1: the Fischer normalization,
  harmonic decomposition, and Gegenbauer reproducing kernel used in
  (R2). This uses their real orthogonal harmonic theory, complexified;
  it does not substitute the different convention of their complex
  harmonic section.
- NIST DLMF [18.12.4](https://dlmf.nist.gov/18.12#E4) and
  [18.18.16](https://dlmf.nist.gov/18.18#E16): the generating function
  and connection formula used in (R1) and (R4).
- H. Upmeier,
  [*Eigenvalues of K-invariant Toeplitz Operators on Bounded Symmetric Domains*](https://link.springer.com/article/10.1007/s00020-021-02639-3),
  Section 2, equations (2.4), (2.7), and (2.8): the generalized
  Pochhammer coefficients and the Faraut--Koranyi expansion. The
  three-dimensional spin factor has rank two and parameter $`a=1`$.
  Its partition $`(m-s,s)`$ yields
  $`(\nu)_{m-s}(\nu-1/2)_s`$. The invariant inner product in that
  convention is $`2z\cdot\overline w`$, so the standard Fischer
  normalization here requires the explicit factor $`(2/N)^m`$.

The original Faraut--Koranyi article was not available in full text;
the attribution above uses Upmeier's explicit reproduction. The
displayed spectrum is classical and carries no priority claim.
The Gaussian integral and the finite sum in the reviewed note prove
the needed formulas without relying on a change of normalization
between sources.

For $`N>1`$, the quadratic forms $`L_i(W_N)`$ need not factor into
two linear forms. The theorem concerns this specified family of the
homogeneous-product comparison. It neither proves that comparison
for arbitrary quadratic forms nor resolves Marcus's conjecture.
The full-entry completion count remains zero.
