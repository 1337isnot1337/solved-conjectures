# Keiper's conjecture

Research date: 20 November 2026. This note uses the accepted RH theorem at [archive commit 9d5316e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). No Lean work is involved.

## Exact statement and outcome

Define the normalized Keiper coefficients by
\[
\log\!\left(2\xi\!\left(\frac1{1-z}\right)\right)
 =\sum_{n\ge1}\kappa_nz^n,
\qquad
\xi(s)=\frac12s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s).
\]
The logarithm is the analytic germ with value zero at \(z=0\). Li's customary coefficients have the different normalization
\(\lambda_n^{\rm Li}=n\kappa_n\).

Keiper's full asymptotic conjecture is
\[
\boxed{\quad
\kappa_n=\frac12\bigl(\log n+\gamma-\log(2\pi)-1\bigr)+o(1).
\quad} \tag{1}
\]
This includes the constant term, not only the leading ratio
\(\kappa_n/\log n\to1/2\).

Arias de Reyna's 2011 Theorem 1 and Corollary 2 prove, under RH, the stronger assertion
\[
\kappa_n=\frac12\bigl(\log n+\gamma-\log(2\pi)-1\bigr)+y_n,
\qquad
\sum_{n\ge1}|y_n|^2<\infty. \tag{2}
\]
Accepted RH supplies the hypothesis, and square summability gives \(y_n\to0\). Thus (1) follows for the full sequence.

This is an inherited application. The conditional theorem, including the square-summable remainder, belongs to Arias de Reyna. Earlier asymptotic work is due to Voros and Lagarias. No new conditional implication or independent breakthrough is claimed here.

## Original formulation and scope

Keiper's 1992 paper, page 769, displayed the approximation in (1) with the symbol \(\approx\). He discussed RH together with an additional regularity assumption on the vertical zero distribution. Arias de Reyna quotes and analyzes that passage in section 2, explicitly calls it Keiper's conjecture, and proves that RH alone suffices. Equation (1) is the precise asymptotic formulation used in that later primary source.

The extra zero-distribution assumption is not imported. Zeros need not be simple, equally spaced, linearly independent, or pair-correlated. Only the zeta case of the accepted source is needed; Dirichlet GRH is unnecessary.

The asymptotic statement is already known to be equivalent to RH. Its place in this research lane is as an established named conjecture whose full statement follows from the accepted input, not as a conjecture independent of RH.

## Complete inherited deduction

For clarity, the main mechanism of Arias de Reyna's proof is recorded with the normalization above.

Under RH, write the nontrivial zeros as \(1/2\pm it_j\), with \(t_j>0\), counting multiplicities. Pairing conjugate zeros in the standard zero formula gives
\[
\kappa_n=\frac4n\sum_j\sin^2(n\theta_j),
\qquad
\theta_j=\arctan\frac1{2t_j}. \tag{3}
\]
For each fixed \(n\), the paired series converges absolutely: its large-\(t_j\) terms are \(O_n(t_j^{-2})\), and the zero-counting function is \(O(T\log(T+2))\).

Set
\[
N(T)=M(T)+R(T),\qquad
M(T)=\frac{T}{2\pi}\log\frac{T}{2\pi}-\frac{T}{2\pi}.
\]
The Riemann–von Mangoldt formula gives \(R(T)=O(\log T)\) as \(T\to\infty\). Before the first positive ordinate, \(R(T)=-M(T)\), so \(R(0)=0\) continuously.

Writing (3) as a Stieltjes integral and separating \(dM\) from \(dR\) gives
\[
\kappa_n=J_n+E_n,
\]
where
\[
J_n=\frac2{\pi n}\int_0^\infty
 \sin^2\!\left(n\arctan\frac1{2t}\right)
 \log\frac{t}{2\pi}\,dt.
\]
Integration by parts in the \(R\)-term, followed by
\(y=\arctan(1/(2t))\), yields
\[
E_n=4\int_0^{\pi/2}H(y)\sin(2ny)\,dy,
\qquad
H(y)=R\!\left(\frac1{2\tan y}\right). \tag{4}
\]
The boundary terms vanish by the estimates just given. Moreover
\[
\int_0^{\pi/2}|H(y)|^2\,dy
 =\int_0^\infty\frac{2|R(t)|^2}{1+4t^2}\,dt<\infty.
\]
Bessel's inequality for the orthogonal sine functions in (4) implies
\((E_n)\in\ell^2\).

