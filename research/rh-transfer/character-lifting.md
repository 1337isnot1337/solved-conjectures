# Character lifting

Status: mathematical extraction and a proved replacement for one deformation-ring hypothesis. No named open conjecture is claimed solved here. No Lean verification was performed.

Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Related work: [the arithmetic transfer](vandiver.md) and [the CM and class-character transfer](artin-density.md).

The main new statement in this note is precise: a normalized lower-triangular characteristic-zero point satisfying the archive's local conditions is diagonal, without assuming that the coefficient prime is coprime to the class number. This supplies the weaker point condition actually needed by the graded algebra theorem. It does not assert that every torsion Selmer class lifts to characteristic zero.

All source references use the immutable archive commit 9d5316ec73f5df89c4d95703ed106837b8a4060e.

## 1. Which accepted input is used

This argument uses an internal arithmetic package of the accepted archive. It is not a consequence derived from zero locations alone.

The dependency is instantiated, rather than left as an unspecified literature hypothesis:

1. [SmallClassNumbers/CorGKOf.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/SmallClassNumbers/CorGKOf.lean) contains a closed theorem called litN, with conclusion LiteratureRankNHypothesis and no hypothesis argument. Its components are local_inputs_from_literature, automorphic_inputs_from_literature, galois_cohomology_from_literature, and cm_abelian_inputs_from_literature. The OpenImageCondition used there is constructed from galoisLocalGlobalStrong_recParameter.
2. [KFinal.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/KFinal.lean) gives lemmaK_litN_alt, which takes that literature package and supplies a constant for LemmaK.
3. [CohInp.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/CohInp.lean) gives cohInp_alt, assembling the local and global cohomological inputs with LemmaK. The construction is explicitly used in corGK_of in the first file.

The proposition [LemmaK](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/GeneratorCountTuples/LemmaK.lean) is uniform in every totally complex number field containing the required roots of unity. It includes finiteness of the positive-twist second cohomology groups. The much larger quantitative bound in that proposition is not needed below.

The resulting theorem [soBar](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/LevelCohomology/FdAdjoinRange.lean) has the following scope. Let F be any number field, let chi be any continuous finite-image character of its absolute Galois group, and let n be a positive integer. For the one-dimensional characteristic-zero representation

~~~math
E(\varepsilon^{-n}\chi),
~~~

a continuous cohomology class is zero if its restriction to every finite inertia group is zero and its restriction to every decomposition group above ℓ is zero. The theorem is stated over the algebraic closure of the coefficient field and includes the descent needed for a continuous cocycle to lie in a finite coefficient extension.

In soBar's notation the finite character is the inverse of chi. No restriction that F be abelian over the rationals, that chi be a rational Dirichlet character, or that chi have order prime to ℓ appears in its conclusion.

This is characteristic-zero vanishing. It does not say that a corresponding integral or divisible torsion Selmer group is zero.

## 2. The actual route from a Selmer group to automorphic points

The relevant source chain is more structured than “a tangent vector gives a point.”

| Source component | Exact role |
|---|---|
| [GRepresents](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/GRepresents.lean) | Represents the framed and normalized deformation conditions. |
| [ModelEx](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelEx.lean) and [BoxPresOf](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/BoxPresOf.lean) | Produce a graded presentation with specified numbers and weights of generators and equations. |
| [ConjStable](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ConjStable.lean), the Model structure | Relates that graded algebra to the deformation ring, including point and derivation transport and a particular integral derivation-lifting property. |
| [ModelLower](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelLower.lean) and [VlenLe](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/VlenLe.lean) | Bound a torsion Selmer length by the specified graded cotangent length. |
| [GfResZpow](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/GfResZpow.lean), finA_of_end | Uses the characteristic-ℓ finiteness input FinEnd to prove finiteness of the weight-zero subalgebra. |
| [ModelUpper](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelUpper.lean) and [OrbitVanishingLocal](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/OrbitVanishingLocal.lean) | Bound that cotangent length by congruence valuations at finitely many characteristic-zero points, using the hypotheses M1–M5 of LemmaM. |
| [FOneCharU](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean) | Combines these bounds and identifies the points with the required automorphic representations. |

FinA says that the weight-zero subalgebra is finite as a module over the coefficient ring. It does not say that the whole deformation ring is finite and flat.

