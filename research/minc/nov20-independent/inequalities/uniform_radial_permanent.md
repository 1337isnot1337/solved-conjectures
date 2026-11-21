# A uniform local permanent inequality

Date: 20 November 2026 (America/Chicago).

Status: a proved consequence of the accompanying
[centered coefficient theorem](../sign/centered_permanental_coefficients.md),
independently [reviewed](../compound/uniform_radial_review.md). This does not resolve Minc Conjecture 44
or Problem 13. The subsequent
[explicit global comparison](explicit_eventual_zero_diagonal.md) combines
this result with published capacity inequalities to prove Conjecture 44,
including uniqueness, in every order at least $`20\,000\,000\,000\,000`$.
The remaining smaller orders are unresolved in this work.

## 1. Statements

Let $`J_n`$ have every entry $`1/n`$, let $`d_n=n!/n^n`$, and put

~~~math
\mathcal H_n=\{B\in\mathbb R^{n\times n}:B\mathbf1=B^T\mathbf1=0\},
\qquad P_n(B)=\frac{\operatorname{per}(J_n+B)}{d_n}.
~~~

**Theorem 1.** For every $`n\ge2`$, every $`B\in\mathcal H_n`$ with Frobenius norm at most
$`1/1000`$, and every $`H\in\mathcal H_n`$,

~~~math
\boxed{\quad
\nabla^2P_n(B)[H,H]\ge\frac1{16}\|H\|_F^2.
\quad}                                                        \tag{1}
~~~

Entries of $`J_n+B`$ need not be nonnegative. Consequently,

~~~math
\boxed{\quad
\operatorname{per}(J_n+B)
\ge d_n\left(1+\frac1{32}\|B\|_F^2\right)
\qquad(\|B\|_F\le1/1000).
\quad}                                                        \tag{2}
~~~

Thus the Frobenius version of Sinkhorn's real van der Waerden radius has
the lower bound $`b(n)\ge1/1000`$ in every order. This is not a sharp-radius
claim and does not resolve Problem 13.

Let $`U_n`$ have zero diagonal and every off-diagonal entry $`1/(n-1)`$.

**Theorem 2.** If $`A`$ is real, has line sums one and zero diagonal, and

~~~math
\frac1{n-1}+\|A-U_n\|_F^2\le10^{-6},                            \tag{3}
~~~

then

~~~math
\boxed{\quad
\operatorname{per}A-\operatorname{per}U_n
\ge\frac{d_n}{32}\|A-U_n\|_F^2.
\quad}                                                        \tag{4}
~~~

Equality in this region forces $`A=U_n`$. Nonnegativity is not needed for this
local theorem. The repository's full-Hessian counterexample lies outside
the much smaller ball in (1).

## 2. Coefficient bounds

Let $`\sigma_k(B)`$ be the sum of all $`k\times k`$ subpermanents. The accompanying
coefficient theorem proves, for every complex matrix with zero line sums,

~~~math
|\sigma_k(B)|\le2\,200^k\|B\|_F^k.                              \tag{5}
~~~

Complex matrices are used below only for ordinary Cauchy differentiation.
We also need the elementary bounds

~~~math
\sigma_2(B)=\frac12\sum_{i,j}b_{ij}^{\,2},\qquad
\sigma_3(B)=\frac23\sum_{i,j}b_{ij}^{\,3},                        \tag{6}
~~~

~~~math
|\sigma_3(B)|\le\frac23\|B\|_F^3,\qquad
|\sigma_k(B)|\le k!\|B\|_F^k.                                  \tag{7}
~~~

The squares in (6) are algebraic squares. They become absolute squares
when B is real.

Here is a proof recording the cancellations in (7). Ordered row and column
tuples give

~~~math
\sigma_k(B)=\frac1{k!}
\sum_{\substack{i_1,\ldots,i_k\ \mathrm{distinct}\\
                j_1,\ldots,j_k\ \mathrm{distinct}}}
\prod_{\ell=1}^k b_{i_\ell j_\ell}.
~~~

Apply partition-lattice inclusion-exclusion to both distinctness
conditions. The coefficient of a partition pi of [k] is

~~~math
\mu(\pi)=\prod_{S\in\pi}(-1)^{|S|-1}(|S|-1)!.
~~~

