# Burcroff's conjecture

Audit date: 2026-11-21.

## Decision

**Exclude from new-resolution counting.** An earlier publicly accessible manuscript proves the stronger Alon–Defant conjecture for arbitrary complete multipartite factors, which includes Burcroff's balanced conjecture. Our uniform packing/isoperimetric proof was derived independently before that manuscript was found, but that does not create a new resolution.

The prior source is:

- Repository: [graph-theory-AI/Graph-Theory-LLM-Proofs](https://github.com/graph-theory-AI/Graph-Theory-LLM-Proofs).
- Manuscript: [to_review_astra/src/1904.02595__00/note.tex](https://github.com/graph-theory-AI/Graph-Theory-LLM-Proofs/blob/96f91048c5282ac2b8bed0b7e8dc454cf38ba636/to_review_astra/src/1904.02595__00/note.tex).
- Retrieved repository revision: `96f91048c5282ac2b8bed0b7e8dc454cf38ba636`.
- Manuscript blob SHA: `7bee3c06a88785a24d00fb43ac84b0ce083703db`.
- Date printed in the manuscript: **17 September 2026**. This is a document date, not yet an independently established first-publication timestamp in this audit.
- Related original writeup: [1904.02595__00.md](https://github.com/graph-theory-AI/Graph-Theory-LLM-Proofs/blob/96f91048c5282ac2b8bed0b7e8dc454cf38ba636/to_review_astra/src/1904.02595__00/1904.02595__00.md).
- Public review: [verification_astra/1904.02595__00.md](https://github.com/graph-theory-AI/Graph-Theory-LLM-Proofs/blob/96f91048c5282ac2b8bed0b7e8dc454cf38ba636/verification_astra/1904.02595__00.md).

The earlier manuscript calls itself a machine-generated proof awaiting human review. We have not presented that label as journal acceptance. Two current workers read the full mathematical argument and found no gap. Its publicly available complete proof is sufficient to disqualify a new-priority claim in this campaign, even without a journal publication.

## Mathematical comparison

The earlier proof uses a tensor rank for the label family of lonely vertices. Its two central inequalities strengthen the social-vertex bound and bound the missing independent-set weight. A rank-nonincreasing coordinate compression reduces the latter inequality to an intersecting-family count. Together they prove equality for unbalanced factors as well as balanced ones.

Our argument uses four pairwise-disjoint sets: lonely vertices, social vertices, one external private neighbor for each social vertex, and the open neighborhood of the lonely vertices. Combining their cardinality bound with published power-law isoperimetry proves the balanced case through one scalar concavity inequality. No tensor compression occurs in our derivation. This difference may make the argument a useful alternative proof; it does not change the novelty decision.

The earlier proof's rank argument, compression, weighted deficit, and treatment of small products were inspected. The current proof's private-neighbor packing, open-neighborhood convention, normalization, logarithm bounds, integer endpoint certificate, and equality case were checked independently by the coordinating worker and the combinatorics worker. Neither review found a defect. No Lean verification was attempted.

## Primary-source checks

1. [Alon–Defant, author-hosted full text](https://web.math.princeton.edu/~nalon/PDFS/isostab.pdf), DOI [10.1016/j.disc.2020.111902](https://doi.org/10.1016/j.disc.2020.111902), 2020. Checked the exact balanced conjecture, the 37-exception theorem, the social bound, the open-neighborhood definition, and the isoperimetric power bound. Its conclusion leaves the 37 cases unresolved.
2. [Burcroff, arXiv:1809.04769v2](https://arxiv.org/pdf/1809.04769), 2018. Checked Conjecture 6.1 on page 17 and Theorem 5.1 on page 12 for the known cases with at most three factors or a two-part factor. The eventual journal article is Discussiones Mathematicae Graph Theory 43 (2023), 95–114, DOI [10.7151/dmgt.2352](https://doi.org/10.7151/dmgt.2352).
3. [Burcroff's current research page](https://math.mit.edu/~amandabu/research.html). Checked the current publication list, including the 2021 direct-product domination paper and 2023 unitary Cayley paper. No later irredundance resolution appeared there.
4. [Colin Defant's research page](https://sites.google.com/view/colin-defant/research). Located the current author page and its bibliography routes. This is a discovery source, not evidence that no unpublished work exists.
5. [Burcroff, Tightness of domination inequalities for direct product graphs](https://www.sciencedirect.com/science/article/pii/S0012365X21002089), 2021. The retrieved abstract concerns multiplicative domination inequalities and does not resolve the target.

The publisher pages and some arXiv abstract routes returned access errors. Accessible author-hosted or arXiv PDF full texts supplied the load-bearing source statements. Search snippets and secondary catalogues were not substituted for those theorem checks.

## Search record

Two independent public-web search systems were used. Queries included the conjecture's name, the original paper's title, its theorem statement, author combinations, and explicit recent years. Representative exact queries were:

```text
"Burcroff" "irredundance" conjecture proof 2025 2026
"Burcroff’s conjecture" irredundance
"Burcroff" "37" irredundance
"Alon" "Defant" "private neighbors" "isoperimetric" irredundance
"Burcroff" "irredundance" "resolved" OR "proved" OR "proof"
"upper irredundance" "multipartite" "conjecture" "2026"
"upper irredundance" "multipartite" "conjecture" "2025"
"Burcroff" "irredundance" "solution"
"Burcroff" "irredundance" after:2021 before:2027
"irredundance" "balanced" "37" -"Isoperimetry"
"Burcroff’s irredundance conjecture" proof
"Isoperimetry, stability, and irredundance in direct products" "cited"
"Burcroff" "conjecture" irredundance "packing"
"irredundance" "balanced complete multipartite" -Burcroff -Alon -Defant
"Domination Parameters" "Burcroff" "Conjecture 6.1" proof
site:github.com "Burcroff" "irredundance"
site:github.com "Burcroff" "conjecture"
```

These ordinary web searches mostly returned the original papers, bibliographic copies, author lists, and catalogues with stale open-status descriptions. They did **not** find the earlier full proof.

The decisive search used GitHub's code index directly, with:

```text
Burcroff irredundance
irredundance balanced multipartite
```

It returned the proof, its public review, and associated manuscript files. A repo-specific search for `Burcroff` found only earlier screening references to Burcroff–O'Brien's unrelated domination-polynomial work, so the target had not already been documented as resolved in this repository.

## Work record

- Issue [#159](https://github.com/1337isnot1337/solved-conjectures/issues/159) was opened for coordination before the proof was developed.
- The four-disjoint-set observation led to diagnostic rational evaluations of the exact isoperimetric profile. The finite computations were then replaced by a uniform analytic proof.
- Commit `c233d2e07b6666b4429fc2136ed4e7276cd5fa72` records the first complete proof candidate.
- Commit `6dafe9f46414633eb12d56cd80a8df92255b062d` adds verified original-source numbering and repository math formatting.
- After global code search found the prior work, issue #159 immediately recorded the exclusion. The proof's status was changed to independent reproof, and no result catalogue entry was requested.

## Consequence for subsequent target selection

Search global code repositories for the source identifier and conjecture name **before** substantial proof work. The public web's apparent lack of a resolution was materially incomplete here. A catalogue saying that the problem was open in May 2026 did not establish that it remained open in November 2026.