FinEnd is also quite specific. In [RatTorsionFree](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/RatTorsionFree.lean), it controls ordinary representations over complete discrete valuation rings of characteristic ℓ: on an open Galois subgroup their characteristic polynomials are the prescribed residual ones. It is not a characteristic-zero lifting statement.

The Model.lift field lifts certain finite-coefficient derivations to integral derivations of the ambient graded algebra A. It does not lift them to points of the quotient A/Q. The equations Q are essential.

The source's M3 condition allows additional diagonal points. At each diagonal point other than the distinguished base point, it requires that at least one of the following sets be empty:

- points with positive-weight coordinates zero and some negative-weight coordinate nonzero;
- points with negative-weight coordinates zero and some positive-weight coordinate nonzero;

in each case the points must have the same values on the weight-zero algebra as the chosen diagonal point.

The existing proof [gradedModel_pointCondition_of_ptHyp](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/GradedModelPointConditionOfPtHyp.lean) obtains M3 by showing that no other diagonal point exists. That is a stronger condition than M3 requires.

## 3. Where class-number coprimality actually enters

The source's GD record contains the combined condition

~~~math
\ell\nmid |\mathop{\mathrm{disc}}K|\,h_K.
~~~

The discriminant and class-number factors do different jobs. Retain the discriminant condition in the argument below.

The explicit class-number calculation is in [PowEqOneOfUnr](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/PowEqOneOfUnr.lean). An everywhere-unramified character of an imaginary quadratic field has order dividing the class number. If its values are congruent to 1 and that order is prime to ℓ, the character is trivial.

That calculation is used in at least two mathematically different places:

- In [RootOfCharpoly](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/RootOfCharpoly.lean), pt_fixed uses it to make every diagonal character equal the distinguished character.
- In [CoboundaryLemmaNoColumn](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/CoboundaryLemmaNoColumn.lean), typeII_facts uses it twice: the middle one-dimensional character is made trivial, and the total determinant is made trivial. The corner determinant is then 1, allowing the particular two-dimensional descent used downstream.

Consequently, replacing only pt_fixed by a deep-congruence statement does not remove all uses of class-number coprimality.

The source paths for the generic presentation, the lower cotangent bound, and the implication FinEnd to FinA do not themselves invoke this class-number argument. The displayed GD field is still part of their arithmetic interface. The claim here is a mathematical separation of dependencies, not a claim that the source theorem types have already been changed.

## 4. A replacement theorem for the triangular locus

Let K be imaginary quadratic and let ℓ be an odd prime unramified in K. Put

~~~math
\Gamma=G_{\mathbb Q},\qquad H=G_K.
~~~

Choose a complex conjugation c with square 1, and write

~~~math
J=
\begin{pmatrix}
0&0&1
\\ 0&1&0
\\ 1&0&0
\end{pmatrix},
\qquad
\theta(g)=J(g^{-1})^tJ.
~~~

Let r be a continuous three-dimensional representation into the archive's semidirect product, with quadratic component cutting out K. Its matrix restriction to H is denoted rho. Assume its value at c has matrix part 1. Equivalently,

~~~math
\rho(chc)=\theta(\rho(h))\qquad(h\in H).
~~~

Let e be positive, and let chi be the finite-image rational character in the source datum. Assume rho is lower triangular and its diagonal characters have the form

~~~math
\lambda_0=\varepsilon^{e}\chi\kappa_0,\qquad
\lambda_1=\kappa_1,\qquad
\lambda_2=\varepsilon^{-e}\chi^{-1}\kappa_2,
~~~

where the kappa characters are finite-image characters of H.

Assume the following local properties:

1. At every finite place away from ℓ, the restriction to inertia is semisimple.
2. At every place above ℓ, there is a decomposition-group-stable upper flag whose ordered inertia characters are the restrictions of lambda_0, lambda_1, lambda_2. There is an inertia element at which these three values are distinct.
3. There is a marked element g_1 in H with lambda_0(g_1) different from lambda_2(g_1), and the source normalization holds:

~~~math
\bigl(\rho(g_1)-J\rho(g_1)^tJ\bigr)_{10}=0.
~~~

Use the accepted soBar input from section 1.

**Theorem.** Under these assumptions, rho is diagonal. No hypothesis on divisibility of h_K by ℓ is required.

