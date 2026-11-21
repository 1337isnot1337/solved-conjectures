# Supplemental attribution audit: Han–Sabag–Kostina–Hassibi

**Counting correction, 21 November 2026:** Fang–Zhang–Zhao Conjecture 4.3 is excluded following the [confirmed earlier full disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex). After also excluding Gröchenig under the [checked September prior proof](../bounty-continuation-2026-11-21/grochenig-prior-resolution/), the pre-Han selection is eight strict families; adding the independently reviewed Han–Sabag–Kostina–Hassibi package gives nine. This correction changes no claim or credit concerning the Han package.

Review date: 21 November 2026. Reviewer: the current group's graph/number-theory worker.

**Verdict:** the package is a contemporaneous contribution of the parallel campaign, absent from the original repository catalogue and history. Its target is the explicit universal matrix assertion in the source's Conjecture 1. The proposed strict separation of infima would refute that whole assertion; it is not a positive result restricted to one parameter value or dimension.

This note supplements, and does not replace, the corrected selected eight-family attribution audit. It does not itself admit the package into that checkpoint. Additional mathematical and priority reviews are being handled separately. No remote files were changed in preparing this note.

## Admission update

The additional mathematical review passed at commit 2615371016744f9629cd6dea9e7e8f326fadf1d5, and the additional priority review passed within its documented scope at 77aef2d485251831095593045fedbf6095929ef8. Both are linked from the [current joint ledger](README.md), which admits this package as its ninth retained family. The conditional wording below preserves this audit's sequence of checks and the separate roles of the reviews.

## 1. Baseline absence

The original main head recorded by the parallel campaign is

```text
b50fa6e4f1d18ceee74d2500bd43faeca4f13208
```

I checked the exact baseline versions of:

