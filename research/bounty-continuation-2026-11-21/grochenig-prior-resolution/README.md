# Gröchenig upper-density counterexample: prior-resolution correction

Audit date: 21 November 2026. This is a correction to the repository's prior-art classification, not a new mathematical solution or a paid-target completion.

## Decision

The upper-density assertion of Gröchenig's Problem 4.12 had already been refuted by an earlier public manuscript. Alexanja Senke's public v2, dated 30 September 2026, proves a strictly stronger upper-density counterexample in Theorem 1.3 and Section 3. Two independent reviewers and root read and checked that argument against the original problem. No gap was found.

For every positive integer $`Q`$, the earlier proof constructs a real, nowhere-zero sequence $`c\in\ell^1(\mathbb Z)`$ such that

```math
\mathop{\mathrm{sgn}}(c_k)=(-1)^{\lfloor k/Q\rfloor},\qquad
D^-(c)=D^+(c)=1/Q,\qquad
D^+(Z(f))=\infty,
```

where $`f(x)=\sum_{k\in\mathbb Z}c_k\exp(-\pi(x-k)^2)`$. Taking $`Q=2`$ settles the same upper assertion as the repository's construction, which has $`D^+(c)=1/2`$ and $`D^+(Z(f))\ge1`$. The different support of the coefficient sequence does not leave an open statement in the original problem.

The prior source is [pinned manuscript commit 66bfb67](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density/blob/66bfb67ebb919ad6e8c373beb190cfa0144bd84f/paper/main.tex). GitHub reports its signature as valid and verified on 30 September 2026. The author's [research atlas](https://interlink-bridge.com/research-atlas.html) identifies it as the open public v2 release. The current repository visibility is not, by itself, a complete historical visibility record; the signed source, indexed release, and stated publication date are the combined priority evidence. The inaccessible restricted August version is not used.

## Evidence

- [Priority and exact-statement audit](PRIORITY.md).
- [Separate mathematical reconstruction](MATHEMATICAL_REVIEW.md), including a precise density estimate in place of the manuscript's imprecise asymptotic arrow.
- [Direct-payment eligibility audit](ELIGIBILITY.md) and [official JSP catalog screen](grochenig-jsp-target-screen.json).
- [Coordination and correction in issue 191](https://github.com/1337isnot1337/solved-conjectures/issues/191#issuecomment-7067773385).

Root independently checked the finite positive-root product expansion, sign alignment, summable coefficient budget, simultaneous two-sided separation conditions, preservation of bracket signs, and divergent zero-to-window-length ratio. The entire extension follows from absolute local uniform convergence. These steps establish the upper counterexample without relying on the other theorems in the manuscript.

Neither this correction nor the mathematical review certifies Senke's separate lower-density construction or central-dominance theorem. The repository's earlier upper counterexample was mathematically valid; its classification as a new resolution was incorrect. The earlier bounded searches failed to locate the September source.

## Repository handling and accounting

The repository's `AGENTS.md` collection rule requires excluding a named result when an earlier proof settles its exact assertion. The active result directory, duplicate writeups, result-index entries, and active verifier references are therefore removed in the coordinated correction. Distinct results and reused general modules must remain intact. This audit stays as the correction record.

The independent analytic construction is preserved at [first proof commit d707c6a](https://github.com/1337isnot1337/solved-conjectures/commit/d707c6a032f7210ac8d5e957bfc77c5b00fcaa3f). The completed Lean work and its verification receipts are preserved at [commit 628270dc](https://github.com/1337isnot1337/solved-conjectures/commit/628270dc5e07d7924de265d2ac1beee4b5634b80). This review did not rerun that complete Lean build and does not attribute it to the paid-target continuation.

No exact direct-to-solver bounty for this statement or its formalization was verified. Mathematical correctness, novelty, formal verification, sponsor eligibility, and payment are separate questions. This finding changes none of the continuation's accounting: **zero full paid targets solved, zero submissions, zero accepted awards, zero payments**. It must not be included in the requested ten.
