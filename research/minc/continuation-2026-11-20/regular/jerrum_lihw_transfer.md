# Jerrum-family transfer for the actual Lih--Wang inequality

Research date: 21 November 2026 UTC.

The penultimate-coefficient obstruction in `lihw_coefficient_obstruction.md`
does not decide Lih--Wang. This note gives an exact two-state transfer for
the entire rook polynomial, then an exact criterion for the actual chord
gap. The transfer also allows a rationally weighted doubly stochastic
extension. No full conjecture resolution is claimed.

## Unweighted block and chain

Take a copy of `K_(r,r)` with a distinguished edge removed. Its two marked
vertices are the endpoints of that missing edge. An incoming linking edge
occupies the marked right vertex; an outgoing linking edge occupies the
marked left vertex. Let `R_ab(z)` be the rook polynomial of the block after
deleting the marked right vertex if `a=1` and the marked left vertex if
`b=1`. Explicitly,

```math
R_{00}(z)=\sum_{j=0}^r\binom rj^2j!z^j
 -z\sum_{j=0}^{r-1}\binom{r-1}j^2j!z^j,
```

```math
R_{10}(z)=R_{01}(z)
=\sum_{j=0}^{r-1}\binom rj\binom{r-1}j j!z^j,
\qquad
R_{11}(z)=\sum_{j=0}^{r-1}\binom{r-1}j^2j!z^j.
```

Put

```math
T_{ab}(z)=z^b R_{ab}(z),\qquad
B_{ab}(z)=z^a(T(z)^f)_{ab}.
```

The outgoing linking edge is counted once at its left block, including
the final edge to the terminal vertex. The initial factor `z^a` counts the
edge from the source vertex. Internal states must agree at adjacent blocks,
which proves the matrix-product formula.

For the original Jerrum graph there are `r` parallel branches. At most one
branch may use a source edge, and at most one may use a terminal edge.
Thus the full rook polynomial is

```math
\mathcal R_{r,f}(z)
=B_{00}^r
 +r(B_{10}+B_{01}+B_{11})B_{00}^{r-1}
 +r(r-1)B_{10}B_{01}B_{00}^{r-2}.                 \tag{1}
```

The last term handles different branches using the two endpoint edges.
All coefficients of (1) are exact nonnegative integers, and
`[z^j] R_(r,f) = sigma_j(H)`.

## Top coefficients and primary-source check

Let `n=r^2f+1`. A fully matched block has either no linking edges occupied
or both occupied. Full matching of a branch therefore keeps the same state
through every block. It follows that

```math
[z^{rf}]B_{00}=((r-1)(r-1)!)^f,
\qquad
[z^{rf+1}]B_{11}=((r-1)!)^f.
```

Only `r B_11 B_00^(r-1)` contributes degree `n` in (1). Therefore

```math
[z^n]\mathcal R_{r,f}
=r((r-1)!)^{rf}(r-1)^{(r-1)f}.
```

Deleting the source and terminal vertices gives `B_00^r`, whose top
coefficient is `((r-1)(r-1)!)^(rf)`.
These agree with the published full permanent and distinguished cofactor
in [Wanless (1999), Example 1, p. 275](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf).
The exact coefficients were read from the rendered primary source, not
inferred from its damaged text layer.

## A weighted doubly stochastic extension

Block size `r` and branch count `b` need not agree. Keep `f` blocks per
branch, and assign normalized linking-edge weight `x=1/b`. In each block,
assign weight

```math
u=\frac{1-x}{r-1}
```

to every edge incident with exactly one marked vertex, and weight

```math
v=\frac{r-2+x}{(r-1)^2}
```

to each edge between unmarked vertices. The missing marked edge stays
zero. A marked row has sum `(r-1)u+x=1`; an unmarked row has sum
`u+(r-1)v=1`. The endpoint rows and columns have sum `b x=1`.
Hence this defines a doubly stochastic matrix of order `n=brf+1`.

