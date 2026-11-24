# Filtering a noncentral operator target to weighted copied support

Research status: the filtering and density implications below are proved. The required legal source map to the displayed noncentral tensor is not established. In particular, the copied C and D tags in the hypothesis must be verified before this lemma is applied.

## 1. The exact finite-group filter

Let the target outer labels be $`i,j\in[p]`$, and let a common A/B flag space have basis $`\{e_f:f\in\mathcal F\}`$, of size M. Give every flag basis vector an integral charge $`h(f)`$. Suppose a tensor already has the form
```math
U=\sum_{i,j}\sum_{a,b}\sum_{f,g}
 H_{ab}^{ij}(f,g)\,A_{a,f}B_{b,g}C_{ij}D_{ij}.
\tag{1}
```
Thus both copied tags in (1) are exact. The A/B coefficients may still have wrong outer labels and off-diagonal flag entries.

Fix a positive integer K and a primitive K-th root of unity $`\zeta`$. For $`0\le t\lt K`$, act locally on the output flags by
```math
A_{a,f}\longmapsto\zeta^{t h(f)}A_{a,f},\qquad
B_{b,g}\longmapsto\zeta^{-t h(g)}B_{b,g},
```
and leave C and D fixed. Average these K local images, inserting the scalar $`1/K`$ at any one party. The result is exactly
```math
\mathcal P_K(U)=
 \sum_{h(f)\equiv h(g)\;({\rm mod}\ K)}
 H_{ab}^{ij}(f,g)\,A_{a,f}B_{b,g}C_{ij}D_{ij}.
\tag{2}
```
This follows from the finite geometric sum. Consequently $`U_{ABCD}(K)U`$ restricts to $`\mathcal P_K(U)`$. If U is itself a restriction or a Laurent degeneration from r fixed source families, composing these maps uses Kr families. The average is finite and is taken on the complete output tensor, so no operator constant-term operation or index postselection is introduced.

If every nonzero charge difference has absolute value less than K, (2) retains exactly the zero-charge part. Write that part as
```math
\sum_{(i,j,f)\in E}w_{ij}(f)
       A_{i,f}B_{j,f}C_{ij}D_{ij}+Z,
\tag{3}
```
where every displayed weight is nonzero. The residual Z consists of all other zero-charge coefficients. It is retained by the filter. Therefore the weighted-target conclusion requires an independent proof that $`Z=0`$. A wrong outer label with zero flag charge, an off-diagonal flag matrix within a weight space, or an unverified C/D tag cannot be discarded by this argument.

For several independent flag gradings, use the product of the corresponding cyclic groups. The family cost is the product of their orders. It is subpolynomial in p precisely when the sum of the logarithms of those orders is $`o(\log p)`$.

## 2. Recovery from nonzero diagonal weights

Assume $`Z=0`$, and put $`\rho=|E|/(p^2M)>0`$. The partial weighted hypergraph support theorem gives
```math
F(\mathcal P_K(U))\ge\rho F(T_{p,M})
\quad\hbox{for every normalized spectral point }F,
\tag{4}
```
where
```math
T_{p,M}=\sum_{i,j,f}A_{i,f}B_{j,f}C_{ij}D_{ij}.
```
Hence
```math
F(U)\ge\frac{\rho}{K}F(T_{p,M}).
\tag{5}
```
There is no bound on the magnitudes of the nonzero weights in (3).

For clarity, the density assertion uses a fixed-parameter tensor-power cover. The product permutation group on $`[p]\times[p]\times\mathcal F`$ acts transitively and is implemented locally on the copied labels. For each positive integer n, at most
```math
\left\lceil(n\log(p^2M)+1)\rho^{-n}\right\rceil
```
randomly chosen translated copies suffice to cover the whole product support. The union bound gives existence. A generic scalar linear combination of the chosen copies has every support coefficient nonzero. The full-support weighted-hypergraph untwisting theorem then recovers the complete target asymptotically. Taking n-th roots removes the displayed logarithmic prefactor, irrespective of how large M is relative to p. These are the same support-cover and coefficient-untwisting operations proved in the partial-density note and GENERAL_FREE_SET_SEPARATOR.md, Section 5.

Thus $`K=p^{o(1)}`$ and $`\rho=p^{-o(1)}`$ are sufficient losses. The conclusion does not require a scalar identity on every retained flag.

## 3. An explicit additive Casimir target

Let $`V=\Lambda^k\mathbb C^s`$, with $`1\le k\lt s`$, and
$`p={s\choose k}`$. Its basis labels are k-subsets I. Let
$`W_L=\mathop{\mathrm{Sym}}^L\mathbb C^s`$, with monomial basis
$`x^n`$, $`n=(n_0,\ldots,n_{s-1})`$, $`n_a\ge0`$, $`\sum_an_a=L`$.
Its dimension is $`M={L+s-1\choose s-1}`$.

