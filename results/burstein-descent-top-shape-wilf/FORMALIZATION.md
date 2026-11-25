# Lean verification: Burstein’s descent-top shape-Wilf conjecture

[Lean module](../../lean/Conjectures/BursteinDescentTop.lean) · [Written proof](PROOF.md) · [Original source, Conjectures 16 and 17](https://dmtcs.episciences.org/en/articles/15066/download#page=15)

The endpoints `not_descent_top_shape_wilf` and `not_ascent_bottom_shape_wilf` refute the two universal assertions. The length-one suffix is allowed in both, so restricting to nonempty suffixes does not weaken the disproof of Conjecture 16. The board has bottom-to-top row lengths 6, 6, 6, 6, 5, 4 and contains the six-row staircase, hence is traversable. The patterns are 2314 and 3124.

A traversal specifies one chosen column per row and uses every column once. An occurrence requires all selected columns to fit in every selected row. The two statistics respectively compare inside equal-length row blocks and include block-terminal entries as ascent bottoms. For each conjecture, the relevant fiber has cardinality 15 in one avoidance class and 16 in the other, ruling out a statistic-preserving bijection. Exact reduction takes place in the kernel.

The stronger counterexample for every suffix remains **written only**. The square-board question is not addressed. Conjecture credit: Alexander Burstein. The existing proof attribution and priority caveat are unchanged. The Lean source is unchanged from Cinna Davis’s [research commit](https://github.com/1337isnot1337/solved-conjectures/commit/73f39f91b41866a93156e5aa0c1fc8f91c0de3e2).

## Reproduce the scoped gate

After installing the pinned Mathlib cache, run from the repository root:

```sh
python3 scripts/verify_lean_target.py --root Conjectures.BursteinDescentTop --require Conjectures.BursteinDescentTop.not_descent_top_shape_wilf --require Conjectures.BursteinDescentTop.not_ascent_bottom_shape_wilf --out /tmp/burstein-shape-wilf-check
```

The [receipt](verification/receipt.json) binds the strict build, all-owned axiom audit, and independent stock kernel replay to the exact proof source and tools. It does not certify the repository-wide gate.
