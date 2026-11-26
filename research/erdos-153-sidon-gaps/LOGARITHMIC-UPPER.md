# Erdős–Sárközy–Sós conjecture: a logarithmic whole-span upper bound

Partial progress for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783) and [Erdős 153](https://www.erdosproblems.com/153). This strengthens the [single-source polylogarithmic construction](WHOLE-SPAN-UPPER.md). It uses independent affine statistics from two adjacent source rows and an exponential tail estimate for their missing boundary rows.

**Theorem.** For every sufficiently large integer $n$, there is an $n$-point integer Sidon set $A$ of diameter $O(n^2)$ whose entire sumset, with sums $s_1<\cdots<s_{n(n+1)/2}$, satisfies
\[
 \frac{1}{|A+A|}\sum_i(s_{i+1}-s_i)^2=O(\log n).
\]
This does not settle whether the minimum tends to infinity. It includes both physical edges, unlike the [bounded-cost interior theorem](RUZSA-INTEGER-INTERIOR.md). Ruzsa's [1996 paper](https://matwbn.icm.edu.pl/ksiazki/aa/aa77/aa7744.pdf) is the precedent for the polynomial encoding and lift ideas, but its results control a maximum gap, either over the whole interval at a power scale or on only a long interior portion. [Liu's lower bound](https://leon2k2k2k.github.io/erdos153_corrected.pdf) is about asymptotically maximum Sidon sets, not all Sidon sets. Searches by the exact problem and gap statistic uncovered no prior matching whole-span logarithmic upper bound.

## Encoding and two-source coverage

Choose a prime $4n<p<8n$ and independent uniform field coefficients $\lambda,\mu,\eta,\nu\in\mathbb F_p$. Let $G$ be the event that $c_t=2\lambda+3\mu t\ne0$ for each integer $0\le t\le2n-2$. For $\mu\ne0$ at most $2n-1$ values of $\lambda$ are excluded, and for $\mu=0$ only $\lambda=0$ is excluded. In particular $\Pr(G)\ge1/2$. We use the conditional law given $G$, and independent uniform digits $\delta_i\in\{0,1,2\}$, $0\le i<n$. Set
\[
 Q(i)=\lambda i^2+\mu i^3+\eta i+\nu,\qquad
 \ell_i=[Q(i)]_p+p\delta_i,\qquad
 b_i=2pi+\ell_i,\qquad a_i=8b_i+(i\bmod3).
\]
As $0\le\ell_i\le3p-1$, the $a_i$'s lie in an interval of length $O(pn)$. Equality of two tagged pair sums first gives equality of their $b$-sums and of their tag sums (each tag sum is at most four). The two index totals are therefore congruent modulo 3, and the range of the low-digit pair sums forces their difference in absolute value to be at most two. They are equal; call this total $t$. In the field,
\[
 Q(i)+Q(j)=d_t-c_t\,ij,\qquad
 d_t=\lambda t^2+\mu t^3+\eta t+2\nu
 \quad(i+j=t).
\]
Equality modulo $p$ of the low-digit pair sums, with $c_t\ne0$, now gives equality of the index products. The unordered pair is determined by its sum and product in the field and hence in $[0,n)$. This argument includes repetitions; in particular using the sums $2a_i$ shows the $a_i$'s are distinct. The set of $a_i$'s is Sidon for every outcome satisfying $G$.

For each source $s=i+j$, the unordered off-diagonal pairs are vertex-disjoint and give distinct values of $ij$ in the field. Write $H_s$ for these products, and $m_s=|H_s|$. If $1\le s\le 2n-3$ then $m_s\ge \frac12\min(s,2n-2-s)$, by reflecting the indices at $n-1$ for the second half. For physical row $t$ use the two blocks
\[
 [2pt+p,2pt+2p),\qquad [2pt+2p,2pt+3p).
\]
Both source $s=t$ and source $s=t-1$ can hit each block: their required low block indices are $1,2$ and $3,4$, respectively. If a candidate pair has low residue $v$, the least-residue low parts sum to $v+\epsilon p$ for $\epsilon=0$ or 1. To place it at the corresponding site, the lift sum $\delta_i+\delta_j$ must be the required index minus $\epsilon$, always in $[0,4]$. The success probability is at least $1/9$. Inside any fixed source the success events for distinct pairs are independent. We do not need independence of the lift digits **between** sources.

## Void bound with two independent affine maps

For a low-residue interval $J$ of length $h$, define $Y_s$ to count the products $u\in H_s$ for which $d_s-c_su\in J$. In the **unconditional** coefficient law, for the two distinct sources $s=t,t-1$, the pairs $(c_s,d_s)$ are independent uniform elements of $\mathbb F_p^2$. In fact $(\lambda,\mu)$ maps bijectively to the two slopes, and, once these are fixed, $(\eta,\nu)$ maps bijectively to the two intercepts. The two determinants are nonzero because the source indices differ by 1 and $p>3$.

With $c_s\ne0$ the affine map is uniform over all nonconstant affine maps. Thus the same two-point calculation as in the [single-source argument](WHOLE-SPAN-UPPER.md) gives mean $\theta_s=m_s h/p$ and variance at most $\theta_s$. In the unconditional law,
\[
 \Pr(Y_s<\theta_s/2)\ll \min(1,\theta_s^{-1});
\]
the exceptional slope zero costs at most $1/p$, which is absorbed since $\theta_s\le p$. Put $m=\min(m_t,m_{t-1})$, $\theta=mh/p$. By independence in the unconditional law and $\Pr(G)\ge1/2$, given $G$ the probability that **both** sources have fewer than $\theta/2$ candidates is $O(\min(1,\theta^{-2}))$. Otherwise, use the more populated source: its distinct candidates come from disjoint pairs, and, conditional on all coefficients, its probability of missing the window is at most $\exp(-c\theta)$. It follows that a specified ordinary window of $h$ sites in either block has probability of being empty
\[
 O\left(\min\left(1,\left(\frac{p}{mh}\right)^2\right)\right).
 \tag{1}
\]
This remains true in the presence of all other sums, which only add hits.

There are at most $p$ starting sites for length $h$ in a block. For $m\ge1$, summing (1) over $h\le p$ costs $O(p^2/m)$: split at $h=p/m$ and sum the $h^{-2}$ tail. Include the artificial block endpoints. The expected squared energy of gaps internal to that block, plus the boundary pieces, is $O(p+p^2/m)$ by the usual empty-window identity $E=p+2\sum_hV_h$, where $V_h$ counts empty windows strictly between the inserted endpoints.

## Removing the inserted boundaries and treating both real edges

Consider the consecutive physical rows $2\le t\le2n-3$, and set their depth to $d(t)=\min(t-1,2n-2-t)\ge1$. The two source counts satisfy $m\gg d(t)$, and each depth occurs at most twice. Summing the expected block costs over these rows gives $O(p^2\log n)$.

Define the random variable $D$ to be the largest depth of a row having at least one of its two blocks wholly empty, or zero if there is none. For an individual block, use all distinct pairs of one source. Regardless of the allowed coefficients, the probability that the block is empty is at most $(8/9)^m\ll e^{-c d(t)}$. A union bound over depths gives $\Pr(D\ge j)\ll e^{-c j}$, and in particular $\mathbb E(D+1)^2=O(1)$.

The two blocks of each row meet, and they meet those of the next row without any missing interval. The consecutive middle run with depth greater than $D$ contains a genuine sum in each of its blocks. Removing its interior artificial boundaries joins at most two pieces per crossing gap and costs at most twice their squared costs. The two outside pieces of the true $B+B$ span, $B=\{b_i\}$, have lengths $O(p(D+1))$, by the explicit placement and whole range of the $b_i$'s. Their squared gap pieces cost at most the squares of those lengths. If the middle run is empty, the whole span itself has length $O(p(D+1))$ and the same assertion holds. At the two retained cuts, joining at most three pieces multiplies the sum of squared lengths by at most three. Taking expectations, the actual entire projected sumset has gap cost $O(p^2\log n)$. There is thus an allowed realization with this cost.

Choose one tagged sum $8s+e_s$, $0\le e_s\le4$, over each distinct projected sum $s$. Its successive gaps are at most twelve times the projected gaps. The other tagged sums only split gaps or extend each extreme by at most four. The whole integer $A+A$ cost is still $O(p^2\log n)$. It has exactly $n(n+1)/2$ sites and $p\asymp n$. Dividing proves the claim.
