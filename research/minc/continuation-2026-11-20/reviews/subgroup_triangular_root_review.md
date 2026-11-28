# Review of the subgroup and triangular-construction checkpoints

Date: 20 November 2026, America/Chicago.

This review records auxiliary deductions. No complete conjecture or problem
from Minc's list is resolved, and the requested total of ten is not met.
The order-six rank-two inequality is explicitly outside the requested scope
for a counted result. No historical-priority claim is made for these lemmas.

## Exceptional subgroup bound

The proof in [the Segre note](../inequalities/segre_alignment_checkpoint.md)
has two separate parts. The classical six-point Segre-cubic relation bounds
each exceptional subgroup coordinate by half the total squared coordinate
norm. A separate Bloch-vector moment argument proves, for a complex PSD
matrix of order six and rank at most two,

```math
\mathop{\mathrm{tr}}C_{(3,3)}(A)
\le 2\mathop{\mathrm{per}}A-9\prod_i a_{ii}.
```

Combining the parts gives

```math
f_{H,\mathrm{sgn}}(A)
\le \mathop{\mathrm{per}}A-\frac92\prod_i a_{ii}
```

for each exceptional subgroup. The proof handles zero diagonal entries
separately and otherwise uses diagonal normalization. The octahedral Gram
configuration attains the trace inequality.

Root checked the moment expansion, trace-tensor estimate, reduction to the
two boundary eigenvalue configurations, and the exact Bernstein lower bounds.
The independent reviews reconstruct the Segre coordinates and the moment
identities by different methods. The author's coordinate and scalar
certificate programs, the independent matching and Bernstein programs, and
the second reviewer's symbolic program all passed. These checks support the
displayed general rank-two inequality; finite numerical sampling is not its
proof. [First review](segre_bound_review.md),
[second review](segre_cubic_global_review.md).

## What Gaussian rank lifting proves

For a Gram factorization A=W*W and an r by s standard complex Gaussian
matrix G, Wick contraction gives

```math
\mathbb E C_\lambda(W^*GG^*W)
=\left(\prod_{(i,j)\in\lambda}(s+j-i)\right)C_\lambda(A).
```

Root independently checked the permutation reindexing and the positivity
argument. The central scalar follows from the hook-content and hook-length
formulas, or the classical Jucys--Murphy identities. A fixed real-linear
positive inequality involving only one block therefore lifts from rank at
most the number of rows of that partition to every rank.

This applies to the Segre alignment inequality, yielding

```math
f_{H,\mathrm{sgn}}(A)
\le \frac16\det A+\frac12\mathop{\mathrm{tr}}C_{(3,3)}(A)
```

for every PSD matrix of order six. It does not lift the mixed permanent
comparison: at projection dimension two the multipliers for the permanent
and the (3,3) block are 5040 and 144. At I_6 the displayed right side is 8/3,
whereas the permanent is one. Thus the all-rank statement still does not
prove permanent dominance.

The [rank-lifting note](../inequalities/isotypic_rank_lifting.md) and its
[independent review](isotypic_rank_lifting_review.md) include the derivation
and credited primary reference. Root read equations (1.5)--(1.6) in
[Matsumoto--Novak](https://arxiv.org/pdf/0905.1992).

## Orthogonal ancillary blocks

The [ancillary-block lemma](../inequalities/pot_valid_ancilla_obstruction.md)
assumes the permanent-on-top condition for the appended matrix C and proves

```math
f_{H,\chi}(A\oplus C)
\le\mathop{\mathrm{per}}(C)f_{K,\theta}(A).
```

Root checked the positive-definite product on the intersection subgroup.
The restricted character has the original degree, so no index or extra
degree factor appears. If the appended block has positive permanent, any
new violation forces a violation for an irreducible constituent on the
original matrix. Zero permanent gives a zero left side. This excludes a
specified transfer mechanism; it does not establish permanent-on-top for
arbitrary blocks. The [independent review](pot_valid_ancilla_review.md)
checks the same scope and the complex-character convention.

## Wang's triangular construction

The [bordered construction](../sign/bordered_partition_lifts.md) gives an
exact recurrence for every replacement-column permanent. Both the author
and [independent checker](bordered_partition_review.md) passed. The
[addendum](../sign/triangular_recurrence_invariant_gap.md) proves that a
specific order-nine seed, despite current permanent-determinant equality,
cannot be extended by this one-row operation to the next admissible order.
Its replacement values are

```math
64(8,22,68,14,0,5,-11,8).
```

The modular argument excludes a signed sum of absolute value 512. Root
checked that argument and reran both the author's exact program and the
independent Ryser/rational-elimination program. They also verify Wanless's
published order-ten witness, so the obstruction is to the specified
extension rule, not to order-ten existence.

The two-step identity and the full replacement hierarchy are algebraic
consequences of the one-step formula. The [independent review](triangular_recurrence_review.md)
records the hierarchy and checks its conventions against direct permanents.
The unproved step is a preserved class of coefficient polynomials that
forces suitable sign choices through every admissible order. Neither the
determinant corner identity nor current equality supplies that invariant.

## Target and priority boundary

The [remaining-target audit](../sign/remaining_target_audit.md) records why
the current routes to Problems 8, 11, 12 and 13 do not meet their full
quantifiers. An indexed Falikman abstract is retained as an unverified
priority lead; its inaccessible full text is not used as a theorem.

The earlier [Chollet priority correction](chollet_rank_priority_audit.md)
remains in force. Previously published bounds already imply the entire
rank-square region for ranks at least 18 and all sufficiently large orders
at each smaller rank. The finite residual is neither a full conjecture nor
a certified new result. No result in this checkpoint is entered in the
repository's solved-conjecture count.
