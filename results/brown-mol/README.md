# Brown–Mol's conjecture

Proposed full disproof of the translated-annulus conjecture for subtree roots. The construction gives an infinite family of trees of diameter four with roots strictly inside the conjectured forbidden disk.

## Files

- [Complete proof](PROOF.md): the tree construction, local analytic zero argument, and a separate exact finite certificate.
- [Exact checker](check.py): standard-library integer and rational verification, including independent connected-set enumeration for three small trees and a Rouché certificate for a 1,001-vertex tree.
- [Recorded checker output](check-output.json).
- [Independent mathematical review](ANALYSIS_REVIEW.md) of the proof and finite certificate.
- [Root mathematical review](ROOT_REVIEW.md), including the full source statement and a separate derivation of the analytic argument.
- [Independent source and prior-resolution audit](ALGEBRA_PRIOR_AUDIT.md), including the exact scope of the earlier double-star theorem and the subsequent full-content archive checks.
- [Primary references and statement locations](SOURCES.md).

Run the exact checks with `python check.py`.

The assertion disproved is Brown–Mol's Conjecture 4.2 (2018 preprint; 2020 publication), repeated as Conjecture 5.1 by Jin, Ma, and Wang in arXiv:2608.07898v2 (2026). Their theorem for the disk centered at zero is a distinct, established result.

An earlier ArtificialZeng archive result was checked and concerns trees of diameter at most three only. Its full arbitrary-tree problem is explicitly left open. The present counterfamily has diameter four for every parameter at least two. No claim is made about the conjecture's separate outer radius inequality.

Repository coordination: [issue #210](https://github.com/1337isnot1337/solved-conjectures/issues/210). Independent mathematical, root, and documented priority reviews passed. The argument remains unrefereed; internal review is not journal peer review. No Lean formalization is claimed. The current audit found no earlier full resolution within its documented coverage.
