# Althöfer game: obstruction to finite residue outcome certificates

Date: 2026-11-21. This is a structural obstruction to one proposed proof method. It does not prove or disprove the sponsor's all-starts conjecture, and no prize completion is claimed.

The [sponsor's current page](https://althofer.de/collatz-prizes.html), updated 2026-11-05, still offers €500 for proving that every odd starting position is determined under optimal play. The game sends an odd `n>1` to either `odd(3n-1)` or `odd(3n+1)`; reaching 1 wins immediately. The source explicitly says that an earlier claimed proof has gaps. The existing [issue 224](https://github.com/1337isnot1337/solved-conjectures/issues/224) and its increasing-ray reduction were read before this work. No larger numerical window was computed.

## The obstruction

Use `W` for a winning position and `P` for a position losing to optimal play. A total valid two-valued outcome assignment must satisfy:

- a `W` position has at least one `P` child;
- a `P` position has both children labeled `W`.

**Theorem.** No such assignment is eventually periodic with any positive integer period. More strongly, for every positive integer `M`, its restriction to odd positions congruent to `-1 mod M` cannot be constant beyond a finite cutoff.

**Proof.** Choose a positive integer `t` large enough that all three numbers below exceed the cutoff, and put

```math
n=8Mt-1.
```

The exact successors are

```math
\mathop{\mathrm{odd}}(3n-1)=6Mt-1,
\qquad
\mathop{\mathrm{odd}}(3n+1)=12Mt-1.
```

Indeed `3n-1=4(6Mt-1)` and `3n+1=2(12Mt-1)`, and the two factors in parentheses are odd. The original state and both successors are congruent to `-1 mod M`. If that residue class had one eventual label, all three labels would agree. Label `W` would then have no `P` child; label `P` would have a `P` child. Both contradict the local outcome rule. QED.

The argument applies to every positive `M`, with no restriction on its prime factors. It supersedes a longer preliminary argument that treated only powers of two.

## Consequence for the proposed strategy search

A certificate that assigns the winner using only finitely many residue classes and finitely many exceptional small positions cannot cover the whole game. Refining a fixed congruence modulus indefinitely through a sequence of finite searches does not remove this obstruction for any one finite certificate.

This does **not** exclude a finite automaton reading the entire binary expansion: regular binary languages need not be eventually periodic as sets of integers. It also does not exclude a strategy with extra unbounded arithmetic state or a ranking construction whose winning regions are not eventually periodic.

## A possible route beyond the obstruction, with its unresolved step

For a sign `s in {-1,1}`, write `n=c*2^r+s`, where `c` is odd and `r>=3`. Both successors then have the same form:

```math
I(n)=3c\,2^{r-1}+s,
\qquad D(n)=3c\,2^{r-2}+s.
```

Thus a long trailing run of identical binary digits can be treated as a finite subtraction game on `r`, with moves subtracting one or two and multiplying the odd coefficient by three. This gives an exact finite symbolic reduction to boundary states with `r=1` or `r=2`; it is more expressive than a fixed residue classifier.

It does not yet provide a well-founded global rank. The coefficient grows by three per move. A two-move response pattern reducing `r` by three multiplies `n-s` by `9/8`, so descent of the trailing-run length does not imply descent of the original number. At the boundary, the increasing successor changes to a different run, and the needed global descent argument is missing. No uniform winning strategy or complete ranking certificate has been obtained.

## Lean artifact scope

`PeriodicOutcomeObstruction.lean` states the local game law in terms of exact factorizations into a power of two and an odd integer. It derives the three-state identity and proves that a valid total Boolean outcome function cannot be eventually constant on the progression `k*M-1`.

The formal statement assumes a valid total two-valued outcome function; it does not assume or establish that all actual game positions have such labels. Therefore it cannot be counted as a Lean solution of the prize problem.

The final source compiled successfully with Lean 4.35.0, exit code 0. It imports only `Lean.Elab.Tactic.Omega`, with no mathlib dependency. Both exported theorems report only `propext` and `Quot.sound`; there are no `sorry` or custom axioms. The exact output is in `lean-output.txt`, and `lean-check.json` records the source hash and command. An earlier attempt with an unnecessarily broad mathlib import was interrupted/timed out; it is not verification evidence for the final source.
