# A square-C obstruction that survives Laurent limits

Research status: this is a proved obstruction for one source family with a square local C map. It applies to the unit source and to a local Frobenius trace-four source, including the Grassmannian source. It does not cover a larger rectangular source C space, or a sum of families using different C maps. It does not imply a lower bound on the matrix multiplication exponent.

## 1. A general source criterion

Let $`\mathcal S\in A_0\otimes B_0\otimes C_0\otimes D_0`$ be a fixed complex tensor with

```math
\dim C_0=p^2.
```

Suppose there is a subspace $`W\subseteq C_0^*`$ of dimension $`d`$, such that projecting the C leg to a basis of $`W`$ gives a tensor $`\mathcal S_W`$ whose one-party flattening ranks satisfy

```math
\mathop{\mathrm{rank}}_A\mathcal S_W\leq a_0,\qquad
\mathop{\mathrm{rank}}_B\mathcal S_W\leq b_0.                 \tag{1}
```

The choice of basis of $`W`$ does not affect these ranks. Consider the target

```math
T_{p,M}=\sum_{i,j=1}^p\sum_{w=1}^M
 A_{iw}B_{jw}C_{ij}D_{ij},                                  \tag{2}
```

whose C space also has dimension $`p^2`$.

**Theorem.** If $`\mathcal S`$ degenerates to (2) by local linear maps into these target spaces, then

```math
a_0b_0\geq dM^2.                                           \tag{3}
```

The degeneration may use arbitrary Laurent coefficients. The statement also holds for a convergent sequence of restrictions over $`\mathbb C`$.

## 2. Proof by a limiting covector space

Write the local maps of a formal degeneration as $`A(t),B(t),C(t),D(t)`$ over $`\mathbb C((t))`$, and suppose their full tensor output $`\mathcal T(t)`$ is regular at zero with constant term $`T_{p,M}`$. The target C flattening has rank $`p^2`$: its $`p^2`$ slices have distinct D labels and are nonzero. Therefore the C flattening of $`\mathcal T(t)`$ has rank $`p^2`$ over $`\mathbb C((t))`$. Because $`C(t)`$ is square, it is invertible over this field.

Let

```math
V(t)=\{v\in C_{\rm target}^*\otimes\mathbb C((t)):
                         vC(t)\in W\otimes\mathbb C((t))\}.
                                                                    \tag{4}
```

This subspace has dimension $`d`$. It is the inverse image of one source covector space. No direct-sum decomposition of the entire C space is required.

Set $`R=\mathbb C[[t]]`$ and $`K=\mathbb C((t))`$. The saturated lattice

```math
\mathcal L=V(t)\cap R^{p^2}
```

is free of rank $`d`$ and has torsion-free quotient in $`R^{p^2}`$. To see saturation, if $`t x\in\mathcal L`$ and $`x\in R^{p^2}`$, then $`x\in V(t)`$ because $`V(t)`$ is a $`K`$-linear space, hence $`x\in\mathcal L`$. A saturated submodule of a finite free module over the discrete valuation ring $`R`$ is a direct summand. Choosing a basis of $`\mathcal L`$ therefore gives a matrix

```math
P(t)\in\mathop{\mathrm{Mat}}_{d,p^2}(R),\qquad
\mathop{\mathrm{rank}}P(0)=d,                               \tag{5}
```

with row space $`V(t)`$ over $`K`$.

By (4), the tensor $`P(t)\mathcal T(t)`$ is obtained from $`\mathcal S_W`$ by local maps over $`K`$: the composite C map has all rows in $`W`$. Thus its A and B flattening ranks are bounded by $`a_0,b_0`$, respectively. The full tensor $`P(t)\mathcal T(t)`$ is regular, because both factors are regular. Vanishing minors remain zero on taking the constant term. Consequently

```math
\mathop{\mathrm{rank}}_A(P(0)T_{p,M})\leq a_0,\qquad
\mathop{\mathrm{rank}}_B(P(0)T_{p,M})\leq b_0.               \tag{6}
```

Put $`v_{ij}=P(0)e_{ij}`$. Let $`a`$ be the number of outer indices $`i`$ for which some $`v_{ij}\ne0`$, and $`b`$ the analogous number of indices $`j`$. The nonzero columns of $`P(0)`$ lie in an $`a`$-by-$`b`$ rectangle. Its rank is $`d`$, so

```math
ab\geq \#\{\hbox{nonzero columns of }P(0)\}\geq d.           \tag{7}
```

The first inequality only uses that at most $`ab`$ positions are available. The target flattening ranks are exactly

