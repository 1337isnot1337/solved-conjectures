# Schneider's conjecture

Status: the accepted archive does not establish the full conjecture by the arithmetic route examined here. Its negative-Tate strict-Selmer consequence is already known. This note proves the exact extraction, checks the twist conventions, and gives a counterexample to the proposed interpolation inference. It also compares the scope with Jannsen's and Soulé's conjectures.

Coordination: [issue 80](https://github.com/1337isnot1337/solved-conjectures/issues/80). Source pin: 9d5316ec73f5df89c4d95703ed106837b8a4060e. No Lean verification was performed.

## 1. The actual closed source input

The accepted input is the archive's internal arithmetic package, not RH or Dirichlet GRH alone. The closed theorem litN in [CorGKOf.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/SmallClassNumbers/CorGKOf.lean) supplies LiteratureRankNHypothesis. The chain through KFinal and CohInp is recorded in [character-lifting.md, section 1](character-lifting.md).

Two outputs must be distinguished.

The predicate [LemmaK](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/GeneratorCountTuples/LemmaK.lean) supplies a single constant C and, for every prime p and every totally complex number field L containing mu_p (mu_4 when p=2), gives finiteness and the bound

~~~math
\log\left|H^2(G_{L,S_p},\mathbb Z_p(e+1))\right|
\le
\exp\!\left((2e[L:\mathbb Q])^C\log(2|D_L|)\right),
\qquad e\ge1.
~~~

The local datum LData in [Formalism/GaloisCohomology/Statement.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Formalism/GaloisCohomology/Statement.lean) specifies precisely the primes above p. Its zlTw uses the positive exponent e+1. Its qzTw uses exponent -e. The signs are part of the definitions.

The theorem [soBar](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/LevelCohomology/FdAdjoinRange.lean), obtained using this package and duality, concerns H^1 with a negative Tate twist. It allows every number field and every finite-image coefficient character, including characters of p-power order. It requires the class to be unramified at every finite place and zero on every decomposition group above p.

Neither output changes the sign of the H^2 twist to a nonpositive integer.

## 2. Complete Artin–Tate consequence

Let F be any number field, p any prime, and E a finite extension of Q_p. Let A be a finite-dimensional continuous E-representation of G_F with finite image. For n>=1, put V=A(-n).

Define the strict group by its actual local conditions:

~~~math
H^1_{\mathrm{str}}(F,V)=
\left\{
z\in H^1(G_F,V):
\begin{array}{ll}
\operatorname{res}_{I_v}z=0&\text{for every finite }v\nmid p,\\
\operatorname{res}_{G_{F_v}}z=0&\text{for every }v\mid p
\end{array}
\right\}.
~~~

**Proposition.** The accepted source package implies

~~~math
H^1_{\mathrm{str}}(F,A(-n))=0
\qquad(n\ge1).
~~~

This allows arbitrary finite-image dimension, not only one-dimensional characters.

**Proof.** Choose a finite Galois extension L/F on whose absolute Galois group A is trivial. Restriction preserves the stated local conditions: inertia groups and decomposition groups over L are subgroups of their counterparts over F.

After restriction, V is a direct sum of copies of E(-n). Apply soBar, with trivial finite character, to each coordinate of the restricted class. It is zero over L.

Restriction is injective on characteristic-zero cohomology here. Indeed, corestriction composed with restriction is multiplication by [L:F], an invertible scalar in E. Consequently the original class is zero. No condition that [L:F] or the order of A be prime to p is used. This argument does not claim injectivity with torsion coefficients. QED.

The same reasoning gives the usual Bloch–Kato conclusion

~~~math
H^1_f(F,A(-n))=0.
~~~

For completeness, restrict a Bloch–Kato class to L. At a place w above p, the representation is a sum of negative Tate twists. The local crystalline dimension formula gives H^1_f(L_w,E(-n))=0: its de Rham quotient by Fil^0 and its invariant space are both zero. At the other finite places the local finite condition is the unramified condition. The restricted class is therefore in the strict group just proved zero, and restriction/corestriction finishes the argument.

This is a known theorem. [Bellaïche's lectures, section 4.3.1, printed page 50](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKintro.pdf) record the characteristic-zero Bloch–Kato dimension result for Tate twists of Artin representations and attribute it to Soulé and Borel. The local formula is discussed in section 2.2. [Dogra, Unlikely intersections and the Chabauty–Kim method over number fields, section 6.1 and Theorem 6.1](https://doi.org/10.1007/s00208-023-02638-2) explicitly uses Soulé's positive-Tate H^2 vanishing to compute Artin–Tate cohomology.

The extension to finite-image dimension therefore clarifies a useful input; it does not resolve a new conjecture.

It also does not kill the mixed rank-four module in [character-lifting.md, section 9](character-lifting.md). That module has Hodge–Tate weights {-e,-e,e,e}. A single Tate twist of a finite-image representation has only one Hodge–Tate weight. For e>0, the mixed module is outside this proposition.

## 3. Schneider: the sign that remains missing

For odd p and a suitable finite set S containing the p-adic and archimedean places, Schneider's conjecture can be stated as

~~~math
\operatorname{Sch}(F,p,r):
\quad
H^2(G_{F,S},\mathbb Q_p/\mathbb Z_p(1-r))=0,
\qquad r\in\mathbb Z\setminus\{0\}.
~~~

[Nickel, On the p-adic Beilinson conjecture and the equivariant Tamagawa number conjecture, section 3.6](https://doi.org/10.1007/s00029-021-00717-3) gives this formulation and its strict-localization equivalent. It explicitly identifies r<0 as the range proved by Soulé. The case r=1 is equivalent to Leopoldt's conjecture.

The source LemmaK has 1-r=e+1, hence r=-e<0. The strict H^1 representation in soBar has exactly that exponent r=-e.

The distinction can be displayed without any conjectural identification:

| Available statement | Dual cohomological direction |
|---|---|
| H^1_str(F,E(-e))=0, e>=1 | Positive-twist H^2(F,E(e+1)) vanishing |
| The desired strict H^1 statement at r>=1 | Nonpositive-twist H^2(F,E(1-r)) vanishing |

Duality includes the twist by one. It does not give an equivalence between H^2(F,E(e+1)) and H^2(F,E(-e)). Reversing that sign would insert the missing statement.

The finite-character quantifier in soBar does not fix this issue. A finite-image character cannot equal a nonzero power of the cyclotomic character on an open subgroup: its image is finite, while the cyclotomic power still has infinite image.

## 4. Why quantitative interpolation is insufficient

There is a precise algebraic counterexample to the inference that small positive-weight specializations force every nonpositive specialization to be finite.

Fix an odd prime p and an integer j_0<=0. Put u=1+p and define

~~~math
\Lambda=\mathbb Z_p[[T]],\qquad
a=u^{j_0}-1\in p\mathbb Z_p,\qquad
X=\Lambda/(T-a).
~~~

For an integer j, specialize at T=u^j-1:

~~~math
X_j=X/(T-(u^j-1))X
\simeq
\mathbb Z_p/(u^j-u^{j_0}).
~~~

Every positive integer j>=2 differs from j_0. The elementary lifting-the-exponent identity gives

~~~math
v_p(u^j-u^{j_0})
=
v_p(u^{j-j_0}-1)
=
1+v_p(j-j_0).
~~~

Thus every such specialization is finite and

~~~math
\log|X_j|
=
(1+v_p(j-j_0))\log p
\le
\log p+\log(j-j_0).
~~~

This is much smaller than a fixed polynomial in j. Nevertheless,

~~~math
X_{j_0}\simeq\mathbb Z_p
~~~

has rank one. The module X is p-torsion-free and has Iwasawa invariants mu=0 and lambda=1, so the failure persists even after imposing mu=0. One may set the modules at all other coefficient primes equal to zero; a prime-summed positive-weight bound still does not exclude the example.

This is an abstract module counterexample to a proposed implication. It is not asserted to be an arithmetic Iwasawa module and is not a counterexample to Schneider's conjecture.

The reason is exact: to approximate j_0 to p-adic precision p^k using a positive integer j, one may have to take j of size about p^k. A simple zero then contributes length proportional to k, which is only logarithmic in j. The archive's polynomial archimedean bounds allow that growth.

Any argument using this route must add arithmetic information excluding the factor T-(u^{j_0}-1). Neither finite specializations nor the extracted polynomial size estimates supply it.

## 5. Jannsen: H^1_f vanishing does not settle the full H^2 problem

One customary form of Jannsen's conjecture, recorded in [Hornbostel–Kings, Conjecture 1.8](https://www.numdam.org/item/10.5802/aif.2212.pdf) and [Bars, Conjecture 1.1](https://mat.uab.cat/~francesc/JannHecke.pdf), predicts

~~~math
H^2\!\left(G_{F,S},
H^i_{\mathrm{et}}(X_{\overline F},\mathbb Q_p(j))\right)=0
\quad\text{if }i+1<j\text{ or }i+1>2j
~~~

for smooth projective X with the prescribed good-reduction set.

Already for i=0, the two ranges include j>=2 and j<=0. LemmaK supplies the positive range. The nonpositive range is not obtained by the negative-Tate H^1 result.

For general i, the coefficient module need not become trivial after a finite extension. The reduction in section 2 applies to finite-image Artin representations; it supplies no general reduction of geometric cohomology to that case.

Bellaïche's sections 4.3.1 and 5 make the distinction explicit: the Artin–Tate Bloch–Kato dimension statement is known, while the full-global-cohomology question can still involve a Leopoldt-type localization problem. There is no contradiction between those two facts.

## 6. Soulé: the full field-uniform bound has not been reached

The conjecture in [Soulé, A bound for the torsion in the K-theory of algebraic integers, section 5.1](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-kato/soule.dm.pdf) seeks constants, depending on a fixed number-field degree d, such that

~~~math
\log|K_m(\mathcal O_F)_{\mathrm{tors}}|
\le
\log\alpha_d+\beta_d m^\gamma\log|D_F|
~~~

for every field F of that degree and every relevant K-degree m. A degree-independent exponent gamma is also expected. For F=Q, the intended formulation needs a normalization such as log max(2,|D_F|); the literal log(1)=0 is not a usable interpretation.

The source LemmaK has a different shape: its right side for log-cardinality is (2|D_L|)^{(2ed)^C}. It is a bound for one coefficient prime and requires the indicated roots of unity. It does not give polynomial dependence on the K-degree together with logarithmic dependence on the discriminant.

The stronger rational-field consequence in [vandiver.md](vandiver.md) is

~~~math
\log|K_m(\mathbb Z)_{\mathrm{tors}}|
\ll (m+1)^B
\qquad(m\ge1).
~~~

That result uses SmallClassNumbers.Bound, the odd-primary comparison with K-theory, the treatment of excluded primes, and known order formulas in the remaining degrees. It covers all K-degrees over Q. It does not control every field of any fixed degree d>=2.

The contemporary comparison was checked against [Emery (2024), Theorem 1.1 and its discussion](https://doi.org/10.1007/s00229-024-01598-4), and [de la Torre Durán, version 2 of 19 November 2026, Theorem 4.5](https://arxiv.org/html/2611.06300v2). The latter still states Soulé's full conjecture with every degree-d field and gives a weaker bound away from small primes. Its rational bound is exponential in m^2 log m on the logarithmic-torsion side. Our rational extraction is stronger in that variable, but no priority claim is made for a consequence of an arithmetic estimate already present in the accepted archive.

## 7. Outcome of this target screen

The strongest closed qualitative statement extracted here is the complete Artin–Tate strict-Selmer vanishing proposition in section 2, including finite-image representations of arbitrary dimension. Its mathematical content is established prior art.

The new work in this note is the exact source-to-statement comparison and the explicit specialization countermodel. Neither is a resolution of Schneider's, Jannsen's, or Soulé's full conjecture.

For this arithmetic program, the remaining substantial quantitative output is the polynomial bound for the entire torsion K-theory of Z, with its precise archive dependency. Extending that result to the full field-uniform Soulé statement still requires new arithmetic and discriminant-uniform estimates. The mixed class-character deformation route has its separate, explicit rank-four Selmer obstruction documented in character-lifting.md and artin-density.md.
