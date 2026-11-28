# Kummer–Vandiver conjecture

Status: open. This note extracts an arithmetic consequence from the supplied Riemann-hypothesis archive and tests routes from that consequence to the full conjecture. It does not claim a solution.

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). The archive is treated as correct as instructed; no Lean verification is performed.

## Exact target

For every odd prime $`p`$, let $`A_p`$ be the $`p`$-primary subgroup of the ideal class group of $`\mathbb Q(\zeta_p)`$. If $`\omega`$ is the Teichmüller character, Kummer–Vandiver asserts

~~~math
A_p^{\omega^{2j}}=0
\qquad (0\le 2j\le p-3).
~~~

Equivalently, $`p`$ does not divide the class number of $`\mathbb Q(\zeta_p)^+`$. Another equivalent formulation is $`K_{4n}(\mathbb Z)=0`$ for every positive integer $`n`$. The equivalence uses the established comparison between algebraic K-theory and étale cohomology. See Kurihara and Weibel below. The conjecture concerns torsion, so rational vanishing alone does not settle it.

## Source pin and extracted statement

All source references below use [archive commit 9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src). Paths are relative to its extracted/lean/src/ directory.

The direct entry point is:

- Development/AutomorphicArithmetic/AutomorphicVarieties/SmallClassNumbers/CorGKOf.lean: UpperTheory.V.SmallClassNumbers.bound.
- SmallClassNumbers/ClassNumberThree.lean: definitions *len*, *Bound*; theorem *bound_of*.
- SmallClassNumbers/LenEqZeroIff.lean: *len_eq_zero_iff*, *large_of*.
- UnitaryThreeGroups/KatoUse.lean: definitions *PropGK*, *CorGK*, *OneChar*.
- CharacterLevelBounds/ShaFamMono.lean: definitions *VS*, *V*, *V'* and normalization *nrm*.
- Formalism/GaloisCohomology/Statement.lean: definitions *Sha*, *shaLen*, *Sha2Zl*, *PTShaAt*, *VFormula*.

All unqualified directory names in this list share the Development/AutomorphicArithmetic/AutomorphicVarieties/ prefix.

Write $`L_{\ell,\mathcal O}(e)`$ for the source's *len*: the $`\mathcal O`$-length of the negative-Tate-twist Selmer group with coefficients $`\mathcal O\otimes_{\mathbb Z_\ell}(\mathbb Q_\ell/\mathbb Z_\ell)(-e)`$. Its cocycles are unramified at finite primes and locally coboundaries at primes over $`2\ell`$. Let $`r(\mathcal O)`$ be the ramification-index normalization called *eO* in the source.

*Bound* says there are natural-number constants $`C,A`$, independent of $`e`$, the coefficient rings, and the finite prime set $`T`$, such that, for every positive even $`e`$ and every $`T`$ consisting of primes $`\ell\ge5`$ with $`\ell-1\nmid 2e`$,

~~~math
L_{\ell,\mathcal O_\ell}(e)<\infty \quad(\ell\in T),
\qquad
\sum_{\ell\in T}
 \log\ell\,
 \frac{L_{\ell,\mathcal O_\ell}(e)}{r(\mathcal O_\ell)}
 \le C(e+1)^A.
~~~

The constants are existential. No numerical values have been extracted.

For unramified coefficients, a nonzero finite module has integral length at least one. Taking a singleton prime set gives the exact vanishing implication already proved in *large_of*:

~~~math
\log\ell>C(e+1)^A
\quad\Longrightarrow\quad
L_{\ell,\mathcal O_\ell}(e)=0.
~~~

This leaves every admissible prime satisfying $`\log\ell\le C(e+1)^A`$ unresolved. A finite set for each fixed weight is not a finite set for all weights.

ClassNumberThree.lean does not assert class number three: it uses the auxiliary imaginary quadratic field of discriminant $`-3`$, whose class number is one. Names should not replace examination of the statement.

## Where the bound comes from

The stronger source proposition *PropGK* produces, for every auxiliary prime $`q`$ avoiding $`30N|\mathop{\mathrm{disc}}K|`$, a nonzero integer $`D_q`$ with

~~~math
\log|D_q|
 \le c_K\varphi([(\mathbb Z/N\mathbb Z)^\times:H])
       (N(e+1))^{A_K}\log q.
~~~

For $`\ell\ne q`$, eligible character-orbit Selmer lengths are bounded by $`2v_\ell(D_q)`$. The character orbit is a finite set of distinct characters, not an arbitrary multiset. Two different auxiliary primes handle the excluded case $`\ell=q`$ and give *CorGK*. Taking trivial character, conductor $`2`$, auxiliary field $`\mathbb Q(\sqrt{-3})`$, and auxiliary primes $`7,11`$ gives *Bound*.

This is stronger information than an unspecified finiteness assertion. It still permits nonzero lengths at primes dividing every relevant congruence integer.

## Attempts to upgrade the estimate

