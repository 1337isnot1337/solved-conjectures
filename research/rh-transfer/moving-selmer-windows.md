# Artin's primitive root conjecture

## Moving Selmer windows: status

This note proves a quantitative restriction lemma for finite characters, gives a complete conditional extension of the archive's sparse-window argument, and tracks the field parameters needed by the proposed Hecke bootstrap. It does not establish Hecke GRH or the full Artin density asymptotic.

The mathematical source is the accepted archive at commit [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). Its internal arithmetic package is an additional accepted input; the statements below are not inferred from RH alone. No Lean verification was performed.

The companion [hecke-bootstrap.md](hecke-bootstrap.md) proves the final analytic transfer. The remaining arithmetic requirement is a uniform bound for a weighted sum of torsion Selmer lengths, over all coefficient primes and all positive twists below a growing height. Characteristic-zero negative-Tate vanishing does not itself give that bound.

Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## 1. The exact target and its normalization

For a number field E, a coefficient prime ℓ, and j≥1, write

~~~math
\mathcal S_\ell(E,j)=
\ker\left(
 H^1(E,\mathbf Q_\ell/\mathbf Z_\ell(-j))
 \longrightarrow
 \prod_{v\nmid\ell}H^1(I_v,\mathbf Q_\ell/\mathbf Z_\ell(-j))
 \times
 \prod_{v\mid\ell}H^1(E_v,\mathbf Q_\ell/\mathbf Z_\ell(-j))
\right).
~~~

Thus classes are unramified at every finite place away from ℓ, and strictly zero at each ℓ-adic place. This is the scalar strict/unramified condition used by the source's shaLen.

Throughout, t is an integer with t≥1. For a finite set S of rational primes, set

~~~math
W_S(E,t)=\sum_{\ell\in S}\log\ell
       \sum_{1\le j\lt t}
        \mathop{\mathrm{length}}_{\mathbf Z_\ell}\mathcal S_\ell(E,j).
\tag{1.1}
~~~

In [CharacterBoxes/ExistsPageN.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean), VVle(E,t,B) requires finiteness of every summand and W_S(E,t)≤B for every finite S. It therefore imposes a bound on the whole nonnegative prime sum, not just on each prime separately.

For a finite character η of E, choose for each ℓ a finite extension C_ℓ/Q_ℓ containing its values, with integer ring O_ℓ and ramification index e_ℓ. Define the twisted group by the same local conditions, using

~~~math
(C_\ell/O_\ell)(\eta^{-1}\varepsilon_\ell^{-j})
~~~

as coefficient module. Its normalized length is

~~~math
s_\ell(E,j,\eta)=
 \frac{\mathop{\mathrm{length}}_{O_\ell}
              \mathcal S_\ell(E,j,\eta)}{e_\ell},
\qquad
W_{S,\eta}(E,t)=
 \sum_{\ell\in S}\log\ell\sum_{1\le j\lt t}s_\ell(E,j,\eta).
\tag{1.2}
~~~

This is the source's actual ramification-index normalization: Chr.nrm is length_O divided by eO in [CharacterLevelBounds/ShaFamMono.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/CharacterLevelBounds/ShaFamMono.lean). It is not division by the residue degree. The same file defines the inverse character and negative Tate twist.

The source's V' imposes additional strict conditions at primes dividing a conductor. Those make the group smaller, so the upper bounds proved here also apply to that stricter group.

For every fixed 0<ε<1/52, the moving-field target has

~~~math
t(x)=\lfloor x^{401}\rfloor,
\qquad
B(x)=\exp(x^\varepsilon/2),
\qquad
x^{2+8\varepsilon}\le2^{h(x)}
                      \le2x^{2+8\varepsilon}.
\tag{1.3}
~~~

VWinAt demands the bound throughout selected intervals [Y,Y²], with X^(1/J)≤Y and Y²≤X, where J is fixed before X and the auxiliary primes q,d grow. A constant allowed to depend arbitrarily on each moving field does not meet this quantifier.

## 2. A cyclic restriction lemma with exact loss

**Proposition.** Let L/E be a finite cyclic extension of degree d that kills η. The extension may ramify and need not be CM. Suppose the scalar groups over L are finite for 1≤j<t. Then the twisted groups over E are finite and

