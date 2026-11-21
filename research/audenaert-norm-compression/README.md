# Audenaert’s conjecture

Research for [issue 213](https://github.com/1337isnot1337/solved-conjectures/issues/213). The original conjecture remains unresolved in this work. No result entry or conjecture count is added.

The target is Audenaert’s norm-compression inequality for every complex matrix with two block rows, arbitrary compatible internal dimensions, and any finite number of block columns. If `C_p(T)` replaces each block by its Schatten `p` norm, the assertion is

```math
\|T\|_p\ge\|C_p(T)\|_p\quad(1\le p\le2),\qquad
\|T\|_p\le\|C_p(T)\|_p\quad(2\le p\le\infty).
```

The primary source is [Audenaert, Conjecture 1](https://arxiv.org/abs/math/0702186v2), published in *Linear Algebra and its Applications* 428 (2008), 781–795.

## This checkpoint

- [Source audit](SOURCE_AUDIT.md): exact source comparison, a correction to a misleading claimed-resolution summary, prior endpoint and interior work, and bounded archive coverage.
- [Entropy derivative](ENTROPY_DERIVATIVE.md): a self-contained necessary entropy inequality, including the derivative of the compressed entries and singular boundary cases. A strict entropy violation would refute the full conjecture on an interval of exponents around two. No such violation is supplied.
- [Row and column entropy tradeoff](HOLEVO_TRADEOFF.md): an exact decomposition into two Holevo quantities. Neither term alone gives the required scalar entropy; the note states the additional comparison that remains unproved.
- [Gram formulation](GRAM_FORMULATION.md): the equivalence of the two-row norm assertion and the prescribed-diagonal-block positive-matrix assertion when dimensions are universally quantified. This is a reduction, with no resolution or priority claim.
- [Joint-measure route](HANNER_ROUTE.md): an exact pair of scalar examples with identical global row-pencil data and different compression targets. This identifies the additional compatibility with columns needed to use Heinävaara’s theorem.
- [Independent review](COMBINATORICS_REVIEW.md): the derivative and boundary cases pass. An exact infinite family shows why a direct application of the recent Schur-weighted entropy theorem cannot provide the missing bound.
- [Native archive scanner](scan_native_archives.py): an offline discovery tool with explicit size and encoding limits. It does not perform formal verification or prove absence of prior work.

The known `p=1` endpoint, three-column reduction, scalar-cone concavity, and triangular entropy theorem are prior work. The proposed derivative condition is a research route, with no novelty claim attached to the differentiation itself. No Lean work was performed.