Any singleton block vanishes after its free index is summed, by the zero
line sums. A surviving pair of partitions defines a bipartite multigraph
with k edges and every vertex of degree at least two. Its contraction has
absolute value at most the k-th power of the Frobenius norm.

For completeness, this last assertion follows from a finite entropy
argument. Put r=||B||_F>0 and q(i,j)=|b_ij|^2/r^2. Let Z be the sum of
products of normalized edge weights |b_ij|/r. If Z>0, normalize those
products to a probability distribution p on vertex-index assignments, and
let p_e be its marginal at the endpoints of edge e. Since each vertex
occurs in at least two edges, the entropy chain rule gives

~~~math
H(p)\le\frac12\sum_e H(p_e).
~~~

To see this, order the vertices and expand each edge entropy by the chain
rule. Conditioning on all preceding vertices only decreases each term.
Each resulting nonnegative conditional entropy appears at least twice.
Therefore

~~~math
\begin{aligned}
\log Z
&=H(p)+\frac12\sum_e\mathbb E_p\log q(X_e)\\
&\le-\frac12\sum_e D(p_e\Vert q)\le0.
\end{aligned}
~~~

The case Z=0 is immediate. Thus Z<=1, proving the contraction bound also
for multigraphs and complex entries after absolute values.

The sum of |mu(pi)| over partitions without singletons is the derangement
number !k: a cyclic ordering within each block specifies a permutation
without fixed points. Hence

~~~math
|\sigma_k(B)|
\le\frac{(!k)^2}{k!}\|B\|_F^k
\le k!\|B\|_F^k.                                              \tag{8}
~~~

For k=2 and k=3 there is only one surviving partition on each side, giving
(6). The cubic bound follows from the finite sequence inequality
||b||_3<=||b||_2. The factorial bound is used only for a fixed finite
prefix, never as an infinite majorant.

## 3. Expansion and differentiation

Direct expansion gives

~~~math
P_n(B)=\sum_{k=0}^n c_{n,k}\sigma_k(B),\qquad
c_{n,k}=\frac{n^k}{(n)_k},\qquad
(n)_k=\frac{n!}{(n-k)!}.                                      \tag{9}
~~~

The order-independent bound

~~~math
c_{n,k}\le e^k                                                \tag{10}
~~~

follows by integrating the decreasing function log(1-x/n):

~~~math
\begin{aligned}
\sum_{j=0}^{k-1}\log(1-j/n)
&\ge\int_0^k\log(1-x/n)\,dx\\
&=-k-(n-k)\log(1-k/n)\ge-k.
\end{aligned}
~~~

The endpoint k=n is interpreted by continuity.

Put $`\delta=1/1000`$. Suppose a homogeneous degree-$`k`$ polynomial $`Q_k`$ on the
complex centered subspace satisfies

~~~math
|Q_k(X)|\le a_k\|X\|_F^k.
~~~

For real centered $`B,H`$ with $`\|B\|_F\le\delta`$ and $`\|H\|_F=1`$, apply Cauchy's
derivative estimate to $`Q_k(B+zH)`$ on $`|z|=2\delta/(k-2)`$. For $`k\ge3`$,

~~~math
\begin{aligned}
|\nabla^2Q_k(B)[H,H]|
&\le a_k\frac{k^k}{2(k-2)^{k-2}}\delta^{k-2}\\
&\le\frac{e^2}{2}k^2a_k\delta^{k-2}.                          \tag{11}
\end{aligned}
~~~

The last step uses $`(1+2/(k-2))^{k-2}\le e^2`$. Scaling supplies the factor
$`\|H\|_F^2`$ for arbitrary $`H`$.

Use (11) with

~~~math
a_3=\frac23,\qquad
a_k=k!\quad(4\le k\le60),\qquad
a_k=2\,200^k\quad(k\ge61).                                   \tag{12}
~~~

Half the absolute normalized Hessian contribution from degrees at least
three is at most

~~~math
S:=\frac{e^2}{4}\sum_{k=3}^{\infty}
k^2e^ka_k\delta^{k-2}.                                       \tag{13}
~~~

Terms with k>n do not occur in (9); extending these positive bounds only
enlarges the estimate.

## 4. Rational bounds for the prefix and tail

Only e<3 and rational comparisons are used here. The cubic term is

~~~math
S_3=\frac32e^5\delta
<\frac{729}{2000}<\frac38.                                   \tag{14}
~~~

