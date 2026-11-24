# A complete multi-shear source equation

Research status: the source maps and their complete operator coefficient
are proved. The sampling obstruction in Section 6 excludes the required
asymptotic parameters for this entire scalar multi-shear class, including
arbitrary dense C planes. No exponent bound is claimed.

## 1. Source, target, and scalar data

Fix q>=2 and partition [q] into disjoint sets P,Q. The same q labels
are used for the shared source label h and the outer target labels.
The independent source CD-wire label c also ranges over [q]. Use

```math
Z_{q,N}=U_{ABCD}(q)W_{CD}(q)W_{AD}(N)W_{BD}(N).
\tag{1}
```

The eventual target is a C-linear image of

```math
T_{q,M}=U_{ACD}(q)U_{BCD}(q)W_{AB}(M).
\tag{2}
```

Let W be a fixed finite-dimensional complex C-output space, of
dimension at most q^2 if desired. For each z in [r] and h in [q],
choose vectors u_(z,h,c) in W, c in [q]. Set

```math
U_h^z=\mathop{\mathrm{span}}\{u_{z,h,c}:c\in[q]\},
\qquad \dim U_h^z\le q.
\tag{3}
```

These vectors are exactly the columns of the fixed scalar C map in
family z. They may be arbitrary dense vectors. For each ordered edge
(a,b) in P times Q choose a vector of scalar coefficients

```math
\kappa_{ab}=(\kappa_{ab}^1,\ldots,\kappa_{ab}^r)\in\mathbb C^r.
\tag{4}
```

All data in (3)--(4) are fixed complex numbers, independent of flags.

## 2. The local operators

Use independent Weyl variables x_ab and derivatives partial_ab for
all (a,b) in P times Q. Thus

```math
[\partial_{ab},x_{ij}]=\delta_{ai}\delta_{bj}I,
\tag{5}
```

and coordinates and derivatives belonging to different modes commute.
For each z let N_z be the q-by-q matrix with entries

```math
(N_z)_{ab}=
\begin{cases}
\kappa_{ab}^z\partial_{ab}&a\in P,\ b\in Q,\\
0&\text{otherwise}.
\end{cases}
\tag{6}
```

Its matrix square is zero: a nonzero first factor would require the
intermediate label to lie in Q, and a nonzero second factor would
require it to lie in P. This also proves
N_z diag(X_h) N_z=0 for any middle operators X_h.

For every D-output pair (i,j) in P times Q choose scalar coefficients
d_(z,h,c)^(ij), and define

```math
v_h^{z,ij}=\sum_{c=1}^q d_{z,h,c}^{ij}u_{z,h,c}\in U_h^z.
\tag{7}
```

There are two source families for each z. In the first family use

```math
A_{z,h}^a=(I+N_z)_{ah},\qquad
B_{z,h}^b=(I-N_z)_{hb},\qquad
X_{z,hc}^{ij}=d_{z,h,c}^{ij}x_{ij},\qquad
C_{z,hc}=u_{z,h,c}.
\tag{8}
```

In the second family use the same C map and

```math
\widehat A_{z,h}^a=\delta_{ah}I,\qquad
\widehat B_{z,h}^b=\delta_{hb}I,\qquad
\widehat X_{z,hc}^{ij}=-d_{z,h,c}^{ij}x_{ij}.
\tag{9}
```

Set both middle maps to zero for output pairs outside P times Q.
The physical B map is the full flag transpose of the displayed right
operator B. This is the convention under which the coefficient is
A X B. The D map uses its legitimate source h,c and output i,j;
it does not acquire a or b. Tagged access to h is part of source (1).

## 3. Every coefficient, including the residual

For fixed (i,j) in P times Q the combined coefficient at outer labels
(a,b), valued in W tensor the Weyl algebra, is exactly

```math
\begin{aligned}
\mathcal O_{ab}^{ij}
={}&x_{ij}\partial_{ab}
       \sum_{z=1}^r\kappa_{ab}^z
             (v_b^{z,ij}-v_a^{z,ij})\\
&+\delta_{ai}\delta_{bj}
       \sum_{z=1}^r\kappa_{ij}^z v_j^{z,ij}
\qquad (a\in P,\ b\in Q),
\end{aligned}
\tag{10}
```

and it is zero for every other (a,b). Products of vectors in W and
operators in (10) mean ordinary tensor products; all W coefficients
are complex scalars in any fixed output basis.

To prove (10), first sum c in (8) to obtain v_h x_ij. Expanding
(I+N)diag(v_h x_ij)(I-N), the diagonal term is canceled exactly by
(9). The N diag(v_h x_ij) N term is zero by the disjoint P,Q support.
At a in P,b in Q the two remaining terms are

```math
\kappa_{ab}^z\partial_{ab}x_{ij}v_b^{z,ij}
 -\kappa_{ab}^z x_{ij}\partial_{ab}v_a^{z,ij}.
\tag{11}
```

The vectors in (7) are independent of the flag. Using (5) in (11)
gives (10), with no omitted polynomial, derivative, or off-diagonal
coefficient. This proof does not extract a Weyl constant term.

## 4. The finite compatibility problem

For each target pair (i,j), choose the vectors in (7) so that

```math
\sum_{z=1}^r\kappa_{ab}^z(v_b^{z,ij}-v_a^{z,ij})=0
\qquad\text{for every }(a,b)\in P\times Q.
\tag{12}
```

Then all residual terms in (10) vanish. Set

```math
L_{ij}=\sum_{z=1}^r\kappa_{ij}^z v_j^{z,ij}
       =\sum_{z=1}^r\kappa_{ij}^z v_i^{z,ij}
\quad((i,j)\in P\times Q),
\tag{13}
```

and set L_ij=0 outside P times Q. The exact operator output is

