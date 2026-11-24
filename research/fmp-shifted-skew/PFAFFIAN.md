# Bounded shifted skew plane partitions: a bordered Pfaffian

This is structural progress on [Ferroni–Morales–Panova, Conjecture 7.10](https://doi.org/10.1112/plms.70204), not a proof of shifted skew positivity. The paper asks for a Pfaffian formula for this exact ordinary, unmarked, bounded count as a possible route to the conjecture. [Hopkins–Lai, Theorem 2.2](https://par.nsf.gov/servlets/purl/10353966) gives the straight case using [Stembridge's nonintersecting path machinery](https://www.mat.univie.ac.at/~kratt/bedlewo/stemb-nonint.pdf). [Marberg–Morales–Yu, Theorem 6.16](https://arxiv.org/html/2611.19371v1) proves positivity for all shifted straight shapes. Neither spells out the mixed fixed/free expression below. The formula here follows from classical tools; we have not certified priority.

## A path model with fixed and free starts

Let $\lambda,\mu$ be strict partitions with $\mu\subseteq\lambda$, of lengths $r,m$ respectively. Pad $\mu$ with zeros to length $r$. The cells of row $i$ have columns $i+\mu_i,\ldots,i+\lambda_i-1$. Write $\Omega(t)$ for the number of weakly increasing fillings $p_{ij}$ in $\{0,\ldots,t-1\}$ for positive integer $t$. This is the same order polynomial as for weakly decreasing bounded fillings, by complementing entries.

Use east/north lattice paths. For $i\le m$, use the fixed starting point $S_i=(\mu_i,i)$. The $i$th endpoint for all rows is $E_i=(\lambda_i,t-1+i)$. Encode a cell $(i,j)$ by an east step from $x=j-i$ to $x=j-i+1$ at height $p_{ij}+i$. The north steps are then forced. For $i>m$, the first cell is on the diagonal; remove the first east step and all north steps before it. The remaining path has a free start $(1,h_i)$ where $h_i=p_{ii}+i$. Use the common free start set
$$
 {\cal F}=\{(1,h):m+1\le h\le t-1+r\},
$$
ordered by increasing $h$, after the $m$ fixed starts. A required family chooses $d=r-m$ distinct free starts. Strictly increasing start heights imply $h_i\ge i$, and the endpoint bounds $h_i\le t-1+i$, so this imposes exactly the needed entry bounds. Conversely, for any filling, successive diagonal entries weakly increase: for $i>m$ and $i<r$, the cell $(i,i+1)$ exists because $\lambda_i>\lambda_{i+1}\ge1$, and it lies between $(i,i)$ and $(i+1,i+1)$ in the row-column order. Thus $h_i$ are strictly increasing.

The essential nonintersection check uses consecutive rows. At any integer vertical line $x$ common to the paths for rows $i,i+1$, the upper endpoint of row $i$'s vertical segment is the height of its east step out of $x$; the lower endpoint of row $i+1$'s segment is the height of its east step into $x$. This is the same column $j=x+i$ in both rows. Since $\lambda_i>\lambda_{i+1}$, row $i$ always has a following east step at such $x$. Since the start $x$-coordinates are nonincreasing, row $i+1$ already has a preceding step at $x$, except possibly at $x=1$ for a free row. In that case use the removed diagonal step, at exactly the new starting height. Thus strict separation in height is exactly the column constraint after adding the row index. If a fixed empty row occurs, its singleton $x$-coordinate is disjoint from those of both adjacent rows, since $\lambda_i=\mu_i$ and both surrounding nonzero part lists are strict. Between integer vertical lines separation follows from that at the endpoints. Nonconsecutive rows cannot meet if consecutive rows are separated: whenever two rows share a given $x$, all intermediate rows meet that $x$, by the monotone left and right endpoints. The common columns in the original shifted skew diagram likewise occur in consecutive runs (its starting columns first weakly decrease, then increase, and its ending columns weakly decrease), so adjacent-column checks enforce every column comparison.

For the converse from disjoint paths, the earlier row is always strictly below the later row at a common $x$. At the earlier row's left endpoint, it starts at a strictly smaller height than the later row's initial height. It cannot later reverse their vertical order without a meeting. Reading the east steps and restoring the removed first steps now gives exactly the bounded fillings.

## Determinant sum and Pfaffian

For two points $S,E$, let $p(S,E)$ be the number of east/north paths, $\binom{\Delta x+\Delta y}{\Delta x}$ for $\Delta x,\Delta y\ge0$, and zero otherwise. Let $A$ have fixed-start rows $p(S_i,E_j)$, and let $B$ have free-start rows $B_{hj}=p((1,h),E_j)$. Then
$$
 \Omega(t)=\sum_{\substack{H\subseteq{\cal F}\\ |H|=d}}
              \det\begin{pmatrix}A\\B_H\end{pmatrix},            \tag{1}
$$
with $B_H$ in increasing start-height order. Indeed, the starts and endpoints are both ordered by nonincreasing $x$ and strictly increasing $y$. An inverted pairing has an intersection: the earlier start is lower at its initial $x$, but its assigned endpoint is farther left and higher than the other endpoint. Over the shared $x$-interval the two paths reverse vertical order. This proves the compatibility required by the Lindström–Gessel–Viennot lemma and leaves only the identity pairing.

Define a skew matrix $C$ of size $r$ by
$$
 C_{ij}=\sum_{h<k}\bigl(B_{hi}B_{kj}-B_{ki}B_{hj}\bigr).
$$
If $d$ is odd, append the row $\sum_h B_h$ to $A$. Write $A_*$ for the resulting matrix and $m_*$ for its number of rows (there is no extra row if $d$ is even). The bordered Pfaffian is
$$
 \Omega(t)=(-1)^{m_*(m_*-1)/2}\operatorname{Pf}
       \begin{pmatrix}
           C&A_*^{\mathsf T}\\
           -A_*&0
       \end{pmatrix}.                                          \tag{2}
$$

For the minor-summation proof, let $b_h$ denote the row $B_h$ viewed as a vector in an exterior algebra, and $\omega=\sum_{h<k}b_h\wedge b_k$. The coefficient of a given ordered wedge $b_{h_1}\wedge\cdots\wedge b_{h_{2u}}$ in $\omega^u/u!$, treating the $b_h$ symbolically, is the Pfaffian of the $2u$-by-$2u$ skew matrix with all upper entries 1. It is 1 by first-row expansion and induction. In odd degree, wedge $\sum_h b_h$ before $\omega^u/u!$: each coefficient is $\sum_{i=1}^{2u+1}(-1)^{i-1}=1$. Wedging the ordered fixed rows $A$ in front now gives (1). In the block-matrix Pfaffian, the $m_*$ auxiliary basis vectors occur once each through cross terms; moving them all to the end has sign $(-1)^{m_*(m_*-1)/2}$. This gives (2).

## Polynomial entries and a reduction for the linear term

All entries admit direct polynomial continuation from integer $t\ge1$. If $\lambda_j<\mu_i$ set $A_{ij}=0$; otherwise
$$
 A_{ij}(t)=\binom{\lambda_j-\mu_i+t-1+j-i}{\lambda_j-\mu_i}.
$$
For $i>j$, strictness implies $\lambda_j-\mu_i\ge i-j$, so the upper argument is nonnegative even at $t=0$. Thus $A_{ij}(0)=0$ for $j<i$, and also for $j=i$ unless row $i$ is empty. In the empty case the diagonal entry is the constant polynomial $1$. Reverse the free height index by $u=t-1+r-h$. The row corresponding to $u$ has entries
$$
 b_j(u)=\binom{\lambda_j-1+u+j-r}{\lambda_j-1},\qquad
 0\le u\le t+d-2.
$$
These polynomial binomials agree with path counts: $\lambda_j-1\ge r-j$, so their upper arguments are nonnegative for $u\ge0$ even when the vertical distance is negative. Thus the free row sums and pair sums in (2), with order $u$ decreasing, are ordinary polynomial sums with a variable endpoint. They give a Pfaffian of polynomials in $t$.

For $d\ge1$, the free part of exterior degree $d$ vanishes at $t=0$, as its summation interval contains only $d-1$ rows. For $d=1$, the free interval is empty at $t=0$, and the same assertion applies. Therefore the coefficient of $t$ in $\Omega(t)$ comes only by differentiating the free part and substituting $A(0)$ for every fixed row. This localizes the positivity problem to derivatives of the finite-line free-start sums. The sign of this derivative is not settled here.

The included [check.py](check.py) compares both exact formulas with a separate ideal-chain enumeration on 204 shapes at each $t=1,\ldots,5$, including empty rows, odd free degree, and the straight-shape limit.