~~~math
s_\ell(E,j,\eta)
 \le
 \mathop{\mathrm{length}}_{\mathbf Z_\ell}\mathcal S_\ell(L,j)
      +v_\ell(d).
\tag{2.1}
~~~

Consequently, for every finite prime set S,

~~~math
W_{S,\eta}(E,t)
 \le W_S(L,t)+(t-1)\sum_{\ell\in S}v_\ell(d)\log\ell
 \le W_S(L,t)+(t-1)\log d.
\tag{2.2}
~~~

If L is the kernel field of a character of order dividing a fixed integer m, one may replace log d by log m.

**Proof.** Fix ℓ and j, and abbreviate the coefficient module by M. Inflation-restriction gives

~~~math
\ker\bigl(H^1(E,M)\longrightarrow H^1(L,M)\bigr)
 \simeq
 H^1\bigl(\mathop{\mathrm{Gal}}(L/E),M^{G_L}\bigr).
\tag{2.3}
~~~

Because η is trivial on G_L, the latter invariant module is

~~~math
A=(C_\ell/O_\ell)(-j)^{G_L}.
~~~

It is finite. The cyclotomic character of a number field has open image in Z_ℓ^×, so it contains an element whose jth power is not 1. The corresponding nonzero scalar annihilates A. As an O_ℓ-submodule of C_ℓ/O_ℓ, A is therefore finite cyclic.

Let σ generate the cyclic group of order d and put N=1+σ+⋯+σ^(d−1). The elementary cocycle formula gives

~~~math
H^1(\langle\sigma\rangle,A)
 =\ker(N:A\to A)/(\sigma-1)A.
~~~

This is a cyclic O_ℓ-subquotient of A. It is killed by d: on ker N, the identity N−d=(σ−1)P(σ) expresses multiplication by d as a coboundary. Hence

~~~math
\mathop{\mathrm{length}}_{O_\ell}H^1(\langle\sigma\rangle,A)
 \le v_{\varpi_\ell}(d)=e_\ell v_\ell(d).
\tag{2.4}
~~~

In particular, restriction is injective when ℓ does not divide d. There is no need to discard the remaining primes.

Restriction preserves every stated local condition. Inertia and decomposition groups upstairs are subgroups of those downstairs, so a zero restriction downstairs remains zero upstairs. This holds at ramified places as well. Thus the image of the twisted Selmer group lies in the scalar Selmer group over L with coefficients extended to O_ℓ.

Since O_ℓ is finite free over Z_ℓ,

~~~math
\mathcal S_\ell(L,j;C_\ell/O_\ell)
 \simeq
 \mathcal S_\ell(L,j)\otimes_{\mathbf Z_\ell}O_\ell.
~~~

This can also be checked after choosing a Z_ℓ-basis of O_ℓ: the cochain complexes and all local conditions become a finite direct sum of scalar copies. A scalar module of Z_ℓ-length a has O_ℓ-length e_ℓa after this extension. Combining the image bound with (2.4), then dividing by e_ℓ, proves (2.1). Summation proves (2.2). QED.

This argument also works when η is trivial and L/E is any cyclic extension. For an extension of degree at most two it gives the scalar comparison with an extra cost at most one at ℓ=2, matching the type of comparison used in the source's TwoBase construction.

### Why coefficient extension does not amplify the estimate

Both the scalar target and the cyclic-kernel error scale by the same ramification index e_ℓ. The normalization in (1.2) removes that factor. Enlarging coefficient fields therefore neither creates a stronger bound nor conceals a growing error.

### The non-CM kernel field is legitimate in this proposition

For an odd nontrivial anticyclotomic character over an imaginary quadratic field, its kernel extension over Q can have noncentral complex conjugation. Such a Galois field cannot be a subfield of a CM Galois field. This prevents treating it as the old CM host.

It does not prevent restriction of Galois cohomology to that field. Proposition (2.2) is a scalar-bound reduction over a potentially non-CM field. It is not a claim that the archive's CM automorphic estimates apply there.

## 3. Moving fields and the size of the new obligation

Fix a number field K and a finite character η of G_K of order m, with kernel field F/K. Let A_h=Q(μ_(2^(h+2)))^+. Consider the explicit candidate family

