# Tamimi's conjecture

The proposed proof identifies the full sandpile group of the graph made by gluing a copy of a complete graph onto every edge of a cycle. Both parameters are unrestricted integers at least three.

- `PROOF.md`: reversible integral presentation reduction, including the separate three-vertex-clique case.
- `check.py`: exact diagnostic Smith forms from both the graph and the final presentation; requires Python and SymPy.
- `check-output.txt`: output of the diagnostic run.
- Independent review and the source/priority audit are in progress. This package is research only until those gates pass.

Original statement: Baha Tamimi, *The Sandpile & Smith Groups of Certain Classes of Graphs*, Essex PhD thesis (2022), Conjecture 4.4.2, printed page 115. Repository coordination: issue #208.

Run the finite diagnostic with `python check.py`. The proof of the unbounded theorem does not depend on these finite cases.
