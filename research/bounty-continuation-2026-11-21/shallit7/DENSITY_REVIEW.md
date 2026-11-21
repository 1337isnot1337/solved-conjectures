# Independent review of the Shallit 7 density-route note

21 November 2026. Reviewed source: `agents/other_paid/shallit7/density-route-audit.md`, SHA256 `63055a3be9282a628dbebc999f754c3abed9c0759f46451cb1feafd10c495d6e`.

The restricted permutation-invariant theorem passes this review. It does not prove a density theorem for arbitrary context-free languages and does not decide the full primitive-word problem.

## The semilinear argument

Permutation invariance is used at precisely the necessary step: if both letter counts have a common divisor greater than one, the language must contain the displayed periodic rearrangement. Without permutation invariance this deduction is false.

In a linear component of the Parikh image, two independent integer period vectors have determinant nonzero modulo some prime. Solving the resulting two-dimensional congruence puts a nonzero count vector divisible by that prime into the same component. Adding a positive multiple of the prime to one coefficient preserves both membership and the congruence. This contradicts primitivity under the permutation hypothesis.

Thus each period set has rank at most one. Nonnegative coordinates imply that its nonzero periods lie on a ray with strictly positive total-coordinate functional. Each component contains at most one distinct count vector at a given length, even when its generating monoid has holes. Finitely many components and the central-binomial bound give the claimed $`O(n^{-1/2})`$ counting density. The zero vector and singleton components are correctly treated.

## Source boundaries

I opened [Sin'ya's primary manuscript](https://arxiv.org/pdf/2008.01413) and [Koga's primary paper](https://acta.bibl.u-szeged.hu/75631/1/cybernetica_025_numb_003_717-731.pdf). Koga explicitly distinguishes factor-density from counting density, states the regular-language theorem, and rejects the density-one regular-under-approximation shortcut. Its main theorem concerns the regular closure of factor-thin languages, not every context-free language.

The source note preserves these hypotheses. Its examples do not refute the stronger proposed counting-density assertion, and the reviewed proposition does not prove that assertion. The ordering constraint remains an additional unproved step. No full-target or novelty credit follows.
