# Independent review of the Erdős 949 method obstruction

21 November 2026. Reviewed files: `agents/other_paid/erdos949/target-and-prior-audit.md` and `agents/other_paid/erdos949/reflection-and-dilation-obstruction.md`.

The reflection/translation criteria and the prescribed-basis dilation obstruction pass written mathematical review. They do not settle Erdős 949, and no priority claim is certified.

## Exact checks

The sum-free hypothesis excludes both S+S and S−S from S, including all repeated-summand cases. Reflection closure of T around s gives T+T−2s=T−T. In the translated-intersection criterion, y−2s belongs to S, which puts each sum of two elements of T−s in S+S. Both sufficient conditions therefore include the diagonal.

The three-multiplier argument is exhaustive: 2s is excluded; if 4s is present, 3s and 5s are excluded; if 6s is also present, 10s is excluded. It makes no assertion about sums of distinct points after choosing one multiplier on a large subset.

I opened [Galvin and Shelah's original paper](https://shelah.logic.at/files/95020/23.pdf). Its definition of the negative square-bracket partition relation is on printed page 168, and Theorem 1 on page 170 gives the continuum-sized, countably colored pair relation used here in ZFC. The following discussion expressly includes singular continuum. Thus this use does not require the continuum hypothesis or regularity of the continuum.

A Hamel basis inside (1,2) exists because that interval rationally spans every real number. Its size is the continuum. Assigning one positive rational color to each unordered basis pair gives a unique allowed magnitude on that support. The note's five support cases exhaust sums of its allowed one- and two-coordinate vectors. The exclusion of magnitude1 prevents cancellation of a singleton against one coordinate of a pair; cancellation of a shared coordinate between different pairs leaves opposite signs on the two private coordinates. None of the cases returns to S.

The stronger own-center statement also checks. A two-coordinate vector can be the average of two singleton elements only at magnitude1/2, which was separately excluded. All other different-support cases are excluded by support size or unequal/opposite coefficients. Thus x+y=2s forces x=y=s. Symmetry then gives the corresponding translation fiber.

For a nonzero rational dilation, absolute multiplier 1 fails unary avoidance, absolute multiplier 1/2 fails diagonal avoidance, and every other absolute multiplier is a color that occurs in every continuum-sized subset of the prescribed basis. The obstruction therefore covers every such rational dilation, while distinguishing unary, diagonal, and distinct-pair failures.

Finally, the translated set B minus one fixed basis element has two opposite coefficients; its repeated sums still have opposite coefficients, and its sums of distinct elements have three nonzero coordinates. These are all excluded from S. The explicit successful set is essential: the constructed S is not a counterexample to the prize conjecture.

## Scope

The construction blocks rational dilations of subsets of the chosen basis. It does not block an adapted basis, affine translates, or arbitrary continuum-sized sets. The full arbitrary-sum-free-set target remains open in this work. The classical partition theorem is credited prior work, not a new result.

