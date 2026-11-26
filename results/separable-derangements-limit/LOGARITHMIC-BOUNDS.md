# Logarithmic bounds for separable derangements

The [limit proof](PROOF.md) and the [power-law refutation](../separable-derangements-asymptotic/PROOF.md) can be complemented by a logarithmic scale estimate. There are positive constants $c,C,a,A$ such that
```math
c(\log n)^{-A}\le q_n\le C(\log n)^{-a}
```
for all sufficiently large $n$, where $q_n$ is the derangement proportion among uniform separable permutations of size $n$. The exponents are not identified. We also obtain the order of the critical Boltzmann diagonal occupation:
```math
h_\pm(d)\asymp \frac1{\sqrt{1+|d|}\log(2+|d|)}.
\tag{1}
```
The lower occupation bound is already in the limit proof (there shown for $h_-$; the same second-moment estimate gives it for $h_+$). The [Omega Institute project](https://github.com/the-omega-institute/trureturing/issues/15063) identified that lower-bound scale, and developed an occupation-map comparison; our upper estimate uses a different explicit Green-function barrier.

## 1. Sharp upper bound on critical occupation

Use the notation of the companion notes, in particular the negative-step law $\nu$, its Green kernel $G$, and the positive and negative occupation probabilities $h_\pm$. The Green estimate proved there is
```math
G(d)=c_G|d|^{-1/2}+O(|d|^{-1})\qquad (|d|\to\infty).
\tag{2}
```
All these functions are even. Set $\psi(u)=\sum_{k\ge2}p_k[1-(1-u)^k]$. On $0\le u\le1$ it is increasing and satisfies $\psi(u)\le u-p_2 u^2$ by isolating the $k=2$ term and using $\sum k p_k=1$. The exact two-step occupation map is
```math
T(V)=p_0\delta_0+\psi\big(\min(1,p_0\delta_0+\nu*V)\big).
\tag{3}
```
In the actual fixed point the inner minimum is redundant, since its argument is the negative occupation probability. Iterating (3) from zero increases to $h_+$. To justify this without an abstract fixed-point uniqueness claim, the $j$-th iterate is exactly the positive-root occupation event in which only leaves up to depth $2j-1$ are searched. All subtree sizes used in shifts are still the full critical Boltzmann sizes. For the negative union over possible next children, those children have disjoint displacement ranges even when searches are depth-truncated. At a positive node the independent child searches all use the same displacement. This gives the exact recursion for the truncated event. The finite Boltzmann trees make the event increase to true occupation. In particular a nonnegative supersolution of (3) bounds $h_+$.

Choose a large fixed integer $R$ and define the symmetric probability
```math
W_R(e)=\frac{c_R}{|e|\log^2|e|}1_{\{|e|\ge R\}},\qquad
c_R\asymp \log R.
```
Let $F_0=G-G*W_R$. We claim that for all sufficiently large $R$, with constants uniform in $R$ and $d$,
```math
F_0(d)\asymp G(d)\min\left(1,\frac{\log R}{\log(2+|d|)}\right)>0.
\tag{4}
```
For $0\le d<R/4$, all $e$ in the support have $|d-e|\ge3|e|/4$, so the convolution is $O(c_R/(\sqrt R\log^2R))$. This is $O(1/\log R)$ times $G(d)$ by its uniform lower bound. For $d\ge R/4$, write
```math
F_0(d)=\sum_e W_R(e)\big(G(d)-G(d-e)\big).
```
On $|e|>2d$, the first term is $G(d)\sum_{|e|>2d}W_R(e)\asymp G(d)\min(1,c_R/\log d)$. The subtracted convolution on that range is $O(c_R/(\sqrt d\log^2 d))$ by $G(d-e)\le C|e|^{-1/2}$. On $d/2<|e|\le2d$, use $W_R(e)\le Cc_R/(d\log^2d)$ and $\sum_{|j|\le3d}G(j)\le C\sqrt d$ to bound the absolute contribution by $O(c_R/(\sqrt d\log^2d))$. On $|e|\le d/2$, pair $+e$ and $-e$. Expanding the leading power in (2) by Taylor’s theorem at $d$ and bounding both residuals gives
```math
\left|G(d)-\frac{G(d-e)+G(d+e)}2\right|
 \le C(e^2 d^{-5/2}+d^{-1}).
```
Summing uses $\sum_{R\le e\le d/2} e/\log^2e=O(d^2/\log^2d)$ (split at $\sqrt d$), giving total error $O(c_R/(\sqrt d\log^2d)+d^{-1})$. The latter two errors divided by the leading term tend uniformly to zero for $d\ge R/4$ as $R\to\infty$. This proves (4).

Since $(I-\nu*)G=\delta_0$, we have $(I-\nu*)F_0=\delta_0-W_R$. The convolutions are justified by boundedness of $G$ and nonnegative probability kernels. Choose $M$ so large that $M F_0(0)\ge1$ and $MW_R\le p_2(MF_0)^2$ pointwise. Such $M$ exists because (4) implies $W_R/F_0^2$ is bounded on its support. Put $F=\min(1,MF_0)$. At a point with $F=1$, we have $T(F)\le1$ since $\psi(1)=1-p_0$. Otherwise $d\ne0$ and $`r=(\nu*F)(d)\le(\nu*(MF_0))(d)=F(d)+MW_R(d)`$. If $r\le F(d)$ then $T(F)(d)=\psi(r)\le r\le F(d)$. If $r>F(d)$, then
```math
T(F)(d)=\psi(r)\le r-p_2r^2\le F(d)+MW_R(d)-p_2F(d)^2\le F(d).
```
Thus $h_+\le F$ by (3). For $d\ne0$, the exact scalar loss equation gives
$0\le h_--h_+\le C h_-^2$. Since $h_-(d)\to0$, it follows that $h_-\le2h_+$ for large $|d|$. Combining with the previous lower bounds and adjusting constants on the finite core proves (1).

The random walk satisfies $\sup_d\Pr(S_j=d)=O(j^{-2})$ by the Fourier estimate in the asymptotic-refutation note. Split its expectation of (1) at $|d|=j^2$. The inner sum of $(1+|d|)^{-1/2}/\log(2+|d|)$ is $O(j/\log(2+j))$ (split at $|d|=j$ and use the sum of $d^{-1/2}$ on each part). Outside, the integrand is at most $C/(j\log(2+j))$. Thus
```math
\mathbb E h_-(-S_j)\le \frac{C}{j\log(2+j)}.
```
The small-history hazard $H_n$ in the two-macro-branch count is therefore $O(\log\log n)$. That unchanged finite count gives $q_n\ge c(\log n)^{-A}$.

## 2. A quantitative spine hit and the upper bound

Let $J_j$ be the independent negative-step increments. Split them into blocks $2^r\le j<2^{r+1}$, $r\ge0$, and put
```math
B_r=4^{-r}\sum_{j=2^r}^{2^{r+1}-1}|J_j|,\qquad
U_r=\sum_{m=0}^r4^{m-r}B_m.
```
The $B_r$ are independent and $\Pr(B_r>x)\le Cx^{-1/2}$ for $x\ge1$, uniformly in $r$: exclude individual increments above $x4^r$, then apply Markov’s inequality to the truncated sum, as in the limit proof. For every time $j$ in block $r$ one has $|S_j|\le4^r U_r$.

Fix $P$ large, consider block indices $r\le P$, and exclude the event of any $B_m>P^8$ there, of probability $O(P^{-3})$. Put $K=\lceil 8\log P/\log4\rceil+2$. On the remaining event, the contribution to $U_r$ from indices $m\le r-K$ is at most 1. Define $V_r=\sum_{0\le\ell<K,\ell\le r}4^{-\ell}B_{r-\ell}$. Uniformly in $r$ and $K$, $\Pr(V_r>x)\le C' x^{-1/2}$: require $B_{r-\ell}\le x 2^{\ell-1}$ for all $\ell$ and sum the failure probabilities; then the weighted allowed sizes sum to at most $x$. Choose a constant $x$ such that $V_r\le x$ with probability at least $9/10$ at every index. The corresponding indicators are independent within each residue class modulo $K$, because their windows of $B_m$ are disjoint.

Consider dyadic intervals of block indices $[2^b,2^{b+1}-1]$ with $2^b\ge\sqrt P$ and $2^{b+1}\le P$. The number of such intervals is bounded below by a constant multiple of $\log P$. Each residue class in each interval has at least $c\sqrt P/K$ indices for large $P$. By a Chernoff bound, the probability of fewer than half successes in any such class and interval is at most $\exp(-c'\sqrt P/K)$. A union bound over $O(K\log P)$ possibilities is $O(P^{-3})$. Therefore outside an event of probability $O(P^{-3})$, at least half the block indices in each of these intervals have $U_r\le x+1$.

On such a block all $2^r$ times have $|S_j|\le (x+1)4^r$, so the lower bound in (1) gives
$\sum_{j=2^r}^{2^{r+1}-1}h_-(-S_j)\ge c/(1+r)$. Each dyadic interval of block indices with at least half good blocks contributes at least a fixed positive constant. Summing the intervals produces total hazard at least $c''\log P$, using only $j<2^{P+1}$ negative steps. Conditional on the negative walk, the chosen first side tree at each intervening positive step is independent with the known hit probability. Hence the probability of no hit at all in these chosen side trees is at most $C P^{-a}$ for some $a>0$, after adding the exceptional probability. This holds for either initial root sign.

To transfer this estimate to finite trees, choose $P=\lfloor\log_2(n)/4\rfloor-2$. The number of spine records needed for the above event is $O(n^{1/4})$. Their total side size $L$ exceeds $n/3$ with probability $O(n^{-1/4})$ under the independent spine law: at each record the total side size has tail $O(T^{-1/2})$, and the same union/truncation argument used in the companion notes applies. For every record family with $L\le n/3$ the deepest residual size exceeds every side size, so the exact finite probability of each record is $s_{n-L}/s_n$. The explicit square-root generating function yields
```math
s_m\rho^m=c\,m^{-3/2}(1+O(m^{-1})),
```
by coefficient extraction of $(1-z)^{1/2}$ times the analytic factor $(1-\rho^2 z)^{1/2}$. For example, the binomial coefficient asymptotic with error $O(m^{-1})$ for the singular factor can be convolved with the exponentially decaying coefficients of the analytic factor: for $j\le m/2$ the coefficient ratio is $1+O((j+1)/m)$, and the rest is exponentially small. Consequently $s_{n-L}/s_n\ge(1-C/n)\rho^L$ uniformly when $L\le n/3$.

The probability in the finite tree of a hit in the recorded side trees is therefore at least $1-C(P^{-a}+n^{-1/4})$. These hits are genuine fixed points by the absolute-coordinate argument in the limit proof. Since $P\asymp\log n$, it follows that $q_n\le C'(\log n)^{-a}$. Together with the lower bound this proves the claimed bracket. Neither the two exponents nor a sharper logarithmic equivalent are determined.
