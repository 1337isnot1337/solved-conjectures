# Tagged resultant roots and the remaining trace operation

Research status, 23 November 2026. This note writes the exact trace required by the incidence-tagged logarithmic-derivative attack. It then gives a concrete hard trace with both a small irreducible annihilating polynomial and a small polynomial observable. The example obstructs a general degree-independent trace algorithm. It does not refute a theorem specific to resultant-tagged reciprocal powers, and does not settle the complex BSS separation.

## 1. The trace that the resultant attack needs

Let `R_N(A)` be the irreducible resultant of `N` homogeneous quadrics in `N` variables. Its total degree is

```math
d_N=N2^{N-1}.
```

Suppose a hypothetical small decision tree supplies a nonzero polynomial

```math
F(A)=R_N(A)^e Q(A),\qquad e\ge1,\quad R_N\nmid Q.
```

Choose a constant coefficient point `a` with `R_N(a)Q(a)!=0`, and let `U` be a full vector of independent direction variables. Over `K=C(U)`, put

```math
r(t)=R_N(a+tU),\qquad f(t)=F(a+tU).
```

The polynomial `r` has degree `d_N`, nonzero constant coefficient, and is irreducible over `K`. To verify irreducibility, the substitution `A=a+tU` identifies the Laurent polynomial rings `C[A,t,t^(-1)]` and `C[U,t,t^(-1)]`. The prime polynomial `R_N(A)` remains prime after adjoining and inverting `t`. Its transformed polynomial has no factor `t`, because `r(0)=R_N(a)!=0`, so it is irreducible already in `C[U,t]`. Its constant coefficient is a nonzero scalar, making it primitive as a polynomial in `t`; Gauss's lemma gives irreducibility over `K`. Characteristic zero implies separability.

Write `alpha_1,...,alpha_d` for its roots in an algebraic closure of `K`, where `d=d_N`. Formal expansion at `t=0` gives

```math
\log\frac{r(t)}{r(0)}
=\sum_{i=1}^{d}\log(1-t/\alpha_i)
=-\sum_{j\ge1}\frac{t^j}{j}
  \sum_{i=1}^{d}\alpha_i^{-j}.                  \tag{1}
```

Thus a degree-`D` Taylor jet of the normalized resultant can be recovered from the first `D` reciprocal power traces

```math
s_j=\mathop{\mathrm{Tr}}_{K[t]/(r)\,/\,K}(t^{-j}),
\qquad 1\le j\le D.
```

The target order in the BCJS coefficient extraction is polynomial in `N`, but the extension degree `d_N` is exponential.

The original NP incidence identifies exactly which roots of `f` belong to `r`. Over an algebraic closure of `K`, the tag is the existence of vectors `w,v` satisfying

```math
\sum_{1\le j\le k\le N}(a_{i,j,k}+tU_{i,j,k})w_jw_k=0
\quad(1\le i\le N),
\qquad \sum_{j=1}^{N}v_jw_j=1.                 \tag{2}
```

These equations have `O(N)` witnesses and `O(N^3)` gates. After a complex specialization of the coefficient direction, they are the original complex incidence. They certify membership of an individual root in the resultant factor. They do not sum over its conjugates.

For an exact algebraic formulation, let `f_sf` denote the squarefree part of `f`, and define the finite reduced algebra `B=K[t]/(f_sf)`. Neither computing `f_sf` nor writing its coefficient list is assumed to be cheap. There is a unique CRT idempotent `e_r` in `B` whose value is one on roots of `r` and zero on the other roots. Then

```math
s_j=\mathop{\mathrm{Tr}}_{B/K}(e_r t^{-j}).       \tag{3}
```

Equivalently this is the sum of the residues at the roots of `f_sf` of

```math
e_r(t)t^{-j}\frac{f_{sf}'(t)}{f_{sf}(t)}\,dt.
```

The small incidence (2) specifies the idempotent pointwise but gives no small circuit for it, no small multiplication matrix for it, and no small trace circuit. Dense CRT or quotient-algebra methods use a basis with at least `d_N` elements. The unproved operation is selecting the full irreducible factor's contribution and summing all its conjugates with degree-independent circuit cost. Local root or Taylor-jet calculations do not perform that sum.

## 2. A small annihilator and a small observable can have a hard trace

Fix `m>=1`, set `D=2^m`, and choose a primitive `D`-th root of unity `zeta`. The constants below may depend on `m`, as allowed by the nonuniform circuit model and the imported lower bound.

Define polynomial circuits in one variable `t` recursively by

```math
U_0(t)=t,
```

and, for `0<=j<m`,

```math
B_j(t)=\frac{1-U_j(t)^{2^{m-j-1}}}{2},
\qquad
U_{j+1}(t)=U_j(t)
  \bigl(1+(\zeta^{-2^j}-1)B_j(t)\bigr).          \tag{4}
```