For integer arithmetic, multiply all weights by `L=b(r-1)^2`, then divide
the matrix and `L` by their common integer factor if desired. Before that
common reduction, the three edge weights are

```math
E=(r-1)^2,\qquad U=(b-1)(r-1),\qquad V=b(r-2)+1.
```

Write `h=r-1`. The weighted block polynomials are

```math
R_{11}(z)=\sum_{j=0}^h\binom hj^2j!V^jz^j,
```

```math
O(z)=hUz\sum_{j=0}^{h-1}
 \binom hj\binom{h-1}j j!V^jz^j,
```

```math
W(z)=h^2U^2z^2\sum_{j=0}^{h-1}
 \binom{h-1}j^2j!V^jz^j,
```

```math
R_{10}=R_{01}=R_{11}+O,\qquad R_{00}=R_{11}+2O+W.
```

Here `O` uses exactly one marked vertex in an internal edge, and `W`
uses both, through two distinct edges. Replace `z^a,z^b` in the transfer
by `(Ez)^a,(Ez)^b`, and replace branch count `r` by `b` in (1).
This gives the full weighted rook polynomial of an integer matrix `H`
with line sum `L`; its normalized matrix is `A=H/L`.

## Exact chord criterion, including flat completion

Let `rho_j=[z^j] R(z)` for any of the matrices just constructed. Define

```math
g(u)=\sum_{j=0}^n\rho_j\frac{(n-j)!}{n!}
 \left(\frac{nu}{L}\right)^j(1-u)^{n-j}.
                                                               \tag{2}
```

Then

```math
g(u)=\frac{\operatorname{per}((1-u)U_n+uA)}{n!/n^n}.
```

For rational `u=a/d`, compute (2) as one rational number with numerator

```math
\sum_{j=0}^n \rho_j(n-j)!(an)^j((d-a)L)^{n-j}
```

and denominator `(dL)^n n!`. This avoids floating-point comparisons.

Flat completion replaces `A` by `(1-s)U_n+sA`, `0<s<=1`.
The exact Lih--Wang violation criterion is therefore

```math
g(st)-1-t(g(s)-1)>0,
\qquad 0<t\le\tfrac12.                           \tag{3}
```

Equation (3), together with the two-by-two polynomial transfer, is an
explicit all-parameter criterion. Its sign has not been proved uniformly.

For `0<=u<1`, the same expression has the useful exact integral form

```math
g(u)=\frac1{n!}\int_0^\infty e^{-y}((1-u)y)^n
 \mathcal R\!\left(\frac{nu}{L(1-u)y}\right)\,dy.
                                                               \tag{4}
```

This follows by integrating each monomial and using
`integral_0^infinity e^(-y) y^(n-j) dy = (n-j)!`.
It may support a transfer-eigenvalue or asymptotic analysis, but no sign
claim for (3) follows merely from the positive integrand in (4).

## Implementation checks and bounded discovery

`jerrum_rook_transfer.py` computes the exact polynomial transfer and (3).
Its large graphs never require an exponential subset permanent calculation.
The companion `jerrum_transfer_check.py` independently constructs small
weighted adjacency matrices, enumerates every rook coefficient by a
row/subset recurrence, checks the deleted-endpoint cofactor, and checks a
rational mixture against a direct permanent recurrence. It returned:

```text
Transfer coefficients, endpoint cofactor, and mixture normalization agree with independent exact enumeration.
```

A bounded discovery run used the original `(r,b)=(3,3)` family and the
weighted `(2,3)` and `(2,5)` families, including flat completions. It found
no violation. The three `jerrum_*discovery.log` files preserve the precise
parameters and outcomes. They are not finite-case certificates for the
conjecture, are not a full-family theorem, and add nothing to the completed
conjecture count. No larger sweep was initiated after this diagnostic.

The exact transfer and the failure of the earlier coefficient proxy are
the usable deductions. The actual Lih--Wang aggregate inequality remains
unresolved in this work.