~~~math
E_x=K A_{h(x)}\mathbf Q(\sqrt{-q},\sqrt{-d}),
\qquad
L_x=F E_x.
\tag{3.1}
~~~

When K is CM, E_x is CM. In the imaginary-quadratic anticyclotomic application, the companion CM-intersection argument preserves the odd character order; the bound below only needs [L_x:E_x]≤m.

No assertion is made that this family automatically satisfies every host, sharing, or auxiliary-character condition in the analytic construction. Its use here is to track the arithmetic parameters explicitly.

Because [A_h:Q]=2^h,

~~~math
[E_x:\mathbf Q]\le4[K:\mathbf Q]\,2^{h(x)},
\qquad
[L_x:\mathbf Q]\le4[F:\mathbf Q]\,2^{h(x)}
 \ll_F x^{2+8\varepsilon}.
\tag{3.2}
~~~

For fixed K there is a constant C_K such that

~~~math
\log\mathop{\mathrm{rd}}(E_x)
 \le C_K+\log\bigl(2^{h(x)+2}qd\bigr).
\tag{3.3}
~~~

One way to justify this without assuming K is abelian is to first take the abelian field A_h Q(√−q,√−d), whose conductor divides a fixed power of 2 times 2^h qd and whose discriminant is at most conductor to its degree. Then adjoin a fixed integral primitive element for K. Its fixed polynomial discriminant bounds the relative discriminant per base-field degree. The same argument with F gives (3.3) for L_x with a different fixed constant.

More explicitly, if θ is a fixed integral primitive element for F with polynomial discriminant Δ, its minimal polynomial over an auxiliary field E is a monic factor of that polynomial. The discriminant of that factor divides Δ in O_E. Therefore

~~~math
\log|D_{EF}|
 \le[EF:E]\log|D_E|+[E:\mathbf Q]\log|\Delta|.
~~~

This proves the needed root-discriminant bound with a constant depending only on F.

The source's prime windows ensure, on the eventual interval,

~~~math
\log(qd)\le x^{\varepsilon/4}.
\tag{3.4}
~~~

The powers of two and the height contribute only O(log x) to their logarithms. Hence a uniform scalar estimate of the following shape would be more than sufficient:

~~~math
W_S(L_x,t)\le
 C_F\left(t\,[L_x:\mathbf Q]\,
                    2^{h(x)+2}qd\right)^{A_F}
\quad\text{for every finite }S,
\tag{3.5}
~~~

with C_F,A_F fixed independently of x,q,d,t.

Indeed, at t≤x^401, the logarithm of the right side is O_F(log x+x^(ε/4))=o(x^ε). The additional restriction cost in (2.2) is at most x^401 log m, whose logarithm is also o(x^ε). Thus, after increasing a threshold independent of q,d,

~~~math
W_{S,\eta_{E_x}}(E_x,\lfloor x^{401}\rfloor)
 \le \exp(x^\varepsilon/2).
\tag{3.6}
~~~

The same conclusion follows from the weaker hypothesis W_S(L_x,t)≤exp(x^(cε)) for any fixed c<1, on this same family and these same windows. Changing ε in a theorem that also changes the field family would require a separate check; it is not done implicitly here.

Equation (3.5) is a sufficient new arithmetic theorem, not an available archive output. It makes the required uniformity explicit.

## 4. What the accepted source actually supplies

The relevant source statements are:

| Source | Quantitative content | Scope |
|---|---|---|
| [GeneratorCountTuples/LemmaK.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/GeneratorCountTuples/LemmaK.lean) | log cardinality of positive-twist H² ≤ exp((2jn)^C_K log(2D)) | One coefficient prime; totally complex fields with required roots of unity |
| [LayeredIsomorphisms/SecondBound.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/SecondBound.lean) | ABound: at most R exceptional twist centers, and comparison with a fixed cyclotomic layer | Requires a fixed rank R |
| [LayeredIsomorphisms/ThmBabOfLemmaK.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/ThmBabOfLemmaK.lean) | Sparse-window bounds at 2 and a fixed finite set of odd primes | Uses Ferrero–Washington through FixedIn and TwoIn |
| [HeightAndVanishing/LayerLe.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/LayerLe.lean) | Plus lengths ≤ (Nt)^C+C B | Rational Dirichlet-character families and CountI–V |
| [PrimeSetBoundDataOfPrimitiveChar.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/PrimeSetBoundDataOfPrimitiveChar.lean) | Combines finite-prime windows, plus bounds, and an explicit polynomial minus bound | IsChiField/IsCompField are subfields of cyclotomic fields |
| [CMFieldExponentialBounds/AdmissibleOfPageN.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/CMFieldExponentialBounds/AdmissibleOfPageN.lean) | Converts those conductor estimates to VVle ≤ exp(x^ε/2) | Maintains the fixed constants before X,q,d |

