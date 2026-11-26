# Lean verification of the degree-count counterexamples

For every integer $k\ge3$ and every even $n$ from $4k+4$ through $6k-2$, Lean constructs a finite connected bipartite graph on exactly $n$ vertices. Every matching of $k$ edges extends to a perfect matching. Deleting any single edge destroys this property. If $m$ is the number of edges and $\ell$ is the number of vertices of degree $k+1$, then

```math
\ell < \frac{2(m-n+2k)}{2k-1}.
```

The theorem uses Mathlib subgraphs, their unordered edge sets, and its predicates for matchings and spanning perfect matchings. It counts vertices by their graph degrees and deletes the singleton unordered edge in the original graph. [Matching definitions](../../lean/Conjectures/MallikDegreeLiteral.lean) · [Theorems for every even order](../../lean/Conjectures/MallikDegreeTheorems.lean) · [Mallik, Diwan and Kothari’s Conjecture 8.9](https://arxiv.org/html/2404.06445v3#S8.SS1).

## Proof and counts

Each side has $k$ high vertices and $t$ low vertices, with $k+2\le t\le 2k-1$. The two complete high-to-low blocks, the perfect low-to-low matching, and the $r=2k-t$ high-to-high matching edges determine the entire adjacency relation. For an arbitrary matching of size $k$, Hall's theorem on the unused vertices gives a perfect extension. After deletion of a high-to-high edge, a matching between low vertices obstructs completion. For each of the other three edge types the proof exhibits a matching that uses every remaining neighbor of an uncovered low vertex. [Hall on the remaining vertices](../../lean/Conjectures/MallikDegreeHall.lean) · [Deletion at a low vertex](../../lean/Conjectures/MallikDegreeLowDeletion.lean) · [Deletion of a high-to-high edge](../../lean/Conjectures/MallikDegreeHighDeletion.lean).

```math
n=2(k+t),\qquad m=2kt+t+r,\qquad \ell=2t,\qquad
\frac{2(m-n+2k)}{2k-1}-\ell=\frac{2r}{2k-1}.
```

For $t=k+2$ the gap is $2(k-2)/(2k-1)$. The family satisfies $\ell\ge n/2+2$ and $n<6k$, as reported in the written proof's comparisons with two other conjectures. [Exact counts and gap](../../lean/Conjectures/MallikDegreeCounterfamily.lean) · [Order range and comparisons](../../lean/Conjectures/MallikDegreeTheorems.lean).

## The two reported 16-vertex witnesses

The smallest family member has 36 edges and ten vertices of degree four, below $52/5$. Lean identifies the original deletion-search graph, with row masks `108, 228, 116, 155, 187, 102, 101, 155`, with that family member by explicit bijections on both sides. It verifies all 64 possible cross-side adjacencies and transports minimal extendability and the degree count. [Matching transport](../../lean/Conjectures/MallikDegreeRelabel.lean) · [Literal row masks and graph isomorphism](../../lean/Conjectures/MallikDegreeWitness.lean).

A separate enumeration found 400 perfect matchings and 3,420 three-edge matchings in each graph. Every three-edge matching has a perfect extension. For every one of the 36 edges, some three-edge matching survives deletion and loses all its perfect extensions. The original checker also ran the Hall and deletion checks on 15 parameter pairs. [Perfect-matching enumeration](check_matchings.py) · [Original checker](verify.py).

Two independent runs compiled all 17 modules with warnings treated as errors and audited 211 declarations, including 164 theorems, 11 private declarations and all 68 named endpoints. Both replayed the pinned stock Lean kernel. The axiom audit found only propositional extensionality, classical choice and quotient soundness. [Verification receipt](verification/lean-receipt.json).

If you use these counterexamples or their formal proofs, please credit the authors of the work you use and cite Cinna Davis’s site and the specific proof. [Cinna Davis](https://itsdavis.com/) · [Written proof](https://github.com/1337isnot1337/solved-conjectures/blob/0f75f04a59e7af5957d87272417a201f87058d0c/results/mallik-diwan-kothari-degree-count/PROOF.md) · [Original conjecture](https://arxiv.org/html/2404.06445v3#S8.SS1).
