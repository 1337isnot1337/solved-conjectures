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

## Derived K-theory consequence

The following is a mathematical consequence of the archive's *Bound*, rather than a consequence of the final RH statement alone. It is recorded here for independent review and is not counted as a solution of Kummer–Vandiver.

**Proposition.** Assuming the source bound stated above, there are absolute constants $C,A$ such that, for every $n\ge1$,

~~~math
\log\left|K_{4n}(\mathbb Z)\right|\le C(2n+1)^A.
~~~

The finite group in this statement includes all primes. The argument below removes the exceptional-prime restriction from the source rather than silently omitting it.

### 1. Matching the source Selmer group

Fix an odd prime $\ell$ and a positive even integer $e$. Set

~~~math
M=\mathbb Q_\ell/\mathbb Z_\ell(-e),\qquad
T=\mathbb Z_\ell(e+1),\qquad
S=\{\ell,\infty\}.
~~~

Use coefficients $\mathcal O=\mathbb Z_\ell$ in *Bound*. The coefficient ramification index is one. The source *len* is the length of classes in $H^1(\mathbb Q,M)$ that are unramified at every finite prime and split at $\ell$ and $2$.

For a finite prime $q\ne\ell$, $M$ is unramified. Its unramified local first cohomology is

~~~math
H^1_{\rm unr}(\mathbb Q_q,M)
 =M/(\operatorname{Frob}_q-1)M=0.
~~~

Indeed, Frobenius acts by $q^{-e}$, up to the reciprocal convention. Its difference from one is a nonzero scalar in $\mathbb Z_\ell$, and every nonzero scalar acts surjectively on the divisible group $\mathbb Q_\ell/\mathbb Z_\ell$. Consequently the extra splitting condition at $2$ is automatic.

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

Poitou–Tate duality pairs $\Sha^1_S(M)$ with

~~~math
\Sha^2_S(T)
 =\ker\!\left(
 H^2(G_{\mathbb Q,S},T)
 \longrightarrow H^2(\mathbb Q_\ell,T)
 \right).
~~~

The Tate twist is $e+1$, because the Cartier dual of $M$ is $T$. If $\ell-1\nmid e$, then $H^0(\mathbb Q_\ell,M)=0$: choose a cyclotomic-character value whose $e$th power is not one modulo $\ell$, so its difference from one acts invertibly. Local Tate duality gives $H^2(\mathbb Q_\ell,T)=0$. Hence

~~~math
\operatorname{length}_{\mathbb Z_\ell}\Sha^1_S(M)
 =\operatorname{length}_{\mathbb Z_\ell}
 H^2(\mathbb Z[1/\ell],\mathbb Z_\ell(e+1)).
~~~

The Quillen–Lichtenbaum comparison identifies the last group with the $\ell$-primary part of $K_{2e}(\mathbb Z)$. A precise published formulation is Weibel's Theorem 70 and Corollary 71. Thus $e=2n$ gives $K_{4n}$, not $K_{4n+2}$.

Here only the local group at $\ell$ and the real place are needed. It would be false to assert that all finite local second cohomology groups vanish: at $q\ne\ell$, the condition $\ell\mid q^e-1$ can give local invariants.

For all primes allowed in *Bound*, $\ell-1\nmid2e$ implies $\ell-1\nmid e$, so this comparison applies.

### 3. Removing the excluded odd primes

The standard mod-$\ell$ comparison gives

~~~math
K_{2e}(\mathbb Z)/\ell
 \cong
 \left(A_\ell/\ell A_\ell\right)^{\omega^{-e}}.
~~~

One can obtain it from Corollary 71 of Weibel, the Kummer exact sequence over $\mathbb Z[\zeta_\ell,1/\ell]$, and descent through the group of order $\ell-1$. There is a unique prime above $\ell$, and it is principal; the relevant Brauer group is zero. This removes class-group-localization and Brauer corrections. Kurihara's Lemma 1.2 and the discussion following Corollary 1.3 give the same relationship.

Now suppose $\ell-1\mid2e$. The character $\omega^{-e}$ is either trivial or quadratic.

For the trivial character, extension and norm identify the invariant $\ell$-primary class group with that of $\mathbb Q$, which is zero.