The strong all-prime plus estimate is polynomial in the conductor N, not polynomial in the full discriminant with an uncontrolled degree-dependent exponent. That distinction matters because the field degree grows like a fixed power of x.

Applying LemmaK directly at j≈x^401 gives a bound with an exponent growing at least like a large fixed power of x. It is far larger than exp(x^ε/2), even before summing primes. It also provides no uniform all-prime support bound. The source avoids this problem by applying LemmaK only to a small set of low exceptional twists after its Iwasawa argument.

The actual Ferrero–Washington input is stated in [PublishedTheorems/FerreroWashington.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/PublishedTheorems/FerreroWashington.lean): the base field is abelian over Q, and the mod-ℓ class-group ranks remain bounded through its cyclotomic tower. In [QuadraticExtensions/IsAlgClosureRat.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/QuadraticExtensions/IsAlgClosureRat.lean), that rank is propagated across the two auxiliary quadratic extensions, giving a bound of the form 4(g+6 deg M), independent of q,d.

For a nonabelian kernel field F, its finite degree and negative-Tate vanishing do not instantiate that abelian hypothesis.

## 5. A conditional sparse-window extension with tracked constants

The argument behind PartA does extend beyond abelian fields once its quantitative tower input is supplied. The following formulation states that input explicitly.

Fix a totally complex field F, a finite set P of coefficient primes, C_K≥1, and C_t≥1. For each ℓ in P and each permitted q,d, suppose there is a base field L_(0,ℓ)(q,d) with the required ℓ-power roots of unity, and a cyclotomic tower over it. Assume:

1. The relevant moving layer has degree ℓ^r over its base, with r≤C_0+C_1 log_ℓ x. The degree of the base is bounded independently of q,d.
2. There are fixed integers R_ℓ, independent of q,d, giving the source's ABound and SecondBound. In the exceptional-set form used in the proof: for each fixed q,d,Z there is **one** set Exc_ℓ⊂[1,Z] of at most R_ℓ integers that works simultaneously for every moving layer index r and every field representing that layer. For every 1≤j≤Z outside this same set, the length is O(R_ℓ(r+1+log_ℓ Z)). The set may depend on q,d,Z, but it cannot be chosen separately as r or x varies. The source's ABound has exactly this uniformity: its finite list of roots is chosen before the universal quantifiers over the twist and layer, and its FirstBound quantifies over every layer after choosing Exc.
3. The fixed comparison layer, of index j_0=⌊log_ℓ R_ℓ⌋+3 as in the source, has degree at most n_0 and log(2|D|)≤C_2(1+log(qd)), with n_0,C_2 independent of q,d.
4. The scalar target differs from the moving layer by a bounded cyclic restriction loss, as in Proposition (2.1).

All constants and the finite set P are fixed before X,q,d. One may also add to both length comparisons a term

~~~math
M(q,d)\ell^r,\qquad
0\le M(q,d)\le C_3(qd)^{C_4},
\tag{5.1}
~~~

with fixed C_3,C_4. This allowance is useful for a controlled μ-primary Iwasawa piece; section 6 proves its algebraic size bound.

**Conditional window theorem.** Under these assumptions and LemmaK, for each fixed ε>0 there is a fixed J≥1 such that, whenever X is sufficiently large and

~~~math
\log(qd)\le X^{\varepsilon/(4J)},
~~~

some Y satisfies X^(1/J)≤Y, Y²≤X, and throughout x∈[Y,Y²],

~~~math
\sum_{\ell\in P}\log\ell
 \sum_{1\le j\lt t(x)}
 \mathop{\mathrm{length}}_{\mathbf Z_\ell}\mathcal S_\ell(L_x,j)
 \le \exp(x^{4\varepsilon/5})