For the smooth term, the same substitution gives
\[
J_n=-\frac1{\pi n}\int_0^{\pi/2}
 \frac{\sin^2(ny)}{\sin^2y}\log(4\pi\tan y)\,dy.
\]
The function
\[
B(y)=\frac{\log(4\pi\tan y)}{\sin^2y}
       -\frac{\log(4\pi y)}{y^2}
\]
is integrable on \((0,\pi/2)\): it has only logarithmic endpoint bounds. Therefore
\[
J_n=-\frac1{\pi n}\int_0^{\pi/2}
 \frac{\sin^2(ny)}{y^2}\log(4\pi y)\,dy+O(n^{-1}).
\]
Substitute \(x=ny\), extend the integral to infinity, and use
\[
\int_0^\infty\frac{\sin^2x}{x^2}\,dx=\frac\pi2,
\qquad
\int_0^\infty\frac{\sin^2x}{x^2}\log x\,dx
 =\frac\pi2(1-\gamma-\log2).
\]
The tails contribute \(O(\log(n+2)/n)\), so
\[
J_n=\frac12(\log n+\gamma-\log(2\pi)-1)
       +O\!\left(\frac{\log(n+2)}n\right).
\]
This last error is square summable. Combining it with (4) proves (2), hence the full conjecture (1).

All identities here are the classical argument underlying the cited theorem. No finite zero table or coefficient computation enters the deduction.

## Relation to the other coefficient targets

Let \(c_n\) be the coefficients in [Coffey's conjecture](coffey.md), and put \(s=1/(1-z)\). The exact decomposition is
\[
\log(2\xi(s))
 =\log\!\bigl(s\pi^{-s/2}\Gamma(s/2)\bigr)
  +\log\!\bigl((s-1)\zeta(s)\bigr).
\]
Consequently \(\kappa_n=a_n+c_n\), where \(a_n\) is the coefficient of the explicit gamma-factor term.

The established gamma-factor asymptotic and the Coffey upper bound also imply (1). Thus Keiper and Coffey are historically distinct named statements about closely related coefficients, not independent analytic achievements. The square-summable refinement (2) is additional established information; it is not counted as another conjecture. The separately named Coffey–Smith conjecture includes density lower bounds and must be assessed separately.

## Prior-resolution audit

The following checks were made through 20 November 2026.

- Keiper's original bibliographic record was checked in the [Wolfram author archive](https://library.wolfram.com/infocenter/Articles/788/). Direct retrieval of the AMS PDF returned HTTP 403. The original asymptotic passage was checked through Arias de Reyna's explicit quotation and discussion; the unavailable download is not represented as a successful direct reading.
- Arias de Reyna's full author manuscript and publisher record identify the named conjecture, the factor-of-\(n\) convention, and the exact RH-conditional theorem.
- The recent [Spigler paper](https://doi.org/10.1080/10652469.2025.2517721), published online in 2025 and assigned to the 2026 volume, gives another proof of the equivalence of the Keiper–Li criterion with RH. It does not remove the RH assumption in the asymptotic.
- Current work on Voros's finite-difference sequence uses different coefficients \(\Lambda_n\). Its positivity and transseries questions are not the present target.
- Both search systems were used with the exact name, the asymptotic formula, “proved,” “solved,” “conjecture,” “2026,” and “quasi-Riemann.” The retrieved primary records gave established conditional implications, numerical investigations, or distinct sequence problems.
- The [October QRH inventory](https://hexagonmath.org/pdf/2610.00178v1) had no full-text “Keiper” match. Scoped GitHub searches of openai/math and qqliu/CoPEER and scoped searches of Hexagon and zeta.teal-sea.com found no prior exact application in the returned material.

No later full unconditional resolution preceding the accepted input was located. These bounded searches do not establish exclusive priority. The old RH implication is credited explicitly, and this note does not modify unrelated repository result counts.

## Sources

1. J. B. Keiper, *Power series expansions of Riemann's zeta function*, Mathematics of Computation **58** (1992), 765–773. [DOI](https://doi.org/10.1090/S0025-5718-1992-1122072-5), [author archive](https://library.wolfram.com/infocenter/Articles/788/).
2. J. Arias de Reyna, *Asymptotics of Keiper–Li coefficients*, Functiones et Approximatio Commentarii Mathematici **45** (2011), 7–21. [Author PDF](https://personal.us.es/arias/56-2RHB.pdf), [DOI](https://doi.org/10.7169/facm/1317045228). Sections 2–3, Theorem 1 and Corollary 2.
3. J. C. Lagarias, *Li coefficients for automorphic L-functions*, Annales de l'Institut Fourier **57** (2007), 1689–1740. [Published record](https://www.numdam.org/articles/10.5802/aif.2311/). Its arithmetic/archimedean decomposition explains the connection with Coffey's upper-bound target.
4. R. Spigler, *Another proof of the validity of Keiper–Li's criterion to prove the Riemann hypothesis*, Integral Transforms and Special Functions **37** (2026), 402–412. [DOI](https://doi.org/10.1080/10652469.2025.2517721).

## Review status

Complete inherited deduction with explicit normalization and full asymptotic constant. Independent review requested. No external peer review or formal verification is claimed.
