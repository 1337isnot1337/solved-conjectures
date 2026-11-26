# General position number of oriented trees

**Solved:** the general position number of each orientation of a finite tree is the minimum cost of a reachability-chain partition, where a chain of size one costs one and every longer chain costs two. A five-state recurrence evaluates the answer and recovers an optimal set in linear time directly from the orientation.

This is the oriented-tree question of [Chandran–Di Stefano–Erskine–Sreelatha–Thomas–Tuite, Problem 5.2](https://arxiv.org/html/2604.15909#S5). It does not settle the permutation or Kautz digraph questions in the same item, or the optimization over all orientations of a tree.

[Proof and recurrence](PROOF.md) · [Literature and test audit](AUDIT.md) · [Independent checker](verify.py)
