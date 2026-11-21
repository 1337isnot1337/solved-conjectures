# Independent review of the Erdős 104 local-removal note

Reviewed 21 November 2026. Source: `agents/conjectures/erdos104/local-removal-and-pasch-gap.md`, SHA256 `2ef36b9c34d6e7764337f5f0024deccd43c9aa21f6fad2b9deb9288a0ada2a1d`.

**Verdict:** the three uniform mathematical claims pass. None resolves Erdős 104, and no new completion or payment is inferred.

## Witness extraction

Three distinct points on a circle are noncollinear and determine that circle. A fixed pair belongs to at most two unit circles. Hence the chosen triple witnesses have codegree at most two; their pair-sharing conflict graph has maximum degree at most three. The factor-four extraction of a linear triple system is valid. In such a system a three-edge configuration on six vertices is a loose triangle, so the stated use and limitation of the Ruzsa–Szemerédi route have the correct scope.

## Six-point construction

The displayed point coordinates satisfy all nine claimed memberships. In particular, the vector from either of the second and third centers to their common point is the sum of perpendicular vectors of squared lengths `25t²/4` and `1−25t²/4`. The three undesignated-membership calculations also check exactly. For the first two, the needed inequalities reduce to `t<2/5`, so the stated interval `0<t<1/10` is safe.

The pairs converge to three distinct noncollinear anchors; their within-pair coordinate differences are nonzero with the stated signs. Thus arbitrarily small localization of both point clusters and centers still permits the loose triangle. Additional circles through the six points do not invalidate that obstruction.

## Local Pasch exclusion

Subtracting the two equal-radius equations gives the stated orthogonality identity. The error estimate is `2εD` because both the shared point's anchor error and the centers' midpoint have norm at most `ε`. The linear combinations give the constants `12e`, then `|x₃|≤4e` and `|y₂|≤3e`, and finally `D≤14e=28εD`. No division by a possibly zero quantity is needed. The argument forces coincident centers when `ε<1/28`.

The point-only localization variant follows from continuity of the circumcenter at a noncollinear triple. It remains a local statement; it does not rule out every Pasch arrangement globally.

## Abstract countermodel and remaining gap

For triples `(x,y,x+y)` over an odd-order abelian group, linearity follows by solving for the missing coordinate from any two. A partite Pasch would force `2(y₂−y₁)=0` while its two entries in that part are distinct. This is impossible in an odd-order group. The construction has `m²` edges on `3m` vertices for arbitrarily large odd `m`.

This is not a unit-circle realization. It establishes only that the two checked combinatorial properties, linearity and absence of the local Pasch pattern, cannot by themselves force the desired subquadratic bound. The note correctly leaves the further geometric compatibility argument open.

