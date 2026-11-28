# Hecke characters, special values, and the remaining regulator bound

Status: conditional quantitative reduction and literature audit. No Hecke GRH theorem or new resolution of a named conjecture is claimed.

This note tests a route around the twisted automorphic deformation problem in [artin-density.md](artin-density.md). It uses complex functional equations, integral special-value formulas, and Iwasawa theory. The exact target is the moving-field, all-prime Selmer estimate required in [hecke-bootstrap.md](hecke-bootstrap.md), rather than finiteness at a fixed field and weight.

The accepted source remains the RH archive at commit [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). No Lean verification is performed.

## 1. Which size bound is needed

Write W_eta(E,t) for the sum, over coefficient primes and integers 1 <= j < t, of the normalized logarithmic sizes of the strictly unramified Selmer groups with coefficients (C_ell/O_ell)(eta^(-1) epsilon_ell^(-j)). Thus the finite character is inverted, matching moving-selmer-windows.md exactly. Replacing eta by its inverse changes none of the conductor, kernel-field, or absolute-value estimates below. The local condition at primes over the coefficient prime is splitting. The precise normalization and restriction map are fixed in [moving-selmer-windows.md](moving-selmer-windows.md).

If eta has order m and L/E is its cyclic kernel extension, that note proves

~~~math
W_\eta(E,t)\le W(L,t)+(t-1)\log m.
\tag{1}
~~~

The primes dividing m are included. The field L is used to trivialize the coefficient character for a scalar bound. It is not asserted to be a CM field or to satisfy the archive's geometric host conditions.

This distinction matters for an odd-order anticyclotomic character of an imaginary quadratic field: its kernel extension is generally dihedral over the rationals and need not be CM. Nothing below requires it to be CM. It is totally imaginary because it contains E.

If n_E=[E:Q], A_eta=|D_E| N_E(f_eta), and eta is faithful on Gal(L/E), the conductor-discriminant formula gives

~~~math
[L:\mathbb Q]=mn_E,\qquad
\log |D_L|
=m\log|D_E|+
\sum_{a=1}^{m-1}\log N_E(\mathfrak f_{\eta^a})
\le m\log A_\eta.
\tag{2}
~~~

The inequality uses f_(eta^a) dividing f_eta. Consequently the kernel extension has controlled degree and logarithmic discriminant when the character order is fixed.

For comparison, the archive's [LemmaK.lean](https://github.com/1337isnot1337/riemann-hypothesis-solved/blob/9d5316ec73f5df89c4d95703ed106837b8a4060e/extracted/lean/src/Development/AutomorphicArithmetic/AutomorphicVarieties/GeneratorCountTuples/LemmaK.lean) bounds the **logarithm** of the cohomology-group order by

~~~math
\exp\!\left((2jn)^C\log(2D)\right).
\tag{3}
~~~

Removing this outer exponential from the bound for the logarithm would be a substantial strengthening. In particular, (3) is not already a polynomial logarithmic bound.

## 2. The complex leading term has a sufficient bound

Let E be any totally imaginary field of degree 2g and eta a primitive finite-order Hecke character of conductor f_eta. Put

~~~math
A=|D_E|N_E(\mathfrak f_\eta),\qquad
\Gamma_{\mathbb C}(s)=2(2\pi)^{-s}\Gamma(s),
~~~

and use the completed function

~~~math
\Lambda_E(s,\eta)
=A^{s/2}\Gamma_{\mathbb C}(s)^gL_E(s,\eta).
\tag{4}
~~~

A finite-order character is trivial on each connected complex archimedean multiplicative group. Thus all g gamma factors in (4) have argument s.

For every integer j>=1, L_E(s,eta) has a zero of exactly order g at s=-j. Indeed, the gamma product has a pole of order g there, while the functional equation identifies the completed value with a nonzero Euler product at 1+j.

Define the leading Taylor coefficient by

~~~math
L_E^*(-j,\eta)
=\lim_{s\to-j}\frac{L_E(s,\eta)}{(s+j)^g}.
~~~

This is the coefficient, not the unnormalized g-th derivative. Taking absolute values in the functional equation gives the exact identity

~~~math
|L_E^*(-j,\eta)|
=A^{j+1/2}(j!)^{2g}(2\pi)^{-g(2j+1)}
|L_E(1+j,\overline\eta)|.
\tag{5}
~~~

To verify the constants, the residue of Gamma(s) at -j is (-1)^j/j!. The factors 2^g on the two sides of the functional equation cancel, and the root number has absolute value one.

The Euler product implies

