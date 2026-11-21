# Independent algebra-lane review

21 November 2026. Reviewed `PROOF.md` independently. Mathematical verdict: the written counterexample is valid, subject to the separate prior-art audit. No correction to the argument was required.

## Primary statement checked

I independently read the publisher's full text of Karlheinz Gröchenig, [*Infinite totally positive matrices: some open problems*](https://link.springer.com/article/10.1007/s44146-026-00264-3), especially Section 4.3 and Problem 4.12. The problem asks the displayed `D^±(Z(f)) <= D^±(c)` inequalities for every member of the shift-invariant space with bounded coefficient sequence. It does not require the nonzero coefficients to be bounded below, the support to be relatively dense, or the signs to alternate uniformly.

The source's set `M(c)` marks the left index of each sign change after skipping zero entries. The proof uses this convention exactly. The source uses maxima over integer starting points for coefficient density; these maxima exist because the counts are bounded integers. Writing a supremum instead has the same value. The proof explicitly supplies intervals with integer endpoints for the required zero-density lower bound, so no choice of real versus integer starting points affects the contradiction.

The Gaussian `exp(-pi x^2)` is an admissible Pólya frequency generator. The source's preceding theorem bounds the **lower** zero density by one for Gaussian-type generators. It gives no conflicting upper-density bound.

## Finite blocks

For each `N`, multiplication of

```math
e^{-\pi(x-2k)^2}=e^{-\pi x^2}e^{4\pi kx}e^{-4\pi k^2}
```

by the stated coefficient cancels precisely the `e^{-4 pi k^2}` factor. Thus the Gaussian sum equals the positive normalization times `exp(-pi x^2) P_N(exp(4 pi x))` without any omitted scale or shift.

All `N` roots of `P_N` are distinct and positive. Its coefficients are nonzero and have sign `(-1)^(N-k)`. At the half-integer sample `j+1/2`, exactly `N-j` factors are negative. Therefore the alternating signs and strict positive minimum `delta_N` are correct. The real zeros occur at exactly `1,...,N` within each isolated block and are simple, though simplicity is not needed after the blocks are combined.

The normalization gives coefficient absolute sum exactly `2^(-N)`. This simultaneously supplies summability and boundedness of the resulting sequence. It does not alter any sign or root.

## Recursive placement

The dependence in the recursive construction is legitimate. At stage `N`, the current function `h_N`, its positive margin `delta_N`, all earlier functions, and all earlier sample locations have already been fixed. Increasing `L_N` makes the earlier blocks small at each new sample and the current block small at every earlier sample. Every relevant sum is finite, every tolerance is strictly positive, and every fixed Gaussian block tends to zero at both ends of the real line. A sufficiently large even `L_N` therefore satisfies all conditions simultaneously.

No later choice invalidates an earlier inequality concerning one pair of blocks. Future interference is budgeted separately by the summable bound in condition (7). The support intervals are disjoint, so assigning coefficients from distinct blocks cannot cause collisions.

## Infinite sum and retained signs

The coefficient norm equals `sum_(N>=1) 2^(-N)=1`. For `z=x+iy`, the absolute value of every shifted Gaussian is at most `exp(pi y^2)`, uniformly in its integer shift. The Weierstrass majorant on every compact set is therefore valid. The sum is entire, and absolute local uniform convergence also justifies regrouping the terms by blocks.

At a sample in block `m`, the total earlier contribution is less than `delta_m/4`. The total later contribution is bounded by

```math
\delta_m\sum_{N=m+1}^{\infty}2^{-N-2}
=\delta_m2^{-m-2}\le\delta_m/8.
```

Hence the perturbation is strictly smaller than the magnitude of the original block value. This proves the required signs for the **final infinite sum**, not merely for finite partial sums. It also proves that the final entire function is nonzero. Its zeros are consequently locally finite.

Each of the `m` disjoint successive sample intervals contains a distinct zero. Those intervals lie in an interval of length `m`, giving upper zero density at least one. Alternatively the containing integer-endpoint interval has length `m+1`, and the lower bound `m/(m+1)` has the same limit.

## Coefficient density

Every possible sign-change index is even. Thus an interval of length `n` contains at most `n/2+1` such indices, including any sign changes between blocks. This proves the upper bound `D^+(c)<=1/2` without assuming any particular interblock sign.

Inside the `N`th block there are `N` successive sign changes, at even indices from `L_N` through `L_N+2(N-1)`. An interval of length `2N` contains all of them. This proves the matching lower bound. Therefore the density is exactly one half, while the zero density is at least one.

## Scope and remaining gate

The construction uses one fixed Gaussian and one well-defined infinite sequence in `ell^1`, so it refutes the upper-density inequality in the original universal question. It is not a finite-case check or a conclusion inferred from computed roots. Refuting that clause answers the displayed joint assertion negatively; the lower-density clause remains undecided by this construction and is correctly identified as such in the proof.

This audit establishes correctness and source scope, not novelty. The analysis lane is performing the priority audit. I alerted it to the recent citing manuscript [*Totally Positive Interpolation and Critical Sampling of Positive Operator Orbits*, arXiv:2611.20122](https://borowiecki.dev/pdf/2611.20122), which must be distinguished from a prior resolution of Problem 4.12 before promotion.
