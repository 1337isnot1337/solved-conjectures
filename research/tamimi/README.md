# Tamimi's conjecture

**Excluded from the novelty tally.** Tan's 2011 thesis abstract already states the exact full formula under the graph's equivalent description as an edge corona. The primary thesis remains unavailable, but the matching prior statement is sufficient to exclude a claim of new resolution.

The independent proof identifies the full sandpile group of the graph made by gluing a copy of a complete graph onto every edge of a cycle. Both parameters are unrestricted integers at least three.

- `PROOF.md`: reversible integral presentation reduction, including the separate three-vertex-clique case.
- `check.py`: exact diagnostic Smith forms from both the graph and the final presentation; requires Python and SymPy.
- `check-output.txt`: output of the diagnostic run.
- `ALGEBRA_REVIEW.md`: independent mathematical review, passed.
- `PRIOR_STATUS.md`: the exact earlier formula, parameter substitution, and source-access limits.
- This package is retained as research and contributes no result count.

Original statement: Baha Tamimi, *The Sandpile & Smith Groups of Certain Classes of Graphs*, Essex PhD thesis (2022), Conjecture 4.4.2, printed page 115. Repository coordination: issue #208.

Run the finite diagnostic with `python check.py`. The proof of the unbounded theorem does not depend on these finite cases.
