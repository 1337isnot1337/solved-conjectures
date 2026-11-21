# Independent review of the exterior-hull transfer

21 November 2026. Reviewed [the exterior-hull note](exterior-hull-evolution.md), SHA-256 `5252a4050f66118058fc4d4fb83f6f5fe71ef1a95a83b1dfc81a3f353de3edea`, together with the [earlier wall-accounting review](INDEPENDENT_REVIEW.md).

The transfer passes this written review under the complete admissible-strategy and finite-perimeter facts imported from Bressan–Talamini. It applies to the full rectifiable barrier class in that source. It does not determine the critical construction speed, prove the required retirement-time estimate, or create a second admissible fire strategy. This is not a Lean verification or a completed bounty.

## 1. Check of the imported decomposition facts

I checked the relevant statements in Ambrosio, Caselles, Masnou, and Morel, [*Connected components of sets of finite perimeter and applications to image processing*](https://math.univ-lyon1.fr/homes-www/masnou/fichiers/publications/connected.pdf), *JEMS* 3 (2001), 39–92:

- Proposition 2, printed p. 53, makes an open connected set with finite perimeter indecomposable.
- Proposition 3 and Remark 1, pp. 53–55, give boundary and perimeter additivity and the unique infinite-measure component when the partitioned finite-perimeter set has infinite measure.
- Theorem 1, p. 56, gives the maximality needed here: every indecomposable subset of the original set lies in one of its components, modulo volume-null sets.
- Equation (15), p. 58, places a component's essential boundary in the original essential boundary, modulo codimension-one null sets.
- Definition 4, p. 64, defines the exterior as the unique infinite-measure component of the complement of a finite-measure set.

These statements cover the infinite-volume complement directly. In particular, the proof does not quietly apply a finite-volume decomposition theorem to an infinite set or replace an exterior component by a component of a truncated box.

I also checked Proposition 2.1, equations (2.4)–(2.6), and the common-boundary identity preceding Proposition 4.1 of Bressan and Talamini, [arXiv:2610.36919v1](https://arxiv.org/abs/2610.36919). The review treats the source's SBV regularity, common-boundary fact, and weighted double-bubble theorem as imported results, rather than re-proving them.

## 2. The hull and its monotonicity

For bounded finite-perimeter $`E`$, the definition

```math
H(E)=\mathbb R^2\setminus C_\infty(E^c)
```

has the three claimed properties: it contains $`E`$, its reduced boundary is contained in that of $`E`$ up to $`\mathcal H^1`$-null sets, and its perimeter does not exceed $`P(E)`$. Complementation preserves the reduced boundary as a set and reverses its normal, so the component-boundary inclusion gives exactly the needed conclusion.

If $`E\subseteq F`$, the infinite indecomposable component of $`F^c`$ is an indecomposable subset of $`E^c`$. The maximality clause puts it in one component of $`E^c`$; its infinite measure identifies that component as the exterior. Taking complements proves monotonicity. No assertion that $`E`$ itself is indecomposable is needed.

The complement of a closed disk is open, connected, and has finite perimeter. Applying the same maximality argument to this subset of $`E^c`$ proves the claimed spatial bound. Therefore a bounded actual fire has a bounded analytical hull. The distinction from componentwise saturation for decomposable sets is necessary and is maintained in the reviewed proof.

## 3. Why the new free front lies outside an earlier hull

At two good times $`a\lt t`$, a reduced-boundary point of $`H_t`$ has density one half for $`H_t`$. Since $`H_a\subseteq H_t`$, it cannot have density one for $`H_a`$. The finite-perimeter trichotomy leaves density zero or the old reduced boundary, outside an $`\mathcal H^1`$-null set.

In the second case the component-boundary inclusion puts the point in both actual fire boundaries. The imported common-boundary identity places it on the constructed wall at time $`t`$. It is therefore absent from the new free front. This proves the claimed density-zero inclusion, with all exclusions made in the correct codimension-one measure.

This step is stronger than merely observing that the hulls are nested. Nestedness alone would not exclude a stationary free boundary; the actual fire's common-boundary identity supplies that exclusion.

## 4. Localized coarea and area growth

The coarea formula for the absolutely continuous part of the truncated arrival-time gradient can be restricted to any fixed Borel set. The estimate $`|\nabla^a v|\le1`$ bounds the localized gradient integral by the localized volume of the intervening arrival levels. For almost every level, equations (2.4)–(2.6) place the jump-boundary contribution on the wall. Removing the entire wall therefore gives a lower bound on that coarea integrand, with the direction of both inequalities as stated in the note.

For a fixed earlier good time, take the localization set to be $`H_a^{(0)}`$. The intervening actual burned volume there lies in $`H_b\setminus H_a`$. Section 3 places every later exterior free front in this same localization set. Hence

```math
|H_b|-|H_a|\ge\int_a^b\widehat F(t)\,dt.
```

Filling a formerly bounded complementary component can cause an upward area jump. Such a jump enlarges the left-hand side and causes no defect in this inequality. The argument does not equate filled area with actual burned area.

## 5. Time representatives and measurability

The countable right-limit construction gives increasing sets and a jointly measurable characteristic function. On a bounded time interval these sets lie in a fixed disk. Continuity from above then gives right continuity in $`L^1`$ and of their areas. The construction agrees with the original good-time hulls except at the at most countably many right jumps of their monotone area function: inclusion together with equality of area implies equality modulo planar null sets.

For completeness, the source's concise assertion about measurable perimeter kernels can be justified using the bound

```math
P(H_t)\le P(R_t)
=\mathcal H^1(F_t)+\mathcal H^1(W_t)
\le F(t)+\sigma t
```

at good times. The right side is integrable on every bounded time interval by Proposition 2.1. For the jointly measurable characteristic function, spatial distributional derivatives, their total variations, and restrictions to measurable sets thus define measurable kernels; this also follows by expressing variation through a countable dense set of compactly supported test fields. The exceptional times can be assigned zero front length. On each finite time interval the walls lie in one finite-length rectifiable set. Their nested, right-continuous membership can be represented using rational times, with Borel representatives modulo $`\mathcal H^1`$-null sets. Thus the wall and free-front restrictions used in the integrals cause no additional measurability assumption.

Taking good endpoints decreasing to arbitrary endpoints now extends area growth to every time interval. The initial hull area is $`\pi`$ by the unit-disk lower bound and the radius-$`1+t`$ upper bound. The first-crossing equality is also valid: approaching the crossing from below gives one inequality by monotonicity, while approaching it through the defining set from above gives the other by right continuity. Upward jumps cannot produce a missed downward crossing of the continuous quadratic comparison.

## 6. Transfer of retirement accounting and its limit

Density-one hull representatives are pointwise nested. Consequently $`\gamma(t)\cap H_t^{(1)}`$ is increasing and disjoint from the active hull wall. The inherited common-boundary property gives the same vector-BV decomposition as for the actual burned sets. The finite accounting lemma therefore applies without changing its coefficients.

At a first crossing, the double-bubble comparison uses actual total area $`\widehat A(t+T/2)`$, comparison total area $`c(t+T/2)^2`$, and comparison first-chamber area $`ct^2`$. The required ratio is at most one quarter. Integrating the two-time inequality and the established area growth yields precisely equation (15) of the reviewed note, including both retirement coefficients and the initial area term.

The retired hull wall includes boundaries of islands once the hull fills them. This repairs the earlier mismatch between zero spent wall and an internal unburned hole. It supplies no estimate forcing sufficiently much retirement sufficiently early. In particular, neither the terminal retired length nor an unsupported deletion of delaying walls can replace the two time integrals. That quantitative obligation remains the barrier to a full resolution of the paid problem.
