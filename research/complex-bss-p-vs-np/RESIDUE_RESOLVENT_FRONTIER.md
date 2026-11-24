# Exact residue resolvents and the marked-factor extraction frontier

Research checkpoint, 23 November 2026 (America/Chicago). The saturated-path construction gives a small polynomial `W` with one uniquely marked factor `R`: `R` is the only irreducible factor occurring with multiplicity `k`. This note gives two exact aggregate formulas for that factor. A deformation of a resultant ratio has a trailing coefficient equal to a nonzero scalar times a power of `R`. A rational Hermite reduction gives a positive integer times `R'/R` as its proper rational part. Neither formula supplies a polynomial-size circuit for the required resultant ratio or Hermite part. The remaining operation is explicit and is not replaced by individual-root jets or an HN zero test.

## 1. Input and a monic line

Work over `C`, with a coefficient vector `A=(A_1,...,A_n)`. Suppose

```math
W(A)=c\prod_p p(A)^{m_p}\ne0
```

has a division-free circuit of size `s`, where the product runs over its distinct nonconstant irreducible factors. Suppose exactly one such factor, denoted `R`, has multiplicity `k`. The construction in [MULTIPLICITY_MARKER.md](MULTIPLICITY_MARKER.md) supplies this situation from a saturated accepting path, with `s`, `n`, and `log(k+1)` polynomially bounded in the hypothetical BSS running time. Its degree `d` can still be exponential.

Choose a constant direction `v` at which the leading homogeneous part `W_d` does not vanish. Then `p_{d_p}(v)!=0` for every factor, where `d_p=deg p`. Put

```math
w(A,t)=\frac{W(A+tv)}{W_d(v)},
\qquad
\widehat p(A,t)=\frac{p(A+tv)}{p_{d_p}(v)}.
                                                        \tag{1}
```

These polynomials are monic in `t`, and `w=product_p widehat p^{m_p}`. The affine substitution has circuit cost `O(n)`; the normalization is one allowed nonzero complex constant. No coefficient list of length `d` is constructed.

The substitution `A -> A+tv` is an automorphism of `C[A,t]`. Each `p(A+tv)` is therefore irreducible there. Its nonzero constant leading coefficient makes it primitive as a polynomial over `C[A]`, so Gauss's lemma makes `widehat p` irreducible over `K=C(A)`. Distinct factors remain distinct, and characteristic zero gives separability. Thus the multiplicities of the distinct roots of `w` over an algebraic closure of `K` are exactly the `m_p`.

For the homogeneous resultant, `widehat R(A,u)=R(A+uv)/R(v)`. In particular `widehat R(A,0)` is a nonzero scalar times the original polynomial `R(A)`.

## 2. A resultant ratio with no uncancelled root-normalization factor

Use the derivatives of `w` in `t` and set

```math
A_0=(w')^2,
\qquad B_0=(w')^2-ww'',
\qquad \mu=\frac{A_0}{B_0}.                       \tag{2}
```

At a root `alpha` of `w` of multiplicity `m`, `mu` extends regularly and has value `m`; the local proof is in [SIGNED_MULTIPLICITY_RATIONAL_MAP.md](SIGNED_MULTIPLICITY_RATIONAL_MAP.md), Section 1. Since `w` is monic of degree `d`, the leading coefficient of `B_0` is `d`, and `deg_t B_0=2d-2`.

Let `delta,z,s,u` be independent indeterminates. Define the following rational function by its mathematical resultant expression:

```math
T_\delta(A,z,s,u)=
\frac{\mathop{\mathrm{Res}}_t
  \bigl(w-\delta,(z+s(u-t))B_0-A_0\bigr)}
 {\mathop{\mathrm{Res}}_t(w-\delta,B_0)}.          \tag{3}
```

The denominator is nonzero in `K(delta)`: a root of the fixed nonzero polynomial `B_0` cannot also satisfy `w=delta`, with `delta` transcendental over `K`. The polynomial `w-delta` is monic and separable over `K(delta)`. Write its `d` roots as `beta`, counted once each. The monic resultant product formula gives the exact identity

