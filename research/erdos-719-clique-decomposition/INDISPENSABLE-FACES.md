# Erdős–Sauer conjecture

**Partial result: exact covering when private neighborhoods are sufficiently spread.** Let $k=r+1\ge4$ and let $M$ be a maximum $(k-1)$-disjoint packing of a family of $k$-sets, in particular the clique family for [Erdős Problem 719](https://www.erdosproblems.com/719). If each member of $M$ has at least three indispensable faces, the whole family has a $(k-1)$-face cover of size at most $(k-1)|M|$. Here a face of $C\in M$ is indispensable when some set outside $M$ shares that face with $C$ and shares no face with any other member of $M$. This is an exact all-orders regime, not a claim for arbitrary packings.

This builds on the [multi-contact exchange lemma](MULTI-CONTACT.md) and the private-neighbor setup of [Basit–McGinnis–Simmons–Sinnwell–Zerbib](https://doi.org/10.37236/10829). It tracks the specific faces through which an outside set meets the packing.

## Face-sensitive exchange

Let $T$ share faces with exactly $t\ge2$ members of $M$. Suppose every contact is through an indispensable face, and each contacted member has at least two indispensable faces. Then **at least two** contacted members have exactly two indispensable faces.

Use $C_i=T-x_i+y_i$ as in the [previous note](MULTI-CONTACT.md), with the $x_i$ distinct in $T$ and the $y_i$ distinct outside $T$. The indispensable omissions $I_i$ in $C_i$ all have a common private replacement vertex $v_i$ by the same maximum-packing exchange argument. Since the actual contact face $T-x_i$ is indispensable, $y_i\in I_i$. Its private replacement cannot equal $T$. Hence $v_i\ne x_i$, so $v_i\notin T$. Consider choices $c_i\in I_i\setminus\{y_i\}$. There is at least one choice, and using it gives $P_i=C_i-c_i+v_i$ compatible with $T$.

The same analysis of outside pairs $\{y_i,v_i\}$ as in the previous note applies. Two equal outside pairs form a crossover with $v_i=y_j,v_j=y_i$ and require only that $c_i\ne c_j$. If there is at most one index with a singleton choice, that condition is always satisfiable on each disjoint crossover pair. Pairs with precisely one common outside vertex cause a conflict only for reciprocal choices within a group sharing a vertex $v$ outside $\{y_1,\ldots,y_t\}$.

In any such group draw the allowed arrows $x_i\to c_i$. Destinations outside the group are sinks. Every member has at least one arrow and at most one member has only one. Select arrows decreasing distance to an outside sink for all members that can reach one. In the induced digraph on the remaining members, a sink strongly connected component must contain a directed cycle of length at least three. Otherwise every arc inside it would have its reverse, since each arc in a strongly connected component lies on a directed cycle. The underlying graph would then be a tree with at least two leaves. Each leaf would have only one allowed outgoing arrow, contrary to the singleton-choice hypothesis. (A singleton sink component is impossible as no loops are allowed.) Choose a long cycle in each sink component and direct all other remaining choices toward these cycles along shortest paths. There is no reciprocal pair.

This gives mutually compatible private replacements $P_i$, each also compatible with $T$ and with unaffected packing members. The $t$ original members can be replaced by $t+1$ members, a contradiction. Thus if all those contacts are indispensable and no member has fewer than two indispensable faces, at least two have exactly two.

## Cover from the exchange

For a packing member $C$ with $s=|I_C|\ge3$, select every nonindispensable face of $C$. If $s<k$ this already covers $C$ itself. The $s$ private neighbors lie in the common $(k+1)$-set $C+v_C$, so pair them to cover them with at most $\lceil s/2\rceil$ more faces. The cost is $k-s+\lceil s/2\rceil\le k-1$. If $s=k$, pair $C$ itself together with its $k$ private neighbors, with cost at most $\lceil(k+1)/2\rceil\le k-1$.

If every member of $M$ has at least three indispensable faces, the face-sensitive exchange proves that every multi-contact set touches some nonindispensable face, and that face was selected. Every family member has at least one contact or lies in $M$, by maximality. This finishes the claim and therefore the exact decomposition bound in this regime.

More generally, one may take all $k$ faces of each member with $s\le2$. Multi-contact sets meeting any of them are then covered. The total cover cost is at most the sum over $M$ of the following local costs:
- $k$ when $s\le2$;
- $k-\lfloor s/2\rfloor$ when $3\le s<k$;
- $\lceil(k+1)/2\rceil$ when $s=k$.

Whenever the savings on the last two classes pay for the extra one per $s\le2$ member, this gives the exact coefficient $k-1$. The unresolved issue is the case of a maximum packing with too many members having at most two indispensable faces.
