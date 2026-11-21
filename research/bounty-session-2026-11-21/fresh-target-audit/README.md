# Fresh paid-target audit: existing claims and uncertain payment

Checked 21 November 2026. This is a source audit, not a proof or a bounty claim.
No fresh, currently confirmed cash target with a complete closing argument was
found in this screen. Searches stop at this checkpoint.

| Lead | Mathematical status found | Payment status found | Decision |
| --- | --- | --- | --- |
| Boyer Enigma 6a | No full prior solution found; the common fractional linear repair route fails for four published near-squares | Historical direct 500-euro offer; current sponsor page unavailable | Restricted research recorded in [boyer-six](../boyer-six/README.md); no completion |
| Freudenthal quartic/quintic Scott--Vogelius stability | Multiple 2026 full-scope proof claims and a public Lean development | Catalogue lists 1,000 dollars; sponsor PDF and hub returned HTTP 502; no award acceptance checked | Exclude from fresh first-solution work pending review of prior claims |
| KCIK Problem 5, two-copy Werner nondistillability | July 2026 preprint explicitly claims the complete prize target and stronger all-dimension result | Original renewal rule exists; current sponsor page does not record an award for this result | Exclude from fresh first-solution work; do not infer sponsor acceptance |
| FormalMarket | Only a factorization target had a nondemo bid in the viewed bid list | Five demos use fake money; nondemo bid displayed a past expiry and manual settlement | No confirmed live cash target; details in [boyer-six](../boyer-six/README.md) |

## Freudenthal stability

The original [Farrell--Mitchell--Scott paper, SIAM Journal on Scientific
Computing 46(2), 2024](https://epubs.siam.org/doi/abs/10.1137/22M1533943)
states two distinct conjectures. The first asks for uniform Scott--Vogelius
inf-sup stability on three-dimensional Freudenthal meshes for velocity degree
`k >= 4`. The second concerns a stable decomposition of the divergence kernel
for `k >= 5`. Only the first is the target discussed here.

In the usual notation, the first asks for a positive constant independent of
mesh size in the inf-sup estimate between the continuous piecewise polynomial
velocity space with homogeneous Dirichlet trace and its divergence image.
A rank computation on one fixed mesh would not prove this statement.

The [catalogue entry](https://prizeproblems.org/problems/148/) points to the
[foundation's prize PDF](https://people.cs.uchicago.edu/~ridg/prizes/kuhnprize.pdf)
and [official hub](https://people.cs.uchicago.edu/~ridg/prizes/prizes.html),
but both primary prize URLs returned HTTP 502 in this check. The catalogue's
1,000-dollar figure and first-publication rules were therefore not freshly
verified from the sponsor. No claim of a currently guaranteed payment is made.

Three prior proof claims were located:

- Siqi Ding, Pingbing Ming, Haijun Yu and Quanfan Zhu,
  [arXiv:2609.25690](https://arxiv.org/abs/2609.25690), claim stability for every
  velocity degree `k >= 4` using explicit local constructions. The indexed
  primary abstract gives 22 September 2026. Direct abstract and HTML opens
  returned `DisabledError`; the full paper was not reviewed here.
- Hanbing Liang and Fujun Liu,
  [arXiv:2609.29608](https://arxiv.org/abs/2609.29608), claim the same uniform
  result, treating degrees four and five and combining with the established
  higher-degree range. Direct arXiv opens again failed, but their
  [author-owned verification repository](https://github.com/ToughClimb/freudenthal-sv)
  was read successfully.
- David Alfyorov's [Research Square record](https://www.researchsquare.com/article/rs-10887173/v1)
  was located through its indexed metadata and the
  [author's publication page](https://spbstu.academia.edu/DavidAlfyorov/Papers).
  Its claimed scope is uniform stability in degrees four and five using a
  local edge construction. The direct manuscript endpoint was unavailable;
  this entry records a claim, not an independent proof assessment.

The Liang--Liu repository distinguishes the analytic paper from its Lean
scope. Its README claims a kernel-checked right inverse for degrees four and
five for every mesh size `N >= 1`, with actual spatial polynomial spaces,
integral energies and the required uniform constants. Higher degrees are
outside the stated Lean scope. The README describes the allowed axiom audit,
but this session did not compile or independently inspect the entire proof.
The citation file identifies the authors and manuscript; it does not provide
a journal acceptance or prize-award record.

Reproducible repository provenance:

| Item | Git identifier |
| --- | --- |
| Latest main commit observed | `9ac1b38da3a7347b62d132ddf5e902c0cb298125` |
| Commit date | `2026-10-02T08:12:18Z` |
| README blob | `c2651ecc2cea7ac3e76ac791e14212de31456ddb` |
| CITATION.cff blob | `163b8fc8e11903280e598a9c09737e68165a9b7c` |

These prior full-scope claims are sufficient to exclude the problem as a clean
new target. They are not silently promoted to established proofs or an accepted
award. Reviewing a competing proof is a different task from solving an
untouched conjecture.

## KCIK Problem 5

The [official 2020 problem paper](https://kcik.ug.edu.pl/wp-content/uploads/2021/12/2002.03233.pdf),
Problem 5 and equation (5), asks whether

```math
\rho(4,-1/2)=\frac{I_{16}-F_4/2}{14}
```

is two-copy nondistillable, where `F_4` swaps the two four-dimensional tensor
factors. Its final section offers the Golden KCIK Award. Footnote 5 specifies
automatic yearly extension of unsolved problems, with the award in euros
equal to the year; the text allows at most two awards per year. The 2026 amount
of 2,026 euros is an implication of that standing rule, not a new award notice.

Kishor Bharti, Rishikesh Gajjala and Tobias Haug's
[arXiv:2607.24479v1](https://arxiv.org/abs/2607.24479), submitted 27 July 2026,
claims the complete two-copy threshold for all Werner dimensions. Its
[full text](https://arxiv.org/html/2607.24479v1) explicitly identifies the
two-ququart endpoint with Problem 5. Theorem 1.1 is a dimension-independent
inequality for rank-at-most-two operators; Corollary 1.2 derives the threshold
`alpha < -1/2`. This scope includes the precise prize target. The paper itself
also records concurrent work; this audit makes no priority adjudication.

The same paper explicitly leaves the unrestricted many-copy endpoint open.
Its two-copy claim must not be reported as settling KCIK Problem 4, which asks
for negative-partial-transpose bound entanglement. No attempt to prove that
stronger statement was made in this screen.

Gajjala's [author page](https://gajjala.in/) labels the preprint as solving the
Golden Award problem. The linked [official KCIK awards page](https://kcik.ug.edu.pl/kcik-awards/)
does not contain a Problem 5 award announcement in the version retrieved. It
does record the 2021 Golden Award for the separate entangled-officers problem.
An author's description of a solved prize problem is not evidence that the
sponsor has accepted a submission or paid the prize. The proof was not
independently re-established here.

## Boundary of this screen

The July 2026 catalogue was used for discovery only. Primary problem papers,
author repositories, current award pages, and exact target scopes take
precedence over a catalogue's `verified open` label. Search results with
unrelated names, mirrors, or later crawl dates were not treated as new source
evidence. No emails, account registrations, paid computations, or bounty
submissions were initiated. None of these status checks increments the count
of solved or paid mathematical problems.
