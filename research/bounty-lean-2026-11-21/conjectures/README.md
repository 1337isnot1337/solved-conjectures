# Conjectures.io bounty research

Checked 21 November 2026. Coordination: [issue 223](https://github.com/1337isnot1337/solved-conjectures/issues/223).

**New complete mathematical resolutions: 0. Bounties earned: 0.**
The work below is an eligibility audit and an unsuccessful counterexample
search. None of the search outputs is a proof that the conjecture holds.

## Payment and novelty requirements

The [submission terms](https://conjectures.io/submission-terms), version 13,
effective 11 November 2026, distinguish Lean verification, review approval,
and payment. The solver receives Subnet 66 Alpha in a payout wallet.
Displayed dollar amounts are estimates. A paid submission requires one
credit; the [guide](https://conjectures.io/how-it-works) lists 0.25 TAO per
credit and a free preliminary file check. No credits were bought or spent.

A complete, established public proof of the same mathematical statement
predating acceptance makes a full conjecture bounty ineligible, even if
the submitted Lean formalization is new. A separately capped formalization
defect award is the smaller of $750 equivalent and the locked bounty.
Original AI chat logs are required. Accepted logs receive a permanent
license that permits sale and use in AI training. No logs or proof
submissions were uploaded during this investigation.

The site's [task registry](https://github.com/conjectures-io/conjectures-tasks/blob/main/tiers/tier-1/task-targets.json)
contains historical solved targets as well as open targets. Inclusion in
that file is therefore insufficient to establish present eligibility.
Check each live problem page immediately before investing in a proof or
submission. Likewise, cached search snippets can display old bounties for
already closed problems.

## Targets ruled out by live status

| Target | Observed status | Consequence |
| --- | --- | --- |
| [Math30 source25: third planar Dirichlet Polya inequality](https://conjectures.io/problems/math30catalog-source25) | Solved; documentation pending | The page explicitly excludes further rewarded submissions. |
| [Math30 source30: uniform degree bound for polynomial minimal graphs](https://conjectures.io/problems/math30catalog-source30) | Solved; documentation pending | The page explicitly excludes further rewarded submissions. |
| [Math30 source26: fourth planar Dirichlet Polya inequality](https://conjectures.io/problems/math30catalog-source26) | Approved and paid | Closed. |
| [Math15 source11: graceful three-degree-three trees](https://conjectures.io/problems/math15catalog-source11) | Approved and paid | Closed. |

The current task-target registry omits Math30 source22 and source27 even
though the older [research decision matrix](https://github.com/conjectures-io/conjectures-tasks/blob/main/staged/research-targets/decision-matrix.json)
labels them activated. That older label is insufficient evidence of a
claimable bounty. No reward claim is made for them.

The [pool history](https://conjectures.io/problems/changes) also records
earlier payments for the two-entry lonely-runner classification, the
four-speed amended spectrum, the six-speed denominator bound, the
degree-four/degree-three graceful-tree problem, the conductor-at-most-four-
times-multiplicity Wilf target, and two polynomial minimal-graph targets.
They cannot supply new paid resolutions for this campaign.

## Marcus's block-permanent conjecture

### Exact statement and eligibility

For positive integers $m,k$, partition a complex Hermitian positive
semidefinite matrix $A$ of order $mk$ into $m$ by $m$ blocks of size $k$.
Let $`G_{ij}=\mathop{\mathrm{per}}(A_{ij})`$. The target requires

```math
\mathop{\mathrm{per}}(G)\leq\mathop{\mathrm{per}}(A).
```

It also requires the following equality characterization: if $k\geq2$
and all diagonal blocks are positive definite, equality holds exactly
when every off-diagonal block is zero.

The [live problem page](https://conjectures.io/problems/fulloldproblemscatalog-marcusblockpermanent-conjecture)
was accepting submissions with no recorded attempts; it displayed an
estimated bounty of approximately $2,703 at one retrieval. This is neither
a reserved amount nor a guarantee of payment.

The source definition was inspected in
[Statements.lean](https://github.com/conjectures-io/conjectures-tasks/blob/main/staged/historical-open-20261023/statements/Statements.lean).
Its type agrees with the target described in the task's
[manifest](https://github.com/conjectures-io/conjectures-tasks/blob/main/versions/fc-v2-marcusblockpermanent-conjecture-bb5da75b49e229542d7e915f-formalized/manifest.json).

Exact proof-task identity:

```text
fc-v2-marcusblockpermanent-conjecture-bb5da75b49e229542d7e915f-formalized
source type: sha256:3cea3965a3dca3c5e49d76698817b492adca7ada5c3ea79c99b796b2ccc972b4
task commitment: sha256:58e8ed64b6f16c0fe0971b9cf55e8608215e16ffa0200c59b2964aec7924093e
```

The manifest permits only `propext`, `Quot.sound`, and `Classical.choice`
as transitive axioms. It excludes the source conjecture itself as a
dependency. The pinned toolchain is Lean 4.35.0-rc2, with Mathlib commit
`065356127b1dc0016f66b7283ce0ce2c4055aa55`. A counterexample must use its
own current counterexample task identity; the proof identity above must
not be reused for a refutation.

### Prior work and coordination

[Wanless's survey](https://arxiv.org/abs/2202.01867) records the classical
problem. [Tubbenhauer's November 2026 preprint](https://arxiv.org/abs/2611.22058)
claims the inequality for at most four packets of every size, for five
packets of size at least three, and under an explicit logarithmic
lower bound on packet size at arbitrary packet count. The first remaining
quadratic-packet case is five packets. The author's
[project page](https://dtubbenhauer.com/blockpermanents.html) states these
same ranges. No full resolution was found in this source check.

Repository work under [Minc issue 139](https://github.com/1337isnot1337/solved-conjectures/issues/139)
already includes rank-two bounds, internally orthonormal large-packet
bounds, and exact failures of stronger Gaussian or operator comparisons.
Those notes were consulted before starting. The negative operator examples
there do not have the product structure required for a counterexample to
Marcus's statement. The latest Wang Hadamard work remains with issue 139.
The present numerical search was reserved separately in issue 223.

### Counterexample search

[search_marcus.py](search_marcus.py) represents
$`A=VV^*`$ and normalizes each row of $V$. This preserves both permanents'
common positive scaling factor and guarantees positive semidefiniteness.
It minimizes

```math
F(V)=\log\mathop{\mathrm{per}}(A)
     -\log\mathop{\mathrm{per}}(G)
```

using the Ryser formula and analytic derivatives. No division by a Ryser
row sum is used: prefix and suffix products evaluate each cofactor sum,
including at zero row sums. An independent permutation sum at a complex
four-by-four matrix checks the permanent evaluator, and a directional
finite difference checks the complete analytic gradient.

For clarity, if $`C_{ij}=\partial\mathop{\mathrm{per}}(A)/\partial A_{ij}`$,
the Euclidean complex gradient through $`A=VV^*`$ is
$2\overline C V$. The script applies the chain rule through the
two-by-two block permanents and row normalization. A separate mode uses
Gram--Schmidt within every pair to enforce internally orthonormal packets;
its complete derivative is checked independently by finite differences.

The searches had the following outcomes. The logarithmic values are
floating diagnostics, not certified lower bounds.

| Search | Random starts | Ranks | Smallest observed log ratio |
| --- | ---: | --- | ---: |
| Five quadratic packets, unrestricted | 24 | 2, 3, 4, 5, 8, 10 | $2.05\times10^{-11}$ |
| Six quadratic packets, unrestricted | 20 | 3, 4, 5, 6, 9 | $4.40\times10^{-11}$ |
| Five internally orthonormal quadratic packets | 30 | 3, 4, 5, 6, 8 | $0.61310447$ |

The unrestricted high-rank searches approach block-diagonal equality.
The orthonormal-packet search removes the rank-one-packet collapse that
allows this escape at rank equal to packet count. It also produced no
negative gap. Rank-two probes are consistent with a previously recorded
repository theorem and are not new progress.

Full outputs are [five-packet runs](marcus_search.json),
[six-packet runs](marcus_search_m6.json), and
[orthonormal-packet runs](marcus_search_orthonormal.json).

Reproduction from this directory:

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python search_marcus.py --starts 4 --iterations 100 --output marcus_search.json
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python search_marcus.py --blocks 6 --ranks 3 4 5 6 9 --starts 4 --iterations 150 --output marcus_search_m6.json
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python search_marcus.py --orthonormal --ranks 3 4 5 6 8 --starts 6 --iterations 200 --output marcus_search_orthonormal.json
```

No exact counterexample was found, so there is no Lean certificate to
submit. A larger batch of the same local search has no identified reason
to overcome its convergence toward known equality configurations. A new
structured family or proof argument is needed.

## Additional statement screens

The newly admitted Erdős statements 295, 311, 322, 388, 389, 393, 422,
423, 430, 461, 467, 472, 478, and 483 were read from the
[primary formal-conjectures repository](https://github.com/google-deepmind/formal-conjectures/tree/main/FormalConjectures/ErdosProblems).
This was a definition and scope screen, not a deep literature review of
each target. No immediate definition defect or complete proof was found.

Two pitfalls were checked explicitly:

- [Erdős 545](https://conjectures.io/problems/erdos545-erdos-545) quantifies
  over sufficiently large edge counts. Previously known small
  counterexamples do not refute its current target.
- The [Erdős 49 exact-maximality variant](https://conjectures.io/problems/erdos49-erdos-49-variants-primes-maximal)
  is a stronger question than the asymptotic bound solved by Tao.
  A search result saying that the parent problem is solved does not,
  by itself, establish the status of that exact variant.

These screens do not produce any additional resolution or payout.
