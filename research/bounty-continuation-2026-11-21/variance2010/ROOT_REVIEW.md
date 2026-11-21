# Independent review of the matrix-potential corollary and Oja obstruction

21 November 2026. Reviewed sources:

- [Small-loss corollary](small-loss-corollary.md), SHA-256 `7046f0a29282ac2a0d8fc93c82c30e06d6a9406a7fcf3c756b36f6df747de326`.
- [Oblivious block obstruction](oja-oblivious-block-obstruction.md), SHA-256 `6d22c386c64564183c84491d2d0247684aa9727462a6a028f256a9d39c6e31b4`.
- [Exact paid-target audit](target-and-prior-audit.md), SHA-256 `e5b16d5f8f817240aaf842d190ff60b5f782755e37814496a9f68b98af7b69f1`.

The stated corollary and the full quantified Oja theorem pass this written mathematical review. The Oja theorem addresses the narrower assertion stated as Conjecture 1 in Garber's source, under uniform spherical initialization. No separate payment offer for that assertion has been established. Neither result supplies an algorithm or a lower bound for the whole US$100 online-variance target. The paid completion count is unchanged.

## 1. Small-loss calculation

I checked the actual 2019 paper's Lemma 5, equations (13)–(16), Lemmas 6–7, and implementation discussion. The relevant prior statements concern the averaged potential and averaged rank-one action. The note correctly does not identify each individual log-quadratic function with a convex potential whose gradient is the individual sketch.

Along the negative direction $`-H`$, the derivative of $`\langle H,\overline P(Y-tH)\rangle`$ is minus the nonnegative Hessian quadratic form. It is therefore nonincreasing. The Hessian bound, $`H^2\preceq\|H\|H`$, and Taylor's integral formula give the factor $`3/2`$ with the inner product evaluated at the initial point. This argument needs positivity of $`H`$, but no commutation with $`Y`$.

The potential telescopes with increment $`-\eta L_t`$. Its lower endpoint is $`-\eta L_* -\log(4n)`$ and its upper bound is $`-\eta\overline L+(3/2)\eta^2\overline L`$. Dividing by the positive coefficient for $`\eta\le1/3`$ gives the displayed regret inequality. Optimizing its upper bound in the two regimes $`\widehat L\ge6\log(4n)`$ and below that threshold yields the stated constants.

The deterministic potential inequality holds for each realized loss sequence. Conditional independence of the current loss from the current fresh sketch permits replacement of the averaged action by the sampled action in expectation. For adaptive losses, the deterministic almost-sure comparator bound is explicitly retained. Trace-norm duality gives the additive sum of implementation errors. None of these analytic facts proves that the required action can be computed in a horizon-independent quadratic number of operations.

## 2. The noncommuting block

The matrix $`K=e^Ye^{2X}e^Y`$ is positive definite, has determinant one, and has spectrum in $`[e^{-4},e^4]`$. Consequently its symmetric logarithm is defined and $`Z=-\tfrac12\log K`$ is traceless with norm at most two. The identity

```math
(e^Ze^Ye^X)(e^Ze^Ye^X)^\top=e^ZKe^Z=I
```

is exact. It uses the logarithm of the product in the stated order; commuting the factors would invalidate the construction.

Cyclicity of trace and the explicit two-dimensional matrices give $`\tfrac12\mathop{\mathrm{tr}}K=\cosh^2 2`$. The positive power-series difference in source equation (5) proves $`\|Z\|>\sqrt2=\|X+Y\|`$. Thus $`S=X+Y+Z`$ is a nonzero traceless symmetric matrix, and its positive eigenvalue is at least the stated absolute $`\delta>0`$. Appending zero blocks preserves that eigenvalue and turns the orthogonal product into an orthogonal matrix on every dimension $`n\ge2`$.

Each loss in source equation (9) is a positive semidefinite contraction: the exponential's scalar eigenvalues lie between $`e^{-4/m}`$ and one, and $`m\eta\ge4`$. Repeating each phase exactly $`m`$ times makes the block product $`e^{-6}O`$. There is no Euler approximation and no asymptotic replacement of a product by the exponential of a sum.

