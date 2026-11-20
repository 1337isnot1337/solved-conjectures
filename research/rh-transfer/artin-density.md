# Artin's primitive-root conjecture and the nonabelian transfer

Research checkpoint: 20 November 2026. Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

Status: the exact Artin density conjecture is **not proved here**. This note proves an auxiliary-field construction that removes the field and standard-additive-character restrictions from a proposed transfer to imaginary-quadratic class characters. It identifies the remaining analytic/arithmetic bridge. The construction uses standard algebraic number theory; no priority claim is made for this lemma.

The accepted input for this campaign is Alpöge's RH theorem and GRH for Dirichlet L-functions. The input is not silently enlarged to all Hecke or Dedekind zeta functions. No Lean compilation or verification is performed.

## 1. The named target and the prior-art exclusion

For each integer $g$ with $|g|>1$ which is not a square, let $\Pi(x;g)$ count primes $p\le x$ for which $g$ generates $(\mathbb Z/p\mathbb Z)^\times$. The target is the full corrected Artin asymptotic

```math
\Pi(x;g)\sim A(g)\mathop{\mathrm{Li}}(x),
\qquad
A(g)=\sum_{d\ge1}
\frac{\mu(d)}{[\mathbb Q(\zeta_d,g^{1/d}):\mathbb Q]}>0.
```

The density constant includes the familiar entanglement correction. The existence or positive-lower-density assertions alone are excluded from our novelty target:

- OpenAI's [4 October 2026 manuscript](https://github.com/openai/math/blob/main/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/primitive-roots-all-integer-bases.pdf) claims an unconditional lower bound of order $x/(\log x)^2$ for every admissible base.
- Bhargava's [14 October 2026 preprint](https://hexagonmath.org/2610.00228v1) claims a positive lower relative density, using the marked Type II estimates and a Dedekind-zeta zero-free half-plane. Its abstract explicitly distinguishes this from the exact Artin density.
- Vojdanovski's [12 November 2026 preprint](https://hexagonmath.org/2611.00341v1) claims positive lower density for simultaneous primitive roots under the necessary Matthews obstruction conditions. It likewise does not assert the exact density.

These are primary-source claims, not independent certification of their proofs. Their presence makes it inappropriate to present another existence argument as a new resolution.

