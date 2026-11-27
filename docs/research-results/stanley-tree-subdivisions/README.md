# Recognizing trees after subdividing one edge

**Every edge of every finite tree can be subdivided sufficiently many times that the resulting tree is determined, among all trees, by its ordinary chromatic symmetric function.** Delete the chosen edge and call the orders of its two components $`c,d`$. Replace the edge by a path. If the resulting tree has $`n\ge4\max(c,d)-3`$ vertices, its chromatic symmetric function determines its unlabelled isomorphism class. Reconstruction requires neither the location of the path nor the shapes or sizes of its endpoint trees. For example, endpoint components of orders 5 and 8 give a sufficient total order of 29. [Subdivision proof](PROOF.md) · [Independent mathematical review](REVIEW.md)

For two other families, form a tree by attaching the roots of identical branches to one new vertex.

- Three or more copies of any rooted tree are distinguishable among all trees. [Repeated-branch proof](REPEATED-BRANCHES.md)
- With exactly two copies, recognition holds under a condition on consecutive orders of descendant subtrees. It also holds when the combined branches one level below the hub can be recovered from the specified truncation. The first condition covers all rooted trees in which every vertex has an even number of children, including full binary trees. [Two-branch theorem and proof](TWO-BRANCHES.md)

Codex derived these partial results in the WadeDavis research session. Separate project reviewers checked the subdivision argument, the repeated-branch comparison, and the two-branch parity and moment arguments. The proofs use Stanley's spanning-forest expansion and build on rooted forest-polynomial factorization. The results have written proofs and exact finite checks. They have no Lean formalization. Stanley's isomorphism question for arbitrary trees remains open. [Stanley, §2](https://sites.math.washington.edu/~billey/classes/Hopf.algebra/bulletins/stanley.1995.pdf) · [Rooted forest polynomials](https://arxiv.org/abs/2002.08186) · [Research issue #315](https://github.com/1337isnot1337/solved-conjectures/issues/315)

## Reproduction

Run these commands from the repository root with standard Python.

```sh
python3 docs/research-results/stanley-tree-subdivisions/verify_long_subdivision.py
python3 docs/research-results/stanley-tree-subdivisions/verify_centroid_edge.py
python3 docs/research-results/stanley-tree-subdivisions/verify_two_branches.py
```

The subdivision checker compares 200 rooted shapes with direct edge-subset enumeration, tests 1,446 unordered arm pairs and compares 434 unrooted trees of orders 3–11. It also checks both threshold parities for endpoint orders 5 and 8 and every path order from 2 through 22. The repeated-branch checker tests 660 multisets for the three- and four-copy comparison. The two-branch checker examines 8,116 unordered arm pairs through order eight. [Subdivision checker](verify_long_subdivision.py) · [Repeated-branch checker](verify_centroid_edge.py) · [Two-branch checker](verify_two_branches.py)
