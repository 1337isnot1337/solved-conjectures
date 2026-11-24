# Independent review of saturated-path radical jets and signed multiplicities

Reviewed files:

- [SATURATED_PATH_RADICAL_JETS.md](SATURATED_PATH_RADICAL_JETS.md).
- [SIGNED_MULTIPLICITY_RATIONAL_MAP.md](SIGNED_MULTIPLICITY_RATIONAL_MAP.md).

Status: both mathematical arguments pass this independent written audit. The radical-jet closure assertion remains an explicit unproved hypothesis. No complex BSS separation follows without it or a replacement construction.

## 1. Exact accepting cells and saturation

The numerator/denominator circuit construction shares all intermediate pairs and charges their computations. The product $`G`$ must include nonzero-branch numerators and divisor-register numerators, together with the denominators required for defined computation. It must not include an arbitrary dividend or division-result numerator: the division $`R/1`$ is defined and zero on the accepted hypersurface.

With the stated convention, the cell is exactly
```math
C=V(F_1,\ldots,F_r)\cap D(G).
```
A generic accepting cell is dense in $`H=V(R)`$, so all $`F_i`$ are divisible by $`R`$, while $`R\nmid G`$. Correctness then proves $`C=H\cap D(G)`$, and the radical saturation formula follows from the Nullstellensatz. At least one $`F_i`$ is nonzero, since a nonempty ambient open subset cannot be contained in $`H`$.

The shared size bound $`O(T+M)`$ is valid: forming the product of the $`O(T)`$ stored factors of $`G`$ does not duplicate their subcircuits.

## 2. Pure poles from one equality

For $`P=R^eQ`$, saturation implies that every factor of $`Q`$ divides $`G`$. Choosing $`K\ge\deg P`$ gives $`Q\mid G^K`$. A power of two with $`O(T+M)`$ bits suffices because the degree of a division-free circuit is at most exponential in its size. Thus $`G^K/P=H/R^e`$ has a short rational circuit whose reduced pole divisor is precisely $`R`$.

This does not supply a circuit for $`H`$, $`R`$, or the reduced denominator. The multiple-equality warning is necessary. An exact example is
```math
R=y,\qquad F_1=yx,\qquad F_2=y(1-xz),\qquad G=1.
```
Here $`y=zF_1+F_2`$, so the ideal is already $`(y)`$. Every nonzero constant combination
```math
aF_1+bF_2=y\bigl[b+x(a-bz)\bigr]
```
has a nonconstant cofactor. Hence a generic constant combination introduces a divisor outside $`V(G)`$, even in this elementary prime-ideal example.

## 3. The four-radical identity

The two coefficient arrays must remain independent indeterminates for the factor argument. Let $`d=\gcd_i F_i`$, omitting zero entries. Over $`\mathbb C(A)`$, the primitive parts of $`U=\sum\lambda_iF_i`$ and $`V=\sum\mu_iF_i`$ are coprime linear forms in disjoint variable arrays. Any common factor before localization is supported in $`\mathbb C[A]`$ and divides every coefficient, hence is part of $`d`$. This proves that $`U,V`$ have exactly the common divisorial content of the equality list.

For each irreducible $`p`$, the exponent in
```math
\frac{\mathop{\mathrm{rad}}(GU)\mathop{\mathrm{rad}}(GV)}
{\mathop{\mathrm{rad}}(GUV)\mathop{\mathrm{rad}}(G)}
```
is zero if $`p\mid G`$, and otherwise is one exactly when $`p\mid U`$ and $`p\mid V`$. Saturation leaves precisely $`R`$ outside $`G`$, so the quotient is a nonzero scalar multiple of $`R`$. This proof covers a one-element equality list and nonzero constant $`G`$.

## 4. Normalized jets, border circuits, and moving centers

At a common permissible center all four radical values are nonzero. Normalizing each value to one removes the unspecified scalar and gives the exact ratio $`R(a+Z_A)/R(a)`$.

Truncated multiplication and inversion at a unit are finite polynomial maps on coefficients. Their implementation by homogenization and a truncated geometric series has polynomial overhead in the jet order and input circuit sizes. The coarse bound displayed in the draft is sufficient. Applying these maps to simultaneous border approximations is legitimate: their outputs converge to the desired truncated ratio, and the limiting denominator constant terms are one.

Common permissible centers can approach the prescribed center $`a_0`$ with $`R(a_0)\ne0`$. One first forms the combined normalized $`R`$-jet, whose coefficients extend to $`a_0`$; one does not take separate limits of the four possibly divergent normalized radical jets. Uniform circuit-size bounds pass to that coefficientwise limit.

