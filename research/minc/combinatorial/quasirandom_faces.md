# Characterizing cohesive matrices

Let $S_n$ be binary square supports. Suppose that for some $\epsilon n\le k=k(n)\le n$, all row and column degrees are $(1+o(1))k$ uniformly and
```math
\|S_n/k-J_n\|_{\rm op}=o(1),\qquad J_n=\mathbf1\mathbf1^T/n.
```
Here $n\to\infty$. These are near-regularity and spectral quasirandomness at positive density. For all sufficiently large orders the doubly stochastic face on $S_n$ has a **unique permanent minimizer $X$**, it lies in the relative interior, and
```math
\max_{S_{ij}=1}|kX_{ij}-1|=o(1). \tag{1}
```
In particular every such sequence is eventually cohesive. This covers asymmetric supports. Regular supports in this class have an exact barycentricity criterion below. The two unrestricted [Brualdi problems](https://yair-lavi.com/mincs-list/problem-14/index.html) remain open.

## The affine projection on the support

Let $d_i,e_j$ be the row and column degrees. Set $R_{ij}=S_{ij}/d_i$ and $T_{ji}=S_{ij}/e_j$. Write $\pi_j=e_j/\sum e_j$. The row-stochastic matrix $TR$ preserves $\pi$; it has norm $o(1)$ on $\pi$-centered vectors in maximum norm. Indeed $`\|R-J_n\|_{\rm op}=o(1)`$ by the degree and spectral assumptions. A $\pi$-centered $v$ satisfies $`|n^{-1}\sum v_j|=o(1)\|v\|_\infty`$ by near-regularity. Each row of $T$ has Euclidean norm $O(1/\sqrt n)$, so
```math
\|T(R-J_n)v\|_\infty\le O(1/\sqrt n)\|R-J_n\|_{\rm op}\sqrt n\|v\|_\infty.
```

Orthogonal projection of supported matrices onto the affine space of supported real matrices with margins one has Lipschitz constant $O_\epsilon(1)$ in entrywise maximum norm. To correct the margins of an input $Y$, subtract a potential $p_i+q_j$ on allowed entries. The equations are $p+Rq=r$, $q+Tp=c$, where $r_i=(\sum_jY_{ij}-1)/d_i$ and $c_j=(\sum_iY_{ij}-1)/e_j$. The vector $c-Tr$ has $\pi$-mean zero. Solve $(I-TR)q=c-Tr$ with $\pi$-mean zero by the convergent geometric series, then put $p=r-Rq$. The potentials have maximum norm $`O(\|r\|_\infty+\|c\|_\infty)`$. The correction is perpendicular to every supported zero-margin direction, proving it gives the orthogonal projection. Applied to differences, the same equations with target margins zero prove the Lipschitz claim.

Starting from $S_n/k$ gives $`\|r\|_\infty+\|c\|_\infty=o(1/k)`$. The projection $W$ is positive on all allowed cells with $W_{ij}=(1+o(1))/k$. Because $S_n/k$ is itself constant on the support and hence perpendicular to the tangent space, $W$ is also the orthogonal projection of zero. We have $`\|W-J_n\|_{\rm op}=o(1)`$ and $`\|W-J_n\|_F^2=n/k-1+o(1)`$ by the entry estimates and the degree hypotheses. In particular this constructs a doubly stochastic point of full support.

## Confinement of minimizers

Write $`P(B)=\mathop{\mathrm{per}}(J_n+B)/(n!/n^n)`$ and $u=n/k-1$. The [small-operator limit](../real-radius/hilbert_schmidt_limit.md) gives $P(W-J_n)=e^{u/2}+o(1)$. We claim that **every** doubly stochastic $A$ on the support with $P(A-J_n)\le P(W-J_n)$ has bounded Frobenius norm and $`\|A-J_n\|_{\rm op}=o(1)`$.

Uniform stability first bounds $`\|A\|_F`$. The localized-factor proof for [integer minimizers](positive_density_integrality.md) used integrality only for the final lower bound on the squared norm of the untouched block. For a block obtained by deleting $s=o(n)$ distinguished rows and columns as in that proof, the remaining mass is at least $n-2s$ and there are at most $(1+o(1))nk$ allowed entries. Cauchy–Schwarz therefore bounds its squared norm below by $(n-2s)^2/((1+o(1))nk)=n/k-o(1)$. This gives precisely the same lower bound $u-o(1)$ after centering. Every macroscopic entry would add a strict localized factor above $e^{u/2}$, as in the linked proof. Thus $\max A_{ij}=o(1)$. The [small-cut bound](diffuse_integrality.md) gives a spectral gap, and the diffuse determinant comparison gives
```math
\log P(A-J_n)\ge\tfrac12\|A-J_n\|_F^2+\tfrac14\|A-J_n\|_{\rm op}^4+o(1).
```
The first squared norm is at least $u-o(1)$, again by Cauchy–Schwarz on the whole support. The comparison with $W$ proves the claim.

## Entrywise cofactor differences

For a sequence $A$ as just confined, put $a=\max A_{ij}$ and $`C_{ij}=\mathop{\mathrm{per}}A(i\mid j)/\mathop{\mathrm{per}}A`$. There are row and column potentials $u_i,v_j$ with
```math
C_{ij}=A_{ij}+u_i+v_j+E_{ij},\qquad \max_{ij}|E_{ij}|=o(a). \tag{2}
```

For details, delete any two distinct rows $i,p$ and columns $j,q$ to obtain $M$. The [cofactor estimate and switch expansion](diffuse_integrality.md) apply to general real nonnegative entries here. With $L=E^{ij}+E^{pq}-E^{iq}-E^{pj}$ the exact derivative divided by $`\mathop{\mathrm{per}}M`$ is
```math
A_{ij}+A_{pq}-A_{iq}-A_{pj}+o(a).
```
Indeed the remaining error before division is the contraction of the $(m-1)$-order cofactors of $M$ with the restricted differences of the two rows and columns. Their Euclidean norms are $O(\sqrt a)$ and their coordinate sums are $O(a)$, regardless of the four cell values. This is exactly the estimate proved in the linked calculation.

Moreover $`\mathop{\mathrm{per}}M/\mathop{\mathrm{per}}A=1+o(1)`$ uniformly. The cofactor decomposition there, applied directly to $A$, gives $C_{ij}=1+o(1)$ entrywise. After a single deletion the same diagonal-scaling argument (with deficits bounded by $a$, of sums at most one) produces a doubly stochastic matrix with spectrum and norm satisfying the same hypotheses. Its cofactor ratios are also $1+o(1)$, and undoing the scaling changes them by $1+o(1)$. Multiplying the ratios for successive deletions proves the assertion. Thus every two-by-two alternating sum of $C-A$ is $o(a)$. Subtract the row and column potentials obtained by fixing one reference row and one reference column to get (2). The little-oh estimates are uniform by the arbitrary-sequence arguments in the cofactor estimate.

## From a box to the full face

Minimize $`\mathop{\mathrm{per}}A`$ first on the part of the face where $1/(2k)\le A_{ij}\le3/(2k)$ at each allowed entry. This compact set contains $W$, so a minimizer $`A_*`$ satisfies the confinement result, and in (2) its error is $o(1/k)$. The directional first-order condition for the permanent says $`\langle C,Y-A_*\rangle\ge0`$ for all $Y$ in the box. Since row and column potentials have zero pairing with feasible differences, this is the condition that $`A_*`$ minimize $`\|Y\|_F^2/2+\langle E,Y\rangle`$ on the box. The orthogonal projection of $-E$ (restricted to allowed entries) onto the *affine* margin space is $W+o(1/k)$ entrywise by the projection estimate. It lies strictly inside the box. The quadratic is strictly convex, so this projection equals $`A_*`$. In particular $`A_*`$ satisfies (1), and it is stationary on the full supported affine space.

Every full-face global minimizer $A'$ satisfies the same confinement claim. The segment from $`A_*`$ to $A'$ has bounded Frobenius norms and uniformly vanishing centered operator norms. The [uniform Hessian formula](../real-radius/small_operator_perturbations.md) makes the permanent strictly convex along every nonconstant such segment for all sufficiently large orders: normalized second directional derivatives in unit centered directions are at least $1-o(1)$. Its first derivative at $`A_*`$ vanishes. Hence $A'$ must equal $`A_*`$, proving uniqueness and cohesiveness.

## Regular barycentric supports

When every degree is exactly $k$, the face is eventually barycentric **if and only if all allowed edges belong to the same number of perfect matchings**, with the equivalence holding separately at every sufficiently large order of the sequence. Equivalently its barycenter equals $S_n/k$. In particular edge-transitive supports satisfying the hypotheses are barycentric.

Here is the necessity directly. Every edge is active since $S_n/k$ is doubly stochastic with full support. If the barycenter $b$ minimizes, then it is interior. Its normalized cofactor array $C$ on the support is a sum of row and column potentials by stationarity. The matrix with entries $b_{ij}C_{ij}$ is doubly stochastic by Laplace expansion. Thus $b\circ(C-1)$ has zero margins; pairing it with the potential $C-1$ gives $\sum b_{ij}(C_{ij}-1)^2=0$. Hence $C_{ij}=1$ on the support. The permutation law with mass proportional to $\prod_i b_{i,\pi(i)}$ therefore has marginal matrix $b$, as does the uniform law on the allowed permutations by definition of $b$. Both laws have the same expectation of the logarithm of the first law by their common marginals. Nonnegativity of relative entropy against that law implies its entropy is at least the entropy of the uniform law, so the two laws coincide. All sums $\sum_i\log b_{i,\pi(i)}$ are consequently equal. By the Birkhoff decomposition, $\log b$ is perpendicular to the supported tangent space. In particular
```math
\sum_{S_{ij}=1}(b_{ij}-1/k)\log(k b_{ij})=0.
```
Every summand is nonnegative, forcing $b=S_n/k$. Conversely, constant perfect-matching counts on edges give $b=S_n/k$, and all its allowed cofactors are equal by rescaling from $S_n$. Hence it is stationary. It has vanishing centered operator norm and bounded Frobenius norm, so strict convexity on the segment to the unique minimizer proves they coincide. The necessity agrees with the [catalogue's stationarity test](https://yair-lavi.com/mincs-list/problem-15/index.html); sufficiency here uses quasirandomness and confinement.

## Brualdi's support with one allowed diagonal entry

Take $C_n$ to have all off-diagonal entries allowed and exactly the first diagonal entry allowed. It satisfies the hypotheses with $k=n$ because it differs from the all-ones matrix by a diagonal matrix of norm at most one. Thus $C_n$ is cohesive with a unique global minimizer for every sufficiently large $n$. Its minimum has a closed formula. Put $m=n-1$, let $D_j$ count derangements of $j$ letters, and define
```math
c=1+D_{m-1}/D_m,\qquad y=\frac1{1+(m-1)c},\qquad z=cy,\qquad x=1-my.
```
The minimizer has first diagonal entry $x$, all other entries on its first row and column equal to $y$, and all other allowed entries equal to $z$. The minimum is $D_m z^m$.

Indeed the uniqueness theorem forces invariance under simultaneous permutations of the final $m$ indices and transposition. The two margins give $x=1-my$, $(m-1)z=1-y$. All positive-entry cofactors of an interior minimum equal its permanent, by the stationarity and Laplace argument in the preceding section. The first diagonal cofactor is $D_m z^m$. Expanding the full permanent through the first row and column instead gives $xD_m z^m+y^2z^{m-1}m(D_m+D_{m-1})$. For the second term, the forbidden diagonal minors of the order-$`m`$ derangement matrix each have permanent $D_{m-1}$, while the off-diagonal cofactors in each row sum to $D_m$. Equating both expressions gives $z=cy$ since $y>0$, and the claimed formula follows. The [exact cofactor check](verify_quasirandom_faces.py) evaluates every allowed cofactor and the permanent itself at these rational matrices in sample orders. The catalogue gives the exact result in order five; the argument here gives an eventual theorem and does not cover each remaining finite order. [Prior status](https://yair-lavi.com/mincs-list/problem-14/index.html)

## Barycentricity without exact regularity

Under the original near-regular hypotheses, let $b$ be the barycenter. For every sufficiently large order, the support is barycentric if and only if its positive matching counts factor on the edges:
```math
\mathop{\mathrm{per}}S_n(i\mid j)=\alpha_i\beta_j\quad(S_{ij}=1),\qquad \alpha_i,\beta_j>0. \tag{3}
```
Thus the finite stationarity condition in Brualdi's [barycentric problem](https://yair-lavi.com/mincs-list/problem-15/index.html) becomes sufficient on the entire class, including the nonregular case.

We first construct a doubly stochastic diagonal scaling $V$ of $S_n$ with $kV_{ij}=1+o(1)$ uniformly on its edges. For column log multipliers $v$ put $s_i(v)=\sum_j S_{ij}e^{v_j}$ and define the column update after row normalization by
```math
F_j(v)=-\log\sum_i S_{ij}/s_i(v).
```
It obeys $F(v+t\mathbf1)=F(v)+t\mathbf1$ and $F(0)=o(1)$ uniformly by the degree assumption. Its derivative is a row-stochastic product $T(v)R(v)$ with
```math
R(v)_{ij}=S_{ij}e^{v_j}/s_i(v),\qquad T(v)_{ji}=(S_{ij}/s_i(v))/\sum_l S_{lj}/s_l(v).
```
For $`\|v\|_\infty\le h\le1`$, each nonzero entry of the first factor relative to $T$, and the second relative to $R$, is $1+O(h)+o(1)$, with absolute constants. The difference of the products has induced maximum norm $O(h)+o(1)$, by the row sums of $T,R$. Normalize iterates by subtracting their $\pi$-weighted mean. On the $\pi$-centered subspace the maximum norm of the derivative of this normalized update is $O(h)+o(1)$, by the bound for $TR$ proved above and the projection norm at most two. Choose a sufficiently small fixed $h$; for large $n$ this derivative norm is below $1/2$. The normalized update maps the closed ball of radius $h$ into itself, because its value at zero tends to zero. Its fixed point has $`\|v\|_\infty=o(1)`$ by contraction. At that point $F(v)=v+t\mathbf1$, so all the column sums of $R(v)$ equal $e^{-t}$; its row sums are one, forcing $t=0$. This proves the asserted scaling using $V=R(v)$.

It follows that $`\|V-J_n\|_{\rm op}=o(1)`$ and $`\|V\|_F=O(1)`$. Diagonal scaling preserves the Gibbs distribution on allowed permutations, so its marginals are the barycenter $`b_{ij}=V_{ij}\mathop{\mathrm{per}}V(i\mid j)/\mathop{\mathrm{per}}V`$. The unprojected cofactor estimate in the proof of (2) gives $`\mathop{\mathrm{per}}V(i\mid j)/\mathop{\mathrm{per}}V=1+o(1)`$ uniformly. In particular $kb_{ij}=1+o(1)$ on the support, and $b$ itself has bounded Frobenius norm and vanishing centered operator norm.

For necessity, the relative-entropy argument above shows that at a minimizing barycenter all allowed permutations have the same product of the entries of $b$. Since $b$ is interior, the differences of these permutation matrices span the supported zero-margin tangent space. Its orthogonal complement on the support is exactly the space of row plus column potentials, by elementary linear algebra applied to the margin map. Thus $\log b_{ij}=p_i+q_j$ there. Using $`b_{ij}=\mathop{\mathrm{per}}S_n(i\mid j)/\mathop{\mathrm{per}}S_n`$ gives (3). Conversely, (3) makes $b$ a positive diagonal scaling of $S_n$. Its Gibbs law on permutations is uniform, hence its marginal on each edge is $b_{ij}$, so its allowed normalized cofactors are one. This makes $b$ stationary. The strict Hessian argument on its segment to the unique minimizer proves barycentricity.
