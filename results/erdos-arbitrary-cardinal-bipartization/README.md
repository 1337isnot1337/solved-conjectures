# Erdős’s arbitrary-cardinal bipartization conjecture

**Status:** Proved.

For every positive real exponent increment and every infinite
cardinal, there is a graph whose chromatic number exceeds that
cardinal, but whose every finite subgraph can be made bipartite
by deleting fewer than its order to the power one plus the
specified increment. This is Erdős's arbitrary-cardinal
construction, not the separate exact-ℵ₁ question.

- [Proof](PROOF.md)
- [Primary statement and priority audit](SOURCES.md)
- [Why the exponent is sharp for any fixed shift order](SHIFT-EXPONENT-SHARP.md)
- [Independent review](REVIEW.md)
- [Orientation replay](check_shift_orientation.py) and [window and odd-girth replay](check_shift_bridges.py)

No Lean formalization was performed. The finite replays check
parts of the construction; the proof handles all graphs in the
chosen shift family and the transfinite chromatic lower bound.
