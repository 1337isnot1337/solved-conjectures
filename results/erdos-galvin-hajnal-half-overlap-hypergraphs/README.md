# Erdős–Galvin–Hajnal’s half-overlap hypergraph problem

**Affirmative in ZFC for every uniformity in the original problem.** Cinna Davis proved the result by applying a strong coloring of ordinal pairs. The written proof received independent internal review. There is no Lean formalization.

[Original Problem 11](https://www.renyi.hu/~p_erdos/1975-24.pdf) · [Research discussion](https://github.com/1337isnot1337/solved-conjectures/issues/1040)

For every $`n\ge2`$ there is a $`2n`$-uniform hypergraph on
exactly $`\aleph_2`$ vertices with chromatic number
$`\aleph_1`$, such that two distinct edges intersect in at
most $`n`$ points. The original question starts at width three. Erdős, Galvin and Hajnal had already established the width-two case. The result uses no assumption on the
continuum or on the generalized continuum hypothesis.

The proof uses Shelah's ZFC strong pair coloring to choose
a single rectangle per row pair. This preserves the overlap
bound yet catches a monochromatic rectangle in any countable
coloring of the vertices. Combined with the original authors'
theorems outside the construction range, it classifies all
finite uniformities and overlap bounds at host size $`\aleph_2`$.

- [Proof](PROOF.md)
- [Full parameter threshold and regular-successor extension](THRESHOLD.md)
- [Primary sources and prior results](PRIOR-ART.md)
- [Independent review](REVIEW.md)
- [Exact finite checks](verify_rectangles.py)
