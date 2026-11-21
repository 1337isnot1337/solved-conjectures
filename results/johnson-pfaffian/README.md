# Johnson's conjecture

**Lean status:** partial

Complete proposed proof of Conjecture 7.1 in William Johnson's *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, [arXiv:2610.24371v1](https://arxiv.org/abs/2610.24371v1). Three separate internal mathematical reviews passed. The current-source and seven-archive priority audit found no earlier complete resolution within its documented scope. The result remains unrefereed.

For every positive nonincreasing log-convex function on the positive half-line, every strictly ordered real configuration of positive even size, and every perfect matching, the skew distance-kernel Pfaffian is at least the matching's product of positive entries.

The proof establishes a more general theorem for products of circular interval factors. A positive diagonal scaling replaces a wrapped interval by its ordinary-interval complement. Johnson's existing endpoint inequality can then be applied after any cyclic rotation, giving an adjacent-pair deletion inequality. Repeated deletion proves every noncrossing matching bound; uncrossing gives every matching. A finite mixed-difference decomposition of the logarithm places the conjecture's whole kernel class in this matrix class.

- [Complete proof](PROOF.md).
- Independent mathematical reviews: [combinatorics](COMBINATORICS_REVIEW.md), [analysis](ANALYSIS_REVIEW.md), and [root](ROOT_REVIEW.md).
- [Source and prior-resolution audit](PRIOR_AUDIT.md), [machine-readable reading record](PRIOR_SCAN.json), and [additional AIM/OpenAI audit](../../research/2026-11-21-aim-openai-priority/AUDIT.md).
- [Exact supplementary checker](verify.py) and [recorded output](check-output.json).
- [Research history](../../research/johnson-pfaffian/) and [coordination issue 211](https://github.com/1337isnot1337/solved-conjectures/issues/211).

Run the supplementary checks from the repository root:

```sh
python3 results/johnson-pfaffian/verify.py
```

Only Python's standard library is required. The checker tests exact algebraic identities, signs, and indexing conventions. Its finite cases are not premises of the universal proof.

Johnson's endpoint inequality, original kernel uncrossing reduction, rainbow bound, and Albouy–Moeckel nonvanishing result are credited explicitly. This package counts the separately stated all-matching conjecture once. Lean verifies the actual signed matching-sum Pfaffian and its four-node bound, the all-order source kernel interval decomposition, complement and diagonal scaling, cyclic Pfaffian invariance, the interval pigeonhole lemma, the local uncrossing step, and the commutative-ring twin-row Pfaffian deletion identity, and coefficientwise nonnegativity of the interval Pfaffian polynomial in every even order. The general even-order endpoint inequality and matching induction remain unformalized; the full repository gate is pending.
