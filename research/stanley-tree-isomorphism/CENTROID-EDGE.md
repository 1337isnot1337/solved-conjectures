# Reconstructing repeated branches and separating the centroid edge

Let $`X_T`$ be the ordinary chromatic symmetric function of a finite tree. Two operations on its spanning-forest polynomial give partial answers to Stanley's tree-isomorphism question. The first recovers branches of repeated size using a bound on the number of *distinct rooted shapes* of that size. The second recovers the ordinary forest polynomials of the two halves of a tree when an edge separates it into equal parts and the branches off that edge satisfy a recovery condition. [Stanley, §2](https://sites.math.washington.edu/~billey/classes/Hopf.algebra/bulletins/stanley.1995.pdf) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/315)

**Single-centroid case.** Root an $`n`$-vertex tree at its unique centroid. Let $`s_b`$ count the distinct isomorphism types of rooted branches of order $`b`$. If $`4bs_b\le\lfloor(n-1)/2\rfloor`$ for every occurring size, then $`X_T`$ distinguishes this tree among all trees. At each size one may instead use either of the two extraction conditions in the [earlier centroid theorem](CENTROID.md). A stronger cutoff applies when all branches are isomorphic. Take any rooted tree of order $`b`$ and attach the roots of $`k\ge3`$ disjoint copies to a new vertex. Its ordinary chromatic symmetric function determines the resulting tree among all trees. The common branch can have arbitrary depth and branching.

**Two-centroid case.** Suppose a tree of order $`2h`$ has a centroid edge. Cut that edge, obtaining two halves $`A,B`$, rooted at their former endpoints. Collect all the branches at these two roots together. If each occurring size is recoverable at cutoff $`h-1`$ by one of the three extraction conditions, $`X_T`$ determines both the combined multiset of rooted branches and the unordered pair $`\{X_A,X_B\}`$. If every branch has size strictly less than $`h/2`$ and each half is distinguished among all trees by its own chromatic symmetric function, then $`X_T`$ distinguishes $`T`$ among all trees. Thus a smallest counterexample pair cannot include a tree satisfying the combined extraction conditions and this strict size bound.

## A positive moment argument for branch factors

Give $`x_i`$ weight $`i`$. Write $`\tau_D`$ for truncation to weight at most $`D`$. In the ordinary forest polynomial $`U_T`$, each spanning subforest contributes a monomial indexed by its component sizes. Stanley's power-sum formula determines it from $`X_T`$ and conversely. For a rooted tree $`C`$ let $`P_C`$ omit the variable of the root component in each summand. Write $`Q_C=P_C+U_C`$. The root-branch recurrence gives $`P_C=\prod_E Q_E`$ over its branches. For a branch of order $`b`$, $`Q_C=x_b+R_C`$, where $`R_C`$ has constant coefficient one, weight degree at most $`b`$, and uses only variables of smaller index. Different rooted shapes of size $`b`$ have different $`R_C`$. Indeed, $`Q_C`$ determines its part of weight less than $`b`$, namely $`P_C`$. Each branch factor in $`P_C`$ is monic linear in its largest variable and hence irreducible. Unique factorization followed by induction recovers the rooted branches and their attachment to the root. [Rooted forest polynomials](https://arxiv.org/abs/2002.08186) · [Branch recurrence and truncation](CENTROID.md)

Let $`F`$ be a product of branch factors whose sizes are at most $`D`$, known through weight $`D`$. The largest occurring variable index is the maximum branch size $`b`$. The coefficient of $`x_b`$ alone gives its total multiplicity $`m`$. Among size-$`b`$ branches write $`c_C`$ for the multiplicity of shape $`C`$ and put $`Z_C=1/R_C`$, as a formal power series. Smaller branch factors are independent of $`x_b`$. Expanding the logarithm after setting its constant term to zero gives, for $`j\ge1`$,

```math
M_j=\sum_C c_C Z_C^j=(-1)^{j-1}j[x_b^j]\log F,
\qquad M_0=m .
```

The truncation determines $`M_j`$ through weight $`D-jb`$ in the smaller variables. This uses only formal series with constant denominator one.

Suppose that the true support $`S=\{C:c_C>0\}`$ at this size has $`s`$ members and $`D\ge4sb`$. Consider any alternative branch product with the same truncation, with size-$`b`$ counts $`c'_C`$. Its largest size and total multiplicity are the same; in the tree applications every competing branch has size at most $`D`$. Define

```math
p(z)=\prod_{C\in S}(R_C z-1).
```

