# An exact exterior-incidence output of the geodesic source

The exact restriction and the leading spectral value on every normalized
geodesic point are proved. A stronger lower bound would be equivalent to
the unresolved geodesic unit identity (G). Inclusion blocks that share
A coordinates are not an AB-disjoint partial sum.

## 1. Spaces and notation

Work over $`\mathbb C`$. Fix an integer $`L\ge1`$ and
$`q=2L+1`$. Let $`F_k=\Lambda^k\mathbb C^q`$ with its ordered
exterior basis. Put

```math
N=\binom qL=\binom q{L+1}.
```

Exterior multiplication and contraction are denoted c_i and a_i. Their
matrices in the ordered bases obey c_i^T=a_i and

```math
a_i c_j+c_j a_i=\delta_{ij}I.                         \tag{1}
```

The preliminary A and B spaces are C^q tensor F_L. Let

```math
A_{\mathrm{occ}}
 =\mathop{\mathrm{span}}\{e_h\otimes e_I:h\in I,\ |I|=L\},
```

and

```math
B_{\mathrm{empty}}
 =\mathop{\mathrm{span}}\{e_h\otimes e_I:h\notin I,\ |I|=L\}.
```

On B_empty define

```math
R(e_h\otimes v)=c_hv,\qquad B_0=\ker R.                \tag{2}
```

It is convenient to regard B_0 as a subspace of the dual of the final B
space; restricting the second input of a matrix to B_0 is an ordinary
local tensor restriction. Equivalently one may choose a basis of B_0
and multiply the matrix on the right by its inclusion matrix.

For each J of size L+1, its B_empty block consists of
(e_h,e_(J without h)), h in J. The map R on that block is one nonzero
signed sum. It is surjective onto e_J, so

```math
\dim A_{\mathrm{occ}}=L N,
\qquad \dim B_0=L\binom q{L+1}=L N.                    \tag{3}
```

Let C and D each have a basis indexed by edges {i,j}, i<j. Define

```math
W_{ij}
 =\left(E_{jj}\otimes c_j a_i+E_{ii}\otimes c_i a_j\right)
       \big|_{B_0\longrightarrow A_{\mathrm{occ}}},       \tag{4}
```

where E_hh acts on the preliminary outer index. Put

```math
W_{q,L}=\sum_{i<j} W_{ij}\otimes C_{ij}\otimes D_{ij}.  \tag{5}
```

## 2. The larger output and the exact source maps

First omit the kernel restriction at B and define

```math
W_{ij}^{\mathrm{empty}}
 =\left(E_{jj}\otimes c_j a_i+E_{ii}\otimes c_i a_j\right)
       \big|_{B_{\mathrm{empty}}\longrightarrow A_{\mathrm{occ}}},
\qquad
W_{q,L}^{\mathrm{empty}}
 =\sum_{i<j}W_{ij}^{\mathrm{empty}}C_{ij}D_{ij}.             \tag{6}
```

Restricting the B input of this tensor to B_0 gives W_(q,L).

The source for both outputs is simply

```math
S_{q,N}=U_{ABC}(q)W_{AD}(N)W_{BD}(N)W_{CD}(q).             \tag{7}
```

Identify both N-dimensional source flag spaces with F_L. For each
source GHZ label h use the embeddings

```math
A_h=e_h\otimes I_{F_L},\qquad B_h=e_h\otimes I_{F_L}.       \tag{8}
```

The C map is

```math
C_{h,c}\longmapsto e_h\wedge e_c.                         \tag{9}
```

For an output D edge i<j, put

```math
G_c^{ij}=\delta_{ci}c_j a_i-\delta_{cj}c_i a_j.             \tag{10}
```

The D map has coefficient matrix minus G_c^(ij), acting on F_L.
It depends only on the source CD label c, the two source flags, and
the D output edge. In particular, it does not use h or a remote output
index.

Finally project A to A_occ and restrict the B input to B_empty.
These fixed local maps produce W_empty. The additional B_0 restriction
produces W.

## 3. Verification of every C/D coefficient

Before the final A and B restrictions, the coefficient with A and B
outer index h, source C image e_h wedge e_c, and D edge i<j is

```math
-E_{hh}\otimes G_c^{ij}.                                 \tag{11}
```

A B_empty vector in sector h has h unoccupied. Projection to A_occ
requires h occupied at the output. The operator c_j a_i can make that
change only when h=j; the operator c_i a_j can make it only when h=i.
Consequently the only surviving source label pairs are

```math
(h,c)=(j,i),\qquad(h,c)=(i,j).                            \tag{12}
```

Both produce the C edge {i,j}, so every off-pair C/D coefficient is
zero. The first pair has wedge sign minus and contributes
E_jj tensor c_j a_i after the overall minus in (11). The second has
wedge sign plus and the minus sign in G, and contributes
E_ii tensor c_i a_j. Their sum is exactly (6), and then (4) after the
B_0 restriction.

Thus S_(q,N) restricts exactly to W_empty and to W. No source-only full
unit, Laurent limit, boundary truncation, or unspecified coefficient
projection is used.

### 3.1 Why the initial two-family derivation was redundant

