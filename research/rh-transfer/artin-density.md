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
