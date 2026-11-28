# Gaussian replacement and Chollet's conjecture

Research date: 20 November 2026 (America/Chicago). This note records an exact obstruction to a stronger moment-matrix comparison and the remaining factorization gap. It does not prove or disprove Chollet's conjecture or Marcus's block-permanent conjecture.

## The replacement formulation

Let X and Y be independent centered circular complex Gaussian vectors with covariance matrices A and conjugate(A), respectively. Set Z_i=X_iY_i. Then


```math
\mathbb E Z_i\overline{Z_j}=|a_{ij}|^2,
\qquad
\mathbb E\prod_i|Z_i|^2=(\mathop{\mathrm{per}}A)^2.
```


If G is circular complex Gaussian with covariance A Hadamard-product conjugate(A), then


```math
\mathbb E\prod_i|G_i|^2=\mathop{\mathrm{per}}(A\circ\overline A).
```


Thus self-Chollet is exactly a comparison for one fully factored test. It does not license replacing that test by an arbitrary polynomial.

For squarefree degree-two monomials indexed by two-element subsets S,T, the two moment matrices are


```math
M_Z(S,T)=|\mathop{\mathrm{per}}A[S,T]|^2,
\qquad
M_G(S,T)=\mathop{\mathrm{per}}(|A|^2[S,T]).
```


A proposed sufficient mechanism would be positive semidefinite domination M_Z>=M_G. The following family disproves that mechanism in every order at least four.

## An all-order negative eigendirection

Take the regular-simplex correlation matrix


```math
A=\frac{nI-J}{n-1},\qquad n\geq4,
\qquad t=-\frac1{n-1}.
```


It is real positive semidefinite, has diagonal one, and has all off-diagonal entries t. Write D=M_Z-M_G. Direct evaluation of its two-by-two permanents gives


```math
D_{S,T}=\begin{cases}
2t^2,&S=T,
\\ 2t^3,&|S\cap T|=1,
\\ 2t^4,&S\cap T=\varnothing.
\end{cases}
```


For each S there are 2(n−2) subsets T meeting S in one point and binomial(n−2,2) disjoint subsets. Hence every row sum is


```math
\begin{aligned}
2t^2+4(n-2)t^3+2\binom{n-2}{2}t^4
&=-\frac{n(n-3)}{(n-1)^4}<0.
\end{aligned}
```


The all-ones vector is therefore a negative eigenvector of D. In particular, for


```math
q(z)=e_2(z)=\sum_{i\lt j}z_iz_j,
```


one has the exact reverse comparison


```math
\mathbb E|q(Z)|^2-\mathbb E|q(G)|^2
=-\frac{n^2(n-3)}{2(n-1)^3}<0.
```


At n=4 the two moments are 80/9 and 248/27, respectively, and their difference is −8/27. The accompanying exact script verifies the matrix entries, row sums and moments at this base example; the displayed calculation proves the family for every n>=4.

## Why this does not give a conjecture counterexample

The negative test is


```math
q(Z)=e_2(X_1Y_1,\ldots,X_nY_n),
```


a polynomial of bidegree (2,2) in two independent Gaussian families. The simplex covariance implies sum X_i=sum Y_i=0, but it does not imply sum X_iY_i=0. In particular, replacing q(Z) by −(1/2)sum Z_i^2 would be an error.

Nor is q(Z) a product of four linear Gaussian forms. Work on the two hyperplanes sum X_i=sum Y_i=0. If this bihomogeneous polynomial split completely into linear factors, every linear factor would involve only X or only Y; this follows from uniqueness of factorization and the bidegrees. The polynomial would then have the separated form f(X)g(Y). But setting Y=(1,−1,0,...) gives −X_1X_2, whereas setting Y=(1,0,−1,0,...) gives −X_1X_3. These are not proportional as quadratic forms on the X hyperplane for n>=4. Thus no such factorization exists.

Multiplying by auxiliary linear forms cannot remove a nonlinear irreducible factor. A one-parameter leading-term limit of a single product of a fixed number of linear forms also remains a product of linear forms: take the first nonzero term of each factor and multiply them. Neither operation directly turns this witness into an admissible product test.

Coefficient extraction from a larger factored polynomial can produce unfactored coefficients, but the Gaussian norm then includes other occupation sectors. No construction has been proved that isolates the negative sector while preserving the full C9 or Chollet inequality. Omitting those sectors would change the conjecture.

