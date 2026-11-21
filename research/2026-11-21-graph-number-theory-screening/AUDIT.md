# Graph and number theory target audit

Date: 2026-11-21.

This file records screening work. No entry in this file is a new resolution.

## Novelty exclusions

- **Burcroff's conjecture.** A complete independent proof is in the adjacent Burcroff research directory, and two other agents found no mathematical gap. It cannot count as a new resolution: the stronger unbalanced Alon–Defant conjecture has a complete prior manuscript in [Graph-Theory-LLM-Proofs, pinned revision 96f91048](https://github.com/graph-theory-AI/Graph-Theory-LLM-Proofs/blob/96f91048c5282ac2b8bed0b7e8dc454cf38ba636/to_review_astra/src/1904.02595__00/note.tex). The manuscript is dated 17 September 2026 and the repository commit is dated 29 September 2026. See issue #159 and the detailed NOVELTY.md.
- **Alon–Dębski–Grytczuk–Przybyło's packing conjectures.** The original source is [arXiv:2603.02786](https://arxiv.org/abs/2603.02786). Global code searches found prior full manuscripts for records __00, __01 and __04, and a disproof for __03, in the same proof repository. These were excluded before attempting new proofs.
- **The LB/QLB equivalence conjecture for posets.** The original source is [arXiv:1902.06473](https://arxiv.org/abs/1902.06473). A prior proof and independent computational/referee audit appear in [verification/1902.06473__00.md](https://github.com/graph-theory-AI/Graph-Theory-LLM-Proofs/blob/96f91048c5282ac2b8bed0b7e8dc454cf38ba636/verification/1902.06473__00.md). Excluded.
- **Abiad–Kumar–Mohan–Pragada–Zhang's odd unicyclic energy conjecture.** The original source is [arXiv:2506.07264](https://arxiv.org/abs/2506.07264). Prior resolution by Ning–Zeng, arXiv:2605.24668; also present in the proof repository. Excluded.
- **The equality cases in the Elphick–Farber–Goldberg–Wocjan conjecture.** Prior full claims by Liu–Tang–Zhang (arXiv:2607.18031) and Hu–Liu–Wang (arXiv:2608.17329). Excluded.
- **Bonamy–Knor–Lužar–Pinlou–Škrekovski's strengthened Szeged–Wiener inequality.** Prior full claim by Zhang–Li, arXiv:2609.20025, and a prior proof under record 1602.05184__00 in Graph-Theory-LLM-Proofs. Excluded.
- **Vujošević–Popivoda–Kovijanić Vukićević–Furtula–Škrekovski's molecular-tree AG+GA and AG−GA extremal conjectures.** Already proved by Alsheekhhussain–Ali–Ramadan–Khedr, [DOI:10.1155/2022/1188776](https://doi.org/10.1155/2022/1188776). Excluded.
- **Sun's root-location conjecture for generalized binomial polynomials.** Another agent independently reproduced the prior MathOverflow counterexample by Qiping Zhou: m=5, n=7, q²=−499140. The repaired m=4 claim also had a prior posted counterexample. [Prior discussion](https://mathoverflow.net/questions/479301/on-the-polynomials-sum-k-0n-binomnkkm-qk). Excluded.

## Current unresolved leads

The following are research leads only. A failed search is not proof of novelty.

### The optimal tea-sharing sequence question

Source: Gollin, Hendrey, Huang, Huynh, Mohar, Oum, Yang, Yu and Zhu, [Sharing tea on a graph, arXiv:2405.15353](https://arxiv.org/abs/2405.15353), Question 6.1.

For every finite graph G, nonnegative initial weight vector w and target vertex v, does an optimal sequence of connected-set averaging operations exist with at most 2^|V(G)| operations?

The source proves that an optimal finite sequence exists through compactness. The compactness argument supplies no uniform length bound. Its Proposition 6.2 rules out the stronger rule that no operation's set may be contained in a later operation's set. Global GitHub searches found a failed attack record, not a completed proof. Author publication pages still list the source paper, accepted by Combinatorial Theory in June 2026.

A useful equivalent geometric formulation is to start from the unit vector at v and take the convex hull of all reachable distributions. The length question asks whether all supporting linear functionals attain their maximum on distributions reachable within the proposed length bound. This formulation is an observation, not a proof that the convex hull is a polytope.

### The expected-face comparison conjecture

Source: Campion Loth, Halasz, Masařík, Mohar and Šámal, [Random Embeddings of Graphs, arXiv:2211.01032](https://arxiv.org/abs/2211.01032), Conjecture 9.6.

The conjecture compares the expected number of faces under random cyclic rotations at vertices, with and without independently random edge signatures. It asserts that introducing random signatures cannot increase the expectation.

Global code search found prior full manuscripts for several other conjectures in this paper, including the nonorientable complete-graph upper bound (record __03), but only unsuccessful attack material for Conjecture 9.6 (record __04). No proof has been obtained here. A fixed-rotation comparison would be stronger and is not assumed: changing a signature can split or merge faces after earlier twists.

## Search practice

Each plausible candidate now receives both ordinary literature searches and global GitHub code searches by arXiv identifier and author/title before substantial proof work. Burcroff demonstrated that ordinary indexed web searches alone missed an earlier complete manuscript.
