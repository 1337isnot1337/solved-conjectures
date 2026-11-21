# Independent review of the weighted distance estimate

Algebra lane, 21 November 2026.

Status: [WEIGHTED_DISTANCE.md](WEIGHTED_DISTANCE.md) passes this independent mathematical review. The reviewed file has SHA-256 `4e5a127319f13b45580e5fdcb2c8efcec1dcfcd486a9e576646e44487637ffd4`.

For the near normal fiber, bounded density gives

```math
a_{\mathrm n}^2
\le4\phi(0)\int_{|s|\le1}|s|g\,d\gamma_1
\le4\phi(0)e^{1/16}b_{\mathrm n}.
```

For the far fiber, weighted Cauchy--Schwarz gives

```math
a_{\mathrm f}^2
\le\left(\int_{|s|>1}e^{-s^2/16}g\,d\gamma_1\right)
\left(\int_{|s|>1}e^{s^2/16}g\,d\gamma_1\right)
\le\sqrt{8/7}\,b_{\mathrm f}.
```

After the factor two from splitting the mass, the near coefficient is less than $`64/15`$ and the far coefficient is less than $`4`$, so the common constant five is valid. Tangential weighted Cauchy--Schwarz contributes exactly

```math
\int e^{|y|^2/16}\,d\gamma_{r-1}(y)
=(8/7)^{(r-1)/2}.
```

Thus the stated constant $`C_r=5(8/7)^{(r-1)/2}`$ holds for all measurable $`0\le g\le1`$. For $`r=1`$, the tangent space is zero-dimensional and the same calculation gives $`C_1=5`$.

Conditioning the nonnegative absolute transfer on the score space preserves its total mass and weighted cost and keeps its density between zero and one. This is valid even if the original competitor has arbitrary dependence on unused coordinates; no noise quadratic form is conditioned. At each mislabeled point exactly one unordered pair contributes an absolute transfer. Therefore the factor two in the symmetric-difference identity is exact, and the final pairwise Cauchy--Schwarz factor is $`\binom q2`$:

```math
\left(\sum_i\gamma_d(A_i\triangle C_i)\right)^2
\le4\binom q2 C_{q-1}W_\alpha(\mathcal A\mid\mathcal C).
```

The final scope limitation is necessary and correctly stated: the optimality proof's localization of nonpositive-deficit competitors does not by itself imply a quantitative estimate for all positive deficits. That extension needs its own localization/dichotomy argument for the same comparison simplex. No mathematical correction was required.
