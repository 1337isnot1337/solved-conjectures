# A false positive in the unmodified power-quotient reduction

Date: 21 November 2026. Coordination:
[issue 229](https://github.com/1337isnot1337/solved-conjectures/issues/229).

This is an obstruction to a proposed reduction. It does not settle Shallit's
paid integer-divisibility problem.

## Exact source and attempted extension

Endrullis, Shallit and Smith, *Undecidability and Finite Automata*,
[arXiv:1702.01394v2](https://arxiv.org/abs/1702.01394v2), prove undecidability
for accepting a quotient that is a power of the representation base.
Their construction uses a length-preserving rewriting system, an initial
letter `a`, a terminal letter `b`, delimiter `d`, and padding `c`.
An accepting power quotient synchronizes an initial block of length `i`
with a final block of length `j`.

It is invalid to reuse this automaton unchanged and replace “power of the
base” by “integer.” The following exact example shows the failure already
for the empty rewriting system.

## Explicit witness

Use base 4 and the digit assignment

| Symbol | Digit |
| --- | ---: |
| padding c | 0 |
| initial a | 1 |
| terminal b | 2 |
| delimiter d | 3 |

With no rewrite rules, the middle repeated rewriting block is empty.
The remaining accepted paired words have the form

```
top:    3 1^i 3 0^(j+1)
bottom: 0^(i+1) 3 2^j 3
```

Here powers denote repetition of a digit, not exponentiation of its value.
Take `i=13` and `j=1`. Direct base conversion gives

```math
Q=14{,}316{,}557{,}680,
\qquad P=59,
\qquad Q=242{,}653{,}520\,P.
```

The quotient is an integer. It is not a power of 4, since

```math
242{,}653{,}520=16\cdot15{,}165{,}845
```

and the second factor is odd and greater than one.

The associated rewriting instance is negative: with an empty rule set
the reflexive transitive rewrite relation is equality, and `a^n≠b^n`
for every positive `n` because `a≠b`. The original power-quotient
reduction has no accepting power witness in this case. Its putative
integer-quotient extension nevertheless returns yes.

## Infinitely many false positives in this same automaton

Keep `j=1` and let `i=13+29t` for any nonnegative integer `t`.
The value of the top core is

```math
[3\,1^i\,3]_4
=\frac{5(2\cdot4^{i+1}+1)}{3}.
```

Exact modular arithmetic gives `4^29≡1 (mod 59)` and
`2·4^14+1≡0 (mod 59)`. Thus 59 divides every such core.
Appending the two zero digits multiplies it by 16, so every corresponding
accepted pair has an integer quotient. The core and 59 are odd, and the
core exceeds 59. Every quotient therefore has exactly four factors of 2
and a nontrivial odd factor, so none is a power of 4.

This failure is structural, not a shortage of search depth.

## Verification and remaining problem

Run from the repository root:

```bash
python research/bounty-lean-2026-11-21/formal-languages/verify_shallit14_false_positive.py
```

The standard-library script reconstructs the paired word, checks membership
in the stated regular pattern, evaluates both base-4 integers, verifies the
exact division and the two modular identities, and excludes a base power.
The general family follows from the displayed algebra and congruences;
the script is not a substitute for that argument.

Requiring the two separated blocks to have equal arbitrary length would
silently add a nonregular constraint. A subsequent
[promise-class theorem](../shallit-divisibility/power-only-promise.md) shows
that the stronger plan of excluding every non-power integer quotient cannot
give an undecidability reduction in prime-power bases, including base 4.
It gives a decision procedure on precisely that promised class.

A different reduction could still allow incidental non-power integer
quotients if their existence implies a valid source computation. No such
construction, and no complete decision algorithm for the unrestricted
problem, has been obtained.
