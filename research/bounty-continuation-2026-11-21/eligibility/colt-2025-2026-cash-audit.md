# COLT 2025 and 2026: direct-cash eligibility audit

Checked on 2026-11-21. This is an eligibility screen, not a mathematical result or a claim that every listed question remains open.

## Result

The ten specified open-problem papers supply no qualifying cash offer payable to a solver. The ALS paper explicitly directs its monetary reward to medical research and offers coffee to the authors of an improvement. The other nine papers contain no explicit cash offer. A bounded search for separate offers did not establish one.

The 2026 one-bit mean-estimation question also has a subsequent primary author announcement of a full resolution. None of these ten papers is reserved as a paid target in this campaign, and this screen adds **zero** completed targets.

The absence of an offer in a paper does not prove that no separate offer exists. Such a primary offer could reopen eligibility for a still-unresolved question. No theorem work was pursued on the strength of an open-problem title alone.

## 2026 papers

| Primary paper | Cash evidence and decision |
| --- | --- |
| [Lau–Scarlett: Is Interaction Necessary for Order-Optimal 1-bit Mean Estimation?](https://proceedings.mlr.press/v336/lau26a.html) | No cash clause in the six-page primary paper. In addition, the authors' September 8 paper announces a nonadaptive protocol attaining the adaptive minimax rate for every moment exponent greater than one. Excluded from a newly open target. |
| [Arvanitakis–Srinivas–Vijayaraghavan: alternating least squares](https://proceedings.mlr.press/v336/arvanitakis26a.html) | The explicit prize paragraph on PDF page 4 promises up to $300 **to research treating amyotrophic lateral sclerosis** as the upper/lower exponent gap closes. The first authors publishing an improvement receive coffee. The monetary beneficiary is not the solver. Excluded under the direct-payment requirement. |
| [Balcan–Pegden–Sharma: piecewise-Lipschitz functions](https://proceedings.mlr.press/v336/balcan26a.html) | No cash clause in the six-page paper. The root-anticoncentration and Pfaffian questions are mathematical questions, but no qualifying offer was established. |
| [Feldman–Kamath–Srebro: distribution dependence of deep learning's advantage](https://proceedings.mlr.press/v336/feldman26a.html) | No cash clause in the six-page paper. Sections 2–4 state the SGD/dimension-complexity and SQ/dimension-complexity questions and relaxations. No qualifying offer was established. |
| [Nissim–Stemmer–Tsfadia: private PAC learning](https://proceedings.mlr.press/v336/nissim26a.html) | No cash clause in the seven-page paper. Section 2 asks for a sample-complexity characterization and for finite class sequences exhibiting a large privacy overhead. No qualifying offer was established. |

### The one-bit question has a prior resolution announcement

The [original author page](https://ivanphlau.github.io/publication/1_bit_mean_est_open_problem/) links the June 2026 open problem. The [subsequent author page](https://ivanphlau.github.io/publication/nonadaptive_1bit_mean_est/) is dated September 8, 2026 and identifies Ivan Lau and Jonathan Scarlett's *Non-Adaptive 1-Bit Mean Estimation: Minimax Rates and the Sample-Interval Tradeoff*.

The later abstract matches the original scope: an unknown distribution with mean in a prescribed bounded interval, a prescribed bound on its central moment of any fixed order greater than one, and one nonadaptively chosen bit per independent sample. It explicitly announces the adaptive minimax sample rate without interaction and mentions concurrent resolutions. This audit checked the correspondence of the announced statements; it did not independently reprove the later paper. There is no basis for treating the original question as a new campaign solution.

## 2025 papers

All five five-page primary PDFs were obtained from the publisher-linked repository, validated as PDFs, and extracted in full. The main closing sections were also read directly.

| Primary paper | Cash evidence and decision |
| --- | --- |
| [Froese–Grillo–Hertrich–Skutella: fixed-parameter tractability of zonotope problems](https://proceedings.mlr.press/v291/froese25b.html) | No explicit solver cash offer in the paper. No qualifying separate offer was established. |
| [Gu: structure-agnostic minimax risk for the partial linear model](https://proceedings.mlr.press/v291/gu25b.html) | No explicit solver cash offer in the paper. No qualifying separate offer was established. |
| [Hanneke–Moran–Shlimovich–Yehudayoff: data selection for regression](https://proceedings.mlr.press/v291/hanneke25e.html) | No explicit solver cash offer in the paper. No qualifying separate offer was established. |
| [Maiti: instance-dependent sample complexity for a Nash equilibrium](https://proceedings.mlr.press/v291/maiti25b.html) | No explicit solver cash offer in the paper. The occurrences of “reward” concern matrix-game payoffs. No qualifying separate offer was established. |
| [Genalti–Metelli: heavy-tailed bandits with unknown distributional parameters](https://proceedings.mlr.press/v291/genalti25a.html) | No explicit solver cash offer in the paper. The occurrences of “reward” concern bandit observations. No qualifying separate offer was established. |

No comprehensive subsequent-literature audit was performed for these five questions: without evidence of a direct-pay offer, they were not selected for proof work. Their current mathematical status must not be inferred from this table.

## Reproducible source checks

The publisher indices are [PMLR volume 336](https://proceedings.mlr.press/v336/) and [PMLR volume 291](https://proceedings.mlr.press/v291/). Each paper page links its primary PDF at `https://raw.githubusercontent.com/mlresearch/vVOLUME/main/assets/KEY/KEY.pdf`.

All ten PDF files were downloaded with local `curl`, validated with `pdfinfo`, and extracted using `pdftotext -layout`. Full extracted texts were checked for prize/reward/bounty/cash/dollar/euro/donation terms and currency symbols. The ALS prize paragraph was additionally inspected in a rendered image. The title-specific reward searches returned the publications and related records, not a separate primary cash offer. A negative search result is recorded only as a limit of this screen.

| PDF key | Pages | SHA-256 of downloaded primary PDF |
| --- | ---: | --- |
| `lau26a` | 6 | `a3b45f5c6ad62b832dd622cddba9ffa50999dc2b721397a345f8181c5bdcb01c` |
| `arvanitakis26a` | 6 | `0db537f1500b91ad8f7f8b45dcb6c433eca4693a2a217e652d4420688083b669` |
| `balcan26a` | 6 | `3f5e02e88702068d4eed1fe809095114ced50a87a4078f15d4c31c45770e4913` |
| `feldman26a` | 6 | `4ffb9efc67addb7e3cade9b73f8d4f0441c5d3538ddca07643c331be876b6d70` |
| `nissim26a` | 7 | `da24d2070b1757154ccb6ad8dc7efd6b2f107fd64b117bd6e852bbb2237a92b5` |
| `froese25b` | 5 | `0bcd7954c36ea0d5b4cccc431ed62e6d9e9167ee9789bd8afbb9aec05c6e62e3` |
| `gu25b` | 5 | `72a96e3352b728f6696f00260082097c441b4cd012327dbaa022e207bce17e0b` |
| `hanneke25e` | 5 | `89830a72359785f2d714b51028be11ed6e0b13be4267aa65dc2b75b03b0e553a` |
| `maiti25b` | 5 | `c139cf2e5da13df4e84e48ca1ea1a493e7b4cf7e972949d844bd0355ab7de2bf` |
| `genalti25a` | 5 | `9a46a5474a260084df9e37d58c36ad75becdc1ff00c1a211b8f6488d26667d6c` |

The downloaded papers, extracted texts, and rendered page are research intermediates. The campaign publication should contain this audit and primary links, not redistribute the source papers.

## Stopping point

This specific 2025/2026 COLT screen is complete. No paid full target survived it. Continue with another explicit sponsor offer rather than reinterpret one of these unpaid questions as a bounty or attempt a known theorem solely because a formalization board offers money.