~~~math
|L_E(1+j,\overline\eta)|
\le \zeta_E(1+j)
\le \zeta(1+j)^{2g}
\le \zeta(2)^{2g}.
~~~

Therefore

~~~math
\log^+|L_E^*(-j,\eta)|
\le
(j+\tfrac12)\log A
+2gj\log(j+1)
+2g\log\zeta(2).
\tag{6}
~~~

The same bound applies to the geometric mean over coefficient-field embeddings, since their characters have the same conductor. No Riemann hypothesis is used in (5) or (6).

For a scalar totally imaginary field L of degree n, set eta=1 and A=|D_L|. Formula (6) then bounds log^+|zeta_L^*(-j)| by a polynomial in j, n and log(2|D_L|). This is the analytic numerator needed after (1).

There is also a precise criticality issue. An integer r can be Deligne-critical for this gamma factor only if both Gamma_C(r) and Gamma_C(1-r) are regular. The first condition requires r>=1 and the second requires r<=0. Thus a finite-order Hecke character over a totally imaginary field has no critical integer. A parallel Tate twist shifts the two conditions and does not create one. A theorem interpolating critical twists must therefore be checked at the actual noncritical specialization used here.

## 3. The auxiliary torsion factor also has a sufficient bound

For any number field L of degree n and positive integer r, define

~~~math
w_r(L)=|H^0(L,\mathbb Q/\mathbb Z(r))|.
~~~

Then

~~~math
\log w_r(L)\le(nr+1)\log(4nr).
\tag{7}
~~~

Proof. Suppose the invariant group has an element of order ell^a. The image H of G_L in (Z/ell^a Z)^* has index at most n, and every h in H satisfies h^r=1.

For odd ell this unit group is cyclic. Consequently |H|<=r, so

~~~math
\varphi(\ell^a)\le nr,\qquad
\ell^a\le2nr,\qquad \ell\le nr+1.
~~~

For ell=2, the r-torsion subgroup of (Z/2^a Z)^* has at most 2r elements. This also covers a=1,2. It follows that 2^a<=4nr.

Each primary invariant subgroup is cyclic, as a subgroup of Q_ell/Z_ell. There are at most nr+1 possible primes, and the order of each primary factor is at most 4nr. Multiplying proves (7).

For r>=2, the exact sequence relating Z_ell(r), Q_ell(r) and Q_ell/Z_ell(r) identifies the torsion of H^1(O_L[1/ell],Z_ell(r)) with H^0(L,Q_ell/Z_ell(r)). Thus the product of the H^1-torsion factors in the integral special-value formula is w_r(L), subject to the same integral and local conventions as that formula.

This bound is deliberately crude. Its polynomial logarithmic dependence is sufficient for the intended scale.

## 4. A precise conditional regulator-to-window lemma

For a totally imaginary field L, define

~~~math
B_L(j)=\sum_\ell
\log\left|H^2(\mathcal O_L[1/\ell],\mathbb Z_\ell(j+1))\right|.
\tag{8}
~~~

For totally imaginary L, the sum in (8) is finite and has the exact interpretation

~~~math
B_L(j)=\log|K_{2j}(\mathcal O_L)|.
\tag{8a}
~~~

This includes ell=2: [Weibel, Algebraic K-Theory of Rings of Integers in Local and Global Fields](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf), Theorem 73, gives the direct sum of these H^2 groups over all primes. The strict Selmer group with coefficient Q_ell/Z_ell(-j) has Pontryagin dual injecting into the corresponding H^2 group, by the relevant Poitou–Tate exact sequence. Thus the scalar quantity in (1) is at most the sum of B_L(j) for 1<=j<t.

There is no real-place 2-cohomology term because L is totally imaginary. This fact, and the exact K-theory comparison (8a), do not determine the 2-primary factor of an analytic special-value formula.

Assume an **integral leading-term formula or inequality** in the explicitly normalized form

~~~math
B_L(j)
\le
\log|\zeta_L^*(-j)|
-\log R_{2j+1}(L)
+\log w_{j+1}(L)
+\Delta_{L,j}.
\tag{9}
~~~

Here R_(2j+1)(L)>0 is the higher regulator in the normalization used by the chosen formula. The nonnegative correction Delta_(L,j) must include any unresolved 2-primary, local, lattice, or comparison contribution. It is not permissible to call such contributions harmless without bounding them.

For a complete integral Lichtenbaum identity with matching conventions, (9) is the associated equality, with its explicitly prescribed correction. A theorem after inverting a prime, a rational equality, or a determinant-line identity without integral comparison does not by itself establish (9) with bounded Delta. For example, if the formula is only specified up to a factor 2^a, the adverse contribution max(0,-a log 2) must be included in Delta. An unspecified rational proportionality factor could contain the torsion being bounded.

