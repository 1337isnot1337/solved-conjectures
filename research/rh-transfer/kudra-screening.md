# Kudra's conjecture

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

**Status: blocked; no proof or counterexample. Not counted as a resolution.**

This note records the exact target and the obstruction encountered in the operator-theoretic investigation. No Lean verification was performed. No numerical degree case is proposed as a separate target.

## 1. Original statement

The primary source is Michał Kudra, [*The idealizer of the semigroup of stable polynomials*](https://arxiv.org/html/2605.07628v2), arXiv:2605.07628v2, 15 June 2026. The complete author-version HTML was inspected. The source's earlier title used “the set of quasi-stable polynomials.”

Let \(\mathbb R_n^+\) be the real polynomials of degree \(n\) with strictly positive coefficients. Let \(\mathcal H_n\) be the members of this set with all zeros in the open left half-plane. Let \(\mathcal H_n^\star\) consist of real polynomials
\[
f(x)=\sum_{j=0}^n a_jx^j,\qquad
a_0,a_n>0,\quad a_j\ge0\quad(1\le j<n),
\]
whose zeros lie in the closed left half-plane.

For the ordinary coefficientwise product
\[
\left(\sum a_jx^j\right)*\left(\sum b_jx^j\right)
=\sum a_jb_jx^j,
\]
the idealizer under investigation is
\[
X_n=
\{g\in\mathbb R_n^+:
 g*f\in\mathcal H_m
 \text{ for every }m\le n
 \text{ and every }f\in\mathcal H_m\}.
\tag{1}
\]

Define
\[
Q^{2\ell}(x)=(1+x^2)^\ell,\qquad
Q^{2\ell+1}(x)=(1+x)(1+x^2)^\ell,\qquad
Q_m^k(x)=x^mQ^k(x).
\]
The proposed finite test family is
\[
Y_n=
\left\{g\in\mathbb R_n^+:
 \frac{g*Q_m^k}{x^m}\in\mathcal H_k^\star
 \text{ for every } k\ge2,\ m\ge0,\ k+m\le n
\right\}.
\tag{2}
\]
The shift \(m=0\) is included, as in the explicit tests and examples in the original paper.

**Conjecture 1:** \(X_n=Y_n\) for every positive integer \(n\).

The source proves \(X_n\subseteq Y_n\) for every \(n\) in Theorem 6 and proves equality through degree five in Theorems 8–9 and the preceding elementary cases. Its Conjecture 2 gives the corresponding equality for quasi-stable idealizers. Neither full conjecture was resolved in this investigation.

The source also proves the following all-degree special case in Theorem 10:
\[
G(x)=(1+x)g(x^2),\quad g\in\mathbb R_k^+,
\quad
G*Q^{2k+1}\in\mathcal H_{2k+1}^\star
\]
implies
\[
G*F\in\mathcal H_{2k+1}^\star
\quad\text{for every }F\in\mathcal H_{2k+1}^\star.
\]
That theorem is already in the source. It is not new progress by this project.

## 2. The missing implication in interlacing form

Write
\[
f(x)=E(x^2)+xO(x^2),\qquad
g(x)=\sum_{j=0}^n b_jx^j.
\]
Define the two diagonal operators
\[
A_g\!\left[\sum e_jy^j\right]=\sum b_{2j}e_jy^j,\qquad
B_g\!\left[\sum o_jy^j\right]=\sum b_{2j+1}o_jy^j.
\]
Then
\[
(g*f)(x)=(A_gE)(x^2)+x(B_gO)(x^2).
\tag{3}
\]

The Hermite–Biehler formulation in the source reduces quasi-stability to the reality, signs, and directed interlacing of the zeros of the even and odd parts. Thus the missing sufficiency argument must show that all tests in (2) force the required interlacing of \(A_gE\) and \(B_gO\) for **every** allowed interlacing pair \((E,O)\), including unequal degrees and boundary degeneracies. For strict stability, one must also rule out common zeros when the input pair has none.

The tests in (2) examine special pairs built from powers of \(1+y\) and their shifts. The classical scalar finite-multiplier criterion can establish real-root preservation for individual parity subsequences. It does not, without an additional argument, establish the required relation between the images under two different diagonal operators \(A_g\) and \(B_g\).

The source's special case has matching even and odd diagonal operators. Its proof uses that extra relation. The general coefficients in (2) need not have it. No all-degree interlacing-preserver theorem covering these hypotheses was proved or located here.

This is the concrete proof gap. Assuming that the finite tests already imply the universal interlacing assertion would assume the substance of the conjecture.

## 3. Why the complex stability classification is too strong

One possible shortcut is to apply a classification of linear operators preserving the left-half-plane zero condition for **all complex-coefficient polynomials**. That is a stronger preservation requirement than (1), even in degree two.

For example, put
\[
g(x)=1+x+100x^2.
\]
Every real quadratic with positive coefficients is Hurwitz-stable. Multiplying its coefficients by \(1,1,100\) leaves them positive, so \(g\in X_2\); the degree-one and constant tests are also immediate.

Now set \(c=1+i\), and take the complex polynomial
\[
p(z)=(z+c)^2.
\]
Its two zeros are \(-1-i\), in the open left half-plane. The same diagonal operator gives
\[
T_gp(z)=100z^2+2cz+c^2.
\]
Its zeros are
\[
z_\pm=\frac{c(-1\pm i\sqrt{99})}{100}.
\]
For the minus sign,
\[
\Re z_-=\frac{\sqrt{99}-1}{100}>0.
\]
Therefore \(T_g\) does not preserve left-half-plane zeros for arbitrary complex-coefficient inputs, although it belongs to the exact real idealizer \(X_2\).

This example does not disprove Kudra's conjecture. It disproves the proposed identification of its real-input class with the stronger complex-input class. Any use of a complex stability symbol needs a separate reduction that is absent here.

## 4. Search and computation record

The original v2 statement, definitions, necessity theorem, low-degree results, and special-case theorem were checked directly. Searches in both available engines covered the exact author, title, idealizer terminology, and conjecture identifiers. The [KAUS 2026 program](https://nordan-conference.github.io/kaus/program/) describes the conjectural idealizer and the degree-at-most-five result. No later complete resolution was retrieved. This is a bounded status check, not proof of the absence of other work.

An exploratory finite floating-point screen of the test conditions and randomly chosen stable inputs produced no certified counterexample. Such a screen does not prove (1)–(2), does not establish membership at boundary points, and is not used as mathematical evidence for the conjecture. Numerical searching has been stopped.

No implication from the accepted RH or rational Dirichlet GRH source closes the interlacing-preserver gap. The route remains an adjacent zero-location/operator investigation.

The full target can be resumed if an exact finite test theorem for the two parity operators is found, or if an explicit \(g\in Y_n\) and exact stable input with unstable output are produced. Neither has been obtained.
