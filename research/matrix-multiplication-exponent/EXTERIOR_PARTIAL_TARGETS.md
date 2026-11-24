# Exterior-algebra partial targets and a fixed-support obstruction

Status: the extraction statements and the obstruction below are proved.
No source-to-target construction is supplied. The obstruction applies
also to Laurent degenerations as long as the stated support condition at
C is retained. Dense C maps are outside its scope.

## 1. Flags and the two relaxed targets

Work over $`\mathbb C`$. Fix integers $`q\ge2`$ and
$`1\le L\le q-1`$. Let $`V=\mathbb C^q`$ with ordered
basis $`e_1,\ldots,e_q`$, and put $`F_L=\Lambda^L V`$ and
$`D_L=\binom qL`$. Exterior multiplication by $`e_i`$ is
$`c_i`$, and contraction by the dual basis vector is $`a_i`$. Thus

```math
a_i c_j+c_j a_i=\delta_{ij}I,
\qquad N_i=c_i a_i.
```

On the exterior basis indexed by L-element subsets I of [q], N_i is the
indicator of i in I. Let C and D have coordinates indexed by unordered
pairs {i,j}, with i distinct from j. A fixed orientation of each pair
may be used instead; the resulting nonzero signs do not affect the
arguments.

The A and B spaces each have an outer index in [q] and a flag in F_L.
For an endomorphism K of F_L, the notation
A_i B_j [K] means that the matrix entries of K occupy the corresponding
A_i,B_j flag block. Define

```math
Z_{q,L}^{\mathrm{diag}}
 =\sum_{i\ne j} A_i B_j C_{\{i,j\}}D_{\{i,j\}}
       [N_i(1-N_j)],                                      \tag{1}
```

and

```math
Z_{q,L}^{\mathrm{ex}}
 =\sum_{i\ne j} A_i B_j C_{\{i,j\}}D_{\{i,j\}}
       [c_i a_j].                                        \tag{2}
```

The matrix in (2) maps a B flag to an A flag. Both endomorphisms in
(1) and (2) have rank

```math
R_{q,L}=\binom{q-2}{L-1}.                                 \tag{3}
```

For (1), choose the other L-1 occupied positions after requiring i
occupied and j empty. For (2), the input has j occupied and i empty;
replacing j by i is a signed bijection onto the resulting output flags.

### 1.1 The diagonal target separates into large rectangles

For each I of size L, its summand in (1) is

```math
\sum_{i\in I,\ j\notin I}
 A_{i,I}B_{j,I}C_{\{i,j\}}D_{\{i,j\}}.                   \tag{4}
```

The map (i,j) to {i,j} is injective on I times its complement. Therefore
(4), after local reindexing at C and D, is exactly

```math
U_{ACD}(L)\otimes U_{BCD}(q-L).
```

Different I use disjoint A and B spaces. They may share C and D spaces,
which is precisely the partial direct sum covered by
[GENERAL_FREE_SET_SEPARATOR.md](GENERAL_FREE_SET_SEPARATOR.md).

Let phi be a normalized four-party spectral point. Write d_AB for the
exponent of W_AB and u_S for the exponent of U_S. The partial-sum
inequality gives

```math
\phi(Z_{q,L}^{\mathrm{diag}})
 \ge D_L^{d_{AB}} L^{u_{ACD}}(q-L)^{u_{BCD}}.              \tag{5}
```

If d_AB is zero, restriction to one block proves the same formula.
Thus (5) includes that case without division by d_AB.

### 1.2 Exchange operators give a different collection of rectangles

For K of size L-1 and i,j outside K, with i distinct from j,

```math
c_i a_j e_{K\cup\{j\}}
 =\sigma(i,K)\sigma(j,K)e_{K\cup\{i\}},                 \tag{6}
```

where sigma(i,K) is the sign of inserting e_i into the ordered exterior
basis element e_K. At A, locally relabel (i,J), with i in J, by
(i,J without i). At B do the corresponding relabeling (j,I) to
(j,I without j). The two signs in (6) can be removed by separate local
rescalings. Equation (2) consequently restricts to

```math
\sum_{|K|=L-1}\
\sum_{\substack{i,j\notin K\\i\ne j}}
 A_{i,K}B_{j,K}C_{\{i,j\}}D_{\{i,j\}}.                  \tag{7}
```

For each K, partition its complement into disjoint sets P_K,Q_K of
sizes

```math
p=\left\lfloor\frac{q-L+1}{2}\right\rfloor,
\qquad s=q-L+1-p.
```

