# The leading quadratic-packet central-limit correction

Date: 20 November 2026 (America/Chicago).

Status: an exact obstruction to a proposed Gaussian-replacement
counterexample construction. The result concerns the leading
$`1/N`$ correction for one normalized binary quadratic-chaos family.
It does not prove Marcus's block-permanent inequality, the general
homogeneous product inequality, or the sign of the full finite-$`N`$
difference. No full Minc entry is resolved.

## 1. The family and the test

Let $`x,y`$ be independent standard proper complex Gaussian variables.
Thus $`\mathbb E x^a\overline x^{\,b}=\mathbf1_{a=b}a!`$, and likewise
for $`y`$. This moment identity follows by integrating the angle and
radius in $`\pi^{-1}e^{-|z|^2}\,d^2z`$.

Define the vector of homogeneous quadratic polynomials

~~~math
q(x,y)=\left(\frac{x^2-y^2}{2},
            \frac{i(x^2+y^2)}{2},xy\right).                 \tag{1}
~~~

Direct expansion gives

~~~math
\mathbb E q_i\overline q_j=\delta_{ij},
\qquad
q_1^2+q_2^2+q_3^2=0.                                      \tag{2}
~~~

Let $`q^{(1)},\ldots,q^{(N)}`$ be independent copies and put

~~~math
W_N=\frac1{\sqrt N}\sum_{a=1}^N q^{(a)}.
~~~

Let $`Z`$ be a standard proper complex Gaussian vector in
$`\mathbb C^3`$. For a homogeneous polynomial $`h`$ of degree $`m`$,
write

~~~math
\|h\|_{\mathcal F}^2
=\mathbb E|h(Z)|^2
=\sum_\alpha\alpha!|h_\alpha|^2.
~~~

If $`h=L_1\cdots L_m`$ is a product of linear forms on
$`\mathbb C^3`$, then $`h(W_N)`$ is a product of $`m`$
homogeneous quadratic polynomials in $`2N`$ underlying variables.
The Gaussian comparison value is
$`\|h\|_{\mathcal F}^2=\operatorname{per}(\langle L_i,L_j\rangle)`$.
This is the product test relevant to the possible generalization
discussed in the
[earlier Gaussian route audit](../../inequalities/marcus_gaussian_routes.md).
The quadratic polynomials obtained after summing copies need not
factor into two linear forms.

## 2. Exact fourth cumulant

The fourth moments of (1) are

~~~math
\mathbb E q_iq_j\overline q_k\,\overline q_l
=
3(\delta_{ik}\delta_{jl}+\delta_{il}\delta_{jk})
-2\delta_{ij}\delta_{kl}.                                  \tag{3}
~~~

For an elementary check, the six products
$`q_1^2,q_2^2,q_3^2,q_1q_2,q_1q_3,q_2q_3`$ have the following
Gram data in the Gaussian/Fischer norm. The first three squared norms
are four and their pairwise inner products are $`-2`$. The last three
squared norms are three; they are mutually orthogonal and orthogonal
to the first three. Expanding the quadratics and using
$`\|x^a y^b\|^2=a!b!`$ verifies each entry. These entries give (3).

The covariance is the identity and the pseudo-covariance vanishes.
Subtracting the two Gaussian pairings from (3) gives the balanced
fourth cumulant

~~~math
\kappa_{ij;kl}
=
2(\delta_{ik}\delta_{jl}+\delta_{il}\delta_{jk})
-2\delta_{ij}\delta_{kl}.                                  \tag{4}
~~~

As an operator on symmetric two-tensors, this is
$`4I-6P_0`$, where $`P_0`$ projects onto the line spanned by
$`I_3/\sqrt3`$. This operator has a negative direction. That fact
alone does not determine its contraction with a product test.

## 3. The first central-limit coefficient

For every fixed homogeneous polynomial $`h`$,

~~~math
\mathbb E|h(W_N)|^2
=
\|h\|_{\mathcal F}^2+\frac{\mathcal C(h)}{N}+O_h(N^{-2}),
                                                                    \tag{5}
~~~

where

~~~math
\begin{aligned}
\mathcal C(h)
&=\frac14\sum_{i,j,k,l}
  \kappa_{ij;kl}
  \left\langle\partial_k\partial_lh,\,
              \partial_i\partial_jh\right\rangle_{\mathcal F}\\
&=\sum_{i,j}\|\partial_i\partial_jh\|_{\mathcal F}^2
  -\frac12\left\|\sum_i\partial_i^2h\right\|_{\mathcal F}^2.           \tag{6}
\end{aligned}
~~~

The factor $`1/4`$ is $`1/(2!2!)`$.

Here is a finite-algebra derivation of (5). Circular symmetry of
$`q`$ makes every unbalanced joint cumulant zero. Its formal logarithmic
moment-generating series is

~~~math
\log\mathbb E e^{t\cdot q+s\cdot\overline q}
=
t\cdot s+\frac14\sum_{i,j,k,l}\kappa_{ij;kl}t_it_js_ks_l
+\{\text{terms of balanced degree at least }(3,3)\}.
~~~

