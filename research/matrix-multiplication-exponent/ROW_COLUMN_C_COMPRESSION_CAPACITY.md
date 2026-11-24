# Capacity of row- and column-supported C maps

Research status: the following bound is proved for the stated local-map
class. It extends the previous copied-coordinate obstruction to an
arbitrary linear compression at C. It does not cover general dense C
maps or a general impossibility of the geodesic trade.

## 1. Model and statement

Fix positive integers q,M,N. Let

```math
A=\bigoplus_{i=1}^q A_i,\qquad
B=\bigoplus_{j=1}^q B_j,\qquad
\dim A_i=\dim B_j=M,
```

and choose paired bases in every A_i and B_j. Write I_(ij) for the
rank-M matrix from B_j^* to A_i given by those paired bases. Let C
have the displayed basis C_(uv), and let D have basis D_(ij), for
u,v,i,j in [q]. For a q^2 by q^2 complex matrix L, the target is

```math
T_L=\sum_{u,v,i,j}L_{uv,ij}\,I_{ij}\otimes C_{uv}\otimes D_{ij}.
                                                        \tag{1}
```

This is the usual copied-label target with a linear map L applied at
C. The matrix L can be singular, nonmonomial, and have arbitrary
complex coefficients.

Consider r_row row families and r_col column families. A row family
has source sectors h in [q], with N-dimensional A and B flag spaces,
and its C map sends every source vector (h,c) into the row
span{C_(h,v):v in [q]}. A column family instead sends (h,c) into the
column span{C_(u,h):u in [q]}. Its A and B maps may be arbitrary, and
its D map may be arbitrary and depend on all of its own source
indices, including h. No assumption is made on the middle coefficient
matrices, on ranks of individual C sectors, or on an operator
realization of the flags.

Put

```math
R_r=\frac{r_{\rm row}N}{M},\qquad
R_c=\frac{r_{\rm col}N}{M}.
```

If the sum of these families restricts to (1), then

```math
\mathop{\mathrm{rank}}L
 \le 4q(R_r^2+R_c^2)
       +4q^{3/2}\sqrt{R_rR_c}.                         \tag{2}
```

The same bound holds for a finite Laurent or formal Laurent
degeneration provided the displayed row/column C support is retained
throughout the family. The flags and local maps may have poles.
If family f has its own flag dimension N_f, replace r_row N and
r_col N by the corresponding sums of the N_f.

In particular, if (r_row+r_col)N/M=q^{o(1)}, then

```math
\mathop{\mathrm{rank}}L\le q^{3/2+o(1)}.                    \tag{3}
```

Thus this class cannot give the rank q^(2-o(1)) compression required
by the one-party compression criterion at those resource costs.

## 2. Two quotient constraints for each nonzero coefficient

For a row label u, let U_u^r be the sum of the images of the A maps
in sector u over all row families; define V_u^r in B in the same way.
For column label v, define U_v^c,V_v^c using column families. Then

```math
\dim U_u^r,\dim V_u^r\le R_rM,\qquad
\dim U_v^c,\dim V_v^c\le R_cM.                         \tag{4}
```

At every fixed pair of output labels C_(uv),D_(ij), the source AB
coefficient belongs to

```math
U_u^r\otimes V_u^r+U_v^c\otimes V_v^c.                 \tag{5}
```

Its image therefore vanishes after either of the quotient maps

```math
(A/U_u^r)\otimes(B/V_v^c),\qquad
(A/U_v^c)\otimes(B/V_u^r).                             \tag{6}
```

Put

```math
a_{iu}=\dim(A_i\cap U_u^r),\quad
b_{iv}=\dim(A_i\cap U_v^c),\quad
c_{ju}=\dim(B_j\cap V_u^r),\quad
d_{jv}=\dim(B_j\cap V_v^c).
```

If L_(uv,ij) is nonzero, (6), applied to the rank-M matrix I_(ij),
gives

```math
a_{iu}+d_{jv}\ge M,\qquad
b_{iv}+c_{ju}\ge M.                                  \tag{7}
```

For clarity, if an invertible M by M matrix is composed with a left
map of rank M-a and a right map of rank M-d, Sylvester's rank
inequality gives output rank at least M-a-d. This proves the first
inequality in (7), and the other follows identically. This use of
intersections does not assume the source subspaces are coordinate
subspaces.

