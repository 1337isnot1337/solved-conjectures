# Terminal sets for arbitrary rank-threshold forms graphs

This extends the [rank-metric constructions](DISTANCE-REGULAR.md). Let the vertices be all matrices in any of the following spaces over the indicated finite fields. Join distinct matrices if the rank of their difference is at most $`s`$. Then the graph has a terminal set for every positive $`s`$.

- Rectangular matrices over any finite field.
- Hermitian matrices over any finite quadratic extension, using its nontrivial involution.
- Symmetric matrices over any finite field, including characteristic two.
- Alternating matrices over any finite field.

There is no bound on the rank, dimension, or graph diameter. These are structured cases of the [Welton–Khudairi–Tuite conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/869), not a solution for general graphs.

## Clique-fiber principle

Partition the vertex set into cliques, called fibers. Suppose each pair of distinct fibers is either **uniform** (all cross distances are one constant), or **varying** (for each vertex of either fiber its distances to the other are nonconstant). Assume the three distances between any three pairwise uniform fibers satisfy all strict triangle inequalities. Take an inclusion-maximal family of pairwise uniform fibers. A triple of selected vertices in distinct fibers is not collinear by strictness. A triple with two vertices in one fiber has distances $`1,j,j`$ for a positive integer $`j`$, and a triple in one fiber has all distances one. Hence the union is in general position. Every vertex in any other fiber sees a selected fiber with nonconstant distances. Distances to a clique differ by at most one, so a clique edge gives the required endpoint witness.

## Distances for symmetric and Hermitian matrices

Write $`r=\mathop{\mathrm{rank}}(A)`$. For symmetric matrices in odd characteristic and for Hermitian matrices, diagonalization by congruence decomposes the form into $`r`$ rank-one terms. For a nonzero Hermitian form a vector of nonzero self-pairing exists: otherwise varying a scalar in the quadratic extension in a self-pairing of $`x+\lambda y`$ forces the trace pairing with each cross entry to vanish. Splitting off one such vector at a time diagonalizes the form. The same argument with ordinary polarization works for symmetric odd characteristic. Rank subadditivity and grouping the diagonal terms give
```math
d(0,A)=\lceil r/s\rceil.
\tag{1}
```

For symmetric matrices in characteristic two, use
```math
d(0,A)=\lceil r/s\rceil+\epsilon_s(A),\qquad
\epsilon_s(A)=\begin{cases}
1 & A\text{ nonzero alternating},\ s\text{ odd},\ s\mid r,
\\ 0 & \text{otherwise}.
\end{cases}
\tag{2}
```
Here a symmetric form is alternating if its diagonal is identically zero. To verify (2), split off the radical. A nonsingular nonalternating symmetric form is diagonalizable: iteratively split nonzero self-pairings until an alternating part remains. A rank-one unit form orthogonally summed with a hyperbolic plane is congruent to three unit forms. With unit vector $`v`$ and hyperbolic basis $`e,f`$, the three mutually orthogonal unit vectors are $`v+e,v+f,v+e+f`$. All nonzero field scalars are squares, so the unit normalization is possible. This absorbs the alternating planes one by one. A nonzero alternating form is a direct sum of rank-two blocks and is also a sum of $`r+1`$ rank-one forms: on its nonsingular part $`B`$, add any nonzero $`ww^{\mathsf T}`$. It remains nonsingular because $`w^{\mathsf T}B^{-1}w=0`$ (substitute $`w=Bx`$), and becomes nonalternating, so can be decomposed into $`r`$ rank-one terms. These decompositions give the upper part of (2), grouping rank-two blocks when $`s`$ is even and grouping rank-one terms when $`s`$ is odd.

For the exceptional case in (2), obtaining length $`r/s`$ would require a sum of $`r/s`$ rank-$`s`$ matrices with independent column spaces: the column space of their sum is contained in the sum of those spaces, which has dimension at most $`r`$, so equality forces a direct sum. A congruence taking these spaces into disjoint coordinate blocks makes the matrices occupy disjoint symmetric blocks. Each rank-$`s`$ block has odd rank, hence is not alternating. Their block sum cannot be alternating, a contradiction. This proves the lower part of (2).

## Symmetric and Hermitian matrices with $`s\ge2`$

Let the underlying space have dimension $`d>s`$, the other case being complete. Put $`h=\lfloor s/2\rfloor`$, choose a codimension-$`h`$ subspace $`H`$, and partition by the form restricted to $`H\times H`$. A difference vanishing on that square has rank at most $`2h\le s`$, so the fibers are cliques.

For two fibers, let $`Q`$ be the difference of their restrictions, $`r=\mathop{\mathrm{rank}} Q`$, and $`j=\dim \mathop{\mathrm{rad}} Q=d-h-r`$. For any vertex of either fiber, the possible differences to all vertices of the other are precisely all extensions of $`Q`$, up to replacing $`Q`$ by its negative. The ranks and alternating status are unaffected by negation. Thus the pair is uniform or varying in the required strong sense.

Two extensions to use are $`Q\oplus 0`$, of rank $`r`$, and one of rank
```math
m=r+h+\min(j,h).
```
For the latter, pair $`\min(j,h)`$ radical directions with complement directions using nonsingular off-diagonal blocks of order two. Assign a nondegenerate diagonal form to the remaining complement directions. This is valid for both symmetric and Hermitian forms.

If the pair is uniform of distance $`u`$, then
```math
\lceil m/s\rceil\le u\le \lceil r/s\rceil+\epsilon_s(Q)\le K:=\lceil d/s\rceil.
\tag{3}
```
The correction is zero whenever (1) applies. The last inequality also holds with the correction in (2), since $`r\le d-h<d`$ and a corrected $`r`$ is divisible by $`s`$. When $`j<h`$, the chosen rank $`m`$ is $`d`$, so this pair has $`u=K`$. When $`j\ge h`$ and $`s`$ is even, $`m=r+s`$ and (3) rules out uniformity. When $`j\ge h`$ and $`s`$ is odd, (3) gives $`r\le s(u-1)+1`$.

