# Scope of the power-exponent extension

The [zero-free theorem](PROOF.md) covers every $`0<\alpha\le1/2`$. A simple family shows it cannot hold for every $`0<\alpha<1`$.

Let $`\alpha_*\in(0,1)`$ be the unique solution of $`\alpha_*=2^{-\alpha_*}`$. Fix $`\alpha\in(\alpha_*,1)`$, let $`D`$ tend to infinity through even integers, and take Taylor section degree $`n=D`$. Since $`(1-z^D)^\alpha=1-\alpha z^D+O(z^{2D})`$, the section at $`-1`$ is
```math
 P_D(-1)
 =\sum_{k=0}^D (-1)^k\frac{(\alpha)_k}{k!}-\alpha
 \ \longrightarrow\ 2^{-\alpha}-\alpha<0.
```
The limit follows from the alternating-series test and Abel's limit: the coefficients of $`(1-z)^{-\alpha}`$ decrease to zero for $`0<\alpha<1`$. For instance, the ratios equal $`1-(1-\alpha)/k`$, so the product tends to zero by divergence of the harmonic series. As $`P_D(0)=1`$, the real intermediate value theorem gives a zero in $`(-1,0)`$ for every sufficiently large even $`D`$. At $`\alpha=1`$ the claim fails directly by boundary zeros of geometric sections.

This is only a scope observation for the power-exponent extension. It does not refute Kovalev's square-root conjecture, which is proved in the main note. We do not assert the optimal range between $`1/2`$ and $`\alpha_*`$.
