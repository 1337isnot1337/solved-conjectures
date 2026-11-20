# Coffey's conjecture

Research date: 20 November 2026. This note uses the owner's accepted RH theorem from [the pinned archive](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). No Lean work is involved.

## Exact statement and outcome

Put
\[
F(z)=\log\!\left(\frac{z}{1-z}\,
 \zeta\!\left(\frac1{1-z}\right)\right)
=\sum_{n\ge1}c_nz^n
\]
near \(z=0\), choosing the logarithm with \(F(0)=0\). The apparent singularity at zero is removable, since \((s-1)\zeta(s)\to1\) as \(s\to1\).

Coffey's conjecture in **equation (37)** of *Polygamma theory, the Li/Keiper constants, and validity of the Riemann Hypothesis* is
\[
\boxed{\quad
\forall\epsilon>0,\qquad |c_n|=O_\epsilon(n^{-1/2+\epsilon}).
\quad}
\]

The accepted RH theorem and Lagarias's published estimate give the stronger full assertion
\[
\boxed{\quad |c_n|\ll\frac{\log(n+2)}{\sqrt n}\qquad(n\ge1).\quad} \tag{1}
\]

This is a complete inherited consequence of accepted RH. The conditional analytic estimate is due to Lagarias, not this note. It is not a numerical case or a restricted subsequence.

**Important scope distinction.** Warren D. Smith's separately named **Coffey–Smith conjecture** also demands positive fractions of coefficients of both signs above \(n^{-1/2-\epsilon}\) in magnitude. That additional lower-bound assertion is not proved here. Nor are the different conjectures concerning every Laurent coefficient \(\eta_j\) silently included.

## Proof with exact normalization

