# Artin's primitive-root conjecture

CM character preservation and conditional zero-free descent, 20 November 2026. Related notes: [artin-density.md](artin-density.md) and [adjoint-transfer.md](adjoint-transfer.md). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

The field-theory statements below are proved here from standard facts. No novelty claim is made. The analytic descent is conditional on an explicitly stated Hecke zero-free input. That input is separate from the RH/Dirichlet-GRH archive accepted for this campaign, and this note does not verify its arithmetic proof.

## 1. Characters survive every CM enlargement

Let K be an imaginary quadratic field, let c be a complex conjugation, and let

~~~math
\nu:G_K\longrightarrow\overline{\mathbb Q}_\ell^\times
~~~

be a finite-order character satisfying nu^c=nu^(-1). Suppose its order m is odd. Let F be any CM number field containing K.

Then the restriction nu|G_F has the same order m. Equivalently, the Hecke character nu composed with the idelic norm from F to K has order m.

In particular, there is no requirement that [F:K] be coprime to m.

### Proof

Let L be the field cut out by nu over K. The kernel of nu is stable under c, so L/Q is Galois. Complex conjugation has order two and acts by inversion on the cyclic group Gal(L/K). Consequently

~~~math
\mathop{\mathrm{Gal}}(L/\mathbb Q)
\simeq C_m\rtimes C_2.
\tag{1.1}
~~~

Set M=L intersect F. Since M contains K and Gal(L/K) is cyclic, the subgroup Gal(L/M) is invariant under inversion. Thus M/Q is Galois, and its group has the same dihedral form with a cyclic subgroup of order d=[M:K] dividing m.

Every subfield of a CM field is either totally real or CM. For clarity, this fact follows by taking a Galois closure N of F. The identity between conjugating an embedding and composing it with the CM involution shows that complex conjugation is central in Gal(N/Q). It therefore preserves every subfield. Its fixed subfields are totally real; on the other subfields it defines a totally imaginary quadratic extension of a totally real field.

The field M contains the imaginary quadratic K, so M is CM. Because it is also Galois over Q, its complex conjugation is central. In the dihedral description, centrality says inversion is trivial on C_d. Thus d divides two. Since d divides the odd integer m, d=1 and M=K.

The Galois extension L/K is therefore linearly disjoint from F/K. Restriction of G_F onto Gal(L/K) is surjective, proving that nu|G_F has order m. Compatibility of Artin reciprocity with norms identifies the restricted character with the Hecke norm pullback.

### Even-order boundary

The same argument without the odd-order assumption gives

~~~math
[L\cap F:K]\mid\gcd(m,2).
~~~

Thus a finite anti-cyclotomic character can lose at most a quadratic factor under CM enlargement. Its odd-order part is always preserved. This statement depends on F being CM; a general totally imaginary extension need not have the subfield property used above.

## 2. Consequence for imaginary-quadratic class groups

Every class character of an imaginary quadratic K is anti-cyclotomic. Indeed, an ideal and its conjugate multiply to a principal norm ideal.

If nu is unramified at all finite places of K, its restriction is unramified at all finite places of F: a local inertia group of F maps into the corresponding inertia group of K. Thus an odd-order class character pulls back to a class character of F of exactly the same order.

Dualizing this statement gives a norm-surjectivity consequence:

~~~math
\mathop{\mathrm{Cl}}(F)\longrightarrow\mathop{\mathrm{Cl}}(K)
\quad\hbox{has cokernel of 2-power order}.
\tag{2.1}
~~~

If the cokernel had a nontrivial odd-order character, it would give an odd class character of K trivial on all norms, contradicting section 1. Equivalently, the norm map on the odd-primary parts is surjective. In particular, the odd part of the class number of K divides the odd part of the class number of F.

This improves the degree-coprimality check previously used for the auxiliary multiquadratic host: a later CM enlargement, including one whose degree shares primes with the character order, still preserves the odd character.

## 3. Cyclotomic hosts

For an imaginary quadratic field of discriminant D, choose

~~~math
F=\mathbb Q(\zeta_M),\qquad
M=\mathop{\mathrm{lcm}}(12,|D|).
~~~

Then F contains K and the twelfth roots of unity. It is CM and F/K is abelian. Section 1 shows that every nontrivial odd-order anti-cyclotomic character remains nontrivial on F; section 2 preserves its unramified class-character condition when present.

This is only a field and character construction. It does not itself change the real parts of zeros or supply an analytic estimate.

## 4. Explicit analytic input

For a fixed number delta with 0<delta<1/2, consider the following input:

> H_delta: For every cyclotomic field F containing the twelfth roots of unity and every finite-order Hecke character eta of F, L_F(s,eta) has no zeros in Re(s)>1−delta. The trivial character is included, and its simple pole at s=1 is allowed.

