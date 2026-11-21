# Monotonicity toward the boundary

Let $A$ be a doubly stochastic matrix of order $n\ge2$ with at most two nonzero entries in every row and column. Write $\sigma_k$ for the sum of its $k$-row, $k$-column subpermanents, with $\sigma_0=1$. The following sharp ratio bound holds simultaneously at all degrees:
```math
(k+1)\frac{\sigma_{k+1}(A)}{\sigma_k(A)}\ \ge\ \frac{(n-k)(2n-2k-1)}{2n-k-1},\qquad 0\le k<n.             \tag{1}
```
The balanced Hamiltonian cycle $A=(I+C_n)/2$ attains every bound. The weights of different components of $A$ may be unrelated. At $k=n-1$ equality requires that single balanced cycle, up to independent row and column permutations.

**Stability under arbitrary perturbations.** For each $n$ there is an open neighborhood, relative to the full Birkhoff polytope, of the entire set of these matrices on which every Holens–Đoković inequality holds. Equivalently $(k+1)\sigma_{k+1}/\sigma_k\ge(n-k)^2/n$ there. In particular each $\sigma_j$, $2\le j\le n$, increases strictly on the segment from the uniform matrix $J_n$ to each nonuniform matrix in the neighborhood. This gives a neighborhood of boundary directions for [Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html). The perturbations may put positive weight on every entry and destroy all symmetries. A global characterization of monotone directions remains open.

## Changing the weights on a cycle

Up to independent row and column permutations, each connected component is a singleton or a cycle with alternating weights $a,b$, $a+b=1$. Indeed an edge of weight one is an isolated component, and every other vertex has degree two. Let $Z_m(y)=\sum_k\sigma_k y^k$ for one component of order $m$. With $d=(a-b)^2$,
```math
Z_m(y)=\lambda_+^m+\lambda_-^m,\qquad
\lambda_++\lambda_-=1+y,\qquad\lambda_+\lambda_-=ab y^2=(1-d)y^2/4.    \tag{2}
```
The weighted independent sets of the cyclic list of $2m$ edges are the matchings. For an edge of weight $v$, the matrix $\bigl(\begin{smallmatrix}1&vy\\1&0\end{smallmatrix}\bigr)$ allows the new edge to be occupied only if the preceding edge was unoccupied. The trace of the cyclic product sums all allowed configurations. The product for an adjacent pair has trace $1+(a+b)y$ and determinant $aby^2$. This proves (2), with the same $Z_1=1+y$ for a singleton. Let $Z_m^0$ denote (2) at $d=0$, and put $Z_0^0=2$.

We first show that the sequence of ratios $[y^k]Z_m/[y^k]Z_m^0$ is nondecreasing in $k$. The balanced coefficients are
```math
c_{k,0}=2^{-k}\frac{2m}{2m-k}\binom{2m-k}{k}.
```
This is the cyclic nonadjacent selection count, obtained by counting strings with the first position occupied and unoccupied separately, with weight $2^{-k}$. The coefficients of $d^j y^k$ in (2) for $j\ge1$ vanish below $k=2j$, and otherwise are
```math
c_{k,j}=\frac{m}{j 2^k}\binom{m-k+j-1}{j-1}\binom{2m-k-1}{k-2j}.     \tag{3}
```
To derive them, sum $Z_m t^m/m$ over $m\ge1$, giving $-\log((1-yt/2)^2-t-d y^2t^2/4)$. Its $d^j$ coefficient is $(y^2t^2/4)^j((1-yt/2)^2-t)^{-j}/j$. Expanding in powers of $t/(1-yt/2)^2$ leaves exactly power $m-k$ for the requested coefficient. Binomial expansion gives (3).

For $2j\le k<m$ both coefficient formulas give
```math
\frac{c_{k+1,j}}{c_{k,j}}=\frac{(m-k)(2m-2k+2j-1)}{(2m-k-1)(k+1-2j)}.   \tag{4}
```
This is at least its value at $j=0$, strictly so for $j>0$. New terms at $k+1=2j$ also have nonnegative coefficients. This proves the ratio claim for arbitrary $d\in[0,1]$. For a single nonbalanced cycle of order at least two the last coefficient ratio is strictly greater than in the balanced case: the $j=1$ term enters at $m=2$ and contributes strictly by (4) at $m>2$.

## Combining different components

For nonnegative sequences $f,g$ write $f\succeq g$ if $f_j g_i\ge f_i g_j$ for $i<j$. Convolution with a log-concave sequence $u$ having no internal zeros preserves this relation. In the cross difference of the two convolutions at $k<l$, group the terms for $i<j$. Their contributions are $(f_jg_i-f_ig_j)(u_{l-j}u_{k-i}-u_{k-j}u_{l-i})\ge0$, extending $u$ by zero. The last inequality follows from successive coefficient ratios of $u$. Every matching sequence appearing as a product of the other components is log-concave with no internal zeros, by real-rootedness of the nonnegative weighted matching generating polynomial and Newton's inequalities. [Heilmann and Lieb](https://doi.org/10.1007/BF01877590)