For $`W_N`$, a cumulant of balanced degree $`(r,r)`$ is multiplied
by $`N^{1-r}`$. Exponentiating therefore leaves only the fourth-cumulant
term at order $`1/N`$. Apply
$`h(\partial_t)\overline h(\partial_s)`$ and evaluate at zero.
Multiplication by $`t_it_js_ks_l`$ differentiates the two test
polynomials as displayed in (6). Only degrees at most $`(m,m)`$
are used, so this argument concerns finitely many coefficients and
does not require convergence of an infinite formal series. The
remaining finite terms have order at most $`N^{-2}`$.

Substitution of (4) into (6) uses the symmetry of the Hessian and gives
its second line.

## 4. A self-contained Fischer bound for the complex Laplacian

Set

~~~math
\Delta=\sum_{i=1}^3\partial_i^2,\qquad
\rho=z_1^2+z_2^2+z_3^2,\qquad
E=\sum_i z_i\partial_i.
~~~

In the Fischer inner product, $`\partial_i^*=M_{z_i}`$.
Consequently, on homogeneous degree $`m`$,

~~~math
\sum_{i,j}\|\partial_i\partial_jh\|_{\mathcal F}^2
=
\left\langle h,\sum_{i,j}z_iz_j\partial_i\partial_jh\right\rangle
=m(m-1)\|h\|_{\mathcal F}^2.                                \tag{7}
~~~

We also have $`\Delta^*=M_\rho`$ and

~~~math
[\Delta,M_\rho]=4E+6I.                                    \tag{8}
~~~

Let $`\mathcal P_m`$ be the space of homogeneous degree-$`m`$
polynomials. Since multiplication by $`\rho`$ is injective,
finite-dimensional adjoint linear algebra gives

~~~math
\mathcal P_m
=
\ker(\Delta|_{\mathcal P_m})
\ \mathbin{\perp}\ \rho\mathcal P_{m-2}.                    \tag{9}
~~~

Iterating this decomposition gives
$`h=\sum_{s=0}^{\lfloor m/2\rfloor}\rho^s h_{m-2s}`$ with
$`\Delta h_{m-2s}=0`$. Commutator (8), by induction on $`s`$, gives

~~~math
\Delta(\rho^s h_{m-2s})
=
4s\left(m-s+\frac12\right)\rho^{s-1}h_{m-2s}.               \tag{10}
~~~

Thus the summands are eigenspaces of the self-adjoint operator
$`M_\rho\Delta=\Delta^*\Delta`$, with eigenvalues

~~~math
\lambda_s=4s\left(m-s+\frac12\right).
~~~

These eigenvalues strictly increase over
$`0\le s\le\lfloor m/2\rfloor`$. Distinct summands are therefore
orthogonal, and

~~~math
\boxed{\quad
\|\Delta h\|_{\mathcal F}^2
\le
4\left\lfloor\frac m2\right\rfloor
 \left(m-\left\lfloor\frac m2\right\rfloor+\frac12\right)
 \|h\|_{\mathcal F}^2.
\quad}                                                       \tag{11}
~~~

The constant is $`m(m+1)`$ for even $`m`$ and
$`(m-1)(m+2)`$ for odd $`m`$. Equations (8)–(10) prove the
harmonic decomposition and the bound used here, so no external
harmonic-decomposition theorem is needed.

## 5. Consequence for product tests, and the limit of the conclusion

For every nonzero homogeneous $`h`$ of degree $`m\ge3`$,
equations (6), (7), and (11) give

~~~math
\mathcal C(h)\ge
\begin{cases}
\dfrac{m(m-3)}2\,\|h\|_{\mathcal F}^2,&m\ge4\text{ even},\\[2mm]
\dfrac{(m-1)(m-2)}2\,\|h\|_{\mathcal F}^2,&m\ge3\text{ odd}.
\end{cases}                                                 \tag{12}
~~~

In particular, these coefficients are strictly positive; at degree
three the lower bound is $`\|h\|_{\mathcal F}^2`$.

For degree two, impose the product condition
$`h=L_1L_2`$. Its constant Hessian $`H`$ has rank at most two.
For any complex matrix,
$`|\operatorname{tr}H|\le\sum_j s_j(H)
 \le\sqrt{\operatorname{rank}H}\,\|H\|_F`$,
by a singular-value decomposition and Cauchy–Schwarz. Hence

~~~math
\mathcal C(L_1L_2)=\|H\|_F^2-\frac12|\operatorname{tr}H|^2\ge0.        \tag{13}
~~~

At degree one the Hessian is zero. Therefore every homogeneous product
test has a nonnegative leading coefficient in (5).

The product condition at degree two cannot be dropped. For
$`h=\rho`$, the norms are
$`\|h\|_{\mathcal F}^2=6`$, $`\|\operatorname{Hess}h\|_F^2=12`$,
and $`\|\Delta h\|_{\mathcal F}^2=36`$, so
$`\mathcal C(h)=-6`$. In fact

~~~math
\mathbb E|\rho(W_N)|^2=6-\frac6N.
~~~

At $`N=1`$ this agrees with the polynomial relation in (2).
This reproduces the failure for a nonproduct test, while (12)–(13)
explain why the same construction does not produce a negative leading
coefficient for the required product test.

No sign for the terms of order $`N^{-2}`$ and smaller has been proved
here. The conclusion excludes this leading-correction construction;
it is not a covariance-preserving comparison for all homogeneous
polynomials or a solution of the full block-permanent conjecture.

