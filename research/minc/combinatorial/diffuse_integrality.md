# Integrality of the minimum permanent

Fix $0<\epsilon<1/2$. For $\epsilon n\le k\le(1-\epsilon)n$, take any integer entry cap $1\le K=o(k)$. For all sufficiently large orders, **every minimizer of the permanent over nonnegative integer matrices of margins $k$ and entries at most $K$ is binary**. The cap may grow with $n$. Equivalently, an unrestricted nonbinary minimizer in this density range must have some entry at least $\delta(\epsilon)k$ for all sufficiently large $n$, for some $\delta(\epsilon)>0$. The latter is a consequence of the capped statement. This leaves the [full conjecture](https://yair-lavi.com/mincs-list/conjecture-24/index.html) open. [Wanless](https://users.monash.edu.au/~iwanless/papers/Schrijminper.journalvers.pdf) proved equality of the exponential growth rates at fixed degree.

## Spectrum

Let $G$ be a capped minimizer, $A=G/k$, $B=A-J_n$, $a=\max A_{ij}=o(1)$ and $P(B)=\operatorname{per}(A)/d_n$ where $d_n=n!/n^n$. All binary matrices of these margins are admissible. The [circulant competitor](../extremal-graphs/positive_density_minimum.md) gives $P(B)\le e^{u_0/2}+o(1)$ where $u_0=(n-k)/k$ is bounded. Hence $\|B\|_F$ stays bounded by [uniform stability](../nov20-independent/inequalities/uniform_frobenius_stability.md). Every row and column of $A$ has Euclidean norm at most $\sqrt a$.

We give the detail needed to rule out small almost-isolated blocks. If the second singular value tends to one, the bipartite Cheeger argument of the [positive-density proof](../extremal-graphs/positive_density_minimum.md) gives a cut with row and column sizes $r,s$, total $h=r+s\le n$, and outgoing masses $y,z$ with $y+z=o(h)$. Thus $r,s\sim h/2$. The inside mass is $(h-y-z)/2\le ars$, forcing $h\to\infty$. The other diagonal block has mass comparable with $n$, and both complementary class sizes are comparable with $n$. The same integer-table entropy bound used in that proof gives
$$P(B)\ \ge\ c\sqrt{h/(1+\max(y,z))}.$$
Indeed the smaller diagonal mean is comparable with $h$, so the table construction with standard deviation $O(\sqrt{\min(y,z)})$ still fits in all margins. The four margin factors in the Stirling estimate have product comparable with $h^2n^2$; division by the total size $n$ and the two diagonal means of orders $h,n$ leaves a factor comparable with $h$ inside the square root. The entropy of the random table cancels the smaller off-diagonal factor as before. The bound diverges, contradicting the competitor.

With the resulting spectral gap, the [determinant approximation](../real-radius/hilbert_schmidt_limit.md) applies to $B$. Integrality gives
$$\|B\|_F^2=\frac{n-k}{k}+\frac{1}{k^2}\sum_{ij}G_{ij}(G_{ij}-1)\ge u_0.$$
The logarithm of the determinant factor is at least $\|B\|_F^2/2+\|B\|_{\rm op}^4/4$. Comparing with the binary competitor yields $\|B\|_{\rm op}=o(1)$.

## A cofactor estimate

Delete any two distinct rows $i,p$ and two distinct columns $j,q$ from $A$, leaving a square matrix $M$ of order $m=n-2$. Its row and column deficits from one have coordinates at most $2a$ and sums at most two, hence Euclidean norms $O(\sqrt a)$. Also $\|M-J_m\|_{\rm op}=o(1)$ by restriction from $A-J_n$ and $\|J_n|_{m\times m}-J_m\|_{\rm op}=2/n$.

There are diagonal scalings $D,F$ such that $T=DMF$ is doubly stochastic and the vectors of diagonal entries of $D-I,F-I$ have Euclidean norms $O(\sqrt a)$. To see this minimize
$$\Phi(x,y)=\sum_{ts}M_{ts}e^{x_t+y_s}-\sum_t x_t-\sum_s y_s$$
on the subspace perpendicular to $(\mathbf1,-\mathbf1)$. The gradient at zero has norm $O(\sqrt a)$. The Hessian there differs in operator norm by $o(1)$ from the block matrix with identity diagonal blocks and off-diagonal blocks $J_m$. On the subspace its eigenvalues are at least $1-o(1)$. The Hessian quadratic form at $(x,y)$ is $\sum M_{ts}e^{x_t+y_s}(v_t+w_s)^2$. In the unit ball it is bounded below by a fixed positive multiple of $\|(v,w)\|^2$ on the subspace. The minimum on the closed ball of radius $C\sqrt a$ is therefore in the interior for sufficiently large constant $C$. Its gradient vanishes, since the full gradient is perpendicular to the gauge direction everywhere. Exponentiating gives the claimed scalings, including the norm estimates. In particular $\|T-J_m\|_{\rm op}=o(1)$ and $\|T\|_F=O(1)$.

Let $C_{ts}=\operatorname{per}T(t\mid s)/\operatorname{per}T$ and $Q=I-J_m$. Then $\|QCQ\|_{\rm op}=o(1)$. Indeed the projected cofactor matrix is the Frobenius gradient of $\log P$ on the centered subspace. The [small-operator perturbation formula](../real-radius/small_operator_perturbations.md), differentiated at zero with the base direction any unit Frobenius centered matrix and small-operator perturbation $T-J_m$, gives $\|QCQ-(T-J_m)\|_F=o(1)$, uniformly in the deleted indices.

Write $C=\gamma\mathbf1\mathbf1^T+v\mathbf1^T+\mathbf1w^T+E$ with $E=QCQ$ and $v,w$ centered. Laplace expansion gives the row equations $\gamma\mathbf1+v+Tw+e=\mathbf1$, where $e_t=\sum_sT_{ts}E_{ts}$. The column equations read $\gamma\mathbf1+w+T^Tv+f=\mathbf1$ with the analogous column sums $f$. Cauchy–Schwarz row by row gives $\|e\|_2,\|f\|_2\le\|T\|_F\|E\|_{\rm op}=o(1)$. Averaging gives $\gamma=1+o(1)$. Projecting the two equations and using $\|T-J_m\|_{\rm op}=o(1)$ gives $\|v\|_2+\|w\|_2=o(1)$.

## Removing a repeated edge

Suppose $G$ is nonbinary. Choose $i,j$ with $A_{ij}=a\ge2/k$. Each zero set of row $i$ and column $j$ has size at least $n-k\ge\epsilon n$. Their opposite rectangle has positive mass since for any row set $S$ and column set $V$,
$$\left|A(S,V)-|S|\,|V|/n\right|\le\|B\|_{\rm op}\sqrt{|S|\,|V|}.$$
Thus some $p,q$ have $A_{iq}=A_{pj}=0$, $A_{pq}=b\ge1/k$. Put $L=E_{ij}+E_{pq}-E_{iq}-E_{pj}$ with $E_{ij}$ the single-cell unit matrix. In the remaining column and row coordinates put $r_s=A_{ps}-A_{is}$, $c_t=A_{tq}-A_{tj}$. Expansion in the two selected rows or columns gives
$$\partial_L\operatorname{per}A=(a+b)\operatorname{per}M+\sum_{t,s}c_t r_s\,\operatorname{per}M(t\mid s),\qquad
\partial_L^2\operatorname{per}A=4\operatorname{per}M.$$
For the first identity expand the difference of the $ij,iq$ cofactors in row $p$, and the difference of the $pq,pj$ cofactors in row $i$. Each remaining cofactor difference expands in the unique one of columns $j,q$ still present. The permanent in this direction has degree at most two.

Both $r,c$ have Euclidean norm at most $2\sqrt a$ and coordinate sum of magnitude at most $2a$. The cofactor ratios for $M$ are $D_{tt}F_{ss}C_{ts}$, hence the ratio of the error sum to $\operatorname{per}M$ is $(Dc)^T C(Fr)$. The scaled vectors still have norm $O(\sqrt a)$ and coordinate sums $O(a)$, by Cauchy–Schwarz against the scaling vectors minus one. The constant piece of $C$ contributes $O(a^2)$, the two one-sided pieces contribute $o(a^{3/2})$, and the centered piece contributes $o(a)$. The estimates are uniform along any sequence of these choices.

At step $h_0=1/k$, the matrix $k(A-h_0L)$ is legal and within the same cap. Its normalized-matrix permanent changes by
$$h_0\operatorname{per}M\,[-a-b+2h_0+o(a)]<0$$
since $a+b-2h_0\ge a/2$. The scaling to a doubly stochastic matrix ensures $\operatorname{per}M>0$. This contradicts minimality and proves the result. The hypotheses on the degree and the largest multiplicity are used respectively for the zero rectangle and for the diffuse spectral and cofactor estimates.