Use the usual additive actions $`\rho_V(E_{ab})`$ and
$`\rho_W(E_{ab})=x_a\partial_b`$, and define the operator-valued matrix
```math
G=\sum_{a,b=0}^{s-1}
       \rho_V(E_{ab})\otimes\rho_W(E_{ba})
       \quad\hbox{on }V\otimes W_L.
\tag{6}
```
For each pair I,J, let $`E_{IJ}`$ be the corresponding auxiliary matrix unit. Define a four-party tensor $`\mathcal U_G`$ by its complete A/B coefficient matrices:
```math
(\mathcal U_G)^{IJ}_{AB}
  =G(E_{IJ}\otimes I)-(E_{IJ}\otimes I)G,
\qquad\hbox{with C,D coefficient }C_{IJ}D_{IJ}.
\tag{7}
```
Equation (7) is a target definition, not a construction from the allowed source. In particular, it already includes the full copied I,J labels at both C and D.

Give a monomial the charge
```math
h(n)=\sum_{a=0}^{s-1}a n_a.
```
For $`a\ne b`$, $`\rho_W(E_{ba})`$ changes this charge by $`b-a`$, whose absolute value is at most $`s-1`$. The diagonal term $`a=b`$ is multiplication by $`n_a`$. Therefore the filter with K=s removes every off-diagonal physical generator in (6). It leaves
```math
G_0=\sum_{I,n}\left(\sum_{a\in I}n_a\right)
        |I,n\rangle\langle I,n|.
```
Since the flag torus commutes with every $`E_{IJ}\otimes I`$, filtering (7) gives exactly
```math
\mathcal P_s(\mathcal U_G)
 =\sum_{I,J,n}
    \left(\sum_{a\in I}n_a-\sum_{a\in J}n_a\right)
 A_{I,n}B_{J,n}C_{IJ}D_{IJ}.
\tag{8}
```
There is no zero-charge residual Z in this specific computation. The diagonal Cartan operators act diagonally in the displayed monomial basis; merely knowing that an operator preserves weight spaces would not suffice.

## 4. The surviving support has constant density

Assume $`L\ge1`$. When $`I\ne J`$, choose
$`a\in I\setminus J`$ and $`b\in J\setminus I`$. Fix all occupation numbers except $`n_a,n_b`$. Their sum is fixed, and the weight in (8) is an affine function of $`n_a`$ with nonzero coefficient two. At most one allocation can make it zero. The number of choices for the other $`s-2`$ occupation numbers, with sum at most L, is
$`{L+s-2\choose s-2}`$. Hence the zero-weight fraction for every fixed $`I\ne J`$ is at most
```math
\frac{{L+s-2\choose s-2}}{{L+s-1\choose s-1}}
 =\frac{s-1}{L+s-1}.
\tag{9}
```
For $`I=J`$, every coefficient is zero. Thus the total surviving support density in (8) obeys
```math
\rho\ge\left(1-\frac1p\right)\frac{L}{L+s-1}.
\tag{10}
```
In particular $`L\ge s`$ gives a density bounded below by a positive constant uniformly in s and k. Equations (5),(8)--(10) prove the concrete conditional lower bound
```math
F(\mathcal U_G)
 \ge\frac1s\left(1-\frac1p\right)
       \frac{L}{L+s-1}\,F(T_{p,M}).
\tag{11}
```

This avoids any simultaneous A/B projection argument: the operation is an explicit finite sum of local flag phases, followed by weighted-support recovery. The surviving weights can depend on the common flag and on both copied outer labels.

With two independent flag spaces, one can similarly use a Sylvester target $`G_X E_{IJ}-E_{IJ}G_Y`$, keep the complete copied tags, and average the two flag tori independently at cost $`s^2`$. Its surviving weight is $`\sum_{a\in I}n_a^X-\sum_{a\in J}n_a^Y`$. For every fixed Y monomial and I,J, varying one X occupation inside I against one outside I shows that the zero fraction is at most $`(s-1)/(L_X+s-1)`$. Thus this variant also has constant surviving density for $`L_X\ge s`$. This assertion concerns the displayed additive generators and the exact copied-label target, not an arbitrary fused operator.

## 5. What remains to be constructed

If $`\log s=o(\log p)`$, the costs s or $`s^2`$ above are subpolynomial in p. A legal source map to (7), or to the stated independent-flag Sylvester variant, with the required source and neutral-flag costs would therefore suffice for the weighted geodesic trade. Such a map remains open.

The finite outside-weight scalarization theorem still applies. If both outside operator families have only $`p^{o(1)}`$ flag shifts and the source has border rank $`p^{1+o(1)}`$, a full copied weighted target cannot simply be produced at the required costs. The possible use of the present relaxation is a construction with large fused, Lax, or resolvent outside support whose complete surviving off-target output is only the additive single-exchange action in (6). No such cancellation is proved here.

A general fused minor can shift several occupations at once. Its total charge can then be zero even when the flag changes. Such terms survive (2), and the s-point filter used in (8) does not remove them. They must be kept in Z or eliminated by a separate proved identity.

The exact checker `check_torus_weighted_target.py` constructs the additive exterior and polynomial actions, verifies the filtered diagonal operator and the density bound in 30 small parameter cases, and retains an explicit surviving two-exchange shift. For example, at $`s=4,k=2,L=2`$, exactly 180 of the 360 copied target positions survive. It does not test or claim a source conversion to (7).