For the quadratic character, positivity of its parity follows from evenness of $e$, so $\ell\equiv1\pmod4$. Its fixed field is $F=\mathbb Q(\sqrt\ell)$. Put $H=\operatorname{Gal}(\mathbb Q(\zeta_\ell)/F)$. Its order $(\ell-1)/2$ is prime to $\ell$. If $j$ is extension of ideal classes and $N$ the norm, then for any $H$-invariant $\ell$-primary class $x$,

~~~math
jN(x)=\sum_{\sigma\in H}\sigma x=|H|x.
~~~

Multiplication by $|H|$ is invertible on an $\ell$-primary group. Therefore every such invariant class comes from the $\ell$-primary class group of $F$.

That group is zero. To see this without a numerical class-number table, Minkowski's theorem gives an integral ideal of norm at most $B=\sqrt\ell/2$ in each class of $F$. In a quadratic field the number of ideals of norm $m$ is at most the divisor count $d(m)$: at a split prime the local count is $a+1$ for exponent $a$, and at inert or ramified primes it is no larger. Hence, writing $b=\lfloor B\rfloor$,

~~~math
h_F
 \le\sum_{m=1}^{b}d(m)
 \le\sum_{m=1}^{b}m
 =\frac{b(b+1)}2
 \le\frac{\ell}{8}+\frac{\sqrt\ell}{4}
 <\ell.
~~~

The last inequality holds for every $\ell\ge5$. Thus $\ell\nmid h_F$. For $\ell=3$, only the trivial character occurs because $e$ is even.

In either case, $K_{2e}(\mathbb Z)/\ell=0$. Since $K_{2e}(\mathbb Z)$ is finite, its entire $\ell$-primary part is zero. This handles every odd prime excluded by *Bound*, including $3$.

### 4. Summing the lengths

The established two-primary computation gives $K_{4n}(\mathbb Z)\{2\}=0$; see Weibel §5.8, or Rognes–Weibel. The group $K_{4n}(\mathbb Z)$ is finite. Choose in *Bound* the finite set of all remaining prime divisors of its order and take $e=2n$. The preceding comparisons give

~~~math
\log|K_{4n}(\mathbb Z)|
 =\sum_{\substack{\ell\ge5\\ \ell-1\nmid4n}}
  \log\ell\,
  \operatorname{length}_{\mathbb Z_\ell}
      K_{4n}(\mathbb Z)\{\ell\}
 \le C(2n+1)^A.
~~~

This proves the proposition from the stated source bound and the cited standard comparison theorems.

### 5. Consequence and remaining obstruction

The proposition bounds every possible torsion prime by $\exp(C(2n+1)^A)$ and the total logarithmic torsion by a fixed-degree polynomial. It does not show the finite group is trivial. In the class-group formulation, it yields a near-$\ell$ even-eigenspace vanishing range with positive Tate weights up to a power of $\log\ell$.

The source's *large_of* already contains the principal vanishing mechanism. The additional work here is the complete K-theory translation, including the primes omitted by *Bound*. This is a derived consequence of Alpöge's arithmetic input, not an independent proof of a named open conjecture.

The earlier Soulé–Gabber bound is qualitatively weaker in its dependence on the K-degree. The comparison is not a complete priority determination: the announcement and its accompanying archive already contain the arithmetic estimate. No original-priority claim is made for the displayed K-theory consequence.

## Review and current next obligation

A second research worker checked the duality signs, the quadratic exceptional-prime argument, and the local-$2$ step, and highlighted the need to use global ramification set $S=\{\ell,\infty\}$. The proof above addresses those points using explicit source definitions and published comparison statements. It has not undergone external peer review.

To solve Kummer–Vandiver, the remaining step is to eliminate nonzero residual congruence classes in the region left by this bound. Coefficient extension, residual periodicity, and the trace-only Frobenius argument above do not do so. The next useful input would be an extension-sensitive obstruction to the rank-three automorphic points constructed from a nonzero class, or an auxiliary-prime congruence theorem forcing the relevant congruence-ideal support to be empty.

Additional duality reference: [Milne, Arithmetic Duality Theorems, second edition](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, local and global duality. This is used as an established theorem, not as an open conjecture to claim.
