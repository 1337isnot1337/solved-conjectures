# Independent root review

Reviewed 21 November 2026. The complete proof passes this independent mathematical review. This note records the derivation checks and the final source checks separately. The result is an ordinary written proof, without Lean verification; the accompanying exact algebra script is supplementary.

## Statement and parameter range

I read Conjecture 1 in the [latest primary preprint](https://arxiv.org/pdf/2108.09244), printed page 20. Its parameters are every positive real a and every b strictly between zero and one half. The factors on the right are independent. The proposed theorem preserves the complete statement; neither of the source's already proved parameter curves is counted separately.

## Mathematical checks

I independently reconstructed the convolution density from the two beta-prime densities. Splitting the substitution z=4t(1-t) into its two monotone halves gives the beta normalization printed in the proof. Pfaff's transformation changes the argument to x squared divided by (x+2) squared. Substituting x=2y/(1-y), expanding the positive hypergeometric series, and applying duplication to the rising factorials gives exactly equations (2)–(4), including the power of two and both copies of Gamma(b) in the denominator. The series excess is b-s, positive throughout the chosen interval -2a<s<0.

I then derived the transform of the square-root factor independently. The fractional linear substitution in J cancels every power of 1+y. Its beta parameters are 1/2-b and 2b-s, both positive. With A=-s and B=1/2-b, the denominator is 1+A-B. The required formula is exactly [DLMF 15.8.15](https://dlmf.nist.gov/15.8.E15). I inspected the primary HTML formula and its stated condition |x|<1; the proof uses x=(1-u)/(1+u) in (0,1). The new argument is 1-u squared, and the combined prefactor is 2 to the power s. There is no branch choice or continuation across a singularity in this step.

Averaging over U gives the stated T function. Its excess is a+b, strictly positive. Both displayed versions of K follow from the beta normalizations and gamma duplication. In particular, no missing factor of two remains from the two square-root substitutions.

Finally, applying Euler's transformation inside the beta integral for H changes its outer endpoint exponent to b-s-1. This gives the beta-function ratio in equation (12). Substituting that ratio into C and applying duplication at a+b proves equation (13), leaving precisely the Mellin transform of the independent beta-prime variable with shapes 2a and b.

All hypergeometric coefficients used for termwise integration are positive on the real interval -2a<s<0. Tonelli's theorem therefore applies directly. The beta parameters and series excesses prove finiteness, including at the integration endpoints. No conditional convergence or unjustified interchange is used.

The final distribution argument also passes. The product has finite moments on the strip -2a<Re(s)<b: its first factor has this strip, while the square-root factor has all negative moments and positive moments below 2b. The sum has the same required moment strip by the derived negative moments and the ordinary positive-power bound. Neighboring real moments dominate complex powers and logarithmic derivatives on compact substrips. Thus both transforms are holomorphic; equality on the negative interval extends to the imaginary axis. Uniqueness of the characteristic functions of the logarithms establishes equality in law. Equality of only a finite set of moments is not being used.

The standard-library verifier passed all 18 exact formal identities. These checks support the transcription and algebra audit; the proof above does not depend on numerical evaluation or a finite parameter screen.

## Final prior-resolution checks

The detailed search record is [SOURCES.md](SOURCES.md). I separately inspected the exact original statement, the primary quadratic transformation, and the recent [Mao–Tian manuscript](https://arxiv.org/html/2611.24348v1), posted 18 November 2026. Its Theorem 3.2 proves a restricted additive decomposition with both shape parameters at most one half. Remark 3.2 explicitly describes partial progress on the source's different Conjecture 2. It does not give the square-root multiplicative factor or settle the full Conjecture 1 considered here.

I also searched all 26 complete source-letter indexes of [10m-u/open-problems-catalog](https://github.com/10m-u/open-problems-catalog), whose complete recursive tree was pinned at ca8d4d44ba3db527f19f28928c240168f545ecfe, in addition to the subject files and archive checks documented in SOURCES.md. No matching prior resolution was found. These successful file reads are separate from the rate-limited global code searches, which supply no negative evidence.

The publisher PDF returned HTTP 403; it is not represented as read. The exact readable target is the latest primary arXiv statement, with the journal record and current author publication list checked independently. The search found no earlier settlement in the examined material. This is a bounded priority finding, not a guarantee about inaccessible or unindexed work.
