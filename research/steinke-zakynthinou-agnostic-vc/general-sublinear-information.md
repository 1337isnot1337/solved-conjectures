# A distribution-independent proper learner with sublinear information

Let $`X,H`$ be standard Borel spaces, with jointly Borel binary evaluation and VC dimension $`d\ge1`$. For every $`n\ge d`$ there is one universally measurable proper randomized learner with expected empirical excess $`O(\sqrt{d/n})`$ on every sample and whole-output information at most

```math
O\!\left(\min\{n,\sqrt{nd}\log(en/d)\}\right)
```

on every fixed paired pool and for actual iid CMI. It uses no prior knowledge of the feature marginal. The information is sublinear in $`n`$ as $`n/d\to\infty`$. Conjecture 6 asks for the stronger bound $`O(d)`$. [Published iid conjecture](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

For every finite bit pattern on $`m`$ positions, use analytic uniformization to choose a proper hypothesis realizing that pattern on the supplied feature tuple wherever feasible. The defining relation is Borel by joint evaluation. Extend each of the finitely many maps at that size with a fixed proper default. On a training tuple $`T`$, put all their outputs on all $`m`$-subtuples into a catalogue, together with the fixed default. Choose

```math
m=\min\left(n,\left\lceil\sqrt{nd}\log(en/d)\right\rceil\right).
```

When $`m=n`$ the catalogue realizes every trace. Otherwise, for a uniformly drawn $`m`$-subset $`M`$ of the full feature positions let $`\Delta(M)`$ be the largest disagreement fraction on the full tuple of any two hypotheses that agree on $`M`$. By the [disagreement-set sampling bound](approximate-catalogues.md#removing-a-loss-weight),

```math
\mathbb E\Delta(M)\le C\frac d m\bigl(1+\log(m/d)\bigr)
\le C\sqrt{d/n}.
```

This bound is deterministic in the full tuple. The first inequality follows by double sampling, using the product of two Sauer bounds for the traces of the disagreement sets, and then coupling the uniform $`m`$-subset to contain the distinct indices drawn in a sample of size $`m`$ with replacement. Repeated feature values cause no change, since the sampling is on positions. Hence there is at least one $`M`$ with the stated error bound. For every proper $`h`$, the catalogue representative of its trace on that $`M`$ has disagreement fraction at most that bound from $`h`$ on $`T`$. Its empirical loss on any labeling of $`T`$ differs by at most the same fraction. This gives the catalogue approximation on every sample.

The [linear-information catalogue learner](hidden-restriction-marks.md) adds $`O(\sqrt{d/n})`$ empirical excess and uses $`O(d+m)`$ whole-output information, since each candidate reads only its $`m`$ feature positions. Selector entropy supplies the $`n\log 2`$ cap. The maps meet the catalogue theorem's universal-measurability hypotheses, so this is a statement about the named proper output, with no exceptional feature marginal.