| File | Blob SHA |
| --- | --- |
| [README.md](https://github.com/1337isnot1337/solved-conjectures/blob/b50fa6e4f1d18ceee74d2500bd43faeca4f13208/README.md) | `afa18f0a812f85446bc3836ecfe7b82871470a7b` |
| [CONTENTS.md](https://github.com/1337isnot1337/solved-conjectures/blob/b50fa6e4f1d18ceee74d2500bd43faeca4f13208/CONTENTS.md) | `438fb8b9abcc6feb764a4831dd9992c27a392a61` |
| [HISTORY.md](https://github.com/1337isnot1337/solved-conjectures/blob/b50fa6e4f1d18ceee74d2500bd43faeca4f13208/HISTORY.md) | `528c5961a5293e6b5e6c2a6477d5b1d706ecd8e9` |

There were no matches for the package path, the author combination, Kostina, Hassibi, Lyapunov, coded Kalman, the source identifier `2406.17196`, or the sparse-optimality target. The result was not present in the initial catalogue or its recorded history.

This baseline check concerns repository attribution. It does not replace a search for earlier work elsewhere, or claim that catalogue searching alone rules out every possible undocumented earlier file.

## 2. Issue and proof publication

The campaign coordination [issue 156](https://github.com/1337isnot1337/solved-conjectures/issues/156) was created at **2026-11-21T06:22:12Z**. Its opening body records a new campaign starting with no claimed resolutions and excludes earlier catalogue results and external issues 146–155.

The new target [issue 197](https://github.com/1337isnot1337/solved-conjectures/issues/197) was created at **2026-11-21T07:18:56Z**. It identifies the original Conjecture 1, gives the proposed exact strict-gap counterexample, and reports that independent review and priority checks are in progress.

The exact full-proof path is

```text
results/han-sabag-kostina-hassibi/PROOF.md
```

Its GitHub path history, requested with a page size of 100, contained one publication commit at this review:

| Field | Verified value |
| --- | --- |
| Earliest full-proof commit | [`e7d536adb9e0d5d87c2e8e2ec833539a2de48278`](https://github.com/1337isnot1337/solved-conjectures/commit/e7d536adb9e0d5d87c2e8e2ec833539a2de48278) |
| Author timestamp | `2026-11-21T07:24:31Z` |
| Committer timestamp | `2026-11-21T07:24:31Z` |
| Parent commit | `02db3e891157eec1229e0dcaa84434fa83a2e99c` |
| Proof blob reviewed | `6ad5c694761471f986f5f2080a0042ec797cd26c` |
| Publication message | Disprove Han–Sabag–Kostina–Hassibi's Lyapunov positivity conjecture |

The parent is the current group's Coulter–Do–Moskovsky audit update. Thus this proof publication belongs to the same interleaved main-branch campaign history. The baseline, issue chronology, and proof introduction support the parallel-group attribution; the current group should be credited for its additional review, not for originating the package.

## 3. Exact original assertion and scope

The source is Barron Han, Oron Sabag, Victoria Kostina and Babak Hassibi, *Coded Kalman Filtering over MIMO Gaussian Channels with Feedback*, [arXiv:2406.17196v2](https://arxiv.org/html/2406.17196v2), dated 5 August 2025. I read Conjecture 1 in both HTML and PDF and inspected the screenshot of printed page 6.

Equations (23)–(24) optimize the trace of a diagonal positive semidefinite power matrix, subject to a positive definite solution of the displayed Lyapunov equation. The encoder is an arbitrary real rectangular matrix. For each feasible choice of the fixed diagonal matrices, the conjecture asserts an optimizer with exactly one nonzero entry in each column. The printed feasible set imposes no additional encoder–power relation. The package uses positive, distinct diagonal entries of the stability matrix below one, so its witness also avoids any ambiguity about negative entries or uniqueness.

The proposed conclusion is a strict gap:

```math
P_{\mathrm{unrestricted}}
\le\frac{23825}{22491}
<\frac{481}{441}
=P_{\mathrm{sparse}},
\qquad
\frac{481}{441}-\frac{23825}{22491}
=\frac{706}{22491}>0.
```

The manuscript treats all four possible assignments in its two-source, two-channel instance, allowing arbitrary magnitudes and signs for every nonzero sparse encoder entry. Consequently, if its algebra passes the separate mathematical review, this is a counterexample to the universal sparse-optimality assertion itself. It excludes sparse minimizing sequences as well as attained sparse optima. The strict constraints cannot explain away the contradiction through nonattainment.

A single exact admissible counterexample suffices to refute a universal assertion. The manuscript's additional open interval of channel gains supplies a family of the same failure; it adds no separate result count. This is different from proving that the conjecture holds in one dimension, at one order, or on a sampled parameter range.

The source's scalar-source/scalar-channel results and its separate discussion of linear versus nonlinear communication codes are not the new target. The package expressly limits its claim to the displayed matrix conjecture. It does not claim to settle the general implementable-code stabilization problem or automatically negate every conditional communication theorem motivated by the conjecture.

## 4. Admission and counting boundary

The provenance and original-source scope pass this audit. Complete mathematical validation and the deeper priority assessment remain separate gates, with their own review documents. No worldwide novelty conclusion follows from the publication timestamps.

If the root worker admits this package after those reviews pass, it would add one parallel-group package and one distinct literal-source family. Relative to the existing selected checkpoint, the arithmetic would become:

```math
7+4=11\quad\text{retained reviewed packages},
\qquad
11-1=10\quad\text{literal-source packages},
\qquad
10-1=9\quad\text{named families}.
```

The subtractions would still remove corrected-source Novelli–Thibon from the strict tally and merge the two López Pouso–Segura packages. The joint ledger now records this admission after the explicit Fang–Zhang–Zhao and Gröchenig exclusions; the historical pre-admission audit retains its separate eight-family scope.

This file was prepared locally for possible atomic publication by the coordinating root worker. No remote issue comment or repository mutation was made for this supplemental audit.

