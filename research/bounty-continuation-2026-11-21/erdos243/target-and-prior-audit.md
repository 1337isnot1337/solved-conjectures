# Erdős 243: target, payment, and prior-work audit

21 November 2026. Research reservation: [issue 223, comment 7070549325](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070549325). No solution, formal verification, submission, acceptance, or payment is claimed.

## Exact target

For every strictly increasing sequence of positive integers satisfying

```math
\frac{a_{n+1}}{a_n^2}\longrightarrow1,
\qquad \sum_{n\ge1}\frac1{a_n}\in\mathbb Q,
```

must the recurrence

```math
a_{n+1}=a_n^2-a_n+1
```

hold for all sufficiently large indices? This is the full eventual-rigidity question, with no prescribed convergence rate or bounded-error hypothesis. The question concerns the boundary between rational and irrational rapidly convergent unit-fraction series; resolving only a chosen rate or a finite orbit does not resolve it.

The historical source is Erdős–Graham, *Old and New Problems and Results in Combinatorial Number Theory* (1980), p. 64. The downloaded [Erdős 1988 survey](https://users.renyi.hu/~p_erdos/1988-22.pdf), p. 105, discusses removing an additional least-common-multiple restriction. [Koizumi's published paper](https://math.colgate.edu/~integers/aa28/aa28.pdf), Question 1, states the exact growth-limit question and explicitly leaves it open. The arXiv version numbers that same question as Question 5; locators must not be mixed.

## Live direct-payment scope

The [Conjectures.io page](https://conjectures.io/problems/erdos243-erdos-243), opened on the audit date, displayed an estimated **$2,736**, no proof or counterexample attempts, and no published contributions. A full proof and a full refutation compete for one reward.

This is a direct solver reward in Subnet 66 Alpha, not a guaranteed dollar cash payment. The [FAQ](https://conjectures.io/faq) and [submission terms](https://conjectures.io/submission-terms), version 13 effective 11 November 2026, require the exact Lean target, original AI work logs, and reviewer approval. Verification, approval, and payment are separate states. The amount is dynamic until a submission quote is locked; prior public resolution can disqualify the target before acceptance. Recognized contributions may receive up to half of the eventual reward. No fee, account action, wallet action, log upload, or prize submission was made in this lane.

Pinned target identifiers:

| Field | Value |
|---|---|
| Task | `fc-v2-erdos243-erdos-243-3657ce0af32ce771d311f409-formalized` |
| Type SHA-256 | `c02a0aba123879a2d3528458728b4b61afc85f63bc046b43fd0a71a4c419a6e1` |
| Commitment | `2611a196f2277c45a2e4d1bacfc0114ef1c13614368d4480254620c60fad384c` |
| Source revision | `7d1a8c9912747679d0093f6d1216420c33ee5ffa` |

The [pinned source](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/243.lean) uses `Summable ((1 : ℚ) / a ·)`. Thus rational convergence is present; the shortened display is not merely a real-summability hypothesis. Its zero-based natural-number convention permits an initial zero, with Lean's inverse-zero convention. Removing that finite prefix gives the positive-integer question, and eventual conclusions are unchanged.

## Prior results checked

| Primary source | Exact scope relevant here |
|---|---|
| [Duverney 2001](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms080206.pdf), Corollary 3.2, printed p. 287 | A signed-series convergence condition on the successive quadratic ratios gives eventual recurrence. The original conjecture assumes only convergence of the individual ratios. The full PDF was downloaded and the theorem/proof passages were read; this audit does not independently certify every theorem in that paper. |
| [Koizumi 2026, *Integers* 26, A28](https://math.colgate.edu/~integers/aa28/aa28.pdf), second part | Exact rational pseudo-greedy dynamics, zero-gap absorption, equivalence to the unrestricted conjecture, and earlier one-sided criteria. Its initial paper was arXiv:2504.05933 in April 2025; the published version appeared in February 2026. |
| [Bado, September 2026 preprint](https://www.researchgate.net/publication/413940355_Prime-Support_Rigidity_and_Primitive_Pseudo-Greedy_Dynamics_Partial_Progress_on_Erdos_Problem_243), DOI 10.13140/RG.2.2.36612.08325 | Finite prime-support exclusion, bounded integer-gap termination, LCM redundancy, and density-one fresh denominator factors. The author-uploaded full text was read through its LCM dynamics. It explicitly claims only partial results. The site's PDF download link returned 404; no local PDF receipt is asserted. |
| [Cook, September 2026 manuscript](https://wcook04.github.io/practical-formal-verification/maths/papers/erdos-243-reciprocal-tail-rigidity.html) | Bounded numerator increases, summable relative increases, a weighted LCM-record criterion, and restricted regular-rate results. The full current TeX was downloaded. Its arithmetic compatibility and record-budget sections explicitly identify unproved obligations. No claim of unrestricted resolution is made. |
| [White with Claude, August 2026 working report](https://erdosproblemaday.com/report/243) | Arbitrarily long constant nonzero gap transients followed by exact zero gaps. These are admissible eventual-Sylvester sequences and defeat fixed-window arguments; they are not counterexamples. The report is unrefereed and explicitly partial. |
| [Barreto–Kang–Kim–Kovač–Zhang, arXiv:2601.21442v3](https://arxiv.org/abs/2601.21442) | Resolves a different rapidly convergent series problem involving products of successive denominators and golden-ratio growth. Its stated result does not settle this rational-tail boundary question. |

Searches used the exact problem number with proof, disproof, resolution, and 2026 terms; the exact pseudo-greedy wording; Koizumi's title; and rationality of Ahmes series. The current catalogue, the formal-conjectures issue recording Koizumi's corollaries, author manuscripts, and recent public working reports were compared. No exact full prior resolution was located. This is a bounded source audit, not proof that no undiscovered prior result exists.

The repository search found no separate E243 research lane before this reservation. Earlier E624 and E949 leads were rejected before reservation because E624 was already accepted/paid and E949 was already covered in this campaign.

## Attack and current boundary

The attempted route is arithmetic descent in **reduced** rational tails. The [companion note](reduced-tail-cancellation-gap.md) derives the exact cancellation factor, gives a uniform local example showing why small relative gaps do not prevent large cancellation, and states the remaining all-index requirement. These calculations do not supply the missing global descent. The coordinator is independently checking the LCM-record route, with Cook and Bado credited as prior work.

Downloaded source bytes and SHA-256 hashes are listed in [source-manifest.json](source-manifest.json). This lane currently adds zero completed bounty problems.
