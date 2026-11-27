# Reconstructing all proper trees of diameter six

A finite tree is proper when every nonleaf vertex has a leaf neighbor. Its core is the tree $`C`$ induced by the nonleaf vertices, with weight $`w_v=1+\#\{\text{leaf neighbors of }v\}`$. Write $`s=|C|`$ and $`n=\sum_v w_v`$. We consider a tree of diameter six, so $`C`$ has diameter four and a unique central vertex. Its other nonleaf vertices are adjacent to that center; there are at least two of them. All remaining core vertices are leaves. This permits arbitrarily many branches, repeated weights at any vertices, and arbitrarily many distinct leaf weights within one branch.

**Theorem.** The ordinary chromatic symmetric function of every proper tree of diameter six distinguishes it from all finite unmarked trees.

The diameter is recoverable from the ordinary path counts. The multiset of orders of the leaf components, one per nonleaf vertex, is the leading star-basis partition. A competing tree therefore has the same diameter and is proper as well: a weight-one part occurs precisely for a nonleaf vertex without a leaf neighbor. These are earlier results. The new steps are an explicit extraction retaining both cardinality and mass in the core, and a factorization which separates the branches even when the internal weights are repeated. [Martin, Morin and Wagner](https://arxiv.org/abs/math/0609339) · [Gonzalez, Orellana and Tomba](https://www.mat.univie.ac.at/~slc/wpapers/FPSAC2025/78.pdf) · [Zeng, Sections 4–5](https://arxiv.org/abs/2608.18179)

## Recovering the core subset counts with two size parameters

Use the signless forest polynomial $`U_T=\sum_F\prod_B u_{|B|}`$, where $`F`$ ranges over retained edge sets and $`B`$ over their components. On a tree, this is the power-sum expansion of its chromatic symmetric function with the signs determined by the number of parts. Partition $`C`$ into connected blocks by retaining an arbitrary subset of its edges. In a block with $`j`$ core vertices and mass $`h`$, there are $`h-j`$ original pendant edges whose cuts are free. The ordinary contribution is
```math
\sum_{a=0}^{h-j}\binom{h-j}{a}u_1^a u_{h-a}.
```
Make the triangular substitution $`u_d\mapsto\sum_{l=0}^{d-1}(-1)^l\binom{d-1}{l}u_1^l u_{d-l}`$. It fixes $`u_1`$. After substitution this block contributes
```math
D_{h,j}=\sum_{l=0}^{j-1}(-1)^l\binom{j-1}{l}u_1^l u_{h-l}.
```
Indeed the generating polynomial for the new scalar binomial coefficients is $`(1-z)^{h-1}(1+z/(1-z))^{h-j}=(1-z)^{j-1}`$. The resulting sum of products of block factors is the established undotted evaluation of the marked-tree polynomial. We use its two-colour specialization below. [Aliste-Prieto, de Mier, Orellana and Zamora](https://arxiv.org/abs/2202.11787)

Since $`w_v\ge2`$, every residual index $`h-l\ge j+1\ge2`$. Thus exactly one nonsingleton variable arises for each core block. For each total block count $`b`$, substitute $`u_1=-z`$ and $`u_d=A t^d+B`$ for $`d\ge2`$, keeping the part of total degree $`b`$ in $`A,B`$. Extract the coefficient of $`A^r B^{b-r}`$. In each core partition choose $`r`$ red blocks and colour the others blue. If the union of the red blocks has cardinality $`k`$ and mass $`w`$, its contribution is
```math
t^w(1+z/t)^{k-r}(1+z)^{s-k-(b-r)}.
```
Dividing the coefficient by $`(1+z)^{s-b}`$ gives a polynomial in the two algebraically independent coordinates $`t`$ and $`u=(1+z/t)/(1+z)`$. Indeed $`z=t(1-u)/(tu-1)`$. Its coefficient of $`t^wu^{k-r}`$ therefore gives the exact number of such coloured partitions at these sizes.

For a subset $`S\subseteq V(C)`$ with this cardinality and mass, put $`e_1=|E(C[S])|`$ and $`e_2=|E(C-S)|`$. A partition with $`r`$ red and $`r'=b-r`$ blue blocks is obtained by retaining $`k-r`$ of the $`e_1`$ red edges and $`s-k-r'`$ of the $`e_2`$ blue edges. All edges between the colours are cut. Thus the counts just recovered give all binomial moments of $`(e_1,e_2)`$ for each $`(k,w)`$. The two ordinary binomial matrices are triangular with diagonal one, so inversion recovers the joint multiplicities of $`(k,w,e_1,e_2)`$ for **every** core subset. Boundary size is $`s-1-e_1-e_2`$. In particular we know the individual weight and degree pairs in $`C`$, and its degree-marked, weight-marked independence polynomial
```math
I(x,v,z)=\sum_{S\ \mathrm{independent}}x^{|S|}v^{\sum_{u\in S}w_u}
z^{\sum_{u\in S}(\deg_C(u)-1)}.
```
Independence is $`e_1=0`$ and the exponent of $`z`$ is then the boundary size minus $`k`$. The extraction up to this point applies to every proper tree, in any diameter.

## Factoring the polynomial at the center

Let $`H`$ be the set of nonleaf core vertices. It induces a star with center $`0`$ and $`m\ge2`$ other vertices, indexed by $`1,\ldots,m`$. For each $`i\in H`$ write $`t_i=\deg_C(i)-1\ge1`$ and $`L_i`$ for its adjacent core leaves. The leaf sets are disjoint and cover all core leaves. Define
```math
P=\prod_{u\text{ core leaf}}(1+xv^{w_u}),\qquad
R_i=\frac{xv^{w_i}}{\prod_{u\in L_i}(1+xv^{w_u})}.
```
The singleton data give $`P`$, $`T=\sum_{i\in H}t_i`$ and $`R_{\rm all}=\prod_{i\in H} R_i=x^{m+1}v^{\sum_{i\in H}w_i}/P`$. Choosing an independent subset of $`H`$ either chooses only children of the center or chooses the center alone. The core leaves adjacent to any chosen vertex are then forbidden, and all other core leaves are free. Consequently
```math
I/P=\prod_{i=1}^{m}(1+z^{t_i}R_i)+z^{t_0}R_0.
```

The highest $`z`$ exponent is $`D=\max(t_0,T-t_0)`$ because the leading rational terms are positive for $`x,v>0`$. If $`D>T/2`$, the coefficient there has order at $`x=0`$ equal to either one or $`m\ge2`$. In the first case it is $`R_0`$ and $`t_0=D`$. In the second it is $`R_{\rm all}/R_0`$ and $`t_0=T-D`$. If $`D=T/2`$, the coefficient is $`R_0+R_{\rm all}/R_0`$. Knowing $`R_{\rm all}`$ determines the unordered pair as the roots of a quadratic. Their distinct orders one and $`m`$ at zero identify $`R_0`$. This covers arbitrarily unbalanced degrees, a central weight equal to a child weight, and a central vertex with no adjacent core leaf.

Subtract the recovered central summand. Each remaining factor $`1+z^{t_i}R_i`$ is irreducible in $`\mathbb Q(x,v)[z]`$. Its reciprocal is the monic polynomial $`z^{t_i}+R_i`$. In the discrete valuation ring at $`x=0`$ with coefficient field $`\mathbb Q(v)`$, $`R_i`$ has exact valuation one. Eisenstein's criterion applies, including the linear case. Unique factorization, normalizing each factor's constant coefficient to one, recovers the multiset of $`(t_i,R_i)`$ with all repetitions.

From each $`R_i`$, including $`R_0`$, the constant term of $`R_i/x`$ at $`x=0`$ gives $`v^{w_i}`$. The reciprocal recovers the product of linear polynomials $`1+xv^{w_u}`$ over the core leaves adjacent to $`i`$. Factoring over $`\mathbb Q(v)`$ gives their weights with multiplicity. This reconstructs the weighted core, and a core vertex of weight $`w`$ carries exactly $`w-1`$ leaves in the original tree. This proves the theorem. The arbitrary nonproper diameter-six case and the full Stanley conjecture remain open.
