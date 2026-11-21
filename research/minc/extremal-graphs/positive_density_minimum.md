# Minc’s sixth conjecture

Let $m(n,k)$ be the minimum of $\operatorname{per}(G/k)$ over binary $n$-square matrices with all margins $k$. Fix any $\epsilon>0$, write $d_n=n!/n^n$ and $u=(n-k)/k$. Uniformly for $\epsilon n\le k<n$ as $n\to\infty$,

$$\boxed{\frac{m(n,k)-m(n,k+1)}{d_n}=\frac{n}{2k(k+1)}\big(e^{u/2}+o(1)\big).} \tag{1}$$

Thus all adjacent comparisons at any density bounded below by a positive constant are eventually strict. The statement includes densities tending to one. The [original conjecture](https://yair-lavi.com/mincs-list/conjecture-6/index.html) also covers finite orders and degrees of density tending to zero. The theorem leaves those regimes open where earlier work does not apply. [Wanless’s 2007 study](https://doi.org/10.1080/03081080600562670)

The proof also shows that all minimizing matrices satisfy $\|G/k-J_n\|_{\rm op}=o(1)$ and $m(n,k)/d_n=e^{u/2}+o(1)$ in this range. The value estimate alone cannot decide (1), whose leading term has order $1/n$.

## An entropy bound for an almost disconnected cut

Let $A$ be doubly stochastic of order $n$. Partition its rows into two sets, and separately partition its columns into two sets. Write $r_i,c_j$ for the class sizes and $x_{ij}$ for the sum in its $ij$ rectangle. Suppose along a sequence that all four class sizes are at least $bn$ for some $b>0$, and that $y=x_{12}$ and $z=x_{21}$ are $o(n)$. Then for all sufficiently large orders

$$\frac{\operatorname{per}A}{d_n}\ \ge\ c_b\sqrt{\frac{n}{1+\max(y,z)}}. \tag{2}$$

For the proof let $S(A)=-\sum A_{ij}\log A_{ij}$, and let $I(A)=S(A)-H_{\max}(A)$, where $H_{\max}$ is the maximum entropy of a permutation law with marginals $A$. The Gibbs variational principle gives $\log\operatorname{per}A\ge-I(A)$. Let $C$ be the matrix averaged within each rectangle. Pair averaging rows or columns increases $I$ by [Sra’s Theorem 2.1](https://hexagonmath.org/pdf/2611.00118v1). One can average a whole class of size $h$ exactly by induction. Average its first $h-1$ entries first, then mix each with the last successively using weights $1/h,1/(h-1),\ldots,1/2$. At each step one more entry has coefficient $1/h$ on the original last entry, and the others it has already visited stay fixed. This applies to whole rows and then to columns, so $I(A)\le I(C)$. In the event that a law with marginals $C$ has entropy $H$, this gives $\log\operatorname{per}A\ge H-S(C)$.

Construct the law by sampling an integer $2\times2$ table $K$ with the indicated margins and $\mathbb EK=x$, then choosing a uniform permutation with those block counts. It has the required marginals by symmetry. The number of permutations for a fixed table is $\prod_i r_i!\prod_j c_j!/\prod_{ij}K_{ij}!$, since one partitions each row class into destination classes and then bijects each destination to its column labels.

Put $a=\min(y,z)$. All four counts are determined by the smaller off-diagonal count and the margins, since $y-z=r_1-c_1$ is an integer. Randomly round $a$ to an adjacent integer with the correct mean. If $a\ge4$, add an independent uniform integer on $[-\lfloor\sqrt a/2\rfloor,\lfloor\sqrt a/2\rfloor]$. The counts remain nonnegative for all sufficiently large $n$, since both diagonal means are at least $bn-o(n)$ and $a=o(n)$. This gives $\operatorname{Var}(K_{ij})\le C a$ for an absolute $C$, including $a=0$, and $H(K)\ge\frac12\log(1+a)-C$. For $a\ge4$ use the conditional entropy given the rounded integer. For $a<4$ the bound follows from $H(K)\ge0$.

Define $\phi(s)=\log(s!)-s\log s+s$ for nonnegative integers, with $0\log0=0$. Stirling's inequalities give $\phi(s)=\frac12\log(1+s)+O(1)$ uniformly. Counting and expanding $H-S(C)-\log d_n$ gives

$$H(K)+\sum_i\phi(r_i)+\sum_j\phi(c_j)-\phi(n)-\sum_{ij}\mathbb E\phi(K_{ij})-\sum_{ij}\mathbb E[K_{ij}\log(K_{ij}/x_{ij})].$$

The last sum is bounded above by $\sum_{x_{ij}>0}\operatorname{Var}(K_{ij})/x_{ij}=O(1)$ using $\log t\le t-1$. A zero mean has a zero count. Jensen gives $\mathbb E\phi(K_{ij})\le\frac12\log(1+x_{ij})+O(1)$. Substitution leaves $\tfrac12\log n-\tfrac12\log(1+\max(y,z))-O_b(1)$ and proves (2).

## The spectrum of a minimizing matrix

Write $B=G/k-J_n$ and $P(B)=\operatorname{per}(J_n+B)/d_n$. Every row and column of $B$ has squared Euclidean norm $u/n$, and $\|B\|_F^2=u$. There is always a competing $k$-regular circulant with $\|B\|_{\rm op}=O(\sqrt{n\log n}/k)$. Indeed take independent Bernoulli variables of mean $k/n$ on the cyclic group. Their sum equals its integer mean with probability at least $1/(n+1)$ because this is a binomial mode. Applying Hoeffding's bounded-variable inequality to the real and imaginary parts of the nonconstant Fourier sums and taking a union bound gives probability less than $1/(n+1)$ that any exceeds $C\sqrt{n\log n}$, for a sufficient absolute $C$. A realization with both properties supplies the shifts. The [signed permanent limit](../real-radius/hilbert_schmidt_limit.md) gives $P(B)=e^{u/2}+o(1)$ for these competitors, uniformly along positive-density sequences.

Now suppose along a subsequence of minimizers that the second singular value of $A=G/k$ tends to one. The symmetric stochastic matrix with block rows $(0,A)$ and $(A^T,0)$ has this number as its second largest eigenvalue. By the graph Cheeger inequality it has a set of between one and $n$ vertices whose outgoing weight divided by its size tends to zero. Disconnected graphs give such a set directly. [Graph Cheeger inequality, Theorem 1.1](https://cs.uwaterloo.ca/~lapchi/papers/Cheeger.pdf)

Write $r,s$ for the sizes of the row and column parts of this set. Its two outgoing rectangle weights satisfy $y+z=o(r+s)$ and $|r-s|\le y+z$. The inside rectangle has weight $(r+s-y-z)/2\le rs/k$ because entries are at most $1/k$. It follows that $r,s$ are at least a fixed positive multiple of $n$, since $k\ge\epsilon n$. Also $r+s\le n$ and $|r-s|=o(n)$, so the complements have positive linear size. Applying (2) forces $P(B)\to\infty$, contradicting the bounded competitors. Thus the second singular values of minimizers stay bounded away from one.

All their row and column norms after centering tend to zero. The determinant approximation now gives $P(B)=\det(I-B^TB)^{-1/2}+o(1)$. If $\|B\|_{\rm op}\ge\eta>0$, the logarithm of this determinant factor is at least $u/2+\eta^4/4$ by the positive logarithmic series. This contradicts the competitor on any such subsequence. Consequently $\|B\|_{\rm op}=o(1)$, and the value asymptotic follows as well. These sequence arguments apply uniformly since failure of a uniform limit would supply a violating sequence.

## Adjacent degrees

Use a minimizer $G$ at degree $k$. Decompose its complement into $n-k$ disjoint permutation matrices by the regular bipartite matching theorem. Choose one $Q$ uniformly and put $D=(Q-G/k)/(k+1)$, so $B+D=(G+Q)/(k+1)-J_n$. Directly, with $v=n/[k(k+1)]$ and $\alpha=n/[(n-k)(k+1)]$,

$$\mathbb ED=-\alpha B,\qquad \|D\|_F^2=v=\alpha u,\qquad \langle B,D\rangle_F=-v.$$

The last identity uses the disjoint supports of $G$ and $Q$. These are also the moments in the [earlier dense-band averaging argument](../nov20-independent/sign/c6_dense_barycentric_comparison.md).

The [uniform Hessian asymptotic](../real-radius/small_operator_perturbations.md) applies at $sB$, uniformly for $0\le s\le1$. For $u>0$ integrate along this ray with unit direction $B/\sqrt u$ and use the zero gradient at the origin. This yields

$$\langle\nabla P(B),B\rangle_F/u=\int_0^1 e^{s^2u/2}(1+s^2u)\,ds+o(1)=e^{u/2}+o(1).$$

It also applies at every $B+sD$ with unit direction $D/\sqrt v$. Indeed $\|D\|_F=\sqrt v=o(1)$, and $\langle B+sD,D/\sqrt v\rangle_F=(s-1)\sqrt v$. Thus the Hessian in that direction is $e^{u/2}+o(1)$ uniformly over choices of $Q,s$. Taylor's integral formula gives

$$\mathbb E P(B+D)=P(B)-\tfrac12 v(e^{u/2}+o(1)).$$

Some extension therefore gives the lower bound for the difference in (1).

For the reverse bound, begin with a minimizer $G'$ at degree $k+1$ and write $B'=G'/(k+1)-J_n$. This includes $G'=\mathbf1\mathbf1^T$ at degree $n$. Pick a uniform $Q'$ from any factorization of $G'$, and let $D'=(G'/(k+1)-Q')/k$. Now $\mathbb E D'=0$, $\langle B',D'\rangle_F=0$, and $\|D'\|_F^2=v$. The latter follows from the $n$ chosen edges on which $G'$ equals one, or from the deterministic change in squared Frobenius distance. The centered endpoint has degree $k$. Also $\|B'\|_F^2=u-v$. The Hessian asymptotic on each intervening segment gives

$$\mathbb E P(B'+D')=P(B')+\tfrac12v(e^{(u-v)/2}+o(1)).$$

The minimum at degree $k$ is no greater than this expectation times $d_n$. Since $v=o(1)$ and $u$ is bounded, this is the upper bound in (1). All error claims hold along arbitrary sequences in the stated range. No numerical order threshold or conclusion for every sublinear degree follows.
