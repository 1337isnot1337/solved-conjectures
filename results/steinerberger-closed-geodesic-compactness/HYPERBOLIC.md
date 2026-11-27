# Hyperbolic nonattainment

[Steinerberger, Question 1.3](https://doi.org/10.1017/S0004972718001636) asks whether the flat two-torus compactness principle for closed-geodesic averages extends to other geometries, and explicitly suggests hyperbolic surfaces and groups. On hyperbolic surfaces even qualitative attainment fails. This is about functions of the **base point**, not arbitrary potentials on the unit tangent bundle.

**Theorem.** Every closed orientable hyperbolic surface S admits a smooth real function f of area mean zero for which

$$
\sup_{\gamma\text{ closed geodesic}} \left|\frac1{\ell(\gamma)}\int_\gamma f\,ds\right|
$$

is strictly positive and is not attained. The same statement holds if the supremum is restricted to simple closed geodesics. Any maximizing sequence in either formulation has lengths tending to infinity.

## A smooth base function

Choose a nonempty measured geodesic lamination with no closed leaf, for example the stable lamination of a pseudo-Anosov homeomorphism, straightened in the given metric. Use [Thurston's surface dynamics](https://doi.org/10.1090/S0273-0979-1988-15685-6) and [Penner's existence construction](https://www.ams.org/tran/1988-310-01/S0002-9947-1988-0930079-9/S0002-9947-1988-0930079-9.pdf). Write Λ for its closed support. It has area zero by [Birman–Series](https://www.math.columbia.edu/~jb/bdd-int.no-sparce.pdf), since all its points lie on complete simple geodesics.

No closed geodesic lies wholly in Λ. A geodesic tangent to one of its leaves coincides with that leaf by uniqueness. A transverse geodesic segment contained in Λ would, in a lamination flow box, meet a transverse interval's whole nondegenerate subinterval of plaque parameters. This would give Λ nonempty interior, contradicting its zero area.

Take an open neighborhood U of Λ with area less than half the area of S. There is a smooth h with 0≤h≤1, zero set exactly Λ, and h=1 outside U. For a construction, take a countable collection of nonnegative smooth bumps supported off Λ, with positivity sets covering its complement. Give them positive coefficients that make the series converge in every Cᵏ norm and keep the sum at most 1. Blend that sum with 1 using a smooth cutoff equal to 1 near Λ and 0 outside U. Set a=mean(h)>1/2 and f=a−h. Then f has mean zero and range in [a−1,a]. Every closed geodesic has average h strictly positive: it has a point outside Λ and hence an open subarc where h>0. Therefore its signed f-average is <a, and its negative magnitude is at most 1−a<a.

## Approaching the supremum

The oriented tangent lift of Λ is nonempty, compact, and invariant under the geodesic flow. It carries an invariant probability measure, for example by taking a weak limit of time averages of one orbit. That measure integrates the lift of f to a. The geodesic flow of a closed hyperbolic surface is a transitive Anosov flow, and invariant probability measures are weakly approximated by normalized periodic-orbit measures (see [Sigmund](https://doi.org/10.2307/2373591)). Thus closed geodesics have signed averages tending to a. The preceding strict inequalities show that a is the absolute supremum and is not attained.

For the simple version, use the measured lamination as a geodesic current. By [Thurston's density theorem, Proposition 8.10.7](https://library.slmath.org/books/gt3m/PDF/8.pdf#page=43), weighted simple multicurves approximate it in the measured-lamination topology. In the [geodesic current description](https://verso.mat.uam.es/~javier.aramayona/currents.pdf), the corresponding flow-invariant measures converge weakly: locally one takes the product of the transverse current with arc length along the flow boxes, and a finite partition of unity gives convergence on the compact unit tangent bundle. The total masses converge to the nonzero mass of the lamination lift, so the averages against the normalized multicurve measures tend to a. A normalized multicurve average is a convex combination of its simple components' normalized averages; choose a component of at least the average at each step. These simple closed geodesics have signed averages tending to a and individual absolute averages still strictly below a.

There are only finitely many closed geodesic images of bounded length on a compact hyperbolic surface. For example, move a point of a lift into a fixed compact fundamental region and use proper discontinuity to bound the corresponding deck transformations at any given length bound. Hence each fixed length bound leaves a strict gap to a. This proves the statement on maximizing sequences.

[Coordination issue #1094](https://github.com/1337isnot1337/solved-conjectures/issues/1094).
