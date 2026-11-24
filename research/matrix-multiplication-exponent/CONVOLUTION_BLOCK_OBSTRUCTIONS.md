# Obstructions to two three-input convolution extractions

Status: exact obstructions to one proposed degeneration. The cut-rank obstruction applies to arbitrary local maps and requires polynomial source-unit overhead. The balanced-trade obstruction additionally identifies the failure of a direct diagonal-weight construction. Neither decides the matrix multiplication exponent.

## The proposed extraction

Let

```math
Q_m=\sum_{0\le i,j,k<m}e_i^A e_j^B e_k^C e_{i+j+k}^D.
```

In three tensor copies, write the input coordinates as

```math
A=(\alpha,\gamma,h_A),\qquad
B=(\beta,h_B,\varepsilon),\qquad
C=(h_C,\delta,\zeta).
```

The corresponding output coordinate is

```math
D=(\alpha+\beta+h_C,\ \gamma+\delta+h_B,\ \varepsilon+\zeta+h_A).
```

The natural proposal is to retain precisely the terms with
$`h_A=h_B=h_C=h`$. At fixed $`h`$, the resulting block is locally isomorphic to

```math
P_{ABD}(m,m)\otimes P_{ACD}(m,m)\otimes P_{BCD}(m,m),
```

where the three factors at $`D`$ record the three pairwise sums. The shift of each output coordinate by $`h`$ is a local injection at $`D`$ for this individual block. Different blocks have independent spaces at $`A,B,C`$ and share the output space at $`D`$. No common output relabelling across all blocks is assumed.

An initial conditional calculation suggested this extraction: if it existed with only a subpolynomial loss of dimensions and full-unit overhead, the new free-$`ABC`$ partial-sum inequality would give, for a normalized extension with $`u(ABC)=1`$ and rigid tripod-face values,

```math
F(Q_m)^3\ge m\,m^{2(a+b+c)}.
```

Since $`R(Q_m)=3m-2`$, passing to unbounded $`m`$ would force $`a+b+c\le1`$. The next section proves that the required extraction is impossible. The calculation must not be used as an attack that only lacks a construction.

Even without spectral extension, use the same output contraction in all blocks: retain degree $`L=\lfloor3(m-1)/2\rfloor`$ in each of the three output coordinates. In block $`h`$, each pairwise sum must then equal $`L-h`$. For $`0\le h<m`$, the number of pairs $`(i,j)\in\{0,\ldots,m-1\}^2`$ with $`i+j=L-h`$ is at least $`\lfloor m/2\rfloor`$. The contracted block therefore contains a matrix multiplication tensor of edge size $`\lfloor m/2\rfloor`$. Since the other three parties have independent block labels, the contracted target is a full direct sum of $`m`$ such tensors. A sufficiently efficient extraction is therefore already a matrix multiplication construction; matching local dimensions does not prove it exists.

## A two-versus-two cut rules out the intended comparison

Across the cut $`AB\mid CD`$, the flattening rank of $`Q_m`$ is $`2m-1`$. Indeed, after grouping $`AB`$, its rows are indexed effectively by $`i+j`$. The corresponding $`CD`$ vectors $`\sum_k e_k^C e_{i+j+k}^D`$ are linearly independent because their supports are disjoint. Hence the source $`Q_m^{\otimes3}`$ has cut rank $`(2m-1)^3`$.

One target block has cut rank

```math
(2m-1)m^2.
```

The three factors contribute respectively $`2m-1`$, $`m`$, and $`m`$: the first is output-flattened at $`D`$, and the other two are input-flattened at $`A`$ and $`B`$. Their product flattening is a Kronecker product. Although $`D`$ is shared across blocks, the block label at $`C`$ makes their column spaces independent, and those at $`A,B`$ make their row spaces independent. Thus the whole proposed target has cut rank

```math
m^3(2m-1).
```

A full-unit source overhead $`U_4(r)`$ multiplies the source cut rank by $`r`$. Restriction or degeneration therefore requires