### 4.1 The two local flags force splitting at ℓ

Fix a place above ℓ. The global lower-triangular flag is

~~~math
0\subset\langle e_2\rangle
\subset\langle e_1,e_2\rangle
\subset E^3.
~~~

Its ordered one-dimensional quotients have characters lambda_2, lambda_1, lambda_0. The supplied upper flag has the opposite order.

Choose the inertia element with three distinct eigenvalues. Its three eigenlines decompose the entire vector space. Every invariant flag is a sum of these eigenlines. The character labels show that the lower flag is formed from the last eigenline and the last two eigenlines, while the upper flag is formed from the first eigenline and the first two eigenlines.

The two flags are therefore opposite. Each of the three eigenlines is an intersection of a member of the upper flag with a member of the lower flag. Both flags are stable under the entire decomposition group, so each eigenline is stable under that group. The local representation is a direct sum of its three characters.

This uses the actual flag conclusion, not just equality of characteristic polynomials.

### 4.2 Global negative-Tate extensions vanish

First consider the subrepresentation spanned by the last two standard basis vectors. Its extension class lies in

~~~math
H^1\!\left(K,E(\lambda_2\lambda_1^{-1})\right)
=
H^1\!\left(K,E(\varepsilon^{-e}\chi^{-1}\kappa_2\kappa_1^{-1})\right).
~~~

The class restricts to zero on inertia away from ℓ by assumption 1. It restricts to zero on decomposition groups above ℓ by section 4.1. Thus soBar makes this extension split.

After a lower-unipotent change of basis, the last two characters form a direct-sum subrepresentation. The remaining extension is of lambda_0 by that direct sum. Its two components have coefficient characters

~~~math
\lambda_1\lambda_0^{-1}
=\varepsilon^{-e}\chi^{-1}\kappa_1\kappa_0^{-1},
\qquad
\lambda_2\lambda_0^{-1}
=\varepsilon^{-2e}\chi^{-2}\kappa_2\kappa_0^{-1}.
~~~

Both are negative Tate twists of finite characters. The same local argument and soBar make both classes zero. Therefore there is a lower-unipotent matrix u such that

~~~math
\rho(h)=u\,d(h)\,u^{-1},
\qquad
d(h)=\mathop{\mathrm{diag}}(\lambda_0(h),\lambda_1(h),\lambda_2(h)).
~~~

All three characters are distinct: their restrictions to the chosen inertia group already distinguish them.

This is a splitting statement about existing characteristic-zero representations. It does not construct any such representation from a torsion class.

### 4.3 Polarization and the actual normalization remove the conjugating matrix

Taking diagonal entries in the polarization identity gives

~~~math
d(chc)=\theta(d(h)).
~~~

Substitute the splitting into that identity. The lower-unipotent matrix

~~~math
u^{-1}\theta(u)
~~~

centralizes every d(h). Since the three characters are distinct, the centralizer of the diagonal representation is diagonal. The only matrix that is both diagonal and lower unipotent is 1. Hence theta(u)=u.

Solving this elementary matrix identity gives

~~~math
u=
\begin{pmatrix}
1&0&0
\\ a&1&0
\\ -a^2/2&-a&1
\end{pmatrix}.
~~~

For an arbitrary diagonal matrix d, multiplication gives

~~~math
(udu^{-1})_{10}=a(d_0-d_1),\qquad
(udu^{-1})_{21}=a(d_2-d_1).
~~~

The source normalization is not the assertion that rho(g_1) is diagonal. In [UnitaryThreeReflectionRight](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/UnitaryThreeReflectionRight.lean), its exact definition is

~~~math
g^\ast=cg^{-1}c,\qquad
Z(g)=r(g)_{\rm mat}-r(g^\ast)_{\rm mat},
\qquad Z(g_1)_{10}=Z(g_1)_{01}=0.
~~~

Because the matrix part of r(c) is 1,

~~~math
r(g^\ast)_{\rm mat}=J\rho(g)^tJ\qquad(g\in H).
~~~

Consequently,

~~~math
Z(g_1)_{10}
=
a\bigl(\lambda_0(g_1)-\lambda_2(g_1)\bigr).
~~~

The marked-element hypothesis makes the second factor nonzero, so a=0. Thus u=1 and rho is diagonal. This proves the theorem.

