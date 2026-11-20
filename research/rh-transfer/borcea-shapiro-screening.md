# Borcea–Shapiro finite infinite-divisibility problem: excluded

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

**Status: already resolved in prior literature. Do not count.**

## Candidate and the prior resolution

Borcea–Shapiro, [*Finite Hermite–Poulain semigroups and finite free additive convolution*](https://staff.math.su.se/shapiro/Articles/Semigroups.pdf), manuscript dated 25 May 2026, defines
\[
\mathcal H_n=\{\text{monic real-rooted polynomials of degree }n\},
\quad
\mathcal A_n=\mathbb R[D]/(D^{n+1}),
\quad D=d/dx.
\]
The map \(\Phi_n(T)=T(D)x^n\) associates to each monic polynomial \(p\) its unique operator \(T_p\in1+D\mathcal A_n\). The paper defines
\[
p^{\star_n t}=\Phi_n\!\left(\exp(t\log T_p)\right).
\]
Problem 6.6 asks which \(p\in\mathcal H_n\) satisfy \(p^{\star_n t}\in\mathcal H_n\) for every \(t\ge0\). Question 6.7 asks for the corresponding infinitesimal directions that preserve hyperbolicity for every sufficiently small positive time.

The full answer is the affine Hermite family, including its repeated-root limit:
\[
p(x)=e^{aD-bD^2}x^n,\qquad a\in\mathbb R,\quad b\ge0.
\tag{1}
\]
Equivalently, for \(n\ge2\), the allowed logarithmic directions are
\[
B=b_1D+b_2D^2,\qquad b_2\le0.
\tag{2}
\]
For \(n=1\), every direction is a translation.

This classification had already been proved by O. Arizmendi and D. Perales, [*Cumulants for finite free convolution*](https://arxiv.org/pdf/1611.06598), arXiv:1611.06598v2, March 2017; published in *Journal of Combinatorial Theory, Series A* **155** (2018), DOI [10.1016/j.jcta.2017.11.012](https://doi.org/10.1016/j.jcta.2017.11.012). Section 6 defines infinite divisibility at a fixed degree, and **Theorem 6.5** classifies the normalized infinitely divisible polynomial as the Hermite polynomial supplied by the finite central limit theorem. Translation and positive rescaling give (1); zero variance gives the repeated-root limit.

The crucial passages are the definition immediately before Proposition 6.3 and Theorem 6.5 on pages 15–16 of the arXiv version. They concern the same finite additive convolution and the same all-positive-time quantifier. They are not statements only about a limiting root distribution.

The later primary source [Campbell, *Free infinite divisibility, fractional convolution powers, and Appell polynomials*](https://ems.press/content/serial-article-files/52762), *Documenta Mathematica* (2026), DOI [10.4171/DM/1071](https://doi.org/10.4171/DM/1071), also credits the earlier finite-degree classification. The arithmetic reviewer independently located that attribution.

## Why the local formulation is not an additional unresolved target

Suppose \(\Phi_n(e^{tB})\) is real-rooted for every \(0<t<\delta\). The finite Hermite–Poulain theorem identifies this with \(e^{tB}\) preserving \(\mathcal H_n\).

For any \(s>0\), choose an integer \(m>s/\delta\). Then
\[
e^{sB}=\bigl(e^{(s/m)B}\bigr)^m
\]
also preserves \(\mathcal H_n\), by composition. Thus the local condition in Question 6.7 is equivalent to the all-time condition in Problem 6.6. It does not evade the prior classification.

## Independently rediscovered short argument

The following argument was found before the earlier theorem was located. It is recorded as a proof reconstruction, not a new result.

Write
\[
B=\sum_{j=1}^n b_jD^j
\]
and suppose \(e^{tB}x^n\) is real-rooted for arbitrarily small positive \(t\). Remove the translation:
\[
Q_t(x)=e^{-tb_1D}e^{tB}x^n
      =e^{t\sum_{j=2}^n b_jD^j}x^n.
\]
For \(n\ge2\), its first two lower coefficients are exactly
\[
[x^{n-1}]Q_t=0,\qquad
[x^{n-2}]Q_t=n(n-1)b_2t.
\]
If its roots are \(\lambda_1(t),\ldots,\lambda_n(t)\), all real, Newton's identities give
\[
\sum_i\lambda_i(t)=0,\qquad
\sum_i\lambda_i(t)^2=-2n(n-1)b_2t.
\tag{3}
\]
Hence \(b_2\le0\), and every root is \(O(\sqrt t)\). The \(k\)-th elementary symmetric function of these roots is therefore \(O(t^{k/2})\).

On the other hand, the finite operator exponential gives
\[
[x^{n-k}]Q_t=(n)_k b_k t+O(t^2),
\qquad 3\le k\le n.
\]
Dividing by \(t\) and letting \(t\downarrow0\) along the assumed sequence yields \(b_k=0\) for every \(k\ge3\), because \(k/2>1\). If \(b_2=0\), equation (3) already forces every centered root to vanish.

Conversely, \(e^{aD-bD^2}x^n\) is a translated, rescaled Hermite polynomial when \(b>0\), and equals \((x+a)^n\) when \(b=0\). These polynomials are real-rooted. This proves (1)–(2), consistently with the earlier theorem.

## Audit lesson and disposition

The initial exact-phrase searches did not retrieve the earlier classification. A text-search request for “divis” on the retrieved 2017 PDF also returned no match, although direct reading of Section 6 exposed the exact theorem. Therefore a failed PDF text search must not be treated as proof of absence.

The primary theorem, its matching definition, the local-to-global reduction, and an independent second-source attribution are enough to exclude this target under the user's rule against already resolved problems. No separate resolution issue was created. No additional conjecture is counted. No Lean verification was performed.
