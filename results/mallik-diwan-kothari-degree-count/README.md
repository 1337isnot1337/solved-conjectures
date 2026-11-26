# Mallik–Diwan–Kothari degree-count conjecture

**False for every $k\geq 3$.** Conjecture 8.9 predicts a lower bound on the number of degree-$`k+1`$ vertices in a minimal $k$-extendable bipartite graph. Two complete bipartite blocks and two matchings give counterexamples for each such $k$. The smallest graph in this family has 16 vertices, 36 edges and ten vertices of degree four, where the conjecture requires eleven.

- [Complete proof](PROOF.md)
- [Source and priority audit](AUDIT.md)
- [Independent exact checks](verify.py), run with `python3 verify.py`
- [Discovery issue #825](https://github.com/1337isnot1337/solved-conjectures/issues/825)

A direct matching proof is self-contained and does not depend on enumeration. The written proof awaits external refereeing.

**Lean status:** full. Lean constructs a minimal extendable bipartite counterexample for every stated even order and verifies its exact edge and degree counts. Explicit permutations identify the original 16-vertex search witness with the smallest family member. [Theorems and verification receipt](FORMALIZATION.md).