For 4<=k<=60, write
u_k=(e^2/4)k^2 e^k k! delta^(k-2). For 4<=k<=59,

~~~math
\frac{u_{k+1}}{u_k}
=e\delta\frac{(k+1)^3}{k^2}
<\frac3{1000}\frac{60^3}{59^2}
=\frac{648}{3481}<\frac15.                                  \tag{15}
~~~

The function (k+1)^3/k^2=k+3+3/k+1/k^2 is increasing for k>=2.
Consequently,

~~~math
\sum_{k=4}^{60}u_k
\le\frac54u_4
<\frac54\frac{96\cdot3^6}{10^6}
=\frac{2187}{25000}<\frac9{100}.                             \tag{16}
~~~

For the remaining terms, 200e delta<3/5, so

~~~math
\begin{aligned}
S_{\ge61}
&\le\frac9{2\delta^2}\sum_{k\ge61}k^2(3/5)^k\\
&=4500000\,(3/5)^{61}\cdot9775
<\frac1{500}.                                               \tag{17}
\end{aligned}
~~~

Here we used the exact identity

~~~math
\sum_{k\ge m}k^2q^k
=q^m\left(
\frac{m^2}{1-q}+\frac{2mq}{(1-q)^2}
+\frac{q(1+q)}{(1-q)^3}\right).
~~~

The bracket equals 9775 when m=61 and q=3/5. The last comparison in (17)
is an integer comparison checked by the accompanying rational script.
Combining these bounds gives

~~~math
S<\frac38+\frac9{100}+\frac1{500}
=\frac{467}{1000}<\frac{15}{32}.                             \tag{18}
~~~

The quadratic part of (9) has Hessian

~~~math
c_{n,2}\nabla^2\sigma_2(B)[H,H]
=\frac{n}{n-1}\|H\|_F^2\ge\|H\|_F^2.
~~~

The linear part vanishes on the centered subspace. Thus

~~~math
\nabla^2P_n(B)[H,H]
\ge(1-2S)\|H\|_F^2>\frac1{16}\|H\|_F^2.
~~~

This proves (1). Since P_n(0)=1 and its derivative there vanishes,
integration along tB proves (2).

## 4a. A tighter Hessian comparison in a smaller ball

The same proof gives a useful two-sided estimate. If B is real centered
and its Frobenius norm is at most 1/2000, then, for every real centered H,

~~~math
\left|
\nabla^2P_n(B)[H,H]
-\frac n{n-1}\|H\|_F^2
\right|
\le\frac{13}{50}\|H\|_F^2.                                  \tag{21}
~~~

Only the constants in Section 4 change. Set delta=1/2000 and use e<11/4.
Then the cubic contribution to S is at most

~~~math
\frac32(11/4)^5\delta=\frac{483153}{4096000}.
~~~

The successive ratio in the factorial prefix is at most

~~~math
\frac{11}{8000}\frac{60^3}{59^2}
=\frac{297}{3481}<\frac1{10},
~~~

so that prefix contributes at most

~~~math
\frac{10}{9}\,96(11/4)^6\delta^2
=\frac{1771561}{153600000}.
~~~

The exponential tail has q=200(11/4)delta=11/40. The same geometric-series
identity as (17) gives a tail smaller than 1/1000000. Exact rational
comparison gives

~~~math
S<
\frac{483153}{4096000}
+\frac{1771561}{153600000}
+\frac1{1000000}
<\frac{13}{100}.
~~~

The normalized quadratic Hessian is exactly n/(n-1) times the identity,
and the remaining Hessian has quadratic-form norm at most 2S. This proves
(21). In particular the lower and upper Hessian bounds m=c_n-13/50 and
M=c_n+13/50 obey M<2m, because c_n=n/(n-1)>=1>39/50.


## 5. The zero-diagonal comparison

Set Q=I-J_n, B_0=U_n-J_n=-Q/(n-1), and D=A-U_n. The matrix D has zero
diagonal and zero line sums, so

~~~math
\langle B_0,D\rangle
=-\frac{\operatorname{tr}D}{n-1}=0,\qquad
\|B_0+D\|_F^2=\frac1{n-1}+\|D\|_F^2.                         \tag{19}
~~~

Under (3), the segment B_0+tD lies in the ball of Theorem 1. The first
variation of the permanent at U_n in direction D vanishes: simultaneous
row and column permutations fix U_n and act transitively on off-diagonal
positions, so all off-diagonal cofactors are equal. Their contraction with
D is zero because its diagonal and total sum vanish. Therefore

