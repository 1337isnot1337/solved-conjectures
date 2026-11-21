# Guo–Kang–Liu's conjecture

Status: open in this investigation. Issue #194 coordinates research on the full vexillary Schubert and Grothendieck join–meet inequalities.

## Primary statement

Peter L. Guo, Mingyang Kang, and Jiaji Liu, *A Lam–Postnikov–Pylyavskyy inequality for hybrid Grothendieck polynomials*, arXiv:2607.03116 (3 July 2026), Conjectures 1.12 and 1.16.

Full author-hosted source:
https://cfc.nankai.edu.cn/_upload/article/files/fb/a2/df165b9441feb2b55824b980050a/c8be3f62-ee68-4235-8f85-df1a3edc099c.pdf

For vexillary permutations u and v, suppose that the Wachs flag of u is a prefix of the Wachs flag of v. The prefix condition requires exact equality of the corresponding flag entries, not componentwise comparison. Define join and meet by coordinatewise maximum and minimum of their Lehmer codes. Conjecture 1.12 asserts that S_(u join v) S_(u meet v) − S_u S_v is a nonnegative linear combination of Schubert polynomials. Conjecture 1.16 asserts the corresponding positivity in the beta-Grothendieck basis with coefficients in nonnegative polynomials in beta.

The source reports complete checks through n=8 for Schubert positivity and n=7 for Grothendieck positivity. Those checks are not claimed as results here. The source's stable Grothendieck specialization, Thomas–Yong's conjecture, was subsequently proved in arXiv:2610.34607 and is excluded from the target.

## Status audit

Both web search engines were used for the arXiv identifier, authors, vexillary LPP conjectures, and later proofs. No complete vexillary resolution was found. The latest indexed author publications were checked, including unrelated November 2026 papers on Macdonald intersections and quantum K-theory. Global GitHub issue searches for vexillary LPP and the repository's Guo–Kang references returned no existing target. The available complete PrincipiaMath path inventory and trureturing Problems/selected Blueprint section inventories had no matching title or arXiv path. These are bounded searches, not proof of novelty. Global code search remained rate-limited, so the content audit is incomplete.

## Exact diagnostic

`schubert_probe.py` implements the Lascoux–Schützenberger transition recurrence using sparse integer polynomials. It expands the product difference in the Schubert basis by eliminating the largest reverse-lexicographic monomial, whose exponent vector is the Lehmer code of the corresponding Schubert basis element. A negative leading coefficient after prior eliminations would be an exact obstruction.

The implementation reproduces the source's explicit u=5712364, v=3514672 example, including its two nonzero Schubert coefficients 2 and 1. A bounded deterministic low-length probe in S_10 generated 84 Wachs-flag groups and checked 77 nonzero differences from 10,000 proposals; no negative coefficient appeared. The maximum individual inversion count proposed was 10. This is a diagnostic of the search procedure, not a verified parameter range and not a resolution.

The main obstacle is that sparse low-length permutations of larger ambient size often reduce to previously checked shapes after deleting irrelevant positions. A useful next step needs a structural comparison or a genuinely different class of instances, rather than a larger ambient dimension alone.
