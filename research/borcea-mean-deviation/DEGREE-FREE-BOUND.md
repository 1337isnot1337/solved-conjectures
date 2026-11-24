# A degree-free bound for Borcea's mean-deviation conjecture

For a degree-$n$ polynomial $P$, $n\ge2$, let
$\sigma_1(P)=\inf_c n^{-1}\sum_i|z_i-c|$, where the roots $z_i$ are counted with multiplicity. The $p=1$ case of [Borcea's variance conjecture, Conjecture 1](https://arxiv.org/pdf/1010.5167#page=4) asks whether every root lies within $\sigma_1(P)$ of a critical point.

**Theorem.** There is an absolute constant $C$ such that every root $a$ of every $P$ as above lies within $C\sigma_1(P)$ of a critical point. The constant is independent of the degree. This does not prove the conjectured sharp constant $1$.

## A critical point near the median

Normalize by translating a geometric median to $0$ and scaling so that $\sum_i|z_i|=n$. The $\sigma_1(P)=0$ case is immediate, as are distinguished multiple roots.

Let $Z$ be the diagonal matrix with entries $z_i$, and let $e=n^{-1/2}(1,\dots,1)$ in $\mathbb C^n$. The compression of $Z$ to $e^\perp$ has characteristic polynomial $P'/(n\operatorname{lc}(P))$. Indeed, the corresponding cofactor of $zI-Z$ in an orthonormal basis ending with $e$ is
$$
\det(zI-Z)\langle e,(zI-Z)^{-1}e\rangle
=\frac1n \left(\prod_i(z-z_i)\right)'.
$$
The rational identity off the roots extends polynomially. Choose an orthonormal Schur basis $u_1,\dots,u_{n-1}$ for this compression. Its diagonal entries $w_j$ are the critical points, and
$$
\sum_{j=1}^{n-1}|w_j|
\le \sum_i |z_i|\sum_{j=1}^{n-1}|u_j(i)|^2
=\frac{n-1}{n}\sum_i|z_i|=n-1.
$$
The equality on coordinate weights follows by adjoining $e$ to the orthonormal basis. Some critical point has modulus at most $1$, giving $d(a,Z(P'))\le 1+|a|$.

## A critical point near a distant root

We use the absolute constant $B\ge1$ in the following consequence of the analytic-capacity weak-type theorem: for a positive finite atomic measure of mass $m$, every connected component of the strict superlevel set of its Cauchy transform at height $\lambda$ has diameter at most $Bm/\lambda$. To see this, away from the atoms the absolute Cauchy transform is bounded by its maximal truncation. The weak estimate $\gamma(\{C_*\mu>\lambda\})\le C_0m/\lambda$ is [Tolsa’s theorem as used in Totik, Lemma 4 and (6)](https://archive.intlpress.com/site/pub/files/_fulltext/journals/arkiv/2022/0060/0001/ARKIV-2022-0060-0001-a009.pdf#page=4); the classical inequality $\gamma(E)\ge\operatorname{diam}(E)/4$ applies to any continuum $E$, as in Totik's (5). Join two points of any component by a compact path within it, avoiding the finitely many atoms, and apply the two estimates to that path. Adding the atom locations back to the strict superlevel set does not change its components’ diameters because each pole fills a puncture. We may take $B=\max(1,4C_0)$.

Rotate so that $a>6(B+1)$ is positive real. Put $R=3B$ and $r=a/2$, so $R+r<a$. Split the roots into $k$ inner roots $|z_i|\le r$ and $m=n-k$ outer roots. Then $1\le m\le n/r$, since $a$ is outer and each outer root costs more than $r$; also $\sum_{i\ {\rm inner}}|z_i|\le n-mr$.

Let $G(z)=\sum_{i\ {\rm inner}}1/(z-z_i)$ and $H(z)=\sum_{i\ {\rm outer}}1/(z-z_i)$, so $P'/P=G+H$. For $|z-a|\le R$, each $z-z_i$ from an inner root is in the disk of center $a>0$ and radius $R+|z_i|<a$. The reciprocal in this disk has real part at least $1/(a+R+|z_i|)$; this follows either by inverting the disk or by expanding its defining squared-distance inequality. Jensen's inequality therefore gives
$$
\Re G(z)\ \ge\ \sum_{i\ {\rm inner}}\frac1{a+R+|z_i|}
\ \ge\ \frac{k}{a+R+(n-mr)/k}\ =:\ L>0.
$$

Set $t=m/n$ and $A=a+R$. The bound on $t$ gives
$$
\frac{m}{L}
=\frac{At}{1-t}+\frac{t(1-rt)}{(1-t)^2}
\le \frac{A}{r-1}.
$$
For the inequality, the derivative of the middle expression has numerator $A(1-t)+1+(1-2r)t$ over $(1-t)^3$. The numerator is decreasing in $t$ and at $t=1/r$ it is $(A-1)(1-1/r)>0$. Thus the displayed middle expression is largest at $1/r$. In particular,
$$
\frac{Bm}{L}\le\frac{B(a+3B)}{a/2-1}<R
\qquad(a>6(B+1)).
$$
The final strict inequality is equivalent to $a>6(B+1)$.

Choose $\lambda$ with $Bm/R<\lambda<L$ at which the level $|H|=\lambda$ is regular; there are only finitely many excluded values, since $H$ is a nonconstant rational function. By the component bound, every component of $\{|H|>\lambda\}$ has diameter at most $Bm/\lambda<R$. Let $U$ be the component containing the pole $a$. Its closure lies strictly inside $|z-a|<R$.

The regular level $|H|=\lambda$ is a compact smooth one-dimensional submanifold of the plane, hence a finite disjoint union of Jordan curves. The outer boundary of $U$ is one such curve. Its interior contains $a$ and lies in $|z-a|<R$, because that disk is convex and contains the entire curve. On the curve, $|H|=\lambda<L\le|G|$. Also $G$ is holomorphic and has strictly positive real part on the whole enclosed region. The meromorphic argument principle and Rouché's inequality give equal counts for the zeros and poles of $G+H$ inside: its winding number agrees with that of $G$, namely zero. There is at least the pole at $a$, since residues of the logarithmic derivative are positive multiplicities, so $G+H$ has a zero inside. That is a critical point of $P$ within distance $R=3B$ of $a$.

The near-median inequality handles $|a|\le6(B+1)$, so the two cases give the uniform factor $C=6B+7$. The compression inequality and the Cauchy-transform estimates are prior ingredients. The new application compares the total cost of an outer root with its contribution to the field close to a distinguished root. A targeted search did not locate this degree-free mean-deviation bound, but this is not a priority guarantee. The work does not address the sharp universal constant.
