# Erdős 873: target, payment, and prior-work audit

Checked 21 November 2026. This lane is reserved in [campaign issue 223, comment 7070786695](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070786695). No complete solution or award is claimed.

## Exact paid target

The live [Conjectures.io task](https://conjectures.io/problems/erdos873-erdos-873) displayed an estimated US$2,529 and no attempts or contributions at the check. The displayed dollar value is a variable estimate of token payment, not a guaranteed cash award. The [FAQ](https://conjectures.io/faq) and [submission terms](https://conjectures.io/submission-terms) govern the direct payment to an accepted solver, proof and log review, prior-work eligibility, and any contribution allocation. No submission, fee payment, or account action was performed.

| Field | Pinned value |
| --- | --- |
| Task ID | `fc-v2-erdos873-erdos-873-abbd104d8bb85620eb513d77-formalized` |
| Type SHA-256 | `f65bfe32e4ca49963d561bbe51dc02312f9b260863cd7537acd49d813914419c` |
| Commitment | `66699f5ab0de5021224a06095e986b36edc60f5808e5a0b04ce7d52cb3b02576` |
| Formal source revision | `7d1a8c9912747679d0093f6d1216420c33ee5ffa` |

For a strictly increasing sequence of positive integers, define

```math
F(a,X,k)=\#\{i:\mathop{\mathrm{lcm}}(a_i,\ldots,a_{i+k-1})\lt X\}.
```

The full question is whether, for every such sequence and every $`\varepsilon>0`$, some $`k`$ satisfies

```math
F(a,X,k)\lt X^\varepsilon\quad\text{for all }X>0.
```

The window length may depend on both the sequence and the exponent. The strict inequalities and the all-scale quantifier are those of the [pinned Lean statement](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/873.lean). Resolving a fixed window length or a restricted exponent range would not resolve this task.

## Primary sources and later partial results

1. **Original statement.** Erdős, [*Some of my forgotten problems in number theory*](https://hrj.episciences.org/125/pdf), Hardy–Ramanujan Journal 15 (1992), 34–50, printed pages 47–48, gives the LCM-window question. The source was downloaded and the page containing the exponent statement was visually checked. Its cited three-term estimate and proposed lower-bound examples do not settle the arbitrary-positive-exponent question.

2. **Divisor estimates.** Letendre, [*Divisors of an Integer in a Short Interval*](https://arxiv.org/html/2503.12146v1), arXiv:2503.12146v1, 15 March 2025, explicitly states a bounded-divisor conjecture near a square root and a conjecture for other fixed power scales. The introduction, theorem statements, valuation lemma, relevant proposition, and final discussion were read. The proved estimates have a different scope from those conjectures; in particular, an estimate involving a power of the total divisor count is not a uniform constant bound. This audit does not certify every proof in that paper.

3. **April partial range.** The hosted [*A Note on the Erdős–Szemerédi LCM-Window Problem for Exponents Greater Than 1/4*](https://althofer.de/on-erdos_873-based-on-letendre.pdf), marked repaired 30 April 2026, was read. It derives the range $`\varepsilon>1/4`$ using short-divisor estimates and packing. Its title and proof do not claim all positive exponents.

4. **July working report.** The [Erdős Problem a Day report 873](https://www.erdosproblemaday.com/report/873) was read, including its quantitative window estimates and Section 5 conditional divisor-cluster route. Its exponents tend to $`1/4`$. Its stated sufficient uniform divisor-cluster condition remains unproved there. These packing and conditional-reduction ideas are prior work, not new results of this lane.

5. **Later status checks.** The [current problem index](https://www.erdosproblems.com/873) and [October status entry](https://erdosproblems.ai/wiki/problems/integer_sequences/E0873), plus targeted searches for later resolutions and the exact platform task, did not identify a full proof or counterexample. The later formalized three-term supplement described by the status entry is a restricted-window result. Its Lean build was not independently rebuilt in this audit. A status label or an unsuccessful search is not proof that no prior result exists.

Repository issue search and local campaign search found no existing full E873 research lane before the reservation. Searches for the exact LCM-window/Ruzsa equivalence did not locate an explicit complete equivalence in the checked sources. No novelty assertion follows from that search.

## Current mathematical work

The companion [window–divisor equivalence note](window-divisor-equivalence.md) gives a proposed proof that the full sequence statement is equivalent to uniform boundedness of divisors in every relative interval of width $`L^{-\delta}`$, and hence to the full square-root divisor conjecture recorded as Erdős 886. The reverse sequence implication uses separated dilations of increasingly large divisor clusters inside one infinite sequence. The square-root reduction replaces $`L`$ by an explicitly constructed integer between $`L^4`$ and $`2L^6`$ and loses a fixed factor in the exponent.

This is a reduction between full open targets. It proves neither uniform divisor boundedness nor its negation. The full E873 task remains unresolved and contributes zero completed bounty problems.

## Source integrity

The downloaded source hashes and exact URLs are in [source-manifest.json](source-manifest.json). The principal source bytes are pinned as follows.

| Local source | SHA-256 |
| --- | --- |
| `erdos-1992.pdf` | `51faf4558eacab8e188efbcb028937f75dcb10d37865ab71ef1522df33361c72` |
| `letendre-2025.html` | `c9d0ec488d425cd4f1bd9031d4283c1f28af629a10dcd066875e647bcf1c0133` |
| `pinned-873.lean` | `67b0ace4ed365702a47ab50c55341105630e7ae9f57d0b7f419dcc8c5061c7aa` |
| `althofer-2026.pdf` | `00976e0d544578853c1e72f90a56d74323e8d6d08e1d3e586c1583acd42323d5` |

The source filenames are evidence records, not assertions that these materials originated in this campaign. The authored equivalence has not been Lean-verified.
