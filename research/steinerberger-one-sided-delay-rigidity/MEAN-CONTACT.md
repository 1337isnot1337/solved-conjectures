# Mean contact repairs genuine two-radius rigidity

Let f be a continuous periodic real function with period T and mean m. Use the signed centered maximal average M f(x)=sup_{r≥0} A_r f(x). The following exact criterion is useful for the separate maximizing-radius problem:

    M f(x₀)=m  if and only if  f−m is odd about x₀.

Indeed, subtract m and write I(r)=∫_{x₀−r}^{x₀+r} f. For 0≤r≤T, periodicity and mean zero give I(T−r)=−I(r): the omitted end intervals of [x₀−T,x₀+T], after translating by full periods, combine into [x₀−r,x₀+r]. If M f(x₀)=0 then both I(r) and I(T−r) are nonpositive, so both vanish. Differentiating gives f(x₀+r)+f(x₀−r)=0, which extends to every real r by periodicity. Conversely oddness makes all centered averages zero.

Now suppose f is C^α with α>1/2, has at most two shortest maximizing radii, and M f touches its mean at even one point. Reflecting about that point exchanges f−m and −(f−m), so their shortest-radius ranges agree. [Steinerberger's Theorem 2](https://doi.org/10.4064/SM8368-12-2015), the original two-sided rigidity theorem, gives that f is a single sinusoid plus a constant. In particular this proves the sign-separated version in which radius 0 maximizes at every point with f≥m: continuity and a zero at mean level supply the contact point.

For a nonsinusoidal one-sided counterexample with two actual radii in this regularity class, the maximal average must therefore stay strictly above the mean at every center. On a compact period that gap is uniform: M f is continuous since the averaging family has the same uniform modulus of continuity as f. The remaining difficulty is to rule out or construct this positive-gap case; the one-sided delayed identity alone does not do so.
