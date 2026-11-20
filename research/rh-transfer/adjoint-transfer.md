# Artin's primitive-root conjecture

Adjoint-transfer audit, 20 November 2026. Related work: [artin-density.md](artin-density.md), §§16–17, and [character-lifting.md](character-lifting.md). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

Status: this does not prove the named conjecture or the missing Hecke-character Selmer vanishing. It proves an obstruction to the proposed adjoint embedding in the non-CM case, and identifies exactly what the natural reducible host would require. No Lean verification was performed.

## 1. Exact coefficient module

Let K be an imaginary quadratic field, eta its quadratic character over Q, and c a complex conjugation. Let V be the descended two-dimensional representation from artin-density.md, §16. In particular,

~~~math
\det V=\eta,\qquad
V(c)=D=\begin{pmatrix}-1&0\\0&1\end{pmatrix}.
~~~

Let nu be a finite-order anti-cyclotomic character of G_K, so nu^c=nu^(-1), and define

~~~math
A=\operatorname{Ind}_{G_K}^{G_{\mathbb Q}}\nu,\qquad
U=V\otimes A,\qquad
W=V|_{G_K}\otimes\nu.
~~~

The required coefficient has rank four over Q. Shapiro identifies its cohomology with that of W over K. The Bloch–Kato local conditions are compatible with the corresponding local induction maps.

The proposed bypass is to realize U as a direct summand of an adjoint representation for which an existing automorphic Selmer-vanishing theorem applies. A direct-summand inclusion would indeed give an inclusion of Selmer groups: the defining global and local cohomology maps respect finite direct sums.

The conclusion below assumes the non-CM monodromy condition

~~~math
G_V^\circ=\mathrm{SL}_2,
\tag{1.1}
~~~

in the determinant-finite normalization being used here. For a normalized non-CM modular representation of weight 2e+1, e>0, this is the usual monodromy conclusion. Newton–Thorne, Example 2.29, gives an explicit argument that the image contains SL2 when the symmetric-square automorphic representation is cuspidal. The finite determinant then gives (1.1). The CM/dihedral case is excluded from the obstruction's scope.

## 2. What the available adjoint theorems actually say

These hypotheses are retained rather than inferred from the word “automorphic.”

