# Real van der Waerden radius

Write $P_n(M)=\operatorname{per}(J_n+M)/(n!/n^n)$ on the space of real $n\times n$ matrices with zero row and column sums. Assume $H_n,B_n$ are in this space, both Frobenius norms are bounded, $\|H_n\|_{\rm op}\le\rho<1$, and $\|B_n\|_{\rm op}\to0$. For bounded complex $u$ and locally uniformly in $|z|<1/\rho$,

$$P_n(zH_n+uB_n)=P_n(zH_n)\exp\left(uz\langle B_n,H_n\rangle_F+\tfrac12u^2\|B_n\|_F^2\right)+o(1). \tag{1}$$

The base matrices $H_n$ may have localized rows or columns and unbounded nuclear norm. Formula (1) compares the permanent with the actual permanent of the base. In particular it does not require a determinant formula for that base. For power series with complex coefficients use the bilinear extension of the real Frobenius pairing.

## Fixed-degree comparison

For a centered matrix $M$, two applications of partition-lattice inclusion–exclusion give

$$\sigma_k(M)=\frac1{k!}\sum_{\pi,\tau}\mu(\pi)\mu(\tau)\sum_{i:\pi\to[n],\,j:\tau\to[n]}\prod_{e=1}^k M_{i(\pi(e)),j(\tau(e))},\qquad \mu(\pi)=\prod_{S\in\pi}(-1)^{|S|-1}(|S|-1)!.$$

Here $\pi,\tau$ range over partitions of $[k]$ and $\pi(e)$ is the block containing $e$. A singleton block gives zero by centering. The two partitions specify a bipartite multigraph on their blocks with an edge for each label $e$. Each remaining vertex has degree at least two. The total sum factors over its connected components. This is the [centered partition expansion](../nov20-independent/inequalities/uniform_radial_permanent.md).

Color each edge by choosing $H$ or $B$. For any such graph the absolute contraction is at most the product of edge Frobenius norms. Indeed sum first over each right index. Hölder bounds the sum of a product of $d\ge2$ sequences by the product of their $\ell_2$ norms, by ordinary Hölder with exponent $d$ and $\|v\|_d\le\|v\|_2$. The remaining sums over left indices factor and give the same estimate in terms of row norms.

A connected component containing a $B$ edge has contraction $o(1)$ unless it consists of just two parallel edges. There are two cases.

* If a $B$ edge meets a vertex of degree at least three, orient the graph with that vertex on the left. In its last Hölder bound use the maximum row norm of that edge and take the other two or more factors in $\ell_2$. This gains $\|B\|_{\rm op}$ in place of its Frobenius norm.
* If both endpoints of the $B$ edge have degree two, let $C,D$ label their two other edges. When these are the same edge the component is the exceptional double edge. Otherwise summing over the two endpoint indices replaces the three-edge path by one edge with matrix $CB^TD$ or its transpose, with orientations adjusted. Its Frobenius norm is at most $\|C\|_F\|B\|_{\rm op}\|D\|_F$. The contracted path has odd length, so its two remaining endpoints lie on opposite sides. Their degrees are preserved, including when the new edge has a parallel neighbor. Apply the preceding graph bound.

For fixed total degree the number of graphs and colorings is finite, so all these errors are uniform under bounded Frobenius norms as $\|B\|_{\rm op}\to0$. In each surviving component with a $B$ edge, the two size-two partition blocks each supply a minus sign, giving a positive product. A double edge of two $B$ labels contributes $\|B\|_F^2$, and one of each label contributes $\langle B,H\rangle_F$. All other components use only $H$. In the exponential generating function the symmetry factor is $1/2!$ for two $B$ labels, and the two colors can be ordered in two ways for the mixed pair. Equivalently, choose the disjoint pairs of labels first, then apply the partition formula to the remaining labels. Thus with $w$ a formal variable, for each fixed $k$,

$$\sigma_k(zH+uB)-[w^k]\left(\sum_{j=0}^n\sigma_j(H)(wz)^j\right)\exp\left(w^2(uz\langle B,H\rangle_F+u^2\|B\|_F^2/2)\right)\to0.$$

The factors $a_{n,k}^{-1}=n^k/(n)_k$ and $a_{n,j}^{-1}$ tend to one in every fixed degree. They may therefore be inserted on the left and on the $H$ coefficients, respectively.

## Summation and derivatives

The [uniform normalized coefficient estimate](hilbert_schmidt_limit.md) also applies to complex centered matrices. In its proof use a complex singular value decomposition and proper Gaussian covariance $E$. The real covariance of the real and imaginary parts is $\tfrac12\left(\begin{smallmatrix}\operatorname{Re}E&-\operatorname{Im}E\\\operatorname{Im}E&\operatorname{Re}E\end{smallmatrix}\right)$, which again has operator norm $\|E\|_{\rm op}/2$, Frobenius norm $\|E\|_F/\sqrt 2$, and isotropic complex marginals. These are the only uses of reality in the coefficient estimate. On the desired compact set $\|zH+uB\|_{\rm op}\le |z|\rho+|u|\|B\|_{\rm op}<1$ uniformly for all sufficiently large $n$, and the Frobenius norms stay bounded. The estimate now gives uniform geometric tails at $w=1$. The right side has the same property by applying the estimate to $zH$ and using the ordinary exponential series. Summation proves (1), and Cauchy's formula gives convergence of derivatives on interior compact sets.

In particular, at a sequence $B_n$ of vanishing operator norm and bounded Frobenius norm, the permanent has the following uniform Hessian over real centered $E$ with $\|E\|_F=1$:

$$\nabla^2P_n(B_n)[E,E]=e^{\|B_n\|_F^2/2}\big(1+\langle B_n,E\rangle_F^2\big)+o(1).$$

Indeed apply (1) with $H_n=E$, $u=1$, and say $|z|\le1/3$ (the proof only needs $|z|\|E\|_{\rm op}<1$). At zero, $P_n(0)=1$, $\nabla P_n(0)=0$ and $\nabla^2P_n(0)[E,E]=n/(n-1)$ by the exact quadratic coefficient. The bounds in the preceding argument hold for arbitrary sequences of unit directions, proving uniformity. In particular this gives positive curvature in every tangent direction eventually, even when $\|B_n\|_F$ is a large fixed constant. This does not determine Sinkhorn’s [sharp radius](https://yair-lavi.com/mincs-list/problem-13/index.html).
