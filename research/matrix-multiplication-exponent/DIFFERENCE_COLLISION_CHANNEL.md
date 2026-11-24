# Collision residue and one-insertion exterior target

Research status: the displayed residues, ranks, and target restriction
are proved. No local map from the allowed source to this target has
been constructed. Directly copying the passive labels has the
quadratic source cost explained in Section 4.

## 1. Fundamental collision residue

Let R_semi(u,v,hbar,q) be the semidynamical matrix in
Atalikov--Zotov, [arXiv:2303.02391v1](https://arxiv.org/abs/2303.02391v1), equation (3.2), as implemented
in irf_vertex_exact_candidate.py. Fix distinct ground labels i,j.
Keep other differences generic and use epsilon=q_i-q_j as a local
parameter. The coefficient of epsilon^(-1) is

```math
s\,(e_i\otimes e_j-e_j\otimes e_i)
  (e_i^*-e_j^*)\otimes(e_i^*-e_j^*).                    \tag{1}
```

Indeed only the two ordered pairs (i,j),(j,i) in the four terms of
equation (3.2) have a pole. Adding their matrix-unit coefficients
gives (1). This is a rank-one operator. In particular its restriction
to the shared input span of e_i tensor e_i and e_j tensor e_j is
nonzero; both diagonal inputs have the same image.

The intertwiner g(z,q) of [DIFFERENCE_PROJECTOR_IDENTITY.md](DIFFERENCE_PROJECTOR_IDENTITY.md) has
a rank-one simple pole at the same collision. Its two singular
columns have opposite leading coefficient vectors. Moreover
det g is a nonzero constant times z/Delta(q), so its determinant
has valuation -1 at the collision. Over the local discrete valuation
ring the Smith valuations are therefore exactly

```math
(-1,0,\ldots,0).
```

To justify this conclusion, all entries have valuation at least -1,
the residue matrix has rank one, and hence there is at most one
negative Smith valuation, equal to -1. All other valuations are
nonnegative; the determinant valuation makes them all zero.
Consequently the residue of exterior-power-k g has rank

```math
\binom{s-1}{k-1}=\binom sk\frac{k}{s}.                  \tag{2}
```

This is a rational-matrix residue statement. A difference shift may
move a flag height off the collision divisor, so a residue cannot
be commuted through a shift without expanding the translated
coefficient at its actual height.

## 2. An explicit large exterior C operator

Let V=exterior-power-k E, E=C^s, 1<=k<s, and p=binom(s,k).
Write c_x for exterior multiplication by x and a_l for contraction
by a covector l. Put l=e_i^*-e_j^*. The one-insertion exterior
operator suggested by (1) is

```math
K_{ij}=(c_i\otimes c_j-c_j\otimes c_i)
                  (a_l\otimes a_l):V\otimes V\to V\otimes V.
                                                               \tag{3}
```

Equation (3) defines a fixed complex C map. It is not being
identified with a fused R-matrix residue without a fusion proof.
Its exact rank is

```math
\mathop{\mathrm{rank}}K_{ij}
 =A^2+2AB
 =\binom{s-1}{k-1}^2-\binom{s-2}{k-2}^2,
\quad A=\binom{s-2}{k-1},\ B=\binom{s-2}{k-2}.          \tag{4}
```

Use the convention binom(n,-1)=0. To prove (4), put
u=e_i-e_j, v=e_i+e_j and let W be spanned by the remaining s-2
coordinate vectors. The image of a_l is exterior-power-(k-1)
(C v direct-sum W). Decompose its vectors as alpha_0+v wedge
alpha_1, where the two dimensions are A and B. On the pair of
alpha_0,beta_0 spaces, (3) is a nonzero multiple of

```math
u\wedge\alpha_0\otimes v\wedge\beta_0
 -v\wedge\alpha_0\otimes u\wedge\beta_0,
```

which is injective and has rank A^2. The two mixed spaces have
images in the disjoint occupancy sectors (uv,v) and (v,uv), and
have ranks BA and AB. The (v,v) input space maps to zero. The
three nonzero images are disjoint, proving (4).

The rank fraction is

```math
\frac{\mathop{\mathrm{rank}}K_{ij}}{p^2}
 =\left(\frac{k}{s}\right)^2
   \left(1-\left(\frac{k-1}{s-1}\right)^2\right).         \tag{5}
```

It is p^(-o(1)) when k tends to infinity and log k=o(log s).
This is an available target compression, not a source conversion.

## 3. An explicit ordinary target inside the compression

Take the usual copied-pair target T_(p,M), and apply K_(ij) at C.
Let m=binom(s-2,k-1). Restrict both outer A and outer B labels to
the coordinate k-subsets {i} union I', where I' ranges over
(k-1)-subsets avoiding i,j. Keep the corresponding independent D
tags. These are coordinate restrictions; no unproved change of
basis in copied unit labels is used.

Contraction by l sends e_i wedge e_(I') to e_(I'), up to the fixed
exterior ordering sign. At C, project the first factor onto subsets
containing i and not j, and the second onto subsets containing j
and not i. In (3) only its first summand survives. Its C labels are
therefore independently (i union I',j union J'). Relabeling these
and the D labels gives

```math
(K_{ij})_C T_{p,M}\ \ge\ T_{m,M},\qquad
\frac{m}{p}=\frac{k(s-k)}{s(s-1)}.                       \tag{6}
```

Exterior ordering signs factor by the two outer subsets and can
be removed by local diagonal maps. There is no loss of the M flag.
In the sparse regime p/m=p^(o(1)). Thus producing the full
collision-compressed target would suffice for the same leading
geodesic inequality even without using a spectral rank-fraction
lemma.

## 4. Why the direct copied-sector lift is too expensive

The direct one-insertion exterior lift has two independent passive
(k-1)-subset labels. Restrict both passive spaces to the coordinate
space W from Section 2. Retaining those labels at C and D gives the
copied tensor

```math
P_m=\sum_{I',J'} A_{I'}B_{J'}C_{I'J'}D_{I'J'}.           \tag{7}
```

Its AB-versus-CD flattening has rank m^2, and its ordinary
four-party rank is exactly m^2. Hence encoding the passive pair
as a full-unit index requires at least m^2 such labels. Even an
additional CD wire does not increase the AB-versus-CD rank of a
full unit. In the sparse regime this direct unit cost is

```math
m^2=p^{2-o(1)},
```

whereas the allowed shared-label budget is p^(1+o(1)). This is an
exact obstruction to the direct copied-sector implementation. It
is not a lower bound for implementations using the existing AD
and BD flags with noncommuting operators, height shifts, or further
cancellation. Those mechanisms must account for the passive labels
rather than silently treating them as part of the shared source
label at no cost.

## 5. The missing local equation

For the original tagged source, all six indices still have to obey

```math
\sum_{r,h,c}\Gamma^r_{\gamma,hc}
 \alpha_{r,h}^{a}X_{r,hc}^{IJ}\beta_{r,h}^{b}
 =\delta_{aI}\delta_{bJ}(K_{ij})_{\gamma,IJ}I_M.          \tag{8}
```

The source D map knows h,c,I,J, but B does not independently know
c. Equation (1), the shifted-projector identity, and (4) do not
establish (8). They identify a concrete sufficient output and the
precise passive-label cost that a positive construction must avoid.

The exact finite checks are reproducible with
python3 check_difference_projector_and_collision.py. They check
the actual rational residues, the ranks in (4), and identity
submatrices implementing (6) at the stated small parameters.

The finite exact replay is
[check_difference_projector_and_collision.py](check_difference_projector_and_collision.py).
The literal inverse-completion failure is separately preserved in
[IRF_SHARED_INVERSE_FAILURE.md](IRF_SHARED_INVERSE_FAILURE.md).
