# Source and priority audit

Audit date: 2026-11-21.

## Exact target

- **Authors:** Dmitrii Karp, Anna Vishnyakova, Yi Zhang.
- **Paper:** *Unimodality preservation by ratios of functional series and integral transforms*.
- **Publication:** Results in Mathematics **80** (2025), article 112; published 20 May 2025.
- **DOI:** https://doi.org/10.1007/s00025-025-02431-4
- **Primary preprint:** https://arxiv.org/html/2408.01755v2 ; version dated 1 March 2025.
- **Locator:** Section 3, Example 8; strict sign regularity is Definition 2.1.
- **Exact short source statement:** “We further conjecture that $`K(x,y)=1/\Gamma_q(x+y)\in SSR_\infty`$, $`0<q<1`$.”
- **Author-hosted copy also inspected:** https://yzhang1616.github.io/Unimodality_KVZ.pdf
- **Publisher page inspected:** https://link.springer.com/article/10.1007/s00025-025-02431-4
- **Author's current publications list inspected:** https://dmkrp.wordpress.com/publications/ . It lists the target paper and papers through August 2026; no reciprocal-kernel resolution appeared in that list.

The source's full continuous kernel conjecture is the target. The discrete reciprocal q-factorial lemma of order three is a proved result in the source, not the new target. The proof covers every determinant order and arbitrary positive real node lists for every $`0<q<1`$. It does not extrapolate beyond that stated base interval.

## Closest later work: positive gamma kernel only

Domingos S. P. Salazar, *Order-Moment Transport and Hankel Determinants in Special-Function Inequalities*, arXiv:2606.31647.

- https://doi.org/10.48550/arXiv.2606.31647
- https://arxiv.org/abs/2606.31647
- Metadata/abstract also located at https://academ.us/article/2606.31647/
- The indexed abstract explicitly proves the **positive** Jackson q-gamma kernel conjecture, $`\Gamma_q(x+y)\in STP_\infty`$.
- The same abstract explicitly excludes the reciprocal sign-regularity problem from its scope.
- The version note says its v016 manuscript adds the positive-kernel application, which was absent from the earlier JMAA-submitted v014 manuscript. The arXiv metadata labels the public entry v2.
- Direct full text was blocked in this environment. The abstract's express separation is sufficient to distinguish the claimed target from ours; it is not used as a mathematical premise.

The author's public application catalogue was inspected directly:

https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md

Its APP-0080 entry, dated 2026-06-21, claims the positive q-gamma Hankel kernel is strictly totally positive. The listed dependencies are the q-binomial atomic Mellin representation and the positive Mellin-moment kernel criterion. Searching that catalogue for “reciprocal q” returned no match. This entry is not the reciprocal theorem.

## Other nearby results deliberately excluded

Two public Kalmykov–Karp resolutions concern a different conjecture about Turánians of **series** of shifted reciprocal q-gamma functions, including permitted negative shifts:

- https://www.trureturing.org/research/kalmykov-karp-2018-qgamma-turanian-function/
- https://www.trureturing.org/research/kalmykov-karp-2018-qgamma-turanian-coefficients/

Their original source is Kalmykov–Karp, JMAA **460** (2018), 332–351, arXiv:1702.03788, Conjecture 1. They do not claim the all-orders sign regularity of the kernel in Karp–Vishnyakova–Zhang's 2025 paper.

The 2025 paper's Bessel ratio conjecture and its gamma quotient conjecture are also separate targets. Their known resolutions were not counted or reused as new work here.

## Search coverage

Both available search engines were used. The first set used broad discovery; later searches used the stronger engine for exact scope and current status. Queries included the following exact or near-exact strings:

- `"Karp" "Vishnyakova" "q-gamma" conjecture`
- `"reciprocal" "q-gamma" "sign"`
- `"q-gamma" "conjecture" "positive"`
- `"q-gamma" "sign-regularity"`
- `"reciprocal q-gamma" "kernel"`
- `"q-gamma" "SSR"`
- `"q-gamma" "strictly sign"`
- `"Karp" "reciprocal" "gamma" "sign regular"`
- `"q-gamma" "beta integral" "total positivity"`
- `"Karp" "Vishnyakova" "reciprocal" "conjecture"`
- `"q-Pochhammer" "sign-regular"`
- `"q-gamma" "strict sign" proof`
- `"q-beta" "sign regular"`
- `"q-gamma" "Cauchy-Binet"`
- `"q-gamma" "sign regular" conjecture proof`
- `"reciprocal q-gamma" conjecture`
- `"q gamma" "sign regular" proof`
- `"q-gamma" "strictly sign-regular"`
- `"Jackson" "sign-regularity"`
- `site:trureturing.org "q-gamma" "kernel"`
- `site:evidencepress.org "q-gamma" "regular"`
- `"Karp Vishnyakova Zhang" "gamma" "conjecture" 2026`
- `"q-beta" "totally positive"`
- `"q-gamma" "determinants" "reciprocal"`
- `"Unimodality preservation" "q-gamma" proof`
- `"q-gamma" "sign regular" 2026 November`
- `"Vishnyakova" "q-gamma" proof conjecture 2026`

Searches with unrelated result domains excluded were also used to reduce repeated mirrors. Retrieved potentially relevant sources were distinguished by their exact kernel and parameter domains rather than titles alone.

**Audit conclusion:** no previous resolution of the reciprocal-kernel conjecture was found within this search. The target is explicitly conjectural in the 2025 primary source, and the closest located 2026 follow-up expressly excludes it. This is evidence of unresolved status, not a proof that every existing publication has been searched. Discovery of an earlier full reciprocal-kernel proof would invalidate a novelty claim while leaving the mathematical argument intact.

## Standard formula sources for the proof

- Jackson q-gamma product: https://dlmf.nist.gov/5.18.E4
- Euler's first sum: https://dlmf.nist.gov/17.5.E4
- q-binomial series: https://dlmf.nist.gov/17.5.E2
- Jackson beta integral, an alternate interpretation: https://dlmf.nist.gov/5.18#iii

All mathematical steps between these standard identities and the determinant conclusion are written out in `PROOF.md`.
