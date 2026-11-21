# Independent written-proof audit

Date: 21 November 2026. Reviewer: root research agent, independent of the authoring combinatorics worker. Status: mathematical audit passes; priority is assessed separately in SOURCES.md.

Audited manuscript: `PROOF.md`, original commit `6c1636ef0587a2a21094c2953e3f2a54ffef6d4a`.

## Statement and class conventions

I read the primary text of Chen, Kitaev and Zhang, arXiv:2404.18517v1, especially the definitions in Section 1, Theorem 11's singleton transport, the record functional equations in Section 2.2 and Conjectures 1–3 in Section 3. The targets in the manuscript are the exact, fully quantified Conjectures 1 and 3. A maximum is weak; no uniqueness claim is needed. The singleton is irreducible, the reducible singleton class is empty, and the empty permutation belongs to neither positive class. The proof handles the differing singleton rows explicitly.

Primary source: https://arxiv.org/html/2404.18517v1

## Mathematical checks

1. Direct-sum decomposition gives `F=(1+R)J`: only the last component contributes right maxima. The skew-indecomposable series is `K=tz+RJ`; skew sum adds right-maxima counts, so `F=K/(1-K)`. Their elimination gives exactly the displayed quadratic for J.
2. Reversal, complementation and inversion transport the stated statistics and classes as claimed. In particular, inversion exchanges left maxima and right minima and preserves direct decomposability. The two Conjecture 3 generating functions are exactly `H` and `H-tz`.
3. Independent symbolic polynomial division modulo `R^2=(1-t)R-t` reproduced all three low-record reductions, including their finite exceptional coefficients. Independent iteration of the Schröder recurrence in an indeterminate `m` reproduced the complete rational expressions in the manuscript's table. Each numerator is `A(m)(r_(m+1)-r_m)+(A(m)+B(m))r_m`; both polynomial coefficients are positive for every positive m. These are proofs for all lengths, not sample sign checks.
4. The Motzkin recurrence follows from its quadratic generating function. The transformation `B(v)=(1-v)^(-1)M(v/(1-v))` gives the actual record quadratic after `L=v+v^2(1+u)^2B`; the resulting binomial identity and two applications of Pascal give the adjacent-difference formula for every record index at least three.
5. I independently regenerated all sixteen exact derivative-quotient certificates in SymPy from the explicit Catalan/binomial formula, without importing the author's verifier. Every full finite prefix is nonnegative. The eventual Pell recurrence proves the entire remaining coefficient tail.
6. Independent symbolic simplification with `u,r,T_r,T_(r+1)` treated as indeterminates verifies identity (14). The propagation uses only coefficientwise nonnegative series and positive scalar divisors. The `r>=12` cutoff is correct because `E_2 T_(r+1)` starts at index 13; all preceding kernels are separately certified.
7. The final multipliers `1+R` and `q=(R+t)/2` are coefficientwise nonnegative. The low-record comparisons and the uniform declining tail therefore give precisely the two desired unimodality conclusions.

The author's standard-library verifier also ran successfully, including its literal permutation convention check through length eight. Those finite permutations check definitions only; the proof does not infer an infinite theorem from them.

No mathematical gap or required correction was found. The root audit script had one initial symbolic-normalization assertion that used expansion where rational cancellation was needed; replacing it with exact rational simplification produced zero identically. This was a checker issue, not a manuscript correction.

## Attribution and priority limit

Sections 3–5 reconstruct the earlier trureturing Conjecture 2 tail argument, explicitly attributed at a pinned commit. I read the earlier RecordFirstDecline mathematical summary and the current source dossier; its declining comparison begins at three records and does not supply the new two-record and one-record comparisons. No new credit is claimed for that prior theorem or its certificate method.

This audit establishes the written argument's mathematical completeness to the review performed. It is not peer review and does not certify worldwide priority. The separate source audit must retain any inaccessible-source and search limitations. The two numbered source conjectures form one named result package and must not be subdivided into extra results by statistic or length.
