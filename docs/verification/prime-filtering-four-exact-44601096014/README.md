# Four-input filtering: original complete hosted evidence

This directory preserves the original evidence from
[run 44601096014](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44601096014),
job `135832394504`, source `8d1933b7b568515fe5bf7e8b474fe22e284521e8`.
The unchanged receipt is [receipt.json](receipt.json); the artifact checks
and independent review are [authentication.json](authentication.json) and
[independent-hosted-authentication-review.json](independent-hosted-authentication-review.json).

Artifact `14570031426` has ZIP SHA-256
`35b10512afd9074fba2bb8d32e05f64e4219ed29d5169cf07aa7e54fd0508492`.
The original receipt SHA-256 is
`b1a3227b6ae4ebdad68c24553133ff781082593126f7b25ff86a4051700ceb10`.
All 128 archive members are recorded in [archive-members.json](archive-members.json).
Every textual source, control, literal contract, generated audit, inventory,
log and process profile keeps its original bytes. Compiled objects are
recorded by digest; they are not committed as binaries.

## The proved statement

For any four natural inputs nonzero modulo seven, and any positive natural
`M`, some `j + k*M`, with `1 <= j <= 5` and `0 <= k <= 6`, makes all four
quotient digits modulo seven avoid zero and six. Taking `M = 7^m` gives a
multiplier coprime to `7^(m+1)` and literal folded residues at least `7^m`.
Every input divisible by seven has the same full residue as after
multiplication by `j`. The correction does not preserve the original
higher residues without that `j` factor. A later seed must handle it.

The proof uses finite quotient sampling, residue symmetries, ten canonical
decision checks and exact natural division identities. All ten checks are
proved with kernel-checkable decision procedures. The arbitrary-input
endpoint has no remaining computational hypothesis. This is a component
of the known argument in Barajas and Serra,
[*The lonely runner with seven runners*](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v15i1r48/pdf),
Electronic Journal of Combinatorics 15 (2008), R48, DOI 10.37236/772.
The full six-speed runner theorem remains pending.

## Verification and registration

All 20 exact project modules were freshly compiled with strict warnings.
Four literal contracts and all seven required endpoints passed. The audit
covers 133 owned declarations, including 97 theorems and no private
declarations. Only `propext`, `Classical.choice` and `Quot.sound` occur.
The raw-occurrence helper scans complete private import data at trust
level zero and validates a closed graph of 5,101 nodes and 70,060 edges.
The 17 differing serialized theorem families indexed among all imports
are outside that reached graph; no reachable alternate body was omitted.
Each project module then passed as the sole stock-kernel replay target.

[registration.json](registration.json) lists the exact additions: 20
imports and replay/prebuild targets, plus seven theorem requirements.
Previous entries and their order, the verification bodies and the axiom
whitelist remain intact. The independent source/controller review preserves
the coordinated proof's contribution and exact statement scope. This
registration changes no Li requirement or result-directory completion flag.
The merged accepted-package gate remains a separate obligation.
