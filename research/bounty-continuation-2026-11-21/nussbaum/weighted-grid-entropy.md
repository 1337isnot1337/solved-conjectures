# Weighted rectangular grids of completion faces

**Theorem.** Suppose an $`n`$-dimensional Boolean cube has $`m`$ distinct incomparable faces in each cell of an $`a`$-by-$`b`$ array, with $`2\le a\le b`$. Two distinct faces intersect exactly when their cells share a row or a column, including when their cells coincide. If $`a\ge128`$, then $`abm\le 2^n`$. The same bound holds, for arbitrary $`a`$, if $`a\ge2\log_2(ab)`$ or $`a\binom n{\lfloor n/2\rfloor}\le2^n`$.

These are ambient bounds. In particular any counterexample with this graph would have $`a\le127`$ and $`n<2\cdot127^2`$, regardless of the number of faces in each cell. The [unweighted local theorem](local-grid-and-one-star-orbit.md) already covers $`m=1`$. The [sponsor's US$100 conjecture](https://sites.math.rutgers.edu/~zeilberg/math640_10.html) also permits other graphs.

## Packing along a matching

All faces in row $`i`$ contain a common Boolean vertex $`r_i`$, and all in column $`j`$ contain one $`c_j`$, since pairwise intersecting cube faces have consistent fixed bits. Each face in cell $`ij`$ contains the entire cube interval $`[r_i,c_j]`$. Put $`d_{ij}=d_H(r_i,c_j)`$ and let $`d`$ be the mean of $`d_{ij}`$ over the cells. Write $`L=\log_2 b`$, $`l=\log_2 a`$, and $`M=\log_2 m`$.

The union in cell $`ij`$ has at least $`m2^{d_{ij}}`$ vertices. Relative to the interval, each face has its own set of additional free coordinates, all outside the interval's free coordinates. Flip exactly these additional coordinates from the fixed interval bits and allow every choice of the interval bits. This gives disjoint sets of vertices for the different faces in the cell. Cells along a matching are disjoint. Averaging over all injections from rows to columns and using convexity gives

```math
2^n\ \ge\ am\,\mathbb E_{ij}2^{d_{ij}}\ \ge\ am\,2^d.
```

In particular, a counterexample would require $`d<L`$. The single-cell bound also gives $`d_{ij}\le n-M<\log_2(ab)`$ at every cell in a counterexample.

## Encoding the columns seen by two rows

Pick distinct rows $`i,k`$, let $`T`$ be their differing coordinates, and draw a uniform column $`J`$. On $`T`$, the restrictions of the column anchors are incomparable in the bit orientation relative to $`r_i`$. Indeed, for $`j\ne j'`$, the disjoint intervals $`[r_i,c_j]`$ and $`[r_k,c_{j'}]`$ must fix an opposite bit somewhere. This coordinate lies in $`T`$, with $`c_j`$ agreeing with $`r_i`$ and $`c_{j'}`$ with $`r_k`$. Reversing the columns gives an opposite ordered difference. Consequently, deleting any one coordinate of $`T`$ still leaves the column label recoverable.

For one coordinate let $`u`$ be the fraction of row anchors with bit one and $`v`$ the corresponding fraction of column anchors. Write $`h`$ for binary entropy in bits. The mean row-column distance contribution is $`w=u(1-v)+(1-u)v`$. We shall use

```math
2u(1-u)h(v)\le w. \tag{1}
```

For reference, $`h(v)\le2\sqrt{v(1-v)}`$. One elementary proof puts $`t=|1-2v|`$ and considers $`\sqrt{1-t^2}-h((1-t)/2)`$. Its derivative is $`\operatorname{atanh}(t)/\ln 2-t/\sqrt{1-t^2}`$. Substituting $`t=\tanh s`$ shows that the derivative changes from positive to negative exactly once since $`\sinh(s)/s`$ increases from one to infinity. The function vanishes at both endpoints. Now $`w\ge2\sqrt{u(1-u)v(1-v)}`$ by AM–GM, proving (1).

Let $`D_{\max}`$ be the maximum distance of a pair of row anchors. Choose a coordinate in $`T`$ with largest column-bit entropy and delete it. Subadditivity and recoverability give $`L\le(1-1/D_{\max})\sum_{t\in T}h(v_t)`$. Average over independent uniform rows, counting the equal-row case as zero, and apply (1) coordinate by coordinate. This proves

```math
(1-1/a)L \le (1-1/D_{\max})d.
```

If $`D_{\max}\le a`$, then $`d\ge L`$ and the packing bound finishes. In a counterexample the triangle inequality through any one column and the single-cell bound give $`D_{\max}<2\log_2(ab)`$. This proves the second stated criterion.

## Using the choices within each cell

There is a stronger encoding for unequal sides. For each column choose one face from that cell in each of the two rows. The intersection of their projections on $`T`$ is a nonempty subcube, containing the restricted column anchor. Subcubes for different columns are disjoint: if a point were in both, the first-row face of one column and the second-row face of the other would agree on a common assignment on $`T`$. Off $`T`$ their equal row bits already provide a common assignment.

Give each coordinate of $`T`$ independent Bernoulli probabilities with one-bit probability $`v_t`$. On a differing row coordinate exactly one row anchor agrees with the column. The other row's face is necessarily free there. The intersection subcube fixes that coordinate exactly when the face of the agreeing row fixes it. Its negative log probability is therefore the sum of the negative logarithms of the column-bit probabilities over precisely these fixed coordinates. Disjointness and AM–GM imply that the mean negative log probability over the $`b`$ subcubes is at least $`L`$. This remains true after averaging over the uniformly chosen faces and rows.

For a given coordinate put $`\alpha=(1-u)(1-v)`$ and $`\beta=uv`$. Conditional on the two anchors both having bit zero or both having bit one, let $`e_0,e_1`$ respectively be the probability that the face is free on this coordinate. Sample a uniform cell and then a uniform member. When the anchors differ the face is always free. The preceding bound, including a zero contribution for the equal-row draw, becomes

```math
(1-1/a)L\le\sum_t (w_t-S_t),
```

where the single-coordinate quantity is

```math
S=w-2u(1-u)h(v)
 +2u\alpha e_0\log_2(1/(1-v))
 +2(1-u)\beta e_1\log_2(1/v).
```

Indeed each of the two ordered row choices can supply the agreeing row, and the other row must have the opposite bit. Terms with zero probability are taken as zero. In particular $`S\ge0`$. The free-bit mask, given the anchors' row and column indices, determines the face. Subadditivity and concavity of entropy therefore give

```math
M\le\sum_t \big(\alpha_t h(e_{0,t})+\beta_t h(e_{1,t})\big),
\qquad n-M-d\ge\sum_t B_t ,
```

with $`B=\alpha(1-h(e_0))+\beta(1-h(e_1))`$.

We claim the elementary scalar bound $`B+10S\ge 2w/5`$. There are three cases.

* If $`u`$ is outside $`[1/4,3/4]`$, the proof of (1) gives $`2u(1-u)h(v)\le 2\sqrt{u(1-u)}w\le(\sqrt3/2)w`$.
* If $`v`$ is outside that interval, minimizing $`w/(2u(1-u))=v/(2u)+(1-v)/(2(1-u))`$ over $`u`$ gives $`(1+2\sqrt{v(1-v)})/2`$. Hence the ratio of $`2u(1-u)h(v)`$ to $`w`$ is at most $`2\sqrt3/(2+\sqrt3)<24/25`$. The endpoint cases follow by continuity or direct substitution.
* If both lie in the interval, the coefficients $`2u\log_2(1/(1-v))`$ and $`2(1-u)\log_2(1/v)`$ both exceed $`1/5`$. For $`0\le e\le1`$, $`1-h(e)+2e\ge 1-\log_2(5/4)>2/3`$, by minimizing over $`e`$. Also $`w\le5/8`$, so $`\alpha+\beta=1-w\ge3w/5`$. Dropping the nonnegative first term of $`S`$ proves the claim here too.

Suppose now that $`abm>2^n`$. Then $`(1-1/a)L\le d<L`$ and $`\sum_t S_t<L/a`$. Summing the scalar bound gives

```math
n-M\ge (7/5)d-10\sum_t S_t
 \ge (7/5-57/(5a))L.
```

For $`a\ge128`$ the last coefficient exceeds $`5/4`$. If $`L\ge4l`$, this contradicts $`n<M+L+l`$. If $`L<4l`$, then $`2\log_2(ab)<10\log_2a\le a`$ for $`a\ge128`$, which was already excluded by puncturing one coordinate. This proves the all-multiplicity assertion for $`a\ge128`$.

## The size of the remaining range

The $`bm`$ faces containing any fixed row anchor have distinct free-coordinate sets forming an antichain. Sperner's theorem gives $`bm\le\binom n{\lfloor n/2\rfloor}`$, proving the third criterion. For $`n=2k`$, $`\binom{2k}{k}/4^k=\prod_{i=1}^k(1-1/(2i))\le1/\sqrt{k+1}`$ by the logarithm bound and the harmonic sum. The central probability for $`2k+1`$ is no larger. Thus $`n\ge2a^2`$ also suffices. Combined with the large-side theorem, any remaining grid counterexample would require $`n<32258`$. This finite reduction supplies no exhaustion of that range and imposes no grid structure on a general orbit.
