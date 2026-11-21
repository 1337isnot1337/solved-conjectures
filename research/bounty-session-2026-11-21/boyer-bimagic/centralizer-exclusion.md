# Exact exclusion of a rational centralizer orbit

This excludes a construction family. It does not solve Boyer enigma 2, and no prize is claimed.

Use P and S from `orthogonal-reduction.md`, with the two possible reflections denoted by `epsilon_plus` and `epsilon_minus`. Let F and G be the numerator polynomials of

`sum_i (S*P*S^T)[i,i]^2 - 1`

and

`sum_i (S*P*S^T)[i,4-i]^2 - 1`,

after cancellation over the rationals. All denominators are nonzero for real finite u,v. The stored JSON files contain the full polynomials and elimination resultants. The following small factorizations are sufficient to exclude all nondegenerate rational points.

Write `H(u)=50u^4+5u^2+2`, which is positive for real u. The factors `5u^2-1`, `v^2+v-1`, `v^2-v-1`, and `v^2±4v-1` have no rational root. The other factors `5u^2+1` and `v^2+1` have no real root.

## Neither reflection

```
F-G = -8uv(5u^2-1)(5u^2+1)^2(v^2+1)^2(v^2-4v-1)
F(0,v) = -4v^2(v^2+v-1)^2
F(u,0) = -4u^2 H(u)
```

If both polynomials vanish at rational finite u,v, their difference forces u=0 or v=0. Either substitution forces both to be zero.

At u=infinity, the degree-eight coefficient in u is `-2500v^2(v^2+v-1)^2`, so rational finite v must be zero. At v=infinity, the degree-eight coefficient in v is `-4u^2 H(u)`, so rational finite u must be zero. The double-infinity point also satisfies both equations. Thus the projective rational parameter points are exactly

`(u,v) in {0,infinity} x {0,infinity}`.

## Only the minus-plane reflection

The corresponding equations are

```
F-G = 8uv(5u^2-1)(5u^2+1)^2(v^2+1)^2(v^2+4v-1)
F(0,v) = -4v^2(v^2-v-1)^2
F(u,0) = -4u^2 H(u).
```

The projective boundary equations differ only by the same sign change in the v-polynomial. The complete rational parameter list is again `{0,infinity} x {0,infinity}`.

## Only the plus-plane reflection

Here

```
F-G = -32u(5u^2-1)(5u^2+1)^2(v-1)(v+1)(v^2+1)^2(v^2+v-1)
F(0,v) = -(v-1)^2(v+1)^2(v^2-4v-1)^2
F(u,1) = F(u,-1) = -256u^2 H(u).
```

The finite rational solutions are therefore exactly `(0,1)` and `(0,-1)`.

At u=infinity the boundary polynomial is

`-625(v-1)^2(v+1)^2(v^2-4v-1)^2`,

so v=±1. At v=infinity, the boundary difference is

`-32u(5u^2-1)(5u^2+1)^2`.

It forces u=0, at which the first boundary polynomial equals -1. There is no rational solution on this chart. At double infinity its value is -625, so that point is excluded too. The complete rational parameter list is `{0,infinity} x {-1,1}`.

## Both reflections

The same proof applies after replacing the factor `v^2+v-1` in the difference by `v^2-v-1`, and `v^2-4v-1` in F(0,v) and its u-infinity boundary by `v^2+4v-1`. The complete rational parameter list is again `{0,infinity} x {-1,1}`.

## Exact surviving matrices

The four component lists contain 16 parameter points in total. `verify_centralizer_points.py` substitutes them using exact rational arithmetic and checks the resulting matrices directly. They are permutation matrices. Consequently `5Q-J` has only the two distinct entries -1 and 4, rather than the required 25 distinct entries. The exact replay is saved in `centralizer-point-verification.json`.

The finite resultant calculations provide a redundant certificate: for each component, u=0 is the only rational finite root of the elimination polynomial. The elementary factorizations above also account for the exceptional projective charts and do not depend on treating a resultant zero as sufficient.

## Scope

Every rational orthogonal S fixing 1 and commuting with R is covered: on the two orthogonal eigenspaces it belongs to one of the four O(2) components, and each rotation conic is rationally parameterized by a projective line. Thus this excludes the full centralizer orbit of the particular seed P. The full orthogonal construction includes matrices outside this orbit. General order-five bimagic matrices need not belong to the orthogonal construction at all.

## Corollary for all permutation seeds in this construction

The separately checked enumeration in `permutation_seed_orbits.py` inspects all 120 permutations of five coordinates. Exactly 18 permutation matrices have order four and satisfy both trace conditions. Conjugation by the eight permutation matrices commuting with R partitions these seeds into orbits of sizes 8, 8, and 2.

The first size-eight orbit contains P above, so its full rational centralizer orbit has already been excluded. The second is its inverse/transpose orbit. Transposition preserves the two diagonal sums, their squared sums, and entry distinctness; moreover `(S*P*S^T)^T=S*P^T*S^T`. The same exclusion therefore applies.

The final two seeds commute with R. Every rational orthogonal S in its centralizer preserves this relation: Q=`S*P*S^T` still commutes with R. Therefore `R*A*R=A`. Each entry outside the center is repeated at its opposite position, violating distinctness regardless of the squared-diagonal conditions.

It follows that no matrix obtained by rational centralizer conjugation of a permutation seed supplies a distinct-entry bimagic example. This is a full exclusion of that construction, not of arbitrary rational orthogonal matrices or arbitrary bimagic squares.
