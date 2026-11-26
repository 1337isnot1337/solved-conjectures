# Erdős–Sárközy–Sós conjecture

## Whole-span integer upper bound

**Proposition.** For every sufficiently large integer $n$ there is an integer Sidon set $A$ of size $n$ and diameter $O(n^2)$ whose distinct unordered sums, including diagonals, have mean squared consecutive gap $O(\log n)$. This is an upper bound for the quantity in [Erdős Problem 153](https://www.erdosproblems.com/153), not a resolution of its divergence question. Both real endpoints are included.

### Construction and uniqueness

Choose a prime $4n<p<8n$. Sample independent uniform coefficients $\lambda,\mu,\eta,\nu$ in $\mathbb F_p$, conditioned on the event $G$ that $c_s=2\lambda+3\mu s\ne0$ for every $s=0,\ldots,2n-2$. For any $\mu$, at most $2n-1$ values of $\lambda$ are forbidden, so $\Pr(G)>1/2$. Set $q(i)=\lambda i^2+\mu i^3+\eta i+\nu$ and, independently of the coefficients, choose independent uniform $\delta_i\in\{0,1,2\}$ for $0\le i<n$. With $[x]_p$ denoting the least nonnegative representative, define
\[
 b_i=2pi+[q(i)]_p+p\delta_i,\qquad a_i=8b_i+(i\bmod3).
\]
The $a_i$ are distinct: equality first gives equality modulo 3 of the indices, and then equality of the $b_i$ bounds the index distance by 1. The diameter is $O(pn)$.

Equality of two $a$-sums gives equality of their $b$-sums and of their sums of tags, since the tag sum is in $[0,4]$. In particular the index totals are equal modulo 3. The low-digit sum is in $[0,6p-2]$, so equality of the $b$-sums bounds the index-total difference by 2. Their index totals are therefore the same integer $s$. Over $\mathbb F_p$,
\[
 q(i)+q(j)=d_s-c_sij,\quad
 d_s=\lambda s^2+\mu s^3+\eta s+2\nu.
\]
As $c_s\ne0$, equality modulo $p$ determines the product $ij$. Sum and product determine the unordered pair over $\mathbb F_p$, and the indices lie in $[0,n-1]$. This proves Sidon uniqueness, including diagonal pairs.

### Void estimate with two source rows

Work first with the distinct sites of $B+B$, where $B=\{b_i\}$ (multiplicity does not matter). For every integer $2\le t\le2n-3$ use the consecutive blocks
\[
 [2pt+p,2pt+2p),\qquad [2pt+2p,2pt+3p)
\]
of integer sites. These blocks tile one contiguous interval. Each block can receive sums from both source totals $s=t$ and $s=t-1$. Relative to $2ps$, its block index is respectively $1$ or $2$ for the first source and $3$ or $4$ for the second. For a pair with $i+j=s$, the sum $[q(i)]_p+[q(j)]_p$ has natural carry $\epsilon\in\{0,1\}$. If its residue lies in a specified window in the block, it hits the window when $\delta_i+\delta_j$ equals the block index minus $\epsilon$. This required value is in $\{0,1,2,3,4\}$, and for $i\ne j$ the hit probability is at least $1/9$.

Let $H_s$ be the products $ij$ of off-diagonal pairs with total $s$, and $m_s=|H_s|$. The pairs have disjoint vertices within a source total, and their products are distinct by the sum-and-product argument. For a window of $h$ consecutive sites with residue set $J$ define
\[
 Y_s=|\{u\in H_s:d_s-c_su\in J\}|,\qquad \theta_s=m_sh/p.
\]
Before conditioning, the two vectors $(c_t,d_t)$, $(c_{t-1},d_{t-1})$ are independent and uniform in $\mathbb F_p^2$. In fact $(\lambda,\mu)$ gives the two slopes by an invertible linear map. Once they are fixed, $(\eta,\nu)$ gives the two intercepts by an invertible affine map. Conditional on $c_s\ne0$, the affine map on the products is uniformly two-transitive, so $\mathbb E Y_s=\theta_s$ and $\operatorname{Var}Y_s\le\theta_s$. Including the zero-slope event of probability $1/p$, Chebyshev gives
\[
 \Pr(Y_s<\theta_s/2)\ll \min(1,\theta_s^{-1}).
\]
Write $m=\min(m_t,m_{t-1})$ and $\theta=mh/p$. By the unconditional independence, the probability that both counts are less than $\theta/2$ is $O(\min(1,\theta^{-2}))$, and dividing by $\Pr(G)>1/2$ retains this estimate under $G$. Otherwise choose one source with at least $\theta/2$ candidates. Its candidate pairs use disjoint digits, so the conditional no-hit probability is at most $\exp(-\theta/18)$. No independence of the digits across source totals is asserted or needed. The resulting window void bound is
\[
 \Pr(J\text{ contains no occupied site}\mid G)
 \ll \min(1,(p/(mh))^2).
\]
Here $m\ge1$ in the specified range of $t$.

### Energy and the two real ends

Insert both endpoint cuts of each block (using the left endpoint and the first site after the block). A clipped integer gap of length $d$ contains a run of $d-1$ empty interior sites and contributes $d(d-1)/2$ nonempty windows in that run. Consequently the expected sum of squared clipped gaps per block is bounded by
\[
 p+2p\sum_{h=1}^{p}O(\min(1,(p/(mh))^2))=O(p+p^2/m).
\]
Put $d(t)=\min(t-1,2n-2-t)$. Counting the off-diagonal pairs gives $m\ge d(t)/2$: their number at a total $s$ is $\lceil(\min(s,2n-2-s))/2\rceil$. Thus the expected total clipped block energy is $O(p^2\log n)$.

For a full $p$-site block, every off-diagonal source pair has a candidate residue. Using just one source, the empty block probability is at most $(8/9)^m$, uniformly in the coefficients in $G$. Let $D$ be the greatest $d(t)$ of an empty block, or zero if none is empty. There are at most four blocks per depth, so $\Pr(D\ge j)\ll e^{-c j}$ and $\mathbb E(D+1)^2=O(1)$. In the contiguous middle run of blocks with $d(t)>D$, all blocks are nonempty, and merging the artificial cuts inside that run costs a factor at most two in squared-gap energy. The leftover pieces between the run and the two ends of the real span each have length $O(p(D+1))$. If there is no middle run, the entire span has this bound. More explicitly one can use the containing segment $[0,4p(n-1)+6p]$, where both the real span and all tiled blocks lie. The cuts at the middle-run endpoints split any gap into at most three parts. It follows that the expected whole-span squared-gap energy of $B+B$ is $O(p^2\log n)$.

Select one tagged representative $8x+k_x$, $0\le k_x\le4$, for each distinct base sum $x\in B+B$. These representatives remain ordered; each gap of length $d\ge1$ grows to at most $8d+4\le12d$. All remaining tagged sums insert extra points between representatives or extend the two outer ends by at most 4 each. Inserting points within a span cannot increase the squared-gap energy. Therefore the expected whole-span energy of $A+A$ is $O(p^2\log n)$. Some realization has at most that energy. Dividing by $n(n+1)/2$ completes the proof.

The two adjacent source totals replace the single $1/h$ void bound in [the previous construction](WHOLE-SPAN-UPPER.md) by a summable $1/h^2$ tail. The use of the unconditional coefficient distribution before bounding the effect of $G$ is essential: independence after conditioning on all slopes being nonzero is not needed or assumed.