Keep only A indices i in P_K and B indices j in Q_K. These are local
restrictions because both parties know their own K. Each retained block
is U_ACD(p) tensor U_BCD(s), and the blocks are disjoint at A and B.
Therefore

```math
\phi(Z_{q,L}^{\mathrm{ex}})
 \ge D_{L-1}^{d_{AB}}p^{u_{ACD}}s^{u_{BCD}}.               \tag{8}
```

Again restriction to a block handles d_AB=0.

Taking L=floor(q/2), all four rectangle side lengths in (5) and (8)
are at least $`q/4`$ for $`q\ge4`$. Also

```math
\frac{D_{L-1}}{D_L}=\frac{L}{q-L+1},                     \tag{9}
```

which is bounded above and below by positive constants for large q.
A source flag space consisting of finitely many adjacent middle
exterior degrees also has dimension at most a fixed multiple of D_L.
Thus these targets do not require using the whole exterior algebra
and then discarding all but one middle layer. That latter procedure
would lose a factor of order sqrt(q), which is not negligible on the
log(q) scale relevant here.

### 1.3 Why either construction would suffice for the geodesic inequality

Put

```math
S_{q,N}=U_{ABC}(q)W_{AD}(N)W_{BD}(N)W_{CD}(q).
```

Suppose, for an unbounded sequence of q and L=floor(q/2), there were
Laurent degenerations

```math
U_{ABCD}(r_q)S_{q,N_q}\ \unrhd\ Z_{q,L},                \tag{10}
```

where Z is either target above,

```math
r_q=q^{o(1)},\qquad N_q/D_L=q^{o(1)}.
```

For a fixed normalized point satisfying

```math
d_{AD}+d_{BD}=d_{AB},                                    \tag{11}
```

monotonicity, (5) or (8), and multiplicativity give

```math
r_q q^{u_{ABC}+d_{CD}}N_q^{d_{AB}}
 \ge D_*^{d_{AB}}(c q)^{u_{ACD}+u_{BCD}},                 \tag{12}
```

with $`c=1/4`$ and $`D_*`$ equal to $`D_L`$ or
$`D_{L-1}`$. Divide logarithms by
log(q), use (9), and let q tend to infinity. The result is

```math
u_{ACD}+u_{BCD}\le u_{ABC}+d_{CD}.                       \tag{13}
```

This is the missing direction of the conditional geodesic unit
identity treated in [GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md) and
[GEODESIC_UNCROSSING_EQUIVALENCE.md](GEODESIC_UNCROSSING_EQUIVALENCE.md). No degeneration (10) is established
here.

## 2. A fixed star at C obstructs both relaxed targets

The following statement permits arbitrary maps at A, B and D. It also
permits arbitrary Laurent coefficients in the C maps. Only their
coordinate support is constrained.

There are r full-unit families. In each family, the source C basis
has labels (h,c) with h,c in [q]. Assume its image is supported on

```math
\mathop{\mathrm{span}}\{C_{\{h,v\}}:v\ne h\}.            \tag{14}
```

The usual wedge map (h,c) to e_h wedge e_c obeys (14), but the theorem
allows every linear combination of the edges incident to h. It also
allows different such combinations in the r families.

Let the source flag dimension at A and B be N. If a degeneration with
(14) produces either target (1) or (2), then

```math
\lfloor q/2\rfloor\lceil q/2\rceil
       \binom{q-2}{L-1}\ \le\ q r N.                   \tag{15}
```

The exact ratio is

```math
\frac{R_{q,L}}{D_L}=\frac{L(q-L)}{q(q-1)}.
```

For $`L=\lfloor q/2\rfloor`$, this ratio is bounded below by a
positive constant. Consequently (15) gives $`r\ge q^{1-o(1)}`$
whenever $`N/D_L=q^{o(1)}`$. In particular, a bounded ratio
$`N/D_L`$ requires a positive constant times $`q`$ source families.
Thus (10) cannot hold in this fixed-support class.

### 2.1 Quotient rank lemma

Let Z belong to U_0 tensor V_0 inside A tensor B, and have matrix rank
R. If its image in (A/P) tensor (B/Q) vanishes, then

```math
R\le\dim(U_0\cap P)+\dim(V_0\cap Q).                   \tag{16}
```

Indeed, restricting the quotient A to U_0 loses at most
 dim(U_0 intersect P) rank, and restricting the quotient B to V_0
loses at most dim(V_0 intersect Q). Applying the elementary matrix
rank inequality to the two quotient maps proves (16). Using the full
coordinate blocks U_0,V_0 only weakens the bound; one may instead use
the actual column and row spaces of Z.