```math
T_\delta=
\prod_{\beta:w(\beta)=\delta}
    \bigl(z+s(u-\beta)-\mu(\beta)\bigr).          \tag{4}
```

Indeed, the numerator product contains one factor `B_0(beta)` for every `beta`; the denominator cancels their product exactly. No root-dependent leading coefficient remains.

As `delta` tends to zero, exactly `m_alpha` of the `beta` tend to each distinct root `alpha` of `w`. This follows either by formal Puiseux expansion over an algebraic closure of `K`, or by root continuity after a generic complex specialization of `A`. The leading coefficient of `w-delta` stays one, so no root escapes to infinity. Regularity of `mu` at `alpha` gives the coefficientwise limit

```math
T(A,z,s,u)
=\lim_{\delta\longrightarrow0}T_\delta(A,z,s,u)
=\prod_{\alpha\text{ distinct root of }w}
   \bigl(z-m_\alpha+s(u-\alpha)\bigr)^{m_\alpha}.
                                                        \tag{5}
```

This limit belongs to `C[A,z,s,u]`, rather than only to its rational function field. For each irreducible factor `p`, the contribution before its outer multiplicity is

```math
\prod_{\alpha:\widehat p(A,\alpha)=0}
  \bigl(z-m_p+s(u-\alpha)\bigr)
=s^{d_p}\widehat p\left(A,u+\frac{z-m_p}{s}\right).
                                                        \tag{6}
```

The negative powers of `s` cancel because `widehat p` has degree `d_p`. Equation (6) also proves the polynomial assertion algebraically, independently of a chosen labeling of the roots.

## 3. The marked factor is an exact trailing coefficient

Specialize `z=k`. The marked factor contributes `s^{k d_R} widehat R(A,u)^k`. Every other factor has a nonzero constant term in `s`, because its multiplicity differs from `k`. Consequently, with `E=k d_R`,

```math
[s^E]T(A,k,s,u)=C_W\widehat R(A,u)^k,
\qquad
[s^j]T(A,k,s,u)=0\quad(0\le j<E),                \tag{7}
```

where

```math
C_W=\prod_{p\ne R}(k-m_p)^{m_p d_p}\ne0.         \tag{8}
```

The normalization `C_W` is a complex scalar independent of `A` and `u`. Its use as a circuit constant is allowed in the nonuniform border lower-bound argument. It is not claimed that a BSS machine can discover the marker or this scalar in polynomial time.

If `T` had a small polynomial circuit, its trailing coefficient in (7) would be border-small by substituting `s=epsilon`, multiplying by the scalar `epsilon^{-E}`, and taking the coefficientwise limit. This charges the substitution and scalar multiplication, without charging `E` as a unary parameter. If one instead insists on an explicit rational power expression in the auxiliary parameter, repeated squaring costs `O(log(E+1))`, which is polynomial for the marked-path construction.

At a center where `R!=0`, the normalized degree-`D` jet of `R` is obtained from that of `R^k` by the finite binomial series

```math
\left(\frac{R(b+h)^k}{R(b)^k}\right)^{1/k}
\equiv
\sum_{j=0}^{D}\binom{1/k}{j}
 \left(\frac{R(b+h)^k}{R(b)^k}-1\right)^j
                 \pmod{(h)^{D+1}}.              \tag{9}
```

The coefficients in (9) are allowed constants, and the truncated computation has polynomial overhead in `D`, independent of `k`.

A small *rational* circuit for the particular function `T_delta` would already suffice for these low-order jets. At a common generic center in `(A,u)`, evaluate that circuit in the truncated ring of Taylor series through degree `D`. Each intermediate denominator has nonzero constant term on a nonempty open set of centers and auxiliary parameters; its inverse is computed by a finite geometric series. The overhead is at most

```math
C(L+n+1)(D+1)^3,                                \tag{10}
```

