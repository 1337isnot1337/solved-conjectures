# Li contribution: verification and integration

The original 38-module Lean development was contributed by
[aadrianvv](https://github.com/aadrianvv) in
[PR #35](https://github.com/1337isnot1337/solved-conjectures/pull/35), at head
`fb700255fed86b6ac29b4980ff4704fa46adab63`.

The accepted registration contains that contribution with compatibility
repairs and six supplementary modules. All 44 fresh strict source checks,
25 literal contracts, owned-name axiom audit, and 44 exact stock-kernel
replays passed. The separate raw proof-occurrence supplement passed
against the same compiled object bytes. Both artifacts were authenticated
and independently reviewed before registration.

The accepted scope is the explicit 31-vertex tree, its degree and leaf facts,
the full elementary coefficient `+29` for every finite colour set of size at
least 31, the exact connected-partition count `8`, and all `6,842` integer
partition types. The supplementary modules assemble these into an actual
connected vertex-partition statement and prove all five elementary
coefficients supported on `e₂,e₃`: `29`, `83`, `−6304`, `−6800`, and `−8384`.
Each coefficient is transported to every finite colour type of cardinality
at least 31. The negative coefficient also gives an explicit failure of
coefficientwise elementary positivity. These statements are included in
the verified 44-module closure.

The sixth extension proves a bijection between deleted-edge subsets and all
connected vertex partitions. Its codomain uses nonempty, disjoint, covering
blocks connected by walks inside each block. Their total cardinality is
`1,073,741,824 = 2^30`; this count includes all block-size types.

## Compatibility and reproduction repairs

The review updates deprecated conditional lemmas to their current names,
removes unused simplification arguments and an unused section instance, and
uses the current neighbour-set instance. The tree, theorem statements, and
literal partition witnesses retain the contributor's definitions.

The coefficient-table generator reproduces the repaired `LiCompute.lean`.
The independent partition-generator path now uses the actual 15-edge/15-edge
split. Its output reproduces the original 6,842 masks and canonical digest.
The generator's emitted positive-part tuples also round-trip through its
checker. These Python checks support transcription and reproduction; Lean
checks the mathematical certificates.

## Exact verification gate

`scripts/verify_li_exact.py` reads the sealed manifest in
`docs/li-exact-sources.json`. It checks all 44 sources from a fresh project
object directory with warnings treated as errors. Independent source branches
continue after a compilation failure; dependent sources are blocked. Any
failure prevents entry into the acceptance stages. Once every source passes,
it checks literal
mathematical statements, audits every owned declaration including private
declarations, and replays every module with the unchanged stock kernel
checker. The only permitted transitive axioms are `propext`,
`Classical.choice`, and `Quot.sound`.

The manifest records the original contribution, exact source hashes, 71
required theorem names, pinned configuration, and verification-helper hashes.
The workflow is `.github/workflows/lean-li-exact.yml`. A successful source
preflight or publication of this checkpoint is not a completed proof check.

Coordination and subsequent receipts are tracked in
[issue #39](https://github.com/1337isnot1337/solved-conjectures/issues/39).


## Accepted integration

The accepted-registry patch adds the exact 44-module closure and 71
required names while preserving every earlier registration. All 44 strict
source invocations and all 25 literal contracts have passed and their exact
source/object/import bindings have been authenticated. The complete owned-
name axiom audit, 44 exact stock replays, and complete reachable serialized-
proof-occurrence audit also passed. The raw audit binds the same unchanged
source and object inventory as the original source-build gate.

The integration preserves the original PR head
`fb700255fed86b6ac29b4980ff4704fa46adab63` as a merge parent and credits
aadrianvv. Six additional modules are attributed through issues #39, #40
and #41. The later `LiStructure` graph-distance and branching source remains
a separate unaccepted candidate and is not part of this registration.

The original [run 44599210697, job 135825706963](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44599210697/job/135825706963)
produced artifact `14568527194`, ZIP SHA-256
`281b57fd87cf7d6123cdcabff4a5803f3d426116dbb4a9aa01370318b2a138ed`.
The unchanged receipt SHA-256 is
`da585dbd99530825af7bac8c4730c1a6666bfa151ce98ad4c6f52b9d537aa09d`.
All 272 original members, source/object/direct-import bindings, process
logs and profiles, original git controls, and compiler/checker pins have
been authenticated. The artifact authentication SHA-256 is
`cc956d198ed081f35fb7ea35ff22aaf9bbec7b3ce2138519c43db53d778fef29`;
the independent root review SHA-256 is
`9de0d30a11a09d0c54bfdd76358f6ef2e3abdcc07254c314af520bbfbd04361b`.

The [raw-occurrence supplement, run 44606051622 / job 135849912826](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44606051622/job/135849912826)
passed at `26ef845d1ec4adb15e0c87c9264905baeb69491f` against the exact original
44 compiled objects. It rechecked all 25 literal contracts and traversed
17,647 dependency nodes and 316,338 edges from all 1,247 owned declarations.
The scan indexed 22 differing theorem bodies across the imported environment;
none was reachable from those roots, so no extra variant alias checks were
needed. The trust-zero checked-kernel negative control was rejected. The
only transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`.

The raw artifact is `14569498196`, ZIP SHA-256
`7ea288555021d503775aa3886fc59edc65ae9a096ca26bb9add7e9950b1e1489`,
with receipt SHA-256
`8cb7e81896bc67b3c68ed976f256e6894b6c52318063ab0894360fed1d0a8b46`.
The preserved baseline backup is artifact `14569584489`, ZIP SHA-256
`dfbb03a7571256df786f9c28f45b306cb924f89403ba403d81063072e6f1eb2f`;
its inner archive equals the original baseline ZIP byte for byte.
The raw-artifact authentication SHA-256 is
`6abda54c54c591fef864220fd7624374ad25af865a94989204969305eecb0610`;
the independent review SHA-256 is
`8f14f2f5844973ea3d432b741185e01a8385841fc0d8f8b90e7181e88f5d6aee`.
The supplement retains the original source-build and stock-replay evidence;
it does not claim to have repeated those stages.
