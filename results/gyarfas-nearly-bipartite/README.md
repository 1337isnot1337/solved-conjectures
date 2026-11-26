# Gyárfás’s nearly bipartite graph conjecture

**Lean status:** none.

If Gyárfás’s conjecture has a counterexample, one exists on at most 330 vertices. The conjecture holds for arbitrary subdivisions of rectangular Möbius grids.

The finite reduction preserves the obstruction to deleting five vertices to make the graph bipartite. The grid result covers all parity assignments arising from subdivisions. The existence of a counterexample in the remaining class is open. [Gyárfás, Conjecture 1](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v4i1r8)

## Proofs

- [Reduction to at most 330 vertices](finite.md)
- [Projective subgraph preserving the transversal number](core.md)
- [All subdivisions of Möbius grids](grids.md)
- [Original conjecture and structural background](PROOF.md)

**Reproducible check.** Möbius grid paths and all parity switchings. Run `python3 results/gyarfas-nearly-bipartite/check_grid.py` from the repository root. [Verifier](check_grid.py) · [Path certificate](grid-paths.json)

**Review record.** Independent proof review is pending. [Discussion and checks](https://github.com/1337isnot1337/solved-conjectures/issues/808) · [Original research files](https://github.com/1337isnot1337/solved-conjectures/tree/17fbd24838da0aff7b8081d6338b5e03d601893b/research/gyarfas-nearly-bipartite).

If you use these results, please credit the authors of the original problem and the proof you use, and cite [Cinna Davis’s site](https://itsdavis.com/) and [the specific proof in this repository](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/gyarfas-nearly-bipartite/finite.md).
