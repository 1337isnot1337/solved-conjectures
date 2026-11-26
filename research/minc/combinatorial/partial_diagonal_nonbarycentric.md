# Partially forbidden diagonals are not barycentric

Research draft, 2026-11-21 UTC. This is a proposed all-parameter family theorem related to Minc's Problem 15. It is **not** a characterization of all barycentric supports. Whether the assertion was explicitly posed as a named conjecture, and whether it was already resolved, remain under source audit. It must not be counted as a solved named conjecture until that audit is complete.

## 1. Statement

Let $n\ge3$ and $2\le k<n$. Let $A_{n,k}$ be the $n\times n$ binary matrix whose only zero entries are $(1,1),\ldots,(k,k)$. Then $A_{n,k}$ is not barycentric: the average of its supported permutation matrices does not minimize the permanent on the corresponding face of the doubly stochastic polytope. In fact its barycenter is not even a stationary point of the permanent on that face.

The restrictions are material. The case $k=1$ is a known barycentric face. The case $k=n$ is the zero-diagonal face, whose barycenter is stationary and whose global minimum is Minc's open Conjecture 44. Neither case is included.

## 2. A necessary condition for a stationary barycenter

We give the argument in the dense support used here. Let $B=b(A_{n,k})$ and suppose $B$ is stationary on the face. Every allowed entry of $B$ is positive: every allowed edge extends to a perfect matching. The support is fully indecomposable, since an all-zero rectangle can have only one row and one column, and $n\ge3$.

Write $p=\operatorname{per}B$ and $g_{ij}=\operatorname{per}B(i\mid j)$ on allowed positions. The tangent space consists of matrices supported on $A_{n,k}$ with zero row and column sums. Stationarity therefore gives real vectors $\lambda,\mu$ such that