For the learner, Cauchy–Schwarz gives $`\|(I-\eta L)v\|\ge1-\eta v^\top Lv`$. Summing the negative logarithms then bounds the block loss below by $`6(1-\eta)/\eta`$. For the comparator, the spectral inequality $`e^D\succeq I+D`$ bounds the cumulative loss matrix above by $`(6I-S)/\eta`$. Applying a top eigenvector of $`S`$ bounds its minimum Rayleigh quotient by $`(6-\delta)/\eta`$. Subtraction yields a positive gap of at least $`\delta/(2\eta)`$ when $`\eta\le\delta/12`$.

Because every repeated block has the same loss sum, the best fixed-vector comparator over completed blocks is exactly the number of blocks times the one-block minimum. The learner lower bound holds for every entering vector. Hence rotations between blocks do not defeat the argument. Zero-loss padding contributes no regret, and the floor and ceiling bounds give $`\delta T/60`$ whenever the stated block-length condition holds.

## 3. Gain convention and all remaining regimes

The relation $`\eta=\mu/(1+\mu)`$ and the substitution $`A_t=I-L_t`$ give

```math
I+\mu A_t=(1+\mu)(I-\eta L_t).
```

The scalar factor cancels in the direction update. The gain comparator and actual gains transform to precisely the loss regret, and identity-gain padding has zero regret. This preserves the source problem's gain convention and its restriction to bounded symmetric matrices; the constructed gains are in fact positive semidefinite contractions.

For small positive $`\mu`$ and horizons too short for enough blocks, the source derives $`\mu T\le54`$. The constant-projection construction then has gain at most $`1/3`$ per round on the stated small-initial-mass event. The event's probability is uniformly positive in every dimension: using a common Gaussian numerator and adding denominator coordinates only decreases the normalized first-coordinate mass. The exact two-dimensional probability is $`(2/\pi)\arcsin\sqrt\varepsilon`$. This constant is very small, but is independent of all three quantified parameters. The zero-step case is covered as well.

For $`\mu`$ bounded away from zero, alternating complementary projections gives the exact scalar two-round product $`(1+\mu)I`$. The pair regret formula follows by writing the normalized projection mass after the first update. The sphere moment

```math
\mathbb E[w(1-w)]=\frac{r(n-r)}{n(n+2)}\ge\frac18,
\qquad r=\lfloor n/2\rfloor,
```

is valid also at $`n=2`$. Bounding the product outside the stated central interval by $`15/256`$ and everywhere by $`1/4`$ gives probability at least $`17/49`$. The lower bound on the number of completed pairs is valid for every integer $`T\ge2`$, including odd horizons. Thus the three regimes cover every fixed nonnegative step and every such horizon.

Every matrix sequence is chosen from the dimension, horizon, and step before the initial vector is drawn. The proof does not use an adaptive adversary, a shared-eigenvector premise in the noncommuting regime, or a bounded numerical search.

## 4. Prior statement, payment, and verification scope

I read Algorithm 1 and Section 3.3 of [Garber's primary preprint](https://arxiv.org/abs/2310.15559). Its Conjecture 1 concerns a step fixed across the horizon, and the surrounding discussion explicitly distinguishes an oblivious sequence from one that observes initialization. The reviewed theorem has the required quantifier order and even uses positive semidefinite inputs. This comparison is separate from the ongoing search for an earlier solution of that conjecture.

I also read the original [2010 paid problem](https://www.learningtheory.org/colt2010/papers/OpenProblemKale.pdf). It permits other matrix-learning algorithms, and already handles constant-rank losses in its own theorem. The Oja construction therefore cannot be called a negative resolution of that larger question. The 2019 corollary retains its existing authors' potential and does not claim new priority for it.

This is a written proof review. No Lean formalization, independent full audit of all prior manuscripts, sponsor acceptance, or payment is claimed.