```math
\mathcal O_{ab}^{ij}=\delta_{ai}\delta_{bj}L_{ij}I.
\tag{14}
```

Thus it is precisely L_C T_(q,M), where the fixed linear map L sends
the standard C basis vector e_ij to L_ij. All six outer labels and
the full A-D-B order have been specified.

The scalar version of (12) is a parallel-motion equation on the
complete bipartite graph P times Q. The vector version additionally
requires v_h^z to lie in the fixed C plane U_h^z. These planes are
arbitrary; imposing row/column support on them would be an additional
restriction.

Equivalently, solve one common finite linear system with W-valued
unknowns v_h^z and constraints (3),(12). Let H_ij be the image of its
solution space under the linear map in (13). The choices for different
output pairs are independent. Hence the maximum attainable rank of L
is the maximum rank of a matrix whose (i,j) column is chosen from H_ij.
This is an exact finite linear-algebra question. Numerical ranks alone
would require reconstruction or a separate exact certificate.

## 5. Resource accounting and the required target

There are 2r source families, so a full four-party unit of rank 2r
controls their sum. Each family uses the same shared-label dimension
q and CD-wire dimension q. The number of independent Weyl modes is
m=|P||Q|. Every outside map has degree at most one, and each middle map
has degree one. A direct finite-flag realization is enough. Let F_n
be the polynomials of total degree at most n in the m variables.
Retain F_n, and use F_(n+1) as the source flag. Thus

```math
M={n+m\choose m},\qquad N={n+m+1\choose m},\qquad
\frac NM=\frac{n+m+1}{n+1}\longrightarrow1.
\tag{15}
```

Use the displayed B entries from F_n into F_(n+1); their images lie
in F_n, because differentiation lowers degree. Multiplication by
x_ij then lies in F_(n+1). Use the displayed A entries followed by
the projection to F_n. Consequently every finite coefficient is the
projection of the full coefficient (10), with no intermediate
truncation error. If (12) holds, the result is exactly (14) on F_n.
All individual maps are finite complex matrices. No rational inverse,
infinite Laurent series, or imported Ore-localization theorem is needed.

Consequently a construction, along an unbounded sequence of q, with

```math
r=q^{o(1)},\qquad \mathop{\mathrm{rank}}L=q^{2-o(1)}
\tag{16}
```

would supply the required geodesic trade after the already-proved
single-party C-compression estimate. A balanced partition has
|P||Q| asymptotic to q^2/4, so its support restriction alone is an
allowed constant loss. One first fixes q and takes the flag limit;
only then takes q to infinity. No family count or flag boundary cost
is silently taken to zero at fixed finite flags.

The easy commutator identity producing E_ij after summing h without
any C label does not solve (12): it retains only the common intersection
of the C planes. The following obstruction also rules out repairs by
nonproportional scalar edge vectors kappa and arbitrary dense C planes.

## 6. The sampling obstruction to this candidate

The independent construction worker derived the following exact bound;
the proof is included to identify the failed asymptotic implication.
Let K be the scalar motion space consisting of all v=(v_h^z) satisfying
(12) with scalar entries. On K define the coordinate functionals
epsilon_(h,z)(v)=v_h^z, and set

```math
V_h=\mathop{\mathrm{span}}_z\epsilon_{h,z}\subseteq K^*,
\qquad \dim V_h\le r.
```

For every edge (a,b), its evaluation functional

```math
\ell_{ab}=\sum_z\kappa_{ab}^z\epsilon_{a,z}
          =\sum_z\kappa_{ab}^z\epsilon_{b,z}
\tag{17}
```

lies in V_a intersect V_b. A W-valued motion is equivalently a linear
map T:K^*->W. The C-plane conditions mean
T(epsilon_(h,z)) in U_h^z. The target column is T(ell_ij). A different
map T may be chosen independently for every (i,j); the argument below
allows this.

Sample t vertices of P independently and uniformly, with replacement.
For a fixed b, the list {ell_ab:a in P} has span of dimension at most
r, since it lies in V_b. If R_t is the expected rank of t independent
samples from this list, the increments R_(t+1)-R_t are nonincreasing:
coupling the first t samples with one additional sample shows that
enlarging a span can only reduce the probability that a new sample
lies outside it. Since R_(t+1)<=r, that probability is at most
r/(t+1). Hence the expected number of a with ell_ab outside the span
of the sampled ell_(a_l,b) is at most r|P|/(t+1).

Summing over b shows that some sample has at most
r|P||Q|/(t+1) exceptional edges. For that sample put

```math
W_0=\sum_{l=1}^t\sum_{z=1}^r U_{a_l}^z,
\qquad \dim W_0\le t r q.
```

Every nonexceptional ell_ab lies in sum_l V_(a_l). For every allowed
map T, its image therefore lies in the same fixed W_0, even when T
is chosen separately for that edge. Each exceptional edge contributes
at most one further chosen column to the rank. Consequently

```math
\mathop{\mathrm{rank}}L
 \le t r q+\frac{r|P||Q|}{t+1}
 \qquad(t\ge0).
\tag{18}
```

Taking t of order sqrt(q) gives rank L=O(r q^(3/2)), uniformly over
all fixed scalar kappa, all dense C planes, and all independently
chosen output motions. Thus r=q^(o(1)) forces rank L<=q^(3/2+o(1)),
which contradicts (16). The proved source maps are valid, but they
cannot provide the desired trade at the required cost.

The bound uses the scalar linear evaluation ell_ab in V_a intersect
V_b. It does not address non-square-zero differential matrices,
ordered products with surviving second-order terms, flag-dependent
edge coefficients, or middle operators outside the special form
d_(z,h,c)^(ij)x_ij used in (8). Those are different source equations
and need their own complete coefficient calculations.
