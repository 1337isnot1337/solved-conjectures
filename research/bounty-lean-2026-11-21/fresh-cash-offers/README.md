# Fresh cash-offer audit

Checked 2026-11-21. This is a bounded source audit, not a list of solved problems.
No result in this directory is a mathematical solution or a bounty claim.

The search sought mathematical offers posted or updated in 2026 that pay the
solver directly. It excluded donations in a solver's name, reputation points,
expired or closed offers, numerical records, incremental score competitions, and
prizes available only through contest placement. Previously audited providers
were not screened again.

## Outcome

The Proximity Prize is a current institutional research award with two full
mathematical challenges. It is not a guaranteed fixed payment for solving one
problem. No tractable route to a complete resolution was identified in this
screen. The other promising small offers checked against their sponsors are
closed, resolved, discontinued, or excluded by the user's payment requirement.
The bounded catalogue search stops here.

| Lead | Primary-source finding | Decision |
| --- | --- | --- |
| Ethereum Foundation, Proximity Prize | Current 2026 companion paper; a $1,000,000 award pool; two full Reed–Solomon challenges; deadline 2027-12-31. The program's terms make awards discretionary. | A genuine direct-award program; no full mathematical attack identified in this screen. |
| Proximity Prize companion at better.codes | The main sponsor describes it as a continuously scored challenge for improvements in verified bounds. | Excluded as an incremental score competition. |
| Danupon Nanongkai, cut-query reachability, €110 | Sponsor marks the target solved and reports approximately $`n^{1.5}`$ query proofs. | Closed; do not solve or claim anew. |
| Nanongkai, €5 questions | Sponsor explicitly discontinued the questions. | Closed. |
| Let's Prove Goldbach, problem 2, €100 | Sponsor says multiple solutions are under review and no more are accepted. | Not currently claimable. |
| Let's Prove Goldbach, problem 3, €200 | Same closed-submission notice. | Not currently claimable. |
| William Hager, reverse-Markov prize, ¥10,000 | Sponsor's current page states that Xiang-Sheng Wang solved it on 2017-10-13. The old prize PDF remains online. | Previously resolved. |
| Clark Kimberling rewards | The linked catalogue records that post-2025 rewards go to OEIS in the solver's name; this is consistent with the campaign's earlier primary-source exclusion. | Excluded donation; not re-audited as a new offer. |

## Proximity Prize: exact target pointers and limits

The [official challenge page](https://proximityprize.org/) links the companion
paper by Gal Arnon, Dan Boneh, and Giacomo Fenzi,
[Open Problems in List Decoding and Correlated Agreement](https://eprint.iacr.org/2026/680).
The archive records receipt on 2026-04-07 and its latest listed revision on
2026-07-06. It describes the paper as a preprint surveying the relevant open
problems and known results.

For a Reed–Solomon code $`\mathcal C=\operatorname{RS}[\mathbb F,\mathcal L,k]`$
on a smooth evaluation domain, the official page restricts the rate to
$`\{1/2,1/4,1/8,1/16\}`$. Its two grand challenges ask for the largest admissible
normalized radius $`\delta^*_{\mathcal C}`$ for a specified small error threshold
$`\varepsilon^*`$, such as $`2^{-128}`$:

```math
\varepsilon_{\mathrm{mca}}(\mathcal C,\delta^*_{\mathcal C})
\leq \varepsilon^*,
```

and, for the list-decoding challenge and a constant $`m`$,

```math
|\Lambda(\mathcal C^{\equiv m},\delta^*_{\mathcal C})|
\leq \varepsilon^* |\mathbb F|.
```

The paper supplies the definitions and quantifiers. Its PDF returned HTTP 403
to this browsing session, so this note does not pretend to reconstruct those
definitions or certify a new proof target from the abbreviated webpage. The
official page calls the statements preliminary. There was no mathematical
submission, proof search, or claim of resolution in this screen.

The [program terms](https://proximityprize.org/terms/) require an eligible adult
participant, prior acceptance after scientific peer review, public publication,
accurate attribution and AI disclosure, and human responsibility for the proof.
Scientific acceptance, formal verification, and timestamp priority do not by
themselves establish a right to payment. The foundation chooses the recipients
and allocation; payment requires its written award notice and the stated
conditions. Awards go to authors rather than to a charity. The listed submission
channel is email; no email was sent.

## Primary exclusions

### Nanongkai

[Current sponsor page](https://sites.google.com/site/dannanongkai/open).
The reachability question concerns a hidden unweighted directed graph and an
oracle returning the number of outgoing edges of a queried vertex set. The
€110 target asked for an $`O(n^{1.999})`$ algorithm or a lower bound excluding
$`O(n^{1.001})`$. The page now marks it solved. Its €5 improvement and
description-length questions are explicitly discontinued. The remaining OMv
and hinted-Mv offers are older established hard conjectures, not new tractable
2026 offers from this screen.

### Let's Prove Goldbach

[Current sponsor prize page](https://www.dimostriamogoldbach.it/en/prizes/).
Problem 2 asks for a restricted-form uniform approximation to the position of
the $`x`$th positive integer divisible by none of three given integers.
Problem 3 asks for a finite arithmetic representation of integers avoiding a
given list of divisors while immediately preceding a multiple of the first.
Both entries now refuse further submissions while multiple solutions undergo
review. The payment description is a bank transfer to the accepted first
solver, but that does not reopen the questions.

### Hager

[Current author page](https://people.clas.ufl.edu/hager/papers-and-software/)
states the prior solution and date. The
[old prize PDF](https://people.clas.ufl.edu/hager/files/prize.pdf) is dated
2015-09-02. Its conjecture bounds values of a polynomial vanishing at $`-1`$
when its derivative is bounded at Gauss or Radau nodes. The old PDF's continued
availability is not evidence of an open bounty. No re-proof was pursued.

## Search method and reproducibility

Discovery used public web search for 2026 mathematical cash offers, including
MathOverflow author offers, researcher pages, and institution-backed prizes.
Searches combined the year with terms such as `conjecture`, `cash prize`,
`reward`, `I offer`, and `monetary`. Follow-up searches used exact author and
problem names. A MathOverflow reputation bounty is not a cash payment.

The [Prize Problem Ledger](https://prizeproblems.org/) was used only to find
primary links. Its July 2026 snapshot contains stale entries: the Nanongkai,
Goldbach-project, and Hager leads above differ materially from current sponsor
pages. A catalogue's `verified open` label was therefore insufficient for
eligibility. Search-engine crawl dates were not treated as offer dates.

The accompanying `source-audit.json` records the source locators and decisions.
The Nanongkai, Hager, and Goldbach-project exclusions independently reproduce
the other-bounties lane's earlier
[coordination comment](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7066126107);
they are not new campaign findings or additional completed targets.
Absence of a candidate in this bounded search is not a claim that no other
direct-pay mathematical offer exists.
