# Bollobás–Erdős–Tuza maximal-independent-set conjecture

**Reduction.** Fix $c,\epsilon>0$ and put $a=c\epsilon$. Suppose an $n$-vertex graph $G$ has minimum maximal independent-set size $i(G)\ge cn$ and maximal-independent-set transversal number $\tau(G)\ge\epsilon n$. Then some induced subgraph $H$ has
```math
|H|\ge a^2n,\qquad i(H)\tau(H)\ge a|H|^2,
```
and both $H$ and its complement have no vertex separator of size at most $a^2|H|/16$ that leaves two nonempty components. Thus, at large orders, both connectivities are linear. This reduces the first assertion of [Erdős #611](https://www.erdosproblems.com/611) to graphs whose graph and complement both have linear connectivity. The reduction also holds inside any hereditary class.

A maximal independent set is inclusion-maximal, not necessarily of maximum cardinality. The reduction does not settle the conjecture for the resulting core.

## Proof

For any nonempty induced subgraph $F$ maximize the score
```math
\Phi(F)=\frac{i(F)\tau(F)}{|F|^{3/2}}.
```
Let $H$ be a maximizer, with $m=|H|$. Since $\Phi(H)\ge\Phi(G)\ge a\sqrt n$ and $\Phi(H)\le\sqrt m$, we have $m\ge a^2n$. Also $i(H)\tau(H)/m^2\ge a\sqrt{n/m}\ge a$, so each of $i(H)$ and $\tau(H)$ is at least $am$. In what follows put $i=i(H)$ and $\tau=\tau(H)$.

Let $S$ have size $s\le a^2 m/16$. The elementary deletion inequality is $i(H-S)\ge i-s$: any maximal independent set of $H-S$ extends to a maximal independent set of $H$ by adding only members of $S$.

* Suppose $H-S$ is disconnected. Its component minima sum to $i(H-S)$, so some component $C$ satisfies $i(C)/|C|\ge(i-s)/(m-s)\ge(i-s)/m$. For every component $D$, the set $S$ together with a transversal in $D$ hits every maximal independent set in $H$. Indeed, if such a set misses $S$, its restriction to $D$ is maximal in $D$. Hence $\tau(D)\ge\tau-s$ for every component. In particular $\tau(C)\ge\tau-s$, and a different component has size at least $\tau-s$.
* Suppose $\overline H-S$ is disconnected. Now $H-S$ is the join of the induced graphs on its complement-components, so its minimum maximal independent-set size is the minimum of those component minima. Thus every component block $D$ satisfies $i(D)\ge i-s$. The set $S$ together with transversals in all component blocks hits every maximal independent set in $H$, since one avoiding $S$ lies in one such block and is maximal there. Consequently the sum of component-block transversal numbers is at least $\tau-s$. Some block $C$ has $\tau(C)/|C|\ge(\tau-s)/(m-s)\ge(\tau-s)/m$. A different block has size at least $i-s$.

In either case we get
```math
i(C)\tau(C)\ \ge\ \frac{|C|}{m}(i-s)(\tau-s),
\qquad |C|\le (1-a+a^2/16)m.
```
It follows that
```math
\frac{\Phi(C)}{\Phi(H)}\ \ge
\ \frac{(1-a/16)^2}{\sqrt{1-a+a^2/16}}>1.
```
For the last inequality, the numerator is at least $1-a/8$, and the denominator is at most $1-(a-a^2/16)/2\le1-15a/32$ for $0<a\le1$. This contradicts maximality, completing the proof.

## Priority and limits

[Erdős, Gallai and Tuza, Problem 2](https://doi.org/10.1016/0012-365X(92)90681-5) and [Cooper and Hollars, Conjecture 1.1](https://arxiv.org/abs/2607.15486) are sources for the original target. [Bai, Chang and Yan](https://arxiv.org/abs/2608.18963) use a separator inequality for the distinct conjecture about **maximum** independent sets, and reduce it to high connectivity in the graph itself. Their cited result is not a reduction for minimal-size maximal sets and their transversals. Searches for the hollow formulation, the original citation, separator reductions and simultaneous complement connectivity did not locate this two-sided statement in the inspected literature. The two-sided score and the join/union argument retain the two parameters for maximal sets. Coordination: [#830](https://github.com/1337isnot1337/solved-conjectures/issues/830).