```math
\mathop{\mathrm{rank}}_A(P(0)T_{p,M})=aM,\qquad
\mathop{\mathrm{rank}}_B(P(0)T_{p,M})=bM.                    \tag{8}
```

For example, each active A coordinate $`A_{iw}`$ has a nonzero slice. The slices for different $`i`$ have disjoint D labels $`D_{ij}`$; for fixed $`i`$, different $`w`$ have disjoint B flag labels. They are therefore linearly independent. This proves the A formula, and the B formula is symmetric. Combining (6)--(8) proves (3).

The same argument covers coefficients in a finite Puiseux extension after reparametrization. It uses no bound on the pole orders of the original local maps.

For an arbitrary complex sequence of local restrictions converging to the target, the C maps are eventually invertible by the same full-rank argument. The spaces (4) lie in the compact complex Grassmannian. Pass to a convergent subsequence, and choose orthonormal row bases converging to an orthonormal basis of the limit space. The resulting maps $`P_n`$ are bounded and converge to a rank-$`d`$ map $`P_0`$. Then $`P_n\mathcal T_n\to P_0T_{p,M}`$; the same flattening-rank closure and support argument prove (3). Thus this is not an artifact of choosing a particular Laurent parametrization.

## 3. Unit-source instance

Take

```math
\mathcal S=U_{ABCD}(p)\,W_{CD}(p)\,W_{AD}(N)\,W_{BD}(N).
                                                                    \tag{9}
```

Its C dimension is $`p^2`$. Fix any unit label $`h`$, and let $`W`$ consist of the C covectors supported on that label and arbitrary on the C--D wire. Then $`\dim W=p`$. After applying these covectors, the A and B unit labels are fixed, so their flattening ranks are both $`N`$. The theorem gives

```math
\frac NM\geq\sqrt p.                                       \tag{10}
```

This remains true when the local C map becomes singular in the limit. The proof preserves only the one $`p`$-dimensional inverse covector space in (4); it never assumes that all transported sector projectors have simultaneous finite limits.

## 4. Local Frobenius instance

Let $`\mathcal A`$ be a $`p`$-dimensional commutative local Frobenius algebra over $`\mathbb C`$, with residue map $`\eta:\mathcal A\to\mathbb C`$, Frobenius functional $`\tau`$, and nonzero socle element $`s`$. Thus

```math
as=\eta(a)s,\qquad \tau(s)\ne0.
```

In a fixed basis, form its four-party tensor

```math
\mathcal F=\sum_{a,b,c,d}\tau(e_a e_b e_c e_d)\,
                       e_a^A e_b^B e_c^C e_d^D.
```

Contracting C by the covector whose values on the displayed basis are the coefficients of $`s`$ produces

```math
\tau(s)\left(\sum_a\eta(e_a)e_a^A\right)
         \left(\sum_b\eta(e_b)e_b^B\right)
         \left(\sum_d\eta(e_d)e_d^D\right).                  \tag{11}
```

This is a nonzero rank-one ABD tensor. If the basis contains $`s`$, the covector simply selects that basis coefficient.

Now use

```math
\mathcal S=\mathcal F\,W_{CD}(p)\,W_{AD}(N)\,W_{BD}(N).
```

Tensor the socle covector with all C--D wire covectors. Again $`d=p`$ and $`a_0=b_0=N`$, so (10) follows. In particular the [special Grassmannian Frobenius source](GRASSMANNIAN_FROBENIUS_SOURCE.md) of dimension $`\binom sk`$ cannot by itself realize the uncompressed full target with a square C map and negligible flag loss.

This does not make the Frobenius reorganization useless: distinct C maps in several source families, or a sufficiently large C compression, are outside the theorem. Those possibilities still require the full coupled coefficient equation.

## 5. Exact scope

The square hypothesis is essential to (4). If the source C space is larger than the target C space, the row space of the local C map need not intersect the chosen source space $`W`$ in any nonzero covector. A source size that is only a subpolynomial factor larger can already have this effect.

Likewise, for different C maps in different source families, selecting the inverse of one family's sector need not select a low-rank contraction of the other families. No bound for that situation is asserted.

Finally, a C-compressed target has lower C flattening rank. A compression with rank $`p^{2-o(1)}`$ can still have its dual image disjoint from each individual $`p`$-dimensional sector. The present argument does not exclude that proposed relaxation.

The potentially sufficient arbitrary C-compression criterion is
[ARBITRARY_C_COMPRESSION.md](ARBITRARY_C_COMPRESSION.md).
The common-invertible-C restriction bound for several families is
a separate result in [FLAG_EXCHANGE_OBSTRUCTIONS.md](FLAG_EXCHANGE_OBSTRUCTIONS.md).