### Coefficient extension

A totally ramified extension of coefficient discrete valuation rings of ramification degree $`r`$ multiplies the length of a finite base-changed module by $`r`$. The source divides by that same ramification index. Therefore making the coefficient field more ramified does not increase the normalized left side.

An unramified coefficient extension changes the residue-field cardinality; it does not multiply module length over the new discrete valuation ring. Treating residue-field degree as extra length would be an error.

Taking a direct sum of arbitrarily many copies would multiply length, but the quantified objects in *Bound* are rank-one Tate-twist coefficient modules over a discrete valuation ring. They do not include arbitrary multiplicities. Direct-product coefficient rings are not eligible discrete valuation rings.

Outcome: no amplification.

### Twist periodicity

Modulo $`\ell`$, the cyclotomic character has period $`\ell-1`$, so residual cohomology conditions repeat in $`e`$ modulo $`\ell-1`$. This does not give an isomorphism of all integral Tate twists. Even granting persistence of a nonzero residual class for every positive weight in one congruence class, the right side grows with the weight. The smallest positive representative need not be small enough to force a contradiction.

For a nontrivial even eigenspace of $`A_\ell`$, the corresponding least positive even $`e`$ can have size comparable to $`\ell`$. An estimate $`\log\ell\le C(e+1)^A`$ is compatible with this situation for every fixed positive $`A`$.

Outcome: periodicity does not close the missing region.

### Varying the auxiliary prime

Suppose the source's normalized Selmer length at $`\ell`$ is positive. Then *PropGK* forces $`\ell\mid D_q`$ for every admissible $`q\ne\ell`$. To deduce vanishing one needs, for each $`\ell`$, an admissible $`q`$ for which $`\ell\nmid D_q`$, or a stronger uniform gcd statement about these integers.

Dirichlet GRH controls primes in abelian residue classes. It does not itself prove the required separation of residual automorphic representations. A nonsplit extension and its split semisimplification have identical traces at every group element. For example,

~~~math
\mathop{\mathrm{tr}}
\begin{pmatrix}
\chi(g)&b(g)\\0&1
\end{pmatrix}
=\chi(g)+1
~~~

for every cocycle $`b`$. Selecting more Frobenius elements cannot detect $`b`$ using trace alone. A useful argument would have to exploit extra extension data or prove that the relevant congruences cannot occur.

Outcome: a precise new arithmetic input is required.

### Enlarging conductor or base field

The character-orbit estimate carries a polynomial cost in the conductor and an index factor. The constants also depend on the auxiliary number field. Adding characters or changing fields without retaining those costs is not a contradiction. No construction has been found that multiplies a fixed nonzero class faster than these costs.

Outcome: no justified amplification.

### Extension-sensitive source statements

The stronger witness statement *SmallClassNumbers.OnePoint* starts with a nonzero Selmer group and produces a characteristic-zero rank-three deformation that is neither upper nor lower, with an admissible automorphic representation of type three or type two. The source therefore does use extension data; describing its entire argument as trace-only would be inaccurate.

The next passage, in *ModularityArgument/ThresholdArguments/DenseThresholdCases/FOneCharU.lean*, applies a deformation-ring length bound and sends a finite set of deformation points to pairwise nonisomorphic admissible representations. The conclusion still bounds the Selmer length by a sum of valuations of trace differences. It does not assert that every nonzero residual class produces arbitrarily many distinct points.

The predicates are explicit in *AutomorphicForms/CongruenceNumberRankThree.lean* and *ModularityArgument/LinkedUnramifiedChains/WeightInfinitesimalCharacters/AdmissibleUnitaryThreePoint.lean*. Type three includes irreducibility, conjugate-self-dual automorphy after the prescribed twist, and weights $`(e,0,-e)`$. Type two includes a two-dimensional irreducible representation over $`\mathbb Q`$, attached after twisting to a newform of weight $`2e+1`$, together with a trivial middle constituent. No contradiction from these conditions has been established.

*KatoTwoW.lean* gives a rational Bloch–Kato Selmer-vanishing statement for the two-dimensional representation and its quadratic twist under its *Used* and automorphy hypotheses. It enters the rigidity argument. It does not identify the original integral rank-one Selmer group with one of these zero vector spaces. Such an identification would lose precisely the torsion being studied.

The apparent general number-field quantifier in *PropGK* also has a restriction. In *FPropGKU.lean*, the proof first tests whether $`K`$ is imaginary quadratic. Outside that case it selects zero constants and the congruence integer one; the arithmetic hypotheses are impossible because *GD* explicitly requires $`[K:\mathbb Q]=2`$ and $`K`$ totally complex. Generic automorphic counting over CM fields is available upstream, but a corresponding generic Selmer-to-automorphic-deformation theorem has not been extracted.

Outcome: the extension-sensitive machinery explains and bounds congruences. No theorem inspected eliminates all the congruences needed for Vandiver.

### An explicit Iwasawa-module test

