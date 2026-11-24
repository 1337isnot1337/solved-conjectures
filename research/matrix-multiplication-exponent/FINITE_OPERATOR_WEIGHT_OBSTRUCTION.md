# A finite weight-support obstruction for operator trade identities

Research status: the exact scalarization theorem and its finite flag-basis version below are proved. They restrict the indicated operator ansatzes. They do not bound the matrix multiplication exponent.

The scalarization does not assume that the D operators commute. It uses the finite set of weights occurring in the outside A and B operators.

## 1. The constant source and the desired operator identity

Let $`S_z`$ be constant four-party source tensors, one for each family $`z`$, and put

```math
P_z=\mathop{\mathrm{rank}}_{AB\mid CD}(S_z).
```

An additional C--D wire may have any size; it does not change this flattening rank. Denote the source coefficients by $`s^{(z)}_{\lambda\mu\nu\rho}`$. An operator-valued restriction has coefficients

```math
\sum_{z,\lambda,\mu,\nu,\rho,c}
s^{(z)}_{\lambda\mu\nu\rho}
\Gamma^{(z)}_{\gamma,\nu c}
A^{a}_{z,\lambda}D^{\delta}_{z,\rho c}B^{b}_{z,\mu}
=T_{ab\gamma\delta}I.                                   \tag{1}
```

The C coefficients $`\Gamma`$ are complex scalars. The operator order in (1) is exactly A, D, B. The operators may belong to a Weyl division ring, and all D operators may be arbitrary elements of that division ring.

The theorem below constructs a scalar local restriction from more copies of the same unflagged sources to $`T`$. Thus it preserves all actual source indices in (1).

## 2. One Weyl variable

Write $`x`$ for the flag variable, $`\partial`$ for its derivative, and $`E=x\partial`$. The relation is

```math
E x=x(E+1).
```

Suppose the outside coefficients have finite uniform weight supports:

```math
A^{a}_{z,\lambda}
 =\sum_{\alpha\in\mathcal S_{A,z}}
       x^\alpha f^{a}_{z,\lambda,\alpha}(E),\qquad
B^{b}_{z,\mu}
 =\sum_{\beta\in\mathcal S_{B,z}}
       x^\beta h^{b}_{z,\mu,\beta}(E),                    \tag{2}
```

where every displayed function is rational and the same two finite support sets work for every local index within that family.

The Weyl division ring embeds in the skew Laurent series division ring with right-normal form

```math
\sum_{d\ge d_0}x^d g_d(E),\qquad g_d(E)\in\mathbb C(E).
                                                               \tag{3}
```

For clarity, this embedding can be constructed directly. Send $`\partial`$ to $`x^{-1}E`$; the relation $`\partial x-x\partial=1`$ holds. The PBW monomials remain independent: at a fixed $`x`$-degree, their coefficients are falling-factorial polynomials in $`E`$ of different degrees. Nonzero series in (3) are invertible by factoring out their lowest nonzero monomial and then using a geometric series of positive valuation. The embedding therefore extends to rational Weyl expressions.

Expand each D coefficient in (3). The product rule is

```math
x^\alpha f(E)\,x^d g(E)\,x^\beta h(E)
=x^{\alpha+d+\beta}
 f(E+d+\beta)g(E+\beta)h(E).
```

Its degree-zero contribution uses $`d=-\alpha-\beta`$ and is

```math
f(E-\alpha)\,g_{-\alpha-\beta}(E+\beta)\,h(E).             \tag{4}
```

Only finitely many such contributions occur because the outside support sets are finite. Extracting degree zero in (1), and then evaluating $`E=t`$ at one complex number avoiding the finitely many relevant poles, gives a scalar tensor identity. For each fixed $`(z,\alpha,\beta)`$, its factors are local:

```math
A:\ f^{a}_{z,\lambda,\alpha}(t-\alpha),\qquad
D:\ g^\delta_{z,\rho c,-\alpha-\beta}(t+\beta),\qquad
B:\ h^{b}_{z,\mu,\beta}(t).
                                                               \tag{5}
```

The C map is unchanged. Thus each pair of weights uses one copy of $`S_z`$ with its C--D wire. Flattening rank gives

```math
\mathop{\mathrm{rank}}_{AB\mid CD}T
 \le\sum_z
 |\mathcal S_{A,z}|\,|\mathcal S_{B,z}|\,P_z.              \tag{6}
```

The D coefficients in this argument need not have finite weight support or be polynomial differential operators.

## 3. Several independent Weyl variables

The same proof works for $`m`$ independent Weyl pairs $`x_i,\partial_i`$ and the commuting Euler operators $`E_i=x_i\partial_i`$. Use multiweights $`\alpha,\beta\in\mathbb Z^m`$, and coefficient functions in the commutative field $`\mathbb C(E_1,\ldots,E_m)`$.