\quad\text{if }t(x)\le x^{C_t}.
\tag{5.2}
~~~

Here the scalar target is the one covered by assumptions 1–4. The conclusion does not quantify over primes outside P.

**Proof.** Put α=ε/(2C_K), shrinking ε if necessary so α≤C_t, and let R=Σ_(ℓ∈P)R_ℓ. Apply the exceptional-set construction with Z=⌊X^C_t⌋. The union of exceptional integers has size at most R.

A purely elementary window argument chooses Y so that every exceptional j≤x^C_t is at most x^α for all x∈[Y,Y²]. For completeness, set k=2C_t/α. The R+1 half-open intervals

~~~math
\bigl(X^{\alpha/(2k^i)},\,X^{C_t/k^i}\bigr],
\qquad 0\le i\le R,
~~~

are disjoint. At least one contains no exceptional integer. Taking Y=X^(1/(2k^i)) for that interval gives the claimed property. It also gives Y²≤X and Y≥X^(1/J), for example with

~~~math
J=4(2C_t/\alpha)^R.
~~~

This is the same permitted size of J as the source's [LayeredIsomorphisms/Window.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/Window.lean).

Since x≥X^(1/J), we have log X≤J log x and log(qd)≤x^(ε/4). For a nonexceptional j, the first tower bound is O(log x), plus the optional term (5.1). For an exceptional j relevant to the height, j≤x^α. LemmaK at the fixed comparison layer bounds its H² length, after a fixed log ℓ conversion, by

~~~math
\exp\!\left((2jn_0)^{C_K}C_2(1+\log(qd))\right)
 \le \exp(C_5 x^{3\varepsilon/4}).
\tag{5.3}
~~~

The equality αC_K=ε/2 is why the fixed comparison layer and the exceptional-weight window are effective. SecondBound adds only O(log x), together with (5.1) if present.

The optional term satisfies

~~~math
\log\bigl(1+M(q,d)\ell^r\bigr)
 \ll 1+\log(qd)+\log x
 \ll 1+x^{\varepsilon/4}+\log x,
~~~

so it is also absorbed by the right side of (5.3) after changing the fixed constant. Summing fewer than x^C_t twists and finitely many coefficient primes costs only a polynomial in x. Because 3ε/4<4ε/5, that polynomial and the fixed exponential constant are eventually absorbed into exp(x^(4ε/5)). The threshold is independent of q,d. QED.

### Geometry for the non-CM kernel tower

For the scalar field L_x in (3.1), at ℓ=2 take

~~~math
L_0(q,d)=F(i,\sqrt{-q},\sqrt{-d}).
~~~

It has degree at most 8[F:Q], contains μ4, and its discriminant satisfies log(2|D_(L_0)|)≪_F 1+log(qd), by adjoining the three fixed-degree square roots and using their polynomial discriminants. Adjoining a fixed 2-power cyclotomic layer preserves the same form of bound with a different fixed constant.

The field L_x is contained in the corresponding full cyclotomic layer, with relative degree at most two, because A_h is the maximal real subfield of the full 2-power cyclotomic field. Proposition (2.1) supplies the bounded comparison loss.

Thus the degree, discriminant, and cyclic-comparison parts of the conditional theorem are available for this explicit family. The unproved arithmetic part is a uniform R across q,d, with the stated control comparison. For the original abelian family the archive supplies it. Section 8 proves that, at2, one fixed-field cyclotomic μ=0 hypothesis suffices for the nonabelian kernel family.

## 6. A μ-primary piece is not intrinsically too large

The source uses a finite Z_ℓ-rank Iwasawa module. It is useful to distinguish that sufficient hypothesis from the actual size needed by the window target.

Let Λ=Z_ℓ[[T]], let u∈1+ℓZ_ℓ (use u∈1+4Z_2 at 2), and let P be a Λ-module generated by r_0 elements and killed by ℓ^a. Define the twisted level polynomial

~~~math
\omega_{r,j}(T)=(1+T)^{\ell^r}-u^{j\ell^r}.
~~~

It is a monic distinguished polynomial of degree ℓ^r. Therefore Λ/(ω_(r,j)) is free of rank ℓ^r over Z_ℓ, and

