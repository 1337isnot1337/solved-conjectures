# Independent review of the finite-curve coverage diagnostic

Date: 21 November 2026. Reviewer: `demath_zzz_bounties`.

Reviewed source: `agents/root749/erdos1192/finite-curve-coverage-gap.md`, SHA-256 `27d8cf175ec6aa4b3f297c518e2d085dcf0d4415808f6848e65437c14a88cb31`.

The six sections pass written mathematical review. No finite computation was needed. The note does not resolve Erdős 1192, and this review certifies no novelty or prize eligibility beyond the separate source audit.

## Checks

1. **Axes.** The union of coordinate axes covers every vector with exactly the required number of summands, using zero coordinates when needed. Its full-line subset has exactly $`p^{r-1}`$ ordered representations of each line point, so its energy is $`p^{2r-1}`$. This proves the asserted failure of a cardinality-only argument.

2. **Moment curve.** For $`p>r`$, Newton's identities recover all elementary symmetric functions from the first $`r`$ power sums. Equality of root polynomials identifies multisets including repeated parameters. Thus each ordered tuple has at most $`r!`$ partners, giving $`E_r(C_r)\le r!p^r`$. The exact sumset size is the number of parameter multisets, $`\binom{p+r-1}{r}`$. Both the strict coverage failure and the asymptotic fraction $`1/r!`$ follow.

3. **Quadratic comparison.** For a nonzero first coordinate, the sum and difference of the two parameters are uniquely determined. The coordinate-swapped difference set covers the remaining nonzero axis, and zero is a difference. All four signed curves have the same second-order energy bound. The Fourier norm inequality is applied after disjointifying overlaps; it does not assume pointwise Fourier monotonicity. The stated union bound $`4^4\cdot2p^2`$ is valid.

4. **Signed cubic axis.** Every three-term representation can be assigned a sign pattern even when a parameter is zero. For the all-positive pattern, the vanishing first and third coordinates force a zero parameter and an opposite pair. For the two-positive pattern, the equations are exactly

```math
z=x+y,\qquad -2xy=v,\qquad -3xy(x+y)=0.
```

The nonzero second coordinate makes $`xy\ne0`$, forcing $`y=-x`$. The negative patterns give the negatives of these values. Since $`p\equiv1\pmod4`$, the positive and negative square classes agree. Conversely, if $`2v=a^2`$, the parameters $`a/2,-a/2,0`$ give the target. Hence the asserted if-and-only-if and the count $`(p-1)/2`$ of missing axis points are exact.

5. **Scope.** The obstruction concerns one signed curve over the specified prime family. It does not exclude other prime families, finitely many additional affine images, or other finite bases. A bounded finite union of invertible affine moment-curve images indeed retains critical energy; coverage remains unproved.

The finite-to-infinite transfer theorem is itself proved in the companion note. What remains conditional is its application to an unconstructed finite covering family. The final source now states this distinction explicitly. I reread the final source after that scope correction; all mathematical claims above are unchanged.

Verdict: accepted as an exact method diagnostic, with no completed bounty added.
