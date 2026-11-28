# Axis factors in the Cavey–Lee domino-tiling conjecture

For the exact $`P_\lambda(z;q,t)`$ of [Cavey–Lee, arXiv:2501.17765v1, (3) and Conjecture 5.1](https://arxiv.org/pdf/2501.17765#page=24), let $`r`$ be the Durfee rank of $`\lambda`$. Then
```math
 \frac{P_\lambda(z;q,t)}{\prod_{j=0}^{r-1}(z+t^j)}
 \quad\text{and}\quad
 \frac{P_\lambda(z;q,t)}{\prod_{j=0}^{r-1}(z+q^j)}
 \qquad\text{both belong to }\mathbb Z_{\ge0}[z,q,t].
 \tag{1}
```
The first assertion holds separately for every fixed area array. The second follows from the source's proved $`q,t`$ symmetry. In particular the whole conjecture holds at rank one, and the complete proposed factor product divides $`P_\lambda`$ at rank two. This argument does not establish positivity after dividing by both axis products at once, nor factors with both exponents positive.

## Fixed array and independent decorations

Use the nonintersecting Schröder paths and area array of source §2.1. Removing successive border strips leaves partitions with rows $`\lambda_{i+1}-1`$ (discard nonpositive lengths), iterated from one shape to the next. If a positive strip comes from a remaining shape of width $`w`$ and height $`\ell`$, its index is $`j=\lambda_1-w`$, its length is $`n_j=w+\ell-1`$, and its last row coordinate is
```math
 e_j=j+n_j=\lambda_1+\ell-1.
```
Widths and heights both strictly decrease through the positive strips. Thus distinct positive paths have strictly increasing start rows and strictly decreasing end rows, with every positive path's end later than every start. The number of positive strips is $`r`$, as also noted at the end of the source paper. A zero-length path is just its fixed point $`(j,j)`$.

For a cell of a fixed valid area array in row $`i`$ and of height $`h`$, the corresponding north or diagonal step starts at $`(x,i)=(i-h,i)`$. The height formula is the same for both step types: the counted area triangles lie on or to the right of the unit diagonal through the start. Fix these starts and let $`d\in\{0,1\}`$ denote the choice of north or diagonal for this cell. At row $`i+1`$ the path moves horizontally from $`x+d`$ to the next fixed start coordinate of that path, or to its fixed endpoint if it ends there. No other horizontal segment or step endpoint depends on $`d`$.

For two positive paths whose row intervals overlap, the path with the earlier start is strictly to the left throughout their overlap. At the later start this follows from the diagonal bound and nonintersection, and the order cannot flip without intersection. In particular, a row cannot contain two cells of the same height: they would have the same start point. For fixed starts, the decoration requirements are independent. Specifically:

* For an individual step, $`x+d`$ must not exceed its same-path next start coordinate or terminal coordinate.
* On the horizontal line $`y=i+1`$, the fixed right endpoint of each outer path's horizontal segment must be strictly smaller than the left endpoint $`x+d`$ of each inner path's horizontal segment. Thus each inequality involves at most one decoration bit. Across the open strip of heights $`(i,i+1)`$ the active paths have distinct integer starts in the same order, and their north/diagonal steps have slopes $`dx/dy\in\{0,1\}`$. They cannot meet in the open strip. At a newly starting inner path the fixed start is $`(i+1,i+1)`$, so the condition only concerns the outer path's fixed right endpoint. A diagonal marker of a zero-length path can matter on its own row, but its $`x`$-coordinate equals that row number; every moving path's left endpoint there is at most that number and its right endpoint also is at most that number. Avoiding the marker therefore only restricts the fixed right endpoint, not a decoration.

It follows that all allowable choices are a Cartesian product. In this product a bit is optional if and only if **there is no cell with the same $`x`$-coordinate at row $`i+1`$**. To see the reverse and forward directions explicitly:

* If the cell directly above belongs to the same path, only $`d=0`$ is possible. If it belongs to an outer path, the horizontal separation inequality forces $`d=1`$. It cannot belong to an inner path: if the current path continues, its next start is at least $`x`$, and the inner path's start must be strictly larger; if the current path ends at row $`i+1`$, all nested positive paths already ended. Newly starting inner paths at row $`i+1`$ also have $`x=i+1>x`$.
* If no cell lies directly above, the same-path start/endpoint is at least $`x+1`$, since a valid array forces it to be at least $`x`$, and a terminal coordinate $`i+1`$ exceeds $`x`$. Every outer path whose active segment could force $`d=1`$ continues at row $`i+1`$, since it ends strictly later. Its right endpoint is a fixed next start and is at most $`x`$ by validity at one value of $`d`$; with no cell directly above, it is strictly less than $`x`$. Thus both choices meet all constraints.

In the source's dinv rule, every pair is controlled by exactly one bit: its lower-row cell if both heights are equal, and its lower-height cell if the heights differ by one in the specified row order. The number of pairs lost by decorating the cell of height $`h`$ at row $`i`$ is therefore
```math
 X_h(i)=\#\{\text{height }h\text{ cells in rows }>i\}
       +\#\{\text{height }h+1\text{ cells in rows }\le i\}.
 \tag{2}
```
The area does not change, and decorating contributes one power of $`z`$. For any fixed array the contribution to $`P_\lambda`$ consequently factors as a monomial times
```math
 \prod_{\text{optional cells }(i,h)}(z+t^{X_h(i)}).
 \tag{3}
```
For example, take the baseline having every optional cell decorated, and retain the forced choices. Its area, dinv, and number of forced decorated cells give the monomial exponents, which are nonnegative. Unmarking any optional cell restores the pairs counted by (2), independently of all other choices.

## The count crossing lemma

Let $`N_h`$ be the number of height $`h`$ cells. Each positive path starts at height zero, so $`N_0\ge r`$, whereas $`N_h=0`$ for large $`h`$. We prove that every integer $`j`$ with $`0\le j<r`$ occurs as $`X_h(i)`$ for some optional cell.

Choose a height $`h`$ with $`N_h>j\ge N_{h+1}`$, possible by following the sequence from $`N_0`$ to zero. As row $`i`$ runs from before all cells to after all cells, $`X_h(i)`$ begins at $`N_h`$, ends at $`N_{h+1}`$, and changes by at most one per row. Take the last row $`i`$ where it decreases from $`j+1`$ to $`j`$. That row contains a height $`h`$ cell. If row $`i+1`$ has no height $`h+1`$ cell, the current cell is optional and we are done. Otherwise row $`i+1`$ must also contain a height $`h`$ cell: an upper cell alone would make $`X_h(i+1)=j+1`$, which would force another subsequent downward crossing since the terminal value is at most $`j`$. With both present we advance to that next height $`h`$ cell, still at value $`j`$, and repeat. Finiteness gives an optional cell of weight $`j`$.

The values $`0,\ldots,r-1`$ correspond to distinct cells in (3). Factoring them out leaves a nonnegative product for each array, proving the first assertion in (1) after summing. Cavey–Lee's Theorem 1.1 and its $`q,t`$-symmetry corollary give the second assertion. Over $`\mathbb Q(q,t)`$ the distinct axis factors are pairwise coprime, except for the common factor $`z+1`$ which is included only once. Their union therefore divides $`P_\lambda`$ over this field, and monic polynomial division shows that the quotient is in $`\mathbb Z[z,q,t]`$. Its sign pattern is not established here. The square family is already fully covered by the source's Theorem 1.3.

## Status

The source is Cavey and Lee's *Domino Tilings, Domino Shuffling, and the Nabla Operator*, arXiv:2501.17765v1, §2.1 and §5. Bounded searches by theorem number, paper title, and the Durfee-rank/factor formulations found the author's conference version and the open-problem index, but no earlier proof of the exact assertion (1) or full conjecture. This is a partial theorem, not a resolution of the general conjecture.
