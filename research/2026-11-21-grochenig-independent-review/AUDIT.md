# Independent review of Gröchenig's upper-density counterexample

Date: 21 November 2026. Reviewer: the current group’s root worker, independently of the parallel group that authored the package.

Reviewed proof: [PROOF.md](../../results/grochenig-zero-density/PROOF.md), blob `1097105fc8ca04d67ca88a8cd55657869c9a96a9`. Verdict: the complete counterexample and its source scope pass. Priority is a separate audit.

## Original assertion

The full [published article](https://link.springer.com/article/10.1007/s44146-026-00264-3) was opened directly. Definition 2.5 expressly includes Gaussians among Pólya frequency functions. The displayed definition of the shift-invariant space allows bounded real coefficient sequences. Section 4.3 defines sign-change locations by skipping zero coefficients, uses translation-uniform Beurling densities, and asks the two-sign density inequality in Problem 4.12.

There is no lower bound on the magnitudes of nonzero coefficients. This matters because the construction uses blocks of rapidly decreasing amplitude. The zeros produced are distinct sign-changing real zeros of a nonzero entire function, so multiplicity and zero-set accumulation are not issues.

The Gaussian is also a stable integer-shift generator, as required by the standing convention in Section 3: its Fourier transform is a positive Gaussian, and the periodized squared transform is continuous, positive and bounded on a compact fundamental interval.

## Independent reconstruction

1. For the degree-$`N`$ polynomial with roots $`e^{4\pi},\ldots,e^{4\pi N}`$, every elementary symmetric coefficient is strictly positive up to the alternating sign. Hence all $`N+1`$ coefficients are nonzero and alternate.

2. Substitution into a Gaussian translate sum gives
```math
\sum_{k=0}^{N}p_{N,k}e^{4\pi k^2}e^{-\pi(x-2k)^2}
=e^{-\pi x^2}P_N(e^{4\pi x}).
```
The cancellation of $`e^{4\pi k^2}`$ is exact. The roots occur at the distinct integers 1 through N. At the $`N+1`$ half-integer test points, the signs alternate and all values are nonzero. The finite minimum of their absolute values is therefore strictly positive.

3. Normalization by the sum of absolute coefficients gives block coefficient mass $`2^{-N}`$ and a uniform real-line bound of the same size. A finite Gaussian sum tends to zero at both ends of the real line.

4. At stage N, moving the new block sufficiently far to the right makes all earlier blocks smaller than one quarter of the new block's minimum test value. The same motion makes the new block smaller than each of the finitely many assigned budgets at all previous test points. Both limits hold for the fixed block functions involved. Thus the two sets of inequalities are compatible; the recursive existence argument does not depend on a numerical search or an effective lower bound for the test minimum. An arbitrarily large even translation also supplies disjoint even-integer supports.

5. The disjoint coefficient masses sum exactly to one. For complex $`z=x+iy`$,
```math
|e^{-\pi(z-l)^2}|
=e^{\pi y^2}e^{-\pi(x-l)^2}\le e^{\pi y^2}.
```
The summable coefficient sequence therefore gives local uniform absolute convergence on every compact subset of the complex plane. The sum is entire and real on the real axis. Its real-line absolute value is bounded by one.

6. At any test point of block m, the earlier-block error is less than $`\delta_m/4`$. The later-block error is at most
```math
\delta_m\sum_{N=m+1}^{\infty}2^{-N-2}
=\delta_m2^{-m-2}\le\delta_m/8.
```
The total is strictly less than $`3\delta_m/8`$, so it cannot change the sign of a test value of magnitude at least $`\delta_m`$. This also proves that the entire function is nonzero. Each block supplies m distinct zeros in disjoint open intervals over total length m.

7. Taking arbitrarily large m gives upper zero density at least one. If the zero-density convention restricts starting points and lengths to integers, the containing interval of length m+1 gives m/(m+1), with the same limit. The source's translation supremum is essential; no fixed-origin density has been substituted.

8. Every coefficient sign-change location lies in the even integers, giving upper density at most one half. Within block N, its N alternating adjacent nonzero coefficients give N sign-change locations in an interval of length 2N. The upper density is therefore exactly one half. A possible additional inter-block sign change occurs at an even index and preserves the upper bound.

These steps establish one infinite counterexample:
```math
c\in\ell^1(\mathbb Z),\qquad
D^+(c)=\frac12,\qquad
D^+(Z(f))\ge1.
```

## Scope and conclusion

The proof refutes the source's complete universal assertion by disproving its upper-density clause. It does not settle the separate lower-density clause. Each finite block respects finite variation diminution: its total number of zeros does not exceed its total number of coefficient sign changes. The failure concerns how those zeros and sign changes occupy translated intervals.

No mathematical gap or changed hypothesis was found. No extra finite computation was needed for this review. The previously supplied exact checks are supplementary to the analytic construction. The result remains unrefereed; novelty depends on the separate source and prior-resolution audit.
