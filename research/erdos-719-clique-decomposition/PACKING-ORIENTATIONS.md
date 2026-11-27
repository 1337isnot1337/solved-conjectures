# Erdős–Sauer conjecture

**Exact result for sparse or repeated-core packing interactions.** A maximum packing can be covered at the conjectured rate if its pairwise interaction graph admits an orientation charging at most $k-2$ distinct original faces to each packed $k$-set. This permits arbitrarily large face degrees and arbitrarily high degree in the packing graph, including all packing graphs of bounded pseudoarboricity in the range below.

Let $\mathcal F$ be a family of $k$-sets, $k=r+1\ge4$. Two sets conflict if they share a $(k-1)$-face. Fix a maximum packing $M$ of pairwise nonconflicting sets. A member outside $M$ has at least one contact with $M$ by maximality. Call it private if it contacts exactly one packed member.

## Interaction orientations

Use a graph $J$ on $M$ in which an edge $CD$ is allowed only if $|C\cap D|=k-2$. Require that every nonprivate member outside $M$ contacts both ends of at least one edge of $J$. The full intersection graph with edges at intersection size $k-2$ certainly works: a set contacting two packed members forces them to meet in at least $k-2$ and the packing forbids meeting in $k-1$. One can discard any interaction edges not actually needed for this requirement.

Orient $J$ arbitrarily. For each directed edge from $C$ to $D$, choose the two original faces of $C$ containing $C\cap D$. Let $m_C$ count the distinct faces selected at $C$, not the sum with repetitions. These faces cover every outside member that contacts both endpoints. Indeed, any such member contains $C\cap D$, as its two contact faces each have size $k-1$ and have intersection at least $k-2$ within it. Its contact with $C$ is therefore through one of the selected faces. This covers every nonprivate outside member.

It remains to cover each packed member and its still-uncovered private neighbours. At a given member $C$, the private neighbours conflict pairwise, since two mutually compatible ones could replace $C$ in the maximum packing. If their private contacts all use one original face, select it if needed. Otherwise, writing the neighbours as $C-x+y$, pairwise conflict forces the same external vertex $y$ at all distinct omissions $x$, and then each omission occurs only once. Thus the private neighbours lie in the same $(k+1)$-set as $C$, and any two can be covered by a single common face. There are at most $k-m_C$ private neighbours not yet selected in this second case, because only the $k-m_C$ unused contact faces can occur. If $m_C>0$ then the packed member itself was already covered. The final cost at $C$ is at most
\[
\begin{cases}
\lceil(k+1)/2\rceil,&m_C=0,\\
m_C+\lceil(k-m_C)/2\rceil,&m_C>0.
\end{cases}
\]
The second bound includes the single-contact case, even if that face accounts for many neighbours. If $m_C=0$, pair the whole top including $C$, or use the common face. This proves the quantitative orientation criterion by summing. If every $m_C\le k-2$, each cost is at most $k-1$.

## Broad sufficient conditions

- An orientation with outdegree at most $\lfloor(k-2)/2\rfloor$ works, since each directed edge costs at most two faces. Such an orientation exists whenever every nonempty induced subgraph on $S\subseteq M$ has at most $\lfloor(k-2)/2\rfloor |S|$ edges. For a short proof, match each interaction edge to a capacity slot at one of its endpoints by Hall's theorem. In particular forests and pseudoforests work at every $k\ge4$.
- An orientation need not bound outdegree if edges reuse faces. For example, if all interactions assigned to $C$ have the same $(k-2)$-core in $C$, they cost only two faces regardless of how many there are. The full interaction graph may thus be arbitrarily dense. This covers a packing of arbitrarily many $k$-sets sharing a fixed $(k-2)$-core, even though its interaction graph is complete.
- Write $E$ for the number of edges of $J$, $t$ for the number of its tree components (counting isolated vertices), and $\nu=|M|$. For odd $k$ the same local cost bound gives $\tau\le (k+1)\nu/2+E$. For even $k$, use an orientation with at most one outdegree-zero vertex per tree component and none in a cyclic component: direct a spanning tree toward a root in a tree, and direct a cycle with all remaining vertices toward it in a cyclic component. Additional edges may be oriented arbitrarily. The bound is then $\tau\le k\nu/2+E+t$. These average criteria require no maximum degree hypothesis.

This covers exact all-orders families of Erdős–Sauer instances, not the unrestricted conjecture. The matching interaction graph is different from the conflict graph on all members, and its sparsity is different from a bound on the number of members containing a face. [Parker's earlier work](https://doi.org/10.37236/13355) proves the stronger Aharoni–Zerbib inequality for packings of size at most three, and already uses splitting of disconnected packing interactions. The orientation here handles arbitrary packing sizes and assigns the two covering faces to just one endpoint. [Issue #72](https://github.com/1337isnot1337/solved-conjectures/issues/72) · [Bounded-face-degree theorem](BOUNDED-FACE-DEGREE.md).
