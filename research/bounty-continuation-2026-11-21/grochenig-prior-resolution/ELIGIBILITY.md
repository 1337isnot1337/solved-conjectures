# Gröchenig Problem 4.12: bounty eligibility audit

Audit date: 21 November 2026. This audit concerns only whether repository commit
`628270dc5e07d7924de265d2ac1beee4b5634b80` supplies a new completion of a live,
direct-to-solver paid target. It does not independently replay the Lean package.

## Accounting decision

**Do not add this result to the completed paid-target count.** No exact live
cash or cryptocurrency offer for this target or its Lean formalization was
verified. The new commit formalizes an analytic counterexample already present
in the repository. A separately located public manuscript also claims an earlier,
stronger counterexample; its mathematical and priority review is being handled
by the other campaign reviewers.

This is a finding about the inspected evidence. It is not a claim that no
unindexed offer could exist anywhere.

## Exact mathematical target and change in this commit

The [primary paper](https://link.springer.com/article/10.1007/s44146-026-00264-3),
Karlheinz Gröchenig, *Infinite totally positive matrices: some open problems*,
states Problem 4.12 in Section 4.3. It asks both corresponding upper and lower
Beurling-density inequalities for zeros of bounded-coefficient Pólya frequency
shift sums. The paper was published on 17 August 2026.

The [new pinned README](https://github.com/1337isnot1337/solved-conjectures/blob/628270dc5e07d7924de265d2ac1beee4b5634b80/results/grochenig-zero-density/README.md)
claims a nonzero Gaussian shift sum with absolutely summable real coefficients
and

```math
D^+(Z(f))\ge 1>\tfrac12=D^+(c).
```

A single such example refutes the universal upper assertion. This is an infinite
analytic counterexample, not a finite numerical case. It does not by itself
settle the separate lower assertion.

The [parent-commit README](https://github.com/1337isnot1337/solved-conjectures/blob/354194a7a1447ed7b9446046f471565a2190b719/results/grochenig-zero-density/README.md)
already states precisely this counterexample, supplies the analytic proof and
reviews, and explicitly says it has no Lean verification. Therefore commit
628270dc adds formalization and verification evidence to an existing result;
it is not a new mathematical solution discovered in this paid-target campaign.
Whether its exact Lean endpoints faithfully prove the stated result is a
separate technical audit.

## Direct-pay evidence checked

| Source | Exact check | Result |
|---|---|---|
| Gröchenig primary paper, Section 4.3 and Problem 4.12 | Read the problem statement; searched the full HTML for prize and reward | No reward offer located. |
| Pinned repository README and SOURCES.md | Read the result scope, source audit and source links | No named sponsor, amount or award terms. |
| [Issue 191](https://github.com/1337isnot1337/solved-conjectures/issues/191) and its eight returned comments | Checked for bounty, reward, prize, award, payment and paid terms | No such offer located. |
| [Official Justin Sun Prize problems index](https://github.com/TheJustinSunPrize/awards/tree/main/problems) | Read the current index, all eleven catalog files covering JSP-000001 through JSP-001022, and the MathDB pilot; searched only this target's names and terminology | No matching entry for this target. |
| Official JSP code and issue search | Both Gröchenig and Grochenig, scoped to TheJustinSunPrize/awards | No matching result. |
| Targeted public web search | Author with bounty, reward, prize, Problem 4.12 and Justin Sun; exact paper title with reward; sign-change density with prize; conjectures.io with totally positive | No exact sponsor offer located. |

The catalog scan used author spelling variants, the source DOI suffix,
the phrase totally positive, Beurling, and sign-change density combinations.
Two loose numeric substring matches concerned unrelated Fibonacci and polynomial
papers; neither was a target match. The current retrieved catalog paths, sizes,
advertised blob SHAs and raw match excerpts are recorded in
[grochenig-jsp-target-screen.json](grochenig-jsp-target-screen.json).
This was an exact-target eligibility check, not a new broad candidate screen.

The [JSP selection rules](https://www.hejustinsun.com/prize/rules) describe a
curated problem list, separate solver and formalizer shares, and committee
adjudication. Complete Lean verification is an entry condition; it does not
itself establish a particular prize amount, priority entitlement or payout.
No JSP identifier for this mathematical target was found. An assumed future
nomination cannot be treated as an existing offer.

## The Interlink lead is prior-art evidence

The other reviewer found
[Alexanja Senke's pinned manuscript](https://github.com/interlink-Bridge/groechenig-problem-4-12-gaussian-density/blob/66bfb67ebb919ad6e8c373beb190cfa0144bd84f/paper/main.tex).
I independently fetched this TeX source. Its title identifies Gröchenig
Problem 4.12, and its date field is Version 2.0, 30 September 2026. Its abstract
claims, for every positive integer Q, an absolutely summable coefficient
sequence with coefficient sign-change densities 1/Q and infinite upper
zero density. That would already refute the same upper assertion.

No reward, bounty, prize or payment terms occur in that TeX source. The document
itself does not claim external certification or worldwide priority. Its printed
date alone is not a verified public-release timestamp, and this eligibility audit
does not replace the independent proof and historical audit now underway.
It does establish a concrete earlier-dated, exact-scope prior-art lead that the
repository's prior audit must address.

## Consequence

The new Lean artifact may have formalization value. The inspected evidence
does not support any increment to the user's requested count of newly completed,
eligible paid mathematical targets. No claim, submission or financial action
was made.

