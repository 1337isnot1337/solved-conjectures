# Lonely Runner — inserting two speeds into tight families

**The general conjecture remains open.** Start with any of the Goddyn–Wong simultaneous accelerations of the consecutive speeds $1,\ldots,p-1$, with $p\ge3$. Adjoin any two positive integer speeds. There is a time between $1/(p+2)$ and $1/p$ at which all the speeds are at least $1/(p+2)$ from the nearest integer after multiplication by that time. The two added speeds can be arbitrarily large. A three-speed example shows the limit of this prescribed-interval method. [Proof](PROOF.md) · [Goddyn and Wong, Theorems 2.3 and 3.1](https://www.sfu.ca/~goddyn/Papers/063tight_lonely_runner.pdf)

Run `python3 two_additions.py`. The verifier exhausts the finite cases left by the analytic bound using rational endpoints. It also checks the three-speed obstruction. The argument is unrefereed; no priority claim is made.

## Lean verification

The complete statement in [the proof note](PROOF.md) is Lean-verified.
The proof includes every `p ≥ 3`, both arbitrary positive inserted speeds,
the measure and divisibility arguments, all eight small-parameter
certificates and their proved finite bounds, the Goddyn–Wong arithmetic
criterion, and the common-dilation value bound. The dilation statement is a
bound on the supremum over times; it does not impose the original fixed
interval on the dilated tuple.

The three-insertion obstruction is checked for the literal speeds
`[4,6,10]` throughout `[1/6,1/3]`, where their clearance is at most
`1/7`. The ordinary five-speed tuple `[1,2,4,6,10]` has a checked witness
at `3/8`.

The [exact 27-module gate](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44524198858/job/135562276051)
passed fresh strict source checks, an all-owned declaration audit including
private declarations, and stock-kernel replay of every module.
[Scope and endpoints](../../docs/lean-status.md#complete-unrestricted-two-speed-insertion-theorem) ·
[Raw receipt](../../docs/verification/two-insertions-exact-44524198858/receipt.json) ·
[Verification details](../../docs/two-insertion-component-verification.md).

From the repository root, after installing the pinned Lean toolchain and
Mathlib cache, reproduce the exact component gate with:

```sh
python3 scripts/verify_two_insertions_exact.py
```