| Primary theorem | Hypotheses relevant here | Vanishing supplied |
|---|---|---|
| [Allen, *Deformations of polarized automorphic Galois representations and adjoint Selmer groups* (2016)](https://arxiv.org/pdf/1411.7661), Theorem A | An absolutely irreducible odd polarized representation; p>2; an actual CM extension L/F where it is attached to a regular algebraic polarizable cuspidal representation; zeta_p not in L; adequate residual image over L(zeta_p). | The geometric adjoint Selmer group over F+, with the polarized extension of the adjoint. |
| [Newton–Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type* (2023)](https://ems.press/content/serial-article-files/32858?nt=1), Theorem A | F CM; a regular algebraic cuspidal representation of unitary type; enormous characteristic-zero image on the cyclotomic kernel. | H¹_f(F+,ad_pol r)=0. |
| [Thorne, *On the vanishing of adjoint Bloch–Kato Selmer groups of irreducible automorphic Galois representations* (2022)](https://arxiv.org/pdf/2207.04925), Theorem 6.1 | F CM; a regular algebraic cuspidal polarized representation; irreducibility on G_F(zeta_(p^infinity)). | H¹_f(F+,ad_pol r)=0. |
| [A'Campo–Hevesi–Thorne–Whitmore, *Adjoint Bloch–Kato Selmer groups of regular algebraic automorphic Galois representations* (July 2026)](https://arxiv.org/pdf/2607.11769), Corollary 5.2 | F CM; a regular algebraic cuspidal representation; enormous image on the cyclotomic kernel; pure Weil–Deligne representations at every finite place. | The full H¹_f(F,End r)=0, without a polarization assumption. |

The 2026 statement is a genuine enlargement from the polarized adjoint over F+ to the full adjoint over F. It does not remove cuspidality or the image condition. “Enormous” implies absolute irreducibility by Newton–Thorne, Lemma 2.25. None of these statements supplies vanishing for an arbitrary regular reducible isobaric sum.

No unproved potential-automorphy assertion is used below.

## 3. The natural host is regular but reducible

The exact host over K is

~~~math
R=W\oplus1.
\tag{3.1}
~~~

When V has Hodge–Tate weights -e,e, its finite twist W has the same weights. Thus R has the three distinct weights -e,0,e. Its failure is not regularity.

If V is modular and its base change to K is cuspidal, W is the Galois representation of the base-changed form twisted by the finite Hecke character nu. The direct sum (3.1) corresponds, with the consistent normalization, to the isobaric sum of this GL2 representation and the trivial GL1 representation. This does not produce a cuspidal GL3 representation, and R remains reducible after every field restriction.

The underlying endomorphism representation over K splits as

~~~math
\operatorname{End}R
=
\operatorname{End}W\oplus1\oplus W\oplus W^\vee.
\tag{3.2}
~~~

There is also an exact decomposition over Q using the polarized adjoint. It shows why extending the cited theorems to R would restate the missing vanishing.

## 4. Exact polarized decomposition

Set

~~~math
J_s=\begin{pmatrix}0&1\\1&0\end{pmatrix},
\qquad
P=\operatorname{diag}(J_s,1).
~~~

The descended corner satisfies

~~~math
W(chc)=J_s W(h)^{-t}J_s
\qquad(h\in G_K).
~~~

On End R, let G_K act by conjugation and let c act by

~~~math
X\longmapsto-PX^tP^{-1}.
\tag{4.1}
~~~

This is the polarized adjoint action. The following decomposition is an isomorphism of G_Q-representations:

~~~math
\boxed{\quad
\operatorname{ad}_{\mathrm{pol}}R
\simeq
\operatorname{ad}^0V\ \oplus\ \eta\ \oplus\ \eta\ \oplus\ U.
\quad}
\tag{4.2}
~~~

Here is the explicit calculation.

The trace-zero corner matrices carry the usual adjoint action of V|G_K. For any trace-zero two-by-two matrix X,

~~~math
-J_sX^tJ_s=DXD.
~~~

This agrees with the action of c on ad^0 V. The scalar corner and the scalar middle each have trivial G_K action and c acts by -1, so each is eta.

Write an off-diagonal matrix as a pair (w,phi), with w a column in W and phi a row in W^vee. Under c it becomes

~~~math
(w,\phi)\longmapsto(-J_s\phi^t,-w^tJ_s).
~~~

Use coordinates (w,y) with y=-J_s phi^t. G_K acts on the two coordinates through W(h) and W(chc), respectively, while c swaps them. Thus the off-diagonal summand is Ind_K^Q W, which is U by the tensor identity for induction. This proves (4.2), including the conjugation action and its sign.

Bloch–Kato conditions commute with the displayed splitting. For the non-CM modular V, Newton–Thorne's Theorem B gives vanishing for ad V, hence for ad^0 V. Also H¹_f(Q,eta)=0: restrict to K, where the character becomes trivial; characteristic-zero restriction is injective, and H¹_f(K,E)=0 by class field theory, since its classes are everywhere unramified and the class group is finite. At a p-adic place the finite local condition on the trivial coefficient is the unramified condition.

Consequently,

~~~math
H^1_f(\mathbb Q,\operatorname{ad}_{\mathrm{pol}}R)
\simeq H^1_f(\mathbb Q,U).
\tag{4.3}
~~~

The natural regular reducible host therefore packages the precise unknown group. It does not reduce it to a known vanishing theorem.

## 5. No irreducible adjoint host in the SL2-monodromy case

The obstruction is not restricted to tensor or symmetric-power constructions from V.

### Lemma

Let Gamma be a group and let B be a finite-dimensional characteristic-zero representation over an algebraically closed field. Suppose its connected algebraic monodromy group is faithfully isomorphic to SL2 and the central element -1 acts nontrivially on B.

There is no absolutely irreducible finite-dimensional representation r of Gamma for which B is a subrepresentation of End r. More generally, there is no such inclusion into End r tensor chi for any one-dimensional character chi.

### Proof

Suppose an inclusion exists. Let H be the Zariski closure of the image of (r,chi); omit chi in the untwisted case. The representations r and chi are semisimple, and their direct sum is faithful on H.

The unipotent radical of H° is normal in H. Its invariant subspace in r is nonzero and H-stable, hence all of r by irreducibility. It also acts trivially on chi. Faithfulness therefore forces the radical to be trivial. Thus H° is reductive.

The inclusion makes B an algebraic H-representation. Let

~~~math
q:H\longrightarrow G_B
~~~

be the resulting surjective homomorphism onto its algebraic monodromy group. It maps H° onto G_B°=SL2. The connected center of H° maps trivially, since its image is connected and central in SL2, whose center is finite. Therefore the derived group of H° maps onto SL2.

Write the derived group as an almost direct product of its connected almost-simple normal factors. Exactly one factor S has nontrivial image in SL2. Indeed, any nontrivial image is connected, normal, and semisimple, so is all of SL2; two such images would commute, which is impossible.

The map S to SL2 is a central isogeny. Since SL2 is simply connected, it is an isomorphism. In particular S has an element z corresponding to -1 in SL2.

The factor S is stable under conjugation by all of H. The quotient map q is H-equivariant, so an H-conjugate of S is again a factor with nontrivial image; uniqueness forces it to be S. Every algebraic automorphism of SL2 fixes its unique nonidentity central element. Hence z is central in all of H.

By Schur's lemma, r(z) is scalar. Thus z acts trivially on End r. Every algebraic character of the connected semisimple group S is trivial, so chi(z)=1 as well. It follows that z acts trivially on End r tensor chi. Its action on B is nontrivial, a contradiction.

### Application to U

The representation A has finite image. On the finite-index subgroup ker A,

~~~math
U|_{\ker A}\simeq V|_{\ker A}\oplus V|_{\ker A}.
~~~

Passing to a finite-index subgroup preserves connected algebraic monodromy. Under (1.1),

~~~math
G_U^\circ=
\{\operatorname{diag}(g,g):g\in\mathrm{SL}_2\}
\simeq\mathrm{SL}_2,
~~~

faithfully, and its central -1 acts as -I on U. The lemma therefore applies.

This excludes every absolutely irreducible adjoint host, not merely hosts obtained from familiar tensor constructions. It also excludes a finite-character or Tate twist of such an adjoint, because those are one-dimensional twists in the lemma.

The same obstruction persists after every finite base extension: the connected algebraic monodromy does not change. For the older polarized adjoint theorems, restricting a proposed inclusion to the CM field yields an inclusion into the ordinary adjoint of an absolutely irreducible representation; the same lemma applies there.

The root and arithmetic worker independently checked the factor/isogeny/centrality argument. No novelty claim is made for this representation-theoretic lemma.

## 6. Why deformation toward a cuspidal point does not supply the embedding

One could try to deform R=W⊕1 to an irreducible automorphic representation and use adjoint vanishing at the resulting point. That changes the coefficient representation: U is the cross-block module at the reducible point, and the lemma prevents it from remaining an adjoint summand at an irreducible point with the stated monodromy.

There is a further elementary issue. An infinitesimal extension has matrices

~~~math
R_t(h)=
\begin{pmatrix}
W(h)&t\,b(h)\\
0&1
\end{pmatrix},
\qquad t^2=0,
~~~

with b satisfying the corresponding cocycle condition. Its characteristic polynomial, and hence its pseudocharacter, is independent of b. The extension direction can therefore be invisible to the trace even in characteristic zero.

Newton–Thorne's comparison between deformations and pseudodeformations, Proposition 2.7, assumes characteristic-zero absolute irreducibility. That hypothesis cannot be discarded at this point. Vanishing at nearby irreducible points does not establish vanishing for the cross-block group at R.

## 7. Result of the attempted bypass

Two precise statements have been obtained.

1. The desired rank-four module is exactly the off-diagonal summand of a regular polarized rank-three reducible host. Its polarized adjoint Selmer group is the missing Selmer group itself, after known diagonal vanishings.
2. Under the non-CM SL2-monodromy hypothesis, the module cannot embed in any irreducible adjoint representation, even after finite base extension or a scalar twist.

These are obstructions to this particular transfer. They do not disprove Selmer vanishing, Hecke GRH, or Artin's primitive-root conjecture. The CM/dihedral case remains outside the universal-embedding lemma. A successful route in the non-CM case must control the rank-four coefficient directly, control extensions at the reducible host, or provide a different analytic input; simply invoking a stronger irreducible adjoint-vanishing theorem cannot do it.
