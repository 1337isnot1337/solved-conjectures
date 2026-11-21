# Independent review of contact-time pruning

21 November 2026. Reviewed:

- [Contact-time deletion and the attachment obstruction](contact-clock-pruning.md), SHA256 `8a0920b63b4254fb032cecbfafef97d3dd52b3fce1d3f19df5c4a1c6df589d86`.
- [The attached-cycle budget check](attached-cycle-budget-check.md), SHA256 `d33e279430d6da46bce1b2773437fe4d06b0526fe393ee9eaac97736e64585b6`.

The stated reductions, the isolated-Jordan-curve deletion theorem with its clearance hypotheses, and the two calculations for the attached-circle family pass this written review. They leave the full critical-speed problem unresolved. No Lean verification or additional bounty completion is reported.

## 1. Finite completion and the exact prize

I reread the [sponsor's original problem](https://bpb-us-e1.wpmucdn.com/sites.psu.edu/dist/c/168431/files/2023/07/prize2.pdf). It asks for the critical construction speed, not merely an improved lower bound or one faster construction. The known upper side is supplied for every speed greater than two. The prize does not require deciding the behavior at equality.

In the finite-completion argument, the extra circle is built at the speed difference while the old strategy is retained. Before completion, adding that partial circle cannot increase the reached set, so it remains outside the fire. At completion its total extra cost is exactly the accumulated speed difference. After completion all construction stops and the circle encloses the fire. The total constructed length is finite because the original wall at that one finite time already has bounded length.

This proves the claimed reduction with arbitrary strict speed slack. It neither preserves the speed-two equality case nor changes a rectifiable barrier into a finite smooth graph. The fixed-barrier equivalence is an imported result of Bressan–Talamini, used in its stated scope.

## 2. The deadline criterion

The new contact set is bounded by the old contact set at the advanced time, restricted to the retained wall. The deleted and retained sets are disjoint, so subtracting the already contacted deleted length is legitimate. The displayed subtraction gives exactly $`\sigma t`$. Checking this pointwise in time requires no continuity of the delay function.

The criterion separates admissibility from containment. It also correctly requires the deleted length on the old clock, rather than its eventual total length. These distinctions prevent the invalid inference exposed by the earlier slit example.

## 3. Exterior approximation of a rectifiable Jordan curve

The revised proof supplies an actual exterior contour construction. I checked the classical facts used in the [proof of Lemma 3.1 of Sodin–Wennman–Yakir (2023)](https://link.springer.com/article/10.1007/s10955-023-03170-y): continuous homeomorphic boundary extension, membership of the conformal derivative in $`H^1`$ for a rectifiable Jordan boundary, its radial $`L^1`$ convergence, and absolute continuity of the boundary parametrization. These are the imported complex-analysis facts; the obstacle argument does not use that paper's probability results.

Inversion about an interior point maps the exterior, with infinity, to a bounded Jordan domain containing zero. The conformal map is normalized to send zero to zero. It has no other zero, so its modulus is bounded below on every closed annulus sufficiently near the unit circle. The reciprocal derivative formula is therefore valid both for the interior radial curves and for the absolutely continuous boundary trace.

Uniform convergence of the conformal boundary values and $`L^1`$ convergence of the derivatives give uniform convergence of the inverted contours and $`L^1`$ convergence of their derivatives. Their lengths consequently converge to the original perimeter. Every intermediate contour is analytic and simple, lies strictly outside the original obstacle, and is traversable by the fire.

The bounded filled domains of these contours decrease to the original closed Jordan domain. On a fixed compact containing them, this implies Hausdorff convergence. Since the remaining wall is outside the original interior and has positive distance from its boundary, all sufficiently close filled contours avoid the remaining wall. No unjustified smooth collar or conversion from equality modulo $`\mathcal H^1`$ to a traversable curve remains in the revised proof.

## 4. Detours, first contact, and containment

For a path with both endpoints outside an approximating filled contour, the first-entry/last-exit replacement leaves the exterior prefix and suffix untouched. The shorter contour arc has length at most half the contour length. It avoids both the original curve and the remaining wall. This proves the required upper bound on additional travel time.

The special starting-point case is handled correctly. A path may start in the initial disk inside an approximating contour even though the entire disk is outside the original obstacle. A fixed point of the disk is outside all sufficiently close contours. Connectedness of the open disk then supplies a contour point inside the disk, from which the replacement route may start at no initial travel cost. Thus no assumption of positive distance between the initial disk and the obstacle has been added.

For first contact, an old approaching path reaches some point of each sufficiently close contour within an arbitrarily small excess over the infimum contact time. From that point, the shorter direction reaches every other contour point within half the contour length. Uniform contour convergence yields closure contact with the whole original curve after an additional $`L/2`$, with the explicit arbitrarily small time slack retained in the proof.

These facts justify the two contact inclusions used in equation (7). The resulting bound is

```math
\mathcal H^1(\mathcal C_K(t))
\le \sigma t-(1-\sigma/2)L+\sigma\varepsilon.
```

Letting $`\varepsilon`$ decrease to zero proves every deadline for $`\sigma\le2`$. Before first contact, no new path can have crossed the removed curve: its first crossing would already give an old approaching path. If there is no finite contact, the same argument applies for every finite time.

For any newly reachable point outside the original closed Jordan domain, choose a sufficiently close contour also excluding that endpoint. The detour provides an old finite route. All remaining newly reachable points lie in the bounded filled obstacle. This proves preservation of eventual boundedness, separately from the budget calculation.

## 5. The attached-circle family

With the circle centered at $`(3,0)`$ and vertical arms extending to heights $`\pm H`$, any route from the initial disk to $`(6,0)`$ must cross the line $`x=3`$ beyond the two tips. The length lower bound is the sum of the two Euclidean distances through that crossing, less the initial disk radius. Approaching a tip gives the matching infimum, and the supporting-line distance check ensures that those routes avoid the circle. Without the circle, the length-five horizontal route is available. Thus the unbounded deletion advance is correct.

The separate earlier-budget calculation is also correct. The tangent point is $`(8/3,2\sqrt2/3)`$, its distance from the origin is $`\sqrt8`$, and the remaining circle arc to the upper junction has length $`\arcsin(1/3)`$. This reaches the left semicircle. Direct left approaches reach the upper arm from height $`3/\sqrt8`$ onwards; the short lower portion is reached by the tangent-and-arc route followed by the arm. Reflection covers the lower half.

At the tip clock the contacted length is therefore at least $`\pi+2(H-1)`$, exceeding $`2(\sqrt{H^2+9}-1)`$ for all $`H\ge3`$. Squaring the positive quantities reduces the strict inequality to $`4\pi H+\pi^2>36`$. Even if every boundary route is expressed with an arbitrarily small time excess, admissibility at those later times and a scalar limit give the same contradiction; no attainment at a forbidden wall point is required.

The optional enclosing circle stays outside these paths. It preserves both the detour calculation and the earlier budget violation. Thus this family refutes a purely geometric half-perimeter deletion bound, but supplies no obstruction to a stronger deletion theorem that assumes all original subcritical deadlines.

## 6. Remaining scope

I checked that both Lemma 2.2 and Lemma 2.4 of [Bressan–Chiri](https://cvgmt.sns.it/media/doc/paper/4904/opt-barrier.pdf) assume a connected complement. Their introduction already identifies the cascade by which removing an interior delaying component can invalidate later walls. The revised note keeps those conditions and credits that machinery.

The isolated-loop proof uses positive clearance from the remainder and the absence of remaining wall inside the loop. Neither the conformal approximation nor the exact deadline criterion removes those assumptions. Curved, attached, or accumulating networks still need a global estimate that charges accelerated arrivals to wall already contacted. The two notes do not provide that estimate or the earlier retirement-time bound required by the full fire problem.