if the rational circuit has size `L`. First take the `delta -> 0` limit in the finite-dimensional coefficient space of these jets. Next let `z -> k`, then apply the normalization `s^{-E}` and let `s -> 0`. Generic values of `z` may be used before its limit so that an intermediate circuit denominator such as `z-k` does not invalidate the evaluation. Equations (5)--(8) prove that the resulting jet limits exist. The same procedure applies to the normalized target jets in (9). Moving generic centers to the desired center with `R!=0` is valid because the target normalized jets are holomorphic there and the fixed-degree border complexity class is closed. This is the finite-dimensional closure/transitivity argument of Bürgisser, arXiv:1812.06828v1, Lemma 2.3 and Theorem 2.4; it does not assume that rational functions themselves are polynomial approximants.

Taking the full coefficient-space jet first, then the affine BCJS grid pullback, would therefore give the permanent contradiction if `L` were polynomially bounded in the supplied circuit size and logarithmic degree. The deformation has solved the algebraic selection and normalization problem. It has not proved that bound on `L`.

## 4. The conventional cost is exponential in the supplied circuit length

The two resultants in (3) have degrees

```math
\deg_t(w-\delta)=d,
\qquad \deg_t B_0=2d-2,
\qquad
\deg_t\bigl((z+s(u-t))B_0-A_0\bigr)=2d-1.        \tag{11}
```

The leading coefficient in the last expression is `-sd`. The corresponding Sylvester matrices have sizes `3d-2` and `3d-1`. A norm computation in `K(delta)[t]/(w-delta)` instead has rank `d`. Neither formulation reduces the rank to the number of circuit gates. Writing the coefficient vectors in the conventional construction already has length proportional to `d`.

For the marker construction, `d<=B^{r+1}-1`, where `B=2^{s_0}+1` and `s_0,r` are polynomial in the hypothetical machine time. Thus this exact determinant or multiplication-matrix construction has an exponential dimension in the available input parameters. A determinant representation by itself does not imply a small arithmetic circuit here.

An HN oracle can test whether a particular numerator resultant vanishes: it asks whether there exists `t` satisfying the two supplied small circuit equations. That is a zero test. It does not compute the value of the numerator, denominator, or quotient (3). A generic branch of such a decider supplies another small multiple of the relevant elimination polynomial, with an uncontrolled cofactor. Its leading coefficient need not equal (7).

## 5. A Hermite formulation whose rational part is already the aggregate

There is a second exact formula that avoids writing (3), but replaces it by an unresolved rational-part computation. In this section let `K` be any characteristic-zero field and let

```math
w(t)\in K[t],\qquad
\omega=\frac{w'}w,
\qquad \mu=-\frac{\omega^2}{\omega'}.
```

Assume an irreducible factor `r(t)` is the unique irreducible factor of `w` with multiplicity `k`. If `mu` is identically `k`, the identity `(1/omega)'=1/k` gives `omega=k/(t-a)` for some `a in K`; hence `w=c(t-a)^k`. The marked factor is linear and already has a size-`O(1)` circuit over `K`. We now treat `mu!=k`.

Define the short rational function

```math
H_k(t)=-\frac1k\,\omega(t)
              \frac{\mu'(t)}{\mu(t)-k}.           \tag{12}
```

Three derivatives of the supplied circuit for `w` suffice to compute (12), with constant-factor overhead in its size. This statement concerns rational functions: it does not claim their unreduced graph equations have the same fibers at poles or basepoints.

At a root `alpha` of `r`, let

```math
q=\mathop{\mathrm{ord}}_\alpha(\mu-k)\ge1.
```

The order is the same at all conjugate roots of `r`, since `r` is irreducible and the rational function `mu-k` belongs to `K(t)`. Write `v=t-alpha`. The local expansions are

```math
\omega=\frac{k}{v}+h(v),
\qquad
\frac{\mu'}{\mu-k}=\frac qv+g(v),
```

with `h,g` regular. Hence

```math
H_k=-\frac{q}{v^2}+\frac{c_\alpha}{v}
                        +\text{a regular term}.  \tag{13}
```