Suppose that there are constants C>0 and A>=1, **fixed for the whole family before the moving scale and auxiliary primes are chosen**, such that

~~~math
\max\{0,-\log R_{2j+1}(L)+\Delta_{L,j}\}
\le C(1+j+[L:\mathbb Q]+\log(2|D_L|))^A
\tag{10}
~~~

for every required L and j>=1. Then (6), (7), (9), and (1) imply, for a new constant C' depending only on C and A,

~~~math
W_\eta(E,t)
\le C't
\bigl(1+t+[L:\mathbb Q]+\log(2|D_L|)\bigr)^{A+2}
+(t-1)\log m.
\tag{11}
~~~

Proof. Bound the leading term in (9) using (6) with g=n/2, and its torsion term using (7) with r=j+1. Both are bounded by a fixed polynomial of degree at most three in 1+j+n+log(2D). Add (10), increase the exponent to A+2 if needed, and sum over fewer than t weights. Finally apply (1). All terms are nonnegative after replacing the logarithm of the analytic numerator by its positive part, so this also justifies passage from finite sets of coefficient primes to the total sum.

For the archive's scale t=floor(x^401), suppose additionally that throughout the required family

~~~math
[L:\mathbb Q]+\log(2|D_L|)\le C_0x^{B_0}
~~~

with fixed constants C_0,B_0, and that the character order m is fixed or polynomially bounded in x. The right side of (11) is then x^O(1). For every fixed epsilon>0 it is eventually at most

~~~math
\exp(x^{\varepsilon/2}).
\tag{12}
~~~

The exponent placements are distinct: (12) is exp(x^(epsilon/2)), whereas the source budget is exp(x^epsilon / 2). For each fixed positive epsilon, (12) is eventually the smaller quantity. Thus (11) supplies a stronger arithmetic bound than the source requires. It does not establish the separate analytic host-selection and comparison inputs described in hecke-bootstrap.md.

The conclusion is conditional on both (9) and (10). Neither is inserted into the accepted RH archive merely because a paper has “main conjecture” or “Tamagawa number” in its title.

## 5. Relation to the classical regulator problem