## Replicate averaging and its unresolved step

For independent copies Z^(1),...,Z^(m), define


```math
F_m=\mathbb E\prod_{i=1}^n
\left|m^{-1/2}\sum_{r=1}^mZ_i^{(r)}\right|^2.
```


Writing a_sigma=product_i a_(i,sigma(i)), Wick expansion gives


```math
F_m=\sum_{\sigma,\tau\in S_n}
a_\sigma\overline{a_\tau}\,
m^{c(\sigma^{-1}\tau)-n}.
```


Here c denotes the number of cycles, including fixed points. The endpoints are F_1=(per A)^2 and lim_(m->infinity)F_m=per(|A|^2). This is an exact interpolation. Its monotonicity has not been established.

There is a second useful expansion. Replace the equal replicate weights by probabilities p_1,...,p_m. For each occupation vector alpha with total n, its monomial coefficient is


```math
C_\alpha=
\sum_{\substack{(S_1,\ldots,S_m),(T_1,\ldots,T_m)
\\ \text{ordered partitions of }[n],\ |S_r|=|T_r|=\alpha_r}}
\prod_{r=1}^m|\mathop{\mathrm{per}}A[S_r,T_r]|^2.
```


These coefficients are nonnegative. That fact alone does not show that the polynomial is maximized at a vertex of the probability simplex. A sufficient coefficient bound would be


```math
C_\alpha\leq\binom n{\alpha_1,\ldots,\alpha_m}
(\mathop{\mathrm{per}}A)^2.
```


For alpha=(n−1,1), it becomes


```math
\sum_{i,j}|a_{ij}\mathop{\mathrm{per}}A(i\mid j)|^2
\leq n(\mathop{\mathrm{per}}A)^2.
```


Correction, 20 November 2026: this quadratic cofactor inequality, and every occupation with only two nonzero parts, follows from Pate's 2008 indicator-vector theorem. Apply that theorem to `A direct_sum conjugate(A)` and the paired subsets `S union (n+S)`. The complete deduction is in [the Pate correction](../inequalities/pate_packet_correction.md), with [exact indexing checks](../inequalities/pate_packet_certificates.py).

Consequently, mixing two independent copies has the required product-moment bound. The sufficient family for three or more occupied copies is still unproved. Iteration through a cross-minor is invalid because that minor need not be Hermitian or positive semidefinite, and a mixture of two packets need not remain a single product packet. The all-singleton occupation case is already the self-Chollet inequality. Neither the two-part result nor the exact interpolation above proves the full conjecture.

## Source scope

- T. H. Pate, [*On permanental compounds*](https://www.sciencedirect.com/science/article/pii/S0024379507002273), Linear Algebra and its Applications 429 (2008), 1093–1101, DOI 10.1016/j.laa.2007.05.019. The primary abstract explicitly states the indicator-vector theorem used in the correction. The original full text was not obtained; the stated theorem is reproduced in Section 5 of the 2026 Aouichaoui–Zhang paper cited in the correction note.

- Current C30 statement and status: https://yair-lavi.com/mincs-list/conjecture-30/index.html . It still reports the unrestricted inequality as open.
- Yair Lavi, *A Conjecture on the Permanent of Positive Semidefinite Matrices*, 26 September 2026: https://yair-lavi.com/publications/quadratic-permanent-conjecture/index.html . The stated quadratic irreducible-character inequalities imply Chollet and include related Fourier-block bounds. Its stated small-order proofs cannot be promoted to the full occupation-coefficient comparison above.
- F. Ouimet and D. Greaves, *A proof of the strong Gaussian product inequality conjecture*: https://arxiv.org/html/2609.20234v1 . Section 2 was read in full. Its orthant-branch determinant identity and Jensen argument compare products of marginal absolute moments. They do not state the covariance-preserving replacement inequality used here, nor a comparison for arbitrary polynomial tests.
- G. W. Soules, *Nonconvexity of the permanent*, Linear and Multilinear Algebra 42 (1997), 89–91, DOI 10.1080/03081089708818493. The primary publisher abstract states failure of convexity on correlation matrices for every n>=4: https://www.tandfonline.com/doi/abs/10.1080/03081089708818493 . Therefore ordinary Jensen convexity of the permanent is not a valid shortcut from a Wishart sample covariance to its expectation.
