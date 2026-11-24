# Independent review of the square-zero socle and reduced deformation

Reviewed file: [SQUARE_ZERO_SOCLE_AND_DEFORMATION.md](SQUARE_ZERO_SOCLE_AND_DEFORMATION.md).

Status: the algebraic identities, resource bounds, soundness, and asymptotic generic-noncompleteness implication pass this audit. One quantifier repair was requested: generic noncompleteness holds for all sufficiently large $`m`$, rather than separately for every $`m`$. A concrete $`m=2`$ certificate below shows why that qualification is necessary.

## 1. Socle and explicit representation size

The squarefree monomials form a basis of $`A_m`$. Expansion of the degree-$`m`$ product gives the permanent as the coefficient of $`\omega`$, because the only degree-$`m`$ squarefree monomial is $`z_1\cdots z_m`$.

For a nonzero element $`a=\sum_S a_Sz_S`$, choose an inclusion-minimal supported $`S`$. Multiplication by $`z_{S^c}`$ kills every term not contained in $`S`$, and every proper subset term has zero coefficient. The product is exactly $`a_S\omega`$. Thus every nonzero ideal contains the socle.

If commuting square-zero operators have nonzero full product on a vector $`v`$, its annihilator ideal cannot contain $`\omega`$, hence is zero. The orbit map $`A_m\to V`$ is injective and gives the full lower bound $`\dim V\ge2^m`$, not merely a square-root lower bound from $`\mathop{\mathrm{End}}V`$. The stated explicit matrix-coordinate and regular-representation counts follow.

In $`\mathbb C[\epsilon]/(\epsilon^N)`$, a nonzero square-zero element has leading order at least $`\lceil N/2\rceil`$; two such elements multiply to zero. Therefore every homomorphism from $`A_m`$ to a one-variable truncated jet algebra kills $`\omega`$ when $`m\ge2`$, at every jet order.

## 2. Length and residue checks

The quotient by $`Q`$ has length $`2^m`$ at a true value and $`2^m-1`$ at a false value, because $`Q`$ is respectively zero or a nonzero scalar multiple of the one-dimensional socle. Pointwise complex equations cannot see this difference. For $`m\ge2`$, the added homogeneous degree-$`m`$ equation also has zero linearization at the origin.

For the diagonal deformation, the Jacobian is
```math
J_E=\prod_i2z_i=2^m\omega.
```
For a monomial $`z^\alpha`$ of total degree $`m`$, its residue sum factors into
```math
2^{-m}\prod_i
\left(\sum_{z_i^2=a_i}z_i^{\alpha_i-1}\right).
```
The two-root sum vanishes unless $`\alpha_i`$ is odd, including the case $`\alpha_i=0`$, where the exponent is $`-1`$. Since the total degree is $`m`$, survival forces every $`\alpha_i=1`$, and the surviving factor is one. Thus the sign in the formula is exactly $`\mathop{\mathrm{per}}(X)-y`$.

The two $`m=2`$ examples check: for the all-ones matrix, the true $`y=2`$ gives $`Q=z_1^2+z_2^2=2`$ on the deformation with $`a_1=a_2=1`$. The false $`y=4`$ has $`Q(1,1)=0`$ while $`J_E(1,1)=4`$. Neither a single regular zero nor pointwise vanishing on that fixed deformation computes the residue sum.

## 3. Coupled monic quadrics and verifier soundness

In a graded order on the $`z`$-monomials, each equation has leading monomial $`z_i^2`$, with leading coefficient one. These leading monomials are pairwise coprime. Their S-polynomials reduce to zero by substituting the affine lower terms. This works over $`\mathbb C[L,a]`$ as a coefficient ring, so the family is finite free of constant rank $`2^m`$, including every specialization.

At an accepted fiber, $`J_E\ne0`$ at every point. In each local finite algebra, the invertible linearization forces the maximal ideal to equal its square; nilpotence then makes that ideal zero. Thus the fiber algebra is reduced and is a product of copies of $`\mathbb C`$.

Vanishing of $`Q`$ at every point therefore implies zero normal form. Reduction of a square strictly lowers $`z`$-degree, so the coefficient of the degree-$`m`$ monomial $`\omega`$ in that normal form remains $`\mathop{\mathrm{per}}(X)-y`$. Soundness follows on all complex matrices.

The verifier resource count is valid. Evaluating the quadrics and $`Q`$ has quadratic cost, and determinant computation by pivoted Gaussian elimination has cubic cost with each division made only after a nonzero-pivot branch. The explicit degenerate true input with all rows supported on the first coordinate has $`Q=z_1^m`$; in a reduced fiber this would force the nonzero basis element $`z_1`$ to vanish, proving the stated failure of all-input completeness.

## 4. Generic noncompleteness and its quantifiers

The reduced-fiber locus is a nonempty Zariski open set of the parameter space. Nonemptiness follows from $`L=0`$, all $`a_i\ne0`$; finite freeness and invertibility of the Jacobian give a finite etale cover there. Accepted certificates lie in this open set.

If accepted inputs were dense in the permanent graph for some $`m`$, the moving-finite-challenge construction would select an actual component after imposing the open conditions that enumerate the distinct fiber points. The per-root equations have polynomial cost. The existing block-KKT and jet transfer would give a border circuit bound of the form $`m^C`$, with a fixed exponent determined by the fixed verifier template and the reviewed transfer. The exponential fiber cardinality enters only the finite existence proof.

The adopted lower bound exceeds that fixed polynomial for every sufficiently large $`m`$. Therefore the accepted set cannot be dense for those $`m`$. Since the predicate is constructible for each fixed $`m`$, its closure is then a proper subset of the graph, and its complement contains a nonempty Zariski-open set of true inputs without such certificates.

The threshold qualification matters. At $`m=2`$, write
```math
A=X_{11}X_{21},\qquad B=X_{12}X_{22}.
```
On the true graph,
```math
Q=A z_1^2+B z_2^2.
```
Whenever $`AB\ne0`$, choose
```math
L=0,\qquad a_1=B,\qquad a_2=-A.
```
The fiber has four distinct points, $`J_E\ne0`$ at every point, and $`Q=AB-AB=0`$ there. Hence the proposed predicate is generically complete at $`m=2`$. This does not conflict with the asymptotic obstruction.

## 5. Scope

The note keeps the nonreduced point-test failure separate from the reduced finite-cover transfer. It does not replace an exponential trace, multiplicity, or multivariate jet algebra by a free operation. It proves neither a complete permanent-graph protocol nor the complex BSS separation.
