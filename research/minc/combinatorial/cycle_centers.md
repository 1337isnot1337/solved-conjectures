# Zero-diagonal doubly stochastic minimum

In every order $n\ge4$, on the face of doubly stochastic matrices obtained by forbidding **any nonempty partial matching**, there is no point $B$ such that the permanent is nonincreasing on every segment directed toward $B$. This includes the faces with one prescribed zero and with an entirely zero diagonal. There is also no $B$ on any of these faces toward which minimum total correlation is nondecreasing on every segment. On the zero-diagonal face there are relative-interior points where moving toward the conjectured minimizer simultaneously increases the permanent and decreases minimum total correlation.

This rules out a straight-line descent proof of [Minc’s Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html) even with a freely chosen center. The minimum itself is a separate question. A [previous example](../sign-matrices/c44_research.md) concerned averaging with a single relabeling. The proof below imposes necessary conditions on *every* possible center by differentiating at Hamilton cycles. For the full Birkhoff polytope these conditions single out the uniform matrix. Thus in every order where [Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html) has a nonmonotone boundary direction, the full polytope also has no universal permanent center. The catalogue gives such directions in every order at least nine.

## Cofactors along a cycle

First work in coordinates where the Hamiltonian bipartite cycle has allowed columns $i$ and $i+1$ in row $i$, with indices modulo $n$. Let $C$ be the forward cyclic permutation matrix, $A_x=(1-x)I+xC$, and write $`h_{ij}=(i-j)\bmod n\in\{0,\ldots,n-1\}`$. For $0<x<1$ all permanental cofactors are positive and
```math
c_{ij}(A_x)=(1-x)^{n-1-h_{ij}}x^{h_{ij}}.                              \tag{1}
```
After deleting row $i$ and column $j$, the unique surviving matching uses the forward edge at rows $j,j+1,\ldots,i-1$ and the diagonal elsewhere. Each row's $h$ values are $0,\ldots,n-1$. On the diagonal $h=0$ and on the forward cycle $h=n-1$.

Suppose a face contains the two permutations $I,C$. A universal permanent center $B$ on that face must satisfy $\langle B-A_x,c(A_x)\rangle\le0$ for every $x$. At $x=1/2$ the left side is zero, because all cofactors are equal. Its derivative there is
```math
4\,2^{1-n}\bigl(\langle B,h\rangle-n(n-1)/2\bigr).
```
The term from differentiating $A_x$ vanishes by equal cofactors. Since the inequality holds on both sides, a necessary condition is
```math
\langle B,h\rangle=n(n-1)/2.                                           \tag{2}
```
This condition transforms with the row and column labels of the cycle.

The same condition is necessary for an entropy center. For a doubly stochastic marginal matrix $P$, let $I(P)$ be the sum of its row entropies minus the maximum entropy of a law on permutations with those marginals. Given positive edge weights $W$ on a total-support face, their Gibbs permutation law has marginals $`P_{ij}=w_{ij}c_{ij}(W)/\mathop{\mathrm{per}}W`$. On the relative interior, finite entropy duality gives
```math
dI(P)[B-P]=\langle P-B,\log c(W)\rangle.
```
The log is needed only on allowed edges. For a proof see the [face entropy identity](face_entropy_reformulation.md). Take $W$ tending to $A_x$ through positive weights on that face. All cofactors in (1) stay positive in the limit, and $P$ tends to $A_q$ with $q=x^n/((1-x)^n+x^n)$. Thus an entropy center must satisfy
```math
\log(x/(1-x))\langle A_q-B,h\rangle\ge0
```
for every $0<x<1$. Taking the two one-sided limits at $1/2$ gives (2).

## Testing the permutations omitted by a face

Choose a permutation $F$ whose entries include all the forbidden positions. Its full complement belongs to the face. Relabel columns so that $F$ is the *backward* shift, disjoint from $I$ and $C$. In these coordinates (2) applies to all cycles obtained by independent row and column relabelings preserving $F$. This group acts transitively on the entries of $F$ and transitively on all other entries. The $h$ values on $F$ are all one, and the mean of $h$ off $F$ is
```math
H=\frac{n(n-1)/2-1}{n-1}.
```
Put $z=\langle B,F\rangle$. Averaging (2) over the group gives $z+H(n-z)=n(n-1)/2$. The solution is $z=1$, since $H\ne1$ for $n\ge4$. Therefore
```math
\langle B,F\rangle=1\quad\text{for every completion of the forbidden matching.}    \tag{3}
```
This averaging only uses tests on cycles avoiding $F$. The individual relabelings need not preserve the larger face.

