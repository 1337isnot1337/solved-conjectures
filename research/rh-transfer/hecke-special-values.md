# Hecke characters, special values, and the remaining regulator bound

Status: conditional quantitative reduction and literature audit. No Hecke GRH theorem or new resolution of a named conjecture is claimed.

This note tests a route around the twisted automorphic deformation problem in [artin-density.md](artin-density.md). It uses complex functional equations, integral special-value formulas, and Iwasawa theory. The exact target is the moving-field, all-prime Selmer estimate required in [hecke-bootstrap.md](hecke-bootstrap.md), rather than finiteness at a fixed field and weight.

The accepted source remains the RH archive at commit [9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e). No Lean verification is performed.

## 1. Which size bound is needed

Write W_eta(E,t) for the sum, over coefficient primes and integers 1 <= j < t, of the normalized logarithmic sizes of the strictly unramified Selmer groups with coefficients eta times the negative Tate twist -j. The local condition at primes over the coefficient prime is splitting. The precise normalization and restriction map are fixed in [moving-selmer-windows.md](moving-selmer-windows.md).

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

The strict Selmer group with coefficient Q_ell/Z_ell(-j) has Pontryagin dual injecting into the corresponding H^2 group, by the relevant Poitou–Tate exact sequence. Thus the scalar quantity in (1) is at most the sum of B_L(j) for 1<=j<t.

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

For a complete integral Lichtenbaum identity with matching conventions, (9) is the associated equality, with its explicitly prescribed correction. A theorem after inverting a prime, a rational equality, or a determinant-line identity without integral comparison does not by itself establish (9) with bounded Delta.

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

This is stronger than the arithmetic bound on the selected windows. It does not establish the separate analytic host-selection and comparison inputs described in hecke-bootstrap.md.

The conclusion is conditional on both (9) and (10). Neither is inserted into the accepted RH archive merely because a paper has “main conjecture” or “Tamagawa number” in its title.

## 5. Relation to the classical regulator problem

This reduction is not a new general special-value principle. Soulé explicitly proposed obtaining improved torsion bounds from the Lichtenbaum leading-term formula and lower bounds for higher regulators in §5.4 of [A Bound for the Torsion in the K-Theory of Algebraic Integers](https://ems.press/content/book-chapter-files/27335), Documenta Mathematica, extra volume Kato (2003), 761–788. His §5.1 also formulates a conjectural exponential bound for K-theory torsion with the field degree fixed.

The point specific to the present transfer is the required quantifier order: the degree grows with x, so unquantified constants depending on each field degree are insufficient. Estimate (10), or a weaker estimate that still makes (11) at most (12), must hold uniformly across the moving family.

The coordinating worker independently checked (5) and the elementary cyclotomic-image proof of (7). This review does not assert (9) or (10).