[Fan–Pollack, arXiv:2505.05601v2](https://arxiv.org/html/2505.05601v2), Theorem 1.1 and Lemma 3.1, give a current precise account of the older Hooley route. The required input is uniform counting for splitting completely in the Kummer fields

```math
K_{g,d}=\mathbb Q(\zeta_d,g^{1/d}).
```

In particular, their Lemma 3.1 counts primes satisfying

```math
p\equiv1\pmod d,\qquad g^{(p-1)/d}\equiv1\pmod p
```

by $\pi(x)/[K_{g,d}:\mathbb Q]+O(\sqrt{x}\log(|g|dx))$, with an absolute implied constant, conditional on the required Dedekind GRH. A Dirichlet character detects the first congruence; it does not detect the second condition for general $d$.

Searches on 20 November included the exact Artin-density formulation, the 2026 primitive-root papers, the OpenAI catalogue, Bhargava and Vojdanovski, and the Fan–Pollack refinement. No full unconditional exact-density proof was located. This is a recorded search outcome, not an assertion of exhaustive priority clearance.

## 2. The extracted hypotheses

Source snapshot: [1337isnot1337/riemann-hypothesis-solved at 9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e).

The relevant files are:

- [SplitStab.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/SplitStab.lean): the predicate GoodK requires a CM extension E/F, an imaginary quadratic subfield, finite unramifiedness, the standard additive character, splitting above 2, and restrictions at inert primes.
- [WeilTensorModels.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean): IsStd fixes the archimedean trace character. PsiUnr says that the local ring of integers is self-dual. Base also requests a CM type, integer weights, a finite split-place set P, and one split place v1.
- [TLiftK.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean): the theta-lift statement still has representation, lattice, character-restriction, and weight hypotheses. A GoodK witness alone does not supply them.
- [ExistsPageN.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean): VWin is quantified over primitive Dirichlet-character data PChar, and IsChiField describes a specific cyclotomic fixed field. This is not a theorem for arbitrary finite-order Hecke characters.

## 3. A uniform auxiliary-field lemma

**Proposition.** Let K be any imaginary quadratic field, and let S be any finite set of rational primes containing 2, 3, and all primes ramified in K. Let H/K be any finite extension. There exist distinct odd primes q and r outside S and outside the rational primes ramified in H, and a multiquadratic CM field

```math
E=K\,\mathbb Q(\sqrt{-q})\,\mathbb Q(\sqrt{-r}),
\qquad F=E^+,
```

with the following properties:

1. $[E:\mathbb Q]=8$ and $[F:\mathbb Q]=4$.
2. $E/F$ is unramified at every finite prime.
3. Every prime of F above S splits in E.
4. Every prime of F above a rational prime ramified in E also splits in E.
5. $E\cap H=K$ inside a common algebraic closure.
6. The standard trace additive character of F is unramified at every finite prime inert in E/F; every such prime has residue-field norm greater than 3.

**Proof.** Let D be the discriminant of K. Choose q in the reduced residue class

```math
q\equiv -1\pmod {8\prod_{\substack{p\in S\\p\ {\rm odd}}}p}.
```

Dirichlet's theorem provides infinitely many choices, so the finitely many primes ramified in H can be avoided. Put $K_1=\mathbb Q(\sqrt{-q})$. Its discriminant is $-q$, since $q\equiv7\pmod8$. Every odd prime p in S splits in $K_1$, because $-q\equiv1\pmod p$; 2 splits because $-q\equiv1\pmod8$.

Choose r such that the quadratic Dirichlet characters satisfy

```math
\chi_K(r)=1,\qquad \chi_{K_1}(r)=-1.
```

For an explicit CRT construction, take $r\equiv1\pmod{|D|}$ and take r in a nonzero nonsquare class modulo q, together with an odd residue if D is odd. These conditions are compatible because $q\nmid D$. The resulting reduced residue class contains infinitely many primes. Avoid S, q, and the rational primes ramified in H. Put $K_2=\mathbb Q(\sqrt{-r})$.

By quadratic reciprocity, since $q\equiv3\pmod4$,

```math
\left(\frac{-q}{r}\right)=\left(\frac rq\right)=-1,
\qquad
\left(\frac{-r}{q}\right)
=-\left(\frac rq\right)=1.
```

Thus r splits in K, and q splits in $K_2$.

The squareclasses defining K, $K_1$, and $K_2$ are independent: q and r occur to odd valuation only in their respective new squareclasses, and the class defining K is nonsquare. Therefore $E/\mathbb Q$ is Galois with group $(C_2)^3$. Complex conjugation c acts nontrivially on each of the three imaginary quadratic subfields. Its fixed field F is totally real, so E is CM and the stated degrees follow.

Fix a rational prime p. If p splits in one of the three imaginary quadratic subfields J, the decomposition group in $\mathop{\mathrm{Gal}}(E/\mathbb Q)$ acts trivially on J. It consequently cannot contain c. Since $\mathop{\mathrm{Gal}}(E/F)=\{1,c\}$, the relative decomposition group at any prime over p is trivial. Hence every prime of F over p splits in E.

Every rational prime ramified in E belongs to

```math
\{p:p\mid 2Dqr\}.
```

The primes dividing $2D$ belong to S and split in $K_1$. The prime q splits in $K_2$, and r splits in K. The decomposition argument proves property 4, and the same argument with $K_1$ proves property 3. Away from the ramified rational primes of E, the extension E/F is automatically unramified. This proves property 2.

For property 5, $E/K$ is biquadratic. Its three quadratic intermediate extensions are obtained by adjoining $\sqrt{-q}$, $\sqrt{-r}$, and $\sqrt{qr}$. The first is ramified at every prime of K over q, the second at every prime over r, and the third at both. Here q and r are odd and unramified in K, and their valuations in the relevant radicands are odd. None of these extensions can be contained in H, which is unramified at q and r. Any nontrivial subextension of a biquadratic extension contains a quadratic one. Thus $E\cap H=K$.

Finally, let v be inert in E/F and let p be the underlying rational prime. Property 4 implies that p is unramified in E, hence in F. The local different of $F_v/\mathbb Q_p$ is then trivial. The standard trace additive character has the inverse different as its local annihilator, so $\mathcal O_{F_v}$ is self-dual. Also p is neither 2 nor 3 by property 3, and consequently $\mathop{\mathrm N}v>3$. This proves property 6. ∎

This proves a uniform statement for every imaginary quadratic field, not just the example of discriminant -23. Its ingredients are the CRT, Dirichlet's theorem, quadratic reciprocity, and decomposition/inertia groups. Standard background appears in [Milne, Algebraic Number Theory](https://www.jmilne.org/math/CourseNotes/ANT.pdf) and [Milne, Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf).

### Relation to GoodK

Use the canonical trace character, any choice of the two complex embeddings over each real place, arbitrary integer weights, and P empty. Choose v1 above a rational prime splitting completely in E; such primes can be obtained in an identity residue class modulo the conductor of the abelian field E. The structure Base places no further condition on its integer weights.

The proposition supplies the field and additive-character entries of GoodK. The field is also Galois over Q, so it supplies the stronger Galois entry of Base.IsGood. It does not construct the Hermitian spaces, lattices, character restrictions, weight inequalities, or uniform estimates needed by the full theta argument.

The empty choice of P is useful for unramified class characters. A ramified Hecke character may require P to contain its conductor places. Those extra places must also satisfy PsiUnr. Splitting alone does not provide this: the standard character can be ramified at a split place when F is ramified over Q. This is a separate restriction for arbitrary ray-class characters.

### Why the first biquadratic attempt was insufficient

For $K=\mathbb Q(\sqrt{-23})$, the simpler choice $E=K(i)$ and $F=\mathbb Q(\sqrt{23})$ is indeed unramified at finite primes: the discriminant product is $(-23)(-4)(92)=92^2$. It also splits above 2. But the place over 23 is inert in E/F, while F is ramified there. Thus the fixed standard trace character is not unramified there. Scaling that character is not permitted by the source definition of IsStd. The degree-eight construction avoids this problem by ensuring splitting at every rational ramified prime.

## 4. Preservation of characters and descent of zeros

Let $\psi$ be a nontrivial finite-order Hecke character of K, and let H/K be the finite abelian extension cut out by it. Construct E using the proposition and put

```math
\Psi=\psi\circ\mathop{\mathrm N}_{E/K}.
```

Under class field theory this norm pullback corresponds to restricting the Galois character to the absolute Galois group of E. Since $E\cap H=K$, the restriction has the same image as the original character. In particular, $\Psi$ has the same order as $\psi$.

The conductor of an unramified class character stays unramified under norm pullback: local norms take units to units. If $\psi$ is a class character of an imaginary quadratic field, $\psi^c=\psi^{-1}$, since an ideal times its conjugate is generated by its positive rational norm. The norm pullback inherits the same conjugate-inverse relation.

Write $\widehat G$ for the four quadratic-or-trivial characters of $G=\mathop{\mathrm{Gal}}(E/K)$. Artin induction and restriction give

```math
L_E(s,\Psi)=\prod_{\eta\in\widehat G} L_K(s,\psi\eta).
```

Indeed,

```math
\mathop{\mathrm{Ind}}_{G_E}^{G_K}
\mathop{\mathrm{Res}}_{G_E}^{G_K}\psi
=
\psi\otimes\mathop{\mathrm{Ind}}_{G_E}^{G_K}1
=
\bigoplus_{\eta\in\widehat G}\psi\eta.
```

None of the characters $\psi\eta$ is trivial: otherwise the field cut out by $\psi$ would be a nontrivial subfield of E, contradicting $E\cap H=K$. Every factor is therefore an entire Hecke L-function. If $L_E(s,\Psi)$ has no zeros in $\Re s>1/2$, the product identity shows the same for $L_K(s,\psi)$. There are no poles that could cancel a zero. The functional equation then yields the critical-line statement for $L_K(s,\psi)$.

Thus a zero-free theorem for these norm-pulled-back class characters on suitable GoodK fields would settle GRH for all imaginary-quadratic class characters. It would already go beyond Dirichlet GRH. This implication is a precise reduction, not a proof of its zero-free premise.

## 5. The bridge still missing

The source's PChar is rational Dirichlet-character data. Its IsChiField predicate constrains the field by the kernel of a Dirichlet character together with explicit quadratic congruence conditions. Replacing a finite-order class character of K by its norm pullback to E does not turn it into a Dirichlet character over Q.

For example, a nontrivial class character of $\mathbb Q(\sqrt{-23})$ cuts out a cyclic cubic extension over that quadratic field; over Q its normal closure has group $S_3$. The induced two-dimensional representation is not a sum of one-dimensional Dirichlet representations. Choosing an abelian CM base E does not change that fact.

To complete the proposed transfer, one must construct and prove a replacement for the source's character-specific arithmetic window and explicit-formula comparison which retains the chosen Hecke character. The missing statement must specify the field family, conductor dependence, cohomological lengths, and uniformity in the scale. An assertion that the theta theorem accepts arbitrary CM fields does not prove this replacement.

The source's VVle is a bound on a logarithm-weighted sum of cohomological lengths. It is not the assertion that every length is zero. No such vanishing is inferred here.

Finally, even GRH for every imaginary-quadratic class character would not itself discharge Hooley's hypotheses for all $K_{g,d}$. The latter form an unbounded family of generally nonabelian Kummer extensions over Q, abelian over cyclotomic fields of growing degree. A further extension to those Hecke characters, with the required uniform estimates, remains necessary.

## 6. Next research obligations

1. Trace where the cyclotomic kernel in IsChiField enters the comparison and arithmetic-window arguments.
2. Test whether the cohomological and theta estimates can be formulated for the above conjugate-inverse class characters without changing the scale exponent.
3. Separate conductor restrictions of the matching integrals from the field-level GoodK restrictions already discharged.
4. For an Artin-density result, prove the required Kummer-family splitting estimate or a sufficient weaker uniform replacement. Do not report a fixed cubic example as the full conjecture.

No named open conjecture has been resolved by this note.

## 7. A rigorous limit on the field-containment approach

**Proposition.** Let K be imaginary quadratic, and let $\psi$ be a class character of order $m>2$. Let H/K be the cyclic extension cut out by $\psi$. Then H cannot be embedded in any CM field.

**Proof.** Conjugation acts by inversion on the ideal class group of K: the product of an ideal with its conjugate is principal. It preserves the kernel of $\psi$, so H is Galois over Q and

```math
\mathop{\mathrm{Gal}}(H/\mathbb Q)
\simeq C_m\rtimes C_2,\qquad c\sigma c^{-1}=\sigma^{-1}.
```

Because $m>2$, complex conjugation c is not central.

If H were contained in a CM field M, take the Galois closure of M over Q. This closure is still CM, and its complex conjugation is central. Restricting that central element to the Galois subfield H would give central complex conjugation in $\mathop{\mathrm{Gal}}(H/\mathbb Q)$, a contradiction. The two used CM-field facts are [Milne, *Complex Multiplication*, Proposition 1.4 and Corollary 1.5](https://www.jmilne.org/math/CourseNotes/CM.pdf). ∎

The same obstruction appears in the Kummer fields needed for Artin's conjecture. If $\ell$ is an odd prime and the rational integer g is not an $\ell$th power, put $M=\mathbb Q(\zeta_\ell,g^{1/\ell})$, taking the real $\ell$th root of g. The automorphism $\tau$ multiplying that root by $\zeta_\ell$ has order $\ell$, and complex conjugation satisfies $c\tau c^{-1}=\tau^{-1}$. It is noncentral, so M cannot embed in a CM field. This rules out an entire proposed containment mechanism; it does not prove that theta methods over CM bases cannot control the corresponding representations.

There is no conflict with Section 3: E contains the quadratic base K, not its non-CM class field H. Section 4 preserves H through disjointness rather than placing H inside E. A successful transfer must keep the chosen class character explicitly in the analytic and geometric comparison.

### Exact source boundary

The restriction is present on the analytic side, not only in a top-level wrapper:

- [PrimePairSizeCondition.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/PrimePairSizeCondition.lean) defines PChar as a primitive Dirichlet character with integer modulus.
- [ExplicitFormulaErrorOfHostConditions.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/ExplicitFormulaErrorOfHostConditions.lean) defines ZeroFreeAbove using that Dirichlet L-function, Gm using a finite set of these characters, and Level.cyc using powers of one Dirichlet character.
- [TwistForm.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/CharacterBoxes/TwistForm.lean) states KerChi using a rational residue class and its Artin symbol.
- [TopWin.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/TopWin.lean) converts the corresponding weighted Chebyshev bounds on scale windows into zero-freeness for those retained characters.

The next mathematical target is therefore a character-twisted replacement for the weighted Chebyshev comparison and its arithmetic-window supply. It cannot be replaced by a field embedding lemma. The latter local and field conditions are now discharged uniformly; the genuinely new analytic comparison remains unproved.


## 8. A class character gives an actual automorphic representation of U(1)

Let K be imaginary quadratic, let $\psi$ be a finite-order ideal class character of K, and let E/F be the auxiliary CM extension from Section 3, with $K\subset E$ and $F=E^+$. Write $\Psi=\psi\circ N_{E/K}$ and write c for complex conjugation. Then $\Psi^c=\Psi^{-1}$ and $\Psi$ is trivial on $\mathbb A_F^\times$: for an idele a of F, $N_{E/K}(a)=N_{F/\mathbb Q}(a)$ as an idele of K coming from $\mathbb Q$, and an ideal class character of K is trivial on the rational ideles.

Put $T=U(1)_{E/F}$. There is a unique finite-order automorphic character $\mu$ of $T(\mathbb A_F)$ satisfying

```math
\mu(z/c(z))=\Psi(z)\qquad(z\in\mathbb A_E^\times).
```

Here is a direct construction, including the normalization. Local Hilbert 90 makes $z\mapsto z/c(z)$ surjective onto each local norm-one group. These local lifts can be chosen integral at almost every finite place. For an unramified nonsplit quadratic extension, multiplying a lift by a power of a uniformizer from the base makes it a unit without changing its quotient by its conjugate. At a split place one can lift $(u,u^{-1})$ by $(u,1)$. The kernel of the adelic map is exactly $\mathbb A_F^\times$, on which $\Psi$ is trivial. This defines a continuous finite-order character $\mu$. Global Hilbert 90 shows that $\mu$ is trivial on $T(F)$, since every element of $T(F)$ has a lift in $E^\times$.

Because E/F is unramified at all finite places and $\Psi$ is unramified, the same integral-lift argument proves that $\mu$ is trivial on the maximal compact subgroup at every finite place. Its infinite component is trivial because a finite-order continuous character of a connected compact circle is trivial. Thus the line spanned by $\mu$ in functions on $T(\mathbb A_F)$ is an automorphic representation of weight zero. Directly in the archive's definition, continuity, left rational invariance, open finite-level stabilizer, and finite-dimensional infinite-place translates hold; right translation preserves the line; the line is nonzero and irreducible.

This is the content required for the U(1) input in [BaseChangeDefiniteUnitary.lean, IsAutFormU and IsAutRepU](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/BaseChangeDefiniteUnitary.lean). It is a twisted input to the general [TLiftK statement](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/ThetaParseval/HalfIndexLattices/TLiftK.lean), subject to the other Hermitian-space, splitting-character, and weight hypotheses of that statement. Those other hypotheses are not eliminated merely by constructing $\mu$.

The distinction between descent and restriction matters. Restricting $\Psi$ directly to T gives $\mu^2$, not $\mu$. If the order m of $\Psi$ is odd and $2a\equiv1\pmod m$, one can instead write $\mu(u)=\Psi(u)^a$ for $u\in T(\mathbb A_F)$. The standard normalization $\mu^\sharp(z)=\mu(z/c(z))$ is also recorded in [Brooks–Petrow, *Counting automorphic forms on norm one tori*, Section 2.3](https://arxiv.org/pdf/1606.05367). This construction is standard torus theory, not a new conjecture solution.

## 9. The first failed substitution is the polarization

Let $\varepsilon$ denote the l-adic cyclotomic character restricted to a CM field, and suppose $\psi$ is finite order, $\psi^c=\psi^{-1}$, and $e\ge1$. The archive's rational-Dirichlet three-dimensional diagonal has the shape

```math
A_{\psi,e}
 =(\varepsilon^e\psi)\oplus 1
  \oplus(\varepsilon^{-e}\psi^{-1}).
```

A rational Dirichlet character restricted from $G_{\mathbb Q}$ is invariant under c. Consequently this diagonal is conjugate self-dual in that setting. For the anticyclotomic character now under consideration,

```math
A_{\psi,e}^{\,c}
 =(\varepsilon^e\psi^{-1})\oplus1
  \oplus(\varepsilon^{-e}\psi).
```

On the other hand $A_{\psi,e}^{\vee}\cong A_{\psi,e}$. Distinct powers of $\varepsilon$ remain distinct after multiplication by finite-order characters: restrict to the common finite-index subgroup killing those characters and use the infinite image of $\varepsilon$. Comparing the unique constituents with Tate exponent e therefore shows

```math
A_{\psi,e}^{\,c}\cong A_{\psi,e}^{\vee}
\quad\Longleftrightarrow\quad
\psi^2=1.
```

For a class character of order greater than two, the naive replacement does not even lie in the relevant polarized deformation problem. This is a mathematical obstruction, not a missing type annotation.

A corrected diagonal is

```math
B_{\psi,e}
 =(\varepsilon^e\psi)\oplus1
  \oplus(\varepsilon^{-e}\psi).
```

It satisfies $B_{\psi,e}^{c}\cong B_{\psi,e}^{\vee}$ and has determinant $\psi^2$. If geometric Frobenius has cyclotomic value $q^{-1}$ and $z=\psi(\operatorname{Frob}_w^{-1})$, its trace is

```math
T_{q,e}(z)=1+(q^e+q^{-e})z.
```

The archive's target is instead $\operatorname{eis3}(q,e,z)=1+q^{-e}z+q^ez^{-1}$, as defined in [CongruenceNumberRankThree.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/CongruenceNumberRankThree.lean). The two targets agree for quadratic z; they do not agree uniformly for characters of higher order.

Moreover [AdmissibleUnitaryThreePoint.lean, OneCharU](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/LinkedUnramifiedChains/WeightInfinitesimalCharacters/AdmissibleUnitaryThreePoint.lean) explicitly uses a Dirichlet character over $\mathbb Q$, its cyclotomic twist, and the diagonal trace $\chi+1+\chi^{-1}$. The apparently arbitrary field K in PropGK does not enlarge this scope: [Counts.lean, GD](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean) requires K to be imaginary quadratic. The proof of [PropGKU](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/LinkedUnramifiedChains/WeightInfinitesimalCharacters/PropGKU.lean) makes all other K cases vacuous.

## 10. The corrected trace still has the required congruence bound

The polarization correction does not destroy the counting-and-product estimate. The following lemma carries that part of the argument through completely.

### Corrected-trace product lemma

Let $q\ge7$ and $e\ge1$ be integers. Let S be a finite set with complex numbers $t_s$, such that:

- every automorphism of $\mathbb C$ permutes the indexed family $(t_s)_{s\in S}$;
- $|t_s|\le3$ for every s;
- $q^e t_s$ is an algebraic integer for every s.

Let O be a finite set carrying a family $z_o$ of roots of unity, again permuted as an indexed family by every automorphism of $\mathbb C$. The values need not be distinct. Put $Q=q^e$ and define

```math
T_o=1+(Q+Q^{-1})z_o,\qquad
F_{o,s}=Q(t_s-T_o)
       =Qt_s-Q-(Q^2+1)z_o.
```

Then

```math
M:=\prod_{o\in O}\prod_{s\in S}F_{o,s}
 \in\mathbb Z\setminus\{0\},
\qquad
\log|M|
 \le |O|\,|S|\,(2e\log q+1).
```

If $\ell\nmid q$, every embedding of the algebraic numbers into $\overline{\mathbb Q}_\ell$, and every collection of injections $j_o:I_o\hookrightarrow S$, satisfy

```math
\sum_{o\in O}\sum_{i\in I_o}
 v_\ell(t_{j_o(i)}-T_o)\ \le\ v_\ell(M),
```

where $v_\ell(\ell)=1$. Equivalently, the l-adic absolute value of M is at most the product of the selected trace-difference absolute values.

**Proof.** First,

```math
|T_o|\ge Q+Q^{-1}-1>3.
```

Thus $t_s\ne T_o$ and each $F_{o,s}$ is nonzero. Each is an algebraic integer because $Qt_s$ is integral and $z_o$ is a root of unity. Also,

```math
|F_{o,s}|
 \le Q|t_s|+Q+(Q^2+1)|z_o|
 \le Q^2+4Q+1
 \le2Q^2.
```

The last inequality holds for $Q\ge7$. Hence
$\log|F_{o,s}|\le2e\log q+\log2\le2e\log q+1$.

Every complex automorphism permutes the product factors, since it fixes the integers Q and $Q^2+1$ and permutes the two indexed families. The product is therefore a rational algebraic integer, hence an integer. It is nonzero because every factor is nonzero. Summing the factor bounds proves the logarithmic estimate.

Finally every algebraic integer $F_{o,s}$ has nonnegative l-adic valuation. Deleting factors from the full product can only decrease the sum of valuations. The injections ensure that the selected factors use each indexed pair at most once. Because $\ell\nmid q$, division by Q changes none of those valuations. This proves the last assertion. ∎

### Applying an actual archive estimate

The three hypotheses on S and $t_s$ are exactly the contents of [Classifies.lean, TrData](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/Classifies.lean). The archive's [tr3U](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/LinkedUnramifiedChains/WeightInfinitesimalCharacters/AdmissibleTwistInverseCyclotomic.lean), deduced from CountKU, states the following for every CM field K:

For suitable constants $c_K,A_K$, every $e,N\ge1$, and every prime w over a rational prime p with $p\nmid N\operatorname{disc}(K)$, there is such a trace family at $q=Nw$, with

```math
|S|\le c_K\,[N(e+1)]^{A_K}.
```

For every $\ell\ne2,p$, it classifies the inverse-Frobenius traces of all representations satisfying Adm3U with those parameters, and equal classifier indices imply isomorphic representations. Therefore a family of pairwise nonisomorphic admissible representations produces precisely the injections needed in the product lemma.

Take O to be the embeddings of the value field of a finite-order Hecke character $\psi$ into $\mathbb C$, and $z_o=o(\psi(\operatorname{Frob}_w^{-1}))$. If $\psi$ has order m, then $|O|\le\varphi(m)$. This is a valid Galois-stable indexed orbit even when different embeddings give the same value at w. The corrected-trace lemma yields a nonzero integer M, independent of l, with

```math
\log|M|
 \le c_K\varphi(m)[N(e+1)]^{A_K}
       (2e\log(Nw)+1).
```

As $Nw=p^f$ with $f\le[K:\mathbb Q]$, enlarging the constant and exponent gives

```math
\log|M|
 \le C_K\varphi(m)[N(e+1)]^{A_K+1}\log p.
```

It bounds the sum of valuations of all selected corrected-trace congruences for all $\ell\ne2,p$. This works for the auxiliary degree-eight CM field E as well as for an imaginary quadratic base. No Dirichlet-character assumption was used in this product argument.

The proof is an adaptation of the archive's [FrobeniusTraceNormNonzeroLogBound.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/BuildingsResidueChars/FrobeniusTraceNormNonzeroLogBound.lean), with its elementary trace-difference estimate replaced by the displayed calculation. This is a proved transfer lemma relative to the accepted archive counting input, not an assertion that the original theorem already has the corrected target.

### What this estimate does not supply

It bounds congruences of admissible representations **once those representations exist**. It does not construct admissible points from a twisted Selmer class. The missing replacement for OneCharU must construct representations with corrected polarization and determinant, control their local levels, account for reducible two-plus-one-dimensional components, and compare Selmer lengths with their trace-congruence valuations. The existing rational-Dirichlet OneCharU does not state this.

Neither a positive-dimensional deformation space nor a finite count of automorphic representations alone gives the required length comparison. A proof must retain the actual extension class, establish the relevant automorphy/rigidity input, and prove the intersection-multiplicity bound. Until that is done, the product lemma gives no new bound for the required Hecke-character Selmer groups.

## 11. A precise analytic endpoint for the twisted route

For a nontrivial finite-order Hecke character $\psi$ of K, define

```math
\Psi_1(x,\psi)=
 \sum_{N\mathfrak a\le x}
  (x-N\mathfrak a)\Lambda_K(\mathfrak a)\psi(\mathfrak a),
```

with the usual convention that the character is zero on ideals not coprime to its conductor. A sufficient weighted Chebyshev theorem for the route is:

> For every such $\psi$ and every $\delta>0$, there is $C_{\psi,\delta}$ such that $|\Psi_1(x,\psi)|\le C_{\psi,\delta}x^{3/2+\delta}$ for all $x\ge2$.

This assertion remains unproved here. Its analytic implication is elementary and exact. For $\Re s>1$, absolute convergence gives

```math
-\frac{L'}{L}(s,\psi)
 =s(s+1)\int_1^\infty
       \Psi_1(x,\psi)x^{-s-2}\,dx.
```

Under the displayed estimate, the right side is holomorphic on $\Re s>1/2$: on any compact subset, choose $\delta$ smaller than its distance from the line $\Re s=1/2$. Thus $L(s,\psi)$ has no zero to the right of that line, since a zero would give a pole of its logarithmic derivative. Applying the functional equation, with the same assertion for the conjugate character, places all nontrivial zeros on the critical line.

This identifies what a Hecke-character replacement for the archive's VWin-to-weighted-Chebyshev comparison must ultimately prove. The existing VWin is indexed by rational PChar and cyclotomic fixed fields. The corrected congruence lemma is one usable arithmetic ingredient; the twisted Selmer construction and the Hecke-character geometric/analytic comparison are still separate, unproved steps. No implication from Dirichlet GRH to this assertion has been assumed.


## 12. Central twisting does not recover the existing deformation theorem

For the corrected diagonal, write the ordered constituents as $r_+,r_0,r_-$, according to Tate exponents $e,0,-e$. Their ratio is

```math
\frac{r_+r_-}{r_0^2}=\psi^2.
```

A common character twist $\theta$ multiplies both numerator and denominator by $\theta^2$. The ratio is therefore invariant under central twisting. The archive's diagonal $(\chi,1,\chi^{-1})$ has ratio one. Consequently the corrected diagonal for $\psi^2\ne1$ cannot be turned into that diagonal by a central twist preserving the ordered weight pattern.

In particular, twisting by $\psi^{-1}$ gives

```math
\varepsilon^e\oplus\psi^{-1}\oplus\varepsilon^{-e},
\qquad \det=\psi^{-1}.
```

This removes the finite character from the outer constituents but puts it in the middle. If m is the order of $\psi$ and $3\nmid m$, one can choose $a$ with $3a\equiv-2\pmod m$ and twist by $\psi^a$ to make the determinant trivial. That operation still leaves the invariant ratio $\psi^2$. A determinant correction therefore does not repair the basepoint shape. Central twisting also leaves the adjoint representation and all ratios between constituents unchanged, so it cannot convert the desired twisted extension groups into the untwisted groups of the original diagonal.

The precise source is more permissive in one respect and less permissive in another. [GRepresents.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/GRepresents.lean) defines GLift using a prescribed residual representation and a subsequent generic condition GCond; GLift itself does not impose a fixed determinant. But that residual representation is specifically r0 of a single character on the whole Galois group. [RhoKApply.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/RhoKApply.lean) defines Dat, its local model, and its distinguished point using the cyclotomic twist of a rational Dirichlet character. The generic automorphic trace count does not impose this basepoint restriction; the arithmetic deformation construction does.

One further possible shortcut was tested. If $\psi$ has nontrivial l-power order, its reduction in characteristic l is trivial. The corrected diagonal then has the same residual diagonal as the trivial-character setup, so one might try to regard it as another characteristic-zero augmentation of the same generic deformation ring. However, when $\psi$ is an everywhere-unramified class character of the target imaginary quadratic K, class field theory forces $\ell\mid h_K$. This contradicts GD.l_cop, which requires $\ell\nmid |\operatorname{disc}(K)|h_K$, before the existing Dat/OneChar construction can be instantiated.

That class-number hypothesis is not cosmetic. In [PowEqOneOfUnr.lean, char_eq_one](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/PowEqOneOfUnr.lean), a continuous everywhere-unramified l-adic character congruent to one is forced to be trivial by combining its exponent dividing $h_K$ with $\ell\nmid h_K$. A nontrivial l-power ideal class character is exactly a counterexample if the latter hypothesis is deleted.

These statements exclude the attempted reuse of the existing arithmetic theorem. They do not exclude a new deformation argument with a different augmentation, extra finite unramified characters retained throughout, and a revised rigidity statement. The extension-sensitive part of that new construction is being investigated separately.


## 13. Deep character rigidity without class-number coprimality

This section proves a replacement for one characteristic-zero rigidity step. It does not prove that a Selmer tangent direction lifts to a characteristic-zero point.

The exact archived use is the theorem **UpperTheory.V.U3.pt_fixed** in [UnitaryThreeGroups/RootOfCharpoly.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/RootOfCharpoly.lean). After imposing both Upper and Lower, the proof obtains diagonal characters a_i. It proves:

- hred: each quotient a_i/t^(wt_i) is congruent to 1 modulo the maximal ideal, for every Galois element;
- hine: each quotient is trivial on every finite inertia group;
- hall: each quotient is exactly 1, by invoking char_eq_one.

The class-number-coprime assumption enters the last item. The preceding local conclusions instead imply, without that assumption, that the quotients are finite unramified class characters of ell-power order. The finiteness is the Hilbert class field theorem; see [Milne, Class Field Theory, chapter V](https://www.jmilne.org/math/CourseNotes/CFT.pdf). The argument below controls them by congruence depth.

### 13.1 Exact torsion threshold

Let v_ell be normalized by v_ell(ell)=1 on an algebraic closure of Q_ell. If zeta is a nontrivial root of unity and v_ell(zeta-1)>0, then zeta has ell-power order. If its order is ell^r, r>=1, then

~~~math
v_\ell(\zeta-1)=\frac1{\ell^{r-1}(\ell-1)}
\le\frac1{\ell-1}.
\tag{13.1}
~~~

To prove the first claim, a root of unity of order d prime to ell cannot be congruent to 1: the geometric sum 1+zeta+...+zeta^(d-1) would be congruent to the unit d although it is zero. Raising a root of mixed order to its ell-primary exponent reduces to this case.

For the second claim, Phi_(ell^r)(1)=ell. All primitive ell^r-th roots have the same valuation of 1-zeta, since the ell-adic valuation is invariant under their conjugations. There are ell^(r-1)(ell-1) such roots. Taking valuations in the cyclotomic product gives (13.1).

It follows that any finite character kappa satisfying

~~~math
v_\ell(\kappa(g)-1)>\frac1{\ell-1}
\quad\hbox{for every }g
~~~

is trivial. This bound is independent of the size and exponent of the class group.

More generally, two finite characters whose quotient is everywhere congruent to 1 and whose differences have valuation greater than 1/(ell-1) at every group element are equal. Their values are units, so differences and quotient-minus-one have the same valuation.

In a coefficient DVR O with uniformizer pi and ramification index e_O=v_pi(ell), congruence modulo pi^n is sufficient when

~~~math
n>\frac{e_O}{\ell-1}.
\tag{13.2}
~~~

The ramification factor must not be omitted when ordinary O-lengths are used. It disappears only after normalizing by e_O.

### 13.2 Recovering individual characters from traces

Let ell>=5. Let O be a finite extension DVR of Z_ell with fraction field E. Let Gamma be any group and let

~~~math
r=\operatorname{diag}(a_1,a_2,a_3),\qquad
r_*=\operatorname{diag}(b_1,b_2,b_3)
~~~

be sums of O-valued unit characters. Assume:

1. a_i/b_i is a finite character congruent to 1 modulo pi, for each i;
2. there is g_0 in Gamma for which the three residues b_i(g_0) are pairwise distinct;
3. tr r(g) and tr r_*(g) agree modulo pi^n for every g in Gamma.

Then a_i(g) and b_i(g) agree modulo pi^n for every i and every g.

**Proof.** The trace hypothesis at g_0, g_0^2, and g_0^3 says the first three power sums of the two triples of eigenvalues agree modulo pi^n. Newton's identities have denominators only 2 and 6 in rank three. These are units because ell>=5. The two characteristic polynomials at g_0 therefore agree modulo pi^n.

For alpha_i=a_i(g_0) and beta_i=b_i(g_0), evaluate the target characteristic polynomial at alpha_i. The result is divisible by pi^n. Its factors alpha_i-beta_j for j different from i are units, by assumptions 1 and 2. Hence alpha_i-beta_i is divisible by pi^n.

For arbitrary h, use the trace hypothesis at g_0^k h for k=0,1,2. Since these are characters,

~~~math
\sum_{i=1}^3\beta_i^k(a_i(h)-b_i(h))
\equiv0\pmod{\pi^n},
\qquad k=0,1,2.
~~~

The Vandermonde determinant is the product of the unit differences beta_j-beta_i. Its matrix is invertible over O. Thus every a_i(h)-b_i(h) is divisible by pi^n. This proves the claim.

Combining this with (13.2) gives a characteristic-zero rigidity theorem:

> Under assumptions 1–3, if n>e_O/(ell-1), then r=r_*.

The finite-character assumption is essential. An arbitrary infinite ell-adic character can be nontrivial and arbitrarily close to 1.

### 13.3 Application to the corrected Hecke triple

For the corrected target

~~~math
r_*=\varepsilon^e\psi\ \oplus\ 1\ \oplus\ \varepsilon^{-e}\psi,
~~~

a completely reducible point with the same prescribed local character types differs from r_* by unramified finite class characters. If these ratios reduce to 1, the lemma applies whenever the residual target characters are separated at one element.

In the same-residual situation psi is ell-power and therefore reduces to 1. If the residual cyclotomic character on the relevant Galois group has full image, the condition ell-1 not dividing 2e provides an element for which epsilon^e,1,epsilon^(-e) are pairwise distinct. This is an explicit hypothesis on the Galois group; it must be checked after changing the base field. In the archived imaginary-quadratic setup, the corresponding local separation is supplied in dat_facts and used in RootOfCharpoly.lean. For a larger CM host it is not automatic.

The condition ell-1 not dividing 2e also excludes ell=2 and ell=3, so the use of Newton's identities above is compatible with that condition.

This replaces class-number coprimality by a stronger congruence-depth hypothesis. It proves that nontrivial class-character alternatives cannot remain arbitrarily deep in the canonical point's congruence neighborhood.

The archive's IsPt hypothesis supplies only reduction modulo the maximal ideal, not the stronger depth in (13.2). Consequently the lemma cannot simply be substituted into pt_fixed without another argument. In addition, congruence at a few selected counting primes is insufficient: the trace extraction needs all g_0^k h. Congruence on every Frobenius outside a fixed finite set suffices, by density and continuity.

## 14. The finite algebra of reducible class-character points

The residual class-character directions can be described integrally. This gives a finite-flat statement for the abelian part of the deformation problem and records the torsion that disappears in characteristic zero. It does not assert finite flatness of the full nonabelian deformation ring.

### 14.1 Polarized labels over a CM field

Let E_0 be a CM field with complex conjugation c. Fix an odd prime ell and let C=Cl(E_0)(ell), written additively. Conjugation acts on C. Put

~~~math
C^- = C/(1+c)C.
~~~

The unramified ell-power characters kappa with kappa^c=kappa^(-1) are precisely the characters of C^-.

Consider a sum of three characters with distinct cyclotomic weights e,0,-e and unramified ell-power finite parts:

~~~math
\varepsilon^e\kappa_+\ \oplus\
\kappa_0\ \oplus\
\varepsilon^{-e}\kappa_-.
~~~

Conjugate self-duality forces

~~~math
\kappa_-=(\kappa_+^c)^{-1},
\qquad
\kappa_0^c=\kappa_0^{-1}.
\tag{14.1}
~~~

This follows by matching the distinct Tate weights in r^c and r^vee. Conversely, these identities give conjugate self-duality.

Thus the unramified finite labels consist of one arbitrary character of C and one character of C^-. In particular they are parametrized by the character group of

~~~math
G=C\times C^-.
~~~

For an imaginary quadratic field K, conjugation acts as inversion on Cl(K): the ideal product a*c(a) is the principal norm ideal. Hence C^-=C and (14.1) becomes

~~~math
\varepsilon^e\kappa_{\rm out}\ \oplus\
\kappa_{\rm mid}\ \oplus\
\varepsilon^{-e}\kappa_{\rm out}.
\tag{14.2}
~~~

There are two class-character labels, not one. Multiplying every constituent by a single central character does not exhaust them; the ratio of the outer product to the square of the middle character records the distinction.

This describes the restriction to the CM Galois group. Every displayed triple admits the usual conjugate-dual extension using the fixed complex-conjugation element in the unitary semidirect product. No uniqueness claim for all possible global polarized extensions is needed here.

### 14.2 Integral representability and finite flatness

Let O be a complete coefficient DVR of residue characteristic ell. The functor of unramified characters of G_E0 which reduce to 1 is represented by O[C]. For the two labels in (14.1), the representing algebra is

~~~math
A=\mathcal O[G].
\tag{14.3}
~~~

Indeed, a local O-algebra map from O[G] to an Artinian local O-algebra R is exactly a group homomorphism G to R^times. Since G is an ell-group, every such character reduces to the trivial character in the residue field. Conversely every required pair of characters defines that algebra map.

The ring A is finite free over O of rank |G|. It is local and complete. To see locality, write G as a product of cyclic groups of orders ell^(a_j). Then

~~~math
A/\pi A
\simeq k[T_1,\ldots,T_d]/
(T_1^{\ell^{a_1}},\ldots,T_d^{\ell^{a_d}}),
~~~

where T_j denotes a generator minus 1. This ring has the unique maximal ideal generated by the T_j. Finite O-modules are complete; the maximal-ideal and pi-adic topologies on A are equivalent.

This is a genuine finite-flat character deformation algebra. Its special fiber is generally nonreduced and nonsemisimple. Those facts are compatible with finite flatness.

### 14.3 Exact cotangent torsion

Let I be the augmentation ideal of A. The map g to [g]-1 identifies

~~~math
I/I^2\simeq G\otimes_{\mathbb Z}\mathcal O.
\tag{14.4}
~~~

For a presentation G=direct sum Z/ell^(a_j)Z, the group relation (1+T_j)^(ell^(a_j))=1 becomes ell^(a_j)T_j=0 modulo I^2, and there are no additional linear relations. Therefore

~~~math
\operatorname{length}_{\mathcal O}(I/I^2)
=v_\pi(|G|).
\tag{14.5}
~~~

At any O-valued character point, twisting the group basis by that character carries its kernel to I, so its cotangent length is the same.

For an imaginary quadratic field this length is exactly 2*v_pi(|Cl(K)(ell)|). It cannot be discarded. In particular, the presence of a nonzero residual tangent space is compatible with a finite algebra whose characteristic-zero points are all reducible character points.

This illustrates why a Selmer tangent direction alone does not establish a nonabelian characteristic-zero lift.

### 14.4 Character separation and its integral cost

Enlarge O finitely so that it contains the values of all characters of G. The Fourier evaluation map embeds A into

~~~math
B=\prod_{\chi\in\widehat G}\mathcal O.
~~~

After passing to the fraction field it is an isomorphism. The character idempotents are

~~~math
e_\chi=\frac1{|G|}\sum_{g\in G}\chi(g)^{-1}[g].
~~~

Since |G|e_chi lies in A, the quotient B/A is annihilated by |G|. Its O-length is exactly

~~~math
\operatorname{length}_{\mathcal O}(B/A)
=\frac{|G|}{2}\,v_\pi(|G|).
\tag{14.6}
~~~

For completeness, the character matrix F=(chi(g)) has F^t F=|G|P, where P permutes each group element with its inverse. Thus 2*v_pi(det F)=|G|*v_pi(|G|), which is the index length in (14.6).

For any O-free A-module M of rank r, let M_chi=M intersect e_chi(M tensor E). Then

~~~math
|G|M\subseteq\bigoplus_\chi M_\chi\subseteq M.
~~~

The integral failure of the character decomposition is consequently killed by |G| and has length at most r*v_pi(|G|). This statement concerns an O-lattice; it does not turn a general finite torsion Selmer module into a direct sum of character eigenspaces.

If the CM base is fixed, the cost is a fixed field-dependent constant. If its class group is itself varying in the quantity to be bounded, treating that cost as harmless would be circular. No such absorption is claimed here.

### 14.5 Remaining lifting obligation

Sections 13 and 14 prove three specific facts: the reducible class-character alternatives form a finite-flat abelian algebra; its integral cotangent and splitting losses are explicit; and distinct finite-character alternatives have a class-number-independent bound on pointwise congruence depth.

They do not establish that the full twisted Selmer deformation ring is O-flat, that every needed extension survives in characteristic zero, or that every resulting nonabelian point is automorphic with the required level. Those are the remaining obligations for a twisted OneChar theorem. The source's unrestricted residual neighborhood still contains all the class-character points in (14.1); only a deeper neighborhood isolates the prescribed one.


## 15. The same depth bound controls Type II character ambiguities

The source has another use of class-number coprimality. In [UnitaryThreeGroups/CoboundaryLemmaNoColumn.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/CoboundaryLemmaNoColumn.lean), **typeII_facts** invokes char_eq_one first for the middle character and then for the total determinant. It obtains middle character 1 and corner determinant 1; the latter is the input to W_facts, which descends the corner to an odd rank-two representation over Q.

Section 13's diagonal argument extends to the middle and determinant of a genuine rank-two-plus-rank-one point.

### 15.1 Spectral-projector lemma

Let ell>=5, let O be a complete DVR, and suppose rho is an integral rank-three representation whose characteristic-zero representation is the direct sum of a character kappa and a two-dimensional representation W. Let

~~~math
\rho_* = b_+\oplus b_0\oplus b_-
~~~

be the prescribed diagonal reference. Assume:

- there is g_0 for which the three reference eigenvalues have pairwise distinct residues;
- kappa has the residual middle character b_0;
- tr rho(g) agrees with tr rho_*(g) modulo pi^n for every g.

Then kappa agrees with b_0 modulo pi^n at every g, and det rho agrees with det rho_* modulo pi^n at every g.

To prove the middle assertion, apply Newton's identities at g_0 exactly as in section 13. The characteristic polynomial has three distinct simple residual roots, so Hensel's lemma gives roots alpha_+,alpha_0,alpha_- in O matching the reference roots beta_+,beta_0,beta_- modulo pi^n. The middle root is kappa(g_0). Define

~~~math
P_0(X)=
\frac{(X-\alpha_+)(X-\alpha_-)}
 {(\alpha_0-\alpha_+)(\alpha_0-\alpha_-)}.
~~~

Its coefficients lie in O, and they agree modulo pi^n with the corresponding reference polynomial. The operator P_0(rho(g_0)) is the identity on the kappa summand and zero on W. This remains true when W is irreducible: its two eigenvalues at g_0 are the other two roots.

For each h,

~~~math
\kappa(h)
=\operatorname{tr}\big(P_0(\rho(g_0))\rho(h)\big).
~~~

Expand the degree-two polynomial. The all-element trace congruence at g_0^j h, j=0,1,2, then gives kappa(h) congruent to b_0(h). For the determinant assertion, apply Newton's identities to the traces at h,h^2,h^3.

If kappa/b_0 and det rho/det rho_* are finite characters, the torsion threshold of section 13 therefore gives

~~~math
\kappa=b_0,\qquad \det\rho=\det\rho_*
\quad\hbox{whenever}\quad n>e_{\mathcal O}/(\ell-1).
\tag{15.1}
~~~

This controls both character ambiguities in typeII_facts under the stronger depth hypothesis. It does not require W to split into characters.

For the corrected target, b_0=1 and det rho_*=psi^2. Thus (15.1) gives middle character 1 and corner determinant psi^2. It does not make the corner determinant 1 before twisting.

As before, the needed all-element depth is not an existing consequence of IsPt, and a finite list of counting-prime congruences is not enough. The lemma is a proved conditional replacement, not a claim that the original theorem can already be instantiated with a Hecke character.

## 16. The corner descends after twisting, but the cohomology retains a dihedral factor

There is no abstract descent obstruction for the determinant-one corner. The matrix calculation is explicit.

Let K be imaginary quadratic, H=G_K, Gamma=G_Q, and choose complex conjugation c of order two. Put

~~~math
J_s=\begin{pmatrix}0&1\\1&0\end{pmatrix},
\qquad
J_a=\begin{pmatrix}0&1\\-1&0\end{pmatrix},
\qquad
D=J_sJ_a=\begin{pmatrix}-1&0\\0&1\end{pmatrix}.
~~~

Suppose the corner representation W:H to GL_2(E) satisfies the literal unitary relation

~~~math
W(chc)=J_s W(h)^{-t}J_s.
\tag{16.1}
~~~

Let xi be a finite anti-cyclotomic character with det W=xi^2, and define V=W tensor xi^(-1). Then det V=1 and (16.1) is preserved by the twist, because xi(chc)=xi(h)^(-1).

For a determinant-one two-by-two matrix A,

~~~math
A^{-t}=J_a A J_a^{-1}.
~~~

Consequently

~~~math
V(chc)=D V(h)D,\qquad D^2=1.
~~~

This supplies a continuous extension to Gamma by setting V(c)=D. Its determinant is the quadratic character of K/Q, and it is odd because det D=-1. No choice of square root of an intertwining scalar is required.

For ell-primary class characters and ell odd, every such determinant character has a unique ell-primary square root xi: multiplication by two is an automorphism of the finite ell-primary character group. Over an imaginary quadratic field all unramified class characters are anti-cyclotomic. Thus retaining finite class determinants still permits this corner descent.

The extension-sensitive coefficient module does not become untwisted. If kappa is the middle character, then

~~~math
\operatorname{Hom}(\kappa,W)
=V|_H\otimes\nu,\qquad \nu=\xi/\kappa.
\tag{16.2}
~~~

Shapiro's lemma and the tensor identity give

~~~math
H^1(H,V|_H\otimes\nu)
\simeq
H^1\!\left(\Gamma,
 V\otimes\operatorname{Ind}_H^\Gamma\nu\right).
\tag{16.3}
~~~

The same identification respects the corresponding induced local conditions when those are transported under the local Shapiro maps. Equation (16.3) has rank four when V has rank two.

An anti-cyclotomic character nu can extend as a one-dimensional character of Gamma only if nu^c=nu. Combining this with nu^c=nu^(-1) forces nu^2=1. For odd-order nu this forces nu=1. If nu has order greater than two, Ind_H^Gamma nu is irreducible: its restriction to H is the sum of the two distinct characters nu and nu^(-1), which complex conjugation exchanges.

For the corrected target the middle character is 1 and the corner determinant is psi^2, so xi=psi and nu=psi. The nontrivial anti-cyclotomic character therefore survives precisely in the induced two-dimensional factor in (16.3).

The generic-looking vanishing input in [UnitaryThreeGroups/KatoUse.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/KatoUse.lean) treats a rank-two representation over Q and finite one-dimensional characters of G_Q. The rank-four dihedral tensor in (16.3) is not such an input. Descending the corner is therefore a real algebraic advance but does not, by itself, make the source's Kato application available for the twisted extension module.

The remaining arithmetic question can now be stated precisely: obtain the required strict Selmer vanishing, or a quantitatively adequate replacement, for V tensor Ind_K^Q nu with nu an arbitrary finite anti-cyclotomic class character. Invoking the rank-two rational-character Kato theorem without addressing this factor would lose the character being studied.


## 17. A structural obstruction to the usual Rankin Euler-system theorem

The rank-four module in section 16 does not satisfy a necessary hypothesis of the most immediate Rankin--Selberg Selmer-vanishing theorem. This failure is exact, not a missing large-image estimate.

Write eta_K for the quadratic character of K/Q and set
~~~math
A=\operatorname{Ind}_{G_K}^{G_{\mathbb Q}}\nu,
\qquad U=V\otimes A.
~~~
The preceding construction gives det V=eta_K. Since nu^c=nu^(-1), the induced representation A also has determinant eta_K: its restriction to G_K has determinant nu*nu^c=1, and complex conjugation interchanges the two induced basis vectors, with determinant -1. Hence
~~~math
\det V(g)\,\det A(g)=1
\qquad (g\in G_{\mathbb Q}).
\tag{17.1}
~~~

### 17.1 No element has a one-dimensional fixed quotient

We use the following elementary linear-algebra fact. If M,N are invertible two-by-two matrices over a characteristic-zero field and det M*det N=1, then ker(M tensor N-1) cannot have dimension one.

One may extend scalars to an algebraic closure. If either matrix is scalar, every eigenspace relevant to the tensor has even dimension. If one has a nontrivial Jordan block and the tensor has eigenvalue 1, the determinant identity forces the other matrix to have the reciprocal repeated eigenvalue. If both blocks are nontrivial, the tensor of the two unipotent Jordan blocks minus 1 has rank two. Otherwise both matrices have distinct eigenvalues. The four tensor eigenvalues come in two reciprocal pairs, so 1 cannot occur exactly once.

This is the obstruction recorded in Studnia, [*On obstructions to the Euler system method for Rankin-Selberg convolutions*](https://link.springer.com/article/10.1007/s40993-026-00718-1), Lemma 3.1, which credits the earlier observation to Loeffler. We are applying an existing lemma to the specific representation derived here.

Applying it to (17.1) shows
~~~math
\dim_E U/(g-1)U\ne1
\qquad\hbox{for every }g\in G_{\mathbb Q}.
\tag{17.2}
~~~
The dimensions of the kernel and cokernel of the square matrix g-1 agree. The argument includes nonsemisimple matrices; an eigenvalue-multiplicity argument alone would not cover those.

In particular there is no such element in the cyclotomic kernel G_Q(mu_(ell^infinity)). Dualizing does not change the dimension of the fixed quotient. A Tate twist is trivial on this cyclotomic kernel, so changing between the usual dual and Tate-twist conventions cannot repair (17.2).

### 17.2 Consequence for the proposed bridge

[Loeffler--Zerbes, *Rankin--Eisenstein classes in Coleman families*](https://link.springer.com/article/10.1186/s40687-016-0077-6), Theorem 8.2.1, requires an element tau in the cyclotomic kernel for which the relevant representation modulo tau-1 is one-dimensional. Under that and other hypotheses, a nonzero critical Rankin value gives Bloch--Kato Selmer vanishing. The representation U fails that explicit hypothesis at every coefficient prime.

When V is attached to a modular form f of weight 2e+1, its finite determinant is eta_K. The weight-one theta form associated to nu has the same nebentypus eta_K. Their product nebentypus is therefore trivial, which is the same obstruction expressed in modular-form language. This identification concerns the vanishing-theorem hypothesis; no unresolved choice of cohomological normalization affects its failure on the cyclotomic kernel.

There is a second, independent problem at the proposed critical twist: the reciprocity factor in that paper vanishes when the product nebentypus is trivial and j=(k+k')/2+1. The exact weight substitution and the applicability audit of later literature are recorded in [character-lifting.md](character-lifting.md). They do not supply a replacement vanishing theorem.

This does not disprove the desired Selmer vanishing or Hecke RH. It prevents this particular rank-one Euler-system argument from supplying them. A direct vanishing theorem over K, a suitable higher-rank Euler system, or another argument controlling the rank-four module would be additional mathematics. Neither the archive's rank-two rational-character Kato input nor the cited Rankin theorem already provides it.

### 17.3 Transfer status after this obstruction

The following parts have been proved in this note: construction of a CM host meeting the finite-place conditions; preservation and descent of finite class-character L-functions; a corrected conjugate-self-dual trace and its norm bound; finite-character rigidity at a uniform congruence depth; integral control of the reducible class-character algebra; and explicit descent of the Type II corner while retaining its extension module.

The accompanying [character-lifting.md](character-lifting.md) proves the lower-triangular splitting replacement needed for the weaker point condition M3. That removes one use of the unique-diagonal-point argument.

The remaining extension-sensitive input is still a Selmer statement for U=V tensor Ind_K^Q nu, together with the quantitative and integral compatibility needed by the twisted OneChar argument. No full Artin primitive-root conjecture, Hecke GRH, or nonabelian GRH is claimed. The present route is paused at this exact obligation rather than treating the failed Euler-system hypothesis as a technicality.
