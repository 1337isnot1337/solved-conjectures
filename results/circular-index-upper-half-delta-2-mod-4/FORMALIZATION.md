# Uniform one- and two-block circular index constructions

For each integer $`g\ge6`$ and each $`b\in\{1,2\}`$, Lean proves that a finite simple graph on $`n=6g+1`$ vertices has maximum degree $`\Delta=4g+b`$ and exact real circular chromatic index

```math
\chi'_c(G)=\frac{2n+3b}{3}=\Delta+\frac23.
```

Theorems 1 and 1′ use the two published 37-vertex graphs at the exceptional parameter 6. Their maximum degrees are 25 and 26, and their indices are $77/3$ and $80/3$. At every larger parameter, Lean constructs the base matchings from the explicit formulas, proves their edge lengths distinguish the rotated classes, inserts the unit-edge blocks, and checks the circular separation at every vertex. Counting edges gives a lower bound against every real-circle colouring. The colour windows bound every degree, and the edge count forces some vertex to attain the asserted maximum. [Original construction](PROOF.md) · [Base formulas](../../lean/Conjectures/CircularInsertionBasePairs.lean) · [Degree and density arguments](../../lean/Conjectures/CircularInsertionSchedule.lean) · [Graphs and exact indices](../../lean/Conjectures/CircularInsertionGraphs.lean).

Proposition 2 supplies the strict upper-half examples in degrees 10, 14, 18 and 22. Corollary 3 gives such a graph for every degree congruent to 2 modulo 4 from 10, every even degree from 8, and every degree congruent to 1 modulo 4 from 21. Its proof uses the earlier regular circulant theorem and the separate labelled degree-21 example. The exact degree-21 colouring can be compared with its original JSON. [Family and corollary endpoints](../../lean/Conjectures/CircularInsertionFamilies.lean) · [Proposition 2 certificates](../circular-index-complete-minus-edges/FORMALIZATION.md) · [Degree-21 graph](../../lean/Conjectures/CircularInsertionDegree21.lean) · [Original data](../circular-index-upper-half-circulants/data/part2_certificates.json) · [Data comparison](check_lean_degree21.py).

The exclusion at $`g\in\{3,4,5\}`$ concerns the two specified supports, perfect matchings with no unit edge, and distinct cyclic lengths across both matchings. Lean proves by induction that choosing the partner of the first remaining vertex enumerates the possible length lists for every admissible matching. Kernel reduction checks that no compatible pair of lists exists at those three parameters. [Exhaustive proof](../../lean/Conjectures/CircularInsertionSmallBases.lean).

## Reproduction

From the repository root with the pinned Lean dependencies installed, run the following commands. The linked receipts record every required endpoint and the SHA-256 hashes of all project sources and verifier inputs.

```sh
python3 results/circular-index-upper-half-delta-2-mod-4/check_lean_degree21.py
python3 scripts/verify_lean_target.py --root Conjectures.CircularInsertionFamilies --require CircularIndex.Insertion.exact_one_two_blocks --require CircularIndex.Insertion.every_even --require CircularIndex.Insertion.every_two_mod_four --require CircularIndex.Insertion.every_one_mod_four --out /tmp/circular-insertion-families
python3 scripts/verify_lean_target.py --root Conjectures.CircularInsertionSmallBases --require CircularIndex.Insertion.no_small_base --out /tmp/circular-insertion-small-bases
```

The family proof rebuilt and replayed 28 project modules. Its axiom audit covered 1,292 declarations, including 1,130 theorems, 50 private declarations and all 38 required endpoints. The small-base proof rebuilt and replayed 4 project modules. Its axiom audit covered 349 declarations, including 304 theorems, 5 private declarations and all 3 required endpoints. [Family receipt](verification/lean-receipt.json) · [Base exclusion receipt](verification/small-base-receipt.json).

If you use this construction, please credit [@aadrianvv](https://github.com/aadrianvv) and cite both Cinna Davis’s site and the theorem or graph record you used. [Cinna Davis](https://itsdavis.com/) · [Source record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/circular-index-upper-half-delta-2-mod-4).