The CSD centralizer argument and the normalization computation were independently checked by the nonabelian-transfer worker. An exact symbolic multiplication also checked both u-transpose-J-u=J and the displayed expression for Z_10. This is a mathematical review receipt, not a formal verification claim.

## 5. Checking the theorem against the archive's local conditions

Here the field and coefficient hypotheses are those of the source datum, with the class-number factor removed and the discriminant factor retained. The rational finite character chi retains its source prime-to-ℓ order condition.

The local statements needed above are explicit:

- [pt_inertia_away](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/PtInertiaAway.lean) conjugates the inertia representation to the distinguished diagonal representation. Its averaging argument uses the order of the finite rational character, not the class number.
- [pt_inertia_above](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/PtIneL.lean) supplies the decomposition-group-stable upper flag and the ordered inertia characters. Its proof uses the local ordinary quotient through [lemma2b](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/PadicHodgeTheory/CommutingUpperTriangularDistinct.lean).
- The distinct-eigenvalue inertia element exists because the positive cyclotomic exponent has infinite image on inertia. The stronger residual separation used for identifying diagonal labels is supplied by the original condition that ℓ−1 does not divide 2e, together with the other source datum conditions.
- [Marks](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/BaseRepGL3NormalisedOfPsiEqOne.lean) requires that Psi(g_1)^2−1 be a unit. Residual proximity therefore makes lambda_0(g_1)−lambda_2(g_1) a unit.

There is one additional check: the diagonal characters of a lower-triangular point must be the indicated Tate characters times finite characters. This does not require class-number coprimality.

A triangular representation has multiplicative diagonal entries, and its characteristic polynomial is the product of the diagonal linear factors. The inertia eigenvalue argument from [RootOfCharpoly](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/RootOfCharpoly.lean) therefore applies to these entries without requiring the representation to be diagonal.

Away from ℓ, every eigenvalue is a power of the finite prime-to-ℓ character. The quotient of the i-th eigencharacter by its prescribed character is congruent to 1. A root of unity of order prime to ℓ that is congruent to 1 is 1. Thus the quotient is trivial on inertia.

At ℓ, choose an inertia element s for which the square of the residual Psi value is not 1. Residual proximity identifies the three diagonal roots separately at any element with that property. For an element g whose squared residual value is 1, apply the identification to s and gs, then use multiplicativity to identify the value at g. This is precisely the eq_above argument in RootOfCharpoly.

It follows that each quotient kappa_i is everywhere unramified. Since K is imaginary quadratic, global class field theory makes it a character of the finite ideal class group. Its order may be divisible by ℓ. The splitting proof in section 4 allows that.

The argument checks the exact local inertia and decomposition conditions needed by soBar. It does not invoke a new assertion that a merely crystalline-looking tangent vector produces a geometric point.

## 6. Consequence for the graded point condition M3

Assume a generalized graded model retains the source Model point-transport and sign-transport properties, and its local points satisfy the conditions checked in section 5.

A point with all positive-weight coordinates zero corresponds to a Lower representation. The theorem makes that representation diagonal. The source [ModelSigns](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelSigns.lean) then makes all negative-weight coordinates zero as well.

Thus there are no points with positive-weight coordinates zero and some negative-weight coordinate nonzero, anywhere in this model. In particular there are none above any specified values of the weight-zero coordinates. One of the two alternatives in M3 therefore holds for every nonbase diagonal point.

This proves M3 directly. It neither requires the diagonal locus to consist of one point nor requires deep congruence to the distinguished point.

The theorem leaves possible class-character diagonal points intact. It removes one reason that their presence obstructed the existing proof of M3.

The rest of LemmaM must still be supplied: the graded presentation and its dimensions, the spanning condition M1, weight-zero finiteness M2, the derivation condition M4, and the nonvanishing condition M5 for the chosen congruence function. The present result does not replace these conditions.

## 7. Why generic-point information alone cannot give the torsion bound

Let O be a complete discrete valuation ring with uniformizer pi and fraction field E. For every positive integer n, consider the augmented ring

~~~math
R_n=O[z]/(z^2,\pi^n z),
\qquad x(z)=0.
~~~

It is a finite complete local O-algebra. Its generic fiber is E, so it has exactly one geometric characteristic-zero point, and that point is reduced and rigid. Every assertion that all sufficiently deep characteristic-zero points equal the distinguished one is true.