```math
r\ge\frac{m^3}{(2m-1)^2}.
```

This is $`\Theta(m)`$, not subpolynomial. The same obstruction tensorizes, and losses of the form $`m^{o(1)}`$ in block counts or dimensions do not remove its exponent. Consequently this proposed extraction cannot be repaired by nonmonomial local maps while retaining its stated asymptotic resources. A different block target is required.

## A balanced trade obstructs the direct weight construction

A diagonal-weight degeneration assigns an integer weight to each input basis vector and output basis vector. The weight of a tensor coefficient is their sum. After a common shift, all surviving target terms must have weight zero and all other source terms must have nonnegative weight. Coordinate deletions may first remove basis vectors, but every basis vector needed by the desired target must be retained.

For every $`m\ge2`$, the following three source terms have unequal block labels:

| Term | A | B | C | D |
|---|---|---|---|---|
| $`s_1`$ | 001 | 100 | 010 | 111 |
| $`s_2`$ | 000 | 010 | 000 | 010 |
| $`s_3`$ | 000 | 000 | 100 | 100 |

Each entry is a three-coordinate integer vector, and the output column is the componentwise sum of the three input columns. The block labels are the third coordinate of $`A`$, second coordinate of $`B`$, and first coordinate of $`C`$.

The desired target contains these three terms:

| Term | A | B | C | D |
|---|---|---|---|---|
| $`t_1`$ | 001 | 010 | 100 | 111 |
| $`t_2`$ | 000 | 100 | 000 | 100 |
| $`t_3`$ | 000 | 000 | 010 | 010 |

Their common block labels are respectively $`1,0,0`$. At every party, the multiset of its three coordinates in the first table equals the multiset in the second table. Consequently, for every choice of local additive weights,

```math
w(s_1)+w(s_2)+w(s_3)
=w(t_1)+w(t_2)+w(t_3).
```

All three right-hand weights must be zero. All three left-hand weights are nonnegative, so they are also zero. Thus the three unwanted source terms survive every such diagonal-weight degeneration. Coordinate deletion does not help: every local coordinate they use appears in a required target term.

The proposed extraction therefore has no degeneration obtained solely by assigning diagonal weights and deleting coordinates in these displayed bases. This balanced-trade argument alone does not cover preliminary nonmonomial basis changes, cancellation by nonmonomial maps, or a target that omits some of the required sectors. The cut-rank obstruction above does cover arbitrary maps at the intended asymptotic resource level.

The companion `check_convolution_block_trade.py` verifies the source support, target block labels, and the equality of the four local coordinate multisets using exact integer tuples.


---

## A symmetrizer obstruction to full-size convolution extraction

Status: a proved finite obstruction. It rules out extracting a concise direct sum of nontrivial matrix multiplication tensors from a symmetric source when the first two source and target dimensions agree. It permits constant-factor dimension compression and source-only full-unit overhead. It does not rule out the asymptotic matrix multiplication target.

### A basis-independent linear invariant

Let $`T\in A\otimes B\otimes C`$, with $`\dim A=\dim B=n`$. Regard $`T`$ as a bilinear map $`A^*\times B^*\to C`$. Define its first-two-party symmetrizer space by

```math
\mathop{\mathrm{Sym}}_{A,B}(T)
=\{S\in\mathop{\mathrm{Hom}}(A^*,B^*):
T(x,Sy)=T(y,Sx)\text{ for all }x,y\in A^*\}.
```

This definition requires no chosen identification of the two spaces. It is the kernel of a linear map

```math
\mathop{\mathrm{Hom}}(A^*,B^*)
\longrightarrow \mathop{\mathrm{Hom}}(\Lambda^2A^*,C),
\qquad S\longmapsto[(x,y)\longmapsto T(x,Sy)-T(y,Sx)].
```

In fixed bases, the matrix of this map has entries linear in the coefficients of $`T`$. Therefore the condition $`\dim\mathop{\mathrm{Sym}}_{A,B}(T)\ge1`$ is Zariski closed: it is the failure of full column rank of this linear-equation matrix.

