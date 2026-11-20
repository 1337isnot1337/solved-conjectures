# Source, scope, and prior-resolution audit

Date: 2026-11-20. Status: the mathematical candidate has passed separate internal reviews, but the named conjecture is not counted as resolved. Two source questions remain open: the intended boundary-zero convention and the scope of Diamond–Essén's 1978 theorem.

## Exact target and its boundary issue

Rajesh Pereira and Sarah Plosker, *Extending a characterization of majorization to infinite dimensions*, **Linear Algebra and its Applications 468** (2015), 80–86, DOI [10.1016/j.laa.2014.01.026](https://doi.org/10.1016/j.laa.2014.01.026). The [full author preprint](https://arxiv.org/pdf/1405.2845) was read directly. Conjecture 1 is on printed page 7; Definition 2 specifies the generalized Dirichlet series on printed page 2.

The hypotheses are absolute convergence on the closed half-plane with real part at least one and a simple zero at one. The conclusion asks for a nonzero positive-coefficient generalized Dirichlet multiplier, absolutely convergent on the same closed half-plane, making the quotient by $s(s-1)$ completely monotone on $(1,\infty)$.

The preprint does not define zero multiplicity at the boundary. A holomorphic extension through a neighborhood of one and a finite nonzero right derivative there are different hypotheses. The candidate proves the holomorphic version and gives a structural counterexample to the right-derivative version. Neither version is silently substituted for the source. The published [ScienceDirect record](https://www.sciencedirect.com/science/article/pii/S0024379514000445) confirms the bibliography, but direct full-text retrieval was blocked. The [author's publication page](https://people.brandonu.ca/ploskers/research/) lists the article and links the publisher; it did not supply an independently retrievable published PDF.

The candidate's exact theorem avoids this ambiguity: under positive Laplace transform and a finite positive boundary derivative, a finite positive multiplier exists if and only if the inverse Laplace density is integrable. When it exists, a multiplier on one arithmetic progression suffices. This is an infinite-dimensional statement, with no numerical case used as a substitute for proof.

## Earlier authors' work

- Pereira–Plosker, *Dirichlet polynomials, majorization, and trumping*, **Journal of Physics A 46** (2013), 225302; [full preprint](https://arxiv.org/pdf/1310.5088). Lemma 4.9 is the classical positive-polynomial multiplier lemma. Theorem 4.10 treats finite Dirichlet polynomials with several prescribed simple zeros and positivity on the whole real line. It does not establish the closed-half-plane summability required by the later conjecture.
- Moein–Pereira–Plosker, *A simplified and unified generalization of some majorization results*, **JMAA 478** (2019), 1049–1058; DOI [10.1016/j.jmaa.2019.05.065](https://doi.org/10.1016/j.jmaa.2019.05.065); [full preprint](https://arxiv.org/pdf/1806.09062). Theorems 3.3, 3.6, 3.8, and 3.11 concern stochastic operators and relations between matrix and multivariate majorization. Direct inspection found no Dirichlet-series multiplier theorem; searches within the full text found no occurrence of “trumping” or “Dirichlet.” This author follow-up does not resolve the target.

## Related catalytic-order results

| Source inspected | Scope of the inspected theorem | Relation to the present target |
| --- | --- | --- |
| Aubrun–Nechita, *Stochastic domination for iterated convolutions and catalytic majorization*, **Annales IHP Probability and Statistics 45** (2009), 611–625, [full PDF](https://www.numdam.org/item/AIHPB_2009__45_3_611_0.pdf), Section 6, Theorem 6.1 | Approximation of infinite vectors by finitely supported vectors under norm and entropy assumptions | The approximation conclusion does not give the exact Dirichlet multiplier here. |
| Fritz, *Characterizing the asymptotic and catalytic stochastic orders on topological abelian groups*, **Bernoulli 30** (2024), 2932–2954, [full preprint](https://arxiv.org/pdf/2004.13655), Theorem 5.6 | Catalytic stochastic order with compactly supported Radon distributions | The compact-support theorem does not supply a multiplier for the present noncompact density. |
| Pomatto–Strack–Tamuz, *Stochastic dominance under independent noise*, [full preprint](https://arxiv.org/pdf/1807.06927), DOI [10.1086/705555](https://doi.org/10.1086/705555) | Background noise on the whole real line | The positive-half-line support restriction in the Dirichlet problem is material. |
| Elkouss–Maity–Nema–Strelchuk, *A finite sufficient set of conditions for catalytic majorization*, **Communications Physics 9** (2026), 164, [full preprint](https://arxiv.org/pdf/2502.20588), Theorem 1 | Finite probability vectors $x,y\in P_n$; a finite collection of sufficient tests | “Infinite” in the motivating discussion concerns the number of inequalities, not the vector dimension. The paper cites Pereira–Plosker but does not give the infinite Dirichlet-series result. The published PDF was blocked; the complete 22-page preprint was inspected. |

## Positive multipliers and positive convolutions

Motzkin–Straus, *Divisors of polynomials and power series with positive coefficients*, **Pacific Journal of Mathematics 29** (1969), 641–652, [full PDF](https://msp.org/pjm/1969/29-3/pjm-v29-n3-p13-p.pdf), Section 4, was inspected. Its smaller-radius conclusions do not alone give an absolutely summable multiplier at the original boundary. Problem 4.2 asks a full-radius question in the formulation used there. We do not claim to resolve that separate problem or to establish priority for the summable-series lemma merely from this comparison.

Katkova–Vishnyakova, *A continual analogue of a theorem by M. Fekete and G. Pólya*, **Positivity 5** (2001), 1–11, [full PDF](https://ekhnuir.karazin.ua/bitstreams/41e252c6-eba5-435f-bbbb-66a8582ace7e/download), Theorems 1–2, was inspected independently by two agents. The first theorem assumes all exponential moments, eventual positivity at the ends, and positivity of the bilateral Laplace transform for every real argument. The second is a compact-support specialization. These hypotheses are not available in the present theorem, which requires positivity only on a positive half-line and allows noncompact sign-changing tails.

Filaseta, *Irreducibility criteria for polynomials with non-negative coefficients*, **Canadian Journal of Mathematics 40** (1988), 339–351, [full PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/A507ABBDF3D0A59A08A2C754BA7A7565/S0008414X00000134a.pdf/div-class-title-irreducibility-criteria-for-polynomials-with-non-negative-coefficients-div.pdf), contains the finite sine-coefficient multiplier construction used in our constructive proof. Its comment after the lemma credits methods of Diamond–Essén and an earlier real-coefficient result of Meissner. That finite construction is classical. The candidate supplies its own summable-tail approximation and Neumann-series argument, without presenting the finite construction as new.

## Unresolved priority risk: Diamond–Essén

Harold G. Diamond and Matts Essén, *Functions with non-negative convolutions*, **Journal of Mathematical Analysis and Applications 63** (1978), 463–489, DOI [10.1016/0022-247X(78)90091-4](https://doi.org/10.1016/0022-247X(78)90091-4), is directly relevant. Katkova–Vishnyakova cite it for existence of nonnegative convolution multipliers. Borel's [1989 primary article](https://www.numdam.org/item/JTNB_1989__1_1_67_0.pdf), printed page 78, also invokes it for a compact-support conclusion. Neither citation identifies all the hypotheses of its general theorem.

Direct publisher and PDF requests failed. The author's Illinois page timed out. The exact review identifiers are MR0481924 and Zbl0377.42007, but the review text was not accessible in the retrieved interfaces. Metadata and citation records do not establish theorem scope. We therefore do not assert that Diamond–Essén is weaker than the candidate or that it cannot already imply the proposed result.

## Search record and conclusion

Both search engines were used for the exact article title, authors with the conjecture and simple-zero terminology, positive Dirichlet multipliers, positive convolution factors, the Diamond–Essén title and DOI, and recent catalytic majorization work. The primary articles above were inspected to distinguish finite support, two-sided noise, smaller-radius multiplier results, and the exact half-line summability requirement. No exact prior resolution was located among the accessible sources.

That negative search result is not proof of novelty. Until the boundary convention and Diamond–Essén comparison are settled, this remains a documented candidate and is excluded from the repository's completed-result count. The explicit right-derivative counterexample is also not labeled a disproof of a holomorphic statement.

Work and independent audit receipts are coordinated in [issue 96](https://github.com/1337isnot1337/solved-conjectures/issues/96).