The construction was first recognized through the identity

```math
a_hG_c^{ij}c_\beta+G_c^{ij}c_\beta a_h
 =[a_h,G_c^{ij}]c_\beta+\delta_{h\beta}G_c^{ij}.            \tag{13a}
```

The first proposed family used A_h=e_h tensor a_h and therefore had
h absent in its output flags. Projection to A_occ kills that entire
family. For v in B_0,

```math
\sum_\beta c_\beta a_hv_\beta
 =v_h-a_h\sum_\beta c_\beta v_\beta=v_h.                  \tag{13b}
```

Hence the second proposed family's B map was just component projection
on the retained B space. Equations (8)--(11) are the resulting simpler
source maps. The anticommutator is provenance, not an extra source
resource.

## 4. What the flags do and do not separate

The B space is a direct sum of blocks B_J, |J|=L+1, each of dimension L.
After absorbing insertion signs, its coordinates satisfy one relation
of the form sum_(h in J) b_(h,J)=0.

For edge {i,j} contained in J, its two contributions land at A
coordinates

```math
(j,J\setminus\{i\}),\qquad(i,J\setminus\{j\}).       \tag{14}
```

A coordinate (h,I) in A_occ can therefore be reached from every block
J=I union {v} with v outside I. The B_J blocks do not have disjoint A
spaces. The free-AB partial-sum theorem cannot be applied directly to
this decomposition.

A packing that selects J blocks with disjoint L-subsets loses a factor
of order q in their number. Such a loss is not negligible relative to
log(q), so this elementary selection does not establish the desired
geodesic inequality.

For L>=2, both the A and B flattening ranks of W are L N. For A, a
putative linear relation can be tested on an edge {i,j} and a block J
containing both. The coordinate functionals b_i,b_j are independent
on the kernel of the signed sum because |J|>=3. Thus each of the two
A coefficients in (14) must vanish. Every A coordinate occurs in this
way. For B, fixing an edge and an A coordinate determines the physical
B component uniquely; annihilation by every edge forces every B
component to be zero.

For L=1,q=3, each B_J is one-dimensional and the three edge slices have
A columns proportional to e_1+e_2, e_1+e_3, e_2+e_3 after rescaling.
Their determinant is nonzero, so both flattenings again have rank 3.

For L>=2, each individual W_ij has rank

```math
\mathop{\mathrm{rank}}W_{ij}
 =2\binom{q-2}{L-1}.                                  \tag{15}
```

The blocks J containing i,j contribute independently, and the two
coordinate functionals b_i,b_j have rank two on each such block. At
L=1 the slice rank is one instead.

These ranks explain why this output avoids the common-B-flattening
collapse of the earlier commutator-only tensor. They are not a spectral
lower bound strong enough for the research objective.

## 5. A two-copy cover and the exact leading spectral value

### 5.1 The kernel restriction costs at most two copies

Choose pairwise distinct nonzero complex numbers t_1,...,t_q. Let T_B
multiply the B outer-index-h block by t_h, and define T_A in the same
way on A. Both preserve the occupied/empty spaces. Each slice is outer
block diagonal, so

```math
W_{q,L}^{\mathrm{empty}}T_B
 =T_AW_{q,L}^{\mathrm{empty}}.                            \tag{16}
```

Within a B_empty block J, B_(0,J) is the kernel of one signed sum with
all coefficients nonzero. The image T_B B_(0,J) is a different
hyperplane, since the t_h for h in J are not all equal. Hence

```math
B_{\mathrm{empty},J}=B_{0,J}+T_BB_{0,J}.
```

This is also true when L=1: the two different lines span the
two-dimensional block. Choose linear maps P_0,P_1 from B_empty to B_0
with

```math
I_{B_{\mathrm{empty}}}=P_0+T_BP_1.                       \tag{17}
```

For completeness, such maps are obtained by taking any linear right
inverse of the surjection (x,y) to x+T_B y from B_0 direct sum B_0 to
B_empty. This is a finite-dimensional linear-algebra operation.

By (16)--(17), simultaneously on all copied C/D slices,

```math
W_{q,L}^{\mathrm{empty}}
 =W_{q,L}P_0+T_AW_{q,L}P_1.                             \tag{18}
```

Each term is a local restriction of W_(q,L). Mapping the two summands
of their full direct sum into the common output spaces realizes their
sum. Thus

```math
U_{ABCD}(2)W_{q,L}\ \ge\ W_{q,L}^{\mathrm{empty}}
 \ \ge\ W_{q,L}.                                      \tag{19}
```

For every normalized spectral point phi,

```math
\tfrac12\phi(W_{q,L}^{\mathrm{empty}})
 \le\phi(W_{q,L})\le\phi(W_{q,L}^{\mathrm{empty}}).       \tag{20}
```

The factor two in (19) is a cover of W_empty by W. It is not part of the
source construction (7).

### 5.2 A lower bound from two levels of partial sums

Partition [q] into P,Q of sizes L,L+1. Restrict the A and B outer index
to h in P, and retain only C/D edges {h,i} with i in Q.
Different h now use disjoint spaces at all four parties: at C and D,
the P endpoint of an allowed edge uniquely identifies h. Thus this is
a full direct sum of L tensors.