For the true counts the sum $`\sum_C c_C p(Z_C)^2`$ vanishes. Expanding $`p(z)^2`$ in $`z`$ writes this sum as a polynomial combination of $`M_0,\dots,M_{2s}`$. Every multiplier has nonnegative weight degrees. Consequently the corresponding alternative sum vanishes through weight $`D-2sb\ge2sb`$.

For $`E\notin S`$, the numerator of $`p(Z_E)`$ is the nonzero polynomial $`\prod_{C\in S}(R_C-R_E)`$, of weight degree at most $`sb`$, and its denominator $`R_E^s`$ has constant term one. Its lowest nonzero weight is thus at most $`sb`$. If any such $`E`$ occurs in the alternative, choose the least lowest weight among them. At twice that weight the alternative sum is a positive linear combination of squares of nonzero real polynomials, so it cannot vanish. This proves that the alternative uses only shapes in $`S`$, even if it initially had no given bound on the number of shapes.

For each $`C\in S`$ repeat the moment comparison with $`p_C(z)=\prod_{E\in S\setminus\{C\}}(R_E z-1)`$ in place of $`p(z)^2`$. All terms except $`C`$ vanish on both supports. The remaining factor $`p_C(Z_C)`$ is nonzero by weight at most $`(s-1)b`$, within the common truncation. Thus $`c'_C=c_C`$. For $`s=1`$ this last step uses $`M_0`$ alone.

The proof gives a uniqueness criterion without requiring the support as additional input. One could enumerate all size-$`b`$ rooted shapes and the nonnegative multiplicities summing to $`m`$, retaining the possibilities consistent with the known moments. The true multiplicities are the unique such possibility whenever the criterion holds. Divide the recovered branch factors out of $`\tau_D F`$ by formal series division and continue with smaller sizes.

For a unique centroid, the terms of $`U_T`$ having a component larger than $`n/2`$ give precisely $`\tau_D P_T`$ after removal of that component variable, with $`D=\lfloor(n-1)/2\rfloor`$. Every such component contains the centroid. The existence of an equal-split edge is itself determined by $`U_T`$, so competitors have the same centroid regime. This proves the single-centroid statement. The moment bound alone covers at least eight copies of one branch. The next argument reaches three copies.

## Recognizing three or more copies of one rooted branch

Suppose $`k\ge3`$ copies of a rooted tree $`C`$ of order $`b`$ meet a new hub, with one edge from the hub to each root. The hub is the unique centroid of the resulting tree of order $`n=kb+1`$. Any tree with the same $`X_T`$ has order $`n`$ and also a unique centroid by the equal-split test. In each tree the initial truncation through $`D=\lfloor(n-1)/2\rfloor`$ reveals its largest branch size and the multiplicity of that size. Both therefore have maximum size $`b`$ and exactly $`k`$ branches of that size. Those branches account for all $`n-1`$ vertices outside the centroid.

Every connected component larger than $`b`$ contains the centroid, since a connected set avoiding it lies entirely in one branch. Thus in any spanning forest at most one component has order greater than $`b`$. In the known $`U_T`$, select the monomials containing such a part and delete its variable. This gives the entire centroid product $`P_T`$ through weight $`n-b-1=(k-1)b`$. In particular the two branch products agree through weight $`2b`$.

Put $`z=x_b`$. Write the repeated factor as $`z+R`$ and the competing factors as $`z+R_i`$, for $`1\le i\le k`$. Each $`R_i`$ and $`R`$ has constant one, weight degree at most $`b`$, and involves only variables of index smaller than $`b`$. At $`z=0`$, the products therefore give the same logarithm through weight $`2b`$. Their logarithmic derivatives in $`z`$ at zero also agree through weight $`b`$, since taking one derivative costs weight $`b`$.

Set $`d_i=R_i-R`$. If any $`d_i`$ is nonzero, let $`w\ge1`$ be the least weight occurring in any of them, and denote homogeneous weight components by subscripts in brackets. Through weight $`2w\le2b`$ the logarithm identity gives

```math
0=\sum_i\log(1+d_i/R)
  =\frac{\sum_i d_i}{R}-\frac{\sum_i d_i^2}{2R^2}
  \pmod{\text{weight }>2w}.
```

The sum $`\sum_i d_i`$ has no term of weight below $`2w`$ and its weight-$`2w`$ part is $`\tfrac12\sum_i(d_i)_{[w]}^2`$, since $`R`$ has constant one. This sum of squares of real polynomials is nonzero. As each $`d_i`$ has degree at most $`b`$, this forces $`2w\le b`$. We can now use the logarithmic derivative at that same weight. It gives

