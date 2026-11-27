# Recognizing three or more copies of one rooted branch

For any rooted tree and any integer $`k\ge3`$, attach the roots of $`k`$ disjoint copies to a new vertex. The resulting unrooted tree is determined among all trees by its ordinary chromatic symmetric function. Write $`P_D,Q_D,U_D`$ for the spanning-forest polynomials defined in the [subdivision proof](PROOF.md).

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

The exact checker enumerates 660 multisets of three or four order-five branches and tests the enlarged cutoff against 22,528 spanning forests. [Reproduction](verify_centroid_edge.py) · [Research proof](https://github.com/1337isnot1337/solved-conjectures/blob/456ae8829ccf210cd911c737c252ea1679af10cf/research/stanley-tree-isomorphism/CENTROID-EDGE.md)