~~~math
\mathop{\mathrm{length}}_{\mathbf Z_\ell}
 \bigl(P/\omega_{r,j}P\bigr)
 \le a r_0\ell^r.
\tag{6.1}
~~~

Indeed, this quotient is a quotient of r_0 copies of Λ/(ℓ^a,ω_(r,j)); each has length aℓ^r. The bound is uniform in j.

If r=O(log x) and a r_0 is fixed, (6.1), even after summing j<x^401, is polynomial in x and is negligible compared with exp(x^ε/2). The same remains true if a r_0≤C(qd)^A under the source's logarithmic prime-size bound.

For an exact sequence 0→P→X→Q→0, coinvariants give a right-exact sequence, so, when the quotients are finite,

~~~math
\mathop{\mathrm{length}}(X/\omega X)
 \le \mathop{\mathrm{length}}(P/\omega P)
       +\mathop{\mathrm{length}}(Q/\omega Q).
\tag{6.2}
~~~

Thus a controlled μ-primary part can be separated from a finite Z_ℓ-rank quotient. Equations (6.1)–(6.2) prove the size claim; they do not by themselves prove the necessary arithmetic control theorem relating the chosen strict Selmer group to these coinvariants. That local/global comparison remains part of the input in section 5.

### What still must be uniform

The number of exceptional twist centers is controlled by the finite-rank quotient. Its rank must be bounded independently of q,d to use a fixed J. Merely knowing that each individual field has a torsion Iwasawa module is insufficient for this step.

An explicit algebraic model shows why a μ-primary base can hide arbitrarily large finite-rank pieces. Let ℓ=2, let f_R(T)=(T−2)^R, and put

~~~math
X_R=\mathbf Z_2[[T]]/(2f_R(T)).
~~~

It has a submodule f_RΛ/(2f_RΛ)≅Λ/(2), while its quotient by that submodule is Λ/(f_R), free of rank R over Z_2. Let an abstract group C_2 act on X_R by −1. Then

~~~math
(X_R)_{C_2}=X_R/2X_R\simeq\Lambda/(2),
~~~

independently of R. The module therefore has a fixed μ-primary coinvariant module while the finite Z_2-rank quotient has arbitrarily large rank.

This is a counterexample to an abstract module inference, not a claim about an actual arithmetic tower. It explains why replacing the archive's uniform finite-rank input by an unspecified torsion-module statement would leave a real gap.

## 7. The remaining all-prime theorem

The conditional window theorem handles a fixed finite set P. The source's full VVle additionally controls every odd coefficient prime outside its finite exceptional set by an automorphic congruence bound. That is the role of CountI–V and the conductor-polynomial plus estimate.

For finite Hecke characters over CM hosts, the analogous assertion would have to retain the anticyclotomic coefficient character in the deformation problem and remain uniform in h,q,d and the twist height. The first-order polarized embedding and triangular rigidity are proved in [vandiver.md](vandiver.md) and [character-lifting.md](character-lifting.md). The mixed-block rank-four Selmer input is still absent. A generic all-number-field negative-Tate vanishing theorem does not replace that extension-sensitive torsion bound.

There are therefore two precise routes available for further work:

- Prove a scalar weighted bound such as (3.5) for the non-CM kernel-field family. Proposition (2.2) then gives the twisted windows with an explicit negligible loss.
- Prove the twisted all-prime congruence bound directly over the CM host, and supply the finite-prime tower hypotheses of section 5, allowing a controlled μ-primary term if appropriate.

Neither route is complete in this checkpoint. The achieved results are the exact cyclic restriction cost, the conditional window theorem with all growing parameters tracked, and the μ-primary algebraic bound. They narrow the missing arithmetic input without claiming a named conjecture has been resolved.

## 8. One fixed cyclotomic μ hypothesis controls the quadratic hosts at 2

The uniform rank required in section 5 does not need a separate conjecture for every pair q,d. At the coefficient prime 2, one fixed-field hypothesis suffices for the explicit host family.

Let F be any fixed number field, put F_0=F(i), and set

~~~math
n=[F_0:\mathbf Q],\qquad
C_\infty=\mathbf Q(\mu_{2^\infty}),\qquad
F_\infty=F_0C_\infty.
~~~

Because F_0 contains i, the extension F_\infty/F_0 is its cyclotomic Z_2-extension. Write X_unr(F_\infty) for the Galois group of the maximal unramified abelian pro-2 extension of F_\infty, and assume