There is a sharper algebraic test of the proposed weight-amplification route to Greenberg's conjecture. Fix an odd prime $`p`$, write $`\Lambda=\mathbb Z_p[[T]]`$, and set

~~~math
X=\Lambda/(T-p).
~~~

This torsion Iwasawa module has $`\mu(X)=0`$ and $`\lambda(X)=1`$. At an integer weight $`e\ge2`$ that is even, evaluate $`T`$ at $`(1+p)^e-1`$. The specialization is finite and has length

~~~math
\mathop{\mathrm{length}}_{\mathbb Z_p}X_e
 =v_p\!\left((1+p)^e-(1+p)\right)
 =1+v_p(e-1)
 \le 1+\log_p(e-1).
~~~

The equality is the elementary lifting-the-exponent identity. Hence a module with positive $`\lambda`$ satisfies a polynomial upper bound at every positive even weight. A family supported at this one prime also satisfies the corresponding log-weighted sum bound.

This module is not asserted to occur as the arithmetic class-group module in Greenberg's conjecture. It proves the narrower logical point: polynomial bounds at these specializations, even together with finiteness and $`\mu=0`$, cannot by themselves imply $`\lambda=0`$. Additional arithmetic input must exclude such modules.

### Logical insufficiency of the inequality

Even an abstract periodic family with length one at one prime and one residue class of weights, and zero elsewhere, can satisfy a bound of the displayed form after enlarging $`C`$. This is not a counterexample in arithmetic. It proves that integrality, the upper bound, and residual periodicity by themselves do not imply universal vanishing.

## Prior-art screen