By (4) and this convolution rule, replacing the components one by one by their balanced versions decreases their product in the order $\succeq$. Next compare a product of balanced cycles with one balanced cycle of their total order $n$. The two roots in (2) are now common to every component. Expand the product and pair complementary choices of roots. This gives one $Z_n^0$ and a sum of terms $(y^2/4)^v Z_{n-2v}^0$ with $v>0$, one for each remaining complementary pair (including the constant polynomial $Z_0^0=2$ when applicable). For a term with $n-2v>0$ its consecutive coefficient ratio for $2v\le k<n$ is
```math
\frac{(n-k)(2n-2k-1)}{(2n-k-2v-1)(k+1-2v)}.
```
This exceeds the ratio for $Z_n^0$; before its first nonzero term the cross difference is nonnegative as well. If $n=2v$, the term increases only the final coefficient. Thus the complete balanced product dominates $Z_n^0$ in the same order, strictly at the final ratio if it has multiple components. Formula (4) at $j=0$ proves (1) and its endpoint equality claim.

Previous work proves Holens–Đoković for unweighted cycle unions and gives the balanced-cycle product identity; coefficientwise matching-count minimization in that class is classical. Here the comparison is between successive coefficients for arbitrary alternating weights. [Wanless, Section 3](https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf) · [Friedland, Krop and Markström, Section 2](https://arxiv.org/abs/0801.2256) · [Goldwasser on direct sums](https://doi.org/10.1080/03081089308818193)

## The endpoint under arbitrary perturbations

The excess of the right side of (1) over $(n-k)^2/n$ is
```math
\frac{k(n-k)(n-k-1)}{n(2n-k-1)}.
```
It is positive for every $1\le k<n-1$. These finitely many inequalities persist in an open neighborhood by continuity. For the top degree put $G(A)=n\operatorname{per}A-\sigma_{n-1}(A)/n$. Only the single balanced cycles require attention, by strictness above. After relabeling fix $A_0=(I+C_n)/2$ and $h_{ij}=(i-j)\bmod n$. The derivative in any zero-line-sum direction $D$ is
```math
 dG(A_0)[D]=\frac{2^{2-n}}{n}\sum_{ij}h_{ij}(n-1-h_{ij})D_{ij}.        \tag{5}
```
All cofactors of $A_0$ equal $2^{1-n}$. For the derivative of $\sigma_{n-1}$ at entry $ij$, remove row $i$ and column $j$, then sum the order-$(n-2)$ matching weights in what remains. The remaining graph consists of two paths with respectively $h_{ij}$ and $n-1-h_{ij}$ rows and the same numbers of columns. Each has a unique perfect matching. A path with $t$ rows and $t$ columns has $t(t+1)/2$ matchings one short of perfect: after ordering the path as a bidiagonal matrix, the deleted row and column leave a perfect matching exactly for the pairs on one side of its diagonal, including that diagonal. Hence the unweighted total is $n(n-1)/2-h_{ij}(n-1-h_{ij})$. Each has weight $2^{2-n}$. Removing the constant in the differential gives (5).

For $n\ge3$, (5) vanishes on the cycle edges and has strictly positive cost on every other edge. In particular $dG(A_0)[R-A_0]>0$ uniformly over the convex hull of all permutations other than $I,C_n$, since each uses at least one other edge. Write a nearby doubly stochastic matrix using its Birkhoff decomposition as $(1-t)A_x+tR$, $A_x=(1-x)I+xC_n$. The weight $t$ is at most the total mass off the cycle and tends to zero; consequently $x\to1/2$ as the matrix tends to $A_0$. If $t=0$ the cycle result suffices. Otherwise continuity and compactness give $dG((1-s)A_x+sR)[R-A_x]>0$ for every $0\le s\le t$ sufficiently near $A_0$. Integration yields $G((1-t)A_x+tR)>G(A_x)\ge0$. This proves stability also at all balanced Hamiltonian cycles. At $n=2$ every doubly stochastic matrix is already in the stated class. The union of the neighborhoods found is an open neighborhood of the entire compact set, and hence contains a positive Frobenius-distance neighborhood at each fixed order.

Finally set $a_l=n^l\sigma_l(A)/(l!\binom nl^2)$. Expanding the subpermanent sum in entries from $A$ and $J_n$ gives
```math
\frac{\sigma_j((1-t)J_n+tA)}{\sigma_j(J_n)}=\sum_{l=0}^j\binom jl a_l t^l(1-t)^{j-l}.
```
Each fixed $l$-matching extends to $\binom{n-l}{j-l}^2(j-l)!$ matchings of size $j$ using entries of $J_n$ at the remaining positions. This proves the expansion. The Holens–Đoković inequalities say $a_{l+1}\ge a_l$, so the derivative is a Bernstein polynomial with nonnegative coefficients. For $A\ne J_n$, $a_2-a_1=(\|A\|_F^2-1)/(n-1)^2>0$, which yields strict increase on $0<t<1$ for all $j\ge2$.

The [matching checker](verify_cycle_ratios.py) directly counts matchings in 559 weighted disjoint unions, checks every successive ratio and the endpoint equality condition, and separately evaluates the bias coefficients (3). The [cycle-deletion checker](verify_cycle_centers.py) verifies the two-minor identity in (5) by direct removal.
