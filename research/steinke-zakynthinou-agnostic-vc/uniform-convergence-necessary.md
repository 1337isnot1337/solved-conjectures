# The two agnostic CMI rates imply sharp outer uniform convergence

Let $`H`$ be a nonempty class of measurable binary predictors. Fix a sample size $`n`$ and a feature marginal $`\mu`$. Give labels independent fair bits, writing $`D_0=\mu\otimes\mathrm{Bernoulli}(1/2)`$. Suppose a learner has expected empirical excess at most $`\epsilon`$ on every sample and actual iid CMI at most $`b`$ under $`D_0`$. Assume the output loss is jointly measurable and the actual iid pool, learner and loss experiment is defined, allowing completed measurability. Joint universal measurability of the output loss on standard Borel spaces also suffices, using the completed laws. The learner may be improper and is compared to $`H`$.

For every labeled law $`P`$ with feature marginal $`\mu`$, writing $`P_n`$ for the empirical measure of $`n`$ iid draws and $`\ell_h`$ for zero-one loss, one then has

```math
\mathbb E_{P^{\otimes n}}^* \sup_{h\in H}
       |(P_n-P)\ell_h|
\le 4\epsilon+4\sqrt{2b/n}+\frac{1}{2\sqrt n}.
```

Thus Conjecture 6 with a common constant $`c`$ would imply the sharp outer expected uniform-convergence rate with constant $`4c+4\sqrt{2c}+1/2`$. This implication uses the information bound only on the fair-label experiments, one for each feature marginal. [Conjecture 6 and the uniform-convergence bound in Theorem 2](https://proceedings.mlr.press/v125/steinke20b/steinke20b.pdf)

## Fair-label empirical improvement controls the signed process

Fix $`h_0\in H`$. For a feature tuple $`x`$ and signs $`s`$, put

```math
R^+(x,s)=\sup_{h\in H}\frac1n\sum_{i=1}^n
            s_i\bigl(h(x_i)-h_0(x_i)\bigr).
```

This quantity is nonnegative. On a fair-label sample $`z`$ with $`s_i=2y_i-1`$, it equals the empirical loss of $`h_0`$ minus the best empirical loss in $`H`$. Write $`r(z)`$ for the learner's expected training loss given that sample, integrating only the learner's randomness. The empirical guarantee gives the pointwise bound

```math
 R^+(x,s)\le P_n\ell_{h_0}-r(z)+\epsilon.
```

The right side is completed-measurable. For a seeded learner, restriction to a fixed selector and removal of the independent unused column give a completed-measurable version on the training and seed coordinates. Kernel integration or Fubini then supplies the completed-measurable expected loss. As in the [actual iid information inequality](completed-finite-groups.md#the-information-inequality-for-the-actual-iid-experiment), the expected population loss minus expected training loss is at most $`\sqrt{2b/n}`$. Every output binary predictor with measurable loss has fair-label population loss exactly $`1/2`$. The same is true of $`h_0`$. Taking outer expectations of the pointwise bound gives

```math
\mathbb E_{\mu^{\otimes n}\otimes U}^* R^+
\le \epsilon+\sqrt{2b/n},
```

where $`U`$ is uniform on the sign vectors. Since the process contains the zero vector, the supremum of the absolute signed sum is at most $`R^+(x,s)+R^+(x,-s)`$. Sign symmetry and subadditivity of outer expectation therefore bound that absolute supremum in outer expectation by $`2\epsilon+2\sqrt{2b/n}`$.

For jointly universally measurable loss, the test used in the information inequality has a measurable version under the law of the pool and output times an independent fair selector. The actual law is absolutely continuous with respect to that product law because the selector has finite support and all its probabilities are positive. The same version therefore works under both laws in the KL comparison. The sign moment bound is unchanged, and Fubini with the independent unused coordinates still identifies expected population loss.

## Symmetrize the centered loss class

Let $`f_h=\ell_h-\ell_{h_0}`$. For any labeled sample from $`P`$ and independent fair signs $`e_i`$,

```math
\frac1n\sum_i e_i f_h(x_i,y_i)
=-\frac1n\sum_i e_i(2y_i-1)\bigl(h(x_i)-h_0(x_i)\bigr).
```

The signs $`e_i(2y_i-1)`$ are fair and independent of the feature tuple. Pulling back the measurable majorants in the fair-label bound therefore gives

```math
\mathbb E^*\sup_h\left|\frac1n\sum_i e_i f_h(x_i,y_i)\right|
\le 2\epsilon+2\sqrt{2b/n}.
```

For clarity, the outer symmetrization step can be proved using measurable majorants. Take an independent empirical measure $`P'_n`$. Integrate any measurable majorant of $`\sup_h|(P_n-P'_n)f_h|`$ over the independent sample. For each $`h`$, the result is at least $`|(P_n-P)f_h|`$ by Jensen. This holds simultaneously because the original majorant dominates the pointwise supremum. Infimizing over majorants yields the first inequality in

```math
\mathbb E^*\sup_h |(P_n-P)f_h|
\le \mathbb E^*\sup_h |(P_n-P'_n)f_h|
\le 2\mathbb E^*\sup_h\left|\frac1n\sum_i e_i f_h(x_i,y_i)\right|.
```

For the second inequality, swapping the two independent observations in each row according to a fixed sign vector preserves the joint law and hence the outer expectation. Average over the finitely many sign vectors, then use the triangle inequality for the two signed sums and subadditivity of outer expectation. Completion does not alter the argument, since a bounded completed-measurable majorant can be modified to an ordinary measurable majorant on a measurable null hull.

Finally $`\ell_h=f_h+\ell_{h_0}`$. The deviation of the one fixed zero-one loss has expected absolute value at most $`1/(2\sqrt n)`$, by its variance. Adding this to the centered bound proves the assertion.