The generic lower-bound formulation is also valid. For any fixed size threshold, the normalized jet map is rational on the permissible open set and the appropriate border circuit class is Zariski closed in the finite coefficient space. If all four jets met the small bound on a dense set, the combined bound would persist to the hard target jet. The stated consequence is conditional on the hypothetical HN decider and the existing BCJS extraction.

## 5. Exact scope of the Dutta–Saxena–Sinhababu source

The primary source freshly inspected is the [author-hosted 2022 manuscript](https://www.cse.iitk.ac.in/users/nitin/papers/factor-closure-jacm.pdf), Theorem 1 on printed page 5 and Conjecture 1 on printed page 32. Its field assumptions include algebraically closed characteristic zero, so they cover $`\mathbb C`$.

Conjecture 1 bounds the minimum of radical degree and radical circuit size. Theorem 1 converts its low-degree alternative into a small radical circuit: take $`u_0=1`$, $`u_1=f`$, and choose the factor $`\mathop{\mathrm{rad}}f`$ of $`u_1`$. Its bound is polynomial in
```math
L(f)+\deg(\mathop{\mathrm{rad}}f).
```
The small-size alternative needs no conversion. Thus the conjecture together with the theorem implies polynomial-size radicals; the theorem alone does not.

The weaker normalized-jet assertion follows from full radical circuits by ordinary truncation. Its use here does not turn the Radical Conjecture into an imported theorem. The source is identified as a manuscript because the hosted PDF still contains placeholder publication metadata.

## 6. Signed multiplicities and the exact raw-graph failure

For $`F=v^m u(v)`$, $`u(0)\ne0`$, the draft's expansions give
```math
\mu=-\frac{(F'/F)^2}{(F'/F)'}
=\frac{m^2+2mvh+v^2h^2}{m-v^2h'},
\qquad h=u'/u.
```
The denominator is a unit and the regular value is $`m`$, including negative pole orders. Two rounds of gatewise differentiation have linear overhead in the rational circuit size.

For $`F=H/R^e`$ with squarefree $`R`$, the regular extension of $`1/(F'/F)`$ has first term $`v/m`$. Hence the multiplier of $`\psi=t+e/(F'/F)`$ is $`1+e/m`$, equal to zero at the poles and nonzero at numerator zeros. This is a statement about the regular rational maps.

The raw graph counterexample is exact:
```math
F=t^M
\quad\Longrightarrow\quad
\mu(F'^2-FF'')-F'^2
=M t^{2M-2}(\mu-M).
```
At $`t=0`$ every proposed value is admitted by the cleared equation. The actual regular graph is the other component. Setting $`M=2^r`$ makes the unwanted multiplicity exponential in the input circuit length. Encoding $`\mu`$ or $`M`$ by Boolean bits does not change the zero fiber.

Consequently the pointwise signed-order route still needs a sound regular-graph certificate and an aggregation step. The radical-jet route is a separate sufficient primitive that already supplies the needed aggregate through the four-radical identity.

## 7. Follow-up review of the lambda-linear primitive part

Section 7 of the saturated-path note also passes. On the chart $`F_j\ne0`$, subtracting the logarithmic derivative of
$`\lambda_j+\sum_{i\ne j}\lambda_iF_i/F_j`$ from that of $`U`$ leaves exactly $`d\log F_j=d\log d+d\log f_j`$. It does not remove the last primitive coefficient. For a nonzero selected coefficient, $`\gcd(U,\partial_{\lambda_j}U)=d`$, because the primitive linear form has no common factor with the coefficient $`f_j`$.

The embedding
```math
U=f(A)(\lambda_1+x\lambda_2)
```
has radical $`\mathop{\mathrm{rad}}f`$ times the explicit primitive linear factor. Restricting normalized jets to zero increments in $`x,\lambda_1,\lambda_2`$ recovers the normalized radical jets of $`f`$. Generic-center bounds pass to the indicated chart by a coefficientwise limit if needed.

Thus lambda-linearity alone does not simplify the unrestricted radical-jet problem. The embedding need not have an irreducible saturated support outside $`G`$, so it does not rule out using that additional target-specific information.

One wording correction was requested: $`G`$ restricts the common content $`d`$ of the $`F_i`$, rather than the already-coprime list $`f_i`$. It does not constrain individual factors of a selected $`f_j`$.
