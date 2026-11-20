# Kummer–Vandiver conjecture

Status: open. This note extracts an arithmetic consequence from the supplied Riemann-hypothesis archive and tests routes from that consequence to the full conjecture. It does not claim a solution.

Research date: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80). The archive is treated as correct as instructed; no Lean verification is performed.

## Exact target

For every odd prime $p$, let $A_p$ be the $p$-primary subgroup of the ideal class group of $\mathbb Q(\zeta_p)$. If $\omega$ is the Teichmüller character, Kummer–Vandiver asserts

~~~math
A_p^{\omega^{2j}}=0
\qquad (0\le 2j\le p-3).
~~~

Equivalently, $p$ does not divide the class number of $\mathbb Q(\zeta_p)^+$. Another equivalent formulation is $K_{4n}(\mathbb Z)=0$ for every positive integer $n$. The equivalence uses the established comparison between algebraic K-theory and étale cohomology. See Kurihara and Weibel below. The conjecture concerns torsion, so rational vanishing alone does not settle it.

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

Write $L_{\ell,\mathcal O}(e)$ for the source's *len*: the $\mathcal O$-length of the negative-Tate-twist Selmer group with coefficients $\mathcal O\otimes_{\mathbb Z_\ell}(\mathbb Q_\ell/\mathbb Z_\ell)(-e)$. Its cocycles are unramified at finite primes and locally coboundaries at primes over $2\ell$. Let $r(\mathcal O)$ be the ramification-index normalization called *eO* in the source.

*Bound* says there are natural-number constants $C,A$, independent of $e$, the coefficient rings, and the finite prime set $T$, such that, for every positive even $e$ and every $T$ consisting of primes $\ell\ge5$ with $\ell-1\nmid 2e$,

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

This leaves every admissible prime satisfying $\log\ell\le C(e+1)^A$ unresolved. A finite set for each fixed weight is not a finite set for all weights.

ClassNumberThree.lean does not assert class number three: it uses the auxiliary imaginary quadratic field of discriminant $-3$, whose class number is one. Names should not replace examination of the statement.

## Where the bound comes from

The stronger source proposition *PropGK* produces, for every auxiliary prime $q$ avoiding $30N|\operatorname{disc}K|$, a nonzero integer $D_q$ with

~~~math
\log|D_q|
 \le c_K\varphi([(\mathbb Z/N\mathbb Z)^\times:H])
       (N(e+1))^{A_K}\log q.
~~~

For $\ell\ne q$, eligible character-orbit Selmer lengths are bounded by $2v_\ell(D_q)$. The character orbit is a finite set of distinct characters, not an arbitrary multiset. Two different auxiliary primes handle the excluded case $\ell=q$ and give *CorGK*. Taking trivial character, conductor $2$, auxiliary field $\mathbb Q(\sqrt{-3})$, and auxiliary primes $7,11$ gives *Bound*.

This is stronger information than an unspecified finiteness assertion. It still permits nonzero lengths at primes dividing every relevant congruence integer.

## Attempts to upgrade the estimate

### Coefficient extension

A totally ramified extension of coefficient discrete valuation rings of ramification degree $r$ multiplies the length of a finite base-changed module by $r$. The source divides by that same ramification index. Therefore making the coefficient field more ramified does not increase the normalized left side.

An unramified coefficient extension changes the residue-field cardinality; it does not multiply module length over the new discrete valuation ring. Treating residue-field degree as extra length would be an error.

Taking a direct sum of arbitrarily many copies would multiply length, but the quantified objects in *Bound* are rank-one Tate-twist coefficient modules over a discrete valuation ring. They do not include arbitrary multiplicities. Direct-product coefficient rings are not eligible discrete valuation rings.

Outcome: no amplification.

### Twist periodicity

Modulo $\ell$, the cyclotomic character has period $\ell-1$, so residual cohomology conditions repeat in $e$ modulo $\ell-1$. This does not give an isomorphism of all integral Tate twists. Even granting persistence of a nonzero residual class for every positive weight in one congruence class, the right side grows with the weight. The smallest positive representative need not be small enough to force a contradiction.

For a nontrivial even eigenspace of $A_\ell$, the corresponding least positive even $e$ can have size comparable to $\ell$. An estimate $\log\ell\le C(e+1)^A$ is compatible with this situation for every fixed positive $A$.

Outcome: periodicity does not close the missing region.

### Varying the auxiliary prime

Suppose the source's normalized Selmer length at $\ell$ is positive. Then *PropGK* forces $\ell\mid D_q$ for every admissible $q\ne\ell$. To deduce vanishing one needs, for each $\ell$, an admissible $q$ for which $\ell\nmid D_q$, or a stronger uniform gcd statement about these integers.

Dirichlet GRH controls primes in abelian residue classes. It does not itself prove the required separation of residual automorphic representations. A nonsplit extension and its split semisimplification have identical traces at every group element. For example,