The following deduction needs only this formulation. It does not assume that the input has been established.

The arithmetic worker has identified a separate source claiming such a theorem with delta=10^(-6): [the introduction, Theorem 1.2, label thm:hecke-zero-free, in entry 029, *Primitive roots for every admissible integer base*, October 4, 2026](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Primitive-roots-for-every-admissible-integer-base-October-4-2026/build/sections/01-introduction.tex). The source is pinned to openai/math commit 4eaee87548250b2682affda7d05d947c05554bae. The statement explicitly includes the trivial character. The arithmetic worker traced the Mellin deduction at the end of section 06-zero-free, but the full preceding theta estimate has not been audited. This is not a theorem extracted from the user-accepted riemann-hypothesis-solved archive, and this note does not silently add it to the accepted premises.

## 5. Conditional descent theorem

Assume H_delta. Then for every imaginary quadratic K and every nontrivial finite-order anti-cyclotomic character nu of odd order,

~~~math
L_K(s,\nu)\ne0
\qquad\hbox{if}\qquad
\mathop{\mathrm{Re}}(s)>1-\delta.
\tag{5.1}
~~~

The width delta is independent of K and nu.

### Proof

Choose F as in section 3 and let nu_F be the norm pullback. It is nontrivial by section 1, so H_delta applies to L_F(s,nu_F).

Let X be the character group of Gal(F/K), viewed as finite Hecke characters of K. Artin formalism, or the tensor identity for induction, gives the exact factorization

~~~math
L_F(s,\nu_F)=
\prod_{\xi\in X}L_K(s,\nu\xi).
\tag{5.2}
~~~

Every factor is entire. If nu*xi were trivial for some xi, restriction to G_F would make nu_F trivial, contrary to section 1. There is therefore no trivial-character pole and no possibility of pole cancellation.

The factor with xi=1 is L_K(s,nu). A zero of that factor in the specified half-plane would be a zero of the product (5.2), contradicting H_delta. This proves (5.1).

The same conclusion applies to the dihedral Artin representation induced from nu because

~~~math
L_{\mathbb Q}\!\left(s,\mathop{\mathrm{Ind}}_{G_K}^{G_{\mathbb Q}}\nu\right)
=L_K(s,\nu).
~~~

This is a whole character-family deduction conditional on H_delta. It is not a proof of dihedral GRH.

## 5.1 General abelian base fields

Because H_delta includes trivial characters, its formal consequence is broader than the odd-character case.

Assume H_delta. Let K/Q be any finite abelian extension and let nu be any finite-order Hecke character of K. Then L_K(s,nu) has no zeros in Re(s)>1−delta, with the pole at s=1 allowed when nu is trivial.

Choose a cyclotomic field F containing K and the twelfth roots of unity. It exists by Kronecker–Weber, and F/K is abelian. Apply H_delta to the finite norm pullback nu_F, whether or not that character is trivial. The factorization (5.2) remains valid.

Every factor on the right has no poles except possibly a simple pole at s=1 for a trivial character. Therefore a zero of L_K(s,nu) at any other point of the stated half-plane would force a zero of the left side. There is no cancellation there.

At s=1, a nontrivial finite-order Hecke character has a nonzero L-value. One standard proof uses the cyclic extension cut out by the character: the quotient of its Dedekind zeta function by zeta_K is the product of the nontrivial character L-functions. The quotient has a finite nonzero value at 1 by the simple-pole residue formulas; all its factors are holomorphic there, so each factor is nonzero. When nu is trivial, zeta_K has a pole rather than a zero.

Thus the common strip descends to every finite-order Hecke L-function over an abelian base field. No preservation of character order is required for this broader zero-free conclusion. Sections 1–2 supply that additional preservation for the odd anti-cyclotomic family, including unramified class characters.

By induction of Artin L-functions, the same conditional strip applies to finite-image representations induced from one-dimensional characters over such abelian base fields. This remains a fixed-width zero-free statement.

## 6. What this does and does not provide

The order-preservation lemma removes a field-enlargement obstruction for the odd anti-cyclotomic family. The factorization descends a common zero-free half-plane from cyclotomic hosts to finite-order Hecke characters over every abelian base field, provided the external H_delta input is available.

The factorization preserves zeros at their original complex arguments. It provides no mechanism for moving a zero toward the line Re(s)=1. Consequently a fixed-width zero-free result does not become RH by this descent.

If an analytic bootstrap from that width to the critical line is sought, it must be proved for this Hecke-character family. A bootstrap stated only for Dirichlet characters over Q cannot be substituted without checking its hypotheses. The irreducible-adjoint route examined in adjoint-transfer.md is separately blocked in the non-CM SL2-monodromy case.