This reduction is not a new general special-value principle. Soulé explicitly proposed obtaining improved torsion bounds from the Lichtenbaum leading-term formula and lower bounds for higher regulators in §5.4 of [A Bound for the Torsion in the K-Theory of Algebraic Integers](https://ems.press/content/book-chapter-files/27335), Documenta Mathematica, extra volume Kato (2003), 761–788. His §5.1 also formulates a conjectural exponential bound for K-theory torsion with the field degree fixed.

The point specific to the present transfer is the required quantifier order: the degree grows with x, so unquantified constants depending on each field degree are insufficient. Estimate (10), or a weaker estimate that still makes (11) at most (12), must hold uniformly across the moving family.

The coordinating worker independently checked (2), (5), the elementary cyclotomic-image proof of (7), and the conditional polynomial-to-window deduction (9)–(12). No gap was found in those deductions. This review does not assert either hypothesis (9) or (10).

## 6. Exact scope of the main-conjecture and ETNC results

The following primary results were checked at the level of their statements and the relevant comparison maps. None is being asserted to provide (10).

### 6.1. Coates–Sinnott selects the other parity

Gambheera–Popescu, [An unconditional equivariant main conjecture in Iwasawa theory and applications](https://link.springer.com/article/10.1007/s40687-025-00578-8), Theorem 7.14, proves a refined Coates–Sinnott Fitting-ideal identity for every n>=2 and odd p. Its idempotent is

~~~math
e_n(H/F)=
\prod_{v\mid\infty}\frac{1+(-1)^n c_v}{2}
\quad(F\text{ totally real}),
\qquad
e_n(H/F)=0\quad(F\text{ not totally real}).
\tag{13}
~~~

For a CM extension over a totally real field this becomes (1+(-1)^n c)/2. The group K_(2j) corresponds to n=j+1. Thus for even j the theorem controls the **minus** component; the hard scalar component in the present route is the plus component. With an imaginary quadratic base, (13) is zero and the displayed identity is vacuous. Removing a mu hypothesis from the theorem does not change this idempotent.

For a nonquadratic anticyclotomic eta, conjugation interchanges eta and eta^(-1). An individual eta constituent should not be assigned a plus or minus label without specifying the conjugation-stable representation containing it.

### 6.2. Noncritical imaginary-quadratic results do apply, but retain an index

| Primary source | Exact usable scope | Remaining issue for this route |
| --- | --- | --- |
| Johnson–Leung–Kings, [On the equivariant and the non-equivariant main conjecture for imaginary quadratic fields](https://arxiv.org/pdf/0804.2828), Theorem 5.2 and §5.3 | The characterwise main conjecture holds for every p. It identifies the determinant of the torsion quotient of a rank-one H^1 module by elliptic-unit classes with that of H^2. The equivariant version invokes Conjecture 5.5, a specified mu-vanishing statement, proved there for split p not dividing 6. | The quotient by the Euler-system lattice is precisely integral index information. Its existence or characteristic ideal does not give the uniform numerical upper bound (10). |
| Johnson–Leung, [The local equivariant Tamagawa number conjecture for almost abelian extensions](https://arxiv.org/pdf/1307.2607), Main Theorem and §2.1 | For L/K abelian with K imaginary quadratic, the local ETNC for h^0(Spec L)(r), r<0, holds at rational p not dividing 6 that split in K. The integral statement compares lattices after the archimedean Borel regulator and p-adic Chern-class maps. | This is genuinely a negative-weight result. Its split-prime statement cannot be promoted to an all-prime formula for the moving fields. Even where it applies, the higher regulator remains in the numerical comparison. |
| Bullach–Hofer, [The equivariant Tamagawa number conjecture for abelian extensions of imaginary quadratic fields](https://ems.press/content/serial-article-files/28566), Theorems A and B | The ETNC is proved at s=0 for abelian extensions of an imaginary quadratic field, at split p, and at nonsplit p under the semisimple or stated mu-vanishing alternatives. The paper also proves the relevant Iwasawa-theoretic Mazur–Rubin–Sano result. | A theorem at s=0 is not automatically an integral theorem for all negative Tate weights. No uniform all-weight regulator estimate is stated here. |
| Maksoud, [On generalized main conjectures and p-adic Stark conjectures for Artin motives](https://arxiv.org/pdf/2103.06864), §6.4–6.5 | Proposition 6.4.1 relates the CM main conjecture and an explicit reciprocity statement to the Artin Selmer main conjecture, under its splitting, character, and Rubin–Stark hypotheses. The imaginary-quadratic specialization has additional unconditional cases. Theorem 6.5.5 already proves Gross–Kuzmin for abelian extensions of imaginary quadratic fields at every odd p. | These are regulator-sensitive specializations. Gross–Kuzmin gives finiteness of the relevant coinvariants, rather than (10), and is not a new open target in this setting. |
| Büyükboduk–Sakamoto, [L-invariants, p-adic heights and factorization of p-adic L-functions](https://arxiv.org/pdf/2006.02264), §1.1 and §3 | The work studies noncritical Katz specializations under p-ordinarity and specified character assumptions. Theorem 1.2 uses Sigma-Leopoldt for an exact multivariate vanishing order. For the trivial-character cyclotomic restriction, §1.1.5 explicitly identifies the failure of the critical interpolation range. | The leading terms involve heights or regulators. Nonvanishing and exact vanishing order do not supply a uniform upper bound on their p-adic valuations. |

For the candidate host construction E/K abelian and eta pulled back from K, its kernel field L is also abelian over K: it is the compositum of E with the original kernel field over K. Thus the second row is relevant despite L possibly being non-CM. This avoids an unnecessary field restriction, but does not remove its prime restrictions or the quantitative regulator problem.

The named hypotheses appearing in these approaches are distinct:

- The **integral Lichtenbaum conjecture / ETNC** supplies a special-value identity with integral lattices.
- In the cited general CM noncritical arguments, **Rubin–Stark**, the **Iwasawa-theoretic Mazur–Rubin–Sano conjecture**, **Sigma-Leopoldt**, or a specified **Iwasawa mu-vanishing conjecture** appear in different comparison steps.
- The estimate still needed here is the quantitative lower bound (10), including the integral defect. A qualitative nonvanishing statement for a regulator is weaker than (10).

The list is not a claim that every named hypothesis remains necessary in every specialization. Some are proved in the imaginary-quadratic cases in the table. The point is to retain the exact theorem used, rather than substitute a broad label for its hypotheses and quantitative output.

## 7. What characteristic ideals alone leave uncontrolled

Two elementary module examples isolate the extra information a numerical use of a main conjecture would need. They are not examples of Hecke Selmer groups.

First, fix an odd p, a weight value u in p Z_p, and N>=1. Over Lambda=Z_p[[T]], set

~~~math
M_N=\Lambda/(T-u-p^N).
~~~

Every M_N has mu=0 and lambda=1. Nevertheless, at the specialization T=u,

~~~math
M_N\otimes_{\Lambda,T\mapsto u}\mathbb Z_p
\simeq\mathbb Z_p/p^N\mathbb Z_p.
\tag{14}
~~~

Thus the two Iwasawa invariants alone do not bound a chosen specialization. A bound must control proximity to the roots of the distinguished polynomial, or handle the exceptional weights separately. The sparse-window argument in moving-selmer-windows.md does the latter at a fixed finite set of coefficient primes, conditional on a uniform rank bound.

Second, let O be a discrete valuation ring with uniformizer pi, let Lambda_2=O[[T_1,T_2]], and choose a,b in pi O. The module

~~~math
P_N=\Lambda_2/(T_1-a,T_2-b,\pi^N)
~~~

is finite-length and has zero divisor at all height-one primes, hence trivial characteristic ideal. Its ordinary fiber at (a,b) is O/pi^N O. The corresponding derived specialization also has Tor terms. Passing to a characteristic ideal loses this finite-length information; bounding an individual cohomology group requires control of those terms or a stronger integral comparison.

These examples do not prove that an arithmetic main conjecture, together with additional structure of its actual Selmer complex, could never imply the required estimate. They show precisely why one must exhibit that additional comparison or bound.

The arithmetic worker's conditional sparse-window extension addresses fixed-prime specialization using a uniform bound on the relevant Iwasawa rank. It explicitly keeps the rank uniform across the auxiliary fields. It does not automatically control all coefficient primes, and a bound on a finite set of primes cannot replace the all-prime sum in (8).

## 8. Search scope and limits

Primary statements inspected for this branch include the six results in §6, the original Soulé regulator proposal in §5, and Johnston–Nickel's [An unconditional proof of the abelian equivariant Iwasawa main conjecture and applications](https://arxiv.org/pdf/2010.03186). The last concerns the relevant totally real Iwasawa setting; its title does not extend the controlled parity in (13) to all finite Hecke eigenspaces.

A further current search found El Boukhari's [A Coates–Sinnott-type Theorem for First Derivatives of Artin L-Functions](https://arxiv.org/abs/2608.01486), submitted August 2026. The author-supplied abstract states an ETNC-conditional annihilation result. Its full text was not retrieved during this pass, so it is not used to justify an integral identity or a quantitative bound here.

An independent literature audit also located de la Torre Durán's [Perfect Forms and Torsion Bounds in Algebraic K-Theory over Totally Real and CM Fields](https://arxiv.org/pdf/2611.06300v1), submitted 4 November 2026. Its Theorem 4.5 gives, with d=[F:Q], N=2m+1, and b=dN+1,

~~~math
\log\mathop{\mathrm{card}}_b K_m(\mathcal O_F)_{\rm tors}
\le
\exp\!\bigl(O(N^2d(\log N+\log d))\bigr)
|D_F|^{O(N^2)}.
\tag{15}
~~~

Here card_b removes all primes at most b, and the field is totally real or CM. This is a geometric improvement, but the bound for the logarithm remains exponential in the growing parameters. It does not control the omitted primes and does not automatically apply to the non-CM kernel field. Its stated theorem therefore does not give (11) at the required scale.

No source inspected in this pass supplied a bound of the form (10) uniform in the moving field, weight, and coefficient prime. This is a record of the audited inputs, not a claim of a mathematical impossibility or an exhaustive theorem about the literature.

## 9. Remaining obligation

The reusable output is the proved implication (9)+(10) => (11), with the analytic leading term and the auxiliary torsion factor completely estimated.

To turn it into a Hecke extension, one needs an applicable integral formula (9), and a bound for the adverse higher-regulator and integral-defect contribution whose constants are fixed before x and the auxiliary fields. A direct bound for the corresponding integral Euler-system index or Selmer specialization would serve the same purpose.

The accepted RH archive gives the separate source-specific arithmetic inputs summarized in hecke-bootstrap.md. The main-conjecture results inspected here have not yet replaced those inputs for a non-Dirichlet character.


## Internal review receipt

The arithmetic worker independently checked equations (8)–(11), including the direction of Poitou–Tate duality, descent of the scalar unramified classes to G_(L,S), and the all-prime K_(2j) comparison. No defect was found in the conditional deduction. The independent review supplied the precise source for (8a) and retained the unresolved integral special-value factor in (9)–(10).

These receipts record internal mathematical review. They do not establish the unproved regulator hypothesis, replace external review, or report Lean verification.

Updated November 20, 2026.