Every power in (4) is computed by repeated squaring. The total number of squarings is `m(m-1)/2`, and the remaining updates have `O(m)` gates. All outputs share the earlier subcircuits, so the whole family has `O(m^2)` gates.

**Bit identity.** Write `a=sum_{j=0}^{m-1}2^j b_j(a)`, with `0<=a<D` and binary digits `b_j(a)`. Then

```math
B_j(\zeta^a)=b_j(a).
```

**Proof.** Inductively,

```math
U_j(\zeta^a)
=\zeta^{a-\sum_{\ell\lt j}2^\ell b_\ell(a)}.
```

The exponent is divisible by `2^j`. Raising to `2^(m-j-1)` gives `(-1)^(b_j(a))`. The first equation of (4) therefore returns the bit `b_j(a)`. The second equation multiplies by `zeta^(-2^j b_j(a))`, removing that bit and proving the next induction step. QED.

For an `m` by `m` variable matrix `X`, define the Ryser kernel

```math
K_X(b)=\prod_{j=0}^{m-1}(2b_j-1)
       \prod_{i=1}^{m}\left(\sum_{j=0}^{m-1}X_{i,j+1}b_j\right),
```

and the polynomial observable

```math
H_m(X,t)=K_X(B_0(t),\ldots,B_{m-1}(t)).          \tag{5}
```

It has an `O(m^2)`-gate circuit, with sharing. For completeness,

```math
\sum_{b\in\{0,1\}^m}K_X(b)=\mathop{\mathrm{per}}_m(X).
```

Expanding the product of row sums, a chosen assignment of rows to columns contributes a product of factors `sum_{b_j=0}^1(2b_j-1)b_j^(n_j)`, where `n_j` is the number of rows assigned to column `j`. This factor is zero when `n_j=0` and one when `n_j>0`. Since there are `m` rows and `m` columns, the surviving assignments are exactly permutations, proving the identity for arbitrary complex `X`.

Now consider the algebra

```math
\mathcal A_m=\mathbb C[X,z][t]/(t^{2^m}-z).
```

It is free of rank `D` over `C[X,z]`, with basis `1,t,...,t^(D-1)`. Its defining polynomial has `O(m)` gates. Over `C(X,z)` it is irreducible, by Eisenstein at the prime `z` in the UFD `C(X)[z]`; it therefore defines a field extension of degree `D`.

Let

```math
T_m(X,z)=\mathop{\mathrm{Tr}}_{\mathcal A_m/\mathbb C[X,z]}
          (\text{multiplication by }H_m(X,t)).
```

This is a polynomial in `X,z`: reduction modulo the monic relation gives a multiplication matrix with polynomial entries. Specialization at `z=1` commutes with its trace, since trace is the sum of the matrix's diagonal entries in the stated free basis. At `z=1`, CRT decomposes the algebra into its `D` distinct roots of unity. Equations (4) and (5) give

```math
T_m(X,1)
=\sum_{a=0}^{D-1}H_m(X,\zeta^a)
=\sum_{b\in\{0,1\}^m}K_X(b)
=\mathop{\mathrm{per}}_m(X).                   \tag{6}
```

The incidence and observable can also be presented with polynomially many quadratic equations: use a repeated-squaring chain for `t^(2^m)=z` and one auxiliary variable for each gate in the circuit for `H_m`.

## 3. Consequence and exact limitation

Under the pinned permanent border lower bound, the trace polynomial `T_m` cannot have polynomial border circuit size, because its specialization (6) is the permanent. In particular there is no universal bound polynomial in the circuit sizes of a monic irreducible annihilator and a polynomial observable, together with the logarithm of the extension degree, for the border complexity of their trace. Here those circuit sizes are `O(m)` and `O(m^2)`, and the logarithm of the extension degree is `m`.

This gives a concrete obstruction to replacing the exponential conjugate sum in (1)–(3) by an unspecified efficient trace or residue operation merely because the defining equations and arithmetic observable have small circuits. A direct quotient-algebra calculation uses `2^m` basis elements even in this example.

The example does **not** prove that every method must enumerate those elements, and it does not refute a theorem exploiting additional structure of quadratic resultants. Bounds depending polynomially on the extension degree or on the observable's formal degree are also left untouched. Its hard observable is `H_m(X,t)`, not the restricted reciprocal powers `t^(-j)` in (1). Nor does it prove that a generic small multiple of a resultant exists. A successful resultant-specific argument would have to prove that the supplied multiple and incidence permit the tagged reciprocal traces to be computed with a polynomial bound. That operation remains unproved here.

The resultant degree and incidence facts are documented with primary references in [INCIDENCE.md](INCIDENCE.md), Sections 2–3. The bit construction, free-algebra specialization argument, and trace identity above are proved explicitly. The lower bound is a consequence of the pinned permanent theorem adopted by the repository; no new proof of that theorem, novelty claim, Lean verification, or full BSS separation is claimed.