$$g_{ij}=\lambda_i+\mu_j\qquad (a_{ij}=1).```math
The row and column Laplace expansions, and the doubly stochastic property, imply
```math
\lambda=p\mathbf1-B\mu,\qquad \mu=p\mathbf1-B^T\lambda.
```
Consequently $\lambda=BB^T\lambda$. The matrix $BB^T$ is an irreducible stochastic matrix; indeed any two rows of $B$ have a common positive column, since each has at most one zero and $n\ge3$. The maximum principle for an irreducible stochastic matrix shows that $\lambda$ is constant. The second displayed equation then shows that $\mu$ is constant, and $g_{ij}=p$ at every allowed position.

Let $\mathcal P$ be the set of supported permutations. Define two probability laws on this finite set:
```u(\sigma)=\frac1{|\mathcal P|},\qquad
q(\sigma)=\frac{\prod_i b_{i,\sigma(i)}}{p}.```math
Both laws are strictly positive. By the definition of a barycenter, the marginal of $u$ at $(i,j)$ is $b_{ij}$. The marginal of $q$ there is
```math
\frac{b_{ij}g_{ij}}p=b_{ij}.
```
The sum of their two relative entropies is therefore
```
D(q\Vert u)+D(u\Vert q)
=\sum_{\sigma\in\mathcal P}(q(\sigma)-u(\sigma))
\log\frac{q(\sigma)}{u(\sigma)}
=\sum_{i,j:a_{ij}=1}(b_{ij}-b_{ij})\log b_{ij}=0.
```math
Nonnegativity of relative entropy, with its equality condition, gives $q=u$. Thus the products $\prod_i b_{i,\sigma(i)}$ are equal for all supported permutations. This necessary condition is valid for every fully indecomposable support; we have supplied the dense-support details to avoid importing it as a new theorem.

## 3. The three barycenter entries

For $0\le j\le N$, define
```math
D(N,j)=\sum_{r=0}^{j}(-1)^r\binom jr(N-r)!.
```
This is the number of permutations on $N$ objects avoiding $j$ prescribed positions in distinct rows and columns. Set $N=n-1$ and $M=\operatorname{per}A_{n,k}$. The allowed entries of $B$ have three values:
```
a=\frac{D(N,k-2)}M\quad(i,j\le k, i\ne j),
\qquad b=\frac{D(N,k-1)}M\quad(i\le k<j\text{ or }j\le k<i),
\qquad c=\frac{D(N,k)}M\quad(i,j>k).
```math
If $B$ is stationary, Section 2 implies $ac=b^2$. To see this using actual supported permutations, choose top indices $1,2$ and a free index $f>k$. Use either pair of edges $(1,2),(f,f)$ or the pair $(1,f),(f,2)$. A common matching of all remaining rows and columns exists. For $k=2$, take $(2,1)$ and fix all other free vertices. For $k\ge3$, use the edges
```math
2\mapsto3,\ 3\mapsto4,\ \ldots,\ k\mapsto1
```
and fix the free vertices other than $f$. Both resulting full permutations are allowed, and equality of their entry products cancels all common factors to give $ac=b^2$.

It remains to prove that
```\Delta_{N,j}=D(N,j)D(N,j+2)-D(N,j+1)^2\ne0
\qquad(0\le j\le N-2).```math
Here $j=k-2$ and $N\ge2$.

## 4. Two elementary log-convexity facts

### 4.1. Derangement numbers

Let $d_r=D(r,r)$, so $d_2=1$, $d_3=2$, $d_4=9$. The sequence $(d_r)_{r\ge2}$ is strictly log-convex:
```math
d_{r-1}d_{r+1}>d_r^2\qquad(r\ge3).
```
For completeness, the recurrence $d_r=r d_{r-1}+(-1)^r$ gives, with $\epsilon=(-1)^r$,
```math
r(d_{r-1}d_{r+1}-d_r^2)=d_r^2-\epsilon(r+2)d_r+1.
```
For odd $r$, the right-hand side is positive. For even $r\ge4$, $d_r>r+2$, so it is again positive. The latter bound follows from $d_4=9>6$ and the recurrence $d_{r+1}=(r+1)d_r+(-1)^{r+1}$: if $d_r>r+2$ and $r\ge4$, then $d_{r+1}\ge(r+1)d_r-1>r+3$.

### 4.2. Finite binomial transforms

Suppose $a_0,\ldots,a_s$ are positive and strictly log-convex, with $s\ge2$. Their binomial transform
```math
b_t=\sum_{r=0}^t\binom tr a_r\qquad(0\le t\le s)
```
is strictly log-convex. To prove the inequality at $t=s-1$, put $w_r=\binom{s-2}r$ and
```X=\sum_{r=0}^{s-2}w_r a_r,\quad
Y=\sum_{r=0}^{s-2}w_r a_{r+1},\quad
Z=\sum_{r=0}^{s-2}w_r a_{r+2}.```math
Pascal's identity gives $b_{s-2}=X$, $b_{s-1}=X+Y$, and $b_s=X+2Y+Z$. Strict log-convexity and Cauchy--Schwarz give
```math
Y<\sum_{r=0}^{s-2}w_r\sqrt{a_ra_{r+2}}\le\sqrt{XZ}.
```
Thus
```math
b_{s-2}b_s-b_{s-1}^2=XZ-Y^2>0.
```
The same proof applies to every prefix. This is a strict finite version of the classical binomial-transform preservation of log-convexity, and the proof here is independent of that literature.

## 5. The determinant never vanishes

First suppose $j\ge2$, and put $s=N-j$, so $2\le s\le N-2$. Permutations avoiding the last $N-s$ diagonal positions can be counted by their fixed points among the first $s$ positions. This gives
```math
D(N,N-s)=\sum_{r=0}^s\binom sr d_{N-r}.
```
The finite sequence $a_r=d_{N-r}$, $0\le r\le s$, is positive and strictly log-convex, since its lowest derangement index is $N-s=j\ge2$. Applying Section 4.2 gives
```math
\Delta_{N,j}
=D(N,N-s)D(N,N-s+2)-D(N,N-s+1)^2>0.
```

For $`j=0`$, direct substitution gives

```math
\Delta_{N,0}=(N-1)((N-2)!)^2>0\qquad(N\ge2).
```

For $`j=1`$, direct substitution gives

```math
\Delta_{N,1}=(N-2)(N^2-5N+5)((N-3)!)^2\qquad(N\ge3).
```

The quadratic is $-1$ at $N=3$, positive at $N=4$, and strictly increasing for integer $N\ge4$. It never vanishes at an integer. Thus $\Delta_{3,1}=-1$ is the only negative determinant in the parameter range, and every determinant is nonzero.

The equality $ac=b^2$ required by stationarity is impossible. This proves the theorem.

## 6. Source and scope notes

- Lavi's current Problem 15 page records Minc's 1994 non-barycentricity results for two or three diagonal zeros, and all but finitely many orders for each fixed number of prescribed diagonal zeros. It records Song's 1995 proof for $k=n-1$. It does not state a full all-$k,n$ theorem for this family. URL: https://yair-lavi.com/mincs-list/problem-15/index.html . Accessed 2026-11-21 UTC.
- Minc, *Minimum permanents of doubly stochastic matrices with prescribed zero entries on the main diagonal*, Linear Algebra and its Applications 201 (1994), 135--154, DOI https://doi.org/10.1016/0024-3795(94)90111-2 . The publisher abstract says there are fewer than $k^2+k$ possible exceptional orders for fixed $k\ge2$. The Lavi page states a different upper bound, $2k^2+k-1$. The distinction does not affect the proof, but full-text verification is needed before stating Minc's exact theorem or whether he explicitly posed the all-parameter assertion as a conjecture.
- Lavi's page also records the general stationary-barycenter factorization criterion used as motivation. Section 2 supplies the needed implication directly.
- Derangement log-convexity and preservation of log-convexity by binomial transforms are classical. We do not claim novelty for those lemmas.
- Chen, Gu, Ma and Wang, *Higher Order Log-Concavity in Euler's Difference Table*, arXiv:0911.2775, later Discrete Mathematics 311 (2011), 2128--2134, DOI https://doi.org/10.1016/j.disc.2011.06.006 , concerns normalized entries $e_N^s/s!$. Its reverse ultra log-concavity theorem does not immediately supply the unnormalized inequality above. This related source is part of the prior-art audit, not a new conjecture target.
- This theorem does not establish cohesiveness or identify the minimum permanent of these faces. It does not resolve Minc Problem 15 or Conjecture 44.

## Independent reviews and checks

- [Independent mathematical review](partial_diagonal_review.md).
- [Root review and source limits](partial_diagonal_root_review.md).
- Run `python3 research/minc/combinatorial/verify_partial_diagonal.py` for exact identity checks. The audit passed 1,225 determinant checks and 36 support/cofactor/nonstationarity checks. The proof above covers all parameters and does not depend on these finite checks.