One may embed the Weyl division ring into an iterated skew Laurent series field, with each $`x_i`$ shifting $`E_i`$ and fixing the other Euler operators and variables. Each specified multiweight coefficient is a rational function of the Euler operators. Since the A and B supports are finite, degree-zero extraction still uses only one D coefficient for each pair $`(\alpha,\beta)`$. Formula (4) becomes

```math
f(E-\alpha)\,g_{-\alpha-\beta}(E+\beta)\,h(E),              \tag{7}
```

with componentwise shifts. Evaluating at a generic $`t\in\mathbb C^m`$ gives the same bound (6).

Consequently many independent Weyl variables alone do not evade this theorem. What matters here is the number of distinct outside weight vectors. A degree-k expression in $`s^2`$ independent variables can have $`s^{O(k)}`$ weights; that count is not subpolynomial in $`p=\binom sk`$ in the sparse regime.

## 4. Consequence for a C-compressed target

For the scalar target

```math
T_L=\sum_{i,j=1}^p A_i\otimes B_j\otimes L(C_{ij})\otimes D_{ij},
```

the $`AB\mid CD`$ flattening rank is the number of nonzero columns of $`L`$. The AB basis vectors are distinct, and their nonzero CD vectors are independent because the D labels are distinct. Hence

```math
\mathop{\mathrm{rank}}L
\le\#\{(i,j):L(C_{ij})\ne0\}
\le\sum_z|\mathcal S_{A,z}|\,|\mathcal S_{B,z}|\,P_z.      \tag{8}
```

If $`P_z=p^{1+o(1)}`$, the number of families is $`p^{o(1)}`$, and both uniform support counts are $`p^{o(1)}`$, this cannot produce a C map of rank $`p^{2-o(1)}`$.

This includes a polynomial quantum source $`\mathcal F_\kappa=\sum_\ell\kappa^\ell\mathcal F^{[\ell]}`$ after replacing it by its $`O(k)`$ constant coefficient sources and placing each scalar power $`\kappa^\ell`$ in the D operator. The coefficient-source expansion is essential: a power depending on several source labels must not be assigned to D without that expansion.

## 5. A finite flag-basis proof requiring no division ring

There is also a direct finite-dimensional version. Suppose the A and B target flag spaces have a common chosen basis vector $`v`$. After contracting the A output flag with $`v^*`$, assume every A coefficient uses only a common set of $`a_z`$ source flag basis vectors, independent of its outer and source-algebra indices. After fixing the B output flag to the corresponding basis vector, assume its source support is similarly at most $`b_z`$.

The source A--D and B--D wires can then be restricted to these two sets before applying any local maps. Across $`AB\mid CD`$ their rank contribution is at most $`a_zb_z`$. Therefore the same contraction of the complete output has flattening rank at most

```math
\sum_z a_zb_zP_z.                                       \tag{9}
```

D is arbitrary. The bound also holds for Laurent maps with these fixed source support sets: the complete contracted output belongs to a fixed bounded-rank flattening variety, which is closed.

For ordinary bosonic monomial flags, every weight space is one-dimensional. A uniform set of Weyl weights sends a fixed output monomial to at most that many source monomials. Thus $`a_z\le|\mathcal S_{A,z}|`$ and $`b_z\le|\mathcal S_{B,z}|`$. This proves the same sparse-support restriction for such finite flag models, without evaluating an Euler operator formally.

## 6. The elementary bosonic Pieri channels do not evade the bound

Let the auxiliary space be $`V=\Lambda^k\mathbb C^s`$, and let the flag be $`\mathop{\mathrm{Sym}}^L\mathbb C^s`$. With exterior creation and annihilation operators $`c_i,a_i`$, put

```math
d=\sum_i c_i\partial_i,\qquad
\delta=\sum_i a_i x_i,\qquad
G=d\delta.
```

As a matrix of flag operators, $`G`$ has only the weights

```math
0,\quad e_j-e_i\quad(i\ne j),                            \tag{10}
```

at most $`1+s(s-1)`$ possibilities. In the subset basis its zero-weight part is diagonal:

```math
[G_{I,J}]_0
 =\delta_{I,J}\sum_{i\in I}(E_i+1).                      \tag{11}
```

Indeed $`G=\sum_{i,j}c_i a_j\partial_i x_j`$, and only $`i=j`$ has zero flag weight.

On a fixed monomial $`x^n`$ of total degree $`L`$, the diagonal coefficient in (11) is $`\sum_{i\in I}(n_i+1)>0`$. The two Pieri projectors are $`G/(L+k)`$ and $`I-G/(L+k)`$. For the second one the same diagonal coefficient is