~~~math
\begin{aligned}
P_n(B_0+D)-P_n(B_0)
&=\int_0^1(1-t)\nabla^2P_n(B_0+tD)[D,D]\,dt\\
&\ge\frac1{32}\|D\|_F^2.
\end{aligned}
~~~

This proves (4). It compares the permanent directly and does not subtract
unrelated determinant-approximation error bounds.

## 6. Global comparison and the remaining gap

The [live Conjecture 44 page](https://yair-lavi.com/mincs-list/conjecture-44/index.html),
accessed 20 November 2026 (America/Chicago), reports that any counterexample satisfies

~~~math
\|A-U_n\|_F^2\le\sqrt{2/n}+O(1/n).                            \tag{20}
~~~

The page supplies neither the proof of (20) nor its complete constants.
The subsequent [explicit global proof](explicit_eventual_zero_diagonal.md)
therefore reconstructs a multicolumn capacity estimate directly from
Lelarge's maximum-matching coefficient inequality and Gurvits's theorem.
It proves, for every doubly stochastic $`A`$ and $`1\le k<n`$,

~~~math
\log\frac{\operatorname{per}A}{d_n}
\ge\frac{k\|A-J_n\|_F^2}{2n}
-\frac{k(k-1)}{4(n-k)(n-k+1)}.
~~~

With the upper Hessian bound from Section 4, this excludes every
zero-diagonal matrix outside the ball in Theorem 1 when
$`n\ge20\,000\,000\,000\,000`$. Theorem 2 handles the interior and proves
uniqueness. This argument supplies an explicit threshold and covers
equality candidates without relying on the unexpanded term in (20).

The remaining finite orders are not solved. Numerical tests cannot fill
this gap. Completed full Minc entries from these notes: zero.

## 7. Priority and verification record

The coefficient theorem proves (5). The partition identity, contraction
bound, complex Cauchy estimate, and rational bounds above are proved here.
The accompanying checker verifies low-degree identities on exact integer
matrices and checks the rational constants. These are formula diagnostics,
not substitutes for the all-order proof.

Searches on 20 November 2026 (America/Chicago) included the catalogue pages, both search engines,
"zero diagonal permanent sufficiently large", "zero trace permanent
minimum conjecture", "real van der Waerden radius", and "permanent
Frobenius radius". No earlier uniform radius or eventual C44 theorem was
located. This records the search and does not establish priority.

Primary sources and source boundaries:

- Yair Lavi, [Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html)
  and [Problem 13](https://yair-lavi.com/mincs-list/problem-13/index.html).
  These give the targets and reported confinement; neither full target
  is resolved here.
- D. London and H. Minc, *On the permanent of doubly stochastic matrices
  with zero diagonal*, Linear and Multilinear Algebra 24 (1989), 289-300,
  [publisher abstract](https://doi.org/10.1080/03081088908817922).
  Its stated theorem covers orders at most four.
- J. B. Burghduff, *Minimum permanents of doubly stochastic matrices with
  zero main diagonal*, Linear and Multilinear Algebra 40 (1995), 125-140,
  [publisher abstract](https://doi.org/10.1080/03081089508818428).
  Its stated conclusion is strict local minimality in every order.
  The full paper was not retrieved; no claim is made about every constant
  that might occur inside it.
- G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open
  problems involving permanents*, Linear Algebra and its Applications
  403 (2005), 314-342,
  [author-hosted text](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf).
  This is a historical status source, not a proof input.
- R. Sinkhorn, *A neighborhood in which the van der Waerden permanent
  conjecture is valid*, Linear and Multilinear Algebra 10 (1981), 217-221,
  [DOI](https://doi.org/10.1080/03081088108817413).
  Identified through the catalogue; its full text was not retrieved here.
- B. Roos, *New permanent approximation inequalities via identities*,
  [arXiv:1612.03702v3](https://arxiv.org/html/1612.03702v3), and P. McCullagh,
  *An asymptotic approximation for the permanent of a doubly stochastic
  matrix*, [author-hosted text](https://www.stat.uchicago.edu/~pmcc/pubs/dspermanent.pdf).
  Their previously audited hypotheses do not directly give (4). A
  complete comparison for priority remains open.

