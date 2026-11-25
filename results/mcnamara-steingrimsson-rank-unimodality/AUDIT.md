# Mathematical review and source priority

## Reproduction and review

Run the checker from the repository root.

~~~text
python3 results/mcnamara-steingrimsson-rank-unimodality/verify.py
~~~

The checker uses integer arithmetic and a separate coefficient count for
$`D_u`$. If a subword has $`r>0`$ letters 2 and the last one greedily
matches the host's $`a`$-th letter 2, the lengths of the $`r`$
preceding runs of ones have quotients summing to $`a-r`$ on division
by 4. The residues in $`\{0,1,2,3\}`$ are free, and the final run has
at most $`33-4a`$ ones. The checker sums over these choices. The
coefficients agree with the greedy recurrence in the proof.

An independent review within this research session recovered the
component decomposition and all three counts. The reviewer also
enumerated the actual patterns through a deletion DAG for 12 smaller
analogues, using $`u\in\{11,12,21,121,212,112\}`$, $`w=(2)^{|u|_{\rm parts}}`$
and $`t\in\{2,3\}`$. Each complete rank vector agreed with the
corresponding instance of the interval formula. For example, for
$`u=212`$ and $`t=3`$ the vector is
$`(1,5,9,22,32,31,16,1)`$. A separate [Lean formalization](FORMALIZATION.md) now verifies the literal counterexample, including all three exact rank sizes. External refereeing is pending.

## Priority screen

The 2026-11-25 search covered the two authors, the published and
preprint identifiers, Vatter's Conjecture 2.2, alternate wording for
rank-unimodality of classical pattern intervals, direct-sum
augmentation, repeated blocks, the 312 wrapper and the numerical
witness. No prior resolution of the exact statement surfaced.
Public Lean searches located pattern infrastructure. Searches of
the repository's tracked main and research catalogues and local
remote snapshots found distinct results on Vatter's derangement
problems and no exact match.
[McNamara and Steingrímsson, JCT A 134 (2015), 1 to 35](https://doi.org/10.1016/j.jcta.2015.02.009) |
[Original preprint, arXiv:1305.5569](https://arxiv.org/abs/1305.5569) |
[RealRooted pattern infrastructure](https://github.com/PerAlexandersson/RealRooted/issues/1256)

Hughes's November 23 preprint resolves the neighboring Sperner question
and explicitly states that rank-unimodality stays open. Its witness
$`[213,2574613]`$ has the unimodal vector $`(1,3,7,7,1)`$, and the author
also proves unimodality for the principal-downset family in that paper.
[Hughes, preprint, Section 4](https://mathdiscoveries.org/static/papers/pattern-poset-not-sperner/2026-11-23-v1/pattern-poset-not-sperner-2026-11-23-v1-paper.pdf)

Other recent work concerns the one-descent and bitonic cases of
composition principal ideals and other partial results for composition
downsets. The counterexample here has a nontrivial lower endpoint and
a top containing 312. Its scope is the interval conjecture. The
consecutive-pattern analogue was proved by Elizalde and McNamara.
[Vatter, arXiv:2602.16355v3, Section 2](https://arxiv.org/abs/2602.16355v3) |
[One-descent composition ideals, arXiv:2611.28619](https://arxiv.org/abs/2611.28619) |
[Chen, composition ideals](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=7385218)

The proposer credit is to Peter R. W. McNamara and Einar Steingrímsson. The witness and proof were developed by a GPT‑6.2 Sol research agent in an OpenAI Codex session. The coordinating Codex agent re-derived the interval count and independently checked the three coefficients.