### 2.2 Exact maps

Choose disjoint fixed outer-label sets P,Q partitioning [q], with
sizes floor(q/2),ceil(q/2). Restrict the A output to labels in P and
the B output to labels in Q. Write the resulting coordinate spaces as

```math
A=\bigoplus_{u\in P} A_u,
\qquad B=\bigoplus_{v\in Q} B_v.
```

For every source sector h, let X_h be the span of the A images from
that sector in all r families, and let Y_h be the corresponding B
span. Thus

```math
\dim X_h,\dim Y_h\le rN.                                \tag{17}
```

Fix u in P and v in Q, and take the coefficient of
C_{\{u,v\}}D_{\{u,v\}}. By (14), only source sectors h=u and
h=v can contribute. Regardless of the D map, the resulting coefficient
Z_uv therefore belongs to

```math
X_u\otimes Y_u+X_v\otimes Y_v
 \ \subseteq\ A\otimes Y_u+X_v\otimes B.                \tag{18}
```

Its image in (A/X_v) tensor (B/Y_u) is zero. On the target, the outer
restriction has removed the reverse orientation. The coefficient lies
in A_u tensor B_v and has rank R_(q,L) by (3). Thus (16) gives

```math
R_{q,L}\le\dim(A_u\cap X_v)+\dim(B_v\cap Y_u).          \tag{19}
```

For fixed v, the A_u are disjoint coordinate blocks, so

```math
\sum_{u\in P}\dim(A_u\cap X_v)\le\dim X_v\le rN.
```

The corresponding inequality for fixed u and the B_v is identical.
Summing (19) over P times Q proves (15).

### 2.3 Laurent maps with the same support condition

Let R=C[[t]] and K=C((t)). Suppose the output tensor of the Laurent
maps has a regular limit equal to the target. A common overall Laurent
factor may be absorbed into the D map, so assume the output coefficients
are in R and reduce to the target at t=0.

Form the K-subspaces X_h(t),Y_h(t) as above. Their dimensions are at
most rN. A K-subspace X of K^a has a saturated lattice

```math
\mathcal L_X=X\cap R^a.
```

This lattice is a direct summand of R^a of rank dim_K X. To see the
saturation, if a nonzero f in R satisfies fz in the lattice for some
z in R^a, then z belongs to X because f is invertible in K, and hence
z is already in the lattice. Over the discrete valuation ring R, a
saturated submodule of a finite free module is a direct summand: Smith
normal form has no nonunit invariant factors. Consequently there is a
quotient matrix over R whose kernel over K is X and whose reduction
modulo t still has rank a-dim_K X.

Apply this to the finitely many X_h(t),Y_h(t). Denote their reduced
subspaces by X_h(0),Y_h(0), of the same dimensions. For each cross pair
u,v, (18) implies

```math
(\pi_{X_v}(t)\otimes\pi_{Y_u}(t))Z_{uv}(t)=0.             \tag{20}
```

Both quotient matrices and Z_uv(t) are regular. Reducing (20) modulo t
gives exactly the quotient-vanishing condition used in (19), with
X_v(0),Y_u(0). The same rank and direct-sum count proves (15).

This argument does not assert that a limit stays in
X_u(0) tensor Y_u(0) plus X_v(0) tensor Y_v(0); that smaller sum can
lose dimension and acquire additional limiting directions. It uses
the larger space A tensor Y_u plus X_v tensor B, whose quotient
condition survives the limit.

The same proof upgrades the fixed row/column support obstruction in
[OPERATOR_TRADE_OBSTRUCTIONS.md](OPERATOR_TRADE_OBSTRUCTIONS.md) to Laurent degenerations retaining that
support. It does not upgrade a theorem that transports C-sector
projectors through a varying invertible C map: there the selected C
coefficients themselves move and may coalesce. Nor does (15) constrain
C maps with dense output support beyond (14).

## 3. Verification and scope

The extraction in Section 1 uses only the exterior-basis formulas and
the already proved free-AB partial-sum inequality. Its source criterion
is conditional on an actual degeneration (10).

The obstruction in Section 2 is a new application of the quotient
argument developed for row/column C maps. The exact-map argument was
independently reviewed by the root and constructive agents. The Laurent
extension was independently checked using the closed quotient
incidence over Grassmannians; Section 2.3 supplies an explicit lattice
proof of the same step.

Neither a normalized spectral point with perimeter greater than two
nor an upper bound of two has been constructed. The remaining operator
search must change the C support beyond fixed incident-edge sectors,
or use a source outside this class.
