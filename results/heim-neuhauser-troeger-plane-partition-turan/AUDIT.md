# Source and independent audit

The publisher's [Conjecture 2](https://doi.org/10.1007/s00026-022-00604-4) specifies every integer index at least 12 and every real parameter at least 1. It differs from the previously proved [ordinary plane-partition log-concavity](https://doi.org/10.1016/j.aim.2022.108692), which uses parameter 1, and from the stronger two-index phrasing of Conjecture 3. A targeted Nov. 24, 2026 search checked source titles, citation trails, original parameter ranges, and known specializations. No earlier full real-parameter proof was located. This bounded check does not establish exclusive priority.

## Audit of the Fourier certificate

- The tilted coefficient law has mean exactly the target index; Fourier inversion gives the centered weighted real integral for strict midpoint concavity of the three probabilities. AM–GM and cancellation of the tilt imply the polynomial Turán inequality.
- With $u=t\sqrt V$, the bounded normalized third cumulant gives nonnegative cosine through $u=3$ and cosine at least $73/81$ through $u=2$. A finite rational Taylor lower sum proves the positive contribution exceeds $2/5$.
- The geometric-series identity for the lower envelope of the damping was independently rederived. Its clipped expression is monotone in both the angular parameter and the coefficient. Separate bounds treat the middle range, the large normalized angle with small physical angle, and the entire large physical angle range. Overlap between bounds is safe.
- In each rational box the exact positive coefficient sums bound the cumulants and normalized angle. The outer contribution at unbounded real parameter reduces to its lower boundary because $B^{3/2}e^{-cB}$ decreases once $cB\ge3/2$. For saddle radii at least 0.9 this domination is obtained analytically with $B\ge90$.
- The exponential calculation rounds its argument down and uses a positive partial sum of the exponential before taking a reciprocal, yielding an upper bound. Square roots and the constant pi are also bounded in the safe direction. Thus the check covers the continuum, not a grid sample.
- Below index 251, multiplication by a positive factorial scaling reduces every required inequality to coefficientwise sign tests after shifting the real parameter by 1. Strict positivity at the endpoint is checked explicitly.

Both standard-library scripts are part of the proof. The statements are internally reviewed but await external refereeing. The separate proposed root-ratio theorem appears in [its own entry](../heim-neuhauser-plane-partition-polynomization/).

Lean proves strict Turán for every real parameter at least 1 and every index at least 12. The finite coefficient check ends at 250 and the uniform Fourier proof starts at 251. [Formalization and shared receipt](FORMALIZATION.md).