## 3. Heavy intersections and the four support pieces

Call any one of a,b,c,d heavy when it is at least M/2. Define the
sets of heavy target blocks

```math
I_u^r=\{i:a_{iu}\ge M/2\},\quad
J_u^r=\{j:c_{ju}\ge M/2\},
```

and I_v^c,J_v^c similarly. Since the A_i are a direct sum, the
subspaces A_i intersect U_u^r in a direct sum inside U_u^r. Hence

```math
|I_u^r|,|J_u^r|\le 2R_r,\qquad
|I_v^c|,|J_v^c|\le 2R_c.                              \tag{8}
```

Every nonzero L_(uv,ij), by (7), lies in at least one of these four
cases:

* RR: i in I_u^r and j in J_u^r;
* CC: i in I_v^c and j in J_v^c;
* AA: i in I_u^r and i in I_v^c;
* BB: j in J_u^r and j in J_v^c.

Indeed, at least one of a,d is heavy, and at least one of b,c is
heavy. These four choices give precisely the four cases above.
Assign each nonzero entry to one applicable case, in any fixed order,
and zero it in the other cases. This partitions L into four matrices
L_RR,L_CC,L_AA,L_BB. Their ranks can be bounded separately and added.
There is no assertion that such an entry partition preserves the rank
of any piece.

For RR, all nonzero D columns (i,j) belong to the union over u of
I_u^r times J_u^r. Consequently

```math
\mathop{\mathrm{rank}}L_{RR}
 \le \sum_u |I_u^r||J_u^r|\le 4qR_r^2.                \tag{9}
```

The CC bound is 4qR_c^2.

For AA, define

```math
X_i=\{u:i\in I_u^r\},\qquad
Y_i=\{v:i\in I_v^c\}.
```

The columns with fixed first D index i have q possibilities, and
their nonzero rows are contained in X_i times Y_i. Rank subadditivity
over these column groups therefore gives

```math
\mathop{\mathrm{rank}}L_{AA}
 \le\sum_i\min\{q,|X_i||Y_i|\}
 \le\sqrt q\sum_i\sqrt{|X_i||Y_i|}.
```

By (8), sum_i |X_i|<=2qR_r and sum_i |Y_i|<=2qR_c. Cauchy--Schwarz
now gives

```math
\mathop{\mathrm{rank}}L_{AA}
 \le 2q^{3/2}\sqrt{R_rR_c}.                           \tag{10}
```

The same argument, grouping by the second D index j, gives the
identical BB bound. Adding (9)--(10) and the other two bounds proves
(2).

## 4. Laurent limits

For each u,v take the four aggregate source subspaces over C((t)),
and intersect them with the standard C[[t]] lattices in A and B.
These are saturated lattices, of ranks at most the dimensions in
(4). Their reductions give subspaces U_(u,0)^r,V_(u,0)^r,
U_(v,0)^c,V_(v,0)^c satisfying the same dimension bounds.

The broader quotient-vanishing assertions (6), rather than a claimed
closure of the sum in (5), pass to the leading tensor. To see this,
the saturated lattice in each quotient has torsion-free quotient and
admits a complementary free summand over the discrete valuation
ring. Write the regular output coefficient in bases adapted to these
summands. Its quotient coordinates vanish over C((t)), and hence
vanish over C[[t]] and after reduction. This holds for every finite
pair of C,D output labels simultaneously.

Thus (7) holds for the limiting tensor and the limiting aggregate
subspaces. The entire argument of Sections 2--3 applies unchanged.
No bounded transported sector projector and no finite limits of the
individual local matrices are assumed.

## 5. Scope of the obstruction

The condition on C support is part of the hypothesis: each family
must send the h sector into the displayed row h or column h. An
arbitrary dense C map need not have this property. The theorem does
not exclude it. In particular a scalar R matrix or a relative gauge
must have its actual columns checked; calling it a row/column map
without that check would be unjustified.

The target may have arbitrary linear compression at C, but it has
the full displayed A and B flag blocks. No bound for arbitrary
simultaneous A/B projections or tensor powers with mixed row/column
support patterns is asserted here.

The heavy-intersection argument and bound were proposed by the root
worker and independently checked by the constructive worker.
