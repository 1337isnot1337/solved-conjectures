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