Nevertheless, the augmentation ideal I has

~~~math
I/I^2\simeq O/\pi^n O.
~~~

Its length is n, which is arbitrary. Thus even finiteness of the whole ring, uniqueness and rigidity of its generic point, and arbitrary deep-point rigidity do not control integral cotangent length. The missing information is vertical torsion.

This is not a counterexample to the archive's LemmaM. The example has not been equipped with, and is not asserted to satisfy, that lemma's required presentation, equation counts, lifting conditions, and M1–M5. It disproves the weaker inference that those conditions can be replaced by generic-point uniqueness alone.

A complementary positive lemma makes the needed distinction exact.

**Finite-flat lifting lemma.** Let R be a finite, torsion-free O-algebra with an O-algebra augmentation to O. Suppose every geometric point of its generic fiber is infinitesimally rigid. If the augmentation cotangent module is nonzero, its generic fiber has at least two geometric points.

Indeed, a finite-dimensional algebra over an algebraically closed characteristic-zero field with zero tangent space at every point is reduced. If there were only one point, the augmented generic fiber would be E. Torsion-freeness would embed R into E. Every element of R is integral over O, and O is integrally closed in E, so R=O. Its augmentation cotangent module would then be zero, a contradiction.

The torsion-free assumption fails for R_n. Nor is it supplied merely by FinA. The archive's graded argument is a different, more detailed way to control this issue.

## 8. What still prevents a class-character Selmer theorem

The triangular obstruction is now narrower. The following statements remain separate obligations.

### 8.1 The mixed two-dimensional block

The source typeII_facts makes the middle character and the corner determinant trivial using class-number coprimality. Dropping that hypothesis leaves finite unramified class characters.

The nonabelian-transfer analysis gives a useful descent after taking the square root of an odd-primary determinant character. But the off-block extension module retains a ratio of class characters. Under Shapiro, that module is generally a rank-four tensor product with a dihedral induction. It is not automatically a rational one-dimensional twist covered by the source KatoUse statement. See the current TypeII analysis in [artin-density.md](artin-density.md).

Deep all-Galois trace congruence can force those finite characters to equal the target characters. The source point definition supplies only residual proximity, and the source final congruence estimate samples a prescribed Frobenius expression. Neither is the required all-Galois deep congruence statement.

### 8.2 The new augmentation and its presentation

For an anti-cyclotomic target, the corrected diagonal representation differs from the source's one-parameter torus. A first-order Shapiro embedding is already proved in [vandiver.md](vandiver.md). To use it for a torsion bound, one still needs the appropriate integral graded model centered at that augmentation, including its equation counts and Model.lift property.

The implication in section 6 is ready to apply once such a model exists. It does not construct the model.

### 8.3 A precise sufficient next theorem

A character-specific replacement for OneChar would follow by establishing, for the corrected class-character augmentation, all the following data with the stated normalization:

- a graded cohomological presentation with the source Model and lower-bound properties;
- weight-zero finiteness;
- nonpositive-weight base rigidity and rigidity at the remaining mixed and irreducible points;
- the corrected automorphic trace separation and counting statement.

The result of sections 4–6 supplies the M3 component of that program without class-number coprimality. A finite-flatness assertion is not inserted as a substitute for these data.

No conclusion about Vandiver's conjecture, Greenberg's conjecture, or Soulé's full number-field conjecture follows yet. The useful advance is a complete removal of the singleton-diagonal requirement at one specified step, with the remaining extension-sensitive module identified.


## 9. Why the available Rankin–Selberg theorems do not close the mixed-block step

This section records an applicability check, not a claim that no other method could work. The module and descent are derived in [artin-density.md](artin-density.md). Write eta_K for the quadratic character of K/Q. After the corner descent, the two factors are

~~~math
U=V\otimes\mathop{\mathrm{Ind}}_{G_K}^{G_{\mathbb Q}}\nu,
\qquad
\det V=\eta_K,
\qquad
\det\mathop{\mathrm{Ind}}_{G_K}^{G_{\mathbb Q}}\nu=\eta_K.
~~~

Here nu is a finite anticyclotomic class character. In the genuinely mixed case it is not generally a rational character. The Hodge–Tate weights of U are {-e,-e,e,e}. The following two failures occur before any question of estimating a nonzero L-value.