~~~math
g=\dim_{\mathbf F_2}
 \mathop{\mathrm{Hom}}_{\mathrm{cont}}
 \bigl(X_{\mathrm{unr}}(F_\infty),\mathbf F_2\bigr)
 <\infty.
\tag{8.1}
~~~

The usual cyclotomic Iwasawa structure theorem identifies (8.1) with μ_2(F_0)=0. Here g counts all Z_2 generators, including those needed for finite torsion; it is not merely the rank after tensoring with Q_2.

**Uniform quadratic-host lemma.** Let q,d be distinct odd primes, unramified in F_0, satisfying q≡3 mod8 and d≡7 mod16. Put

~~~math
L_0(q,d)=F_0(\sqrt{-q},\sqrt{-d}),\qquad
L_\infty(q,d)=L_0(q,d)C_\infty.
~~~

Under (8.1), the Z_2-module X_unr(L_\infty(q,d)) is generated by at most

~~~math
R=4(g+3n)
\tag{8.2}
~~~

elements, independently of q,d. In particular μ_2(L_0(q,d))=0, with a uniform bound on the number of generators needed by the source's tower argument.

### Proof

First count primes in the infinite cyclotomic field. Its Galois group over Q is Z_2^×. For q≡3 mod8,

~~~math
v_2(q^2-1)=3,\qquad
[\mathbf Z_2^\times:\overline{\langle q\rangle}]=2.
~~~

Indeed, the closure of the even powers is 1+8Z_2 and the odd powers give its other coset in the decomposition group. Similarly, d≡7 mod16 gives v_2(d^2−1)=4 and decomposition-group index4. Thus C_\infty has two primes over q and four over d.

Since F_0 contains Q(i), we have [F_\infty:C_\infty]≤n/2. It follows that F_\infty has at most n primes over q and at most 2n primes over d. Let S be the union of these primes, so |S|≤3n.

Let G_S be the Galois group of the maximal pro-2 extension of F_\infty unramified outside S. Restricting F_2-valued characters to inertia gives a linear map

~~~math
H^1(G_S,\mathbf F_2)
 \longrightarrow
 \bigoplus_{v\in S}\mathop{\mathrm{Hom}}_{\mathrm{cont}}(I_v,\mathbf F_2).
~~~

Its kernel consists exactly of the everywhere unramified characters and therefore has dimension g. Every v∈S has odd residue characteristic. Its pro-2 inertia quotient is tame and procyclic, so each summand has dimension at most one. Consequently

~~~math
d(G_S)=\dim_{\mathbf F_2}H^1(G_S,\mathbf F_2)
 \le g+|S|\le g+3n.
\tag{8.3}
~~~

In particular G_S is a finitely generated pro-2 group.

Both rational quadratic fields Q(√−q) and Q(√−d) have discriminants −q and −d, respectively. Their base changes introduce no ramification outside S, including at2. Thus L_\infty/F_\infty is contained in this maximal pro-2 extension and has degree at most4. Let H be the corresponding open subgroup of G_S. The pro-2 Schreier bound gives

~~~math
d(H)\le [G_S:H]\,d(G_S)\le4(g+3n).
\tag{8.4}
~~~

This coarse bound also covers the trivial group and degree1 or degree2 cases.

It remains to justify that the required unramified group upstairs is a quotient of H, rather than just controlling extensions which already descend. If M/L_\infty is any finite Galois 2-extension unramified everywhere, take the compositum of its conjugates under Gal(L_\infty/F_\infty). Its Galois group over L_\infty is a subgroup of a product of 2-groups, and its Galois group over F_\infty is an extension of this group by a 2-group. The normal closure is therefore a 2-extension of F_\infty unramified outside S. It lies in the field defining G_S. This proves that X_unr(L_\infty) is a quotient of H^ab, and (8.2) follows. QED.

### Exact source interface

This argument extends the mathematics of the archive's quadratic-host construction, without requiring F/Q to be abelian:

