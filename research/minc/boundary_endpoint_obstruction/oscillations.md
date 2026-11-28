# Monotonicity toward the boundary

For every integer $r\ge1$ there is a binary matrix $G$ with all line sums three such that along the segment from the uniform matrix to $G/3$, the permanent has at least $r$ strict local maxima and $r$ strict local minima in the open interval. Its derivative is strictly positive at the endpoint. Connected supports with at most four entries per row and column also have arbitrarily many such extrema. This extends the [two-turn example](README.md) to an unbounded number. It describes how badly monotonicity can fail in the [Friedland–Minc problem](https://yair-lavi.com/mincs-list/problem-8/index.html). A general classification of its monotone matrices remains open.

## Matching probabilities and repeated blocks

For a fixed doubly stochastic matrix $A$ of order $n$, write $R(z)=\sum_k\sigma_k(A)z^k=\prod_{j=1}^n(1+z\beta_j)$, where $\sigma_k$ sums all $k$-rowed subpermanents. The factors have $\beta_j>0$ by the weighted matching root theorem and existence of a perfect matching. At activity $z>0$, give each matching weight proportional to $z^{|M|}\prod_{e\in M}A_e$. The expected fraction of unmatched rows is
```math
 u_A(z)=1-\frac{zR'(z)}{nR(z)}=\frac1n\sum_j\frac1{1+z\beta_j}.
```
This fraction averages with weights proportional to the block orders under direct sum. Define $u_0(z)=2/(1+\sqrt{1+4z})$, the positive solution of $1-u_0=zu_0^2$. [Heilmann and Lieb](https://doi.org/10.1007/BF01877590)

Let $A_m$ be the sum of $m$ copies of $A$, $N=mn$, and $`F_m(t)=\mathop{\mathrm{per}}((1-t)J_N+tA_m)`$. At each fixed $0<t<1$ where the two fractions differ,
```math
 \mathop{\mathrm{sign}} F'_m(t)=\mathop{\mathrm{sign}}\{u_0(z)-u_A(z)\},
 \qquad z=t/(1-t)^2,quad m\text{ sufficiently large}.                 \tag{1}
```
To prove this expand the permanent by the matching chosen from $tA_m$. The unused rows and columns contribute a factorial, which has a gamma integral. With $v=t/(1-t)$ this gives
```math
 F_m(t)=N\int_0^\infty L_t(y)^m\,dy,\qquad
 L_t(y)=e^{-ny}(1-t)^n\prod_j(y+v\beta_j).
```
The logarithm of $L_t$ is strictly concave, tends to minus infinity at infinity, and has a unique maximum $`y_*\ge0`$. The probability density proportional to $L_t^m$ concentrates at $`y_*`$. Indeed outside any fixed neighborhood the supremum is strictly below the maximum, and its integral there is bounded by this smaller supremum to the power $m-1$ times $\int L_t$. On a smaller interval about the maximum the integrand gives a strictly larger exponential lower bound. At fixed $t$ the logarithmic derivative in $t$ of $L_t$ is bounded over all $y\ge0$, and locally so in $t$, which justifies differentiating and taking its concentrated average. The resulting limit is
```math
 \lim_{m\to\infty}\frac{F'_m(t)}{NF_m(t)}=\frac{1-t-y_*}{t(1-t)}.
```
Here $`n^{-1}\sum (y_*+v\beta_j)^{-1}=1`$ at an interior maximum. At $`y_*=0`$ direct substitution gives the same answer $1/t$. Strict concavity compares $`y_*`$ with $1-t>0$ by the sign of $\partial_y\log L_t$ at $1-t$. Its value divided by $n$ is $u_A(t/(1-t)^2)/(1-t)-1$. Since $1-t=u_0(z)$, this proves (1).

## Constructing successive reversals

Use the cubic Jerrum graphs in [Wanless's counterexample](https://doi.org/10.1016/S0024-3795(98)10177-5). The graph at length $f$ has three arms, each a chain of $f$ copies of $K_{3,3}$ with a distinguished edge removed. Join the distinguished row in each cell to the distinguished column of the next. A common initial row and a common terminal column supply the two ends of each arm. The order is $n_f=9f+1$. Write $C_f$ for its adjacency matrix divided by three. Each perfect matching uses exactly one arm's transfer edges throughout. Its cells each contribute two choices; each inactive cell has four. There are $`3\,32^f`$ perfect matchings. Deleting the initial row and terminal column allows at least $4^{3f}$ near-perfect matchings. Correcting for division by three gives
```math
 \sum_j\beta_j^{-1}=\sigma_{n_f-1}(C_f)/\sigma_{n_f}(C_f)\ge2^f .
```
At $z_f=\max_j\beta_j^{-1}\ge2^f/n_f$, one summand in $u_{C_f}$ is $1/2$. Consequently
```math
 \frac{u_{C_f}(z_f)}{u_0(z_f)}\ge\frac{\sqrt{z_f}}{2n_f}\longrightarrow\infty.
```
For any *fixed* matrix with a perfect matching the ratio tends to zero as $z\to\infty$, since the numerator is $O(1/z)$. These two facts allow a constructive induction.

Start with any cubic block, and choose a finite activity where its ratio is strictly below one. Suppose a cubic block sum already has an increasing finite list of activities with ratios alternately below and above one, ending below. Choose a positive rational weight $\eta$ so small that replacing $u_A$ by $(1-\eta)u_A+\eta u_C$ preserves all these strict signs for every $C$. This is possible because all unmatched fractions lie in $[0,1]$ and the list is finite. Choose $f$ with $z_f$ beyond the list and $\eta u_{C_f}(z_f)>u_0(z_f)$. Realize the mixture exactly by a direct sum: if $\eta=p/q$, take $(q-p)n_f$ copies of $A$ and $pn$ copies of $C_f$. Its ratio is above one at $z_f$ and below one at some still larger activity. This adds two strict alternations per step. The activities can be chosen rational by continuity.

Take enough copies of the final matrix to apply (1) at every chosen activity simultaneously. The transformation $z=t/(1-t)^2$ preserves their order. Positive and negative derivative signs alternating $2r$ times force the stated strict extrema because the derivative is a nonzero polynomial. The endpoint derivative is also positive for sufficiently many copies: the ratio $\sigma_{N-1}(A_m)/\sigma_N(A_m)$ is $m\sigma_{n-1}(A)/\sigma_n(A)$, while the endpoint threshold is $N^2$.

To obtain a connected weighted example first permute columns to put an available matching on the diagonal. Mix the endpoint with a permutation matrix whose permutation is a single cycle through all $N$ indices, with a sufficiently small positive rational coefficient. All the strict finite signs persist, including at the endpoint. The diagonal edges and the cycle connect the bipartite support. There are at most four positive entries per row and column, leaving boundary zeros as soon as $N>4$.

## Holens–Đoković inequalities in the same examples

The normalized adjacent matching counts also reverse sign arbitrarily many times *as the matching size varies at a single matrix*. With the same fixed base $A$ and activity $z$, take $k=\lfloor N(1-u_A(z))\rfloor$. Then
```math
 \lim_{m\to\infty}\frac1N\left((k+1)\frac{\sigma_{k+1}(A_m)}{\sigma_k(A_m)}
                   -\frac{(N-k)^2}{N}\right)
 =\frac{1-u_A(z)}{z}-u_A(z)^2.
```
Indeed the total matching size under the activity-$`z`$ law is the sum of $m$ independent copies of a bounded integer random variable of span one and positive variance. Its probabilities at $k$ and $k+1$ have ratio tending to one. For completeness, Fourier inversion gives the same leading term $`1/\sqrt{2\pi m\mathop{\mathrm{Var}}(|M|)}`$ at both sites: the modulus of the characteristic function is strictly below one away from the origin on $[-\pi,\pi]$, and the centered expansion at the origin is $`1-\mathop{\mathrm{Var}}(|M|)s^2/2+O(|s|^3)`$. Rescaling by $\sqrt m$ gives the Gaussian integral, dominated there by a Gaussian since the variance is positive. The ratio of the two probabilities is $z\sigma_{k+1}/\sigma_k$. The right side has the sign of $u_0(z)-u_A(z)$. The typical matching density increases strictly with activity since its logarithmic derivative is the variance divided by $n$. Hence the finitely many selected sizes are increasingly ordered for large $m$.

The [integer replay](verify_oscillations.py) gives an explicit five-activity base using row proportions $999/1000$ and $1/1000$ of the length-10 and length-35 graphs. It checks strict signs by exact matching enumeration on the two blocks, and compares finite derivatives against the factorial expansion. The induction above provides the unbounded quantifier. Searches included the original Friedland–Minc problem, Wanless’s graph construction, matching occupancy bounds and literature on monotonicity of direct sums. Historical priority of the oscillation result remains unverified. [Friedland and Minc](https://doi.org/10.1080/03081087808817241) · [Direct sums paper](https://doi.org/10.1080/03081089308818193) · [Davies, Jenssen, Perkins and Roberts](https://doi.org/10.1112/jlms.12056)