~~~math
\operatorname{tr}
\begin{pmatrix}
\chi(g)&b(g)\\0&1
\end{pmatrix}
=\chi(g)+1
~~~

for every cocycle $b$. Selecting more Frobenius elements cannot detect $b$ using trace alone. A useful argument would have to exploit extra extension data or prove that the relevant congruences cannot occur.

Outcome: a precise new arithmetic input is required.

### Enlarging conductor or base field

The character-orbit estimate carries a polynomial cost in the conductor and an index factor. The constants also depend on the auxiliary number field. Adding characters or changing fields without retaining those costs is not a contradiction. No construction has been found that multiplies a fixed nonzero class faster than these costs.

Outcome: no justified amplification.

### Logical insufficiency of the inequality

Even an abstract periodic family with length one at one prime and one residue class of weights, and zero elsewhere, can satisfy a bound of the displayed form after enlarging $C$. This is not a counterexample in arithmetic. It proves that integrality, the upper bound, and residual periodicity by themselves do not imply universal vanishing.

## Prior-art screen

1. **Kurihara (1992).** *Some remarks on conjectures about cyclotomic fields and K-groups of Z*, Compositio Mathematica 81, 223–236. [Original paper](https://numdam.org/item/CM_1992__81_2_223_0.pdf). The cohomology/class-group relationship and the K-theory formulation predate this project.

2. **Soulé (1999).** *Perfect forms and the Vandiver conjecture*, Journal für die reine und angewandte Mathematik 517, 209–221. [Preprint](https://arxiv.org/abs/math/9812171), [full text](https://arxiv.org/pdf/math/9812171). It already proves large-prime vanishing for each fixed odd weight. Its threshold is of double-exponential type in the weight: the abstract gives $\log p>n^{224n^4}$. Its Theorem 2 and Lemma 2 give $\log k(m)\le m^{20m^4}$ after discarding small-prime torsion. This is not a fixed-degree polynomial bound in $m$.

3. **Weibel.** *Algebraic K-Theory of Rings of Integers in Local and Global Fields*. [Published survey](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf), especially §§5.7–5.9 and Theorem 105. It records the odd-order property of $K_{4n}(\mathbb Z)$ and the exact relation between its $\ell$-torsion and even cyclotomic class-group components. Historical numerical limits in this survey are not current bounds.

4. **Emery (2024).** *On the torsion part in the K-theory of imaginary quadratic fields*. [Journal paper](https://doi.org/10.1007/s00229-024-01598-4). The introduction compares its field-discriminant bounds with Soulé's work and identifies the rational-field case as still related to Vandiver. Bounds with the field varying are not automatically polynomial bounds with the K-degree varying.

5. **Chen et al. (2026).** *Almost all primes are partially regular*. [Primary paper](https://arxiv.org/abs/2602.05090). It proves a density-one theorem and, by reflection, even-eigenspace vanishing in the range $2\le2k\le\sqrt p/(\log p)^\alpha$, $\alpha>1/2$. This does not settle Vandiver. Its small positive eigenspace range is also different from the near-$p$ eigenspace range produced by fixing a small positive Tate weight here.

6. **Dutour Sikirić–Elbaz-Vincent–Kupers–Martinet; Kupers.** $K_8(\mathbb Z)=0$ is already proved. [Journal paper](https://www.cambridge.org/core/journals/journal-of-the-institute-of-mathematics-of-jussieu/article/abs/voronoi-complexes-in-higher-dimensions-cohomology-of-glnmathbbz-for-ngeqslant-8-and-the-triviality-of-k8mathbbz/6C1E2AA4FA1AD29554384C091A51D8E5), [Kupers's independent short proof](https://www.utsc.utoronto.ca/people/kupers/wp-content/uploads/sites/50/2021/01/k8zshorter.pdf). It cannot be counted as a new target or resolution.

7. **Reinhart (2024; revised 2025).** *A counterexample to the Conjecture of Ankeny, Artin and Chowla*. [Primary paper](https://arxiv.org/abs/2410.21864). This neighboring named conjecture is already disproved and is excluded. [Author's publication list](https://imsc.uni-graz.at/reinhart/publications.htm) records acceptance in Algebra & Number Theory.

Searches used both engines and exact names, K-theory formulations, polynomial-bound terminology, later citations, and 2026 updates. No full resolution of Kummer–Vandiver was found. A search cannot establish a universal negative about unpublished work.

## Current next obligation

Translate *Bound* to the complete group $K_{4n}(\mathbb Z)$, including the local condition at $2$ and the excluded primes $\ell-1\mid2e$. This may give a useful polynomial bound for its logarithmic order, but even such a bound will remain a partial result toward the named conjecture. The residual congruence obstruction above still has to be eliminated to solve it.
