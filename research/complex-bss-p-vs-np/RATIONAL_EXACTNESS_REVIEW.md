# Review of the rational-exactness reduction and primitive-size bound

Reviewer: weighted-protocol agent, 23 November 2026 (America/Chicago).

Reviewed file: `RATIONAL_EXACTNESS_BARRIER.md`, Sections 1–7, including the revised all-register division guard in Section 5. This is an internal mathematical review. It is not external peer review or formal verification.

## Result of review

The residue reduction, finite sampling argument, actual existential incidence, and generic numerical primitive-size lower bound pass. I found one exact-budget presentation issue in the earlier wording: clearing an $`S`$-gate rational circuit into $`O(S)`$-gate polynomial pairs does not, by itself, identify the resulting parameter family with exactly the valid $`S`$-gate circuits. The revised file fixes this by retaining each original topology and guarding all its executed divisions. No unresolved gap remains in the reviewed argument.

## 1. Residue identity and uniform construction

The exponents $`b_j=(m+1)^{j-1}`$ encode the column multiplicities without carries, because each multiplicity is between zero and $`m`$. Consequently the coefficient of $`t^\kappa`$, $`\kappa=\sum_jb_j`$, in
```math
K_m(X,t)=\prod_i\sum_jX_{ij}t^{b_j}
```
is exactly $`\mathop{\mathrm{per}}_m(X)`$, as a polynomial identity in arbitrary complex matrix entries.

For
```math
F_{X,y}(t)=\frac{K_m(X,t)-y t^\kappa}{t^{\kappa+1}},
```
the coefficient of $`t^{-1}`$ is $`\mathop{\mathrm{per}}_m(X)-y`$. The function is a finite Laurent polynomial, so a rational primitive exists exactly when this coefficient is zero. Necessity is the zero-residue property of every rational derivative; sufficiency is termwise integration of the finitely many remaining Laurent monomials.

The proposed construction uses $`O(m\log m)`$ gates for the powers and $`O(m^2)`$ gates for the row sums and products. It is uniform. No unit-cost large exponent is assumed.

The $`m=2`$ example has exponents $`-3,-1,1`$, with the displayed permanent-minus-value coefficient at $`-1`$.

## 2. Parameter-uniform samples

For a polynomial family $`P(a,t)`$ with $`p`$ scalar parameters, the incidence of a nonzero member vanishing at $`p+1`$ independently chosen sample coordinates has dimension at most $`p`$. This is because each fiber over $`a`$ is finite. Its projected closure is proper in $`\mathbb C^{p+1}`$.

A tuple outside that closure hits every nonzero member of the family, not just a generic parameter specialization. Finitely many topology families require avoiding only a finite union of proper closed subsets, so the same sample count works for all of them. There is no need to bound the degree by a polynomial.

The argument is nonuniform. The number of sample constants is polynomial; their effective construction is not asserted. This matches the arbitrary-complex-constant nonuniform border bound used afterward.

## 3. Exact circuit validity

For every original rational circuit topology, gatewise numerator/denominator clearing has shared cost $`O(S+1)`$. Let $`G`$ be the product of all displayed cleared register denominators and all numerator polynomials of registers used as divisors. A specialization is a valid computation in $`\mathbb C(t)`$ exactly when these required factors are nonzero polynomials.

The guard
```math
uG(t_0)=1
```
is equivalent to that simultaneous nonvanishing condition: a finite product of nonzero univariate polynomials has a point where it is nonzero. This includes nonvanishing of the final denominator, and does not incorrectly require the output numerator or a dividend numerator to be nonzero.

The guard is needed. Merely checking the final cleared denominator could admit a specialization corresponding formally to $`1/(1/0)`$. The revised guard prevents that problem and keeps the exact original size-$`S`$ topology, rather than replacing it with an uncontrolled larger family.

## 4. Sound incidence and dense component

For $`J=U/V`$, the polynomial identity
```math
D_m(U'V-UV')-N_{X,y}V^2=0
```
is equivalent to $`J'=F_{X,y}`$ when $`V\ne0`$. The sampled equations are equivalent to this full identity for every input and every parameter specialization. Together with the guard, their projection is therefore contained in the permanent graph.

Every original size-$`S`$ topology gives a closed polynomial incidence. Its projected image is constructible. There are finitely many topologies, so the exact set of true instances with such primitives is constructible. If their union were dense in the irreducible permanent graph, one of these sound incidences would have a component with dense graph image.

That source is an actual irreducible component of the full zero set. Thus the hypotheses of the reviewed singular-witness theorem hold; there is no substitution of an arbitrary subvariety for a component.

## 5. Quantitative bound

Put $`M=m+S+1`$. The incidence resources satisfy
```math
n\le M^2,\qquad r=O(M),\qquad q=O(M^2),\qquad s=O(M^4).
```
The square-system size in the singular-witness proof is
```math
S_0=O(s+r(q+r))=O(M^4).
```
With Taylor order $`D=m\le M`$, its displayed truncated-Newton bound is at most
```math
O\bigl(M^2+(M^7+M^6)\log(M+2)\bigr).
```
Therefore the stated weaker estimate $`C M^{10}`$ is safe.

Taking $`\eta<c/20`$ in comparison with the permanent lower bound
$`\exp(c(\log m)^{4/3})`$ leaves a strict asymptotic margin. The set of matrices with a primitive below the stated subthreshold budget is not dense. The complement of its closure is a nonempty Zariski-open set of hard numerical instances.

The primitive exists on every true instance. Its circuit constants may depend arbitrarily on the numerical matrix. The lower bound concerns the number of operations needed after those constants are chosen.

## 6. The elementary coefficient certificate and scope

If $`N/D`$ has a rational primitive, that primitive can be written as $`A/D`$. Every finite pole of a proper primitive has order one less than the corresponding derivative pole, so its denominator divides $`D`$. Splitting polynomial and proper parts gives
```math
\deg A\le\max(\deg N+1,\deg D).
```
The identity $`DA'-D'A=ND`$ then verifies a primitive. The zero numerator is the trivial constant-primitive case. The coefficient vector still has degree-proportional length, so this certificate is exponential on the displayed circuit family.

The reduction gives an auxiliary decision problem outside the nonuniform existential complex class, conditional on the imported permanent border lower bound and the reviewed graph lemma. It does not provide an $`NP_{\mathbb C}`$ language outside $`P_{\mathbb C}`$.

It also does not imply hardness of the special marked Hermite parts in `RESIDUE_RESOLVENT_FRONTIER.md`. The one-pole Laurent exactness reduction does not carry that additional constant-double-pole-coefficient structure. The reviewed file retains this distinction.
