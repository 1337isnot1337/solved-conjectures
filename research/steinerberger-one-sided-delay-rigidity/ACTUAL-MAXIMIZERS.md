# Actual maximizing radii: two analytic restrictions

These are partial results on the distinct, stronger conjecture in [Steinerberger §1.5](https://www.impan.pl/shop/en/publication/transaction/download/product/91307#page=4), that a bounded real function with finitely many minimizing maximizer radii should be a single sinusoid plus a constant. See also [the one-sided delay disproof](PROOF.md). None of the delay examples are claimed to have finitely many actual maximizing radii.

Write A_r f(x) for the centered signed average, and A_0f(x)=f(x) for continuous f. A positive radius maximizing A_r at a center x must satisfy ∂_r A_r f(x)=0.

## Periodic real-analytic functions

Suppose f is periodic, real analytic and nonconstant. Subtract its mean. Some open interval consists of negative values, on which radius 0 does not maximize, since the averages approach zero as r grows. Suppose an actual maximizing radius can be chosen at every point of that interval from a countable set of finite radii. For each candidate r>0, x↦∂_r A_r f(x) is real analytic. Unless it vanishes identically, its zero set is discrete and thus countable. Countably many such zero sets cannot cover the open interval. Hence some positive fixed radius is stationary at every center. [Steinerberger's published Theorem 1](https://doi.org/10.4064/SM8368-12-2015) then gives a single sinusoid. This uses actual maximization, not merely stationarity on the negative set.

## Real trigonometric sums with separated phases

Let f be a finite sum of at least two nonzero real sinusoidal modes, whose positive frequencies ω₁<⋯<ω_m are rationally independent. It cannot have only countably many possible chosen maximizing radii. In particular no genuine two-frequency sum has this property: the rational-ratio case is periodic.

For a positive candidate radius r, either x↦∂_r A_r f(x) is identically zero or its zero set is countable. By linear independence of the distinct frequencies, global stationarity at r means each ω_j r satisfies z cos z−sin z=0. If z_* is the first positive nonzero solution of this equation, every globally stationary positive radius is at least z_*/ω₁. This radius scale is strictly greater than r_*=z_*/ω_m.

The function sinc(z)=sin(z)/z has a unique global minimum on z≥0 at z_*. On (π,2π) its sole interior minimum is the unique root of tan z=z in (π,3π/2); on [0,π] it is nonnegative, and for z≥2π its absolute value is ≤1/(2π)<|sinc(3π/2)|. This proves the uniqueness statement.

By the Kronecker density theorem, the phase orbit of f approaches a point at which every lower-frequency mode has value 0 and the highest-frequency mode has negative amplitude. At that phase, the average as a function of r is a negative constant times sinc(ω_m r); thus at r_* it is strictly greater than its supremum on {0}∪[z_*/ω₁,∞). The gap is positive by uniqueness, continuity, and decay. The same strict separation holds on a small phase neighborhood, because |sinc|≤1 makes dependence on mode amplitudes uniform over r≥0. The orbit meets that neighborhood on a nonempty open set of real x.

At every such x the maximum is attained at a finite positive radius (its value at r_* is positive and its tail tends to 0). None of the globally stationary radii can maximize there. If the chosen maximizing radii formed a countable set, the resulting countably many non-global stationary zero sets would have to cover this open set, contradiction. This argument leaves arbitrary smooth, nonsmooth, or infinitely supported f open.
