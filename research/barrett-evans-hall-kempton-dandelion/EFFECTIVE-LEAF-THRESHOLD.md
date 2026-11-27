# Effective dandelion threshold

**Theorem.** For every (nge500), among simple (n)-vertex graphs
with both (G,G^c) connected, every minimizer of
(lambda_2(G)+lambda_2(G^c)) is a generalized dandelion, up to
complementation. In fact, at these orders, if
[
  lambda_2(G)+lambda_2(G^c)le 7/5,
]
then each of (G,G^c) has a leaf. The
[all-orders double-leaf comparison](MISSING-LEAF.md) then applies:
a leaf (l) of (G) and a leaf (h) of (G^c) witness that
comparison in (G) if (lh) is a nonedge, and in (G^c)
otherwise. The theorem makes the original unrestricted finite gap
explicit: only orders below 500 need further treatment.

In the degree-one dandelion regime, ground the hub and use the
two-entry stem mode of eigenvalue (alpha=(3-sqrt5)/2) as a
centered test vector. In the complement use the leaf-only centered
test vector. These show the dandelion value is at most
(alpha n/(n-2)+n/(n-1)<7/5) for (nge500), so the threshold
includes every candidate for the minimum.

## Coordinate inequalities

Write (x=lambda_2(G)le y=lambda_2(G^c)), changing the roles of the
two graphs if needed. Let (a,b) be their unit mean-zero Fiedler
vectors. Choose signs so (M=a_l=|a|_infty>0) and
(H=b_h=|b|_infty>0). Write (d_l=deg_G(l)) and
(e_h=deg_{G^c}(h)). We have (xle0.7,yle1.4). All terminating
decimals used below denote exact rationals.

Three elementary inequalities will be used:

1. For a unit mean-zero Laplacian eigenvector (f) of eigenvalue
   (lambda), at a vertex of degree (k>lambda),
   [
      |f_v|^2lerac{k}{(k-lambda)^2}.
   ]
   This is Cauchy–Schwarz on the row equation. At a vertex with (k)
   non-neighbours, the zero-sum row equation instead gives
   [
      |f_v|lerac{sqrt{k}}{n-k-lambda}.
   ]
   The former bound decreases with (k>lambda); the latter increases
   with (k) in its range of positive denominators.
2. For a unit mean-zero vector of maximum absolute entry (U), the
   energy of the star at a vertex with (k) missing edges is at least
   (1-knU^2/(n-k)). Indeed, the complete star costs (1+nf_v^2);
   subtract at most (k(|f_v|+U)^2), then minimize that quadratic in
   (|f_v|). The energies of stars at two vertices can be added when
   their joining edge is absent.
3. The complete-pair product bound gives (1le 4(yM^2+xH^2)).
   Thus at least one of (M,H) is at least (0.4), since
   (4(1.4)(0.4)^2<1).

## Uniform bounds and the first leaf

Use the following two cases; take Case A when (Hge0.4).

| Bound | A | B |
| --- | ---: | ---: |
| (M) at least | 0.19 | 0.4 |
| (H) at least | 0.4 | 0.08 |
| (d_l) at most | 29 | 7 |
| (e_h) at most | 8 | 159 |
| (lvert a_h
vert) at most | 0.006 | 0.038 |
| (lvert b_l
vert) at most | 0.012 | 0.0054 |

For A, the own-degree bound at (h) gives (e_hle8). Its
(G)-star and (xle0.7) therefore imply
(M^2ge0.3(500-8)/(8cdot500)>0.19^2), giving (d_lle29).
For B, (d_lle7). Any (G)-neighbour (w') of (l) has
(a_{w'}ge(1-x)Mge0.12) by the row at (l), so
(deg_G(w')le70). The two (G^c)-stars at (l,w') have no
common edge; the star bound and (yle1.4) give
[
  H^2ge
  rac{0.6}{500cdot7/(500-7)+500cdot70/(500-70)}>0.08^2.
]
This gives (e_hle159). The opposite-coordinate bounds now give
the bottom two rows of the table.

In either case (lvert a_h
vert/Mle0.095), so (lh) is
not a (G)-edge (the row at (l) would give (xge0.905)).
The complement row at (h) gives
(yge1-lvert b_l
vert/H) and therefore (xle0.47) in both
cases. Take (z
e l) maximizing (a_z=Z). The row at (l)
and connectivity give (Zge(1-x)Mge0.53M).
The own-degree bound gives (d_G(z)le103) in A and at most
24 in B, so the opposite-coordinate bound gives (|b_z|le0.026)
and (|b_z|le0.011), respectively. In particular (z
e h).
If (hz) were a complement edge, the complement row at (h)
would give (yge2-(|b_l|+|b_z|)/H>1.4). Thus (hz) is a
(G)-edge. The row at (z) implies
[
    (2-x)Zle M+|a_h|.
]
If (l) had at least two (G)-neighbours, its row would strengthen
(Zge(1-x/2)M). This is impossible since
((2-0.47)(1-0.47/2)>1.095). Thus (l) is a leaf.

## The second leaf

Now (|b_l|le0.0021) from (d_l=1), so (xle0.427) by
the row at (h). Also
((2-x)(1-x)le1.095) gives (x>0.33), hence (y<1.07).
The unique neighbour (w) of (l) is (z): if not, the row at
(z), with no negative contribution and containing (hz), would
give (xge1-|a_h|/Zge1-0.095/0.53>0.427).
In particular (a_w=(1-x)M) and the previous bounds on (b_z)
are the corresponding bounds on (b_w).

Suppose (h) has at least two complement neighbours. If (v
e h)
maximizes the second entry (b_v=Z_b), the row at (h), using
its neighbour (l) and any other one, gives
(Z_bge0.93H-0.0021>0.072).
Thus (v
otin{l,w,h}) by the previous bounds on (b_l,b_w).
Its complement degree is at most 9 in A and at most 196 in B
by the own-degree bound; these give (|a_v|le0.007) and
(|a_v|le0.047), respectively. If (wv) were present in
(G), use the neighbours (l,h,v) in the row at (w)
(all other terms are nonnegative):
[
   (3-x)(1-x)le1+rac{|a_h|+|a_v|}{M}.
]
The left side is at least ((3-0.427)(1-0.427)>1.47); the
right side is below (1.22) in either case. Thus (v) is
adjacent to both (l,w) in (G^c). Its complement row has only
the possible negative contribution from (h). Consequently
[
   1.93(0.93H-0.0021)le (3-y)Z_ble H+|b_l|+|b_w|.
]
The two sides contradict (Hge0.4, |b_w|le0.026) in A,
and (Hge0.08, |b_w|le0.011) in B. Thus (h) is a leaf
of (G^c), proving the claim.

All decimal comparisons can also be rechecked in
[verify_effective_leaf_threshold.py](verify_effective_leaf_threshold.py)
with exact rational arithmetic.
[Coordination issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
