# Erdős–Gyárfás — a sharp bound for abelian covers of a subdivided tetrahedron

**The general problem is unresolved here.** Erdős and Gyárfás asked whether every finite simple graph of minimum degree three contains a cycle of power-of-two length. We prove that every abelian voltage cover of the graph obtained by subdividing one edge of $K_4$ contains a simple cycle of length 4, 8, 16 or 32. A 95-vertex cyclic cover has 32 as its shortest power-of-two cycle. [Proof and definitions](PROOF.md)

The subdivided edge creates a degree-two vertex in the base. A graph obtained by adding edges to one of these covers to bring its minimum degree up to three already contains the cycle from the cover. The result places no restriction on general graphs outside this construction. For the broader problem see [Ducoffe and Dumitru](https://arxiv.org/abs/2609.28594). A [working paper claiming a general solution](https://zenodo.org/records/22019344) also exists. We have not verified that claim.

Run `python3 verify.py` and `python3 sharpness.py` with assertions enabled. The first checks every branch of the lattice certificate. The second builds the sharp example and checks its cycle lengths directly. The proof is unrefereed and carries no priority claim.

## Checked Lean components

Lean status: complete for the stated abelian voltage-cover theorem and its
sharpness example. The general minimum-degree-three conjecture remains
outside this result.

`ErdosGyarfasSharpMain.lean` proves that the literal graph is a regular
cyclic nineteen-sheeted cover of the stated base, is connected, has 95
vertices, and has 32 as its attained least power-of-two simple-cycle length.
An actual 32-cycle is constructed. Complete searches from five roots, split
into seventy smaller kernel computations, exclude every simple cycle of
lengths 4, 8, and 16. Search soundness, symmetry reduction, and frontier
completeness are proved in Lean. The seven-module closure passed strict
source checks, a 288-theorem standard-axiom audit, and unchanged pinned-kernel
replay.
[Sharpness receipt](../../docs/verification/erdos-gyarfas-sharp-main-c6735b93.json).

`ErdosGyarfasVoltageNormalization.lean` constructs the actual graph
isomorphism removing the four tree voltages for every abelian group and
every seven-label assignment. Actual simple cycles of every specified
length are preserved in both directions. Normalized adjacency is expressed
through a homomorphism from integer chord-count vectors. The assignment
`[0,0,0,0,1,8,0]` over `ZMod 19` is proved to give exactly the sharp graph.
Its four-module closure passed the same three gates, auditing 131 project
theorems.
[Normalization receipt](../../docs/verification/erdos-gyarfas-voltage-normalization-0cf8667d.json) ·
[Full scope](../../docs/lean-status.md#complete-sharp-95-vertex-example-and-arbitrary-voltage-normalization).


`ErdosGyarfasUniversalMain.lean` proves the universal theorem for every
abelian group and all seven voltages. Its endpoint constructs an actual
simple graph cycle of length 4, 8, 16, or 32, with no certificate or lattice
hypothesis. The 64-node literal certificate and every collision branch are
checked in Lean. The 17-module closure passed deterministic input/source
reproduction, strict sources, a 304-theorem standard-axiom audit, and
independent pinned-kernel replay.
[Universal receipt](../../docs/verification/erdos-gyarfas-universal-daa7d2c5.json) ·
[Exact statement and registration](../../docs/lean-status.md#complete-universal-abelian-cover-cycle-theorem).
