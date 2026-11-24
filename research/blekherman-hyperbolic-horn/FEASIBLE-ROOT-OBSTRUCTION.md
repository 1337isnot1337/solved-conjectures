# Hyperbolic Horn obstruction for separately feasible root lists

**Result: the reverse assertion fails even when both prescribed vectors are individually attainable.** For the same PSD-stable polynomial, each proposed root multiset is realized by a real diagonal matrix, but no real symmetric matrix realizes them simultaneously. This stronger obstruction holds in every degree at least three. The literal version of the preprint conjecture also has an earlier one-vector obstruction, as explained below; the present note does not claim a new solution to that literal reading.

## Source and scope

Grigoriy Blekherman, Mario Kummer, Raman Sanyal, Kevin Shu, and Shengding Sun, [*Linear Principal Minor Polynomials: Hyperbolic Determinantal Inequalities and Spectral Containment*, arXiv:2112.13321v1](https://arxiv.org/html/2112.13321v1#S9.SS1), December 2021, Conjecture 9.5, proposes the converse of a hyperbolic Schur majorization statement. For any degree-\(k\) linear principal minor polynomial \(P\) and vectors \(\lambda,\mu\in\mathbb R^k\) such that \(\lambda\) majorizes \(\mu\), the conjecture asks for a real symmetric \(X\) such that the roots of \(P(X-tI)\) are \(\lambda\) and those of \(P(\operatorname{diag}X-tI)\) are \(\mu\).

The hyperbolic Horn conjecture is absent from §9.1 of the [2023 journal version, DOI 10.1093/imrn/rnac291](https://academic.oup.com/imrn/article/2023/24/21346/6819958?guestAccessKey=f4e7236b-8600-47d6-95a0-e5be591e71bf). The latter gives the forward majorization as Theorem 9.2 and moves directly to §9.2. The reverse result addressed here should therefore be cited as a **preprint conjecture only**. It is also different from the still-separate conjecture on maximizing a weighted sum of principal minors over the ordinary orthogonal orbit.

The literal conjecture has no individual-attainability proviso. It is therefore already refuted by [Rajesh Pereira, *Which quartic polynomials have a hyperbolic antiderivative?*, arXiv:1901.08156](https://arxiv.org/abs/1901.08156): choose as the first vector the roots of a real-rooted quartic with no real-rooted antiderivative, and as the second vector its constant mean. The first vector majorizes the second, yet cannot arise for the PSD-stable example \(E_4\) on five-by-five matrices. This uses the derivative identity below. The construction here instead addresses the stronger, simultaneous-realization problem with both lists already feasible, and starts one degree earlier.

## Exact counterexample in every degree \(k\ge3\)

Let \(n=k+1\ge4\), and set \(P=E_{n-1}\), the sum of principal minors of order \(n-1\) on real symmetric \(n\times n\) matrices. Write
\[
 \chi_X(t)=\det(tI-X).
\]
Differentiating the determinant in \(t\) by its columns gives
\[
 \chi'_X(t)=E_{n-1}(tI-X)=(-1)^{n-1}E_{n-1}(X-tI).
\]
Thus the hyperbolic roots for \(X\) are the roots of \(\chi'_X\). This is a standard PSD-stable example, not a degenerate polynomial or a loss of univariate degree. For completeness, if \(Z=X+iY\) with \(X,Y\) real symmetric and \(Y\) positive definite, every eigenvalue of \(Z\) lies strictly in the upper half-plane by the complex Rayleigh quotient. By Gauss–Lucas, the zeros of \((d/dt)\det(tI-Z)\) are also strictly in the upper half-plane. Evaluating at \(t=0\) proves \(E_{n-1}(Z)\ne0\).

Choose a rational number \(c\) with
\[
 \frac{1}{n-1}<c<\frac{1}{n-2}.
\]
Use the two monic real-rooted polynomials
\[
 f(t)=(t-1)^{n-1}(t+n-1),
 \qquad g(t)=(t+c)^{n-1}(t-(n-1)c).
\]
Their derivatives are
\[
 f'(t)=n(t-1)^{n-2}(t+n-2),
 \qquad
 g'(t)=n(t+c)^{n-2}(t-(n-2)c).
\]
Let \(\lambda\) and \(\mu\) be the respective derivative-root vectors in descending order:
\[
 \lambda=(\underbrace{1,\ldots,1}_{n-2},-(n-2)),
 \qquad
 \mu=((n-2)c,\underbrace{-c,\ldots,-c}_{n-2}).
\]
Both have total sum zero. For \(1\le j\le n-2\), the sum of the largest \(j\) coordinates of \(\lambda\) equals \(j\); for \(\mu\) it equals \((n-1-j)c\le(n-2)c<1\). Thus \(\lambda\) strictly majorizes \(\mu\) at every proper partial sum. They are individually realized by diagonal matrices with characteristic polynomials \(f\) and \(g\).

**Uniqueness of the lifts.** If \(h\) is a real-rooted polynomial, then a repeated root \(r\) of \(h'\) must be a root of \(h\). Indeed, off the roots \(r_i\) of \(h\), counted with multiplicity,
\[
 (h'/h)'(x)=-\sum_i (x-r_i)^{-2}<0.
\]
A zero of \(h'\) there is necessarily simple. When \(r\) is a root of \(h\), its multiplicity in \(h\) is one greater than its multiplicity in \(h'\), by factoring \(h\) at \(r\).

Suppose \(X\) realizes both proposed root vectors. The leading coefficient and the specified roots imply \(\chi'_X=f'\), hence \(\chi_X=f+C\) for a real constant \(C\). The derivative root \(1\) has multiplicity \(n-2\ge2\), so real-rootedness forces \(\chi_X(1)=0\), or \(C=0\). Hence the largest eigenvalue of \(X\) is \(1\). Likewise \(\chi_{\operatorname{diag}X}=g+D\), and its derivative root \(-c\) forces \(D=0\). In particular \(\operatorname{diag}X\) has an entry \((n-1)c>1\). This contradicts \(X_{ii}\le\lambda_{\max}(X)=1\) from the Rayleigh quotient. No such matrix exists.

For example, \(n=4,c=2/5\) gives \(\lambda=(1,1,-2)\) and \(\mu=(4/5,-2/5,-2/5)\). The individually required ordinary spectra are \((1,1,1,-3)\) and \((6/5,-2/5,-2/5,-2/5)\). The same contradiction also holds with all hyperbolic and ordinary eigenvalues positive: shift both lists and each separate realizing matrix by a large common multiple of the identity.

## The obstruction persists for simple spectra

The conclusion is not confined to repeated roots. Here is an elementary compactness argument. For a monic real-rooted polynomial \(h\) of degree \(n\), let \(x\) be its root vector and \(y\) the root vector of \(h'/n\). Matching coefficients gives
\[
 e_1(y)=\frac{n-1}{n}e_1(x),\qquad e_2(y)=\frac{n-2}{n}e_2(x).
\]
A bounded set of derivative-root vectors therefore bounds \(e_1(x)^2-2e_2(x)=\sum_i x_i^2\). Any sequence of real-rooted lifts of derivative-root vectors tending to either of the displayed examples consequently has a convergent root-vector subsequence, whose limit is necessarily the unique lift proved above. In particular every lift of a derivative-root vector sufficiently near \(\lambda\) has largest root near \(1\), and every lift near \(\mu\) has largest root near \((n-1)c\). The two intervals can be chosen disjoint in the same order. The Rayleigh contradiction persists for any such pair with equal trace.

Perturb the two ordinary root vectors separately to nearby simple real vectors with the same original trace zero. Their derivative roots are also simple by Rolle and degree counting, and converge to \(\lambda,\mu\). The strict proper-majorization inequalities persist by continuity, with total sums still equal by the first coefficient identity. These are counterexamples with both prescribed vectors attainable by separate simple-spectrum matrices.

## Low degrees

For **homogeneous** linear principal minor polynomials, the corresponding converse does hold in degrees one and two as long as \(P(I)\ne0\), which covers the homogeneous hyperbolic case. For degree one, the only majorization relation is equality and a scalar matrix suffices. For degree two, multiply by a nonzero scalar if needed to assume
\[
 P(X)=\sum_{i<j}a_{ij}(X_{ii}X_{jj}-X_{ij}^{2}),\qquad A=P(I)=\sum_{i<j}a_{ij}>0.
\]
Write \(B_i=\sum_{j\ne i}a_{\min(i,j),\max(i,j)}\). Some \(B_i\ne0\), since \(\sum_i B_i=2A\). Take \(D\) to have all diagonal entries \(\mu_1\), then add \(A(\mu_2-\mu_1)/B_i\) to the \(i\)-th diagonal entry. By multiaffinity,
\[
 P(D-tI)=A(\mu_1-t)(\mu_2-t).
\]
At least one \(a_{jk}>0\). Starting with \(D\), insert an off-diagonal entry \(s\) at \((j,k)\) and \((k,j)\). This subtracts \(a_{jk}s^2\) from the constant term of \(P(D-tI)\) and leaves all other terms unchanged. Since \(\lambda\) majorizes \(\mu\), their sums agree and \(\lambda_1\lambda_2\le\mu_1\mu_2\). Choose \(a_{jk}s^2=A(\mu_1\mu_2-\lambda_1\lambda_2)\). The resulting \(P(X-tI)\) then has the required roots \(\lambda\).

## Priority checks

Exact-phrase searches for the source's hyperbolic generalization of Horn, the five authors with “antiderivative” or “counterexample,” arXiv:2112.13321 with Conjecture 9.5, and the journal version found no prior statement of the above simultaneous-realization counterexample. The conjecture's omission from the journal version means we make no claim it was still endorsed by the authors after 2021. The earlier quartic nonattainability theorem does not cover the individually realizable pairs above or the cubic derivative-root counterexamples. The obstruction uses determinant differentiation, elementary rigidity of repeated derivative roots, and the classical Rayleigh quotient.

**Priority boundary.** Pereira’s older single-vector nonattainability already refutes the full unrestricted preprint quantifier: pair an unattainable root vector with its constant mean vector. The distinct contribution here requires both vectors to be individually attainable, gives an obstruction in every degree at least three, and is not counted as a first resolution of the unrestricted preprint conjecture.
