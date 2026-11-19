# Erdős–Gyárfás — a sharp bound for abelian covers of a subdivided tetrahedron

**The general problem is unresolved here.** Erdős and Gyárfás asked whether every finite simple graph of minimum degree three contains a cycle of power-of-two length. We prove that every abelian voltage cover of the graph obtained by subdividing one edge of $K_4$ contains a simple cycle of length 4, 8, 16 or 32. A 95-vertex cyclic cover has 32 as its shortest power-of-two cycle. [Proof and definitions](PROOF.md)

The subdivided edge creates a degree-two vertex in the base. A graph obtained by adding edges to one of these covers to bring its minimum degree up to three already contains the cycle from the cover. The result places no restriction on general graphs outside this construction. For the broader problem see [Ducoffe and Dumitru](https://arxiv.org/abs/2609.28594). A [working paper claiming a general solution](https://zenodo.org/records/22019344) also exists. We have not verified that claim.

Run `python3 verify.py` and `python3 sharpness.py` with assertions enabled. The first checks every branch of the lattice certificate. The second builds the sharp example and checks its cycle lengths directly. The proof is unrefereed and has no Lean formalization or priority claim.
