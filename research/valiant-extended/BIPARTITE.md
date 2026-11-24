# A finite graph-tensor conversion sufficient for the permanent lower bound

Work over the complex numbers. Let $`W(G)`$ be the product of one dimension-two equality wire per edge of a graph on a specified party set. Write $`X_r=W(K_{r,r})`$ and $`Y_r=W(K_r\sqcup K_r)`$ on the same two parts, for $`r\ge 2`$. A restriction applies one linear map per party. A rate $`b/a`$ is realized if $`Y_r^{\otimes b}`$ is a restriction of $`X_r^{\otimes a}`$ for positive integers $`a,b`$. We also allow limits of such rates. Subexponential shared-index overhead is treated separately below.

**Conditional reduction.** Any one of these conversions at rate
```math
                         \rho>\frac{r}{\sqrt2(r-1)}                  \tag{1}
```
implies the contracting hypothesis D.1 of the pinned paper, and hence the permanent outside VQP by the [variable-scale argument](CONTRACTION.md). Four parties per part suffice to make the rate-one test nonvacuous. For five per part the threshold is $`5/(4\sqrt2)`$. The conversion above (1) is open. The implication uses the matrix price from Step 7 of D.2. The comparison with the signed condition in [the companion work on #250, §4](../matrix-multiplication-exponent/FULL_TENSOR_CONSTRAINTS.md) uses the distance itself in the quadratic form.

## A binary matrix configuration at every order

Assume D.1 fails. The proof of D.2, Step 7, supplies the price $`d(M,N)=\sqrt{\mathrm{rank}_{\mathbb F_2}(M-N)}`$ on square binary matrices of each size at least three. Choose $`t\ge2`$ so that $`q=2^t`$ satisfies $`q+1\ge r`$. On $`E=\mathbb F_{q^2}`$, viewed as a binary vector space of dimension $`2t`$, let $`H`$ be the image of $`x\mapsto x^{q-1}`$ on $`E^\times`$. This group has order $`q+1`$ since the kernel is $`\mathbb F_q^\times`$. Take distinct $`c_1,\ldots,c_r\in H`$. Use as parties the binary matrices of the linear maps
```math
                     A_i(x)=c_i x,\qquad B_i(x)=c_i x^q.
```
Within either part a nonzero difference is invertible. Across the parts, a nonzero kernel element satisfies $`x^{q-1}=c_i/c_j`$, which has exactly $`q-1`$ solutions. Including zero the kernel has binary dimension $`t`$. Pullback and scaling (A.4) now give a price with every within-part distance $`\sqrt2`$ and every cross distance one. The construction works simultaneously for all pairs of the chosen parties.

The log value of a graph tensor under any spectral point is the sum of its wire prices, by multiplicativity. A restriction at rate $`b/a`$ implies, for every scaled spectral wire metric, and hence every limiting price,
```math
              b\sum_{e\in Y_r}d_e\le a\sum_{e\in X_r}d_e.
```
The sums run over the defining edge sets. The constructed price evaluates them at $`\sqrt2 r(r-1)`$ and $`r^2`$, respectively. This proves (1) by contraposition. For a limiting rate apply the inequality before passing to the limit. An extra full unit of dimension $`2^{o(a)}`$ on the supply side gives the same conclusion as $`a\to\infty`$ for fixed $`r`$. Take the rate limit for each fixed spectral point first, since its full-unit exponent is fixed, then take scaled price limits. [Pinned A.2, A.4, C.3, C.4 and proof of D.2](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf)

For a geometric consequence, extend this price to a CAT(0) price space by C.3. Take any two distinct points in the first part and their midpoint $`o`$. By C.4(a) each point in the opposite part is at squared distance at most $`1-(\sqrt2)^2/4=1/2`$ from $`o`$. Any two such points are $`\sqrt2`$ apart. Equality in the triangle inequality forces $`o`$ to be their common midpoint by C.4(a). Reversing the parts shows the same for every pair in the first part. Thus failure of D.1 forces arbitrarily many arms sharing a single center in each of two orthogonal configurations, in the precise sense that the within-part distances add through the center and the cross squared distances obey Pythagoras there.

In particular this forced price fails conditional negative definiteness for $`r\ge4`$. For the zero-sum vector $`z`$ with entries $`+1`$ on one part and $`-1`$ on the other, $`z^{\mathsf T}Dz=2(\sqrt2 r(r-1)-r^2)>0`$. It would suffice to prove this one signed test nonpositive for all prices at any fixed $`r\ge4`$. This calculation alone supplies no such inequality. Every cut metric does obey the signed test, since $`\sum_{i,j} z_i z_j|1_S(i)-1_S(j)|=-2(\sum_{i\in S}z_i)^2`$.

## The discrepancy between cut bounds and constructions

A cut containing $`x`$ vertices of the first part and $`y`$ of the second crosses $`r(x+y)-2xy`$ supply edges and $`r(x+y)-x^2-y^2`$ demand edges. Their difference is $`(x-y)^2`$. A graph-tensor flattening across a cut has rank two to its crossing edge count, since its crossing factors are identities and its internal factors have rank one in that flattening. Thus every flattening allows rate one. Any cut with $`x=y=1`$ gives the upper bound one.

Routing achieves exactly $`r/(2(r-1))`$. Every demand needs at least two supply edges, giving this upper bound for routing by the total capacity. For each same-part pair send an equal fraction of its traffic through every intermediate vertex in the other part. At rate $`\rho`$ this uses $`2(r-1)\rho/r`$ on each supply edge. Clearing denominators implements those paths by tensor restrictions using local equality checks. This also gives the exact optimum for ordinary undirected unicast network coding by Qureshi and Thakor, Theorem 4, specialized to their Type-I complete bipartite case. The published partition bound concerns a communication model. It does not bound arbitrary complex linear maps on tensor powers. [Qureshi and Thakor, arXiv:2005.10536v1, Theorem 4](https://arxiv.org/pdf/2005.10536v1)

## A tensor conversion strictly above the routing rate

For all $`r\ge2`$ the complex tensor conversion has asymptotic rate at least
```math
                          \rho_0=\frac{2r}{3r-2}.                       \tag{2}
```
It exceeds the preceding routing rate for every $`r>2`$. Existence of local linear maps follows by duality. The ordinary network-coding comparison uses the Type-I theorem above.

Let $`P,Q`$ be the two within-part pair sums of a price and set $`L_{ij}=d(A_i,B_j)`$, $`C=\sum_{i,j}L_{ij}`$. If $`C=0`$ connectedness forces $`P=Q=0`$. Otherwise, averaging the triangle bound through every opposite vertex gives $`P,Q\le\alpha C`$, where $`\alpha=(r-1)/r`$. By C.3 the price comes from a CAT(0) space, so Ptolemy's inequality applies. For each pair of rows and each pair of columns,
```math
 d(A_i,A_k)d(B_j,B_l)\le L_{ij}L_{kl}+L_{il}L_{kj}.
```
The sum gives $`PQ\le\tfrac12\sum_{i\ne k,\ j\ne l}L_{ij}L_{kl}`$. Drop the column inequality in this nonnegative sum and put $`u_i=\sum_j L_{ij}`$. Then
```math
              2PQ\le C^2-\sum_i u_i^2\le \alpha C^2.
```
Expanding $`(\alpha C-P)(\alpha C-Q)\ge0`$ yields $`P+Q\le(\alpha+1/2)C`$. The coefficient is precisely $`1/\rho_0`$. [Foertsch, Lytchak and Schroeder, Theorem 1.3 and §2](https://arxiv.org/pdf/0705.1042)

For completeness, the passage from this numerical inequality to local maps uses A.6 of the pinned paper. Choose $`a=3r-2`$ and $`b=2r`$. The log inequality proves $`\varphi(Y_r^b)\le\varphi(X_r^a)`$ for every A.1 spectral point. For each $`\varepsilon>0`$ and all sufficiently large $`N`$, A.6 gives a sum of at most $`2^{\varepsilon N}`$ restrictions of $`X_r^{aN}`$ equalling $`Y_r^{bN}`$. One extra copy of $`X_r`$ supplies a full binary unit on the parties, by retaining any spanning tree and applying equality checks. With $`\lceil\varepsilon N\rceil`$ extra copies the parties share the full summand index. Each party uses that index to select its local map and sum the outputs, giving one exact restriction of $`X_r^{aN+\lceil\varepsilon N\rceil}`$. Let $`N`$ grow and $`\varepsilon`$ decrease to zero. This proves (2) as a limiting rate in the model stated above. [Pinned Theorem A.6 and Lemma A.2](https://github.com/anthropics/formal-math/blob/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp/paper.pdf)

For $`r=5`$ the known rate from this argument is $`10/13`$ and the sufficient threshold is $`5/(4\sqrt2)`$. As $`r`$ grows the two rates tend to $`2/3`$ and $`1/\sqrt2`$, respectively. Comparing limits cannot remove the strict gap at any fixed order.

## An exact bound for local linear relations on edge labels

Even allowing simultaneous local checks and a sum over all accepted transcripts, finite-field linear relations on labels with coefficient one attain exactly the routing rate. Fix a prime power $`p`$ and use dimension-$`p`$ wires for this calculation. At each vertex allow the zero-one matrix of a linear relation between its input edge labels and output edge labels, over $`\mathbb F_p`$. Tensor contractions and the sums of coefficients are over $`\mathbb C`$. A relation may constrain multiple incident edges jointly. The theorem applies to any block lengths $`a,b`$.

Suppose the resulting tensor is a nonzero scalar times the desired graph tensor. At a single party an accepted input has a unique output. Indeed any nonzero vertical vector of that party's relation would allow us to change that output alone in an accepted configuration, breaking some output equality. Such a configuration has positive coefficient, since there is no cancellation. Thus each local relation is the graph of a linear map on a subspace. All accepted input transcripts live in the same space $`V=\mathbb F_p^{e}`$, where $`e=r^2a`$. The local domains on the first part define a subspace $`U_A`$ of $`V`$ and those on the second part define $`U_B`$. On each side these domains form a direct product because its stars partition the supply edge coordinates. Write $`f_A`$ and $`f_B`$ for the aggregated output maps on their respective domains. Each map has rank $`d=r(r-1)b`$. Each individual output is surjective since every local output occurs in the target, and domains on a single side form a product.

On the feasible subspace $`W=U_A\cap U_B`$, the joint output image is exactly the product of the two clique label spaces. Each clique label space has dimension $`d/2`$, one independent message for each internal edge per copy. Consequently $`f_A(W)`$ has dimension $`d/2`$. Restriction from $`U_A`$ to $`W`$ loses at least $`d/2`$ dimensions in the domain; hence
```math
             e-\dim U_B\ge \dim U_A-\dim W\ge d/2 .
```
Independence of the two clique label spaces implies $`f_A(W\cap\ker f_B)`$ surjects onto a space of dimension $`d/2`$. Since $`\dim\ker(f_B|_{U_B})=\dim U_B-d`$, this gives $`\dim U_B-d\ge d/2`$. Adding yields $`e\ge2d`$, or $`b/a\le r/(2(r-1))`$. The routing construction uses linear relations and meets the bound. The argument also holds for affine relations by translating an accepted configuration. Local complex maps with signed coefficients or nonlinear support can evade steps in this proof.

The strict threshold (1) is exactly $`\sqrt2`$ times routing. None of flattening dominance, the midpoint structure, or the linear-relation construction yields a conversion over that threshold. [Finite field and cut checks](check_bipartite.py)
