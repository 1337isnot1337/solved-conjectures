# Independent review of the Segre alignment checkpoint

Date: 20 November 2026, America/Chicago. Reviewer: `minc_regular`.

Reviewed `research/minc/continuation-2026-11-20/inequalities/segre_alignment_checkpoint.md` and ran
both associated exact checkers. The claimed auxiliary inequalities are

```math
\Lambda_{(3,3)}(A)\le2\mathop{\mathrm{per}}A-9\prod_i a_{ii},
 \qquad
 f_{H,\mathrm{sgn}}(A)\le\tfrac12\Lambda_{(3,3)}(A),
```

for every complex positive semidefinite matrix of order six and rank at
most two, and each exceptional $`S_5`$ subgroup of $`S_6`$. The proof and
the stated restrictions are consistent. No full MINC resolution follows,
and this review does not establish priority for the quantitative inequality.

## Independent algebra and normalization

`segre_bound_review.py` imports no checker from another agent. It verifies
the formulas for $`S_1,S_2,S_3`$ by direct symbolic expansion in all fifteen
independent off-diagonal entries of a symmetric matrix with diagonal one.
This checks the sixth-order matching identity independently of the eleven
Wick expectations hardcoded in the main checker. In this expansion the
moment quantities have the direct Gram forms

```math
\begin{gathered}
 G=(s_i\cdot s_j),\quad h=G\mathbf1,\quad
 L=\mathbf1^TG\mathbf1,\quad a=h^Th,\quad b=h^TGh,
 \\ t_2=\mathop{\mathrm{tr}}G^2,\quad t_3=\mathop{\mathrm{tr}}G^3,\quad
 c=\sum_i h_i^3,\quad d=\sum_{i,j}h_iG_{ij}^2,\quad
 u=\sum_{i,j}G_{ij}^3.
\end{gathered}
```

The same script constructs the fifteen products of three antisymmetric
two-spinor tensors in the twenty-dimensional weight-three tensor space.
Their frame matrix $`F`$ satisfies exactly

```math
F^2=24F,\qquad \mathop{\mathrm{tr}}F=120,
 \qquad \sum_{g\in S_6}\chi_{(3,3)}(g)R(g)=6F.
```

The character is calculated independently as the number of fixed
three-subsets minus the number of fixed two-subsets. These identities give
the rank-five singlet projector $`F/24`$ and establish the factor
$`\Lambda=6\mathop{\mathrm{haf}}(|[v_i,v_j]|^2)`$ directly. This independently
checks the constant in the second Bloch formula.

For the permanent formula, the complex-sphere integral is
$`P=7!\int\prod_i|\langle v_i,u\rangle|^2`$. Each spinor projection is
$`(1+s_i\cdot t)/2`$; the real sphere pairing denominators are
$`3,15,105`$. Their coefficients are therefore precisely
$`(3/4)(105,35,7,1)`$. Combining these formulas gives
$`2P-\Lambda=(3/4)(195+73S_1+13S_2+3S_3)`$, so the target constant nine
does correspond to the asserted lower bound twelve.

## Inequality proof checks

The symmetric cubic tensor trace inequality uses ambient dimension three:
the trace map composed with its adjoint is $`(5/3)I`$, giving the factor
$`3/5`$. The displayed trace of $`Z`$, the square completion, and the
resulting polynomial $`R`$ have consistent coefficients.

For $`L>0`$, diagonalizing $`T`$ turns $`a`$ and $`b`$ into a single
convex combination of $`(Lx,Lx^2)`$. This step is valid for any signs of
their polynomial coefficients because it is an exact linear expression,
not a separate extremization of $`a`$ and $`b`$. At $`L=0`$, both vanish.
With $`x+y+z=6`$, the remaining dependence on $`yz`$ is affine, so the
two endpoint polynomials suffice. Each stated Bernstein factorization was
checked by the main exact checker and inspected for its sign on
$`0\le x\le6`$. The Bernstein basis is nonnegative on $`0\le L/36\le1`$.
This proves the lower bound over a domain larger than the feasible moment
domain, which is harmless.

The octahedral equality configuration has $`S=0,T=2I,U=0`$, hence
$`P=15`$, $`\Lambda=21`$, and $`2P-\Lambda=9`$. This establishes
attainment of the constant in the stated homogeneous inequality.

## Segre relation and subgroup conclusion

The separate independent script `segre_matching_review.py` constructs all
six one-factorizations of $`K_6`$. Their bracket polynomials $`F_i`$ have
twenty coefficients $`\pm2`$, coefficient Gram matrix with diagonal eighty
and off-diagonal minus sixteen, and exact identities
$`\sum_iF_i=\sum_iF_i^3=0`$. Thus $`p_i=F_i/2`$ has the normalization
used in the main note. The main subgroup-projector checker independently
finds the same coefficient Gram matrix and cubic.

The bound $`|p_i|^2\le\sum_{j\ne i}|p_j|^2`$ follows from the cubic and
the triangle and $`\ell^p`$-norm inequalities, over complex coordinates as
well as real ones. The projector factor is $`120/20=6`$, and the six
projectors form a tight frame whose total generalized function is
$`\Lambda`$. This proves $`f_{H,\mathrm{sgn}}\le\Lambda/2`$.

The classical attribution is supported by Howard--Millson--Snowden--Vakil,
[*A description of the outer automorphism of S6, and the invariants of six
points in projective space*](https://math.stanford.edu/~vakil/files/sixjan2308.pdf),
Section 2.1. Their result supplies context; the exact identities and
normalization here are independently checked.

Zero diagonal entries force a zero row and column, so every homogeneous
degree-six function under discussion vanishes. Otherwise diagonal scaling
reduces to unit Gram columns and rescales all terms by $`\prod_i a_{ii}`$.
Rank two is essential: at larger rank the $`(3,3)`$ block can have higher
rank and these six scalar invariant coordinates no longer determine the
subgroup functions. No claim about those ranks or other orders is made.

## Verification record

All four commands passed:

```sh
python research/minc/continuation-2026-11-20/inequalities/segre_coordinate_check.py
python research/minc/continuation-2026-11-20/inequalities/verify_rank_two_six_bound.py
python research/minc/continuation-2026-11-20/reviews/segre_matching_review.py
python research/minc/continuation-2026-11-20/reviews/segre_bound_review.py
```

The first two reproduce the author's certificates. The last two provide
independent constructions and symbolic checks, not numerical sampling.