Every other finite pole of `H_k` is simple. At an unmarked root of `w`, `mu-k` is a nonzero regular function, so only the simple pole of `omega` remains. At a zero or pole of `mu-k` away from the roots of `w`, its logarithmic derivative has a simple pole and `omega` is regular. These statements exhaust the possible poles. At infinity, `omega=d/t+O(t^{-2})`, while the logarithmic derivative of the rational function `mu-k` is `O(t^{-1})`; thus `H_k=O(t^{-2})`.

Define the proper rational part of Hermite reduction as the unique proper rational function `J(t)` such that `H_k-J'` has at most simple finite poles. Uniqueness follows because the derivative of a nonzero proper rational function with a finite pole has a pole of order at least two. Equation (13) and the absence of other higher poles give

```math
J(t)=q\sum_{\alpha:r(\alpha)=0}\frac1{t-\alpha}
    =q\frac{r'(t)}{r(t)}.                        \tag{14}
```

Thus this rational part is the desired aggregate logarithmic derivative, with a single positive integer scalar. No enumeration of the roots appears in (12); it appears in the proof of what the Hermite part must equal.

### 5.1. A nonlinear target has `q=1` in a generic direction

For the application, the scalar in (14) can be made exactly one. Suppose `R` is a nonlinear irreducible polynomial over `C` and write `W=R^k h`, with `R` not dividing `h`. Let `partial_v` be differentiation in a constant direction `v`. In the local ring at the generic point of `R=0`, choose `v` with `partial_v R!=0`. Expanding `omega=k(partial_v R)/R+(partial_v h)/h` gives

```math
\mu-k\equiv
R\,\frac{k h\,\partial_v^2R
       +2(\partial_vR)(\partial_vh)}
          {h(\partial_vR)^2}
                    \pmod{R^2}.                 \tag{17}
```

Here `h` and `partial_v R` are units at the generic point. Therefore `q=1` whenever the numerator

```math
T_v=k h\,\partial_v^2R
                   +2(\partial_vR)(\partial_vh)  \tag{18}
```

does not vanish modulo `R`.

Suppose, for contradiction, that `R` divided (18) for every constant direction. On the nonempty smooth open subset of `R=0` where `h!=0`, take any tangent vector `v` at a point. Its first directional derivative of `R` is zero, so (18) gives `Hess_R(v,v)=0`. Polarization gives `Hess_R(v,w)=0` for every pair of tangent vectors.

Near a smooth point, express the hypersurface analytically as `A_n=f(A_1,...,A_{n-1})`, after a constant linear coordinate change. Differentiating the identity `R(A',f(A'))=0` twice gives

```math
\mathop{\mathrm{Hess}}_R(\tau_i,\tau_j)
       +(\partial_nR)\partial_i\partial_j f=0,
\qquad \tau_i=e_i+(\partial_i f)e_n.
```

The tangent Hessian terms vanish and `partial_nR!=0`, so every second derivative of `f` vanishes. On a connected neighborhood the function `f` is affine linear. The polynomial `R` thus vanishes on an open subset of a hyperplane and hence on the entire hyperplane. Irreducibility forces `R` to be linear, contrary to the assumption.

It follows that (18) is nonzero modulo `R` for a nonempty Zariski open set of directions: its coefficients are polynomial in `v`, and the condition that its class modulo `R` be zero is closed. Intersect with the open condition that `partial_vR` is nonzero. For those directions, (17) proves `q=1`.

The same conclusion holds for the family `W(b+tY)` for a generic fixed center `b`. Replace `v` in (18) by `A-b`; the variable change between `(A,v)` and `(A,b)` is invertible, so the resulting polynomial is still nonzero modulo `R(A)`. For generic `b`, it remains nonzero in `C[A]/(R)`. Choose such a `b` with `W(b)!=0`. Under `A=b+tY`, homogeneity of (18) in its direction gives `T_Y=t^{-2}T_{A-b}`. At a root of `R(b+tY)`, the parameter `t` is nonzero because `R(b)!=0`. Thus this substitution preserves the nonvanishing of the first coefficient in (17) in the local ring. The marked factor in that family has `q=1`, and its Hermite part is exactly `partial_tR(b+tY)/R(b+tY)`.

