# Riffaut's conjecture

Research date: 20 November 2026.

## Statement and status

Every singular modulus \(x=j(\tau)\) with \([\mathbb Q(x):\mathbb Q]\ge3\) satisfies
\[
x^m+A x^n+B\ne0
\]
for every pair of integers \(m>n>0\) and every \(A,B\in\mathbb Q\) with \(B\ne0\).

This full statement follows from the accepted Dirichlet-GRH theorem in the [Alpöge archive](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e), by Bilu–Luca–Pizarro-Madariaga's published Theorem 1.2. The conditional theorem and the proof ingredients below belong to those authors. This note records an application and an exact hypothesis check; it does not claim a new proof of their implication or establish priority for applying the accepted archive.

The target covers all degrees at least three, all imaginary-quadratic orders, and all trinomial exponents. It is not a computed discriminant range or a degree increment.

## Complete reduction

Put \(D=|\Delta_x|\). If the displayed equality holds, every conjugate of \(x\) is a root of the same rational polynomial. Thus \(\Delta_x\) is a trinomial discriminant in the terminology of Bilu–Luca–Pizarro-Madariaga.

Their unconditional Theorems 6.1 and 7.1 imply
\[
D>10^{11},\qquad \Delta_x\text{ is fundamental},\qquad \omega(D)\le2.
\]
Their Corollary 5.2 says
\[
\chi_{\Delta_x}(p)=1\quad\Longrightarrow\quad
p>\frac{4\sqrt D}{\log D}
\tag{1}
\]
for every prime \(p\), where \(\chi_{\Delta_x}\) is the Kronecker character.

Because the discriminant is negative and fundamental, \(\chi_{\Delta_x}\) is a primitive odd real Dirichlet character of conductor \(D\). All hypotheses of their Proposition 9.2 therefore hold. The accepted Dirichlet GRH supplies its only remaining assumption. That proposition gives a prime \(p\) with
\[
\chi_{\Delta_x}(p)=1,\qquad
p\le\frac{4\sqrt D}{\log D}.
\tag{2}
\]
Equations (1) and (2) contradict each other. No exceptional discriminant or finite unchecked interval survives. \(\square\)

This is also their Theorem 9.1; Section 9 explicitly defines its GRH as GRH for **Dirichlet** \(L\)-functions. No Hecke-class-character GRH, Artin holomorphy, simplicity of zeros, or independence of zeros is needed.

## Exact interface checks

The strict versus non-strict inequalities in (1)–(2) matter. Their thresholds match: Proposition 9.2 applies for \(D\ge10^{10}\), while the unconditional structural theorem already gives \(D>10^{11}\).

The small-discriminant exclusion in the published theorem uses computer-assisted arguments whose scripts are public. They are imported as part of that existing published theorem, not rerun here or presented as this campaign's new numerical accomplishment.

A merely qualitative least-split-prime estimate would not substitute for Proposition 9.2 without handling the resulting finite range. Using the exact published proposition avoids that gap.

The hypothesis \(B\ne0\) is the conventional definition of the trinomials in the cited paper. Allowing \(A=0\) causes no difficulty: the theorem includes this degenerate binomial case.

## Original formulation and neighboring results

Riffaut's 2019 paper raises the same-singular-modulus trinomial problem after Conjecture 1.4. Its broader equation \(A x^m+B y^n=C\) also has distinct-modulus and elementary coincident-modulus cases. This note does not silently identify all formulations of that broader equation with the present assertion. The exact named target is the degree-at-least-three trinomial statement in the title, abstract and Theorem 1.2 of the later published paper.

Luca–Riffaut's 2019 theorem concerns **distinct** singular moduli. It removes the two exceptional cubic pairs in Riffaut's earlier distinct-modulus result; it does not settle the same-modulus trinomial target.

Fowler's later results concern sums of powers of **pairwise distinct** singular moduli, with specified coefficient/degree/discriminant bounds. Their hypotheses do not directly include \(x^m+A x^n+B=0\) for one singular modulus and two different exponents.

## Prior-art audit

The following were checked on 20 November 2026.

| Primary source or search | Finding |
|---|---|
| [Riffaut, *Equations with powers of singular moduli*, arXiv:1710.03547v3](https://arxiv.org/pdf/1710.03547), introduction | Identifies the coincident-modulus trinomial question separately from the distinct-modulus theorem. Published in IJNT 15 (2019), 445–468. |
| [Bilu–Luca–Pizarro-Madariaga, arXiv:2003.06547v2](https://arxiv.org/pdf/2003.06547) | Full conditional theorem, exact character scope and matching inequalities checked. |
| [Published article, Ann. Sc. Norm. Super. Pisa 23 (2022), 2003–2048](https://doi.org/10.2422/2036-2145.202010_025) | Publisher confirms the conditional result and publication date. |
| [Bilu's 2020 conference slides](https://zykin.mccme.ru/bilu_slides.pdf) | Independently states the degree-at-least-three conjecture and its Dirichlet-GRH resolution. |
| [Luca–Riffaut, *Linear independence of powers of singular moduli of degree three*](https://www.cambridge.org/core/journals/bulletin-of-the-australian-mathematical-society/article/linear-independence-of-powers-of-singular-moduli-of-degree-three/A342A7350D6F9C18A4C53899F2187BCB) | The theorem is for distinct singular moduli; not a prior unconditional resolution of the present target. |
| [Fowler, *Some uniform effective results on André–Oort for sums of powers in C^n*](https://www.cambridge.org/core/journals/mathematical-proceedings-of-the-cambridge-philosophical-society/article/some-uniform-effective-results-on-andreoort-for-sums-of-powers-in-mathbbcn/A72ABDB14BEB62DE7E9B47953B77DBDC) | Exact distinctness and exponent hypotheses checked. |
| [October QRH application survey, 164 pages](https://hexagonmath.org/pdf/2610.00178v1) | Full-text search found no “Riffaut” entry. |
| GitHub code searches in openai/math and qqliu/CoPEER; scoped web searches for Hexagon and zeta.teal-sea.com | No prior Riffaut application found in the returned material. |
| Both web search systems, exact-name queries with “proved”, “solved”, “disproved”, “unconditional”, “quasi-Riemann”, and 2023–2026 date filters | Returned the published conditional theorem and neighboring results, not a later full unconditional resolution. |

Search absence is not proof of historical priority. The mathematical implication is complete; its novelty is not asserted. This entry is kept in the RH-transfer research lane and does not modify the repository's unrelated solved-result count.

## Independent review

Root independently checked the complete reduction against arXiv:2003.06547v2 on 20 November 2026. The review confirmed the degree and coefficient scope, the primitive odd Dirichlet character, the matching strict/non-strict split-prime thresholds, and the absence of an exceptional finite range. [Review receipt](https://github.com/1337isnot1337/solved-conjectures/issues/119#issuecomment-7049574504). This is an internal mathematical review, not external peer review or Lean verification.