The dimension is invariant under invertible local changes of basis. Explicitly, suppose

```math
T'(x,y)=R\,T(P^*x,Q^*y),
```

where $`P,Q,R`$ are invertible maps at the three tensor factors. Then

```math
S\longmapsto (Q^*)^{-1}SP^*
```

is an isomorphism between the two symmetrizer spaces. Substitution into the defining identity proves this assertion in both directions.

If $`T`$ is symmetric in its first two factors after an identification $`A^*\cong B^*`$, that identification is an invertible nonzero element of its symmetrizer space. Thus every tensor in its local general-linear orbit closure still has a nonzero symmetrizer.

For slices $`M_z`$ of $`T`$ regarded as $`n\times n`$ matrices, the same equations say

```math
M_z S=(M_zS)^{\mathsf T}\qquad\text{for every slice }z.
```

The invariant is only a kernel dimension; invertibility of a symmetrizer need not persist in a limit.

### Matrix multiplication has no nonzero symmetrizer

Let $`V=\bigoplus_{h=1}^r\mathop{\mathrm{Mat}}_{\ell_h}(\mathbb C)`$, where every $`\ell_h\ge2`$. Consider the direct-sum multiplication tensor

```math
T(X,Y,Z)=\sum_{h=1}^r\mathop{\mathrm{tr}}(X_hY_hZ_h).
```

Suppose $`S:V\to V`$ is a first-two-party symmetrizer. Nondegeneracy of the trace pairing implies

```math
X_h(SY)_h=Y_h(SX)_h
\qquad\text{for all }X,Y\in V\text{ and every }h.
```

Write $`S_{hk}`$ for its block maps. Fix $`h\ne k`$, take $`X_h=I`$ with all other components zero, and take $`Y`$ supported only in block $`k`$. The displayed identity in block $`h`$ gives $`S_{hk}(Y_k)=0`$. Hence every off-diagonal block map vanishes.

Within one block, setting $`Y=I`$ gives

```math
S(X)=XK,\qquad K=S(I).
```

Substitution back into the identity gives $`[X,Y]K=0`$ for all matrices $`X,Y`$. For $`i\ne j`$, take $`X=E_{ii}`$ and $`Y=E_{ij}`$. Then $`E_{ij}K=0`$. For each row $`j`$, choose some $`i\ne j`$; this equation says that row $`j`$ of $`K`$ is zero. Thus $`K=0`$ and $`S=0`$ in every block. Therefore

```math
\mathop{\mathrm{Sym}}_{A,B}(T)=0.
```

### Application to coefficient-designed convolution sources

Contract the fourth party of $`Q_m^{\otimes3}`$ by any coefficient array $`w`$. The resulting tensor is

```math
H_w=\sum_{a,b,c\in\{0,\ldots,m-1\}^3}
w_{a+b+c}\,e_a^A e_b^B e_c^C.
```

It is symmetric in $`A,B,C`$, and all three local dimensions are $`n=m^3`$. The desired full-size target consisting of $`m`$ direct-sum copies of $`MM_m`$ is concise in exactly the same dimensions. It has zero first-two-party symmetrizer by the preceding proof.

Consequently no $`H_w`$ can degenerate to this target by local square maps. This also holds when $`w`$ depends on the degeneration parameter: every nonzero-parameter source is symmetric, and the nonzero-symmetrizer condition is closed. A concise target of dimension $`n`$ forces the square local maps at $`A,B`$ to be generically invertible; otherwise their flattening ranks would be at most $`n-1`$, which cannot increase in the limit.

This explains why choosing a coefficient array and then making square basis changes cannot supply the desired extraction. The obstruction does not apply to $`m`$ copies of $`MM_{\lfloor cm\rfloor}`$ with fixed $`0<c<1`$: the local maps are then rectangular. It also does not apply after adding a source-only full-unit factor, which enlarges the source dimensions. Those are genuine remaining cases, not cases settled by this invariant.
