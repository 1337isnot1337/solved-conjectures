# A pentagon-sensitive cut bound

Let W be any triangle-free graphon. Write p=t(K₂,W), K(x,y)=∫W(x,z)W(y,z)dz and t_j=t(C_j,W). As above m is ordered monochromatic mass. Then for every τ>0,

    m(W) ≤ p/2 − ∫d(x)² dx + τ + t₅/(2τ²).

Consequently m(W)≤1/16+(3/2)t₅^(1/3). In particular every triangle- and pentagon-free weighted graph satisfies the stronger bipartization bound β≤N²/32, and any counterexample to [Erdős #23](https://www.erdosproblems.com/23) has normalized pentagon homomorphism density greater than (7/600)³. This excludes a structural region but not typically the hard middle band.

**Two-neighbourhood cut.** For a root v, use a fractional cut whose mean sign at x is

    s_v(x)=1[K(v,x)≥τ]−W(v,x).

This lies in [−1,1]; indeed K(v,x)W(v,x)=0 almost everywhere by triangle-freeness. A probability assignment with mean sign s has monochromatic mass p/2+(1/2)∫∫W(x,y)s(x)s(y)dxdy, so some measurable cut does at least as well up to arbitrarily small error, by the interval-threshold rounding in [ROOT-CONVERGENCE.md](ROOT-CONVERGENCE.md). Average over v.

The product of the two W(v,·) terms integrates to t(K₃,W)=0. The two cross terms contribute exactly −∫∫1[K(v,y)≥τ] K(v,y) dvdy, which is at most −∫d²+τ. The remaining positive term is at most t₅/(2τ²), since 1[K(v,x)≥τ]1[K(v,y)≥τ]≤K(v,x)K(v,y)/τ² and ∫W(x,y)K(v,x)K(v,y) dvdxdy=t(C₅,W). This proves the displayed inequality. Jensen gives ∫d²≥p² and p/2−p²≤1/16. Set τ=t₅^(1/3) when t₅>0 and let τ↓0 if t₅=0. Finally 2/25−1/16=7/400, giving the necessary threshold.

For a finite triangle-free graph, a homomorphism C₅→G is necessarily injective: a repeated image yields an odd closed walk of length smaller than five, which would force a triangle or loop. Thus the t₅=0 condition is exactly pentagon-freeness for finite triangle-free graphs. The weighted graph statement follows by using its step graphon.

**Moment variant.** Take s_v(x)=aK(v,x)−W(v,x), where 0≤a≤1/||d||∞ (if p=0 the assertion is immediate). The identical expansion without thresholding gives

    m(W) ≤ p/2 − a t₄ + (a²/2)t₅.

The threshold and moment bounds are complementary. Neither is sufficient throughout the full middle-density band. This use of two-neighbourhoods differs from the edge-root four-cycle bound recorded in the [middle-band research overview](https://erdosproblems.ai/wiki/research/triangle_free_bipartization/proof_sketch).

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