Define \(\eta_k\) by the analytic expansion
\[
-\frac{\zeta'}{\zeta}(1+w)-\frac1w
=\sum_{k\ge0}\eta_kw^k.
\]
In particular \(\eta_0=-\gamma\). Let
\[
G(w)=\log(w\zeta(1+w)),\qquad G(0)=0.
\]
Then
\[
G'(w)=-\sum_{k\ge0}\eta_kw^k,
\qquad
G(w)=-\sum_{j\ge1}\frac{\eta_{j-1}}j w^j.
\]
Since \(w=z/(1-z)\), coefficient extraction gives, for every \(n\ge1\),
\[
c_n
=-\sum_{j=1}^n\frac{\eta_{j-1}}j
 [z^n]\frac{z^j}{(1-z)^j}
=-\sum_{j=1}^n\frac{\eta_{j-1}}j
 \binom{n-1}{j-1}.
\]
Using \(\binom{n-1}{j-1}/j=\binom nj/n\), we obtain the exact identity
\[
n c_n=-\sum_{j=1}^n\binom nj\eta_{j-1}. \tag{2}
\]

Lagarias's Definition 4.2 uses precisely the displayed Laurent convention when the automorphic representation is the trivial representation of \(GL(1)\), so his finite-prime contribution is
\[
S_f(n)=\sum_{j=1}^n\binom nj\eta_{j-1}=-nc_n. \tag{3}
\]
There is no factor-of-\(n\) or sign ambiguity. Coffey's \(S_2(n)\) is \(-S_f(n)\).

Lagarias's Theorem 6.1, equations (6.2)–(6.3), states
\[
S_f(n)=\lambda_n(\sqrt n)+O(\sqrt n\log n), \tag{4}
\]
where
\[
\lambda_n(T)=
 \sum_{|\operatorname{Im}\rho|<T}
 \left[1-\left(1-\frac1\rho\right)^n\right],
\]
with zeros counted with multiplicity.

Under accepted RH, every such zero is \(\rho=\tfrac12+i\gamma\), hence
\[
\left|1-\frac1\rho\right|
=\left|\frac{\rho-1}{\rho}\right|=1.
\]
Every summand in \(\lambda_n(T)\) therefore has modulus at most \(2\). The classical zero-count bound \(N(T)\ll T\log(T+2)\) yields
\[
|\lambda_n(\sqrt n)|\ll \sqrt n\log(n+2).
\]
Together with (2)–(4), this proves (1).

Finally \(\log(n+2)\ll_\epsilon n^\epsilon\) for every fixed \(\epsilon>0\), so the full conjecture follows. The finitely many small \(n\) are absorbed in the constant; no finite computation is needed.

The proof uses no simple-zero hypothesis, no linear independence of ordinates, and no pair-correlation assumption.

## Independent way to see the square-root scale

This paragraph is an explanatory check on the inherited bound, not a new attribution claim.

Under RH the full Li coefficient can be written
\[
\lambda_n
=2\int_0^\infty
 \{1-\cos(n\theta(t))\}\,dN(t),
\qquad
\theta(t)=2\arctan(1/(2t)).
\]
Writing
\[
N(t)=\frac{t}{2\pi}\log\frac{t}{2\pi}
-\frac{t}{2\pi}+O(\log(t+2))
\]
and splitting at \(T=\sqrt n\), the low-zero contribution is
\(O(T\log(T+2))\). Above \(T\), Stieltjes integration by parts bounds the zero-count error by
\[
O\!\left(\log T+
 n\int_T^\infty \frac{\log(t+2)}{t^2}\,dt\right)
=O(\sqrt n\log n).
\]
The smooth contribution has main term
\[
\frac n2(\log n+\gamma-1-\log(2\pi)).
\]
Lagarias's separate archimedean estimate has the same main term and an \(O(1)\) remainder. Subtracting again leaves the stated finite-prime error. The direct proof above via Theorem 6.1 is sufficient and fixes the normalization without relying on this sketch.

## Prior-art and current-status audit

Primary sources checked:

1. **M. W. Coffey**, *Polygamma theory, the Li/Keiper constants, and validity of the Riemann Hypothesis*, [arXiv:math-ph/0507042](https://arxiv.org/pdf/math-ph/0507042), submitted 17 July 2005. Page 13, equation (37), is the exact conjecture above. The preceding text proves \(c_n=S_2(n)/n\).
2. **M. W. Coffey**, *Toward verification of the Riemann hypothesis: Application of the Li criterion*, [arXiv:math-ph/0505052](https://arxiv.org/pdf/math-ph/0505052), *Mathematical Physics, Analysis and Geometry* **8** (2005), 211–255, [DOI](https://doi.org/10.1007/s11040-005-7584-9). Conjecture 2, equation (53), gives the equivalent upper-bound target for \(S_2(n)\); its other numbered conjectures are different statements.
3. **J. C. Lagarias**, *Li coefficients for automorphic L-functions*, *Annales de l'Institut Fourier* **57** (2007), 1689–1740, [published record](https://www.numdam.org/articles/10.5802/aif.2311/), [arXiv:math/0404394v4](https://arxiv.org/pdf/math/0404394). Definition 4.2, equation (4.8), and Theorem 6.1 give precisely the inherited estimate used here. The paper credits Coffey's earlier arithmetic decomposition. This is published conditional mathematics.
4. **J. Arias de Reyna**, *Asymptotics of Keiper–Li coefficients*, *Functiones et Approximatio* **45** (2011), 7–21, [author PDF](https://personal.us.es/arias/56-2RHB.pdf), [DOI](https://doi.org/10.7169/facm/1317045228). It proves a stronger square-summability characterization under RH, but square summability alone is not used to infer the pointwise estimate.
5. **W. D. Smith**, *A “good” problem equivalent to the Riemann hypothesis*, revised February 2005, [author PDF](https://rangevoting.org/WarrenSmithPages/homepage/riemann2.pdf), page 5. This is the source of the distinct Coffey–Smith lower-density claim.
6. The October 2026 [QRH application inventory](https://hexagonmath.org/pdf/2610.00178v1) was checked for “Coffey,” “Keiper,” and “Li coefficient”; no matching text was found. Its fixed strip also does not give (1) by the proof above.
7. Current web searches through 20 November 2026 combined “Coffey's conjecture,” “Coffey–Smith conjecture,” the exact coefficient definition, “Lagarias,” “proved,” “resolved,” “quasi-Riemann,” and recent 2026 applications. Retrieved 2026 research ledgers discuss the established RH-conditional Li asymptotic; no separate unconditional proof of the exact upper conjecture preceding the accepted RH input was located.

The present note does not claim priority for the RH implication or that search silence establishes priority. The historical status is: an explicit conjecture in Coffey's paper, an already published conditional estimate, and now an application of the source theorem accepted by the owner. It must not be advertised as a newly invented estimate or conflated with a proof of the stronger Coffey–Smith conjecture.

## Review status

Complete written deduction. Awaiting independent review of the normalization, exact original scope, and historical qualifications.