Within each h summand, the L+1 slices indexed by i in Q are disjoint at
C and D. Their AB matrix is c_h a_i from the h-empty input to the
h-occupied output. Each has rank

```math
R=\binom{q-2}{L-1}.                                    \tag{21}
```

Let p=d_AB and c=d_CD. The free-CD partial-sum inequality from
[GENERAL_FREE_SET_SEPARATOR.md](GENERAL_FREE_SET_SEPARATOR.md) therefore gives at least (L+1)^c R^p
for each h summand. If c=0, restriction to one slice proves the same
bound. Additivity over the L full direct-sum blocks, followed by (20),
gives

```math
\phi(W_{q,L})\ge\tfrac12 L(L+1)^c R^p.                  \tag{22}
```

The exact ratio is

```math
\frac RN=\frac{L(q-L)}{q(q-1)}=\frac{L+1}{2q}\ge\frac14.
                                                               \tag{23}
```

A normalized four-party point has 0<=p,c<=1, because each wire is a
restriction of the full unit. Also L>=q/3 and L+1>=q/2 for q>=3. Hence
(22) implies the uniform bound

```math
\phi(W_{q,L})\ge\frac1{48}N^p q^{1+c}.                 \tag{24}
```

### 5.3 Consequence on a geodesic face

Put a=d_AD and b=d_BD. The exact source maps prove

```math
\phi(W_{q,L}^{\mathrm{empty}})
 \le q^{u_{ABC}+c}N^{a+b}.                              \tag{25}
```

Suppose a+b=p. Combining (24)--(25) and cancelling N^p gives

```math
q^{u_{ABC}-1}\ge1/48.
```

This holds for every odd q. Letting q tend to infinity proves
u_ABC>=1. The reverse inequality follows by contracting the D leg of
the full unit, so

```math
u_{ABC}=u_{ABCD}=1.                                    \tag{26}
```

Thus the construction supplies an independent operational proof that
adding a geodesic party does not increase the full-unit charge.
Using (26) in (25) gives the exact leading-value sandwich

```math
\frac1{48}N^{d_{AB}}q^{1+d_{CD}}
 \le\phi(W_{q,L})\le\phi(W_{q,L}^{\mathrm{empty}})
 \le N^{d_{AB}}q^{1+d_{CD}}.                            \tag{27}
```

Equivalently, for each such point,

```math
\frac{\log\phi(W_{q,L})-d_{AB}\log N}{\log q}
 \longrightarrow1+d_{CD}.                              \tag{28}
```

No completeness assertion about quantum spectral points is used.
The estimate is uniform over all normalized points on the geodesic
face.

## 6. The remaining implication is exactly the geodesic unit inequality

A lower bound of the form

```math
\phi(W_{q,L})\ge
 N^{d_{AB}}q^{u_{ACD}+u_{BCD}-o(1)}                      \tag{29}
```

would now be equivalent, on the geodesic face, to

```math
u_{ACD}+u_{BCD}\le1+d_{CD}.                             \tag{30}
```

Indeed (29) and the upper bound in (27) imply (30). Conversely, if (30)
holds, the lower bound in (27) gives (29) with
 o(1)=log(48)/log(q). The already proved intersecting-unit uncrossing
inequality gives the opposite inequality, since u_ABCD=1. Thus (30)
is precisely the missing conditional geodesic unit identity.

Consequently the construction computes the leading spectral value of
W, but does not establish the new inequality between unit charges. The
incorrect claim that its B_J blocks are an AB-disjoint partial sum
would hide this unresolved step. A genuinely stronger source map or
extraction is still needed.

The occupied/empty restrictions were identified through the root
agent's commutator and the anticommutator calculation. The spectral
agent observed that the first family is killed outright, and the root
and audit agents reduced the other family to (8). The root agent found
the two-copy cover (18), independently reviewed by both other agents.
The direct-sum lower bound was found independently in two equivalent
forms. The final source restriction is the one-family construction
(7)--(11), and its spectrum is bounded by (22)--(28).

## 7. Model and verification

Here $`U_S(r)`$ is the diagonal tensor of size $`r`$ on the
parties in $`S`$, with scalar factors elsewhere, and $`W_{XY}(r)`$
is the two-party diagonal tensor on $`X,Y`$. Products are regrouped
by party. The normalized spectrum and geodesic criterion are defined
in [GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md).

The root agent independently checked the one-family source maps and
their full output. The two-copy cover and the lower bound were reviewed
independently by the mathematical workers. The proof of the source
restriction uses only the exterior basis operations. The spectral
sandwich uses normalized additivity and the already proved free-CD
partial-sum inequality; its dependence on that theorem is explicit.

[check_exterior_incidence_source.py](check_exterior_incidence_source.py)
corroborates all nine C/D coefficients at $`q=3`$ and all one hundred
at $`q=5`$ for both outputs, including every coefficient that must
vanish. It also checks the stated flattening and individual-slice ranks
by exact rational elimination. These finite checks support the symbolic
proof; they do not establish (29) or the matrix multiplication exponent.
