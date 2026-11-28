# Erdős–Sauer conjecture

**Partial result: multi-contact packing augmentation.** This is an exact structural restriction on a maximum packing, for all uniformities $r\ge3$ and all orders. It does not settle the conjecture.

Let $k=r+1\ge4$. Work with a family of $k$-sets and a maximum packing $M$, where two sets conflict if their intersection has size $k-1$. This includes the clique family in [Erdős Problem 719](https://www.erdosproblems.com/719). A private neighbor of $C\in M$ conflicts with $C$ and no other member of $M$. Write $I_C\subset C$ for the set of omissions $c$ such that some private neighbor is $C-c+v$ for $v\notin C$.

**Lemma.** If a set $T\notin M$ conflicts with exactly $t\ge2$ members of $M$, then at least one of them satisfies
```math
|I_C|\le\max\{2,k-t\}.
```
In particular, no multi-contact set can meet only members with $k-1$ or more indispensable faces. At the other end, a set meeting $k-2$ or more members must meet one with at most two indispensable faces. This extends the pair-contact restriction in [Basit–McGinnis–Simmons–Sinnwell–Zerbib, Corollary 16](https://doi.org/10.37236/10829).

## Proof

Write the affected packing members as $C_i=T-x_i+y_i$, $i=1,\dots,t$, with distinct $x_i\in T$ and distinct $y_i\notin T$. The omissions must be distinct since otherwise two packing members share $T-x_i$. The additions must be distinct since otherwise two members share $`(T-\{x_i,x_j\})+y_i`$.

Suppose all affected sets have $`|I_{C_i}|\ge\max\{3,k-t+1\}`$. For any fixed $i$, two private neighbors cannot be compatible, since they could then replace $C_i$ in the maximum packing. If their omissions in $C_i$ differ, compatibility is avoided only when their outside added vertices coincide. Since at least two omissions occur, this forces a common outside vertex $v_i$ for all private neighbors of $C_i$: compare each private neighbor with a witness for a different omission. Its available replacements are therefore exactly $C_i-c+v_i$ for $c\in I_{C_i}$.

One cannot have $v_i=x_i$. Under that assumption $c=y_i$ gives $T$, which is not private, and each $c=x_j$ for $j\ne i$ gives a set conflicting with $C_j$. These are $t$ different forbidden omissions, leaving at most $k-t$ choices. Thus $v_i\notin T$. Set
```math
J_i=I_{C_i}\setminus\{y_i\};
```
this is a subset of $`T\setminus\{x_i\}`$ of size at least two. For $c_i\in J_i$ the replacement $P_i=C_i-c_i+v_i$ contains exactly $k-2$ vertices of $T$, hence is compatible with $T$.

It remains to choose the $c_i$ so that the replacements are mutually compatible. Let $`Y=\{y_1,\ldots,y_t\}`$. The parts of $P_i$ inside and outside $T$ are $`T\setminus\{x_i,c_i\}`$ and $`\{y_i,v_i\}`$, respectively.

- If two outside parts are disjoint, the replacements are already compatible.
- If two outside parts share exactly one vertex, their replacements can conflict only if $c_i=x_j$ and $c_j=x_i$. If any shared vertex is one of the $y$'s, say $v_i=y_j$, then $x_j\notin I_{C_i}$ by privacy: swapping $x_j$ would leave $`T\setminus\{x_i,x_j\}`$ together with $y_j$, a face of $C_j$. Hence a reciprocal omission can matter only when $v_i=v_j$ is outside $Y$.
- If two outside parts coincide, then $v_i=y_j$ and $v_j=y_i$. The reciprocal omissions are forbidden separately by privacy. The only possible conflict is $c_i=c_j$, because the two missing pairs in $T$ then have union of size three rather than four. Such crossover pairs are disjoint as pairs of indices, and their two choices can be made distinct from one another since each allowed set has size at least two.

It remains to deal with each group sharing a common $v_i$ outside $Y$. In that group draw an arrow from $x_i$ to every element of $J_i$, treating destinations outside the group as sinks. Each group member has at least two allowed arrows. We can choose one arrow from each without a directed 2-cycle. For every vertex that can reach an outside sink, choose an arrow decreasing distance to a sink. In the remaining induced digraph each vertex has out-degree at least two. Every sink strongly connected component of this digraph contains a directed cycle of length at least three: for a longest simple directed path inside that component, the final vertex has at least two distinct out-neighbors on the path, so one is not its immediate predecessor. Fix one such cycle per sink component. Use its cyclic arrows, and from all other vertices take an arrow decreasing distance to this collection of cycles. No reciprocal arrow can occur.

Thus all chosen $P_i$ are pairwise compatible. Each is private and therefore compatible also with every unaffected member of $M$. Replacing the $t$ affected sets by the $t$ sets $P_i$ and adding $T$ contradicts maximal cardinality. This proves the lemma.

## One exact covering consequence

Call a packing member rich if it has at least $k-1$ indispensable faces, and poor otherwise. Every multi-contact set meets a poor member by the lemma, so taking all $k$ faces of each poor member covers every such set and all its private neighbors. For each rich member $C$, its private neighbors and $C$ itself lie in the $(k+1)$-set $C+v_C$. Every pair of them has a shared face, so pairing them and using at most one singleton face covers this cluster at cost at most $\lceil(k+1)/2\rceil$.

Writing $p,h$ for the numbers of poor and rich members of a maximum matching, the cover number is at most
```math
kp+\left\lceil\frac{k+1}{2}\right\rceil h.
```
This proves the exact coefficient $k-1$ throughout the regime
```math
p\le \big(k-1-\lceil(k+1)/2\rceil\big)h.
```
The remaining issue is how to save faces on the poor members in the opposite regime. In particular, the lemma does not show that a maximum matching with a favorable ratio must exist.
