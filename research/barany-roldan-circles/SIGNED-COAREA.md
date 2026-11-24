# Signed coarea improves the near-round range

This strengthens the quantitative bound in [Near-round convex boundaries](NEAR-ROUND.md) by using the orientation of the opposite-normal endpoint map. Not a resolution of the universal circle-intersection problem.

**Theorem.** Let `rB⊆K⊆RB` be a concentric sandwich for a planar convex body, and put `k=r/R>1/√2` and `g=2k²−1`. Some boundary point has at most `2+2⌊1/g⌋` intersections with each circle centered there. In particular the sharp bound is four throughout `k≥√(5/7)`. The final section proves this stronger range using the mean squared incoming-normal offset.

## Orientation and multiplicity

Keep the notation of the companion: on the positively oriented arclength of the outer parallel body, write `x=q+u`, where `q∈∂K`, `u` is its unit outward normal and `p=q−ℓu` is its opposite normal endpoint. The common ball ensures that `p·(−u)>0`. Thus the radial direction of `p` is homotopic to `−u` through nonzero vectors. The latter winds positively once, and radial projection of a convex boundary containing the origin in its interior is an orientation-preserving homeomorphism. The map `x↦p` therefore has circle degree +1.

Use positively oriented arclength for the target circle `∂K`. The map is Lipschitz by the companion proof, also in local target arclength coordinates: the radial parametrization has a Lipschitz radius, since the gauge of a convex body containing rB is 1/r-Lipschitz and the radius is its reciprocal on the unit circle. The direction map on ∂K is Lipschitz since all radii are at least r. Thus short target arclength distances are bounded by a fixed multiple of ambient distances. Its nondifferentiability points have image of length zero, and the one-dimensional area formula shows that its points with derivative zero also have image of length zero. Outside these two images and the arclength zero set of points with infinite multiplicity, each preimage is a transversal crossing of local degree +1 or −1 according to the sign of the derivative at that preimage. Indeed, a nonzero ordinary derivative gives strictly opposite signs of the difference from the target value on the two sufficiently small sides. The sum of the local degrees is the degree of the circle map. Consequently its almost-everywhere counts satisfy
```text
M_+(p) − M_−(p) = 1,        M(p)=1+2M_−(p).
```

## Bounding only the negative variation

Let `J` denote counterclockwise rotation by a right angle. At almost every outer parameter, `ẋ=Ju` and `u̇=bJu` with `0≤b≤1`. Indeed the outward normal angle is nondecreasing; and the residual of Euclidean nearest-point projection onto a convex set is nonexpansive. For the latter fact, the projection inequalities give `(x−x')·(q−q')≥|q−q'|²`; expanding the square of `(x−q)−(x'−q')` gives the claim. Thus `q̇=aJu` with `a=1−b≥0`.

At all relevant preimages outside the corner set of `∂K`, let `v` be the outward unit normal at `p` and write `ṗ=dJv` for signed arclength speed. Taking the `Ju` component of the differentiated endpoint identity yields
```text
d(v·u) = a−ℓb.
```
The companion proved `v·u≤−g<0`. Therefore where `d<0`, its magnitude is at most `a/g`. The preimage of the countable corner set contributes zero to arclength variation by the area formula, so the omitted targets do not affect this inequality after integration. The signed area formula, restricted to negative-speed sources, gives
```text
∫_{∂K} M_−(p) ds ≤ (1/g)∫ a ds = perimeter(K)/g.
```
The equality for the projection variation was proved in the companion note.

For `k<1` this integral inequality is strict. In the companion angular bound, equality `|v·u|=g` requires `h=|q−(q·u)u|=√(R²−r²)`, hence `|q|=R` and `q·u=r`. But at a smooth point of `∂K` with `|q|=R`, the radial outward unit vector is itself a support normal, and it must equal the unique `u`. This gives `q·u=R>r`, a contradiction. Corners of `∂K` have arclength zero and their preimages under the projection `q` have zero integral of `a` by the area formula. Thus `|v·u|>g` wherever the integrand can contribute, up to zero integral, and `a` has positive integral. If the negative-speed part has zero contribution already then strictness is immediate; otherwise integrate the strict pointwise improvement on that part. If `k=1` the body is a disk and needs no strict estimate.

Choose a regular target with `M_−(p)≤⌊1/g⌋`. As in the companion note, any positive-radius circle through `m` points of `∂K` produces at least `m−1` opposite normal pairs. Thus `m≤2+2⌊1/g⌋`. If `g≥1/2` and `k<1`, the stricter average is less than two, so a regular target has `M_−≤1`, giving four intersections. The odd regular polygons in the companion prove sharpness arbitrarily close to a disk.

## Improving the uniform sharp-four range to k≥√(5/7)

The estimate can retain the offset of each incoming normal instead of replacing every offset by its maximum. With `a,b` as above, put `h=q·Ju` (signed), `f=|q|²−r²`, and `H=√(R²−r²)`. The pointwise angular argument in the companion gives
```text
|v·u| ≥ cos(arcsin(|h|/R) + arccos(k)).
```
We gain a factor from the mean squared offset, with respect to arclength of the projected source boundary:
```text
∫ a h² ds ≤ (H²/2) perimeter(K).
```
Indeed `ḣ=a−b(q·u)` and `ḟ=2ah`. Integration by parts around the parameter circle gives
```text
∫ a h² ds = ½∫ ḟ h ds
          = ½∫ f(b(q·u)−a) ds
          ≤ (H²/2)∫ b(q·u) ds
          = (H²/2)∫ a ds.
```
The last equality also follows by integrating `ḣ`. All functions used are Lipschitz, so this calculation includes nonsmooth K. The pointwise bounds use `0≤f≤H²` and `q·u≥r`.

If `k<1`, the function
```text
B(t) = sec(arcsin(t/R)+arccos(k)),  0≤t≤H,
```
is convex and increasing: arcsine has those properties on this range, and so does secant for angles from 0 up to but not including π/2. Its values at the endpoints are `1/k` and `1/g`. Hence the secant-line bound and Cauchy–Schwarz give
```text
(1/perimeter(K))∫ M_−(p) ds
  ≤ (1/perimeter(K))∫ a B(|h|) ds
  ≤ (1−1/√2)/k + 1/(√2 g).
```
At `k≥√(5/7)` we have `1/k≤√(7/5)<71/60`, `1/g≤7/3`, and `1/√2<71/100`. The displayed upper bound is strictly less than
```text
(29/100)(71/60)+(71/100)(7/3) = 11999/6000 < 2.
```
Thus a regular target still has at most one negative preimage and three normal preimages in total. Therefore four is the sharp bound throughout `k≥√(5/7)`.