1. **Kurihara (1992).** *Some remarks on conjectures about cyclotomic fields and K-groups of Z*, Compositio Mathematica 81, 223–236. [Original paper](https://numdam.org/item/CM_1992__81_2_223_0.pdf). The cohomology/class-group relationship and the K-theory formulation predate this project.

2. **Soulé (1999).** *Perfect forms and the Vandiver conjecture*, Journal für die reine und angewandte Mathematik 517, 209–221. [Preprint](https://arxiv.org/abs/math/9812171), [full text](https://arxiv.org/pdf/math/9812171). It already proves large-prime vanishing for each fixed odd weight. Its threshold is of double-exponential type in the weight: the abstract gives $`\log p>n^{224n^4}`$. Its Theorem 2 and Lemma 2 give $`\log k(m)\le m^{20m^4}`$ after discarding small-prime torsion. This is not a fixed-degree polynomial bound in $`m`$.

3. **Weibel.** *Algebraic K-Theory of Rings of Integers in Local and Global Fields*. [Published survey](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf), especially §§5.7–5.9 and Theorem 105. It records the odd-order property of $`K_{4n}(\mathbb Z)`$ and the exact relation between its $`\ell`$-torsion and even cyclotomic class-group components. Historical numerical limits in this survey are not current bounds.

4. **Emery (2024).** *On the torsion part in the K-theory of imaginary quadratic fields*. [Journal paper](https://doi.org/10.1007/s00229-024-01598-4). The introduction compares its field-discriminant bounds with Soulé's work and identifies the rational-field case as still related to Vandiver. Bounds with the field varying are not automatically polynomial bounds with the K-degree varying.

5. **Chen et al. (2026).** *Almost all primes are partially regular*. [Primary paper](https://arxiv.org/abs/2602.05090). It proves a density-one theorem and, by reflection, even-eigenspace vanishing in the range $`2\le2k\le\sqrt p/(\log p)^\alpha`$, $`\alpha>1/2`$. This does not settle Vandiver. Its small positive eigenspace range is also different from the near-$`p`$ eigenspace range produced by fixing a small positive Tate weight here.

6. **Dutour Sikirić–Elbaz-Vincent–Kupers–Martinet; Kupers.** $`K_8(\mathbb Z)=0`$ is already proved. [Journal paper](https://www.cambridge.org/core/journals/journal-of-the-institute-of-mathematics-of-jussieu/article/abs/voronoi-complexes-in-higher-dimensions-cohomology-of-glnmathbbz-for-ngeqslant-8-and-the-triviality-of-k8mathbbz/6C1E2AA4FA1AD29554384C091A51D8E5), [Kupers's independent short proof](https://www.utsc.utoronto.ca/people/kupers/wp-content/uploads/sites/50/2021/01/k8zshorter.pdf). It cannot be counted as a new target or resolution.

7. **Reinhart (2024; revised 2025).** *A counterexample to the Conjecture of Ankeny, Artin and Chowla*. [Primary paper](https://arxiv.org/abs/2410.21864). This neighboring named conjecture is already disproved and is excluded. [Author's publication list](https://imsc.uni-graz.at/reinhart/publications.htm) records acceptance in Algebra & Number Theory.

8. **Soulé (2003).** *A bound for the torsion in the K-theory of algebraic integers*. [Original paper](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/soule.dm.pdf), §5.1. Its conjecture seeks polynomial dependence on the K-degree in the logarithm of torsion, uniformly over number fields of fixed degree, with logarithmic discriminant dependence. The printed degree-one case needs a normalization such as $`\log\max(2,|D_F|)`$; taking its literal $`\log1=0`$ is not a mathematical resolution of the intended conjecture.

9. **de la Torre Durán (2026).** *Perfect Forms and Torsion Bounds in Algebraic K-Theory over Totally Real and CM Fields*. [Version 2, revised 19 November 2026](https://arxiv.org/html/2611.06300v2), Theorem 4.5. With $`r=2m+1`$ and $`d=[F:\mathbb Q]`$, it gives

~~~math
\log\mathop{\mathrm{card}}_{b}K_m(\mathcal O_F)_{\rm tors}
 \le \exp(O(r^2d(\log r+\log d)))\,|D_F|^{O(r^2)}.
~~~

Here primes at most $`b=dr+1`$ are removed; for $`F=\mathbb Q`$, $`b=2m+2`$. Thus the rational bound remains exponential in $`m^2\log m`$, rather than polynomial. The paper states Soulé's conjecture for every degree $`d\ge2`$, every field of that degree, and every K-degree. Our rational-field consequence does not meet those quantifiers.

Arlettaz's Hurewicz theorem, used in both Emery and de la Torre Durán, controls the kernel away from small primes. It does not itself bound the relevant homology torsion and therefore does not supply a missing polynomial bound. The modern comparison was checked against the papers themselves, not only search-result descriptions.

Searches used both engines and exact names, K-theory formulations, polynomial-bound terminology, later citations, and 2026 updates. No full resolution of Kummer–Vandiver was found. A search cannot establish a universal negative about unpublished work.

## Derived K-theory consequence

The following is a mathematical consequence of the archive's *Bound*, rather than a consequence of the final RH statement alone. It is recorded here for independent review and is not counted as a solution of Kummer–Vandiver.

**Proposition.** Assuming the source bound stated above, there are absolute constants $`C,A`$ such that, for every $`n\ge1`$,

~~~math
\log\left|K_{4n}(\mathbb Z)\right|\le C(2n+1)^A.
~~~

The finite group in this statement includes all primes. The argument below removes the exceptional-prime restriction from the source rather than silently omitting it.

### 1. Matching the source Selmer group

Fix an odd prime $`\ell`$ and a positive even integer $`e`$. Set

~~~math
M=\mathbb Q_\ell/\mathbb Z_\ell(-e),\qquad
T=\mathbb Z_\ell(e+1),\qquad
S=\{\ell,\infty\}.
~~~

Use coefficients $`\mathcal O=\mathbb Z_\ell`$ in *Bound*. The coefficient ramification index is one. The source *len* is the length of classes in $`H^1(\mathbb Q,M)`$ that are unramified at every finite prime and split at $`\ell`$ and $`2`$.

For a finite prime $`q\ne\ell`$, $`M`$ is unramified. Its unramified local first cohomology is

~~~math
H^1_{\rm unr}(\mathbb Q_q,M)
 =M/(\mathop{\mathrm{Frob}}_q-1)M=0.
~~~

Indeed, Frobenius acts by $`q^{-e}`$, up to the reciprocal convention. Its difference from one is a nonzero scalar in $`\mathbb Z_\ell`$, and every nonzero scalar acts surjectively on the divisible group $`\mathbb Q_\ell/\mathbb Z_\ell`$. Consequently the extra splitting condition at $`2`$ is automatic.

Inflation therefore identifies the source group with

~~~math
\Sha^1_S(M)
 =\ker\!\left(
 H^1(G_{\mathbb Q,S},M)
 \longrightarrow H^1(\mathbb Q_\ell,M)
 \right).
~~~

No odd-primary correction comes from the real place. An analogous transport is explicitly developed in the archive's GaloisLibrary/SelmerTransport/ShaLenEq.lean.

### 2. The duality and K-degree

Poitou–Tate duality pairs $`\Sha^1_S(M)`$ with

~~~math
\Sha^2_S(T)
 =\ker\!\left(
 H^2(G_{\mathbb Q,S},T)
 \longrightarrow H^2(\mathbb Q_\ell,T)
 \right).
~~~

The Tate twist is $`e+1`$, because the Cartier dual of $`M`$ is $`T`$. If $`\ell-1\nmid e`$, then $`H^0(\mathbb Q_\ell,M)=0`$: choose a cyclotomic-character value whose $`e`$th power is not one modulo $`\ell`$, so its difference from one acts invertibly. Local Tate duality gives $`H^2(\mathbb Q_\ell,T)=0`$. Hence

~~~math
\mathop{\mathrm{length}}_{\mathbb Z_\ell}\Sha^1_S(M)
 =\mathop{\mathrm{length}}_{\mathbb Z_\ell}
 H^2(\mathbb Z[1/\ell],\mathbb Z_\ell(e+1)).
~~~

The Quillen–Lichtenbaum comparison identifies the last group with the $`\ell`$-primary part of $`K_{2e}(\mathbb Z)`$. A precise published formulation is Weibel's Theorem 70 and Corollary 71. Thus $`e=2n`$ gives $`K_{4n}`$, not $`K_{4n+2}`$.

Here only the local group at $`\ell`$ and the real place are needed. It would be false to assert that all finite local second cohomology groups vanish: at $`q\ne\ell`$, the condition $`\ell\mid q^e-1`$ can give local invariants.

For all primes allowed in *Bound*, $`\ell-1\nmid2e`$ implies $`\ell-1\nmid e`$, so this comparison applies.

### 3. Removing the excluded odd primes

The standard mod-$`\ell`$ comparison gives

~~~math
K_{2e}(\mathbb Z)/\ell
 \cong
 \left(A_\ell/\ell A_\ell\right)^{\omega^{-e}}.
~~~

One can obtain it from Corollary 71 of Weibel, the Kummer exact sequence over $`\mathbb Z[\zeta_\ell,1/\ell]`$, and descent through the group of order $`\ell-1`$. There is a unique prime above $`\ell`$, and it is principal; the relevant Brauer group is zero. This removes class-group-localization and Brauer corrections. Kurihara's Lemma 1.2 and the discussion following Corollary 1.3 give the same relationship.

Now suppose $`\ell-1\mid2e`$. The character $`\omega^{-e}`$ is either trivial or quadratic.

For the trivial character, extension and norm identify the invariant $`\ell`$-primary class group with that of $`\mathbb Q`$, which is zero.

For the quadratic character, positivity of its parity follows from evenness of $`e`$, so $`\ell\equiv1\pmod4`$. Its fixed field is $`F=\mathbb Q(\sqrt\ell)`$. Put $`H=\mathop{\mathrm{Gal}}(\mathbb Q(\zeta_\ell)/F)`$. Its order $`(\ell-1)/2`$ is prime to $`\ell`$. If $`j`$ is extension of ideal classes and $`N`$ the norm, then for any $`H`$-invariant $`\ell`$-primary class $`x`$,

~~~math
jN(x)=\sum_{\sigma\in H}\sigma x=|H|x.
~~~

Multiplication by $`|H|`$ is invertible on an $`\ell`$-primary group. Therefore every such invariant class comes from the $`\ell`$-primary class group of $`F`$.

That group is zero. To see this without a numerical class-number table, Minkowski's theorem gives an integral ideal of norm at most $`B=\sqrt\ell/2`$ in each class of $`F`$. In a quadratic field the number of ideals of norm $`m`$ is at most the divisor count $`d(m)`$: at a split prime the local count is $`a+1`$ for exponent $`a`$, and at inert or ramified primes it is no larger. Hence, writing $`b=\lfloor B\rfloor`$,

~~~math
h_F
 \le\sum_{m=1}^{b}d(m)
 \le\sum_{m=1}^{b}m
 =\frac{b(b+1)}2
 \le\frac{\ell}{8}+\frac{\sqrt\ell}{4}
 <\ell.
~~~

The last inequality holds for every $`\ell\ge5`$. Thus $`\ell\nmid h_F`$. For $`\ell=3`$, only the trivial character occurs because $`e`$ is even.

In either case, $`K_{2e}(\mathbb Z)/\ell=0`$. Since $`K_{2e}(\mathbb Z)`$ is finite, its entire $`\ell`$-primary part is zero. This handles every odd prime excluded by *Bound*, including $`3`$.

### 4. Summing the lengths

The established two-primary computation gives $`K_{4n}(\mathbb Z)\{2\}=0`$; see Weibel §5.8, or Rognes–Weibel. The group $`K_{4n}(\mathbb Z)`$ is finite. Choose in *Bound* the finite set of all remaining prime divisors of its order and take $`e=2n`$. The preceding comparisons give

~~~math
\log|K_{4n}(\mathbb Z)|
 =\sum_{\substack{\ell\ge5\\ \ell-1\nmid4n}}
  \log\ell\,
  \mathop{\mathrm{length}}_{\mathbb Z_\ell}
      K_{4n}(\mathbb Z)\{\ell\}
 \le C(2n+1)^A.
~~~

This proves the proposition from the stated source bound and the cited standard comparison theorems.

### 5. Consequence and remaining obstruction

The proposition bounds every possible torsion prime by $`\exp(C(2n+1)^A)`$ and the total logarithmic torsion by a fixed-degree polynomial. It does not show the finite group is trivial. In the class-group formulation, it yields a near-$`\ell`$ even-eigenspace vanishing range with positive Tate weights up to a power of $`\log\ell`$.

The source's *large_of* already contains the principal vanishing mechanism. The additional work here is the complete K-theory translation, including the primes omitted by *Bound*. This is a derived consequence of Alpöge's arithmetic input, not an independent proof of a named open conjecture.

The earlier Soulé–Gabber bound is qualitatively weaker in its dependence on the K-degree. The comparison is not a complete priority determination: the announcement and its accompanying archive already contain the arithmetic estimate. No original-priority claim is made for the displayed K-theory consequence.

## First-order transfer for anticyclotomic characters

This subsection proves an elementary replacement for the cohomological first step of a proposed twisted *OneChar* theorem. It does not prove the subsequent lifting or automorphy theorem. The construction uses standard induction and Shapiro's lemma; it is recorded to make the proposed extension precise, not claimed as a new standalone result.

Let $`K/\mathbb Q`$ be imaginary quadratic. Write $`\Gamma=G_{\mathbb Q}`$, $`H=G_K`$, and choose complex conjugation $`c\in\Gamma`$. Then $`\Gamma=H\rtimes\langle c\rangle`$ and $`c^2=1`$. Let $`\ell`$ be odd, let $`\mathcal O`$ be the integers of a finite extension $`E/\mathbb Q_\ell`$, and let

~~~math
\psi:H\longrightarrow\mathcal O^\times,
\qquad
\psi(chc^{-1})=\psi(h)^{-1},
~~~

be a continuous finite-order character. Let $`\varepsilon`$ be the cyclotomic character restricted to $`H`$. Fix an integer $`e\ge1`$. Define

~~~math
d(h)=\mathop{\mathrm{diag}}
 \bigl(\varepsilon(h)^e\psi(h),\,1,\,
       \varepsilon(h)^{-e}\psi(h)\bigr).
~~~

### Polarization and complex conjugation

Let $`J`$ be the matrix with ones on the anti-diagonal and zeros elsewhere. The map

~~~math
\tau(g)=J(g^{\mathsf t})^{-1}J
~~~

is an involutive automorphism of $`\mathop{\mathrm{GL}}_3`$. Form the semidirect product $`\mathop{\mathrm{GL}}_3\rtimes_\tau\{1,-1\}`$. Direct calculation gives

~~~math
\tau(d(h))
 =\mathop{\mathrm{diag}}
  \bigl(\varepsilon(h)^e\psi(h)^{-1},\,1,\,
        \varepsilon(h)^{-e}\psi(h)^{-1}\bigr)
 =d(chc^{-1}).
~~~

Therefore

~~~math
r_0(h)=(d(h),1),\qquad r_0(c)=(I_3,-1)
~~~

defines a continuous representation of $`\Gamma`$. In particular, $`r_0(c)^2=(I_3,1)`$. The calculation uses conjugation invariance of $`\varepsilon|_H`$; it does not assign a value $`\psi(c)`$, which is undefined. The fact that $`\varepsilon(c)=-1`$ causes no missing sign because the value of $`r_0`$ at $`c`$ was specified separately. The construction works for every integer $`e`$, including the positive even weights used earlier.

This corrected diagonal is essential. The naive diagonal
$`\mathop{\mathrm{diag}}(\varepsilon^e\psi,1,\varepsilon^{-e}\psi^{-1})`$
is conjugate self-dual only when $`\psi^2=1`$. The distinct cyclotomic weights force that condition. Moreover, a common scalar twist cannot turn the corrected diagonal into the source's one-parameter torus $`\mathop{\mathrm{diag}}(\Psi,1,\Psi^{-1})`$: the geometric-progression relation between its three constituents would require $`\psi^2=1`$. Multiplying all constituents by a common character preserves that relation.

### The induced adjoint submodule

Let $`A`$ be a finite $`\mathcal O`$-module, with trivial square-zero multiplication when used as an ideal. In the adjoint representation on $`3`$-by-$`3`$ matrices with entries in $`A`$, consider

~~~math
V_-=A E_{21}\oplus A E_{32}.
~~~

Writing

~~~math
\alpha=\varepsilon^{-e}\psi^{-1},
\qquad
\alpha^c(h)=\alpha(chc^{-1})
          =\varepsilon(h)^{-e}\psi(h),
~~~

the action of $`h\in H`$ on $`V_-`$ is

~~~math
h\cdot(x,y)=(\alpha(h)x,\alpha^c(h)y).
~~~

The differential of $`\tau`$ is $`X\mapsto-JX^{\mathsf t}J`$. Thus

~~~math
c\cdot(x,y)=(-y,-x).
~~~

Applying this operation twice gives $`(x,y)`$, as required. Changing the sign of the second basis vector identifies $`V_-`$ with
$`\mathop{\mathrm{Ind}}_H^\Gamma A(\alpha)`$.

Here is an explicit degree-one cohomology identification. Given a continuous cocycle $`z:H\to A(\alpha)`$, set

~~~math
Z(h)=\bigl(z(h),-z(chc^{-1})\bigr),\qquad
Z(c)=0,\qquad Z(hc)=Z(h).
~~~

The cocycle identity on $`H`$ follows coordinate by coordinate. The relation
$`Z(chc^{-1})=c\cdot Z(h)`$ proves that it extends to a cocycle on $`\Gamma`$.

If $`z(h)=\alpha(h)a-a`$, then $`Z`$ is the coboundary of $`(a,-a)`$. Conversely, the first coordinate of a coboundary on restriction to $`H`$ is a coboundary for $`A(\alpha)`$, so the resulting map on cohomology is injective. It is also surjective: for any $`\Gamma`$-cocycle, its value at $`c`$ lies in the minus eigenspace of $`c`$ and can be removed by a coboundary because $`2`$ is invertible. The remaining relation at $`chc^{-1}`$ forces its second coordinate to be minus the conjugate of the first. Consequently,

~~~math
H^1(K,A(\alpha))
 \simeq H^1(\mathbb Q,V_-).
~~~

The complement spanned by the remaining seven matrix units is also invariant under $`H`$ and $`c`$. Hence $`V_-`$ is an equivariant direct summand of the full adjoint module. The displayed group therefore injects into $`H^1(\mathbb Q,\mathop{\mathrm{ad}}(r_0)\otimes A)`$, with no loss from taking coboundaries in the larger module.

### Local conditions

For a rational place $`v`$, the Mackey decomposition followed by local Shapiro gives

~~~math
H^1(\mathbb Q_v,V_-)
 \simeq\bigoplus_{w\mid v}H^1(K_w,A(\alpha)).
~~~

This is compatible with the global isomorphism and localization maps. Applying the same decomposition to inertia shows that a local class on the left is unramified exactly when every corresponding class on the right is unramified. At a place required to split, the zero local condition corresponds to zero at every $`w\mid v`$.

This comparison includes split, inert, and ramified places. It does not assume that complex conjugation belongs to a finite decomposition group. At the real place, $`K`$ has only complex places, and the induced degree-one cohomology is zero.

Thus, for any set of rational primes at which strict splitting is imposed, the isomorphism identifies the Selmer groups defined by those strict conditions and by unramified conditions elsewhere. For a published treatment of induced Selmer structures and local compatibility, see [Morgan–Smith (2024), *Field change for the Cassels–Tate pairing and applications to class groups*](https://doi.org/10.1007/s40993-024-00545-2), §4.1.

### From finite coefficients to the torsion Selmer group

There is a precise version for the divisible coefficients used in the archive. Suppose in addition that $`\psi`$ is unramified at every finite place, $`\ell`$ is unramified in $`K`$, and $`\ell-1\nmid e`$. Put

~~~math
M=(E/\mathcal O)(\alpha),\qquad
A_r=(\mathcal O/\varpi^r)(\alpha),
~~~

where $`\varpi`$ is a uniformizer. Define $`\mathop{\mathrm{Sel}}_K(M)`$ using unramified conditions at all finite places and strict zero conditions at the places above $`\ell`$.

At every $`w\mid\ell`$, the residual cyclotomic character on inertia has order $`\ell-1`$, while $`\psi`$ is unramified. There is therefore an inertia element on which $`\alpha-1`$ is a unit. It follows that $`H^0(K,M)=0`$ and $`H^0(K_w,M)=0`$. The coefficient exact sequence then gives

~~~math
H^1(K,A_r)\simeq H^1(K,M)[\varpi^r],
~~~

and the strict local conditions at $`\ell`$ agree under this identification.

Away from $`\ell`$, inertia acts trivially on $`M`$, and $`M`$ is divisible. The same coefficient sequence makes
$`H^1(I_w,A_r)\to H^1(I_w,M)`$ injective. Hence the unramified conditions also agree. We obtain

~~~math
\mathop{\mathrm{Sel}}_K(A_r)
 \simeq \mathop{\mathrm{Sel}}_K(M)[\varpi^r].
~~~

This avoids silently replacing divisible-coefficient Selmer torsion by finite-coefficient cohomology with different local conditions.

Combining this isomorphism with the adjoint embedding above realizes each finite torsion layer of the desired Selmer group as infinitesimal polarized deformations. Explicitly, over the square-zero algebra $`\mathcal O\oplus A_r`$, the formula

~~~math
r_Z(g)=(I_3+Z(g))\,r_0(g)
~~~

defines a representation because the cocycle identity is precisely its multiplicativity condition. Two cocycles differing by a coboundary give strictly conjugate infinitesimal representations.

### What is still missing

A nonzero infinitesimal deformation does not imply another characteristic-zero point. For example,

~~~math
R=\mathcal O[x]/(\varpi x,x^2)
~~~

has nonzero augmentation cotangent module $`(x)/(x)^2\simeq\mathcal O/\varpi`$ but $`R\otimes_{\mathcal O}E=E`$. There is no second generic point. This is why the source's global deformation, finiteness, and rigidity arguments cannot be replaced by the first-order calculation.

The relevant source path is now explicit: *RhoKApply.lean* defines *Dat* and its canonical diagonal; *ShaInjGen.lean* embeds a single rational character by $`t\mapsto t(E_{21}-E_{32})`$; *VlenLe.lean* passes through *ShaInj* and *ModelLower*; *FOneCharU.lean* then uses global automorphy and point rigidity. The two-dimensional induced plane above replaces the first cohomological embedding, but the remaining theorems have not been proved for this new base point.

There is also a substantive arithmetic hypothesis. The source's *GD* requires $`\ell\nmid h_K`$. In *UnitaryThreeGroups/PowEqOneOfUnr.lean*, *char_eq_one* uses it to force every everywhere-unramified character congruent to one modulo $`\ell`$ to be trivial: class field theory gives $`\kappa^{h_K}=1`$, and $`h_K`$ is an $`\ell`$-adic unit. If $`\psi`$ is a nontrivial unramified character of $`\ell`$-power order, then $`\ell\mid h_K`$ and that exact hypothesis fails. Such a character cannot be inserted into the old theorem by keeping its original hypotheses.

Finally, even a fixed-field twisted Selmer bound would not yet prove Soulé's full conjecture. The available automorphic counts have constants depending on the field. The conjecture requires a bound uniform in all fields of a fixed degree with only $`\log|D_F|`$ on the logarithmic-torsion side. Polynomial costs in $`|D_F|`$ do not satisfy that requirement.

## Corollary for every K-degree over the integers

**Corollary.** Assuming the archive's *Bound*, there are absolute constants $`C',B`$ such that

~~~math
\log\left|K_m(\mathbb Z)_{\rm tors}\right|
 \le C'(m+1)^B
 \qquad(m\ge1).
~~~

One may take $`B=\max(A,2)`$ after increasing the constant. This is a consequence for the entire graded K-theory of $`\mathbb Z`$, with no primes omitted. It is not the full number-field conjecture of Soulé.

**Proof.** The degrees divisible by four are covered by the proposition. The other degrees have established order formulas; we use Weibel's Theorem 1, Propositions 20 and 22, Lemma 27, and Corollary 95. In this paragraph, $`B_{2k}`$ denotes the usual number-theoretic Bernoulli number, not the survey's reindexed positive convention.

For odd $`m=2i-1\ge3`$, the torsion order is at most $`2w_i(\mathbb Q)`$. If $`i`$ is odd, $`w_i=2`$. If $`i`$ is even, the explicit local factors give

~~~math
w_i
 =2^{2+v_2(i)}
   \prod_{\substack{p\ {\rm odd}\\p-1\mid i}}p^{1+v_p(i)}
 \le 4i\,(i+1)!.
~~~

Indeed, the factors $`p^{v_p(i)}`$ appearing in this product divide $`i`$, and the remaining distinct primes are at most $`i+1`$. Thus the logarithmic torsion in odd degrees is $`O(m\log(m+1))`$.

For $`m=4k-2`$, let $`c_k`$ be the positive numerator of $`|B_{2k}|/(4k)`$ in reduced terms. The established order formula gives $`|K_{4k-2}(\mathbb Z)|\le2c_k`$. Von Staudt–Clausen bounds the denominator of $`B_{2k}`$ by $`(2k+1)!`$, while Euler's formula gives

~~~math
|B_{2k}|
 =\frac{2(2k)!\,\zeta(2k)}{(2\pi)^{2k}}
 \le4(2k)!.
~~~

Dividing a reduced rational number by the integer $`4k`$ cannot increase its numerator. Therefore

~~~math
|K_{4k-2}(\mathbb Z)|
 \le 8(2k)!(2k+1)!,
~~~

whose logarithm is again $`O(m\log(m+1))`$. Finally, $`K_1(\mathbb Z)`$ has order two. These estimates, together with the proposition, prove the corollary.

The Bernoulli order formula does not determine the group structure: this proof does not establish cyclicity of $`K_{4k-2}(\mathbb Z)`$.

## Review and current next obligation

A second research worker checked the duality signs, the quadratic exceptional-prime argument, and the local-$`2`$ step, and highlighted the need to use global ramification set $`S=\{\ell,\infty\}`$. The proof above addresses those points using explicit source definitions and published comparison statements. The coordinating researcher then independently checked the source quantifiers, the degree $`K_{2e}`$, odd-prime localization, and the exceptional-prime removal against the published comparison formulas, and found no concrete gap in those steps. These are internal mathematical reviews; this is not a Lean check or external peer review.

To solve Kummer–Vandiver, the remaining step is to eliminate nonzero residual congruence classes in the region left by this bound. Coefficient extension, residual periodicity, and the trace-only Frobenius argument above do not do so. The next useful input would be an extension-sensitive obstruction to the rank-three automorphic points constructed from a nonzero class, or an auxiliary-prime congruence theorem forcing the relevant congruence-ideal support to be empty.

Additional duality reference: [Milne, Arithmetic Duality Theorems, second edition](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, local and global duality. This is used as an established theorem, not as an open conjecture to claim.
