# Dougherty-Bliss–Galván–Polley–Shuster’s separable derangement asymptotic conjecture

Let $q_n$ be the proportion of separable permutations of length $n$ that are derangements. We prove
$$
q_n=\exp(-o(\sqrt{\log n})).
\tag{1}
$$
In particular, for every $\epsilon>0$, $n^\epsilon q_n\to\infty$. This refutes [Dougherty-Bliss–Galván–Polley–Shuster, *Enumerating separable derangements*, Conjecture 14](https://arxiv.org/html/2608.27583v1#S6), which requires an asymptotic equivalent with exponent $\alpha>3/2$. Their Schröder asymptotic would then give $q_n=\Theta(n^{3/2-\alpha})$, contradicting (1). The distinct Conjecture 15 is proved in [the companion note](../separable-derangements-limit/PROOF.md); the conclusions together say that $q_n$ goes to zero more slowly than any fixed inverse power. This does not identify the precise decay rate or address monotonicity.

We use the signed Schröder trees, critical Boltzmann tree law, independent spine records, convolution $\nu$ of the negative-step displacement, Fourier Green function $G$, and counts $Y_\pm(d)$ of the companion proof. In particular, if $s_n$ counts unsigned Schröder trees, then $s_n\sim c\rho^{-n}n^{-3/2}$, where $\rho=3-2\sqrt2$. A fixed spine record whose side trees have $L$ leaves has mass $\rho^L$ in the infinite model. The Green function satisfies $G(d)\sim c_G |d|^{-1/2}$ for $|d|\to\infty$, and $\mathbb E Y_\pm(d)\le C G(d)$. The proof below uses these unconditioned records in an exact count of finite trees, not a local-limit approximation at growing depth.

## 1. Occupation is little-o of its first moment

Write $h_\pm(d)=\Pr(Y_\pm(d)>0)$ in the Boltzmann law. Then $h_\pm(d)\le C G(d)$ and both tend to zero. The ordinary offspring probabilities are $p_0=\rho/S(\rho)$, $p_1=0$, $p_k=S(\rho)^{k-1}$ for $k\ge2$, with $\sum k p_k=1$. At a positive node, child occupation events at the desired displacement are independent. At a negative node, no two children can have a point at the same displacement (their possible-displacement intervals are disjoint). Thus exactly
$$
\begin{aligned}
h_+(d)&=p_0\delta_0(d)+h_-(d)-W(d),\\
h_-(d)&=p_0\delta_0(d)+(\nu*h_+)(d),\\
W(d)&=\sum_{k\ge2}p_k\big[k h_-(d)-1+(1-h_-(d))^k\big].
\end{aligned}
$$
These child-disjointness and occupation-recurrence principles also appear in the [Omega project](https://github.com/the-omega-institute/trureturing/issues/15063), in a binary canonical-decomposition parametrization. For $u\in[0,1]$, $0\le ku-1+(1-u)^k\le\binom{k}{2}u^2$, by Taylor’s formula; the $k=2$ term is $u^2$. Thus
$$
p_2 h_-(d)^2\le W(d)\le C h_-(d)^2\le \frac{C'}{1+|d|}.
\tag{2}
$$
By the explicit characteristic function and expansion in the companion proof, $\left|\widehat\nu(\theta)\right|\le \exp(-c\sqrt{|\theta|})$ near zero and its absolute value is bounded strictly below 1 away from zero. Fourier inversion yields
$$
\sup_d \nu^{*j}(d)\le C j^{-2}\qquad(j\ge1),
\tag{3}
$$
since $\int_0^\eta e^{-cj\sqrt{\theta}}d\theta=O(j^{-2})$. Because $h_+(d)\to0$, (3) gives $\nu^{*j}*h_+(d)\to0$ for each fixed $d$, by first restricting $h_+$ to a finite interval. Iterating $h_+=2p_0\delta_0+\nu*h_+-W$ and then taking the limit gives
$$
h_+=2p_0 G-G*W.
\tag{4}
$$
The nonnegative loss convolutions increase to a finite sum, because the iterated identity bounds them by $2p_0G+\nu^{*j}*h_+$ before taking the limit.

For each finite set of integers $E$, nonnegativity in (4) implies
$\sum_{e\in E} W(e) G(d-e)/G(d)\le2p_0$. Let $|d|\to\infty$, using the Green asymptotic for each fixed $e$, and then increase $E$. It follows that $W$ is summable with $\sum_e W(e)\le2p_0$. Moreover,
$$
\lim_{|d|\to\infty}\frac{(G*W)(d)}{G(d)}=\sum_e W(e).
\tag{5}
$$
Indeed, for $0<\eta<1/2$, the contribution from $|e-d|\le\eta|d|$ to the quotient is at most $C\sqrt\eta+o(1)$: (2) gives $W(e)\le C/|d|$ there, and $\sum_{|f|\le\eta|d|}G(f)=O(\sqrt{1+\eta|d|})$. On the complement, $G(d-e)/G(d)\le C\eta^{-1/2}$, so the tail of the summable $W$ is arbitrarily small for fixed $\eta$, and each bounded $e$ has quotient tending to 1. Finally let $\eta\downarrow0$.

If $\sum_e W(e)<2p_0$, then (4)–(5) give $h_+(d)\sim c_1 G(d)$ for some $c_1>0$. For $d\ne0$ the first occupation recurrence gives $h_-(d)\ge h_+(d)$, so (2) would force a divergent harmonic lower bound for $\sum W$. Therefore $\sum_e W(e)=2p_0$. Equations (4)–(5) show $h_+=o(G)$, and $h_-=h_++W$ off zero, with $W=O(G^2)$. We have proved
$$
h_\pm(d)=o((1+|d|)^{-1/2})\quad (|d|\to\infty),\qquad
\sum_{|d|\le n}h_+(d)=o(\sqrt n).
\tag{6}
$$

Let $S_j$ denote the cumulative displacement along $j$ independent negative spine steps in the ordinary infinite spine law. By (2) and the summability of $W$, $h_-\in\ell^2(\mathbb Z)$. Put $G_H(d)=\sum_{j=1}^{H}\nu^{*j}(d)$, so $0\le G_H\le G$ and $\sum_d G_H(d)=H$. On $|d|\le H^2$, (1) of the companion proof gives $\sum G_H(d)^2=O(\log(2+H))$. On $|d|>H^2$, $\sup G_H\le C/H$, so the squared sum there is at most $(C/H)\sum_dG_H(d)\le C$. Consequently $\|G_H\|_2=O(\sqrt{\log(2+H)})$. The contribution of any fixed finite set to $\sum_d G_H(d)h_-(-d)$ is bounded uniformly in $H$, while the remaining contribution is at most $\|G_H\|_2$ times the $\ell^2$ norm of the corresponding tail of $h_-$. Taking the finite set large gives
$$
\sum_{j=1}^{H}\mathbb E[h_-(-S_j)]=o(\sqrt{\log H}).
\tag{7}
$$

## 2. Small spine records with no early side hit

We will construct finite permutations with negative root sign. Index the negative levels along their largest-child path by $1,2,\ldots$, with a single positive level between consecutive negative levels. Fix
$$
J=\lfloor \delta\sqrt n\rfloor,\qquad
j_1\in\{J+1,\ldots,2J\},\qquad j_2\in\{3J+1,\ldots,4J\},
$$
where $\delta>0$ is a sufficiently small constant, independent of $n$. Choose a concrete pair $(j_1,j_2)$. The two negative levels with these indices will be specified separately. At all other levels before $j_2$, sample independent spine records with the ordinary infinite law. Call these the small records, including the positive level immediately before $j_2$. Each records all side trees with their shapes. Let $L$ be the total number of their side leaves.

At any ordinary spine step, its total side size $Q$ has $\Pr(Q>T)\le C/\sqrt T$ for $T\ge1$: condition on the arity and choose any one among its $k-1$ Boltzmann sizes to exceed $T/(k-1)$, then use the finite moment $\sum k p_k(k-1)^{3/2}$. Whenever $m$ nonnegative sizes have such a uniform tail bound, their sum exceeds $T$ with probability at most $C' m/\sqrt T$ (exclude individual sizes larger than $T$, then apply Markov’s inequality to the truncated sum). Independence is not needed for this latter bound.

Before $j_1$, the shifts at the positive levels are the partial sums $S_j$ of the ordinary negative increments; no previously specified macro-level affects them. Conditional on all negative small records, the probability that no chosen side tree at a given such positive level has a fixed point is
$$
P(d)=\sum_{k\ge2} k p_k(1-h_-(d))^{k-1},
$$
where $d=-S_j$ is the needed local displacement. This condition excludes hits in **all** off-spine children, not only one. Uniformly in $d$, $1-h_-(d)$ is at least a fixed positive constant: the singleton gives failure for $d\ne0$, and the two-leaf negative tree gives failure at $d=0$. The binary term therefore shows $P(d)\ge c_2>0$. Also $1-P(d)\le(\sum k(k-1)p_k)h_-(d)$, so $-\log P(d)\le C h_-(d)$.

By (7), the expected sum of $h_-(-S_j)$ over every pre-$j_1$ positive level is bounded by a sequence $H_n=o(\sqrt{\log n})$ independent of the chosen pair; for example take $H_n=1+\sum_{j=1}^{4J}\mathbb E h_-(-S_j)$. With probability at least $9/10$ over the negative small records, that sum is at most $10 H_n$. By the size bound above, decreasing $\delta$ if necessary, their total side size is at most $n/400$ with probability at least $9/10$. The intersection thus has probability at least $4/5$.

For each such negative history, the probability that all prescribed early positive-level side trees have no fixed point is at least $\exp(-C H_n)$, by conditional independence over positive records and the product of their $P(d)$ factors. Given these exclusions and the negative history, each early positive record has its old size tail increased by at most $1/c_2$, since the exclusion at every level depends only on that record and its known target. The positive records after $j_1$ are not conditioned for hits and retain the old bound. There are at most $4J$ positive records. By the same size bound, their total side size is at most $n/400$ with conditional probability at least $9/10$ if $\delta$ is sufficiently small. Thus the set of small histories having
$$
L\le n/200,\qquad
\text{no global fixed point in any early positive-level side tree}
\tag{8}
$$
has infinite spine probability at least $c_3 e^{-C H_n}$, uniformly in the pair $(j_1,j_2)$. The event in (8) uses only the small records. Later positive-level side trees will be made safe deterministically by the large shift from the first macro-level. For any complete eligible small history, write $S_0$ for the sum of its negative shifts, including both pre-$j_1$ and post-$j_1$ small records. Then $|S_0|\le L$; every pertinent partial sum of these shifts has the same bound.

## 3. Two large skew branchings

Complete a small history satisfying (8) to an $n$-leaf finite tree as follows.

* At level $j_1$, use a binary negative node whose left child is the continuing spine child, and whose right child is arbitrary of size $a$, an integer in $[n/8,n/6]$. This produces a shift $+a$ for the continuing child.
* At level $j_2$, the current subtree has $M=n-L-a$ leaves. Use a binary negative node with left child of size $M-t$ and right child of size $t$, where $t$ is an integer in $[12n/25,n/2]$. The left child is arbitrary. Require the right child, whose root sign is positive if internal, to have no point on displacement
$$
d(a,t)=n-L-t-2a-S_0.
\tag{9}
$$

For sufficiently large $n$, the continuing child at every nonterminal level is indeed the unique largest: its size is at least $M\ge(1-1/200-1/6)n$, greater than every side child including the first macro-child. At level $j_2$ the right child is larger than the left, since $M\le7n/8$ and $t\ge12n/25$. The possible displacement ranges show the entire permutation is a derangement:

* At negative small nodes a side child’s shift includes the continuing child’s size with one sign, minus at most $L$ of other side sizes. Its magnitude is at least $M-L$, while the absolute incoming shift is at most $a+L$, and the side child’s size is at most $L$. Thus it cannot meet the global fixed-point line. The side child at $j_1$ likewise has shift of magnitude at least $M$ and size $a$, while the incoming shift is at most $L$.
* Earlier positive side trees are safe by (8). Positive side trees after $j_1$ have incoming shift at least $a-L> L$ and size at most $L$, so cannot meet the line either.
* At $j_2$ the local target is $-a-S_0<0$. The smallest possible displacement in the left child viewed from this node is $t-(M-t)+1>0$, excluding that child. The shift of the right child is $-(M-t)$, so the target internal to it is $-(a+S_0)+(M-t)=d(a,t)$, which is excluded by construction.

For each fixed $t$, as $a$ varies in its interval, the integers $d(a,t)$ are distinct and in $[-n,n]$. Let $H_{t,+}(d)$ be the probability that a uniform $t$-leaf positive signed tree has a point on displacement $d$. In the positive Boltzmann law,
$$
h_+(d)=\sum_{m\ge1} \frac{\rho^m s_m}{S(\rho)}H_{m,+}(d).
$$
The weights of sizes $t\in[12n/25,n/2]$ are bounded below by $c_4 n^{-3/2}$. It follows from (6), uniformly in every eligible small history, that
$$
\sum_{a,t} H_{t,+}(d(a,t))
 \le \sum_t\sum_{|d|\le n} H_{t,+}(d)
 \le C n^{3/2}\sum_{|d|\le n} h_+(d)
 =o(n^2).
\tag{10}
$$
There are $\Theta(n^2)$ pairs $(a,t)$, so their sum of empty-line probabilities is $\Theta(n^2)$, bounded below by a positive constant times $n^2$ uniformly in the history.

For a fixed small history, the total number of completed trees for a given $(a,t)$ is $s_a s_{M-t}s_t[1-H_{t,+}(d(a,t))]$. The sizes of the three completed subtrees are all between fixed positive multiples of $n$. The Schröder count ratios therefore give
$$
\frac{s_a s_{M-t}s_t}{s_n}\ge c_5 \rho^L n^{-3}
$$
uniformly in the admissible ranges, since their sizes sum to $n-L$. By (10), summing the empty-line counts divided by $s_n$ over $a,t$ gives at least $c_6 \rho^L/n$ for each history. These completions are distinct: the tree’s largest-child path with its indicated levels recovers the small histories, its subtree sizes at the two indicated levels recover $a,t$, and the free completed shapes are subtrees of that tree.

Summing over eligible small histories, their proportional mass lower bound is $c_6/n$ times the ordinary spine probability in (8), since each history has mass exactly $\rho^L$ in the model used to select it. Thus for each pair $(j_1,j_2)$ the constructed proportion among negative-root trees is at least $c_7 n^{-1} e^{-C H_n}$. Different pairs produce disjoint subsets of finite trees. Indeed the marked levels are recoverable as the first and second negative levels on the actual largest-child path having an off-path subtree of size at least $n/8$: every other recorded side tree has size at most $L\le n/200$, the first marked size is $a\ge n/8$, and the second marked side size $M-t\ge(1-1/200-1/6-1/2)n>n/8$. There are $J^2=\Theta(n)$ pairs. Summing them and multiplying by $1/2$ for the uniform root-sign probability shows
$$
q_n\ge c_8 e^{-C H_n}=\exp(-o(\sqrt{\log n})).
$$
Together with $q_n\le1$, this proves (1).
