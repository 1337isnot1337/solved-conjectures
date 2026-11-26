# Dougherty-Bliss–Galván–Polley–Shuster’s separable derangement conjecture

The proportion of separable permutations of length $n$ that are derangements tends to zero. This proves [Dougherty-Bliss–Galván–Polley–Shuster, *Enumerating separable derangements*, Conjecture 15](https://arxiv.org/html/2608.27583v1#S7) and answers [Vatter, Question 4.5](https://arxiv.org/html/2602.16355v3#S4). The separate asymptotic-equivalent Conjecture 14 is addressed by [a companion result](../separable-derangements-asymptotic/PROOF.md); neither argument identifies the precise decay rate.

The authors’ earlier diagonal recurrences motivate working with the displacement of a point. Their prior bounds do not give a vanishing derangement proportion. The [Omega Institute’s October 2026 occupation project](https://github.com/the-omega-institute/trureturing/issues/15063) preregistered the Boltzmann occupation bound established here, developed an occupied-event comparison equation, and noted the disjoint displacement intervals at skew nodes; it reports both that lower bound and the full limit open. We use point counts and their first two moments rather than a nonlinear subsolution. For related endpoint limits see [Pinsky, *The Infinite Limit of Separable Permutations*](https://arxiv.org/abs/1911.05565); here we prove directly the finite-spine convergence needed, retaining all absolute displacement increments.

## 1. Trees and the finite-spine limit

A separable permutation (one avoiding 2413 and 3142) is represented by a rooted ordered Schröder tree: internal nodes have at least two children, and all internal nodes carry signs alternating along internal edges. A positive node forms the direct sum of the permutations of its children in order, and a negative node their skew sum. A leaf represents the one-letter permutation. This standard bijection (see [Bassino et al., *The Brownian limit of separable permutations*, §2](https://arxiv.org/abs/1602.04960)) follows from the unique maximal direct- or skew-sum decomposition. For $n\ge2$ there are two choices of root sign for each unsigned shape, and the sign is independent of the uniform shape. Let $s_n$ count unsigned shapes with $n$ leaves and let
```math
S(x)=\sum_{n\ge1}s_n x^n=x+\frac{S(x)^2}{1-S(x)}
   =\frac{1+x-\sqrt{1-6x+x^2}}4 .
```
Write $\rho=3-2\sqrt2$, $s=S(\rho)=1-1/\sqrt2$. The usual square-root coefficient asymptotic, or the cited Schröder asymptotic (the factor 2 for root signs has no effect), gives $s_n\sim c\rho^{-n}n^{-3/2}$ with $c>0$.

Give each finite unsigned tree $T$ the critical Boltzmann probability $\rho^{|T|}/s$, where $|T|$ counts leaves. The law is that of an ordered Galton–Watson tree with offspring probabilities
```math
p_0=\rho/s,\qquad p_1=0,\qquad p_k=s^{k-1}\quad(k\ge2).
```
Indeed $S(\rho)=s$ normalizes the tree probabilities; conditioning on $k\ge2$ children factors their laws as independent Boltzmann trees. Also $\sum k p_k=1$, by $(1-s)^2=1/2$. The total leaf count $N$ satisfies $\Pr(N\ge m)=O(m^{-1/2})$.

In an $n$-leaf uniform tree, follow the child with the most leaves at each step, resolving ties by first position. At any fixed depth $h$, record at each step the number $k$ of children, the selected index $i$, and the complete finite shapes of the other $k-1$ children. For any fixed specified $h$-step record with $L$ leaves in all listed side trees, it has probability $s_{n-L}/s_n$ for all sufficiently large $n$: the deepest selected subtree has $n-L$ leaves, so every specified selected child is indeed the unique largest. The probability tends to $\rho^L$.

This is exactly the probability of the same record in the infinite spine law in which, independently at each spine vertex, the pair $(k,i)$, $k\ge2$, $1\le i\le k$, has probability $p_k$, and the other $k-1$ children are independent Boltzmann trees. Each step's weight is $p_k\prod_{j\ne i}(\rho^{|T_j|}/s)=\rho^{\sum_{j\ne i}|T_j|}$. The limiting probabilities sum to one, since $\sum k p_k=1$. Atomwise convergence on this countable record space therefore gives convergence of probabilities for every event depending on a fixed number of such steps (first restrict to a finite set of records of limiting mass at least $1-\epsilon$). Records with fewer than $h$ steps, if present, have mass tending to zero. The alternating signs on the spine are determined by the root sign and do not affect this convergence.

## 2. Displacement and the spine Green function

Use displacement $d=\text{value}-\text{position}$. At a direct sum the child displacement shift is zero for all children. At a skew sum with child leaf counts $N_1,\ldots,N_k$, the shift for child $i$ is
```math
D_i=\sum_{j>i}N_j-\sum_{j\lt i}N_j.
```
At a negative spine step, the shift $J$ has a symmetric probability distribution $\nu$: choose $(k,i)$ with the spine law above and form the signed sums of $k-1$ independent Boltzmann leaf counts. The increments at successive negative spine vertices are independent. The leaf-count tail and a union bound conditional on $k$ give
```math
\Pr(|J|>b)=O(b^{-1/2}),\qquad b\ge1,
```
as $\sum k p_k(k-1)^{3/2}<\infty$.

Let $q(\theta)=S(\rho e^{i\theta})$. The characteristic function is
```math
\widehat{\nu}(\theta)
 =\sum_{\ell,r\ge0,\;\ell+r\ge1}\overline{q(\theta)}^{\ell}q(\theta)^r
 =\frac1{|1-q(\theta)|^2}-1.
```
The first equality sets $\ell=i-1,r=k-i$; each Boltzmann sibling contributes $q(\theta)/s$ or its conjugate, and the factor $p_k=s^{k-1}$ cancels the denominators. The support contains all positive and negative integers, already from the binary spine choices. Thus $|\widehat\nu(\theta)|<1$ on $`[-\pi,\pi]\setminus\{0\}`$.

Let $G(d)=\sum_{j\ge0}\nu^{*j}(d)$, with $\nu^{*0}=\delta_0$. We show
```math
G(d)\asymp (1+|d|)^{-1/2}. \tag{1}
```
The discriminant of $S(\rho e^{i\theta})$ factors as $(1-e^{i\theta})(1-\rho^2e^{i\theta})$. For $\theta\downarrow0$,
```math
q(\theta)=s-c_0 e^{-i\pi/4}\sqrt\theta+O(\theta),\qquad c_0=\frac{\sqrt{1-\rho^2}}4>0.
```
It is analytic in $\sqrt{\theta}$ on this side of zero. As $1-s=1/\sqrt2$, the modulus square is $1/2+c_0\sqrt\theta+O(\theta)$, hence $1-\widehat\nu(\theta)=4c_0\sqrt{\theta}+O(\theta)$. The same holds with $|\theta|$ on the other side. In the Fourier inverse for $G$, dominated convergence applies: the finite geometric sums are bounded in absolute value by $2/(1-\widehat\nu)$, which is integrable on the circle. Thus $G(d)$ is the $d$-th Fourier coefficient of $1/(1-\widehat\nu)$.

For its asymptotic, subtract $(4c_0)^{-1}\eta(\theta)|\theta|^{-1/2}$ with $\eta$ a smooth even cutoff equal to 1 near zero. The residual has a common constant term from both sides and derivative $O(|\theta|^{-1/2})$ by the convergent Puiseux expansions; away from zero it is smooth. It is absolutely continuous with integrable derivative, so its nonzero Fourier coefficients are $O(|d|^{-1})$. The leading part has coefficient $(4c_0\sqrt{2\pi})^{-1}|d|^{-1/2}+O(|d|^{-1})$: extend the cutoff cosine integral to the uncut integral on $(0,\infty)$ and rescale by $|d|$, using $`\int_0^\infty t^{-1/2}\cos t\,dt=\sqrt{\pi/2}`$. The cutoff difference is $O(|d|^{-1})$ by integration by parts, since $(1-\eta(\theta))\theta^{-1/2}$ vanishes near zero, tends to zero at infinity, and has integrable derivative there. This gives (1), with a positive lower bound at each fixed integer because $G(0)\ge1$ and $\nu(d)>0$ for $d\ne0$.

## 3. A Boltzmann tree has enough chance of a diagonal hit

In an ordinary Boltzmann tree starting with root sign $+$ or $-$, let $Y_\pm(d)$ count leaves on displacement $d$ in its permutation; a leaf at the root gives one point at displacement zero for either sign. Write $m_\pm(d)=\mathbb E Y_\pm(d)$. Sum the expected leaf contributions over depths. At an internal node with $k$ children, summing over the choice $i$ of the next child weights the pair $(k,i)$ by $p_k$, precisely the spine law. For a fixed choice the selected subtree is independent of the sibling sizes. Each positive step gives the zero shift, each negative step gives convolution by $\nu$, and the terminal leaf event contributes $p_0\delta_0$. In a tree starting with $+$, depths $2j,2j+1$ give the same convolution $\nu^{*j}$. In a tree starting with $-$, depth zero appears once and every positive power appears twice. By nonnegative summation,
```math
m_+(d)=2p_0G(d),\qquad m_-(d)=2p_0G(d)-p_0\delta_0(d). \tag{2}
```

Next consider ordered pairs of distinct leaves on that same displacement. Their lowest common ancestor cannot be negative. Indeed the potential displacements in child $i$ are contained in $[D_i-N_i+1,D_i+N_i-1]$. These intervals are disjoint for different $i$; for consecutive children, the relevant endpoints differ by two, using $D_i-D_{i+1}=N_i+N_{i+1}$. At a positive lowest common ancestor the child shifts are all zero and its different subtrees are independent. For a given target local displacement $e$, the expected contribution of such ordered pairs is $b_2 m_-(e)^2$, where $b_2=\sum_k k(k-1)p_k<\infty$. Summing by depth of the ancestor as in the first moment gives
```math
\begin{aligned}
\mathbb E[Y_+(d)(Y_+(d)-1)]&=b_2(G*m_-^2)(d),
\\ \mathbb E[Y_-(d)(Y_-(d)-1)]&=b_2((G-\delta_0)*m_-^2)(d).
\end{aligned} \tag{3}
```
The identities count each pair once by its lowest common ancestor and use only nonnegative sums; they do not assume finite moments before computing them.

Equations (1)–(3) show
```math
\mathbb E Y_-(d)^2\le C\frac{\log(2+|d|)}{\sqrt{1+|d|}}.
```
Specifically, the convolution is bounded by a constant times $\sum_e (1+|d-e|)^{-1/2}(1+|e|)^{-1}$. For $|e|\le |d|/2$, sum the harmonic second factor and bound the first by $C(1+|d|)^{-1/2}$. For $|d|/2<|e|\le3|d|$, sum the first factor on an interval of length $O(1+|d|)$ and bound the second by $C/(1+|d|)$. On the remaining tail sum $C(1+|e|)^{-3/2}$; $d=0$ is covered directly. Cauchy–Schwarz and the matching lower bound on the first moment give
```math
h(d):=\Pr(Y_-(d)>0)\ge\frac{c_1}{\sqrt{1+|d|}\log(2+|d|)}\qquad(d\in\mathbb Z). \tag{4}
```
The negative-root Boltzmann tree is exactly the normalized Boltzmann law on sum-indecomposable separable permutations with the singleton included, so (4) also establishes the lower bound preregistered in the Omega project. Its normalization $2/(1-(\sqrt2-1))$ equals $1/s$.

## 4. Almost-sure hit along the spine

Let $S_j=J_1+\cdots+J_j$ for the iid negative increments. Along the positive spine vertices the displacement shifts from the root run through $S_j$, starting at $j=0$ or $j=1$ depending on the root sign. Each such vertex has at least one side child since $k\ge2$; take the first side child in its order. This subtree is independently Boltzmann, rooted with negative sign if not a leaf, conditional on all the negative spine increments. The chosen positive-step side trees are mutually independent. The side child’s index depends only on the positive step’s $(k,i)$, independent of its children’s Boltzmann trees. At a positive node the displacement does not shift between its children. The chance of a global fixed point in this child, conditional on the walk, is therefore $h(-S_j)$.

Let $g(d)=[\sqrt{1+|d|}\log(2+|d|)]^{-1}$. We claim $\sum_{j\ge2}g(S_j)=\infty$ almost surely. The tail bound on a step gives $`\mathbb E[|J|1_{\{|J|\le T\}}]\le C\sqrt T`$. A union bound for any step exceeding $T=Aj^2$ and Markov’s inequality for the remaining sum of absolute values give $\Pr(|S_j|>Aj^2)\le C/\sqrt A$. Fix $A$ large enough that this is at most $1/2$ for every $j$. Put $a_j=1/(j\log j)$, $`W_n=\sum_{j=2}^n a_j1_{\{|S_j|\le Aj^2\}}`$ and $A_n=\sum_{j=2}^n a_j$. Then $0\le W_n\le A_n$, $\mathbb E W_n\ge A_n/2$, and hence $\Pr(W_n\ge A_n/4)\ge1/3$. Since $A_n\to\infty$ and $W_n$ is increasing, $\Pr(W_\infty=\infty)\ge1/3$. On the selected times $g(S_j)\ge c_A a_j$, proving divergence with positive probability. Finally, for every fixed integer shift $q$, $g(d+q)\asymp_q g(d)$ uniformly in $d$. Removing any finite number of initial steps and translating the rest to the origin does not affect divergence. It is a tail event of the independent increments and has probability one by Kolmogorov’s zero–one law.

By (4), $\sum_j h(-S_j)=\infty$ almost surely, so the conditional probability that all chosen side children fail to give a global fixed point is $\prod_j(1-h(-S_j))=0$. In the limiting infinite spine, a fixed point thus occurs in a finite side subtree at a finite positive spine depth almost surely. This holds for each root sign separately.

For a fixed depth $H$, occurrence by depth $H$ is determined entirely by the first $H$ spine records, including their finite side trees. In the finite permutation these same records determine exact shifts, not just scaled locations: negative shifts of selected spine children are differences of the recorded sibling sizes, and all shifts at positive vertices to their children are zero. The probability of the event for a uniform $n$-leaf tree tends to the corresponding infinite probability by §1. In particular the limit inferior of the probability of a fixed point in the uniform separable permutation is at least this probability for every $H$. Increasing $H$ makes that lower bound tend to one, proving the claimed limit.

The same argument yields a stronger qualitative conclusion. For every fixed displacement $d$, one has $g(d-S_j)\asymp_d g(S_j)$, so conditional independence and the second Borel–Cantelli lemma give hits at displacement $d$ in infinitely many distinct selected side subtrees in the limiting spine. For each fixed $M$, finitely many levels contain at least $M$ such hits with probability as close to one as desired. Transferring that event as above shows the number of points on displacement $d$ in a uniform separable permutation tends to infinity in probability. In particular this holds for the number of fixed points, and a union bound gives the same conclusion simultaneously for any fixed finite list of displacements.
