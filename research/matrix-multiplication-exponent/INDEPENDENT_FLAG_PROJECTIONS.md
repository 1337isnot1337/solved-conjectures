# Two local projections on independent target factors

This is a restricted two-projection consequence of the proved
[single-party compression lemma](SINGLE_PARTY_PROJECTION_TRADE.md). It is not a statement about arbitrary
projections at two parties of an arbitrary tensor.

Let

```math
T_{p,M_XM_Y}=U_{ACD}(p)\otimes U_{BCD}(p)
                  \otimes W_{AB}(M_X)\otimes W_{AB}(M_Y).
```

Keep the X and Y wire factors explicitly separate. Regroup this as

```math
T_X\otimes T_Y,
\qquad
T_X=U_{ACD}(p)W_{AB}(M_X),\quad
T_Y=U_{BCD}(p)W_{AB}(M_Y).                                  \tag{1}
```

The A space of T_X has dimension p M_X, and the B space of T_Y
has dimension p M_Y. Let P be any linear map on that A space of
rank d_X, and let Q be any linear map on that B space of rank d_Y.
On the full tensor, P acts as the identity on A's Y wire factor;
Q acts as the identity on B's X wire factor. In particular their
supports are in different tensor factors in (1).

For every normalized spectral point F, the single-party compression
lemma and multiplicativity give

```math
\begin{split}
F((P\otimes Q)T_{p,M_XM_Y})
 &=F(P T_X)F(Q T_Y)
 \\ &\ge {d_X\over pM_X}{d_Y\over pM_Y}F(T_X)F(T_Y)
 \\ &={d_X\over pM_X}{d_Y\over pM_Y}F(T_{p,M_XM_Y}).           \tag{2}
\end{split}
```

Here (P tensor Q) denotes the displayed local actions with identities
on all other factors, rather than a new grouping of parties.

The symmetry hypothesis of the single-party lemma holds separately
for the indicated factors. For T_X, phase changes and permutations
of its outer index i lift to stabilizers by their compensating actions
at C or D. Independent phase changes and permutations of its X wire
index lift by compensating actions at B. On A their product action
has distinct diagonal characters on all pairs (i,x), and the product
permutation group is transitive. Averaging over phases kills every
off-diagonal matrix entry, and averaging over permutations makes the
diagonal scalar. This is the required finite one-design. The proof
for the B leg of T_Y is identical.

Consequently, if a legal source map produces

```math
\alpha\,(P T_X)\otimes(Q T_Y),\qquad \alpha\ne0,
```

and both rank fractions in (2) are p^(-o(1)), its output retains the
same leading spectral exponent as the full target. This applies to
separate X and Y channel projections in a proposed Sylvester trade.
It does not establish that trade or its source cost.

If the two projections act on a shared flag space, or either one
uses flag factors belonging to both T_X and T_Y, the factorization
in the first line of (2) is unavailable. No conclusion for that case
is asserted here.
