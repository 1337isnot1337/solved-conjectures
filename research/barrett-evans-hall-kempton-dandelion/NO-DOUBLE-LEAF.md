# Sharp separation without leaves on both sides

**Theorem.** Among complementary pairs of connected graphs in which at
least one graph has no leaf, the limiting minimum, as the order tends
to infinity, of the sum of the two algebraic connectivities is
[
    3-sqrt2.
]
The same limiting minimum holds when both diameters are required to be
three. In particular the separation from the dandelion value (1+
(3-sqrt5)/2) is asymptotically at least (0.2038). This is stronger
on this class than the [unrestricted non-dandelion separation](SHARP-SEPARATION.md).

## Lower bound

Put (d=2-sqrt2). Suppose, for a contradiction, that there is a
sequence of orders tending to infinity and a fixed (epsilon>0)
with sum at most (1+d-epsilon). Swap graph and complement if
necessary so that (x=lambda_2(G)le y=lambda_2(G^c)). Let (a,b)
be unit mean-zero Fiedler vectors. All order errors below tend to zero
on this sequence. At a vertex with absolute coordinate bounded below
the degree in its own graph is bounded, since only boundedly many
coordinates can have even half its absolute size and each edge to
the others costs a fixed amount.

Both vectors have maxima in absolute value bounded away from zero,
after passing to a subsequence if needed. To see this, the complete-pair
product identity in [LARGE-ORDER.md](LARGE-ORDER.md) implies
(1le xR_b^2+yR_a^2), with (R_a,R_b) the coordinate ranges.
If (a) delocalizes, then (b) has an entry bounded below in absolute
value, at a vertex of bounded (G^c)-degree. Its almost universal
star in (G) costs at least (1-o(1)) in (a)-energy: the complete
star costs (1+na_v^2), and only a bounded number of (o(1)) terms
are missing. This contradicts (xle(1+d)/2<1).
If (b) delocalizes, then (a) has a positive maximum (M) bounded
below after changing sign. Any (G)-neighbour of that maximum has
coordinate at least ((1-x)M), by its row equation. The maximum
and such a neighbour therefore both have bounded (G)-degree.
Their two almost universal (G^c)-stars cost (2-o(1)) in (b)-energy,
contradicting the assumed sum.

Choose signs and vertices (l,h) so that (a_l=|a|_infty>0)
and (b_h=|b|_infty>0). These have bounded degree in (G,G^c),
respectively. In particular (a_h,b_l=o(1)), because the opposite
degrees tend to infinity. The pair (lh) cannot be a (G)-edge:
the row at (l) would give (xge1-o(1)). Thus the complement row
at (h) gives (yge1-o(1)), and
[
    xle d-epsilon+o(1).
]
Every vertex other than (l) with (a)-coordinate positive and
bounded away from zero must be (G)-adjacent to (h). Otherwise
that vertex and (l) are two neighbours of (h) of (b)-coordinate
(o(1)), giving (yge2-o(1)) in the row at (h).

Write (M=a_l) and (Z=max_{v
e l}a_v), attained at (z).
Connectivity and the row at (l) give (Zge (1-x)M), so (z)
is adjacent to (h) in (G). In the row at (z), only the (l)
term can be negative, and hence
[
    (2-x)Zle M+o(1).
]
If (l) has at least two neighbours, the row at (l) also says
(Zge(1-x/2)M). This implies
[
    (2-x)(1-x/2)le1+o(1),
]
which forces (xge d-o(1)). It follows that (l) is a leaf.
Let (w) be its unique neighbour. Then (a_w=(1-x)M). In fact
(z=w): otherwise the row at (z) has no negative term at all
and contains the edge to (h), giving (xge1-o(1)).

Suppose (h) is not a leaf in (G^c). Its complement row on (l)
and another neighbour gives, with (H=b_h),
[
    Z_b:=max_{v
e h}b_v ge (2-y)H-o(1).
]
By the preceding inequality for (Z=a_w), (xge(3-sqrt5)/2-o(1)).
Therefore (yle1+d-(3-sqrt5)/2+o(1)<5/4). In particular a
vertex (v) attaining (Z_b) has bounded (G^c)-degree, so that
(a_v=o(1)) and (v
otin{l,w,h}). If (v) were adjacent to
(w) in (G), the row at (w) would contain the two (o(1))
coordinates at (h,v), as well as (a_l=M), and all other terms
would be nonnegative. Thus ((3-x)(1-x)le1+o(1)), again forcing
(xge d-o(1)). So (v) is adjacent in (G^c) to both (l,w).
In its complement row the only possible negative term is from (h).
Consequently
[
     (3-y)Z_ble H+o(1),qquad
     (3-y)(2-y)le1+o(1).
]
This contradicts (y<5/4) for large orders. Therefore (h) is a leaf
in (G^c), too, contrary to the class under consideration.

## Attaining family

Take (mge2) ordinary vertices spanning a clique and joined to a hub
(h). Add three vertices (l,w_1,w_2) with just the four additional
edges (lw_i,hw_i), (i=1,2). The graph has no leaf, and it and
its complement have diameter exactly three (use (l) to an ordinary
vertex in (G), and (h) to (w_1) in (G^c)).

Grounding (h) in the Laplacian of (G) gives the block on
(l,w_1,w_2) with diagonal 2 and the two negative off-diagonal
edges (lw_i); its minimum is (d). The ordinary block has
minimum 1. Interlacing gives (xge d), and centering a unit
minimum eigenvector of the first block (with all other entries zero)
gives (xle d+O(1/m)).

In (G^c), ground (l). The (h) entry gives eigenvalue 1.
The (w_i) and ordinary groups give a least eigenvalue below 1
which is the smaller root of ((m-z)(3-z)-2m=0), tending to 1.
Indeed the groups are joined completely, the (w_i) are adjacent
to one another, the ordinary vertices are independent, and every
ordinary vertex is adjacent to (l). The within-group modes have
eigenvalues at least 3. Interlacing gives (yge1-o(1)); the test
vector supported on (h), centered, gives (yle(m+4)/(m+3)).
This attains the stated limit.

[Original dandelion conjecture](https://arxiv.org/pdf/2201.04225#page=15) ·
[Coordination issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