```math
0=\sum_i\left(\frac{1}{R+d_i}-\frac1R\right)
  =-\frac{\sum_i d_i}{R^2}+\frac{\sum_i d_i^2}{R^3}
  \pmod{\text{weight }>2w}.
```

The weight-$`2w`$ terms give $`(\sum_i d_i)_{[2w]}=\sum_i(d_i)_{[w]}^2`$, contradicting the factor of one half above. Hence every $`R_i=R`$. The full branch factors recover the same rooted shape by the earlier factorization, so the competing tree is isomorphic to the original tree. The argument also includes $`b=1`$, where all residues equal one. Recognition of arbitrary mixtures of large centroid branches remains open. [Centroid campaign on #315](https://github.com/1337isnot1337/solved-conjectures/issues/315#issuecomment-7208148563)

## Recovering both halves from unrooted data

For a tree of order $`2h`$, the coefficient of $`x_h^2`$ in $`U_T`$ detects its unique equal-split edge when one exists. A component larger than $`h`$ must contain that entire edge, because each half has order $`h`$. For any forest retaining the edge, the component containing it consists of the two root components of the forests on its halves. Removing its variable therefore leaves one term of

```math
F=P_AP_B=\prod_{\text{branches at the two ends}}Q_C .
```

It follows that removing the unique component variable larger than $`h`$ wherever present in $`U_T`$ recovers exactly $`\tau_{h-1}F`$. Every branch at either end has size at most $`h-1`$, including for any competitor with the same $`U_T`$. Apply the moment argument, or the earlier [largest-power and reciprocal extractions](CENTROID.md), successively. The full combined branch product and its factors are recovered.

For a monomial $`m`$ of weight $`w`$ define $`\Phi_{2h}(m)=x_{2h-w}m`$ and extend linearly on the support of $`F`$. Its weight is at most $`2h-2`$ before applying $`\Phi_{2h}`$. The forests retaining the central edge contribute $`\Phi_{2h}(F)`$. Those deleting it consist of two independent spanning forests. Hence

```math
U_A U_B=U_T-\Phi_{2h}(F).
```

Each half polynomial equals $`x_h`$ plus a polynomial in $`x_1,\ldots,x_{h-1}`$. It is thus monic and irreducible, so unique factorization recovers the unordered pair, including the case of equal factors. This does not require a unique allocation of the branch sizes to halves. [Centroid-edge recognition, Orellana and Scott, Lemma 5.1](https://arxiv.org/pdf/1308.6005#page=13)

If every recovered branch has size less than $`h/2`$, the old endpoint is the unique centroid of its half, in every tree giving these data. If both half trees are distinguished by their own polynomials, reconstruct them and join their unique centroids. The same reasoning shows that two nonisomorphic trees sharing $`X_T`$ under the stated hypotheses on the branch data would yield a smaller nonisomorphic pair sharing a half polynomial.

For example, let $`A`$ and $`B`$ each consist of a hub with $`k\ge8`$ copies of a rooted tree of order $`b`$, and join the hubs. The rooted shapes used on the two sides may differ. Each half satisfies the single-centroid criterion. The combined multiset has at most two shapes of size $`b`$, and the combined cutoff $`h-1=kb`$ is at least $`8b`$. This proves reconstruction for arbitrary such branch shapes, including families of unbounded diameter.

The unrestricted question still includes trees with few large, different branches that exceed every recovery cutoff. The bounded prior search covered the rooted forest factorization, reconstruction from labelled centroid cuts, established spider and caterpillar classes, bounded-diameter results and recent proper-tree reductions. A proof of the general statement was not located. [Orellana–Tomba, introduction](https://arxiv.org/html/2611.18940v1#S1)

## Reproducible checks

Run `python3 research/stanley-tree-isomorphism/verify_centroid_edge.py` from the repository root. The checker enumerates all 24,426 spanning forests of the 60 balanced joins of unordered pairs of rooted trees of equal size through five vertices per half. It compares the extracted large-component polynomial and the recovered product of the half polynomials against direct forest enumeration. A separate integer moment calculation compares every multiset of eight size-five branches with each of the nine possible single-shape supports. Across 12,870 multisets, only the intended repeated branch agrees in each case. For three and four copies, the checker compares the multivariate truncations through weight ten for all 165 and 495 multisets of order-five branches, respectively. It also extracts the enlarged truncation directly from forest enumeration on trees with branches of order three. [Checker](verify_centroid_edge.py)