- [CharStep.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/QuadraticExtensions/CharStep.lean) is the generic tame-inertia character bound.
- [IdxTwo.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/QuadraticExtensions/IdxTwo.lean) gives the same factor-two character bound under an index-two extension; applying it twice gives the factor4 above.
- [OrbTwo.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/QuadraticExtensions/OrbTwo.lean) uses the same decomposition indices2 and4, packaged for abelian fields.
- [GenOfRk.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/QuadraticExtensions/GenOfRk.lean) converts the character bound to a Z_2-generator bound. The extra splitting conditions in XP only take a quotient of the full unramified module.
- [XTwApplyApply.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/NumberFieldTowers/XTwApplyApply.lean) defines IsTower using total complexity, μ4, a positive generator bound, and the XP bound. These conditions hold for L_0(q,d) under (8.1).
- [ABoundOfIsTower.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/AdditiveValuationNorms/ABoundOfIsTower.lean) then supplies ABound from the accepted global and local duality inputs.

Thus, using those accepted arithmetic inputs, (8.1) supplies the missing uniform R_2 and the single exceptional set required for the coefficient-2 part of section 5. Its fixed comparison layer has degree and discriminant bounds already established there. This is a conditional completion of that finite-prime component; it does not prove the all-prime assertion in section 7.

### Why the checked μ=0 results do not supply (8.1)

The intended kernel field is often cyclic of odd degree m over an imaginary quadratic field K, with complex conjugation acting by inversion on Gal(F/K). It is generalized dihedral over Q and need not be CM. No splitting assumption on2 in K is available.

[Oukhaba–Viguié, arXiv:1311.3565](https://arxiv.org/abs/1311.3565), Theorem1.2 and its introductory definitions, treat the Z_p-extension unramified outside **one chosen split prime** of K, together with the corresponding one-prime ramification condition on the Iwasawa module. Their inclusion of p=2 does not change that tower. [Crişan–Müller, Asian Journal of Mathematics24 (2020),267–302](https://intlpress.com/site/pub/files/_fulltext/journals/ajm/2020/0024/0002/AJM-2020-0024-0002-a005.pdf) proves the same kind of split-prime statement. The cyclotomic tower at a split prime ramifies at both primes above p, so these conclusions cannot be substituted into (8.1).

[Bullach–Hofer, Documenta Mathematica28 (2023),369–418](https://ems.press/content/serial-article-files/28566), Proposition5.6 and Remark5.7, distinguish these directions explicitly. Their p-power extension case also does not cover a nontrivial odd-degree kernel at p=2. Their conditional use of classical cyclotomic μ=0 is an input, not a proof of (8.1).

Two elementary module examples identify the invalid shortcuts precisely.

First, vanishing of a two-variable μ-invariant does not survive arbitrary specialization to a chosen one-variable direction. Over Z_2[[S,T]], the module

~~~math
M=\mathbf Z_2[[S,T]]/(S+2)
~~~

has zero localization at the height-one prime(2), hence two-variable μ=0. But its S-coinvariants are M/SM≅F_2[[T]], with one-variable μ=1.

Second, an invariant-part bound cannot control all odd class-character constituents. If C_m has odd order m>1 and I is the augmentation ideal of F_2[C_m], then I^(C_m)=0. The module

~~~math
\bigl(\mathbf Z_2[[T]]/(2)\bigr)\otimes_{\mathbf F_2} I
~~~

has zero C_m-invariants and positive μ=m−1. The inversion action extends this example to a generalized dihedral action. These are abstract module counterexamples, not examples of arithmetic μ>0.

The bounded literature check therefore leaves one explicit fixed-field hypothesis, (8.1), rather than a uniform family of unformulated assumptions. It neither proves that hypothesis for the intended fields nor counts it as a resolved conjecture.


## Review receipt

The coordinating researcher independently checked the cyclic restriction proof, degree and discriminant bounds, empty-interval window construction, and μ-primary module calculation. A second researcher independently checked the restriction proof against the pinned definitions of QO, eO, nrm, ShaU, and shaLen, including primes dividing the extension degree and preservation of every local zero condition. Neither found a substantive gap in those deductions. The common exceptional-set quantifier and the integer height convention were made explicit after review. A further independent review checked section 8's prime counts, tame-inertia character bound, pro-2 Schreier argument, and normal-closure step; no gap was found. Another researcher independently checked the split-prime literature's tower definitions. This is internal mathematical review, not external peer review or Lean verification.

Updated November 20, 2026.