## 6. Exactly what a short Hermite-part circuit would imply

Apply Section 5 to `w(Y,t)=W(b+tY)`, where `b` is a generic constant point with `W(b)!=0` and `Y` is a vector of variables. Every irreducible factor `p(b+tY)` has nonzero constant term in `t`. Localizing at `t` identifies the substitution `A=b+tY` with a polynomial change of variables over `C[t,t^{-1}]`; it preserves irreducibility. Since no factor is `t` and the nonzero constant term makes the `t`-polynomial primitive over `C[Y]`, the distinct irreducible factors stay distinct over `C(Y)[t]`. The marked factor is therefore `r(Y,t)=R(b+tY)` up to a scalar. In the exceptional case `mu=k`, the constant value `w(Y,0)=W(b)` gives

```math
w(Y,t)=W(b)(1+t\ell(Y))^k,
\qquad
\ell(Y)=\frac{\sum_i(\partial_iW)(b)Y_i}{kW(b)}.
```

Thus `R` is affine linear in the original coefficient variables and has a size-`O(n)` circuit using these complex coefficients. This handles the exception over the original constant field, rather than treating arbitrary rational functions of `Y` as free constants.

Suppose the proper rational part in (14), for this restricted family (12), had a rational circuit of size polynomial in `s,n,log(k+1)`. After division by the allowed scalar `q`, it would compute

```math
\frac{\partial_tR(b+tY)}{R(b+tY)}.                \tag{15}
```

Its Taylor coefficients in `t` through degree `D-1` are polynomials in `Y`: the denominator at `t=0` is the nonzero constant `R(b)`. Integrating this finite series term by term and exponentiating through degree `D` gives

```math
\frac{R(b+tY)}{R(b)}\pmod {t^{D+1}}.              \tag{16}
```

The integration divides only by the integers `1,...,D`; the finite exponential and all truncations have polynomial circuit cost. If the proposed rational circuit has displayed denominator basepoints at `t=0` or at a chosen `Y`, compute finite jets at generic nearby centers first and take their coefficientwise limit. The target function (15) is holomorphic near `(Y,t)=(0,0)`, because `R(b)!=0`. Take its total degree-`(2D-1)` jet in `(Y,t)` and retain the coefficients of `t^j` for `0<=j<D`. These contain exactly the desired coefficients: the coefficient of `t^j` in (15) is homogeneous of degree `j+1` in `Y` and hence has total degree `2j+1`. Coefficient extraction from this bounded-degree polynomial costs only polynomially many operations in `D` by interpolation in `t`. Thus no uncharged full-degree division elimination is used.

Setting `t=1` in the truncated expression (16) gives the normalized degree-`D` coefficient-space jet of `R` at `b`. Generic centers can then move to the BCJS base center, where `R=1`, before applying the affine grid pullback. Therefore a degree-independent polynomial circuit bound for the particular Hermite rational parts (12) would suffice for the full resultant lower-bound route.

The classical coefficient-array Hermite computation depends on the denominator degrees. The partial-fraction definition (14) is not an algorithm with cost polynomial in `s`, and a squarefree factorization or a linear system of rank proportional to `deg w` has not been made cheap by the short formula (12). The exact surviving frontier is a circuit bound for these aggregate rational parts, or for the equivalent sufficient resolvent computation in Section 3. No such bound is proved here.

## 7. Scope

The identities (3)--(8) and (12)--(14) are proved. Their use in (9), (10), and (15), (16) is a conditional extraction argument with charged finite truncations and border limits. The missing premise is the polynomial circuit bound for the aggregate resultant ratio or the indicated Hermite part. The note does not assert general radical closure, does not interpret a zero test as value computation, and does not claim the full `P_C!=NP_C` separation.