If all $n$ positions of $F$ are forbidden then $z=0$, a contradiction. Otherwise let $r$ be the positive number of forbidden positions and $m=n-r$. Permute rows and columns to put these $r$ positions on the first $r$ diagonal entries. Average (3) over the $m!$ completions on the remaining rows. The bottom $m\times m$ block of $B$ has total mass $m$. Its rows and columns are saturated, so $B$ splits into two doubly stochastic diagonal blocks of orders $r,m$. If $r=1$ this is already impossible because its first diagonal entry is forbidden.

Let $d_j=j!/j^j$ for $j\ge1$. The van der Waerden bound gives $`\mathop{\mathrm{per}}B\ge d_r d_m\ge d_{n-1}`$. The last inequality follows because $d_{j+1}/d_j=(j/(j+1))^j$ decreases with $j$, so the minimum over positive $r+m=n$ occurs at $r=1$ or $m=1$. The uniform matrix $U_F$ on the complement of $F$ belongs to the face and has permanent $D_n/(n-1)^n<d_{n-1}$, where $D_n$ counts derangements. Indeed $D_n/n!=\sum_{j=0}^n(-1)^j/j!\le1/2$ and $1/2<(n-1)/n$. Hence a block-diagonal $B$ cannot minimize the permanent.

The same comparison works for entropy. The maximum-entropy law for a block-diagonal marginal is the independent product of its two block laws. Sra’s maximum-total-correlation theorem on the full Birkhoff polytope gives $I(B)\le-\log(d_r d_m)$. The marginal $U_F$ has the uniform derangement law, giving $`I(U_F)=-\log(\mathop{\mathrm{per}}U_F)>I(B)`$. Thus no such $B$ can maximize entropy either. [Sra’s Theorem 2.1 and its consequence at the uniform matrix](https://hexagonmath.org/pdf/2611.00118v1)

For the full Birkhoff polytope there are no forbidden entries and all permutations $F$ are available in (3). Exchanging two assigned columns gives $b_{ij}+b_{rs}=b_{is}+b_{rj}$ for every rectangle, so $B$ is additive in row and column coordinates. Its two uniform margins give $B=J_n$ (the matrix of entries $1/n$). This last condition is necessary for both problems. The known row-averaging derivative theorem implies it is sufficient for entropy: the sum of the pairwise row-averaging directions is proportional to $J_n-P$, so $dI(P)[J_n-P]\ge0$ in the interior; use continuity at the boundary.

## Both directions can fail at the same interior point

For the zero-diagonal face use the relabeling where $F$ is the backward shift. Then $\langle U_F,h\rangle=nH>n(n-1)/2$. Formula (1) and the derivative above show that for $q>1/2$ sufficiently close to $1/2$, the permanent at $A_q$ increases toward $U_F$. Choose $q$ close enough also to have $\langle A_q,h\rangle<nH$. Choose $x>1/2$ so that the Gibbs marginal of $A_x$ is $A_q$. The limiting entropy derivative toward $U_F$ is now strictly negative. Perturb $A_x$ by adding a sufficiently small positive multiple of $U_F$ to its edge weights. The resulting Gibbs marginals have all allowed entries positive. Continuity of the cofactors, the marginal matrix and the permanent differential preserves both strict signs at the same marginal. Relabel back to the ordinary zero-diagonal face.

The Hamilton cycle computations can be replayed with the [exact checker](verify_cycle_centers.py). Literature checks included London and Minc’s zero-diagonal minimum, Minc’s prescribed-zero faces, the catalogue's monotonicity and zero-diagonal entries, Sra’s entropy averaging, and Goldwasser’s direct sums. [London–Minc](https://doi.org/10.1080/03081088908817922) · [Minc](https://doi.org/10.1016/0024-3795(94)90111-2) · [Goldwasser](https://doi.org/10.1080/03081089308818193)
