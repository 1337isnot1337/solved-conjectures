# Erdős 949: full target and prior-work audit

Date: 21 November 2026. Status: research in progress; the full target remains unresolved in this work. Qualifying completed bounty problems: **0**.

## Exact mathematical target

For every sum-free set $`S\subseteq\mathbb R`$, find $`A\subseteq\mathbb R\setminus S`$ such that


```math
|A|=\mathfrak c,\qquad (A+A)\cap S=\varnothing.
```


Here sum-free means $`(S+S)\cap S=\varnothing`$. Both sumsets allow repeated summands. In particular, the conclusion includes $`2a\notin S`$ for every $`a\in A`$. There is no measurability, Baire-property, regular-continuum, or definability hypothesis.

The [live Conjectures target](https://conjectures.io/problems/erdos949-erdos-949) displays the original type

**Lean excerpt**

```lean
True ↔ ∀ S : Set ℝ,
  (∀ a ∈ S, ∀ b ∈ S, a + b ∉ S) →
  ∃ A ⊆ Sᶜ, Cardinal.mk ↑A = Cardinal.continuum ∧ A + A ⊆ Sᶜ
```

Task identifier: `fc-v2-erdos949-erdos-949-c8f5bf67224e1562449be43a-formalized`.

The [pinned task bundle](https://github.com/conjectures-io/conjectures-tasks/tree/85cfaba5faee2b8738d56c959d0acc774964a399/versions/fc-v2-erdos949-erdos-949-c8f5bf67224e1562449be43a-formalized) is the relevant formalization contract, rather than a subsequently changed upstream source.

## Direct-payment eligibility and limits

The live page displayed an estimated **$2,711** reward, no full-proof or refutation attempts, and one prior partial contribution. The platform pays the solver in Subnet 66 Alpha; the dollar figure is a variable estimate, not a guaranteed cash balance. This is a direct-to-solver offer, not a donation in the solver's name.

The [submission terms](https://conjectures.io/submission-terms), version 13 effective 11 November 2026, require an exact pinned Lean proof and the original AI chats. Verification, approval, and payment are separate. Prior established full mathematical proofs can disqualify a new formalization. Submission costs a verification credit; no credit was bought, no submission was made, and no terms were accepted in this work. Any later full-proof publication or submission must be coordinated before making a public completion claim.

## Exact prior work inspected

| Source | What it establishes | What remains outside its scope |
|---|---|---|
| [Current Google formal source](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/949.lean) | The Sidon-set variant has a complete Lean proof. The full theorem remains marked `research open` with `sorry`. | Arbitrary sum-free sets. |
| [Erdős problem page](https://www.erdosproblems.com/949) and [discussion](https://www.erdosproblems.com/forum/thread/949) | Indexed records credit AlphaProof, reported by Yael Dillies, for the Sidon variant. The original source is Erdős, *Problems and results on combinatorial number theory III* (1977), pp. 43–72. | The unrestricted sum-free problem is still listed open. Direct page retrieval was blocked during this audit; this part uses indexed records and is cross-checked against the current formal source. |
| [28 July 2026 working report](https://www.erdosproblemaday.com/report/949) | Measurable cases, and a correction ensuring that the Baire-case argument handles repeated summands. The report explicitly leaves the full ZFC question open. | Arbitrary nonmeasurable, non-Baire sets. |
| [Somani candidate endpoint](https://github.com/neelsomani/gpt-erdos/blob/main/data/solutions/949/candidate_solution.md) | Small-cardinality and Sidon arguments. | It is not a complete proof of the arbitrary-set target. |
| [23 September Conjectures contribution](https://github.com/conjectures-io/conjectures-contribution/tree/main/contributions/erdos-949/7dec15a5cf8f5124b5fa189b39ea2e2abedef944c294b3e30336c02d52b5154e) | A general Zorn small-trace criterion; cases $`\lvert S\rvert\lt\mathfrak c`$, bounded above or below, and proper rational span. Both `sources.md` and `script.lean` were read. | No proof for every arbitrary sum-free set. |

The prior contribution's useful general criterion is: if some $`X\subseteq\mathbb R`$ has cardinality $`\mathfrak c`$ and


```math
|S\cap X|<\mathfrak c,
\qquad
|S\cap(X+X)|<\mathfrak c,
```


then a suitable $`A`$ exists. This criterion is prior work and is not claimed here. Its source blob is `8f417f08780a87f043e2977ca8e9e6e11c838512`; the Lean blob is `d6e542f40e7af24c14121bad2f0cd1b0c3d6e78c`.

Exact-number, exact-statement, sum-free/complement, and 2026 proof searches did not locate an established full solution. That is evidence from a source audit, not a proof of novelty or a guarantee that no prior proof exists. The live target and current formal source agree on the unresolved full scope.

## This continuation's mathematical work

The [reflection and dilation note](reflection-and-dilation-obstruction.md) records two sufficient reflection/translation conditions and a strong-coloring construction that blocks a proposed fixed-basis dilation strategy. The construction is a corollary of an established Galvin–Shelah partition theorem; no novelty is asserted. It is explicitly **not** a counterexample to Erdős 949: an explicit translated basis solves the target for the constructed set.

The exact remaining obligation is to choose a suitable continuum-sized set for an arbitrary sum-free $`S`$, beyond those two sufficient conditions and beyond rational dilations of a prescribed basis. No finite computation or numeric subcase is counted as a solution.

## Coordination

The lane was reserved in [issue 223, comment 7068934800](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7068934800). The posted body was read back and matched exactly. This research lane adds no completed target. The campaign now has one complete proposed threshold solution, documented separately; Erdős 949 remains unresolved here.
