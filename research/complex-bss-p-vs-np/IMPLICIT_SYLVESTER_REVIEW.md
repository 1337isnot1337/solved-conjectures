# Independent review of implicit Sylvester and compressed-matrix claims

Research review, 23 November 2026 (America/Chicago). Read the full current
[`IMPLICIT_SYLVESTER_FRONTIER.md`](IMPLICIT_SYLVESTER_FRONTIER.md).
The later Sections 3.1 and 4.1 additions were reviewed separately and also
pass.
No defect found. The reviewed claims are exact algebraic identities and
the conditional use of the standing permanent border lower bound. This
is not formal verification or a Sylvester-specific lower bound.

## Sylvester kernels

For `f=Rf_0` and `g=Rg_0`, coprimality of `f_0,g_0` gives
`f_0u=-g_0v` only when `u=g_0h,v=-f_0h`. The degree conditions in the
specified domain become exactly `deg h<deg R`. Thus the right kernel and
its dimension are correct. In the squarefree case, common-root
evaluations annihilate the image and are independent by Vandermonde
interpolation, giving the full left kernel.

The single-root right nullvector is also correct. The divided-difference
rule

```math
\Delta(pq)=p(t)\Delta q+q(\alpha)\Delta p
```

uses only a constant number of gates per original arithmetic gate while
preserving sharing. When `p(alpha)=0`, it computes the polynomial
`p(t)/(t-alpha)` without a division gate. The construction works with
`alpha` as an additional supplied witness coordinate; it does not compute
an algebraic function of the original parameters for free. This vector
uses `h=R/(t-alpha)`, so it supplies no circuit for the primitive generator
`(g_0,-f_0)`.

The reciprocal trace formula for squarefree `R` is exact, whether or not
`R` is irreducible. The quotient algebra has dimension `deg R`; knowing
that dimension or one root does not perform the displayed trace. The
middle-coefficient example correctly distinguishes a short circuit for a
polynomial from cheap access to all its coefficient-vector matrix entries.

## The later two-gcd identity

For unreduced `H=N/D`, characteristic zero gives `ord_p D'=d-1` at
every irreducible factor of multiplicity `d` in `D`. Therefore the
quotient `gcd(D,D')/gcd(N,D,D')` has multiplicity
`max(d-n-1,0)`, exactly as claimed. Under the at-most-double-pole
hypothesis it is the squarefree double-pole support, even when the
supplied numerator and denominator have large common factors. Constant
denominators and zero numerators give quotient one.

When all double-pole coefficients are `-1`, the proper Hermite part is
`R'/R`: its derivative has just those double coefficients. The logarithmic
gcd identity follows. Parameter-only content factors in multivariate gcds
do disappear under differentiation in `t`. Normalized jets through order
`D_0+1` suffice after one differentiation and truncated inversion; moving
centers is valid for the combined target wherever it is holomorphic.

The final squarefree-pair addition is also correct. For nonzero squarefree
`f,g`, the rational function `-(f'/f)(g'/g)` has double coefficient `-1`
at a common root and at most a simple pole at every other root. There are
no other finite poles, and the function is `O(t^-2)` at infinity. Thus its
proper Hermite part is exactly the logarithmic derivative of the monic
gcd. A nonzero constant factor has zero logarithmic derivative and gives
the same conclusion. The construction has linear shared circuit cost;
the note correctly places it in the broader uniform-double-pole class
without identifying it with the marked expression `H_k`.

For the constant-marker converse, squarefree `f,g` with nonlinear
irreducible gcd `R` make `fg` have multiplicity two exactly at `R` and one
elsewhere. The previously reviewed generic-direction lemma supplies
order `q=1`; a generic direction also preserves the relevant leading
forms and line factors. Thus the stated restricted `H_2` gives precisely
the line logarithmic derivative of `R`. This is an exact reduction to the
restricted aggregate operation, not a circuit bound for either gcd and
not an assertion that every pair satisfies the fuller saturated-path
hypothesis.

## The compressed fixed-kernel example

For the cyclic shift, `(C_D^j)_(0,0)` equals the indicator that `D` divides
`j`. The roots-of-unity filter therefore gives
`H_m(X,C_D)_(0,0)=per_m(X)/D`. The original scalar circuit becomes a
compressed matrix circuit of the same asymptotic gate count; the note
explicitly does not assign unit BSS cost to the corresponding large
matrix operations.

Left multiplication by `E=e_0e_0^T` retains only row zero. Hence the matrix
`B=I+E(DH-(y+1)I)` agrees with the identity in every other row and has
`B_(0,0)=per_m-y`. Expansion along those identity rows proves the
determinant formula. They also force every kernel coordinate other than
coordinate zero to vanish. The final row-zero equation is
`(per_m-y)v_0=0`, proving the claimed exact kernel on both true and false
inputs. No generic-position assumption is needed.

Consequently a polynomial-size existential singularity incidence for
every such compressed matrix would give one for the permanent graph.
The imported singular-witness transfer and border lower bound exclude
that inference, even with a fixed known kernel vector on every singular
instance. The verification of the matrix action already contains the
hard aggregate entry.

The matrices are not claimed to be Sylvester matrices. For a true
Sylvester map, common-root existence remains a valid small HN singularity
test. The unresolved task is extraction of the whole common factor or its
reciprocal traces, with a charged scalar representation. The example does
not exclude a stronger operation with separately justified complexity.

## The later canonical modular-inverse example

For `q=t^D-z` and `g=1-epsilon H_m`, the squarefreeness and coprimality
argument over `C(X,z,epsilon)` is correct. A root of `q`, or of the
nonzero polynomial `partial_t H_m`, is algebraic over `C(X,z)`; it
cannot make `epsilon H_m=1` for independent transcendental `epsilon`.

The quotient by monic `q` is free in the displayed power basis.
Multiplication by `g` is `I-epsilon M_H`, with determinant one at
`epsilon=0`. The canonical inverse is thus regular along that entire
parameter locus and has first coefficient `rem_q H_m`. The constant
remainder coefficient at `z=1` is the root-of-unity average, hence
`per_m/D`.

Reduction modulo `q` preserves homogeneity in `X`. The coefficient of
`epsilon^j` therefore has `X`-degree `jm`. At the center
`(X,z,epsilon,t)=(0,1,0,0)`, the order-`m+1` Taylor polynomial is exactly
`1+epsilon per_m/D`: higher `j` or positive powers of `z-1,t` exceed that
order. No high-index coefficient extraction has been hidden in this jet.

A supplied rational circuit yields small jets at generic centers by
truncated scalar inversion; holomorphicity permits their limit at the
displayed center. The same conclusion follows from a small actual
existential graph incidence using the finite-branch jet lemma, which
applies to finite jets without requiring a low total degree for the
entire rational output. Both implications are therefore valid.

The gcd in this example is one. Its hardness concerns the canonical
bounded-degree Bezout/modular-inverse output and its low-order jets,
not computing the gcd or excluding all specialized marked-factor
constructions. The note keeps this distinction explicit.