For any three pairwise uniform fibers denote their distances by $`u_{12},u_{23},u_{13}`$ and their restriction-difference ranks by $`r_{12},r_{23},r_{13}`$. If either of the first two pairs has $`j<h`$, then its distance is $`K\ge u_{13}`$ and strictness follows immediately. Otherwise $`s`$ is odd and at least three, and rank subadditivity gives
```math
r_{13}\le r_{12}+r_{23}\le s(u_{12}+u_{23}-2)+2.
```
The upper bound in (3) now gives $`u_{13}\le u_{12}+u_{23}-1`$: without a correction take the ceiling and use $`s\ge3`$; with a correction, $`r_{13}`$ is a multiple of $`s`$, so it is at most $`s(u_{12}+u_{23}-2)`$ before adding one. This proves the strict inequality in every orientation. Note that $`K`$ bounds uniform distances even in the cases when the graph diameter is $`K+1`$. The clique-fiber principle applies.

## Symmetric and Hermitian matrices with $`s=1`$

Split off one coordinate line and write a difference form as
```math
\begin{pmatrix}Q&g\\g^*&t\end{pmatrix}.
```
A fiber fixes $`Q,g`$ and varies only the scalar $`t`$ (in the fixed field if Hermitian). The fibers are cliques and possible differences between any fixed vertex and the other fiber range over all $`t`$ for a fixed $`Q,g`$, so again uniformity or variation holds in both directions. Put $`r=\mathop{\mathrm{rank}}Q`$. After splitting the radical of $`Q`$ and eliminating the cross block on a nondegenerate complement, the ranks as $`t`$ varies are $`r,r+1`$ if $`g`$ annihilates the radical, and always $`r+2`$ otherwise.

Under (1) a uniform pair therefore has distance $`r+2`$. For three such pairs, rank subadditivity on restriction differences implies $`u_{13}\le r_{12}+r_{23}+2<u_{12}+u_{23}`$.

For symmetric characteristic-two forms under (2), the following are the only uniform types:

- $`Q`$ is not alternating and $`g`$ does not annihilate its radical, in which case $`u=r+2`$.
- $`Q`$ is alternating and $`g`$ annihilates its radical, in which case $`u=r+1`$. Here $`Q\ne0`$ for distinct fibers, since $`Q=0`$ would force $`g=0`$. When $`t=0`$ the whole difference is alternating of rank $`r`$; the nondegenerate alternating block does not change the complement diagonal upon eliminating $`g`$. That distance is $`r+1`$. When $`t\ne0`$ the difference is nonalternating of rank $`r+1`$, giving the same distance.

For the other type with $`Q`$ alternating, nonzero $`g`$ on its radical gives fixed rank $`r+2`$ but differing distances for $`t=0`$ and $`t\ne0`$. When $`Q`$ is nonalternating, the correction in (2) is always zero, so the case of varying rank gives varying distance. Thus a uniform distance has offset one or two from $`r`$. If either of the input offsets in a triangle is two, their sum is at least three, greater than the output offset. If both are one, their restrictions are alternating and so is their sum, forcing output offset one if the output pair is uniform. Rank subadditivity gives strictness in either case. The clique-fiber principle finishes this case.

## Rectangular and alternating matrices

For rectangular matrices use linear maps $`V\to U`$ and transpose to assume $`\dim V\le\dim U`$. The graph distance is $`\lceil\mathop{\mathrm{rank}}/s\rceil`$ by grouping rank-one terms. If $`s\ge\dim V`$ the graph is complete; otherwise take the clique of maps that vanish on a fixed codimension-$`s`$ subspace $`H`$. For any outside $`X`$, the possible differences to this clique restrict to $`X|_H`$ of some rank $`r`$. Their ranks include both $`r`$ and $`r+s`$ by taking zero extra images or $`s`$ independent images modulo $`\mathop{\mathrm{im}}(X|_H)`$. The distance varies, so this one clique is terminal.

For alternating matrices put $`t=\lfloor s/2\rfloor`$. If $`t=0`$ there are no edges, and the whole vertex set is terminal, componentwise. Otherwise the distance is $`\lceil \mathop{\mathrm{rank}}/(2t)\rceil`$ by grouping alternating rank-two blocks. If the graph is not complete, partition the forms by restriction to a codimension-$`t`$ space $`H`$. Fibers are cliques. For any difference restriction $`Q`$ of rank $`2r`$ and radical dimension $`j`$, one extension has rank $`2r`$. Another has rank
```math
2\big(r+j'+\lfloor(t-j')/2\rfloor\big),\qquad j'=\min(j,t),
```
by pairing $`j'`$ radical directions with complement directions and placing alternating planes on the remaining complement. If $`j\ge t`$, the distances to those two extensions differ by one. If $`j<t`$, the higher rank is $`2\lfloor d/2\rfloor`$, so any uniform pair has distance the diameter. All triples of uniform pairs are then strictly triangular, and the fiber principle applies.

The only facts used beyond elementary linear algebra are the graph and terminal-set definitions in the [original terminal paper](https://oro.open.ac.uk/98050/9/98050final.pdf). Standard forms-graph conventions are recorded by [Brouwer–Cohen–Neumaier](https://homepages.cwi.nl/~aeb/math/bcn/). The construction concerns terminality, not priority for the rank metrics. No earlier matching terminal-set theorem turned up in the source, survey, and targeted searches.
