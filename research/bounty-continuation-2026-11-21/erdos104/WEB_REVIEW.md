# Independent review of the equal-radius web obstruction

21 November 2026. Reviewed source: `../../root749/e104-webs/unit-radius-web-obstruction.md`, SHA256 `b4818bed8d264e6dba9c23035c38a22acc1f226698495d4425ca6ca1f4d5792e`.

**Assessment:** the elementary mathematical claims in Sections 1, 2, 4, and 5 pass. This review does not certify a solution of Erdős 104 or a reward claim. The symmetry consequence in Section 3 is conditional here on the stated scope and exhaustive lists of Agafonov's Theorem 6.1; I have not independently rechecked every item of that classification for this review.

## 1. Discretization and circle–point duality

An additive-coordinate web on a nonempty regular coordinate patch supplies an arbitrarily fine N-by-N grid. Its first two families contribute N circles each and the sum-coordinate family contributes 2N−1. After shrinking the patch, the circles within each family are distinct, and the three center neighborhoods are disjoint by transversality. Thus there are exactly 4N−1 distinct circles. The N² grid points are distinct and each lies on three of them.

Replacing each of these circles by its center gives 4N−1 distinct input points. A unit circle centered at each grid point contains the corresponding three input centers. These resulting circles are distinct because their centers are distinct. Therefore U(4N−1)≥N² and the subsequential ratio tends to 1/16. The conclusion requires an actual equal-radius additive-coordinate web; no such web is constructed in the note.

## 2. Pencil obstruction

A nonconstant projective line of generalized-circle coefficients, when it meets the affine chart in which the quadratic coefficient is one, becomes a nonconstant affine line. Writing its center as c₀+tv and constant coefficient as d₀+te gives radius squared |c₀+tv|²−d₀−te. Infinitely many equal positive radii force this quadratic polynomial to be constant. Its leading coefficient |v|² vanishes over the real numbers, so v=0, after which its linear coefficient gives e=0. This makes the normalized circle coefficients constant, a contradiction. A nonconstant real pencil consequently has at most two circles of a prescribed positive radius. The argument deliberately uses real Euclidean circles.

Möbius transformations preserve pencils of generalized circles. Thus the presence of a pencil family is an obstruction even after applying a Möbius transformation. Conditional on the stated classification that every one-dimensional-symmetry type contains a pencil family, the symmetry consequence follows.

## 3. Coefficient convention and the fixed-radius form

For the inverse stereographic convention in the note, substituting the plane coefficients q=(−2a,−2b,a²+b²−r²−1,a²+b²−r²+1) into the plane equation recovers twice the original circle equation. Direct expansion gives Q₀*(q)=4r² and (q₄−q₃)²=4. Hence the radius-one equation Q₀*−ℓ²=0 is correct with ℓ=q₄−q₃. The coefficient covector is nonzero and null for the inverse quadratic form. The exclusion ℓ(q)=0 is necessary when translating the homogeneous locus back to actual planar circles. No polar-point sign convention is silently substituted.

## 4. Generic singular-cone obstruction

With four distinct generalized eigenvalues, eigenvectors of the Q₀-self-adjoint pencil operator are mutually Q₀-orthogonal. None is null, since a null member would be orthogonal to the entire eigenbasis and would contradict nondegeneracy. The diagonal form with arbitrary nonzero εⱼ is therefore valid over the complex numbers.

The rank-three cone at λᵢ has tangent coefficient conic qᵢ=0 and Σⱼ≠ᵢ qⱼ²/[εⱼ(λⱼ−λᵢ)]=0. Substitution of the gradient coefficients verifies both the tangent formula and its converse. In these dual coordinates the fixed-radius form is Σqⱼ²/εⱼ−(Σℓⱼqⱼ)², and the invariant null condition is Σ εⱼℓⱼ²=0.

If this form vanishes on one of the nondegenerate conics, its restriction to that coordinate plane is a scalar multiple of the conic equation, allowing the zero multiple. This also follows from containment of a nonempty real arc by Zariski density. Thus every off-diagonal product ℓⱼℓₖ with j,k≠i vanishes. Three distinct omitted indices cover every pair j≠k, so ℓ has at most one nonzero coordinate. The null equation and εⱼ≠0 then force that coordinate to vanish. This contradicts ℓ≠0 and proves the stated obstruction.

This proof covers only the specified generic pencil. It does not handle repeated eigenvalues, nonsemisimple pencils, or arbitrary circular webs. It also does not extract a web from dense finite circle arrangements. The note states these limitations correctly.
