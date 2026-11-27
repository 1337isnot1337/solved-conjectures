# Scope and prior work

- Ben Cameron and Alexander Clow, [On Gyárfás’ Path-Colour Problem,
  arXiv:2506.19100v1](https://arxiv.org/html/2506.19100v1#S7),
  state two separate forbidden-class assertions in §1.2 and
  Conjecture 7.3. The one resolved here is that every graph
  with no induced edge plus two isolated vertices is path-perfect.
  The forbidden graph is the complement of the diamond.
  There is no restriction on graph order or chromatic number.
- The original paper's Theorem 1.5 gives a one-color gap in
  this class, and its Lemma 2.2 gives path-perfectness when
  the independence number is at most three. We invoke that
  lemma and the original vertex-critical reduction. The new
  ingredient treats unbounded independence number: criticality
  supplies all missing labels. The resulting graph meets the
  [Chvátal–Erdős vertex-connectivity conditions](https://www.renyi.hu/~p_erdos/1972-02.pdf);
  a separate Hall construction directly stitches one path.
  These are applications to the original class, not claims
  of new Hamilton path or cycle criteria.
- The other forbidden class in Conjecture 7.3, with no induced
  pair of independent edges, is not covered here. The
  [Golan–Shan theorem](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v25i2p37/pdf/)
  for longest paths in that class and the [Ota–Sanka 2-tough
  Hamiltonicity theorem](https://arxiv.org/abs/2103.06760)
  address different conditions. The more general P5-free
  Conjecture 7.4 is also not settled.
- The [original Erdős–Hajnal odd-cycle question](https://mathweb.ucsd.edu/~erdosproblems/erdos/newproblems/OddCycleOfLargeChromaticNumber.html)
  asks for a chromatic threshold in all graphs. Chen's
  [2026 preprint](https://arxiv.org/abs/2608.00691) studies
  a finite-order additive gap for odd-cycle spans. Neither
  is the path-perfect assertion here.
- [Beaton, Cameron and van Omme (2026)](https://arxiv.org/abs/2610.10737)
  and [Beaton–Cameron’s co-gem critical-graph work](https://doi.org/10.1016/j.tcs.2025.115234)
  treat finiteness of coloring obstructions, not traceability
  of the co-diamond-free ones. This distinction matters because
  a finiteness statement at a fixed number of colors does not
  imply a spanning path in any of the obstructions.
- Searches checked the arXiv record and both authors'
  publication lists ([Cameron](https://www.smcs.upei.ca/~brcameron/research.html),
  [Clow](https://www.alexanderclow.com/publications)), and
  separately combined the paper title and authors with
  “path-perfect,” “Conjecture 7.3,” “co-diamond-free,”
  “edge plus two isolated vertices,” “vertex-critical,”
  “traceable,” and “Hamilton path.” The repo's issues and
  existing result locations were searched for the same aliases.
  No earlier full co-diamond-free resolution surfaced.
  This is a bounded prior-work search, not a claim to have
  certified publication priority.

The proof is general and written. The standard-library regression
checks exercise the Hall construction on every four-path endpoint
pattern satisfying its hypothesis, and construct full Hamilton
paths on randomized promised near joins. They are not the proof.
