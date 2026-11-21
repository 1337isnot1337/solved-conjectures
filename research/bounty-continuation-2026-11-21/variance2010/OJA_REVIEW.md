# Independent review of the fixed-step Oja construction

Date: 21 November 2026.

Reviewed source: `../demath_zzz/pre2011-colt/oja-oblivious-block-obstruction.md`, SHA256 `6d22c386c64564183c84491d2d0247684aa9727462a6a028f256a9d39c6e31b4`.

Scope: an independent mathematical audit of Sections 2–5 and their stated quantifiers. The primary-literature and payment checks remain those of the source note. This review does not certify a separate payable target or a lower bound for all online matrix algorithms.

## Verdict

The construction and all three step-size regimes pass. For every dimension at least two, horizon at least two, and fixed nonnegative step size, it produces a deterministic PSD-contraction sequence, chosen before the random initialization, with linear regret with an absolute positive probability. The constants are extremely small but are independent of dimension, horizon, and step size. In the noncommuting-block regime the bound is deterministic in the initial direction.

## 1. Exact matrix block

For the source matrices $`X,Y`$, the positive definite matrix $`K=e^Ye^{2X}e^Y`$ has determinant one and spectrum in $`[e^{-4},e^4]`$. Thus $`Z=-\tfrac12\log K`$ is symmetric, traceless, and has norm at most two. The ordering is correct:

```math
(e^Ze^Ye^X)(e^Ze^Ye^X)^\top
=e^ZKe^Z=I.
```

The trace calculation is also exact: the anticommutation of $`X,Y`$ and their zero traces give $`\tfrac12\mathop{\mathrm{tr}}K=\cosh^2 2`$. The displayed power-series difference between $`\cosh^2 x`$ and $`\cosh(\sqrt2x)`$ has zero constant and quadratic terms and strictly positive coefficients from degree four onward. Consequently the source's $`\delta`$ is positive. Reverse triangle inequality gives $`\|X+Y+Z\|\ge\delta`$; tracelessness in the two-dimensional block makes this a positive-eigenvalue bound. Appending zero blocks preserves that eigenvalue and makes the orthogonal product the identity on the remaining coordinates.

For $`m=\lceil4/\eta\rceil`$, the losses in equation (9) have eigenvalues between zero and one. Each update factor is a positive definite exponential, so no zero-vector normalization is possible. Repetition for $`m`$ rounds gives the exact chronological product $`e^{-6}O`$. This is an identity, rather than an approximation whose error could accumulate with the number of blocks.

## 2. Regret inside and between blocks

The lower bound on learner loss uses the correct inequality direction. For each unit vector $`v`$ and PSD contraction $`L`$,

```math
\|(I-\eta L)v\|\ge1-\eta v^\top Lv>0,
\qquad
-\log\|(I-\eta L)v\|
\le\frac{\eta v^\top Lv}{1-\eta}.
```

The sum of the log-norm decrements is exactly six. This yields the loss lower bound $`6/\eta-6`$ for every entering direction. The operator inequality $`e^D\succeq I+D`$, applied separately to the three symmetric exponents, gives

```math
m\sum_iL_i\preceq(6I-X-Y-Z)/\eta.
```

Taking the comparator in the top eigendirection of $`X+Y+Z`$ gives comparator loss at most $`(6-\delta)/\eta`$. The condition $`\eta\le\delta/12`$ therefore gives block regret at least $`\delta/(2\eta)`$.

Repeated blocks have exactly the same matrix sum. Hence their best fixed-vector losses add; the comparator is not being changed from block to block. The lower bound on learner loss holds for every entering direction, so the rotations between blocks do not cause a gap. With at least two blocks' worth of horizon, the floor estimate and $`m\eta\le5`$ give $`\delta T/60`$. Zero-loss padding preserves regret.

## 3. Gain conversion and the remaining regimes

The substitution $`\eta=\mu/(1+\mu)`$, $`A_t=I-L_t`$ satisfies $`I+\mu A_t=(1+\mu)(I-\eta L_t)`$. It preserves normalized directions and converts loss regret exactly to the stated gain regret. Identity-gain padding is the correct image of zero-loss padding.

When the step is too small to fit enough exact blocks, the source proves $`\mu T\le54`$. With constant gain projection $`e_1e_1^\top`$, the initial squared first coordinate $`a\le e^{-108}/4`$ keeps that coordinate's normalized mass at most one third throughout the horizon. The dimension-two probability is $`(2/\pi)\arcsin\sqrt{e^{-108}/4}`$; coupling Gaussian coordinates shows this is a lower bound in every larger dimension. The same event works at step size zero.

For steps above the fixed positive threshold, alternating the complementary projections $`P,I-P`$ restores the initial direction after every pair. The pair regret is exactly

```math
\frac{((1+\mu)^2-1)w(1-w)}{1+((1+\mu)^2-1)w}.
```

The lower bound in equation (21) follows by replacing its denominator by $`(1+\mu)^2`$. For $`r=\lfloor n/2\rfloor`$, the beta-distribution moment is $`r(n-r)/(n(n+2))\ge1/8`$. Bounding $`w(1-w)`$ by $`15/256`$ off $`[1/16,15/16]`$ and by $`1/4`$ everywhere gives the stated probability $`17/49`$. Finally $`\lfloor T/2\rfloor\ge T/3`$ for every integer $`T\ge2`$, including the endpoint $`T=3`$.

These regimes cover all finite $`\mu\ge0`$ and all horizons in the theorem. Every sequence depends only on the public parameters $`n,T,\mu`$, never on the realized initialization. No correction is required to the mathematics audited here.

## Remaining scope

The result concerns one-vector Oja with a step fixed across rounds and uniform spherical initialization. It does not cover adaptive step sizes, restarted algorithms, density-matrix algorithms, or fresh action sampling from a cumulative matrix exponential. Establishing that this narrower statement itself has an active direct solver award is a separate task; this review does not increment the paid completion count.
