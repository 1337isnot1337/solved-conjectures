# Alexandersson’s graphical dist conjecture

Alexandersson asked whether counting the distinct positive earlier indegrees over acyclic orientations of any ordered graph always gives a real-rooted polynomial. The [written counterexample](proof.md) constructs connected chordal graphs of treewidth two with arbitrarily many distinct nonreal roots. The vertex order is part of the conjecture and of the examples. [Original statement](https://github.com/PerAlexandersson/RealRooted/issues/2641) · [Source audit](sources.md) · [Project issue 823](https://github.com/1337isnot1337/solved-conjectures/issues/823)

**Status.** Independent mathematical review covers both the finite counterexample and the family with arbitrarily many nonreal roots. The companion question about all orientations remains open. [Review record](https://github.com/1337isnot1337/solved-conjectures/issues/823#issuecomment-7196051430) · [Published disproof](https://github.com/1337isnot1337/solved-conjectures/pull/861)

The [71-vertex example](proof.md#an-explicit-71-vertex-counterexample) has an exact negative Laguerre difference for its reciprocal polynomial. Run `python3 results/alexandersson-graphical-dist/check.py` to reproduce it and the independent small-graph enumeration. [Verifier](check.py)

**Lean status:** partial. Lean checks the 71-vertex graph and its 310 edges, triangle insertion, the two nonreal roots of the computed polynomial, and the limiting roots for each positive even order. The identification of the full orientation count and convergence for the graph family use the written proof. [Lean theorems](https://github.com/1337isnot1337/solved-conjectures/blob/c7cc39e4829553c533660c8642a56a506be0726c/lean/Conjectures/GraphicalDistTheorems.lean) · [Kernel receipt](https://github.com/1337isnot1337/solved-conjectures/blob/c7cc39e4829553c533660c8642a56a506be0726c/docs/verification/lean-graphical-dist-20261126/receipt.json)

## Citation

If you use this disproof, please cite Cinna Davis and GPT-6.2 Astra for the construction and Per Alexandersson for the original question. [Cinna Davis](https://itsdavis.com/) · [Proof record](https://github.com/1337isnot1337/solved-conjectures/blob/c460a5a014b30ffdc9494fceb9ef17dcb58c0c6f/results/alexandersson-graphical-dist/proof.md) · [Original conjecture](https://github.com/PerAlexandersson/RealRooted/issues/2641)
