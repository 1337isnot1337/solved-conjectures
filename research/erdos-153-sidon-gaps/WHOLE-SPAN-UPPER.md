# Erdős–Sárközy–Sós conjecture: a polylogarithmic whole-span upper bound

Partial progress on [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783) and [Erdős Problem 153](https://www.erdosproblems.com/153). This is an upper bound on the exact integer quantity, not an upper bound restricted to the interior or a change of representation cap.

**Theorem.** For every sufficiently large integer $n$, there is an $n$-element Sidon set of integers of diameter $O(n^2)$ such that the mean squared gap of its **entire** sumset is $O(\log^2 n)$. In particular, if $F(n)$ denotes the minimum of this mean squared gap over $n$-element Sidon sets, then $F(n)=O(\log^2 n)$.

The proof uses the classical quadratic graph encoding, but changes the way carries are handled so adjacent covered regions meet without requiring duplicate residues. [Ruzsa (1996), §§2–4](https://matwbn.icm.edu.pl/ksiazki/aa/aa77/aa7744.pdf) uses quadratic encodings or randomized lifts for different maximum-gap and long-subinterval statements. His whole-interval maximum-gap argument does not give the present whole-span mean-square bound at size $\Theta(\sqrt{\operatorname{diam}})$. The existing near-minimal diameter lower bound [of Liu](https://leon2k2k2k.github.io/erdos153_corrected.pdf) likewise does not give this construction. Searches by the exact mean-square statistic, problem number and the classical construction located no matching whole-span polylogarithmic upper bound. No divergence or bounded-gap counterexample is claimed.

## Integer Sidon uniqueness with a parity guard

Choose an odd prime $n\le p<2n$; let $\lambda$ be uniform in $\mathbb F_p^\times$ and let $\delta_0,\ldots,\delta_{n-1}$ be independent uniform bits. For $0\le i<n$, set
\[
 \ell_i=[\lambda i^2]_p+p\delta_i,\qquad
 b_i=2pi+\ell_i,\qquad
 a_i=4b_i+(i\bmod 2).
\]
Here the bracket is the least nonnegative residue. The numbers $a_i$ are distinct and lie in $[0,O(pn)]$.

If $a_i+a_j=a_k+a_l$, the tag sums in $[0,2]$ agree separately from the multiples of four. In particular $t=i+j$ and $t'=k+l$ have the same parity and $b_i+b_j=b_k+b_l$. Since $0\le\ell_i+\ell_j\le4p-2$, equality in the latter equation gives $|t-t'|\le1$. Equal parity forces $t=t'$. Reducing the remaining equality modulo $p$ gives $i^2+j^2=k^2+l^2$, since $\lambda\ne0$. The sum and square sum determine the unordered pair in $\mathbb F_p$, hence in $[0,n)$. This includes diagonal sums. Thus $A=\{a_i\}$ is Sidon for **every** outcome. The parity guard is what permits the two low-digit blocks below to fill an entire high-digit row without leaving gaps between consecutive rows.

## Window bound in each low-digit block

For $0\le t\le2n-2$ use the unordered distinct pairs $i<j$, $i+j=t$. There are $m_t$ such pairs. For $1\le t\le2n-3$,
\[
 \tfrac12\min(t,2n-2-t)\ \le m_t\ \le 1+\tfrac12\min(t,2n-2-t).
\]
They are vertex-disjoint for a fixed $t$. Their values $i^2+j^2\bmod p$ are distinct, again by the sum-and-square-sum argument; write $H_t$ for their set. The two length-$p$ blocks of projected sums to use are
\[
 [2pt+p,2pt+2p),\qquad [2pt+2p,2pt+3p).
\]
In either block, each $v\in\lambda H_t$ has a candidate pair. If its least-residue low parts sum to $v+\epsilon p$, $\epsilon\in\{0,1\}$, then its lifted low total is $v+p(\epsilon+\delta_i+\delta_j)$. For block index 1 or 2 the required bit sum is in $\{0,1,2\}$. Therefore the chance of attaining that site's projection is at least $1/4$, independently across candidate pairs within the fixed block.

For a circular length-$h$ window $J$ in the low residues, put $Y=|\lambda H_t\cap J|$. Average over both $\lambda$ and the starting site of $J$. The random affine map of $\mathbb F_p$ sends two fixed distinct elements uniformly to two distinct residues, so
\[
 \mathbb E Y=\mu=m_t h/p,\qquad \operatorname{Var}Y\le\mu.
\]
Indeed the membership indicators for distinct elements are negatively correlated, since $h(h-1)/(p(p-1))\le(h/p)^2$. Conditional on $\lambda,J$, the chance of an empty lifted window by the candidate pairs is at most $(3/4)^Y$. Chebyshev at $Y=\mu/2$ and the exponential bound on the remaining event show
\[
 \Pr(\text{empty})\ll \min(1,\mu^{-1}).
\]
For each block, the expected number of empty **ordinary** windows of size $h$ is thus $O(p\min(1,p/(m_t h)))$, by bounding it with the count over all circular low-residue starting sites. Extra hits from other high-digit pairs can only help. Summing over $1\le h\le p$ gives
\[
 \sum_{h\le p}\mathbb E V_h
 \ll \frac{p^2}{m_t}(1+\log(1+m_t)).
 \tag{1}
\]

## Joining the rows and including the true edges

Choose $T=\lceil C\log p\rceil$ with a large absolute $C$. For $T\le t\le2n-2-T$, both blocks are nonempty simultaneously with probability $1-o(1)$: the probability that one whole block is empty is at most $(3/4)^{m_t}$ for every $\lambda$, and here $m_t\ge T/2$. Sum over the $O(n)$ blocks.

At the start and end of each such block insert its boundaries temporarily. For a finite collection of occupied integer sites including the two boundaries of a length-$p$ block, squared gap energy is $p+2\sum_h V_h'$, where $V_h'$ counts empty windows strictly between the boundaries. Thus the cost in expectation is at most $p+2\sum_h\mathbb E V_h$, with $V_h$ from (1). Over the full central run it is $O(p^2\log^2 p)$, since each size of $m_t$ recurs only $O(1)$ times and
\[
 \sum_{m=1}^p \frac{1+\log(1+m)}m=O(\log^2 p).
\]
By Markov and the simultaneous nonemptiness event, there is an outcome realizing that bound with no empty central block.

The two blocks for one $t$ meet, and their union ends where the first block for $t+1$ begins. Remove the artificial interior boundaries. Since each central block contains a genuine sum, each joined gap crosses at most one interior boundary (boundary hits only improve this); the square of the combined length is at most twice the sum of the squared pieces. Outside the central run, each of the two leftover edge pieces of the full projected sum span has length $O(pT)$, by the explicit range of the $b_i$'s. Regardless of its sum sites, the squared cost of gaps *clipped to that piece* is at most the square of its length. Cutting a gap at the two ends of the central interval and then joining the pieces multiplies the estimate by at most three. Consequently the true, entire projected sumset $B+B$, $B=\{b_i\}$, has squared gap cost $O(p^2\log^2 p)$.

Finally choose one tagged sum $4s+d_s$, $d_s\in[0,2]$, over each distinct projected sum $s$. They have the same ordering as the projected sums, and each successive gap is at most six times the corresponding projected gap, since the latter is at least 1. Including the other tagged sums only splits gaps, except for possible extensions of length at most 2 at the two extremes. Thus the cost of $A+A$ is also $O(p^2\log^2 p)$. As $A$ is Sidon and $p\asymp n$, there are exactly $n(n+1)/2$ sums; dividing proves the theorem. Translation makes the set positive if needed.
