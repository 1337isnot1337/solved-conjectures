# Rational torsion in a polynomial elliptic family

Status: research. This note records a routine consequence of Mazur's theorem
and the standard division-polynomial identities. It is a restriction on one
possible construction, not a lower bound for general straight-line programs.
The tau conjecture and the consecutive-root all-multiples problem remain open
in this work. No novelty claim is made.

## 1. Imported statements and checked versions

1. Barry Mazur, *Modular curves and the Eisenstein ideal*, Publications
   Mathématiques de l'IHÉS **47** (1977), 33–186. Theorem (7′), in the
   introduction on printed page 35, states that a rational torsion point on
   an elliptic curve over `Q` has order at most ten or exactly twelve.
   Theorem (8) immediately gives the full torsion-group classification.
   The primary theorem text was checked at
   <https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>.

2. Katherine E. Stange, *Integral Points on Elliptic Curves and Explicit
   Valuations of Division Polynomials*, Canadian Journal of Mathematics
   **68**(5) (2016), 1120–1158, DOI 10.4153/CJM-2015-005-0.
   Proposition 2.1 identifies the zeros of the division polynomial `Psi_n`
   with the nonidentity `n`-torsion points. Proposition 2.2(i) states its
   weighted homogeneity of weight `n^2-1`, for weights
   `w(x)=2`, `w(y)=3`, and `w(a_i)=i`. Proposition 2.2(v) gives
   `Psi_n | Psi_m` when `n | m`. These numbered statements were checked
   in the published primary PDF:
   <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/41542AA1CA680CB762422184B9DAE66C/S0008414X00004466a.pdf/integral_points_on_elliptic_curves_and_explicit_valuations_of_division_polynomials.pdf>.

The corresponding arXiv version is 1108.3051v4, dated December 29, 2014;
the published proposition numbers above are used throughout this note.

## 2. A root bound independent of the multiplication index

### Proposition 2.1

Let `A,B,X,Y in Q[t]` have degrees at most `delta >= 0`, where zero
polynomials are allowed. Suppose


```math
Y(t)^2=X(t)^3+A(t)X(t)+B(t),\qquad
\Delta(t)=-16\bigl(4A(t)^3+27B(t)^2\bigr)\ne0.
```


Let `Psi_m` be the standard division polynomial of the short Weierstrass
equation `y^2=x^3+Ax+B`. For any integer `m>=1`, put


```math
H_m(t)=\Psi_m\bigl(X(t),Y(t);A(t),B(t)\bigr).
```


If `H_m` is not the zero polynomial, it has at most


```math
262\,\delta
\tag{2.1}
```


distinct rational roots, and therefore at most that many integer roots.

**Proof.** Over the function field `Q(t)`, the discriminant hypothesis
defines an elliptic curve and the polynomial coordinates define an affine
point `P`. For each `n | m`, the polynomial `H_n` is nonzero: otherwise
Stange's Proposition 2.1, applied over this characteristic-zero function
field, would give `[n]P=O`, hence `[m]P=O`, and then `H_m=0`.
Equivalently, this follows from the division identity in Proposition 2.2(v).

Let `a in Q` satisfy `H_m(a)=0` and `Delta(a)!=0`. The specialized curve
is elliptic over `Q`, and `P_a=(X(a),Y(a))` is an affine rational point.
By Proposition 2.1 of Stange it is nonidentity torsion, with exact order
`n | m`. Mazur's Theorem (7′) implies


```math
n\in\mathcal M=\{2,3,4,5,6,7,8,9,10,12\}.
```


Consequently every rational root of `H_m` is a zero of the nonzero
polynomial


```math
G_m(t)=\Delta(t)
\prod_{\substack{n\in\mathcal M\\n\mid m}}H_n(t).
\tag{2.2}
```


The product is interpreted as one if its indexing set is empty. This also
handles `m=1` and generic torsion sections whose orders do not divide `m`.

After setting `a_1=a_2=a_3=0`, `a_4=A`, and `a_6=B`, the remaining
variables in `Psi_n` have weights `2,3,4,6`. Weighted homogeneity therefore
bounds the ordinary total degree of `Psi_n(X,Y;A,B)` by `(n^2-1)/2`.
Substitution of the input polynomials yields


```math
\deg H_n\le\frac{n^2-1}{2}\,\delta,
\qquad \deg\Delta\le3\delta.
```


Finally,


```math
\sum_{n\in\mathcal M}(n^2-1)=518,
\qquad
\deg G_m\le3\delta+\frac{518}{2}\delta=262\delta.
```


A nonzero polynomial has at most its degree many distinct roots. Applying
this to (2.2) proves (2.1). If `delta=0`, the nonzero polynomial `H_m` is
constant and has no roots, so the same bound holds. QED.

### Corollary 2.2. Removing the large multiplication index from a root cover

Assume also that `A,B,X,Y in Z[t]` have a shared constant-free program of
length `s`. There is an absolute constant `C_0` such that the nonzero
polynomial `G_m` in (2.2) can be computed by a constant-free program of
length at most `s+C_0`, for every admissible `m`. Every integer root of
`H_m` is an integer root of `G_m`.

**Proof.** There are only ten fixed universal polynomials `Psi_n` with
`n in M`, together with the discriminant polynomial. Each has an integer
coefficient division-free program of some fixed finite length, with every
integer coefficient constructed from one. Append the required fixed
programs to the shared input program and multiply their outputs. Their
total number and their gate costs are absolute constants. The selected
subset may depend on `m`, which is permitted for the existence statement
about a straight-line program. The proof of Proposition 2.1 proves both
nonvanishing and containment of the root sets. QED.

## 3. Scope of the consequence

The degree of `H_m` can grow quadratically with `m`, while its rational-root
count in Proposition 2.1 remains bounded by a constant times the degree of
the original curve and section. Rational specialization supplies information
that the raw degree of the large division polynomial does not contain.

In particular, a family with input degree bounded independently of `N`
cannot produce a nonzero multiple of `F_N` merely by increasing the
multiplication index `m`. This addresses exact torsion specialization over
`Q`. Torsion after reduction modulo primes does not satisfy Mazur's rational
torsion restriction and cannot be substituted into this argument.

Corollary 2.2 is stronger than a degree comparison: even when the input
polynomials have very large degrees, increasing `m` does not create integer
roots beyond those of a nonzero polynomial obtained from the same inputs
with a fixed additional gate cost. A counterexample obtained by this route
would already give a counterexample among these bounded-index expressions.

The theorem does not bound zeros of an arbitrary cofactor multiplied onto
`H_m`. It also does not assert a polynomial relation between `delta` and
the circuit size of `A,B,X,Y`: repeated squaring can make `delta`
exponential. Thus it gives no new bound for an unrestricted constant-free
program. The genus-two discussion in [ARITHMETIC.md](ARITHMETIC.md) treats a particular marked family via
good reduction; no uniform genus-two rational torsion theorem is imported.
