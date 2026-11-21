# Brown–Mol's conjecture

Proposed full disproof of the translated-annulus conjecture for subtree roots. The construction gives an infinite family of trees of diameter four with roots strictly inside the conjectured forbidden disk.

## Files

- `PROOF.md`: the complete tree construction, local analytic zero argument, and a separate exact finite certificate.
- `check.py`: standard-library integer and rational verification, including independent connected-set enumeration for three small trees and a Rouché certificate for a 1,001-vertex tree.
- `check-output.json`: the recorded exact verifier output.
- `ANALYSIS_REVIEW.md`: independent mathematical review of the proof and finite certificate.
- `ALGEBRA_PRIOR_AUDIT.md`: independent source and prior-resolution audit, including the exact scope of the earlier double-star theorem.
- `SOURCES.md`: primary references, statement locations, and the distinction between earlier theorems and this disproof.

Run the exact checks with `python check.py`.

The assertion disproved is Brown–Mol's Conjecture 4.2 (2018 preprint; 2020 publication), repeated as Conjecture 5.1 by Jin, Ma, and Wang in arXiv:2608.07898v2 (2026). Their theorem for the disk centered at zero is a distinct, established result.

An earlier ArtificialZeng archive result was checked and concerns trees of diameter at most three only. Its full arbitrary-tree problem is explicitly left open. The present counterfamily has diameter four for every parameter at least two. No claim is made about the conjecture's separate outer radius inequality.

Repository coordination: [issue #210](https://github.com/1337isnot1337/solved-conjectures/issues/210). Independent mathematical and priority reviews passed. Admission remains subject to root review; this package is not a peer-reviewed publication or formal verification.