### 9.1 The rank-one coinvariant condition fails identically

For every Galois element sigma, the two 2-by-2 matrices M=V(sigma) and N=Ind(nu)(sigma) satisfy det(M)det(N)=1. The linear algebra lemma in [Studnia, On obstructions to the Euler system method for Rankin–Selberg convolutions, Lemma 3.1](https://doi.org/10.1007/s40993-026-00718-1) says that ker(M tensor N - 1) cannot have dimension one; it includes nonsimple Jordan forms. Since a square matrix has equal nullity and cokernel dimension,

~~~math
\dim_E U/(\sigma-1)U\ne1
\qquad\text{for every }\sigma\in G_{\mathbb Q}.
~~~

In particular, the required element tau in the cyclotomic kernel does not exist. Taking a dual does not change the dimension of the fixed space. A Tate twist is trivial on that kernel. Neither operation repairs the condition.

The specific implication in [Loeffler–Zerbes, Rankin–Eisenstein classes in Coleman families, Theorem 8.2.1](https://doi.org/10.1186/s40687-016-0077-6) assumes just such a tau. Its theorem therefore cannot be invoked for this module merely by asserting its other local hypotheses or an L-value nonvanishing.

### 9.2 The near-central reciprocity multiplier also vanishes

There is a second explicit check on that proposed application. Suppose the modular identification and coefficient conventions give M(f)=V(-e), where f has weight 2e+1 and quadratic nebentypus eta_K, and M(g)=Ind(nu), where g has weight one and the same nebentypus. This is the geometric normalization. Then

~~~math
U=M(f)\otimes M(g)(e),\qquad U^*\simeq U.
~~~

In the notation of Loeffler–Zerbes, k=2e-1, k'=-1, and j=e. Their representation M(f tensor g)(1+j) is U(1); its dual twisted by one is U, the companion Selmer representation in their Corollary 8.3.2.

At these parameters, their explicit reciprocity multiplier is

~~~math
c^2-c^{\,2j-k-k'}\varepsilon_f(c)^{-1}\varepsilon_g(c)^{-1}
=c^2-c^2=0.
~~~

Thus their displayed reciprocity law does not make the required specialized class nonzero from an L-value at e+1. Their section 8.1 explicitly excludes the cancelling-character case at this value of j. This calculation is conditional only on the modular identification just stated; the obstruction in section 9.1 is independent of that normalization.

Differentiating a family at this exceptional specialization, or constructing a different Euler system, would be a new required argument. No derivative nonvanishing or resulting Selmer bound has been supplied here.

### 9.3 Checks of later results

The theorem in [Bounding Selmer Groups for the Rankin–Selberg Convolution of Coleman Families (2020)](https://www.cambridge.org/core/journals/canadian-journal-of-mathematics/article/bounding-selmer-groups-for-the-rankinselberg-convolution-of-coleman-families/FF13C12CB84246804BE9509D89C6BCAB), Theorem 7.3.3, retains the big-image hypothesis. Its Appendix A expressly observes that the hypothesis fails when the nebentypus product is trivial. Passing to Coleman families in that result does not avoid section 9.1.

[Castella–Do, Diagonal cycles and anticyclotomic Iwasawa theory of modular forms, version 2 (2025)](https://arxiv.org/abs/2303.06751) provides a different Euler-system construction. Its stated setting is an even-weight form with trivial nebentypus; Theorem A also assumes that the coefficient prime does not divide h_K. Our form has odd weight, and the target class characters are needed precisely when that divisibility may hold. The theorem as stated does not supply the missing mixed-block vanishing.

These are failures of the cited theorems' exact hypotheses. They do not disprove the desired vanishing statement. The unproved step remains a rank-four strict or Bloch–Kato Selmer vanishing theorem for the stated orthogonal tensor, with the local conditions arising from the generalized graded model.

### Review receipt

The root worker independently checked sections 4–6: local opposite flags, the three negative-Tate extension ratios, the conjugate-self-dual centralizer argument, the actual normalization Z_10=a(lambda_0-lambda_2), and the distinction between generic points and integral torsion. The nonabelian-transfer worker independently checked the centralizer and normalization calculation. Neither review found a mathematical failure in that triangular splitting argument. This records internal mathematical review; it is not external review or Lean verification.
