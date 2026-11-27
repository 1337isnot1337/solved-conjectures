# The obstruction survives strict local maximizing radii

There is a smooth, mean-zero, sign-changing periodic nonsinusoid for which radius 1 is a strict **local** maximum of the centered signed average at every negative point. This is stronger than the shifted identity in [the original conjecture](PROOF.md) but does not assert that radius 1 is globally maximizing, or that the maximizing-radius range is finite.

Work with period 4. Choose three nonnegative smooth bumps of integral 1 per period, b₀,b₁,h, in small disjoint intervals around centers 0, 3/2, and 3/4 respectively. Take a common support radius a<1/32. For x within a of x_j (x₀=0, x₁=3/2, modulo 4), its radius-one interval contains the entire support of b_j and h and none of the other negative bump. The four endpoint neighborhoods x_j±1+[-a,a] are mutually disjoint and disjoint from all three bump supports.

Take a smooth positive background g, equal to 1 away from slightly enlarged endpoint neighborhoods. On each of the four neighborhoods prescribe, with u=x−x_j,

    g(x+1)=1−εe^u,        g(x−1)=1−εe^(−u).

Smooth cutoffs on the four disjoint neighborhoods give such a g for small ε>0 and g tends uniformly to 1 as ε→0. Put D=∫₀⁴g, L_j=∫_{x_j−1}^{x_j+1}g−g(x_j+1)−g(x_j−1), P=D−L₀−L₁, and N_j=P+L_j. For small ε, P and N_j are positive: they all tend to 4. Define

    f=g+P h−N₀ b₀−N₁ b₁.

Its integral per period is D+P−N₀−N₁=0. It is negative somewhere inside each negative bump support (their maxima are at least 1/(2a), and N_j is near 4), positive away from these supports, and constant on nonempty open gaps. In particular it is nonsinusoidal.

For x within a of x_j, write I(x)=∫_{x−1}^{x+1}f and S(x)=f(x+1)+f(x−1). The formula for N_j gives I(x_j)=S(x_j). The prescribed endpoints give I′(x)=f(x+1)−f(x−1)=S′(x), so I(x)=S(x) throughout the neighborhood. If A_x(r)=(1/(2r))∫_{x−r}^{x+r}f, this is A_x′(1)=0, retaining the undifferentiated stationarity condition from Steinerberger's argument. A second derivative at that stationary point gives

    A_x″(1) = [f′(x+1)−f′(x−1)]/2
            = −ε(e^u+e^(−u))/2 < 0.

Thus radius 1 is a strict local maximum at all possible negative centers, as claimed. The shifted endpoint values are positive and both shifted derivatives are nonzero there. This counterexample does not rely on stationarity through a flat interval of radii.
