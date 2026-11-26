# Erdős–Sárközy–Sós conjecture: obstruction to modular extensions

Partial result for [#783](https://github.com/1337isnot1337/solved-conjectures/issues/783). The target is the mean-square gap question [Erdős 153](https://www.erdosproblems.com/153), [Erdős–Sárközy–Sós (1994), p. 345](https://real.mtak.hu/110604/1/1-s2.0-S0022314X84710407-main.pdf#page=17). The difference-set extension framework is a separate topic; see [Alexeev–Mixon, *Forbidden Sidon subsets of perfect difference sets*](https://arxiv.org/abs/2510.19804). That paper disproves the assertion that every finite Sidon set extends to a finite perfect difference set. Neither that theorem nor this note resolves Erdős 153. The result here rules out constructing a counterexample by taking arbitrary positive-density subsets of classical difference sets and choosing arbitrary integer lifts, and more generally places an order-of-growth requirement on any perfect difference set into which a bounded-gap family can embed.

## A one-sided discrepancy criterion

Use $Q(A)$ for the mean squared consecutive gap of the integer sumset $A+A$, with the normalization $t^{-1}$ for $t=|A+A|$. Let $A$ be an integer Sidon set of size $n\ge 2$. Suppose its residue map to $\mathbb Z/M\mathbb Z$ is injective and its image lies in a set $C$ such that $M\ge n^2/2$. Assume that every cyclic interval $J$ satisfies
\[
 |C\cap J|\le K|J|/n+E,
\]
where $K\ge1$ and $E\ge0$. Then with an absolute constant $c>0$,
\[
 Q(A)\ge \frac{c}{K^2}\log_+\!\left(\frac{n}{32(1+E)}\right),\qquad
 \log_+(z)=\max(0,\log z).
 \tag{1}
\]
Only arcs of length at most $n^2/8+1$ at the residue of the minimum are actually used.

**Proof.** Translate $\min A$ to zero and translate $C$ accordingly. Put $D=\max A$. The $n(n-1)/2$ distinct positive differences give $D\ge n(n-1)/2\ge n^2/4$, so all intervals below lie inside the sum span $[0,2D]$. Take a dyadic value $L$ in the range $n(1+E)\le L\le n^2/16$. The interval $[0,2L]$ maps bijectively onto its cyclic image, since it contains at most $2L+1<M$ integers whenever that range is nonempty. Therefore
\[
 m_L=|A\cap[0,2L]|\le K(2L+1)/n+E\le 4K L/n.
\]
Each sum in $[L,2L]$ uses two points in $[0,2L]$. There are at most $m_L(m_L+1)/2$ of them. Clip the gaps of $A+A$ to $[L,2L]$. The clips have total length $L$ and number at most $m_L(m_L+1)/2+1$. Cauchy–Schwarz bounds their squared lengths below by $L^2/(m_L(m_L+1)/2+1)\ge n^2/(13K^2)$, because $K L/n\ge1$. Dyadic windows have disjoint interiors. When several split the same original gap, the sum of squared clip lengths is at most the square of the original length. Divide the accumulated lower bound by $t=n(n+1)/2\le n^2$. The number of dyadic values between the endpoints is at least $\log_2(n/(32(1+E)))$ whenever that expression is positive. This proves (1). $\square$

## Cyclic perfect difference sets

Let $C$ be a cyclic perfect difference set of size $k$, so $M=k(k-1)+1$. This means every nonzero residue is one ordered difference of points of $C$. If $A$ injects into $C$ by reduction modulo $M$, then $k\ge n$ and
\[
 Q(A)\ \gg\ \log_+\!\left(\frac{n}{32\left(1+\sqrt{k-1}(1+\log M)\right)}\right). \tag{2}
\]
To see this, for $h\not\equiv0\bmod M$ the ordered difference identity gives
\[
 \left|\sum_{x\in C}e^{2\pi i h x/M}\right|^2
    = k+\sum_{y\ne0}e^{2\pi i h y/M}=k-1.
\]
For a cyclic interval $J$, the absolute value of its Fourier sum at $h\ne0$ is at most $1/|\sin(\pi h/M)|\le M/(2\min(h,M-h))$, by the geometric series and $\sin(\pi t)\ge 2t$ for $0\le t\le1/2$. Its sum over all nonzero $h$, divided by $M$, is at most $1+\log M$. Fourier inversion gives
\[
 |C\cap J|\le \frac{k|J|}{M}+\sqrt{k-1}(1+\log M).
\]
Since $M\ge k^2/2$ and $k\ge n$, apply (1) with $K=2$.

**Consequence.** If a family with $n\to\infty$ has $Q(A)$ bounded by an absolute constant, then along the family any cyclic perfect difference set extension satisfies
\[
 M\gg n^4/(\log n)^4,
\]
with an implied lower constant allowed to depend on the common bound for $Q$. Indeed (2) forces $\sqrt{k-1}(1+\log M)\gg n$. If $M\ge n^4$ there is nothing more to show; otherwise $1+\log M=O(\log n)$ and $k-1\le\sqrt M$ yields the requirement.

In particular a perfect difference set extension of order $M\le n^{4-\varepsilon}$ forces $Q(A)\gg_\varepsilon\log n$ for all sufficiently large $n$. If additionally $\operatorname{diam}(A)=O(n^2)$, the same Fourier estimate applied to all of $A$ shows that in this subquartic regime $M=O(n^2)$: a contrary subsequence $M/n^2\to\infty$ puts all $n$ points in a cyclic interval of length $O(n^2)$, whose Fourier upper bound is $O(n^2/\sqrt M)+O(M^{1/4}\log M)=o(n)$.

## Near-perfect cyclic sets

The same argument works for a cyclic Sidon set $C$ of size $k$, not necessarily perfect, if the number $R=M-1-k(k-1)$ of uncovered nonzero differences is small enough. Its nontrivial character sums have modulus at most $\sqrt{k-1+R}$, since their squares are $k-1$ minus a sum over the $R$ missing characters, in absolute magnitude at most $R$. Again $M\ge k^2/2$, and (1) applies with $E=\sqrt{k-1+R}(1+\log M)$.

In particular the standard cyclic relative difference set construction with $k=O(n)$ and $R=O(k)$, including Bose–Chowla and Ruzsa's cyclic construction, gives $Q(A)\gg\log n$ even after taking an arbitrary subset of size $n$ and choosing different integer representatives for each point. The cyclic parameters and constructions are discussed in [Eberhard–Manners, §§2–3](https://arxiv.org/abs/2107.05744). This is not a restriction on arbitrary integer Sidon sets and gives no existence theorem for superquartic extensions. The Fourier identities are standard; no claim of priority is made for them. A bounded literature search using the original gap paper, the 1996 follow-up of Ruzsa, the contemporary problem/claim inventories, and the perfect-difference-set extension literature found no previous statement of this exact gap/extension connection.