```math
\frac{\sum_{i\notin I}n_i}{L+k}.                         \tag{12}
```

When $`L\ge s`$, one may choose all $`n_i\ge1`$, so both projectors have nonzero diagonal entries at every outer subset. There is also a uniform bound for every $`L\ge1`$. For a complementary channel choose the monomial $`x_t^L`$, $`1\le t\le s`$. Its diagonal in (12) is nonzero exactly when $`t\notin I`$. Each outer subset survives $`s-k`$ of these $`s`$ choices.

For separate X and Y flags, one may choose these monomials independently at each complementary channel. Let $`c\in\{0,1,2\}`$ be the number of complementary channels; a channel $`G/(L+k)`$ needs no averaging, since its diagonal is always nonzero. Write

```math
B_{\rm cap}=\sum_z a_zb_zP_z.
```

For each of the $`s^c`$ choices, (9) bounds the number of surviving nonzero C columns by $`B_{\rm cap}`$. Each nonzero column survives exactly $`(s-k)^c`$ choices. Summing gives

```math
\mathop{\mathrm{rank}}L
\le\#\{(i,j):L(C_{ij})\ne0\}
\le\left(\frac{s}{s-k}\right)^c B_{\rm cap}.              \tag{13}
```

The additional factor is at most $`s^2=p^{o(1)}`$ in the sparse regime. A complementary channel at $`L=0`$ is zero and cannot supply the required target.

It follows that source maps whose outside operators are scalar linear combinations of $`I,G`$, or products of a fixed number of such independent flag-channel maps, cannot attain a C compression of rank $`p^{2-o(1)}`$ from $`p^{1+o(1)}`$-rank sources with subpolynomially many families in the sparse regime. Their uniform weight supports have size $`s^{O(1)}=p^{o(1)}`$, so (8) or (9) applies even though the chosen target channel itself has a sufficiently large dimension.

This is not a claim about arbitrary rectangular highest-weight flags, arbitrary degree-k fused operators, or arbitrary finite matrix maps. Their source support counts or weight multiplicities can be much larger.

## 7. Fixed ground rotations in bounded words

The preceding corollary permits more than a fixed choice of ground basis. Suppose an outside map is a word of length at most $`b`$ in factors from the span of $`I,G`$, constant auxiliary matrices, and fixed ground rotations on its bosonic flag. Each ground rotation here is a single representation operator $`\rho(g)`$ on the whole flag, uniform across every auxiliary input, auxiliary output and source index in that matrix word. It cannot be chosen separately for those indices.

Equivariance gives

```math
(I\otimes\rho(g))G
 =(\Lambda^k g^{-1}\otimes I)\,
   G\,(\Lambda^k g\otimes\rho(g)).
```

Thus all flag rotations in an A word can be moved to its right end, at the cost of changing only constant auxiliary matrices. The resulting common rightmost flag rotation is absorbed into the left side of the arbitrary D operator. For a B word, move its flag rotations to the left end and absorb them into D on the right. This respects the order A, D, B.

The remaining entries have weight support contained in the b-fold sum of the set (10), so their uniform support count is at most $`(1+s(s-1))^b`$. Words with $`b=o(k)`$ still have support $`p^{o(1)}`$ in the sparse regime and remain subject to the same capacity obstruction.

This statement does not permit moving an input-controlled or output-controlled flag rotation through D. If the rotation depends on a local auxiliary or source label unavailable at D, that dependence must be retained; the reduction above does not apply to it. In a coupled Frobenius source, for example, D knows its own source label $`\rho`$, and need not know the A or B source labels $`\lambda,\mu`$.

## 8. Scope of the scalarization

Equation (6) concerns an exact Weyl-division-ring identity with the finite outside supports in (2). It does not automatically commute with an unrelated degeneration parameter. For example, expanding $`(t+x)^{-1}`$ in powers of $`x`$ produces coefficients with unbounded negative t-orders as the x-degree grows. A t-limit and x-degree extraction must not be interchanged without a separate uniform argument.

The finite flag statement (9) has its own valid border extension when the indicated sparse source supports are fixed.

Nonhomogeneous rational outside operators can have infinitely many weights in their skew Laurent expansions. Large weight-support sets, or flag representations with large relevant weight spaces, remain possible escapes. The theorem does not exclude those ansatzes or the desired geodesic inequality.


The source component expansion invoked in Section 4 is
[QUANTUM_GRASSMANNIAN_COMPONENTS.md](QUANTUM_GRASSMANNIAN_COMPONENTS.md).
The operator-to-finite-tensor realization is
[WEYL_DIVISION_TRADE_TRANSFER.md](WEYL_DIVISION_TRADE_TRANSFER.md);
it requires a complete identity before the realization can be used.
